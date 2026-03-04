-- Q31/Q32: TTT Money Pool — avg first deposit amount by cohort
-- Compare Jan 2025 cohort vs Wave 1 (Jul-Aug 2025)
-- "First deposit" = balance on the first day the user appears in Money Pool

WITH user_first_day AS (
  SELECT
    REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id,
    MIN(GRASS_DATE) AS first_date,
    DATE_TRUNC(MIN(GRASS_DATE), MONTH) AS cohort_month
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY 1
),
first_day_balance AS (
  SELECT
    REGEXP_EXTRACT(t.USER_ID, r'\d+') AS user_id,
    t.balance AS first_balance
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` t
  JOIN user_first_day u
    ON REGEXP_EXTRACT(t.USER_ID, r'\d+') = u.user_id
    AND t.GRASS_DATE = u.first_date
    AND t.IS_MP = 'Money Pool'
)
SELECT
  ufd.cohort_month,
  COUNT(DISTINCT ufd.user_id) AS user_count,
  ROUND(AVG(fdb.first_balance), 0) AS avg_first_deposit,
  ROUND(APPROX_QUANTILES(fdb.first_balance, 100)[OFFSET(50)], 0) AS median_first_deposit,
  COUNTIF(fdb.first_balance < 50000) AS micro_deposit_users,
  ROUND(100.0 * COUNTIF(fdb.first_balance < 50000) / COUNT(DISTINCT ufd.user_id), 1) AS micro_deposit_pct
FROM user_first_day ufd
JOIN first_day_balance fdb ON ufd.user_id = fdb.user_id
WHERE ufd.cohort_month IN ('2025-01-01', '2025-07-01', '2025-08-01')
GROUP BY 1
ORDER BY 1
