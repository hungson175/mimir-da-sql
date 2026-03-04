# Knowledge: Expense Management (Growth Platform)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-04
> Source: migrated from domains/growth-platform-expense-management-notes.md

## Domain Identity
- **Domain ID:** `af241589-f5be-4b97-8928-fe0823c8dc75`
- Same ID as Moni (QLCT) — covers BOTH QLCT (expense mgmt) AND Moni (chatbot)
- Mimir trust: UNVERIFIED (BQ quota blocked first test)

## Standard Queries

### QLCT MAU
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS qlct_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH = '2026-01-01' AND PRODUCT = 'QLCT' AND ACTION = 'VISIT'
```
Note: Mimir omits ACTION='VISIT' but result is same (QLCT has no CHAT).

### Total Spending
```sql
SELECT SUM(AMOUNT) AS total_amount_vnd, SUM(TRANS) AS total_transactions,
  COUNT(DISTINCT AGENT_ID) AS unique_users_with_spend
FROM `momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER`
WHERE DATE_MONTH = '2026-01-01'
```

### Moni Chatbot MAU
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH = '2026-01-01' AND PRODUCT = 'MONI' AND ACTION = 'CHAT'
```

## Notes
- QLCT tracks ALL user spending on MoMo (categorized). 62T = total labeled transactions, not revenue.
- 2.83M users = large feature
- USER_TYPE in SEMANTIC_QLCT_VISIT: NEW | RETAIN | REACTIVE
- BQ project: `momovn-prod.MBI_DA` — accessible
