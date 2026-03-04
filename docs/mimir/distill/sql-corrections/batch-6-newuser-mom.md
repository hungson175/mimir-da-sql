# SQL Corrections — Batch 6: New User Growth (Dec 2025 vs Jan 2026)

> CEO Question: "User mới các sản phẩm FS tháng 1/2026 so với tháng 12/2025?"

## Q22: Vay Nhanh New/Reloan — MATCH
- All 4 numbers exact match (First loan + Re-loan, Dec + Jan)
- Both use `CREATED_DATE` + `PROCESS_TYPE` + `COUNT(LOAN_ID)`
- **Nothing new to learn.**

## Q23: TTT MFU Segments — CLOSE + LESSONS

**Difference 1: Mimir groups by IS_MP (we didn't)**
Mimir provided Individual + Money Pool breakdown per segment. Richer output.

**Difference 2: Mimir uses raw `COUNT(DISTINCT user_id)` without REGEXP_EXTRACT**
Our query: `COUNT(DISTINCT CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING))`
Mimir: `COUNT(DISTINCT user_id)`

This causes different totals because REGEXP_EXTRACT deduplicates across IS_MP categories (same numeric ID appears in both Individual and Money Pool contexts).

**Mimir's approach gives HIGHER numbers per segment because it counts each IS_MP variant separately.** For per-segment analysis with IS_MP grouping, raw user_id is correct. For total unique humans, REGEXP_EXTRACT is needed.

**Difference 3: Filter style**
- Ours: `MFU_TYPE != '0.Churn'` (exclusion)
- Mimir: `mfu_type IN ('1.New', '2.Retain', '3.Reactive')` (explicit inclusion)
- Functionally equivalent.

**Mimir SQL:**
```sql
SELECT
    DATE_TRUNC(grass_date, MONTH) AS month,
    mfu_type,
    is_mp,
    COUNT(DISTINCT user_id) AS mfu_users
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE grass_date BETWEEN '2025-12-01' AND '2026-01-31'
    AND mfu_type IN ('1.New', '2.Retain', '3.Reactive')
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3
```

**Learning:**
1. When grouping by IS_MP, use raw `user_id` (not REGEXP_EXTRACT) — each IS_MP context is distinct
2. REGEXP_EXTRACT only needed when counting total unique humans across IS_MP categories
3. Mimir always includes IS_MP breakdown for TTT queries — more useful for business analysis

## Q24: Paylater Segments — MATCH
- All 6 numbers exact match (New/Retain/Reactive, Dec + Jan)
- Both use `month_trans IN (...)` + `GROUP BY MAU_segment`
- Mimir added trend commentary (New -4.2%, Retain +2.5%, Reactive -4.1%)
- **Nothing new to learn.**

## Q25: InsurTech Unique Buyers — SKIP + LESSON

Mimir used a **completely different table and status column:**
- Our table: `att_fi_ins_nl_ver2` with `CC_STATUS = 'SUCCESS'`
- Mimir table: `INS_COL_ALL_TRANS` with `STATUSID = 2`
- Mimir column for user: `DEBITOR` (same as ours, but Mimir then hesitated and asked for clarification)

**Learning:**
1. InsurTech has multiple tables: `att_fi_ins_nl_ver2` AND `INS_COL_ALL_TRANS`
2. Status encoding differs: `CC_STATUS='SUCCESS'` vs `STATUSID=2`
3. `debitor` column exists in `att_fi_ins_nl_ver2` and works for unique buyer counts
4. Mimir is less confident on InsurTech — asked for clarification instead of answering

---

## Summary

| # | Domain | Verdict | Key Learning |
|---|--------|---------|-------------|
| Q22 | Vay Nhanh | MATCH | — |
| Q23 | TTT | CLOSE | REGEXP_EXTRACT vs raw user_id depends on IS_MP grouping context |
| Q24 | Paylater | MATCH | — |
| Q25 | InsurTech | SKIP | Alternative table `INS_COL_ALL_TRANS` with `STATUSID=2` |

**Score: 3/4 match/close, 1 skip**
**New lessons: 2 (TTT user_id dedup context, InsurTech alternative table)**
**Running total: 30 queries, 30 SQL pairs, 15 lessons**
