#!/usr/bin/env python3
"""
Convert Mimir domain API JSON responses to readable Markdown files.

Usage:
    python3 json_to_md.py [--src DIR] [--dst DIR]

Defaults (relative to project root):
    src: lt-memory/mimir_domain_api_response/
    dst: lt-memory/mimir_domain_api_response_md/

Handles all known schema_ddl formats:
  - Format A: table_columns array
  - Format B: column_desc array
  - Format C: nested schema_ddl string
  - Format D: raw CREATE TABLE SQL
  - Format E: empty / header only
"""

import json
import os
import re
import ast
import argparse
import glob
from pathlib import Path


def parse_table_blocks(schema_ddl: str) -> list:
    if not schema_ddl or not schema_ddl.strip():
        return []

    tables = []
    # Bug 1 fix: handle both "## Table information :" and "## Table <name> has information :"
    raw_blocks = re.split(r'##\s*Table[^{#]*?information\s*:', schema_ddl)

    for block in raw_blocks[1:]:
        block = block.strip()
        if not block:
            continue
        table = parse_table_block(block)
        if table:
            tables.append(table)

    if not tables and 'CREATE TABLE' in schema_ddl:
        tables = parse_create_table_format(schema_ddl)

    return tables


def parse_table_block(block: str) -> dict:
    json_str = extract_leading_json(block)
    if not json_str:
        return None

    obj = None
    try:
        obj = json.loads(json_str)
    except json.JSONDecodeError:
        try:
            obj = ast.literal_eval(json_str)
        except Exception:
            return None

    if obj is None:
        return None

    # Format C: nested schema_ddl string (may also carry smart_top_value)
    smart_top_value = None
    if 'schema_ddl' in obj and isinstance(obj['schema_ddl'], str):
        smart_top_value = obj.get('smart_top_value')
        inner = obj['schema_ddl']
        try:
            obj = json.loads(inner)
        except json.JSONDecodeError:
            try:
                obj = ast.literal_eval(inner)
            except Exception:
                pass

    result = normalize_table_obj(obj)
    # Bug 3 fix: attach smart_top_value so renderer can include it
    if smart_top_value:
        result['smart_top_value'] = smart_top_value
    return result


def normalize_table_obj(obj: dict) -> dict:
    name = obj.get('table_name', obj.get('name', ''))
    desc = obj.get('table_desc', obj.get('table_description', obj.get('description', '')))
    raw_cols = obj.get('table_columns', obj.get('column_desc', []))
    columns = []
    for col in (raw_cols or []):
        if not isinstance(col, dict):
            continue
        col_name = col.get('column_name', col.get('name', ''))
        col_type = col.get('data_type', col.get('type', col.get('mode', '')))
        col_desc = col.get('description', '')
        children = col.get('structs', col.get('children', []))
        example = col.get('example_data', [])
        columns.append({
            'name': col_name,
            'type': col_type,
            'description': col_desc,
            'children': children or [],
            'example': example or [],
        })
    return {'name': name, 'description': desc, 'columns': columns}


def extract_leading_json(text: str) -> str:
    text = text.strip()
    if not text or text[0] not in ('{', '['):
        return None
    depth = 0
    in_string = False
    escape = False
    start_char = text[0]
    end_char = '}' if start_char == '{' else ']'
    for i, ch in enumerate(text):
        if escape:
            escape = False
            continue
        if ch == '\\' and in_string:
            escape = True
            continue
        if ch == '"' and not escape:
            in_string = not in_string
            continue
        if in_string:
            continue
        if ch == start_char:
            depth += 1
        elif ch == end_char:
            depth -= 1
            if depth == 0:
                return text[:i+1]
    return None


def parse_create_table_format(schema_ddl: str) -> list:
    tables = []
    parts = re.split(r'CREATE TABLE\s+', schema_ddl, flags=re.IGNORECASE)
    for part in parts[1:]:
        name_match = re.match(r'`?([^`\s(]+)`?\s*\(', part)
        if not name_match:
            continue
        table_name = name_match.group(1)
        paren_content = re.search(r'\((.+?)\)\s*;', part, re.DOTALL)
        if not paren_content:
            paren_content = re.search(r'\((.+)', part, re.DOTALL)
        columns = []
        if paren_content:
            col_text = paren_content.group(1)
            for line in col_text.splitlines():
                line = line.strip().rstrip(',')
                if not line or line.startswith(')') or line.startswith('#'):
                    continue
                col_match = re.match(r'(\w+)\s+--\s+(\w+),?\s*--?\s*(.*)', line)
                if col_match:
                    columns.append({'name': col_match.group(1), 'type': col_match.group(2),
                                    'description': col_match.group(3).strip(), 'children': [], 'example': []})
                else:
                    col_match2 = re.match(r'(\w+)\s+(\w+),?\s*(?:--\s*(.*))?', line)
                    if col_match2:
                        columns.append({'name': col_match2.group(1), 'type': col_match2.group(2),
                                        'description': (col_match2.group(3) or '').strip(), 'children': [], 'example': []})
        tables.append({'name': table_name, 'description': '', 'columns': columns})
    return tables


