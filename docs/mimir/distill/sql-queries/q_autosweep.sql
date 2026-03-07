-- Auto-sweep sizing: Users who regularly receive money into MoMo wallet (≥2x/month)
-- SERVICE_GROUP=3 = bank topup INTO MoMo wallet (most reliable proxy for regular inflow)
-- Jan 2026

SELECT
  receive_count_bucket,
  COUNT(*) AS user_count,
  COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS pct
FROM (
  SELECT
    CAST(USER_PAYMENT AS STRING) AS user_id,
    COUNT(*) AS monthly_receives,
    CASE
      WHEN COUNT(*) >= 8 THEN '8+ times (weekly+)'
      WHEN COUNT(*) >= 4 THEN '4-7 times (biweekly)'
      WHEN COUNT(*) >= 2 THEN '2-3 times'
      ELSE '1 time'
    END AS receive_count_bucket
  FROM `momovn-prod.BU_FI.FI_TRANS`
  WHERE DATE_TRANS BETWEEN '2026-01-01' AND '2026-01-31'
    AND STATUSID = 2
    AND SERVICE_GROUP = 3  -- bank topup into MoMo wallet
  GROUP BY 1
) sub
GROUP BY receive_count_bucket
ORDER BY MIN(monthly_receives) DESC;
