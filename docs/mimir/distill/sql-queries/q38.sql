-- Q38: VN loan status for overlap segment (Paylater penalty users) vs non-overlap
-- No borrower-level DPD column available — using STATUS as proxy
-- Compare loan distribution: DISBURSED vs LIQUIDATED for overlap vs non-overlap

WITH penalty_users AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0
    AND trans_type IN ('pay_pl_fee_penalty','record_pl_pen_fee_dpd1')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
),
vn_loans AS (
  SELECT
    AGENT_ID AS user_id,
    LOAN_ID,
    LOAN_AMOUNT,
    STATUS,
    DISBURSED_DATE
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE STATUS IN ('DISBURSED', 'LIQUIDATED')
    AND DISBURSED_DATE BETWEEN '2025-01-01' AND '2026-01-31'
)
SELECT
  CASE WHEN p.user_id IS NOT NULL THEN 'Paylater Penalty User' ELSE 'Non-Penalty User' END AS segment,
  COUNT(DISTINCT v.user_id) AS unique_borrowers,
  COUNT(DISTINCT v.LOAN_ID) AS total_loans,
  COUNTIF(v.STATUS = 'DISBURSED') AS active_loans,
  COUNTIF(v.STATUS = 'LIQUIDATED') AS repaid_loans,
  ROUND(100.0 * COUNTIF(v.STATUS = 'DISBURSED') / COUNT(DISTINCT v.LOAN_ID), 1) AS still_active_pct,
  ROUND(AVG(v.LOAN_AMOUNT), 0) AS avg_loan_amount
FROM vn_loans v
LEFT JOIN penalty_users p ON v.user_id = p.user_id
GROUP BY 1
