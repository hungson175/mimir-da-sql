-- Money Pool cohort avg balance in Jan 2026, by cohort month (2025 cohorts)
WITH cohorts AS (
  SELECT
    REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id,
    DATE_TRUNC(MIN(GRASS_DATE), MONTH) AS cohort_month
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY user_id
  HAVING MIN(GRASS_DATE) BETWEEN '2025-01-01' AND '2025-12-31'
)
SELECT
  c.cohort_month,
  COUNT(DISTINCT c.user_id) AS active_users_jan26,
  ROUND(AVG(t.balance), 0) AS avg_balance_jan26
FROM cohorts c
JOIN `momovn-prod.BU_FI.mart_ttt_daily_user_record` t
  ON REGEXP_EXTRACT(t.USER_ID, r'\d+') = c.user_id
WHERE t.IS_MP = 'Money Pool'
  AND t.MFU_TYPE != '0.Churn'
  AND t.GRASS_DATE = '2026-01-01'
GROUP BY 1
ORDER BY 1
