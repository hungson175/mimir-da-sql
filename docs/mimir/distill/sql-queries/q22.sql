-- Q22: TTT Money Pool Wave 1 retention (Jul-Aug 2025 cohort)
-- Are Jul-Aug 2025 new Money Pool users still funded in Jan 2026?

WITH wave1_users AS (
  -- Users whose first Money Pool date was Jul or Aug 2025
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY user_id
  HAVING MIN(GRASS_DATE) BETWEEN '2025-07-01' AND '2025-08-31'
),
jan2026_funded AS (
  -- Who among them is still funded in Jan 2026 (MFU_TYPE != churn, any day)
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
    AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
)
SELECT
  COUNT(DISTINCT w.user_id) AS wave1_users,
  COUNT(DISTINCT j.user_id) AS still_funded_jan2026,
  ROUND(100.0 * COUNT(DISTINCT j.user_id) / NULLIF(COUNT(DISTINCT w.user_id), 0), 1) AS retention_pct
FROM wave1_users w
LEFT JOIN jan2026_funded j ON w.user_id = j.user_id
