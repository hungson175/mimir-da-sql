-- D9: Donation Jan 2026 — users who actually donated (not just engaged)
-- DONATION_TRANSACTION_AGG: one row per user/day/action combination
-- Exclude user_id='0' (guest/unmapped)
-- Count distinct donors overall + by donate_type

SELECT
  donate_type,
  COUNT(DISTINCT user_id) AS unique_donors,
  SUM(total_trans) AS total_transactions,
  SUM(total_amount) AS total_amount
FROM `project-5400504384186300846.MBI_DA.DONATION_TRANSACTION_AGG`
WHERE month = '2026-01-01'
  AND user_id != '0'
GROUP BY donate_type
ORDER BY unique_donors DESC;
