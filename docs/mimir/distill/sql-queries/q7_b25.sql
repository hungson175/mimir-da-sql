WITH mp_middle_class AS (
  SELECT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE IS_MP = 'Money Pool'
    AND MFU_TYPE != '0.Churn'
    AND GRASS_DATE = '2026-01-31'
    AND balance BETWEEN 10000000 AND 50000000  -- 10M-50M VND
),
pl_jan AS (
  SELECT DISTINCT CAST(user_id AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
  WHERE result_code = 0
    AND trans_type IN ('pay_pl','pay_ins','send_pl')
    AND created_date BETWEEN '2026-01-01' AND '2026-01-31'
),
ins_jan AS (
  SELECT DISTINCT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE CC_STATUS = 'SUCCESS'
    AND TRANS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
)
SELECT
  COUNT(DISTINCT m.user_id) AS middle_class_users,
  COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN m.user_id END) AS also_paylater,
  ROUND(100.0*COUNT(DISTINCT CASE WHEN p.user_id IS NOT NULL THEN m.user_id END)/COUNT(DISTINCT m.user_id),1) AS pl_pct,
  COUNT(DISTINCT CASE WHEN i.user_id IS NOT NULL THEN m.user_id END) AS also_instech,
  ROUND(100.0*COUNT(DISTINCT CASE WHEN i.user_id IS NOT NULL THEN m.user_id END)/COUNT(DISTINCT m.user_id),1) AS ins_pct
FROM mp_middle_class m
LEFT JOIN pl_jan p ON m.user_id = p.user_id
LEFT JOIN ins_jan i ON m.user_id = i.user_id
