-- Q22b: TTT Money Pool Jan 2025 launch cohort retention to Jan 2026
-- Jan 2025 cohort = users whose first Money Pool date was Jan 2025

WITH jan2025_cohort AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY user_id
  HAVING MIN(GRASS_DATE) BETWEEN '2025-01-01' AND '2025-01-31'
),
jan2026_funded AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
    AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
)
SELECT
  COUNT(DISTINCT c.user_id) AS jan2025_cohort_size,
  COUNT(DISTINCT j.user_id) AS still_funded_jan2026,
  ROUND(100.0 * COUNT(DISTINCT j.user_id) / NULLIF(COUNT(DISTINCT c.user_id), 0), 1) AS retention_pct
FROM jan2025_cohort c
LEFT JOIN jan2026_funded j ON c.user_id = j.user_id
