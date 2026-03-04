# Knowledge: Moni / QLCT (Expense Management)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-04

## SQL Gotchas

### SEMANTIC_QLCT_VISIT AGE_GROUP Format (2026-02-25)
Actual values:
```
UNKNOWN, [1]. <18 y/o, [2]. 18 - 22 y/o, [3]. 23 - 26 y/o,
[4]. 27 - 30 y/o, [5]. 31 - 35 y/o, [6]. 36 - 40 y/o, [7]. >40 y/o
```
Use exact string match (`= '[2]. 18 - 22 y/o'`), not LIKE patterns.
Ranges: 23-26 and 27-30 (not 23-25, 26-30).

### Moni MAU: Must Filter PRODUCT='MONI' AND ACTION='CHAT' (2026-03-02)
| PRODUCT | ACTION | What | Feb 2026 |
|---------|--------|------|----------|
| QLCT | VISIT | Expense tracking visitors | 1,668,009 |
| MONI | VISIT | Saw Moni, didn't chat | 91,536 |
| MONI | CHAT | Actually chatted | 66,498 |

Without filter → get 1.69M (all QLCT visitors), NOT Moni MAU.
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE PRODUCT = 'MONI' AND ACTION = 'CHAT' AND MONTH = '2026-02-01'
```

### SEMANTIC_QLCT_VISIT: Data Freshness — Always Check Max DATE (2026-03-03)
ETL lag confirmed. Feb 2026: only data through Feb 6. Feb 7-28 = NO DATA.
Always verify `SELECT MAX(DATE)` before trusting current month aggregates.
Feb Moni MAU appears 66K (-77% vs Jan 290K) = NOT real. Only 6 days of data.

### PRODUCT + ACTION Filter Required (2026-03-03)
- QLCT MAU: `PRODUCT = 'QLCT'` (ACTION='VISIT' optional — QLCT has no CHAT)
- Moni MAU: `PRODUCT = 'MONI' AND ACTION = 'CHAT'`
- Moni MEU: count users with `PRODUCT = 'MONI'` (includes VISIT+CHAT)

## Business Insights

### Key Tables (from growth-platform-expense-management-notes)
| Table | Use | Key Columns |
|-------|-----|-------------|
| `SEMANTIC_QLCT_VISIT` | MAU | AGENT_ID, MONTH, PRODUCT, ACTION |
| `QLCT_L4_TRANSHIS_USER` | Spending | AGENT_ID, DATE_MONTH, CATEGORY, AMOUNT |
| `QLCT_L4_USER_PROFILE_MONTHLY` | Profiles | agent_id, etl_month |
| `HAI_QLCT_FEATURE_BUDGET_RAW` | Budget | agent_id, dt |

### Jan 2026 Numbers (Mimir, unverified)
- QLCT MAU: 2,833,017 users
- Total spending tracked: 62.07T VND
- CATEGORY values: Hóa đơn, Giải trí, Ăn uống, etc.

## Mimir Trust
- QLCT MAU: UNVERIFIED (BQ quota blocked test)
- Overall: UNVERIFIED
