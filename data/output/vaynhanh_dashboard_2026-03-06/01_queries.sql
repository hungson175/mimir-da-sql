-- Vay Nhanh Performance Dashboard Queries
-- Timeline: 2026-01-01 to current (2026-03-06)

-- ============================================================
-- 1. DAILY METRICS
-- ============================================================

-- 1a. Daily Whitelist Users (traffic in whitelist)
SELECT
  ETL_DATE AS date,
  COUNT(DISTINCT AGENT_ID) AS whitelist_users
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT`
WHERE ETL_DATE BETWEEN '2026-01-01' AND '2026-03-06'
  AND WHITELIST_CHECK = '1 IN WHITELIST'
GROUP BY ETL_DATE
ORDER BY ETL_DATE;

-- 1b. Daily Submitted Users
SELECT
  SUBMITTED_DATE AS date,
  COUNT(DISTINCT AGENT_ID) AS submitted_users
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE SUBMITTED_DATE BETWEEN '2026-01-01' AND '2026-03-06'
GROUP BY SUBMITTED_DATE
ORDER BY SUBMITTED_DATE;

-- 1c. Daily Disbursed Users & GMV
SELECT
  DISBURSED_DATE AS date,
  COUNT(DISTINCT AGENT_ID) AS disbursed_users,
  SUM(DISBURSED_AMOUNT) AS gmv_disburse,
  AVG(DISBURSED_AMOUNT) AS avg_ticket_size
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-03-06'
GROUP BY DISBURSED_DATE
ORDER BY DISBURSED_DATE;

-- ============================================================
-- 2. WEEKLY METRICS
-- ============================================================

-- 2a. Weekly Whitelist Users
SELECT
  EXTRACT(YEAR FROM ETL_DATE) AS year,
  EXTRACT(WEEK FROM ETL_DATE) AS week,
  COUNT(DISTINCT AGENT_ID) AS whitelist_users
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT`
WHERE ETL_DATE BETWEEN '2026-01-01' AND '2026-03-06'
  AND WHITELIST_CHECK = '1 IN WHITELIST'
GROUP BY year, week
ORDER BY year, week;

-- 2b. Weekly Submitted Users
SELECT
  EXTRACT(YEAR FROM SUBMITTED_DATE) AS year,
  EXTRACT(WEEK FROM SUBMITTED_DATE) AS week,
  COUNT(DISTINCT AGENT_ID) AS submitted_users
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE SUBMITTED_DATE BETWEEN '2026-01-01' AND '2026-03-06'
GROUP BY year, week
ORDER BY year, week;

-- 2c. Weekly Disbursed Users & GMV
SELECT
  EXTRACT(YEAR FROM DISBURSED_DATE) AS year,
  EXTRACT(WEEK FROM DISBURSED_DATE) AS week,
  COUNT(DISTINCT AGENT_ID) AS disbursed_users,
  SUM(DISBURSED_AMOUNT) AS gmv_disburse,
  AVG(DISBURSED_AMOUNT) AS avg_ticket_size
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-03-06'
GROUP BY year, week
ORDER BY year, week;

-- ============================================================
-- 3. MONTHLY METRICS
-- ============================================================

-- 3a. Monthly Whitelist Users
SELECT
  EXTRACT(YEAR FROM ETL_DATE) AS year,
  EXTRACT(MONTH FROM ETL_DATE) AS month,
  COUNT(DISTINCT AGENT_ID) AS whitelist_users
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT`
WHERE ETL_DATE BETWEEN '2026-01-01' AND '2026-03-06'
  AND WHITELIST_CHECK = '1 IN WHITELIST'
GROUP BY year, month
ORDER BY year, month;

-- 3b. Monthly Submitted Users
SELECT
  EXTRACT(YEAR FROM SUBMITTED_DATE) AS year,
  EXTRACT(MONTH FROM SUBMITTED_DATE) AS month,
  COUNT(DISTINCT AGENT_ID) AS submitted_users
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE SUBMITTED_DATE BETWEEN '2026-01-01' AND '2026-03-06'
GROUP BY year, month
ORDER BY year, month;

-- 3c. Monthly Disbursed Users & GMV
SELECT
  EXTRACT(YEAR FROM DISBURSED_DATE) AS year,
  EXTRACT(MONTH FROM DISBURSED_DATE) AS month,
  COUNT(DISTINCT AGENT_ID) AS disbursed_users,
  SUM(DISBURSED_AMOUNT) AS gmv_disburse,
  AVG(DISBURSED_AMOUNT) AS avg_ticket_size
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-03-06'
GROUP BY year, month
ORDER BY year, month;
