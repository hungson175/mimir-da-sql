# SQL Corrections — Batch 5: Revenue MoM (Dec 2025 vs Jan 2026)

> CEO Question: "Doanh thu các mảng FS tháng 1/2026 so với tháng 12/2025?"

## Q16: InsurTech Revenue — MATCH
- Dec: 3.289B | Jan: 4.134B (+26% MoM)
- Both use `TRANS_DATE`, `CC_STATUS='SUCCESS'`, `SUM(FINAL_REV)`
- **Nothing new to learn.**

## Q17: CLO Revenue — MATCH
- Dec: 4.833B | Jan: 4.848B (+0.3% MoM)
- Both use `DATE_REQUESTED`, `SERVICE_TYPE='CLO'`, `SUM(REVENUE)`
- **Nothing new to learn.**

## Q18: TTT Interest — MATCH + MINOR LESSON
- Dec Individual: 32.34B, Money Pool: 4.91B
- Jan Individual: 32.66B, Money Pool: 5.28B (+1.9% MoM total)
- Mimir did NOT filter MFU_TYPE for SUM(interest). Same result as our filtered query.
- **Learning:** For SUM aggregations (interest, balance), churn filter is redundant — churned accounts contribute 0. Filter only matters for COUNT metrics.

**Mimir SQL (no churn filter):**
```sql
SELECT
    DATE_TRUNC(GRASS_DATE, MONTH) AS month,
    IS_MP,
    SUM(INTEREST) AS total_interest
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE BETWEEN '2025-12-01' AND '2026-01-31'
GROUP BY 1, 2
ORDER BY 1, 2
```

## Q19: Paylater GMV — MISMATCH (3x difference!) + CRITICAL LESSON

| | Ours | Mimir |
|---|------|-------|
| Dec trans | 26.47M | **12.49M** |
| Dec GMV | 7.15T | **2.37T** |
| Jan trans | 27.10M | **12.80M** |
| Jan GMV | 7.34T | **2.45T** |

**Root cause:** We counted ALL rows. Mimir filters for successful Paylater payment transactions:
- `result_code = 0` (success only)
- `trans_type IN ('pay_pl', 'pay_ins', 'send_pl')` (payment types only)

**Mimir's correct SQL:**
```sql
SELECT
    FORMAT_DATE('%Y-%m', created_date) AS transaction_month,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_gmv
FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
WHERE created_date BETWEEN '2025-12-01' AND '2026-01-31'
    AND result_code = 0
    AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')
GROUP BY transaction_month
ORDER BY transaction_month
```

**Learning:**
1. `PAYLATER_ALL_TRANS` contains failed transactions — always filter `result_code = 0`
2. Table contains non-payment trans_types — filter `trans_type IN ('pay_pl', 'pay_ins', 'send_pl')` for GMV
3. Without these filters, you get ~3x inflated numbers

**Known trans_types (need to verify full list):**
- `pay_pl` — direct Paylater payment
- `pay_ins` — installment payment
- `send_pl` — send via Paylater

## Q20: Vay Nhanh Disbursement — MATCH
- Dec: 3.129T | Jan: 3.108T (-0.6% MoM)
- Both use `DISBURSED_DATE` range + `SUM(DISBURSED_AMOUNT)`, no STATUS filter
- **Nothing new to learn.**

---

## Summary

| # | Domain | Verdict | Key Learning |
|---|--------|---------|-------------|
| Q16 | InsurTech | MATCH | — |
| Q17 | CLO | MATCH | — |
| Q18 | TTT | MATCH | Churn filter redundant for SUM aggregations |
| Q19 | Paylater | **MISMATCH** | Must filter `result_code=0` AND `trans_type IN (...)` |
| Q20 | Vay Nhanh | MATCH | — |

**Score: 4/5 match, 1 mismatch (Paylater GMV)**
**New lessons: 2 (TTT SUM churn, Paylater transaction filters)**
**Running total: 26 queries, 26 SQL pairs, 13 lessons**

## Domain ID Fix

Previous batches used truncated domain IDs. Correct full IDs:
| Domain | Correct Domain ID |
|--------|------------------|
| Paylater | `7e23d41a-0baf-4b36-84c3-07fb850bdb6e` |
| InsurTech | `800bf3e8-a8ba-45c3-90d8-5f54bdaba156` |
| FI Solutions | `5cd09ae2-90b8-4102-a717-0ae6f649ff69` |
| Vay Nhanh | `bb231763-b11c-45c6-9b0d-eb6d24588e3d` |
| TTT | `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11` (was already correct) |
