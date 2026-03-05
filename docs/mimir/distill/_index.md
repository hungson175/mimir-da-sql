# Mimir Distill — Working Memory

> **READ THIS FIRST** every time you resume work on mimir-distill.
> This file is the progressive disclosure root. Load deeper files only as needed.
>
> **Purpose:** Collect structured data from Mimir interactions so we can eventually
> build a `mimir-distill` skill that auto-improves the DA agent.

## What This Directory Is

Persistent storage for the mimir-distill process. Survives context compaction.
When context gets auto-compacted, reload this file to recover state.

## Directory Layout

```
distill/
├── _index.md              ← YOU ARE HERE (always load first)
├── observations/           ← Raw Mimir behavior observations per round
│   └── round-1.md         ← dis-mimir Round 1 findings (2026-03-03)
├── sql-corrections/        ← Mimir SQL vs correct SQL pairs (training data)
│   ├── round-1.md         ← 6 SQL correction pairs from Round 1
│   ├── batch-2-jan2026.md ← 9 pairs (SMALL, Jan 2026)
│   ├── batch-3-medium-jan2026.md ← 4 pairs (MEDIUM, Jan 2026)
│   ├── batch-4-large-jan2026.md  ← 2 pairs (LARGE, TTT AUM + breakdown)
│   ├── batch-5-revenue-mom.md    ← 5 pairs (Revenue MoM Dec vs Jan, all FS domains)
│   ├── batch-6-newuser-mom.md    ← 4 pairs (New user growth Dec vs Jan)
│   ├── batch-7-top-contributors.md ← 4 pairs (Top partners/products by revenue)
│   ├── batch-8-daily-trends.md     ← 4 pairs (Daily time-series Jan 2026)
│   ├── batch-9-h1-fs-yoy.md       ← 8 pairs (H1: FS YoY 2024 vs 2025, Phase 5)
│   ├── batch-10-h2-health.md      ← 6 pairs (H2: Product health + retention, Phase 5)
│   ├── batch-11-h4-tet.md         ← 3 pairs (H4: Tet impact daily trends, Phase 5)
│   ├── batch-12-h5-arpu.md        ← 3 pairs (H5: ARPU per product, Phase 5)
│   ├── batch-13-h7-churn.md       ← 2 pairs (H7: Churn & retention, Phase 5)
│   └── batch-14-h6-unit-economics.md ← 2 pairs (H6: Unit economics, Phase 5)
├── skill-notes/            ← Notes for building the mimir-distill skill
│   └── requirements.md    ← What the skill needs to do, constraints, ideas
└── summary.md              ← Cumulative summary of all findings (updated each round)
```

## Quick Stats

| Metric | Value |
|--------|-------|
| Rounds completed | 18 (R1 Feb + B2-B8 Jan + B9-B14 Phase 5 + B15-B17 Deep-dive + R18 DA-skill validation) |
| Total metrics tested | ~143 (133 + 10 in R18) |
| Overall Mimir accuracy | ~75% (6/8 MATCH in R18. TTT AUM bug FIXED. InsurTech CC_STATUS now reliable.) |
| SQL correction pairs collected | ~143 |
| Domains tested | 12 (FS: Paylater, VN, TTT, InsurTech, CLO, Moni/Chatbot; Non-FS: P2P, Billpay, Airtime, DLS, CheckScam, ReportScam) |
| Lessons learned | 69+ total |
| CEO questions tested | 11+ |
| Last updated | 2026-03-06 (Round 18) |

## Skill Package (BUILT — Batch 17)

Location: `~/.claude/skills/mimir-distill/`
- `SKILL.md` — trigger + workflow
- `references/trust-calibration.md` — all domain trust levels + bugs
- `references/domain-corrections.md` — 56 lessons condensed
- `scripts/poll-mimir.sh` — polling helper

## Critical Bugs (load into every round)

1. **Feb 29 in non-leap years** — Mimir generates `'YYYY-02-29'` for ALL years. Crashes in 2025/2026/2027. Affects any domain queried for February.
2. **InsurTech CC_STATUS metadata lie** — Metadata says 'Thành Công' (Vietnamese), data stores 'SUCCESS' (English). Mimir gets 0 results.
3. **TTT AUM: Mimir sums across all days** — Gets ~30x inflated AUM. Must use end-of-month snapshot.
4. **CLO: Mimir uses DATE_MODIFIED** — Wrong for revenue attribution. Correct column is DATE_REQUESTED.

## Trust Calibration (updated 2026-03-06, Round 18)

| Trust | Domains | Condition |
|-------|---------|-----------|
| High | Paylater MAU, TTT MAU, TTT AUM, InsurTech, Moni, Chatbot Moni | All exact match Feb 2026. TTT AUM bug FIXED. InsurTech CC_STATUS now reliable. |
| High | Vay Nhanh (amount) | Disbursement amount exact match. Count still 3x undercount. |
| Low | FI Solutions (CLO) | Persistently uses DATE_MODIFIED instead of DATE_REQUESTED. 5.6% deviation. |
| Low | P2P Revenue | Filters service='W2W' (free transfers) → returns ~0. Bug persists since Batch 17. |

## What to Do Next

- [x] ~~Round 2: Test same 6 metrics for Jan 2026~~ → Done (Batch 2)
- [x] ~~Round 3: Test MEDIUM metrics (GROUP BY)~~ → Done (Batch 3)
- [x] ~~Round 4: Test LARGE queries (TTT AUM)~~ → Done (Batch 4)
- [x] ~~Collect 20+ SQL correction pairs~~ → 46 pairs collected!
- [x] ~~H1: FS YoY 2024 vs 2025~~ → Done (Batch 9, 8 sub-queries)
- [x] ~~H2: Product health + retention~~ → Done (Batch 10, 6 sub-queries)
- [x] ~~H4: Tet impact daily trends~~ → Done (Batch 11, 3 sub-queries)
- [x] ~~H5: ARPU per product~~ → Done (Batch 12, 3 sub-queries, VN STATUS lesson!)
- [x] ~~H7: Churn & retention~~ → Done (Batch 13, 2 sub-queries, TTT MAU_TYPE vs MFU_TYPE)
- [x] ~~H6: Unit economics~~ → Done (Batch 14, 2 sub-queries, TTT `interest` column)
- [ ] H3 (skip — Mimir is single-domain, will fail), H8 (forecast — likely fail)
- [ ] Test non-FS domains (P2P revenue, Notification, Promotion)
- [ ] Build the `mimir-distill` skill (threshold met: 46 pairs, 26 lessons)
