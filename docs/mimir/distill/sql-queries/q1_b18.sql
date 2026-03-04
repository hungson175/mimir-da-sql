-- Batch 18 Q1: Travel Insurance vs Vehicle Insurance monthly trend Jul 2025 – Feb 2026
-- Distribution only (att_fi_ins_nl_ver2), CC_STATUS='SUCCESS'

SELECT
  DATE_TRUNC(TRANS_DATE, MONTH) AS month,
  SP,
  COUNT(*)                                      AS orders,
  COUNT(DISTINCT CAST(USER_PAYMENT AS STRING))  AS unique_buyers,
  ROUND(SUM(AMOUNT)/1e9, 2)                     AS gmv_B,
  ROUND(SUM(FINAL_REV)/1e9, 3)                  AS revenue_B
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE CC_STATUS = 'SUCCESS'
  AND SP IN ('Vehicle Ins', 'Travel Ins')
  AND TRANS_DATE BETWEEN '2025-07-01' AND '2026-02-28'
GROUP BY 1, 2
ORDER BY 1, 2
