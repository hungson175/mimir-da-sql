-- Q3: P2P W2B + CASHOUT fee revenue trend Jul 2025 – Feb 2026 (8 months)
SELECT
  month,
  ROUND(SUM(CASE WHEN service='W2B'     THEN fee ELSE 0 END)/1e9, 2) AS w2b_fee_B,
  ROUND(SUM(CASE WHEN service='CASHOUT' THEN fee ELSE 0 END)/1e9, 2) AS cashout_fee_B,
  ROUND(SUM(fee)/1e9, 2)                                              AS total_fee_B
FROM `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
WHERE month BETWEEN '2025-07-01' AND '2026-02-01'
GROUP BY 1
ORDER BY 1
