WITH mau_jan AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual'
    AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MAU_TYPE != '0.Churn'
),
mfu_jan AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual'
    AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
),
unfunded AS (
  SELECT m.user_id
  FROM mau_jan m
  LEFT JOIN mfu_jan f ON m.user_id = f.user_id
  WHERE f.user_id IS NULL
),
last_funded AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id, MAX(GRASS_DATE) AS last_date
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual' AND MFU_TYPE != '0.Churn'
  GROUP BY 1
)
SELECT
  DATE_DIFF(DATE '2026-01-31', lf.last_date, MONTH) AS months_since_funded,
  COUNT(DISTINCT u.user_id) AS users
FROM unfunded u
JOIN last_funded lf ON u.user_id = lf.user_id
GROUP BY 1
ORDER BY 1
LIMIT 15
