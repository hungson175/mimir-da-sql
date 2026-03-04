-- Q52: Users with 3+ FS products Jan 2026
-- Products: TTT, Paylater, Vay Nhanh, InsurTech

WITH ttt_jan AS (
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
),
vn_jan AS (
  SELECT DISTINCT AGENT_ID AS user_id
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-01-31'
),
ins_jan AS (
  SELECT DISTINCT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
    AND TRANS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
),
user_products AS (
  -- Start from ALL users across all 4 domains
  SELECT user_id, 'ttt' AS product FROM ttt_jan
  UNION DISTINCT
  SELECT user_id, 'pl' FROM pl_jan
  UNION DISTINCT
  SELECT user_id, 'vn' FROM vn_jan
  UNION DISTINCT
  SELECT user_id, 'ins' FROM ins_jan
),
user_product_count AS (
  SELECT user_id, COUNT(DISTINCT product) AS product_count
  FROM user_products
  GROUP BY 1
)
SELECT
  product_count,
  COUNT(DISTINCT user_id) AS users
FROM user_product_count
GROUP BY 1
ORDER BY 1
