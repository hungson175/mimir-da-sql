WITH jan25_cohort AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY user_id
  HAVING MIN(GRASS_DATE) BETWEEN '2025-01-01' AND '2025-01-31'
)
SELECT
  DATE_TRUNC(t.GRASS_DATE, MONTH) AS month,
  COUNT(DISTINCT REGEXP_EXTRACT(t.USER_ID, r'\d+')) AS active_users,
  ROUND(AVG(t.balance), 0) AS avg_balance_vnd,
  ROUND(SUM(t.balance)/1e9, 1) AS total_balance_B
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` t
JOIN jan25_cohort c
  ON REGEXP_EXTRACT(t.USER_ID, r'\d+') = c.user_id
WHERE t.IS_MP = 'Money Pool'
  AND t.MFU_TYPE != '0.Churn'
  AND t.GRASS_DATE = DATE_TRUNC(t.GRASS_DATE, MONTH)  -- first day of month as proxy
GROUP BY 1
ORDER BY 1
