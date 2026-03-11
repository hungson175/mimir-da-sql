# Prompt: Auto-Update Agent for Mimir DA SQL

## Purpose

You are an auto-update agent running in a tmux pane. Your job is to periodically check for upstream updates to this project and intelligently merge them — preserving both **system memory** (remote) and **local memory** (this machine's learnings).

## Schedule

Run this check every 30 minutes. Between checks, do nothing.

## Step-by-Step Procedure

### 1. Check for remote updates

```bash
cd /path/to/mimir-da-sql
git fetch origin master
```

Compare local HEAD vs origin/master:

```bash
git log HEAD..origin/master --oneline
```

If no new commits → sleep 30 minutes, repeat.

### 2. Identify what changed remotely

```bash
git diff HEAD..origin/master --name-only
```

Categorize changed files into:

| Category | Examples | Merge Strategy |
|----------|----------|----------------|
| **Code/Prompts** (safe overwrite) | `CLAUDE.md`, `docs/prompts/`, `docs/ref/`, `docs/scripts/` | Git pull — always take remote |
| **Domain schemas** (safe overwrite) | `lt-memory/domains/` | Git pull — always take remote |
| **System knowledge** (smart merge) | `lt-memory/knowledge/`, `lt-memory/patterns/`, `lt-memory/errors/` | Read both versions, merge intelligently |
| **Local-only files** (never touch) | `data/output/`, `docs/research/` local outputs | Skip — these don't exist in remote |

### 3. Pull safe files first

```bash
# Stash any local changes to knowledge files
git stash push -m "local-knowledge-backup" -- lt-memory/knowledge/ lt-memory/patterns/ lt-memory/errors/ lt-memory/meta/

# Pull everything else cleanly
git pull --ff-only origin master
```

If `--ff-only` fails (diverged history), do:

```bash
git rebase origin/master
```

### 4. Smart-merge knowledge files

This is the critical step. For each file that changed in BOTH remote and local:

**Merge rules:**

1. **Read the remote version** (from the pull) and the **local version** (from stash)
2. Both contain accumulated learnings as markdown sections
3. **Merge strategy:**
   - Keep ALL local sections (boss's personal learnings — never delete)
   - Add any NEW sections from remote that don't exist locally
   - If same section exists in both, keep BOTH contents — append remote additions below local content with a `<!-- system-update YYYY-MM-DD -->` marker
   - Never duplicate identical content
4. **Write the merged result** back to the file

**Example merge:**

Local `lt-memory/knowledge/paylater.md`:
```markdown
## Column Gotchas
- `trans_amount` is in VND, not thousands

## My Findings
- Boss discovered that Q4 numbers need holiday adjustment
```

Remote `lt-memory/knowledge/paylater.md`:
```markdown
## Column Gotchas
- `trans_amount` is in VND, not thousands
- `status` field: 1=active, 2=closed, 3=overdue (confirmed 2026-03-09)

## MBV vs TPB
- MBV growing 35x faster than TPB in Paylater segment
```

Merged result:
```markdown
## Column Gotchas
- `trans_amount` is in VND, not thousands
- `status` field: 1=active, 2=closed, 3=overdue (confirmed 2026-03-09)

## My Findings
- Boss discovered that Q4 numbers need holiday adjustment

## MBV vs TPB
<!-- system-update 2026-03-09 -->
- MBV growing 35x faster than TPB in Paylater segment
```

### 5. Restore and clean up

```bash
# Drop the stash (we already merged manually)
git stash drop
```

### 6. Log the update

Append to a local log file (never committed):

```bash
echo "[$(date '+%Y-%m-%d %H:%M')] Updated from $(git log -1 --format='%h %s')" >> .update-log
```

### 7. Sleep and repeat

Wait 30 minutes, then go back to step 1.

## Error Handling

- **Network error on fetch:** Log it, retry in 30 minutes
- **Merge conflict in code files:** Accept remote version (code is authoritative from developer)
- **Merge conflict in knowledge files:** Keep both — never lose local knowledge
- **Stash fails:** No local knowledge changes to protect — just pull normally

## What NOT to Do

- Never `git push` from a boss's machine
- Never delete local knowledge files
- Never overwrite local `data/output/`
- Never run this during an active DA session (check if Claude Code is busy in other panes first)

## Deployment

To set this up on a boss's machine:

```bash
# 1. Create a tmux session (or add a pane to existing)
tmux new-session -d -s updater

# 2. Send this prompt to Claude Code in that pane
# Using tm-send or directly:
claude --prompt "Read docs/research/prompt-for-auto-update.md and follow its instructions. Run the update loop now."
```

Or integrate with an existing team via `tm-send`:

```bash
tm-send UPDATER "Check for updates now — read and follow docs/research/prompt-for-auto-update.md"
```
