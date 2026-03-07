-- D7: InsurTech SP type enum discovery — all distinct SP values Jan 2026
SELECT
  SP,
  COUNT(*) AS transactions,
  COUNT(DISTINCT USER_PAYMENT) AS unique_users,
  SUM(AMOUNT) AS gmv
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
  AND CC_STATUS = 'Thành Công'
GROUP BY SP
ORDER BY transactions DESC;
