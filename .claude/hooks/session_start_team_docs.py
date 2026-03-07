#!/usr/bin/env python3
"""
SessionStart hook — injects team workflow + role prompt into agent context.
Supports: distill-team, momo-board
"""
import json
import os
import subprocess
import sys

PROJECT_ROOT = os.environ.get("CLAUDE_PROJECT_DIR", os.getcwd())

TEAM_CONFIGS = {
    "distill-team": {
        "docs_dir": os.path.join(PROJECT_ROOT, "docs/tmux/distill-team"),
        "roles": {"PO", "DA"},
    },
    "momo-board": {
        "docs_dir": os.path.join(PROJECT_ROOT, "docs/tmux/momo-board"),
        "roles": {"CEO", "CMO", "CFO", "PRESIDENT"},
    },
}


def get_tmux_role():
    """Get role from @role_name option on THIS pane (via $TMUX_PANE)."""
    tmux_pane = os.environ.get("TMUX_PANE")
    if not tmux_pane:
        return None
    try:
        result = subprocess.run(
            ["tmux", "show-options", "-pt", tmux_pane, "-qv", "@role_name"],
            capture_output=True, text=True, timeout=5
        )
        if result.returncode == 0:
            return result.stdout.strip()
    except (subprocess.SubprocessError, FileNotFoundError):
        pass
    return None


def get_tmux_session():
    """Get current tmux session name."""
    try:
        result = subprocess.run(
            ["tmux", "display-message", "-p", "#S"],
            capture_output=True, text=True, timeout=5
        )
        if result.returncode == 0:
            return result.stdout.strip()
    except (subprocess.SubprocessError, FileNotFoundError):
        pass
    return None


def read_file(path):
    try:
        with open(path, "r", encoding="utf-8") as f:
            return f.read()
    except (FileNotFoundError, IOError):
        return None


def main():
    try:
        json.load(sys.stdin)
    except json.JSONDecodeError:
        sys.exit(0)

    session = get_tmux_session()
    if session not in TEAM_CONFIGS:
        sys.exit(0)

    config = TEAM_CONFIGS[session]
    docs_dir = config["docs_dir"]
    valid_roles = config["roles"]

    role = get_tmux_role()
    if not role or role not in valid_roles:
        sys.exit(0)

    parts = []

    workflow = read_file(os.path.join(docs_dir, "workflow.md"))
    if workflow:
        parts.append(f"=== TEAM WORKFLOW ===\n\n{workflow}")

    prompt = read_file(os.path.join(docs_dir, "prompts", f"{role}_PROMPT.md"))
    if prompt:
        parts.append(f"=== YOUR ROLE: {role} ===\n\n{prompt}")

    if parts:
        output = {
            "hookSpecificOutput": {
                "hookEventName": "SessionStart",
                "additionalContext": "\n\n" + "\n\n".join(parts)
            }
        }
        print(json.dumps(output))

    sys.exit(0)


if __name__ == "__main__":
    main()
