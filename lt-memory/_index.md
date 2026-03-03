# Long-Term Memory Index

> Auto-maintained catalog. The DA updates this file after every learning event.
> Bootstrapped from mimir-da domain knowledge on 2026-02-25.

## Domain Master List
- **Full catalog:** `domains/_all.md` — 65 domains (last verified 2026-02-25)
- **Domains with metadata files:** 66 (including new Data Loss Prevention)
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

## Errors
| Date | File | Lesson |
|------|------|--------|
| 2026-02-25 | `errors/bigquery-access-map.md` | Which BQ datasets are accessible vs blocked, with fallback strategies |
| 2026-02-25 | `errors/sql-gotchas.md` | Reserved words, AGE_GROUP format, PAYLATER_MAU_SEGMENT is 1-row-per-user-month |
| 2026-02-28 | `errors/bigquery-access-map.md` | Updated: BU_ECOM and project-5400504384186300846.REPORT are inaccessible. TTT mart stores ~2 years only |
| 2026-03-02 | `errors/sql-gotchas.md` | TTT MAU_TYPE/MFU_TYPE filter required (11M total vs 720K MAU vs 1.67M MFU). SQL OR precedence trap. |

## Meta
| Topic | File | Summary |
|-------|------|---------|
| (No meta notes yet) | | |
