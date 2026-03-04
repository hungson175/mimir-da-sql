-- Q49: Multi-product LTV comparison
-- TTT+Paylater users vs Paylater-only users — Paylater GMV comparison
-- Jan 2026

WITH ttt_jan AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND MAU_TYPE != '0.Churn'
),
paylater_jan AS (
  SELECT
    CAST(user_id AS STRING) AS user_id,
    SUM(amount) AS pl_gmv,
    COUNT(*) AS pl_transactions
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0
    AND trans_type IN ('pay_pl','pay_ins','send_pl')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
  GROUP BY 1
)
SELECT
  CASE WHEN t.user_id IS NOT NULL THEN 'TTT + Paylater' ELSE 'Paylater only' END AS segment,
  COUNT(DISTINCT p.user_id) AS users,
  ROUND(AVG(p.pl_gmv) / 1000, 0) AS avg_gmv_K_vnd,
  ROUND(AVG(p.pl_transactions), 1) AS avg_transactions
FROM paylater_jan p
LEFT JOIN ttt_jan t ON p.user_id = t.user_id
GROUP BY 1
ORDER BY avg_gmv_K_vnd DESC
