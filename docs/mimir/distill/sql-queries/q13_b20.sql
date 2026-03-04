-- Users who were MAU in Jan 2026 but unfunded (lapsed 1 month = last funded Dec 2025)
WITH mau_jan AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual' AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MAU_TYPE != '0.Churn'
),
mfu_jan AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual' AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
),
last_funded AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id, MAX(GRASS_DATE) AS last_date
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual' AND MFU_TYPE != '0.Churn'
  GROUP BY 1
),
lapsed_1m AS (
  -- Unfunded in Jan who last funded in Dec 2025 (1 month lapsed)
  SELECT m.user_id
  FROM mau_jan m
  LEFT JOIN mfu_jan f ON m.user_id = f.user_id
  JOIN last_funded lf ON m.user_id = lf.user_id
  WHERE f.user_id IS NULL
    AND lf.last_date BETWEEN '2025-12-01' AND '2025-12-31'
),
pl_jan AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0
    AND trans_type IN ('pay_pl','pay_ins','send_pl')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
)
SELECT
  COUNT(DISTINCT l.user_id) AS lapsed_1m_users,
  COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN l.user_id END) AS also_paylater,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN l.user_id END)
        / COUNT(DISTINCT l.user_id), 1) AS paylater_pct
FROM lapsed_1m l
LEFT JOIN pl_jan p ON l.user_id = p.user_id
