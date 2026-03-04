# Distill Team — Workflow

<context>
A 2-role team where PO (persona: Nguyen Manh Tuong, MoMo CEO) asks business questions about MoMo's data, and DA runs the Mimir Distill workflow: write SQL, compare with Mimir, extract lessons, improve domain knowledge.
</context>

---

## Team Purpose

**Goal**: Continuously improve the DA agent's SQL accuracy by stress-testing Mimir's answers against our direct BigQuery queries.

Every round:
1. PO asks a business question (CEO-level, specific metric, or cross-domain)
2. DA runs our SQL first (bias prevention), then asks Mimir the same question in Vietnamese
3. DA compares results, verdicts: MATCH / CLOSE / MISMATCH / ERROR / TIMEOUT
4. On mismatch: debug who's wrong, extract the lesson
5. Lessons flow into `lt-memory/` → DA gets smarter over time

---

## Roles

| Role | Pane | Purpose |
|------|------|---------|
| PO | 0 | Asks business questions as Tuong (MoMo CEO). Manages BACKLOG, tracks progress, pushes for depth. |
| DA | 1 | Runs Mimir Distill workflow. Writes SQL, calls Mimir API, compares, reports, extracts lessons. |

---

## Communication Protocol

```bash
# PO → DA
tm-send DA "PO -> DA: What is Paylater MAU for Feb 2026? Run it. Report back."

# DA → PO
tm-send PO "DA -> PO: Paylater MAU Feb 2026. BQ: 1,396,599. Mimir: 1,396,599. MATCH ✅"
```

**Rules:**
- All messages via `tm-send`
- DA reports after EVERY query with both numbers + verdict
- PO responds immediately with acceptance or follow-up question
- No silent periods > 15 min

---

## Standard Task Flow

```
PO → DA: Business question
   ↓
DA: Read sql-gotchas.md (RECALL)
DA: Write + run our SQL (BIAS PREVENTION)
DA: Send question to Mimir in Vietnamese, poll answer
DA: Compare → verdict
DA: Debug if MISMATCH, extract lesson
DA → PO: Both numbers + verdict + lesson (if any)
   ↓
PO: Accept or ask follow-up
PO: Add to backlog if more variants needed
```

---

## Session Files

```
distill-team/
├── workflow.md              ← This file
├── WHITEBOARD.md            ← Current status (PO maintains)
├── BACKLOG.md               ← Questions to test (PO owns)
├── setup-team.sh            ← Start the session
├── po/
│   └── NOTES.md            ← PO's notes
└── prompts/
    ├── PO_PROMPT.md        ← Tuong persona + PO instructions
    └── DA_PROMPT.md        ← Mimir Distill workflow instructions
```

**Distill outputs live in:**
- `lt-memory/errors/sql-gotchas.md` — accumulated lessons
- `docs/mimir/distill/sql-corrections/batch-N.md` — raw correction pairs
- `docs/mimir/distill/_index.md` — master index

---

## Escalation

| Situation | Action |
|-----------|--------|
| Mimir API 401 | DA tells PO immediately — infra issue, escalate |
| BQ access denied | DA reports blocked table, PO notes in BACKLOG |
| Mimir timeout (>2 min) | Verdict = TIMEOUT, move to next question |
| Unknown table/column | DA queries INFORMATION_SCHEMA first |
| DA silent >15 min | PO demands status update |

---

## Anti-Patterns

- ❌ DA looks at Mimir's answer before writing own SQL (anchoring bias)
- ❌ DA reports just one number without the other
- ❌ PO accepts answer without asking "what did we learn?"
- ❌ DA moves to next question without saving lessons
- ❌ DA goes silent when blocked
