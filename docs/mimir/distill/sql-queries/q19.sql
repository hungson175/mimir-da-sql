-- Q19: InsurTech Distribution Dec 2025 — new users vs returning
-- New = first ever successful purchase in att_fi_ins_nl_ver2
-- (same pattern as Q2b but for Dec 2025)

WITH user_first_purchase AS (
  SELECT
    CAST(USER_PAYMENT AS STRING) AS user_id,
    MIN(TRANS_DATE) AS first_purchase_date
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
  GROUP BY 1
),
dec_users AS (
  SELECT
    CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
    AND TRANS_DATE BETWEEN '2025-12-01' AND '2025-12-31'
  GROUP BY 1
)
SELECT
  COUNT(DISTINCT CASE WHEN fp.first_purchase_date >= '2025-12-01' THEN d.user_id END) AS new_users,
  COUNT(DISTINCT CASE WHEN fp.first_purchase_date < '2025-12-01'  THEN d.user_id END) AS returning_users,
  COUNT(DISTINCT d.user_id) AS total_distribution_mau
FROM dec_users d
JOIN user_first_purchase fp ON d.user_id = fp.user_id
