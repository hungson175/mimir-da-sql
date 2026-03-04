-- Q50: VN borrowers Jan 2026 — overlap with Paylater and TTT
WITH vn_jan AS (
  SELECT DISTINCT AGENT_ID AS user_id
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-01-31'
),
pl_jan AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0
    AND trans_type IN ('pay_pl','pay_ins','send_pl')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
),
ttt_jan AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MAU_TYPE != '0.Churn'
)
SELECT
  COUNT(DISTINCT v.user_id) AS vn_borrowers,
  COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN v.user_id END) AS also_paylater,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN v.user_id END)
        / COUNT(DISTINCT v.user_id), 1) AS paylater_overlap_pct,
  COUNT(DISTINCT CASE WHEN t.user_id IS NOT NULL THEN v.user_id END) AS also_ttt,
  ROUND(100.0 * COUNT(DISTINCT CASE WHEN t.user_id IS NOT NULL THEN v.user_id END)
        / COUNT(DISTINCT v.user_id), 1) AS ttt_overlap_pct
FROM vn_jan v
LEFT JOIN pl_jan p ON v.user_id = p.user_id
LEFT JOIN ttt_jan t ON v.user_id = t.user_id
