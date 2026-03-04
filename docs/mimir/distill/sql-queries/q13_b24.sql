-- Q13: 51K Money Pool super-savers (Jan 2025 cohort, 13 months continuously funded)
-- Their Paylater + InsurTech + VN profile vs non-super-savers from same cohort

WITH jan25_cohort AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
  GROUP BY user_id
  HAVING MIN(GRASS_DATE) BETWEEN '2025-01-01' AND '2025-01-31'
),
super_savers AS (
  SELECT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool' AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE BETWEEN '2025-01-01' AND '2026-01-31'
  GROUP BY user_id
  HAVING COUNT(DISTINCT DATE_TRUNC(GRASS_DATE, MONTH)) >= 13
),
pl_users AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0 AND trans_type IN ('pay_pl','pay_ins','send_pl')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
),
ins_users AS (
  SELECT DISTINCT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS' AND TRANS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
)
SELECT
  CASE WHEN s.user_id IS NOT NULL THEN 'Super-Saver (13m)' ELSE 'Other Jan25 Cohort' END AS segment,
  COUNT(DISTINCT j.user_id) AS users,
  COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN j.user_id END) AS also_paylater,
  ROUND(100.0*COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN j.user_id END)/COUNT(DISTINCT j.user_id),1) AS pl_pct,
  COUNT(DISTINCT CASE WHEN i.user_id IS NOT NULL THEN j.user_id END) AS also_insurance,
  ROUND(100.0*COUNT(DISTINCT CASE WHEN i.user_id IS NOT NULL THEN j.user_id END)/COUNT(DISTINCT j.user_id),1) AS ins_pct
FROM jan25_cohort j
LEFT JOIN super_savers s ON j.user_id = s.user_id
LEFT JOIN pl_users p ON j.user_id = p.user_id
LEFT JOIN ins_users i ON j.user_id = i.user_id
GROUP BY 1
ORDER BY 1
