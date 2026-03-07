-- D10: P2P Revenue Jan vs Mar 2026
-- Revenue = W2B + CASHOUT fee (W2W = free, ~0 VND)
SELECT
  month,
  service,
  SUM(fee) AS fee_revenue,
  COUNT(*) AS transactions,
  COUNT(DISTINCT user_id) AS unique_users
FROM `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
WHERE month IN ('2026-01-01', '2026-03-01')
  AND fee > 0
GROUP BY month, service
ORDER BY month, service;
