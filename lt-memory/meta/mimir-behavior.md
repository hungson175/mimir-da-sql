# Mimir Behavior Observations

> Patterns noticed about how Mimir generates SQL and answers.
> Updated by dis-mimir rounds and regular DA work.

## Accuracy by Domain

| Domain | Rounds Tested | Accuracy | Notes |
|--------|--------------|----------|-------|
| Paylater | 1 | MATCH | Simple COUNT DISTINCT on clean 1-row-per-user table |
| Vay Nhanh | 1 | ERROR | Feb 29 date bug; also missing STATUS filter |
| TTT | 1 | ERROR | Feb 29 date bug; also missing MAU_TYPE filter (would return 11M vs 3M) |
| InsurTech | 1 | MISMATCH | CC_STATUS metadata says Vietnamese but data stores English |
| Moni (Expense Mgmt) | 1 | MATCH | Mimir correctly filters PRODUCT='MONI' AND ACTION='CHAT'. WE were wrong (no filter). |
| Chatbot Moni | 1 | MATCH | Simple COUNT DISTINCT conversation_id |

## Common Mimir Mistakes

1. **Feb 29 in non-leap years (CRITICAL)** — Mimir generates `BETWEEN '...-02-01' AND '...-02-29'` regardless of leap year status. Breaks all Feb queries in 2025, 2026, 2027. Confirmed on Vay Nhanh and TTT domains (Round 1, 2026-03-03).

2. **Trusts metadata descriptions literally** — InsurTech metadata describes CC_STATUS as "Thành Công/Thất Bại" (Vietnamese), but actual stored values are English 'SUCCESS'/'CANCEL'. Mimir filters on Vietnamese string and gets 0 results.

3. **~~Over-filters ambiguous product names~~ CORRECTED** — Mimir was RIGHT. Moni is the chatbot inside QLCT. `PRODUCT='MONI' AND ACTION='CHAT'` is the correct Moni MAU filter. Our DA was wrong to use no filter. Jan 2026: 290K, Feb 2026: 66K.

4. **Missing business-logic filters on TTT** — Does not add `MAU_TYPE != '0.Churn'` when counting TTT users. Would return 11M total accounts instead of ~3M active users.

## Common Mimir Strengths

1. **Clean 1-row-per-entity tables** — Paylater MAU (PAYLATER_MAU_SEGMENT) and Chatbot conversations (QLCT_CHATBOT_CONVERSATION_LOG) are simple, well-defined tables. Mimir gets these exactly right.

2. **Correct column/table selection** — Even when the query logic has bugs, Mimir picks the right tables and columns. It correctly uses agent_id for Paylater, REGEXP_EXTRACT for TTT USER_ID dedup, and conversation_id for Chatbot.

3. **Good SQL structure** — Mimir's SQL is generally well-formed. Issues are in filter values and date handling, not in query structure.

## SQL Generation Patterns

- Mimir tends to: use FORMAT_TIMESTAMP for date filters instead of BETWEEN (less efficient but functional)
- Mimir often misses: business-logic filters (MAU_TYPE, STATUS) that aren't obvious from column names
- Mimir's date handling: Defaults to '...-02-29' for February without leap-year check. Uses correct dates for other months.

## Trust Calibration

| Trust Level | Domains | When to Trust |
|-------------|---------|---------------|
| High | Paylater, Chatbot Moni, Moni (Expense Mgmt) | Simple aggregations on clean tables. Mimir knows domain semantics well. |
| Medium | Vay Nhanh (non-Feb), TTT (if MAU_TYPE added) | Needs date fix and business-logic filter verification |
| Low | InsurTech | Metadata-vs-reality mismatches (CC_STATUS) |
