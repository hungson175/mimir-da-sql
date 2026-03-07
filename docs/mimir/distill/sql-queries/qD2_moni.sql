-- D2: Moni chatbot Jan 2026 — conversations, users, topics
SELECT
  COUNT(DISTINCT conversation_id) AS total_conversations,
  COUNT(DISTINCT user_id) AS total_users,
  COUNT(*) AS total_messages,
  ROUND(COUNT(*) / COUNT(DISTINCT conversation_id), 1) AS avg_msgs_per_conversation
FROM `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
WHERE event_date BETWEEN '2026-01-01' AND '2026-01-31'
  AND user_message IS NOT NULL
  AND user_message != 'DEFAULT_START_MESSAGE';
