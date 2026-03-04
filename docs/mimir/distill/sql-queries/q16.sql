-- Q16: TTT Money Pool — new users in Jan 2026
-- New = their first appearance in the Money Pool (IS_MP = 'Money Pool') ever
-- Using min(GRASS_DATE) to find first seen date

WITH user_first_mp AS (
  SELECT
    REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id,
    MIN(GRASS_DATE) AS first_mp_date
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY 1
)
SELECT
  DATE_TRUNC(first_mp_date, MONTH) AS cohort_month,
  COUNT(DISTINCT user_id) AS new_mp_users
FROM user_first_mp
WHERE first_mp_date BETWEEN '2025-01-01' AND '2026-01-31'
GROUP BY 1
ORDER BY 1
