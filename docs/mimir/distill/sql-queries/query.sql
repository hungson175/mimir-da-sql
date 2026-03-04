-- Q1: InsurTech Sep 2025 Distribution dip — new vs returning Aug vs Sep
-- Same pattern as Q2b/Q19/Q24

WITH user_first_purchase AS (
  SELECT
    CAST(USER_PAYMENT AS STRING) AS user_id,
    MIN(TRANS_DATE) AS first_purchase_date
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
  GROUP BY 1
),
aug_sep_users AS (
  SELECT
    CAST(USER_PAYMENT AS STRING) AS user_id,
    DATE_TRUNC(TRANS_DATE, MONTH) AS month
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
    AND TRANS_DATE BETWEEN '2025-08-01' AND '2025-09-30'
  GROUP BY 1, 2
)
SELECT
  a.month,
  COUNT(DISTINCT CASE WHEN fp.first_purchase_date >= a.month THEN a.user_id END) AS new_users,
  COUNT(DISTINCT CASE WHEN fp.first_purchase_date < a.month  THEN a.user_id END) AS returning_users,
  COUNT(DISTINCT a.user_id) AS total_mau
FROM aug_sep_users a
JOIN user_first_purchase fp ON a.user_id = fp.user_id
GROUP BY 1
ORDER BY 1
