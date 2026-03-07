-- D1: OTA Jan 2026 — flights + hotels users, GMV, top merchants
-- Table: 2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE
-- Date col = DATE, user col = user_payment, status = STATUSID=2
-- Airline: sub_cate='01. AIRLINE' | Hotel: group_sub_cate='03. HOTEL'

SELECT
  CASE
    WHEN sub_cate = '01. AIRLINE' THEN 'Airline'
    WHEN group_sub_cate = '03. HOTEL' THEN 'Hotel'
    ELSE 'Other'
  END AS category,
  COUNT(DISTINCT user_payment) AS unique_users,
  SUM(TOTAL_AMOUNT) AS total_gmv,
  COUNT(*) AS transactions,
  ROUND(SUM(TOTAL_AMOUNT) / COUNT(*)) AS avg_ticket
FROM `momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE`
WHERE DATE BETWEEN '2026-01-01' AND '2026-01-31'
  AND STATUSID = 2
  AND (sub_cate = '01. AIRLINE' OR group_sub_cate = '03. HOTEL')
GROUP BY 1
ORDER BY unique_users DESC;
