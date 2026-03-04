-- Q8: TTT Money Pool AUM — end-of-month snapshot, Jan 2025 – Feb 2026 (14 months)
-- NO MFU filter — AUM includes all accounts (even churned may hold balances)

SELECT
  GRASS_DATE,
  SUM(balance) AS money_pool_aum
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE IS_MP = 'Money Pool'
  AND GRASS_DATE IN (
    '2025-01-31','2025-02-28','2025-03-31','2025-04-30',
    '2025-05-31','2025-06-30','2025-07-31','2025-08-31',
    '2025-09-30','2025-10-31','2025-11-30','2025-12-31',
    '2026-01-31','2026-02-28'
  )
GROUP BY 1
ORDER BY 1
