-- TTT Flywheel Retention: Compare MAU_TYPE distribution for flywheel vs non-flywheel TTT users

WITH flywheel_users AS (
  SELECT DISTINCT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.FI_TRANS`
  WHERE DATE_TRANS BETWEEN '2026-01-01' AND '2026-01-31'
    AND FUNDID = 6
    AND STATUSID = 2
    AND BU_GROUP_CODE_L2 = 'LOAN COLLECTION'
),
ttt_users AS (
  SELECT
    CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING) AS user_id,
    MAX(MAU_TYPE) AS mau_type
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
  GROUP BY 1
),
labeled AS (
  SELECT
    CASE WHEN f.user_id IS NOT NULL THEN 'Flywheel' ELSE 'TTT-only' END AS user_segment,
    t.mau_type,
    COUNT(*) AS user_count
  FROM ttt_users t
  LEFT JOIN flywheel_users f ON t.user_id = f.user_id
  GROUP BY 1, 2
)
SELECT
  user_segment,
  mau_type,
  user_count,
  ROUND(user_count * 100.0 / SUM(user_count) OVER (PARTITION BY user_segment), 1) AS pct_within_segment
FROM labeled
ORDER BY user_segment, mau_type;
