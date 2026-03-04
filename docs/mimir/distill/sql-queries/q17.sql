-- Q17: Paylater DPD — Feb 2026 outstanding portfolio by DPD bucket
-- Table: 20260201_PAYLATER_RECOVERY_EXPERIMENT_CALLBOT_OUTSTANDING_BY_DPD

SELECT
  CASE
    WHEN dpd = 0 THEN '0. Current'
    WHEN dpd BETWEEN 1 AND 30 THEN '1. DPD 1-30'
    WHEN dpd BETWEEN 31 AND 60 THEN '2. DPD 31-60'
    WHEN dpd BETWEEN 61 AND 90 THEN '3. DPD 61-90'
    WHEN dpd > 90 THEN '4. DPD 90+'
    ELSE 'Unknown'
  END AS dpd_bucket,
  COUNT(DISTINCT agent_id) AS borrowers,
  COUNT(DISTINCT partner_loan_id) AS loans,
  ROUND(SUM(outstanding) / 1e9, 2) AS outstanding_B_VND
FROM `momovn-prod.BU_FI.20260201_PAYLATER_RECOVERY_EXPERIMENT_CALLBOT_OUTSTANDING_BY_DPD`
GROUP BY 1
ORDER BY 1
