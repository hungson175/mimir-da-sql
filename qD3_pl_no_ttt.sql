-- D3: Paylater Jan 2026 MAU without TTT account
-- PL MAU = users with successful transactions in PAYLATER_ALL_TRANS
-- TTT users = anyone who appears in mart_ttt_daily_user_record (even churned)

WITH pl_mau AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE created_date BETWEEN '2026-01-01' AND '2026-01-31'
    AND result_code = 0
    AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')
),
ttt_ever AS (
  -- All users who ever had a TTT account (including churned)
  SELECT DISTINCT CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP != 'true'  -- individual accounts only (try string comparison)
),
ttt_active AS (
  -- TTT users who are currently active (non-churn)
  SELECT DISTINCT CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MAU_TYPE != '0.Churn'
)
SELECT
  COUNT(pl.user_id) AS pl_mau_total,
  COUNT(CASE WHEN ttt_e.user_id IS NULL THEN 1 END) AS no_ttt_ever,
  COUNT(CASE WHEN ttt_a.user_id IS NULL THEN 1 END) AS no_ttt_active,
  ROUND(COUNT(CASE WHEN ttt_e.user_id IS NULL THEN 1 END) * 100.0 / COUNT(pl.user_id), 1) AS pct_no_ttt_ever,
  ROUND(COUNT(CASE WHEN ttt_a.user_id IS NULL THEN 1 END) * 100.0 / COUNT(pl.user_id), 1) AS pct_no_ttt_active
FROM pl_mau pl
LEFT JOIN ttt_ever ttt_e ON pl.user_id = ttt_e.user_id
LEFT JOIN ttt_active ttt_a ON pl.user_id = ttt_a.user_id;
