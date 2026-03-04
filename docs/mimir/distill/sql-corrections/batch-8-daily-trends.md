# SQL Corrections — Batch 8: Daily Trends (Jan 2026)

> CEO Question: "Xu hướng giao dịch các sản phẩm FS theo ngày trong tháng 1/2026?"

## Q30: Paylater Daily — CLOSE (correct filters, wrong column names)

Mimir used correct filters (`result_code=0`, `trans_type IN ('pay_pl','pay_ins','send_pl')`) but got 2 column names wrong:
- `agent_id` → should be `user_id` (for COUNT DISTINCT users)
- `trans_id` → should be `*` or valid column (for COUNT transactions)

GMV (`SUM(amount)`) would match since column name is correct.

**Learning:** Mimir consistently gets PAYLATER_ALL_TRANS column names wrong. Known errors:
1. `usecase` → `service_category` (Batch 7)
2. `agent_id` → `user_id` (this batch)
3. `trans_id` → doesn't exist

**Paylater daily trend (Jan 2026):** Clear declining pattern from 525K trans/day (Jan 5) → 332K (Jan 31). GMV drops from 160B → 47B. Likely Tet preparation effect.

## Q31: Vay Nhanh Daily — MATCH
All 31 days exact match. Same SQL: `SUM(DISBURSED_AMOUNT) GROUP BY DISBURSED_DATE`.
VN relatively stable at ~100B/day, no strong trend.
**Nothing new.**

## Q32: TTT Daily Cashin/Cashout — CLOSE + LESSON

Mimir added `GROUP BY is_mp` for Individual vs Money Pool breakdown per day — richer than our aggregate query.

**Key insight from Mimir SQL:** Mimir uses the exact same sub-channel summing pattern we learned in Batch 4. This is now fully confirmed as the correct pattern for TTT GMV.

**TTT daily pattern:** Cashout > cashin almost every day (net outflow ~50-130B/day). Interest stable at ~1.2B/day.

**Mimir SQL confirms:**
```sql
SUM(coalesce(cashin_gmv,0) + coalesce(cashin_p2p_gmv,0) + ...) AS total_cashin_gmv
SUM(coalesce(cashout_napas_gmv,0) + coalesce(cashout_payment_gmv,0) + ...) AS total_cashout_gmv
```

## Q33: InsurTech Daily — ERROR (CC_STATUS bug AGAIN)

**Mimir used `CC_STATUS = 'Thành Công'` (Vietnamese) → 0 results!**

This is the THIRD occurrence of this bug:
- Round 1 (Feb): Vietnamese → 0 results
- Batch 2 Q6 (Jan): English 'SUCCESS' → correct results
- Batch 5 Q16 (Jan revenue): English 'SUCCESS' → correct results
- Batch 7 Q27 (Jan product): No filter → close results
- **This batch Q33 (Jan daily): Vietnamese 'Thành Công' → 0 results**

**Pattern:** Mimir's CC_STATUS choice appears RANDOM — sometimes English, sometimes Vietnamese. No clear trigger for which one it picks. The Vietnamese one always fails.

---

## Summary

| # | Domain | Verdict | Key Learning |
|---|--------|---------|-------------|
| Q30 | Paylater | CLOSE | Mimir gets PL column names wrong (agent_id, trans_id) |
| Q31 | Vay Nhanh | MATCH | — |
| Q32 | TTT | CLOSE | Mimir adds IS_MP breakdown, confirms sub-channel pattern |
| Q33 | InsurTech | **ERROR** | CC_STATUS='Thành Công' bug recurs — random, unpredictable |

**Score: 2/4 match/close, 0 skip, 2 close, 0 mismatch**
Wait — let me recount: Q30 CLOSE, Q31 MATCH, Q32 CLOSE, Q33 ERROR = 1 match, 2 close, 1 error

**New lessons: 2 (PL column names pattern, CC_STATUS randomness confirmed)**
**Running total: 38 queries, 38 SQL pairs, 20 lessons**
