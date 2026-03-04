-- Q14/Q18: Vay Nhanh — active borrowers + avg loan size + disbursement Jan/Feb 2026

-- Part 1: New disbursements Jan/Feb 2026 vs Jan/Feb 2025 (YoY)
SELECT
  'disbursements' AS metric,
  DATE_TRUNC(DISBURSED_DATE, MONTH) AS month,
  COUNT(DISTINCT LOAN_ID) AS loan_count,
  SUM(DISBURSED_AMOUNT) AS total_disbursed,
  AVG(LOAN_AMOUNT) AS avg_loan_amount,
  NULL AS active_borrowers
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE IS NOT NULL
  AND DISBURSED_DATE BETWEEN '2025-01-01' AND '2026-02-28'
  AND EXTRACT(MONTH FROM DISBURSED_DATE) IN (1, 2)
GROUP BY 2

UNION ALL

-- Part 2: Outstanding portfolio (active loans) as of end of Jan/Feb 2026
SELECT
  'outstanding' AS metric,
  DATE '2026-02-28' AS month,
  COUNT(DISTINCT LOAN_ID) AS loan_count,
  SUM(DISBURSED_AMOUNT) AS total_disbursed,
  AVG(LOAN_AMOUNT) AS avg_loan_amount,
  COUNT(DISTINCT AGENT_ID) AS active_borrowers
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE STATUS = 'DISBURSED'  -- still active, not repaid

ORDER BY month, metric
