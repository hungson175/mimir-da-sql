-- Q33: Vay Nhanh DPD/NPL — latest snapshot per vintage cohort
-- DASH_RISK_PORTFOLIO_FASTMONEY_VINTAGE_DPD_ALL
-- MOB = month-on-book. Get the most recent MOB data per vintage.
-- DPD30/DPD90 as % of TOTAL_LOAN = overdue rate / NPL rate

WITH latest_mob AS (
  SELECT
    MONTH_DISBURSE,
    MAX(MOB) AS latest_mob
  FROM `momovn-prod.BU_FI.DASH_RISK_PORTFOLIO_FASTMONEY_VINTAGE_DPD_ALL`
  WHERE MONTH_DISBURSE >= '2025-07-01'  -- last 8 months
  GROUP BY 1
)
SELECT
  d.MONTH_DISBURSE,
  d.MOB AS months_on_book,
  d.TOTAL_LOAN,
  d.DPD30,
  d.DPD90,
  ROUND(100.0 * d.DPD30 / NULLIF(d.TOTAL_LOAN, 0), 2) AS dpd30_rate,
  ROUND(100.0 * d.DPD90 / NULLIF(d.TOTAL_LOAN, 0), 2) AS dpd90_npl_rate
FROM `momovn-prod.BU_FI.DASH_RISK_PORTFOLIO_FASTMONEY_VINTAGE_DPD_ALL` d
JOIN latest_mob l
  ON d.MONTH_DISBURSE = l.MONTH_DISBURSE
  AND d.MOB = l.latest_mob
ORDER BY d.MONTH_DISBURSE
