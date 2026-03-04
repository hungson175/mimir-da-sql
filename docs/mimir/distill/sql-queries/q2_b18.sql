-- Batch 18 Q2: PA Bus product — buyer profile
-- What is PA Bus? Check SP_DETAIL for breakdown, and see if USER_TYPE or partner gives context

SELECT
  SP,
  SP_DETAIL,
  MERCHANT,
  COUNT(*)                                      AS orders,
  COUNT(DISTINCT CAST(USER_PAYMENT AS STRING))  AS unique_buyers,
  ROUND(SUM(AMOUNT)/1e9, 3)                     AS gmv_B,
  ROUND(SUM(FINAL_REV)/1e9, 3)                  AS revenue_B,
  ROUND(SUM(FINAL_REV)/NULLIF(COUNT(*),0), 0)   AS avg_rev_per_order
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE CC_STATUS = 'SUCCESS'
  AND SP = 'PA Bus'
  AND TRANS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
GROUP BY 1, 2, 3
ORDER BY orders DESC
LIMIT 20
