# mimir-distill Skill — Requirements & Design Notes

> Notes for building the mimir-distill skill. All data thresholds MET.
> **Last updated:** 2026-03-03

## What the Skill Does

`/mimir-distill` is a Claude Code skill that:
1. Runs dis-mimir rounds (our SQL vs Mimir's answers)
2. Collects SQL correction pairs (training data for DA improvement)
3. Identifies Mimir behavior patterns (bugs, column name errors, filter omissions)
4. Updates lt-memory/ with hardened query patterns
5. Builds calibrated trust scores per domain

## Data Collected (ALL THRESHOLDS MET)

| Data Type | Target | Current | Status |
|-----------|--------|---------|--------|
| SQL correction pairs | 20+ | **38** | DONE |
| Domains tested | 6+ | **6** (Paylater, VN, TTT, InsurTech, CLO, Moni) | DONE |
| Mimir behavior patterns | 10+ | **20** | DONE |
| Question categories tested | 4+ | **5** (simple, MoM, ranking, daily, revenue) | DONE |
| CEO questions tested | 5+ | **5** | DONE |

## Skill Structure (Draft)

```
mimir-distill/
├── SKILL.md                    ← Trigger + workflow instructions
├── references/
│   ├── mimir-api.md            ← Mimir question/answer API reference
│   ├── domain-corrections.md   ← Known Mimir mistakes per domain (from 38 pairs)
│   ├── question-templates.md   ← Proven Vietnamese question formats
│   └── trust-calibration.md    ← Per-domain trust scores + known bugs
└── scripts/
    └── poll-mimir.sh           ← Helper to send question + poll answer
```

## Key Design Decisions

1. **Bias prevention:** Always execute our SQL BEFORE sending to Mimir. Never let Mimir's answer influence our query.
2. **Verdict system:** MATCH (<1%), CLOSE (1-5%), MISMATCH (>5%), ERROR (query failed), SKIP (no data)
3. **Persistence:** Write findings to `docs/mimir/distill/sql-corrections/batch-N.md` after each batch. Never rely on conversation history.
4. **Recovery:** On compaction, read `docs/mimir/distill/_index.md` to recover full state.
5. **6 metrics per round** — good balance of coverage vs speed.

## Source Data Location

All raw data for building the skill lives in:
- `docs/mimir/distill/sql-corrections/batch-*.md` — 38 SQL correction pairs
- `docs/mimir/distill/summary.md` — cumulative accuracy and bug catalog
- `lt-memory/errors/sql-gotchas.md` — 20 lessons in actionable format
- `lt-memory/domains/*.md` — domain metadata (tables, columns, types)
- `docs/ref/mimir-api.md` — API reference
- `docs/ref/mimir-question-templates.md` — question templates
- `docs/ref/mimir-sql-patterns.md` — SQL patterns

## The Context Compaction Problem

The main reason this skill exists: running dis-mimir fills context, auto-compact loses knowledge. The skill must:
- Read `distill/_index.md` at start (recover state)
- Write findings to `distill/` after each round (persist before compact)
- Never rely on conversation history for accumulated knowledge
- Use progressive disclosure: load only what's needed per round
