# Long-Term Memory Index

> Auto-maintained catalog. The DA updates this file after every learning event.
> Bootstrapped from mimir-da domain knowledge on 2026-02-25.

## Domain Master List
- **Full catalog:** `domains/_all.md` — 65 domains (last verified 2026-03-03)
- **Domains with metadata files:** 65 (all refreshed from Mimir API on 2026-03-03)
- **Domains probed (via mimir-da):** 37 (33 successful, 4 with issues)
- **Domains with SQL patterns:** 2 (Paylater, Vay Nhanh)

## Domains
| Domain | File | Known Tables/Columns | SQL Probe Status | Last Updated |
|--------|------|---------------------|-----------------|--------------|
| (Inherited from mimir-da — domain files contain metadata. SQL patterns to be built.) | | | | |

## Patterns
| Date | File | What it does |
|------|------|--------------|
| 2026-02-25 | `patterns/cross-sell-conversion.md` | Paylater → Vay Nhanh sequential conversion (within-month + lifetime) |

## Session Stats (2026-03-03 — Batch 15-17)
| Metric | Value |
|--------|-------|
| Total BQ queries run | ~140+ |
| Total Mimir interactions | ~20 comparisons |
| Lessons accumulated | 56 (in sql-gotchas.md) |
| Domains tested | 13 (7 FS + 6 Non-FS) |
| Mimir trust: HIGH | Paylater, InsurTech, Chatbot Moni, Moni |
| Mimir trust: MEDIUM | TTT, VN, CLO, Billpay |
| Mimir trust: LOW | P2P Revenue (600M× wrong on W2W) |
| Mimir trust: MIMIR-ONLY | Airtime, DLS, Check Scam, Report Scam, Media AD |
| Skill built | `~/.claude/skills/mimir-distill/` — SKILL.md + refs + scripts |

## Errors
| Date | File | Lesson |
|------|------|--------|
| 2026-02-25 | `errors/bigquery-access-map.md` | Which BQ datasets are accessible vs blocked, with fallback strategies |
| 2026-02-25 | `errors/sql-gotchas.md` | Reserved words, AGE_GROUP format, PAYLATER_MAU_SEGMENT is 1-row-per-user-month |
| 2026-02-28 | `errors/bigquery-access-map.md` | Updated: BU_ECOM and project-5400504384186300846.REPORT are inaccessible. TTT mart stores ~2 years only |
| 2026-03-02 | `errors/sql-gotchas.md` | TTT MAU_TYPE/MFU_TYPE filter required (11M total vs 720K MAU vs 1.67M MFU). SQL OR precedence trap. |
| 2026-03-03 | `errors/mimir-insurtech-status.md` | InsurTech CC_STATUS: metadata says 'Thành Công' but data stores 'SUCCESS'. Mimir gets 0 results. |
| 2026-03-03 | `errors/sql-gotchas.md` | 56 lessons: P2P W2W=free, VietQR MDR rising, InsurTech seasonal, DPD tables, BQ access map, Money Pool cohorts, VN 3x undercount, SEMANTIC ETL lag, + more |

## Meta
| Topic | File | Summary |
|-------|------|---------|
| Mimir behavior | `meta/mimir-behavior.md` | 19 queries tested. Trust: Paylater+Chatbot+Moni+VN+CLO=high, InsurTech=inconsistent CC_STATUS. Feb-29 date bug confirmed. |
