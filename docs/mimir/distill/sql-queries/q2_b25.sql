-- B25 Q2: When do dormant Paylater users first borrow?
-- For TPB ACTIVED accounts, find first transaction month
-- Spike in certain months = campaign effect

WITH first_borrow AS (
  SELECT
    CAST(p.user_id AS STRING) AS user_id,
    DATE_TRUNC(MIN(p.created_date), MONTH) AS first_borrow_month
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS` p
  JOIN `momovn-prod.BU_FI.PAYLATER_ACCOUNT_GDS` a ON CAST(p.user_id AS STRING) = a.user_id
  WHERE p.result_code = 0
    AND p.trans_type IN ('pay_pl','pay_ins','send_pl')
    AND a.partner_name = 'TPB'
  GROUP BY 1
)
SELECT
  first_borrow_month,
  COUNT(*) AS new_borrowers,
  -- Identify potential campaign months (spikes vs trend)
  ROUND(COUNT(*) / AVG(COUNT(*)) OVER(), 2) AS vs_avg_ratio
FROM first_borrow
WHERE first_borrow_month BETWEEN '2025-01-01' AND '2026-01-31'
GROUP BY 1
ORDER BY 1
