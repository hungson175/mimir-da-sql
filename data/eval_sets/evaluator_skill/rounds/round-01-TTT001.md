# Round 01: TTT001

## Input
- **Gold ID:** TTT001
- **Domain:** TTT (Tui Than Tai)
- **Difficulty:** Simple
- **Category:** Aggregation
- **Original Question:** "AUM tháng 1 bao nhiêu?"
- **Reversed Question:** "Tong AUM cua Tui Than Tai vao cuoi thang 1/2026 la bao nhieu? KHONG can chart."
- **Golden SQL:** `SELECT SUM(BALANCE) AS total_aum FROM momovn-prod.BU_FI.mart_ttt_daily_user_record WHERE GRASS_DATE = '2026-01-31'`
- **Golden Result:** ~11.57T VND

## Claude DA Result
- **SQL:** `SELECT IS_MP, SUM(balance) AS aum_vnd, COUNT(DISTINCT USER_ID) AS accounts FROM momovn-prod.BU_FI.mart_ttt_daily_user_record WHERE GRASS_DATE = LAST_DAY(DATE '2026-01-01') GROUP BY IS_MP`
- **Result:** 11,572,764,783,859 VND (Individual 9.95T + Money Pool 1.62T)
- **Tokens:** 25,077 | **Duration:** 49s

## Mimir Result
- **SQL:** `SELECT SUM(BALANCE) as Total_AUM, IS_MP FROM momovn-prod.BU_FI.mart_ttt_daily_user_record WHERE GRASS_DATE = '2026-01-31' GROUP BY IS_MP`
- **Result:** 11,572,764,800,000 VND
- **Tokens:** 13,910 | **Duration:** 89s

## Scoring
| Criterion | Weight | Claude DA | Mimir |
|-----------|--------|-----------|-------|
| SQL Similarity | 0.5 | 0.5 (correct logic, extra GROUP BY harmless) | 0.5 (identical logic) |
| Numerical Match | 0.5 | 0.5 (exact) | 0.5 (rounded, negligible diff) |
| **Total** | **1.0** | **1.0** | **1.0** |

## Observations
1. Both independently added GROUP BY IS_MP (Individual vs Money Pool) — not in golden SQL but reasonable
2. Claude DA used LAST_DAY() function (more robust); Mimir hardcoded '2026-01-31' (same as golden)
3. Claude DA added COUNT(DISTINCT USER_ID) — extra info, not penalized
4. Mimir result slightly rounded (16K diff on 11.57T = 0.00000014% error)
5. Simple aggregation = both systems handle well. Real differentiation will come from Complex queries.

## Learnings for Skill
- Simple single-metric questions on clean tables → both systems score 1.0
- The reversed question worked well — natural language, no schema leaks
- "cuoi thang" was correctly interpreted as end-of-month snapshot by both
- Need to test Moderate/Complex to find real differences
