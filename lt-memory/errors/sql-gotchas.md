# SQL Gotchas

## BigQuery Reserved Words

`GROUPS` is a reserved keyword in BigQuery. Use `user_groups`, `grp`, or `user_grp` instead.

## SEMANTIC_QLCT_VISIT AGE_GROUP Format

The actual values are:
```
UNKNOWN
[1]. <18 y/o
[2]. 18 - 22 y/o
[3]. 23 - 26 y/o
[4]. 27 - 30 y/o
[5]. 31 - 35 y/o
[6]. 36 - 40 y/o
[7]. >40 y/o
```

Use exact string match (`= '[2]. 18 - 22 y/o'`), not LIKE patterns. The ranges are 23-26 and 27-30 (not 23-25, 26-30 as you might guess).

## PAYLATER_MAU_SEGMENT Is 1-Row-Per-User-Per-Month

Each user has exactly 1 row per `month_trans`. The `usecase` column is the user's primary usecase for that month, NOT per-transaction. You cannot count "distinct usecases per user" from this table — it will always be 1. For transaction-level data, use `PAYLATER_ALL_TRANS` instead.

## TTT mart_ttt_daily_user_record: Always Filter by MAU_TYPE or MFU_TYPE

The table stores ALL users including churned accounts. Without filtering, `COUNT(DISTINCT USER_ID)` returns ~11M (total accounts ever), not actual active users.

| Metric | Filter | Jan 2026 (snapshot) | Jan 2026 (full month) | Feb 2026 (full month) |
|--------|--------|---------------------|----------------------|----------------------|
| Total accounts | None | 11.1M | — | — |
| MFU (funded users) | `MFU_TYPE != '0.Churn'` | 1.67M | — | — |
| MAU (active users) | `MAU_TYPE != '0.Churn'` | 720K (single day) | 3.46M (Individual 3.0M + Money Pool 463K) | 3.45M (Individual 3.01M + Money Pool 434K) |

**⚠ The 720K figure was from a single-day snapshot.** Full-month scan returns ~3.4M MAU. Always use full-month range for accurate MAU.

**Always specify which metric you mean.** "TTT users" is ambiguous — use "TTT MAU" or "TTT MFU" or "TTT total accounts."

### Correct MAU Query Pattern

Use **full month date range** (not just end-of-month snapshot), `REGEXP_EXTRACT` for USER_ID dedup, and group by `IS_MP`:

```sql
SELECT
    t1.IS_MP,
    COUNT(DISTINCT (CAST(REGEXP_EXTRACT(t1.USER_ID, r'\d+') AS STRING))) AS unique_mau_users
FROM
    momovn-prod.BU_FI.mart_ttt_daily_user_record AS t1
WHERE
    t1.GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND t1.MAU_TYPE != '0.Churn'
GROUP BY
    t1.IS_MP
```

**Key mistakes to avoid:**
- Do NOT use single end-of-month snapshot (`GRASS_DATE = '2026-01-31'`) — scan the entire month
- Do NOT use raw `USER_ID` — always `REGEXP_EXTRACT(USER_ID, r'\d+')` for proper dedup
- Group by `IS_MP` to separate Individual vs Money Pool accounts

## SQL Operator Precedence: Always Parenthesize OR Clauses

`WHERE A AND B OR C` evaluates as `(A AND B) OR C`, NOT `A AND (B OR C)`.

**Wrong:**
```sql
WHERE IS_MP = 'Individual' AND MOD(EXTRACT(DAY FROM GRASS_DATE), 30) = 0 OR EXTRACT(DAY FROM GRASS_DATE) = 1
```
This applies `IS_MP` only to the first condition; day=1 rows get no IS_MP filter.

**Correct:**
```sql
WHERE IS_MP = 'Individual' AND (MOD(EXTRACT(DAY FROM GRASS_DATE), 30) = 0 OR EXTRACT(DAY FROM GRASS_DATE) = 1)
```

## Deduplication Pattern for Demographics Join

`SEMANTIC_QLCT_VISIT` has multiple rows per user (one per day/product/action). Deduplicate with:
```sql
ROW_NUMBER() OVER (PARTITION BY AGENT_ID ORDER BY MONTH DESC, DATE DESC) AS rn
-- then filter WHERE rn = 1
```
Filter `MONTH >= '2025-09-01'` (last ~3 months) to keep scan cost down while ensuring coverage.
