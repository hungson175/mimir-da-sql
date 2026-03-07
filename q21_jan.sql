-- Q21 Jan baseline: VN total disbursement Jan 2026
SELECT
  COUNT(*) as loan_count,
  SUM(LOAN_AMOUNT) as total_disbursed,
  ROUND(COUNT(*)/31.0, 0) as daily_avg_loans,
  ROUND(SUM(LOAN_AMOUNT)/31.0, 0) as daily_avg_amount
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-01-31'
