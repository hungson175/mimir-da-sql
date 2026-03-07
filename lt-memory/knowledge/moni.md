# Knowledge: Moni Chatbot
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-06

## SQL Gotchas

### Correct Table and Filters (2026-03-06)
Main table: `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
- Date: `event_date` (DATE)
- Conversations: `COUNT(DISTINCT conversation_id)`
- Users: `COUNT(DISTINCT user_id)`
- Messages: `COUNT(*)` WHERE `user_message IS NOT NULL AND user_message != 'DEFAULT_START_MESSAGE'`
- Resolution rate: NOT directly available as column. Use `state` field but values unclear.

### Mimir Moni Domain: TIMEOUT (2026-03-06)
Domain `9066c2ad-5109-4fa9-abc0-06d85c6eed7e` always times out (DomainSchemaHandler).
**Always use BQ directly for Moni queries.**

## Business Insights

### Jan 2026 Baselines (2026-03-06)
- Conversations: **366,080**
- Unique users: **282,089**
- Messages (excl. DEFAULT_START_MESSAGE): **563,367**
- Avg messages per conversation: **1.5**

Low avg messages/conversation (1.5) suggests most users send 1 message and get a response — chatbot is handling quick lookups or FAQ-style interactions, not deep conversations.
282K unique chatters = ~2.7% of MoMo MAU — niche product but growing (Moni AI launched mid-2025).

## Mimir Trust
- All queries: UNAVAILABLE (DomainSchemaHandler timeout, persistent)
