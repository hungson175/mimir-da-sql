-- Q10: Jan 2025 cohort — how many months were they funded (MFU)?
-- Check across 12 months Jan 2025 → Jan 2026
WITH jan25_cohort AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY user_id
  HAVING MIN(GRASS_DATE) BETWEEN '2025-01-01' AND '2025-01-31'
),
monthly_funded AS (
  SELECT
    REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id,
    COUNT(DISTINCT DATE_TRUNC(GRASS_DATE, MONTH)) AS months_funded
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
    AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2025-01-01' AND '2026-01-31'
  GROUP BY 1
)
SELECT
  mf.months_funded,
  COUNT(DISTINCT j.user_id) AS users,
  ROUND(100.0 * COUNT(DISTINCT j.user_id) / SUM(COUNT(DISTINCT j.user_id)) OVER(), 1) AS pct
FROM jan25_cohort j
LEFT JOIN monthly_funded mf ON j.user_id = mf.user_id
GROUP BY 1
ORDER BY 1 DESC
LIMIT 15
