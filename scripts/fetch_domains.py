#!/usr/bin/env python3
"""
Fetch all Mimir domain metadata and refresh lt-memory/domains/.

Flow:
  1. Read cached domain list from lt-memory/_raw_api/_domains_list.json
  2. Fetch metadata for each domain via Mimir API
  3. Save raw JSON to lt-memory/_raw_api/
  4. Convert to Markdown via json_to_md.py logic
  5. Print summary of what changed

Usage:
    python3 scripts/fetch_domains.py                    # fetch all 65 domains
    python3 scripts/fetch_domains.py --only-new          # only fetch domains without cached JSON
    python3 scripts/fetch_domains.py --domain-id UUID    # fetch single domain
"""

import json
import os
import re
import sys
import time
import argparse
import subprocess
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent
RAW_DIR = PROJECT_ROOT / "lt-memory" / "_raw_api"
DOMAINS_DIR = PROJECT_ROOT / "lt-memory" / "domains"
DOMAIN_LIST = RAW_DIR / "_domains_list.json"

MIMIR_BASE = "https://s.mservice.io/mimir-server-to-server"
METADATA_URL = f"{MIMIR_BASE}/v1/domain/metadata"


def load_domain_list() -> list:
    if not DOMAIN_LIST.exists():
        print(f"ERROR: Domain list not found at {DOMAIN_LIST}")
        sys.exit(1)
    with open(DOMAIN_LIST) as f:
        domains = json.load(f)
    print(f"Loaded {len(domains)} domains from cached list")
    return domains


def slugify(name: str) -> str:
    name = name.lower().strip()
    name = re.sub(r'^bu\s+', 'bu-', name)
    name = re.sub(r'[:\s]+', '-', name)
    name = re.sub(r'[^a-z0-9\-]', '', name)
    name = re.sub(r'-+', '-', name).strip('-')
    return name


def fetch_metadata(domain_id: str) -> dict:
    import urllib.request
    url = f"{METADATA_URL}?domain_id={domain_id}"
    req = urllib.request.Request(url)
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            return json.loads(resp.read().decode())
    except Exception as e:
        return {"error": str(e)}


def get_existing_raw_files() -> dict:
    """Map domain_id -> raw JSON file path for existing cached files."""
    mapping = {}
    for f in RAW_DIR.glob("*.json"):
        if f.name.startswith("_"):
            continue
        try:
            with open(f) as fh:
                raw = json.load(fh)
            data = raw.get("data", raw) if isinstance(raw, dict) else {}
            if isinstance(data, dict) and data.get("id"):
                mapping[data["id"]] = f
        except Exception:
            pass
    return mapping


def main():
    parser = argparse.ArgumentParser(description="Fetch Mimir domain metadata")
    parser.add_argument("--only-new", action="store_true", help="Only fetch domains without cached JSON")
    parser.add_argument("--domain-id", type=str, help="Fetch single domain by ID")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be fetched without fetching")
    args = parser.parse_args()

    domains = load_domain_list()
    existing = get_existing_raw_files()

    # Filter domains
    if args.domain_id:
        domains = [d for d in domains if d["id"] == args.domain_id]
        if not domains:
            print(f"ERROR: Domain ID {args.domain_id} not found in list")
            sys.exit(1)
    elif args.only_new:
        domains = [d for d in domains if d["id"] not in existing]
        print(f"  {len(domains)} domains missing cached metadata")

    if not domains:
        print("Nothing to fetch.")
        return

    if args.dry_run:
        print(f"\nWould fetch {len(domains)} domains:")
        for d in domains:
            cached = "cached" if d["id"] in existing else "NEW"
            print(f"  [{cached}] {d['name']} ({d['id'][:8]}...)")
        return

    print(f"\nFetching metadata for {len(domains)} domains...\n")

    ok, errors = 0, []
    for i, domain in enumerate(domains, 1):
        name = domain["name"]
        domain_id = domain["id"]
        slug = slugify(name)
        print(f"  [{i}/{len(domains)}] {name}...", end=" ", flush=True)

        result = fetch_metadata(domain_id)

        if "error" in result:
            print(f"ERROR: {result['error']}")
            errors.append(name)
            continue

        # Save raw JSON
        out_path = RAW_DIR / f"{slug}.json"
        with open(out_path, "w") as f:
            json.dump(result, f, indent=2, ensure_ascii=False)

        # Quick stats
        data = result.get("data", {}) if isinstance(result, dict) else {}
        tables_str = data.get("schema_ddl", "") if isinstance(data, dict) else ""
        table_count = tables_str.count("Table") if tables_str else 0
        mem_count = len(data.get("memory", [])) if isinstance(data, dict) else 0
        print(f"OK (~{table_count} tables, {mem_count} mem)")

        ok += 1
        if i < len(domains):
            time.sleep(0.5)  # rate limit

    print(f"\n--- Done: {ok} OK, {len(errors)} errors ---")
    if errors:
        print(f"Errors: {errors}")

    # Convert to markdown
    if ok > 0:
        print("\nConverting to Markdown...")
        subprocess.run(
            [sys.executable, str(PROJECT_ROOT / "scripts" / "json_to_md.py")],
            cwd=str(PROJECT_ROOT),
        )
        print("Done. Check lt-memory/domains/ for updated files.")


if __name__ == "__main__":
    main()
