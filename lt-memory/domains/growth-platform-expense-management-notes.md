# QLCT (Quản Lý Chi Tiêu) — Growth Platform Expense Management

**Domain ID:** `af241589-f5be-4b97-8928-fe0823c8dc75`
**Same ID as:** Moni (QLCT) — this domain covers BOTH QLCT (expense mgmt) AND Moni (chatbot)
**Mimir trust:** UNVERIFIED (BQ quota blocked first test, 2026-03-04)

## Key Tables

| Table | Use | Key Columns |
|-------|-----|-------------|
| `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` | User count / MAU | AGENT_ID, MONTH (DATE), PRODUCT ('QLCT'\|'MONI'), ACTION ('VISIT'\|'CHAT') |
| `momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER` | Spending amount | AGENT_ID, DATE_MONTH (DATE), CATEGORY, TRANS (count), AMOUNT (VND) |
| `momovn-prod.MBI_DA.QLCT_L4_USER_PROFILE_MONTHLY` | User profile | agent_id, etl_month, year, n2qlct_date (first visit date) |
| `momovn-prod.MBI_DA.HAI_QLCT_FEATURE_BUDGET_RAW` | Budget feature | agent_id, dt, create_date, create_month |
| `momovn-prod.MBI_DA.QLCT_EVENT_TRACKING_VER2` | Events | (schema not yet extracted) |
| `momovn-prod.TEAM_PRODUCT_OPTS.QLCT_L4_USER_PROFILE_MONTHLY` | Alt user profile | (same as MBI_DA version?) |

## Standard Queries

### QLCT MAU (users using expense mgmt feature)
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS qlct_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH = '2026-01-01'
  AND PRODUCT = 'QLCT'
  AND ACTION = 'VISIT'
```
Note: Mimir omits `ACTION='VISIT'` but result is same (QLCT product has no CHAT actions).

### Total spending tracked in QLCT
```sql
SELECT
  SUM(AMOUNT) AS total_amount_vnd,
  SUM(TRANS) AS total_transactions,
  COUNT(DISTINCT AGENT_ID) AS unique_users_with_spend
FROM `momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER`
WHERE DATE_MONTH = '2026-01-01'
```

### Moni chatbot MAU (different product, same domain)
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH = '2026-01-01'
  AND PRODUCT = 'MONI'
  AND ACTION = 'CHAT'
```

## Jan 2026 Numbers (Mimir, unverified)

| Metric | Value |
|--------|-------|
| QLCT MAU (users) | **2,833,017** |
| Total spending tracked | **62.07T VND** (~$2.5B USD) |
| Avg spending per user | ~21.9M VND/user/month |

## Notes
- QLCT tracks ALL user spending on MoMo (categorized). The 62T figure = total labeled transactions, not unique revenue.
- 2.83M users = large feature (bigger than TTT MAU of 3M funded users, same order of magnitude)
- CATEGORY values: Hóa đơn (bills), Giải trí (entertainment), Ăn uống (F&B), etc.
- USER_TYPE in SEMANTIC_QLCT_VISIT: NEW | RETAIN | REACTIVE
- BQ project: `momovn-prod.MBI_DA` — accessible (no quota issues for this dataset specifically)

## Distill History
| Date | Q | BQ | Mimir | Verdict |
|------|---|----|----|---------|
| 2026-03-04 | QLCT MAU + total spend Jan 2026 | BLOCKED (daily quota) | 2.83M users, 62.07T VND | BQ-UNVERIFIABLE |
