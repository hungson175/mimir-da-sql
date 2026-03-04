-- Q55: TTT Individual MAU Jan 2026 who are UNFUNDED (no balance)
-- but ARE active Paylater users = prime cross-sell targets for TTT
-- "Unfunded" = active in MAU but NOT in MFU (no money in TTT)

WITH ttt_mau AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual'
    AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MAU_TYPE != '0.Churn'
),
ttt_mfu AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Individual'
    AND GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MFU_TYPE != '0.Churn'
),
ttt_unfunded AS (
  SELECT m.user_id
  FROM ttt_mau m
  LEFT JOIN ttt_mfu f ON m.user_id = f.user_id
  WHERE f.user_id IS NULL  -- MAU but not MFU = unfunded
),
pl_jan AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0
    AND trans_type IN ('pay_pl','pay_ins','send_pl')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
)
SELECT
  COUNT(DISTINCT u.user_id) AS ttt_unfunded_total,
  COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN u.user_id END) AS unfunded_also_paylater,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN u.user_id END)
        / COUNT(DISTINCT u.user_id), 1) AS paylater_pct
FROM ttt_unfunded u
LEFT JOIN pl_jan p ON u.user_id = p.user_id
