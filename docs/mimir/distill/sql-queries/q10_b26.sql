-- Q10: Super-savers (13m) — are they growing, stable or declining balance?
-- Compare Jan 2026 vs Dec 2025 balance for each user
WITH super_savers AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool' AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2025-01-01' AND '2026-01-31'
  GROUP BY user_id
  HAVING COUNT(DISTINCT DATE_TRUNC(GRASS_DATE, MONTH)) >= 13
),
dec_balance AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id, balance AS dec_bal
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP='Money Pool' AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE = '2025-12-01'
),
jan_balance AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id, balance AS jan_bal
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP='Money Pool' AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE = '2026-01-01'
)
SELECT
  CASE
    WHEN j.jan_bal > d.dec_bal * 1.05 THEN 'Growing (>5%)'
    WHEN j.jan_bal < d.dec_bal * 0.95 THEN 'Declining (>5%)'
    ELSE 'Stable (±5%)'
  END AS direction,
  COUNT(*) AS users,
  ROUND(AVG(j.jan_bal)/1e6, 1) AS avg_balance_M
FROM super_savers s
JOIN dec_balance d ON s.user_id = d.user_id
JOIN jan_balance j ON s.user_id = j.user_id
GROUP BY 1
ORDER BY users DESC
