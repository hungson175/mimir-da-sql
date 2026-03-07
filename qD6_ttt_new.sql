-- D6: TTT new users Jan 2026 — MAU_TYPE = '1.New' = first-time users
-- Avg first deposit: use avg_balance as proxy (actual deposit = balance on first active day)
-- For new users: MAU_TYPE='1.New' in Jan 2026

SELECT
  COUNT(DISTINCT CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING)) AS new_users,
  ROUND(AVG(avg_balance)) AS avg_balance_new_users
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
  AND MAU_TYPE = '1.New'
  AND IS_MP != 'true';
