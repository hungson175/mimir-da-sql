-- Q13: VietQR scan users Jan 2026 × FS product (TTT + Paylater) cross-sell
WITH vietqr_jan AS (
  SELECT DISTINCT user_id
  FROM `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
  WHERE serviceid = 'transfer_p2b_scan_vietqr'
    AND month = '2026-01-01'
),
ttt_jan AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MAU_TYPE != '0.Churn'
),
pl_jan AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0
    AND trans_type IN ('pay_pl','pay_ins','send_pl')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
)
SELECT
  COUNT(DISTINCT v.user_id) AS vietqr_users,
  COUNT(DISTINCT CASE WHEN t.user_id IS NOT NULL THEN v.user_id END) AS also_ttt,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN t.user_id IS NOT NULL THEN v.user_id END)
        / COUNT(DISTINCT v.user_id), 1) AS ttt_pct,
  COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN v.user_id END) AS also_paylater,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN v.user_id END)
        / COUNT(DISTINCT v.user_id), 1) AS paylater_pct,
  COUNT(DISTINCT CASE WHEN t.user_id IS NOT NULL OR p.user_id IS NOT NULL
                      THEN v.user_id END) AS any_fs,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN t.user_id IS NOT NULL OR p.user_id IS NOT NULL
                      THEN v.user_id END) / COUNT(DISTINCT v.user_id), 1) AS any_fs_pct
FROM vietqr_jan v
LEFT JOIN ttt_jan t ON v.user_id = t.user_id
LEFT JOIN pl_jan p ON v.user_id = p.user_id
