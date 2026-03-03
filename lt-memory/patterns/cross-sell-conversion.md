# Cross-Sell / Conversion Analysis Patterns

> Proven SQL patterns for analyzing user flow between products.

## Paylater → Vay Nhanh Sequential Conversion (within a month)

**Use case:** How many users used Paylater first, then took Vay Nhanh afterwards?

**Key insight:** `PAYLATER_MAU_SEGMENT` has both `month_trans` (monthly DATE) and `trans_time` (DATETIME with exact timestamps). Use `trans_time` for sequential ordering within the same month.

```sql
WITH paylater_first_dec AS (
  SELECT
    agent_id,
    MIN(trans_time) AS first_pl_time
  FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
  WHERE month_trans = '2025-12-01'
  GROUP BY agent_id
),
vaynhanh_dec AS (
  SELECT
    AGENT_ID,
    MIN(DISBURSED_DATE) AS first_vn_date
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE DISBURSED_DATE >= '2025-12-01' AND DISBURSED_DATE < '2026-01-01'
    AND STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')
  GROUP BY AGENT_ID
)
SELECT
  COUNT(*) AS paylater_then_vaynhanh,
  ROUND(AVG(DATE_DIFF(v.first_vn_date, DATE(p.first_pl_time), DAY)), 1) AS avg_days_gap
FROM paylater_first_dec p
JOIN vaynhanh_dec v ON p.agent_id = v.AGENT_ID
WHERE DATE(p.first_pl_time) < v.first_vn_date
```

**Dec 2025 result:** 60,742 users (40.9% of Vay Nhanh borrowers), avg 12.4 days gap.

## Paylater → Vay Nhanh Lifetime Conversion

**Use case:** All-time funnel — users whose first-ever Paylater usage preceded their first-ever Vay Nhanh loan.

```sql
WITH paylater_first AS (
  SELECT agent_id, MIN(month_trans) AS first_pl_month
  FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
  GROUP BY agent_id
),
vaynhanh_first AS (
  SELECT AGENT_ID, MIN(DISBURSED_DATE) AS first_vn_date
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')
  GROUP BY AGENT_ID
)
SELECT
  COUNT(*) AS paylater_then_vaynhanh,
  ROUND(AVG(DATE_DIFF(v.first_vn_date, p.first_pl_month, DAY)) / 30, 1) AS avg_months_gap,
  COUNTIF(DATE_DIFF(v.first_vn_date, p.first_pl_month, DAY) <= 30) AS within_1_month,
  COUNTIF(DATE_DIFF(v.first_vn_date, p.first_pl_month, DAY) BETWEEN 31 AND 90) AS within_1_3_months,
  COUNTIF(DATE_DIFF(v.first_vn_date, p.first_pl_month, DAY) BETWEEN 91 AND 180) AS within_3_6_months,
  COUNTIF(DATE_DIFF(v.first_vn_date, p.first_pl_month, DAY) > 180) AS after_6_months
FROM paylater_first p
JOIN vaynhanh_first v ON p.agent_id = v.AGENT_ID
WHERE p.first_pl_month < v.first_vn_date
```

**All-time result:** 909,825 users (55.5% of all Vay Nhanh borrowers came from Paylater), avg 8.5 months gap.

## PL Convert vs Non-PL Group Definition (reusable CTEs)

**Use case:** Split Vay Nhanh borrowers into "came from Paylater" vs "didn't" for any comparison analysis.

```sql
WITH vn_dec AS (
  SELECT DISTINCT AGENT_ID
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE DISBURSED_DATE >= '2025-12-01' AND DISBURSED_DATE < '2026-01-01'
    AND STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')
),
pl_users AS (
  SELECT DISTINCT agent_id
  FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
  WHERE month_trans <= '2025-12-01'
),
user_groups AS (
  SELECT v.AGENT_ID,
    CASE WHEN p.agent_id IS NOT NULL THEN 'PL_convert' ELSE 'Non_PL' END AS user_group
  FROM vn_dec v
  LEFT JOIN pl_users p ON v.AGENT_ID = p.agent_id
)
-- Then JOIN user_groups with any other table on AGENT_ID
```

**Dec 2025 result:** 106,854 PL converts (72%) vs 41,535 Non-PL (28%).

**Key findings from profile comparison (Dec 2025):**
- PL converts: avg credit score 686 vs 665, avg loan ₫18.9M vs ₫15.5M
- PL converts: median age 23 vs 26, 43% in 18-22 bracket
- PL converts: 70% re-loan/repeat vs 50% for Non-PL
- PL converts: 93% organic (no gift incentive) vs 90%
- Regional distribution nearly identical between groups
- Full report: `data/output/paylater_vaynhanh_user_profile_comparison.md`

## Notes

- Join key: `agent_id` (Paylater) = `AGENT_ID` (Vay Nhanh) — same user ID, different casing
- Vay Nhanh always filter: `STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')`
- Paylater `month_trans` is first-of-month DATE; use `trans_time` for daily precision
- For "overlap" (both products in same period, no ordering), skip the WHERE date comparison
- Do NOT use `groups` as a CTE name — it's a BigQuery reserved word. Use `user_groups` instead.
