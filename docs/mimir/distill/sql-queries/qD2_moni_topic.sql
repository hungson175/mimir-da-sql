-- D2b: Moni chatbot - topic breakdown + user type Jan 2026
SELECT
  topic,
  COUNT(DISTINCT conversation_id) AS conversations,
  COUNT(DISTINCT user_id) AS users
FROM `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31'
  AND user_message IS NOT NULL
  AND user_message != 'DEFAULT_START_MESSAGE'
GROUP BY topic
ORDER BY conversations DESC
LIMIT 10;
