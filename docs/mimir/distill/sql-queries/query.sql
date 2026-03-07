-- TTT: Top 10 whale users by balance (latest available snapshot)
-- First check max date
SELECT MAX(GRASS_DATE) AS max_date
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE >= '2026-03-01'
