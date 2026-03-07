# Knowledge: QLCT / Moni (Expense Management)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-06

## SQL Gotchas

### AGE_GROUP Format: Must Use Exact String with Prefix (2026-03-06)
`AGE_GROUP = '[4]. 27 - 30 y/o'` — Mimir gets this RIGHT (confirmed D8).
Full format: `'[N]. XX - YY y/o'` where N = bucket number.
Tables with AGE_GROUP:
- `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` — visit-level, has AGE, AGE_GROUP, GENDER, REGION
- `momovn-prod.TEAM_PRODUCT_OPTS.QLCT_L4_USER_PROFILE_MONTHLY` — Mimir's preferred table (not accessible to us)

### Table Discrepancy: 26% Gap Between SEMANTIC_QLCT_VISIT and QLCT_L4 (2026-03-06)
For '[4]. 27 - 30 y/o' Jan 2026:
- BQ (`SEMANTIC_QLCT_VISIT` WHERE MONTH='2026-01-01'): **387,985 users**
- Mimir (`QLCT_L4_USER_PROFILE_MONTHLY` WHERE etl_month='2026-01-01'): **286,113 users**
- Gap: 26% — different tables, different user definitions
QLCT_L4 table is in `momovn-prod.TEAM_PRODUCT_OPTS` dataset which we cannot access.
VERDICT for D8: CLOSE (26% gap, table mismatch, NOT a query logic error)

### SEMANTIC_QLCT_VISIT: Dedup Required (2026-03-03)
Has multiple rows per user per month. For distinct user count:
- Use `MONTH = 'YYYY-MM-01'` filter + `COUNT(DISTINCT AGENT_ID)` — this correctly deduplicates.
- Do NOT use `COUNT(*)` — overcounts visits, not users.

### QLCT Mimir Domain: Correct on AGE_GROUP Format (2026-03-06)
Domain `af241589` correctly generates `age_group = '[4]. 27 - 30 y/o'`.
Simple user-count queries work. Complex analytical queries may timeout.

## Business Insights

### Jan 2026: Age 27-30 = 388K QLCT Users (2026-03-06)
387,985 users in SEMANTIC_QLCT_VISIT for '[4]. 27 - 30 y/o' age group in Jan 2026.
This is the core Moni target demographic (young urban earners).

## Mimir Trust
- AGE_GROUP string format: HIGH (exact format used correctly)
- User count: CLOSE (26% gap vs BQ — different source table)
- Simple queries: HIGH
