-- Q24: InsurTech Distribution new vs returning — Jan 2026 and Feb 2026
-- (same pattern as Q19 for Dec 2025)

WITH user_first_purchase AS (
  SELECT
    CAST(USER_PAYMENT AS STRING) AS user_id,
    MIN(TRANS_DATE) AS first_purchase_date
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
  GROUP BY 1
),
jan_feb_users AS (
  SELECT
    CAST(USER_PAYMENT AS STRING) AS user_id,
    DATE_TRUNC(TRANS_DATE, MONTH) AS month
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
    AND TRANS_DATE BETWEEN '2026-01-01' AND '2026-02-28'
  GROUP BY 1, 2
)
SELECT
  j.month,
  COUNT(DISTINCT CASE WHEN fp.first_purchase_date >= j.month THEN j.user_id END) AS new_users,
  COUNT(DISTINCT CASE WHEN fp.first_purchase_date < j.month  THEN j.user_id END) AS returning_users,
  COUNT(DISTINCT j.user_id) AS total_distribution_mau
FROM jan_feb_users j
JOIN user_first_purchase fp ON j.user_id = fp.user_id
GROUP BY 1
ORDER BY 1
