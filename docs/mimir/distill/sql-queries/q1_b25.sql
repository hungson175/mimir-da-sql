-- B25 Q1: Jan 2025 super-savers (13m continuous) avg balance month by month
-- See if they started big or compounded up

WITH jan25_cohort AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY user_id
  HAVING MIN(GRASS_DATE) BETWEEN '2025-01-01' AND '2025-01-31'
),
super_savers AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool' AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2025-01-01' AND '2026-01-31'
  GROUP BY user_id
  HAVING COUNT(DISTINCT DATE_TRUNC(GRASS_DATE, MONTH)) >= 13
)
SELECT
  DATE_TRUNC(t.GRASS_DATE, MONTH) AS month,
  COUNT(DISTINCT REGEXP_EXTRACT(t.USER_ID, r'\d+')) AS users,
  ROUND(AVG(t.balance), 0) AS avg_balance,
  ROUND(SUM(t.balance)/1e9, 1) AS total_B
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` t
JOIN super_savers s ON REGEXP_EXTRACT(t.USER_ID, r'\d+') = s.user_id
WHERE t.IS_MP = 'Money Pool'
  AND t.MFU_TYPE != '0.Churn'
  AND t.GRASS_DATE = DATE_TRUNC(t.GRASS_DATE, MONTH)
GROUP BY 1
ORDER BY 1