def _render_children(children: list, lines: list, depth: int) -> None:
    """Recursively render nested struct children into table rows."""
    indent = '&nbsp;&nbsp;' * depth + '↳ '
    for child in children:
        if not isinstance(child, dict):
            continue
        ch_name = child.get('column_name', child.get('name', ''))
        ch_type = child.get('data_type', child.get('type', ''))
        ch_desc = (child.get('description') or '').replace('\n', ' ').replace('|', '\\|').strip()
        ch_ex = child.get('example_data', [])
        ex_str = ', '.join(str(e) for e in ch_ex[:3]) if ch_ex else '—'
        lines.append(f"| {indent}`{ch_name}` | {ch_type} | {ch_desc} | {ex_str} |")
        grandchildren = child.get('structs', child.get('children', []))
        if grandchildren:
            _render_children(grandchildren, lines, depth + 1)


def render_markdown(raw: dict) -> str:
    # Handle both raw API wrapper and plain data dict
    if 'error_code' in raw:
        data = raw.get('data', {})
    else:
        data = raw.get('data', raw)

    if not isinstance(data, dict):
        data = {}

    name = data.get('name', 'Unknown Domain')
    domain_id = data.get('id', '')
    description = (data.get('description') or '').strip()
    instructions = (data.get('instructions') or '').strip()
    schema_ddl = data.get('schema_ddl', '')
    memory_entries = data.get('memory') or []
    knowledgebase = data.get('knowledgebase') or []

    lines = []

    lines.append(f"# {name}")
    lines.append(f"\n**Domain ID:** `{domain_id}`")
    lines.append("")

    if description:
        lines.append("## Description")
        lines.append(description)
        lines.append("")

    if instructions:
        lines.append("## Instructions")
        lines.append(instructions)
        lines.append("")

    tables = parse_table_blocks(schema_ddl)

    if tables:
        lines.append("## Tables")
        lines.append("")
        for t in tables:
            lines.append(f"### `{t['name']}`")
            if t['description']:
                lines.append(f"> {t['description']}")
                lines.append("")
            cols = t['columns']
            if cols:
                lines.append("| Column | Type | Description | Example |")
                lines.append("|--------|------|-------------|---------|")
                for col in cols:
                    cname = col['name'] or '—'
                    ctype = col['type'] or '—'
                    cdesc = (col['description'] or '—').replace('\n', ' ').replace('|', '\\|').strip()
                    ex = ', '.join(str(e) for e in col['example'][:3]) if col['example'] else '—'
                    lines.append(f"| `{cname}` | {ctype} | {cdesc} | {ex} |")
                    # Bug 2 fix: recursively render nested structs
                    _render_children(col['children'] or [], lines, depth=1)
            else:
                lines.append("*(no columns parsed)*")
            # Bug 3 fix: render smart_top_value distinct-value annotations
            if t.get('smart_top_value'):
                lines.append("**Distinct values:**")
                lines.append("```")
                lines.append(t['smart_top_value'].strip())
                lines.append("```")
            lines.append("")
    elif schema_ddl and schema_ddl.strip():
        lines.append("## Schema DDL (raw)")
        lines.append("```")
        lines.append(schema_ddl.strip())
        lines.append("```")
        lines.append("")
    else:
        lines.append("## Tables")
        lines.append("*(no schema available)*")
        lines.append("")

    if memory_entries:
        lines.append("## Memory")
        lines.append(f"*{len(memory_entries)} entries — user-trained knowledge*")
        lines.append("")
        for i, entry in enumerate(memory_entries, 1):
            mem_text = (entry.get('memory') or '').strip()
            created = (entry.get('created_at') or '')[:10]
            user = ((entry.get('metadata') or {}).get('user_name') or '')
            meta_parts = [p for p in [user, created] if p]
            meta_str = f" _{' · '.join(meta_parts)}_" if meta_parts else ''
            lines.append(f"{i}. {mem_text}{meta_str}")
        lines.append("")

    if knowledgebase:
        lines.append("## Knowledgebase")
        for entry in knowledgebase:
            lines.append(f"- {entry}")
        lines.append("")

    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--src", default=None)
    parser.add_argument("--dst", default=None)
    args = parser.parse_args()

    script_dir = Path(__file__).parent
    project_root = script_dir.parent

    src = Path(args.src) if args.src else project_root / "lt-memory/_raw_api"
    dst = Path(args.dst) if args.dst else project_root / "lt-memory/domains"
    dst.mkdir(parents=True, exist_ok=True)

    json_files = sorted([f for f in src.glob("*.json") if not f.name.startswith("_")])
    print(f"Converting {len(json_files)} files from {src} -> {dst}")
    print()

    ok, errors = 0, []
    for fpath in json_files:
        try:
            with open(fpath) as f:
                raw = json.load(f)

            md = render_markdown(raw)
            out_path = dst / (fpath.stem + ".md")
            with open(out_path, "w") as f:
                f.write(md)

            if 'error_code' in raw:
                data = raw.get('data', {})
            else:
                data = raw.get('data', raw)
            tables = parse_table_blocks(data.get('schema_ddl', '') if isinstance(data, dict) else '')
            mem_count = len((data.get('memory') or []) if isinstance(data, dict) else [])
            print(f"  OK | {len(tables):2d} tables | {mem_count:3d} mem | {fpath.name}")
            ok += 1
        except Exception as e:
            import traceback
            print(f"  ERR | {fpath.name}: {e}")
            traceback.print_exc()
            errors.append(fpath.name)

    print(f"\nDone: {ok} OK, {len(errors)} errors")
    if errors:
        print("Errors:", errors)


if __name__ == "__main__":
    main()
