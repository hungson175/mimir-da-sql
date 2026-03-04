# Mimir Distill — Cumulative Summary

> Updated after each batch. This is the "what we know so far" file.
> **Last updated:** 2026-03-03, after Batch 8 (38 queries total)

## Rounds Completed

| Batch | Target Month | Category | Queries | Score | Key Learning |
|-------|-------------|----------|---------|-------|-------------|
| R1 | Feb 2026 | Simple (6 domains) | Q1-Q6 | 3/6 (50%) | Feb 29 bug, CC_STATUS mismatch, Moni filter |
| B2 | Jan 2026 | Simple (repeat) | Q7-Q15 | 7/9 (78%) | Jan avoids Feb bug, most domains match |
| B3 | Jan 2026 | Medium (GROUP BY) | Q10-Q13 | 4/4 (100%) | Paylater segment breakdown, TTT MFU types |
| B4 | Jan 2026 | Large (TTT AUM) | Q14-Q15 | 1 match, 1 close | AUM = no churn filter, sub-channel GMV summing |
| B5 | Dec/Jan | Revenue MoM | Q16-Q20 | 4/5 (80%) | Paylater requires result_code + trans_type filters |
| B6 | Dec/Jan | New user growth | Q21-Q25 | 3/5 (60%) | REGEXP_EXTRACT context, InsurTech alt table |
| B7 | Jan 2026 | Top contributors | Q26-Q29 | 2 match, 1 close, 1 error | service_category not usecase, CC_STATUS optional for revenue |
| B8 | Jan 2026 | Daily trends | Q30-Q33 | 1 match, 2 close, 1 error | PL column names pattern, CC_STATUS randomness |

## Cumulative Accuracy

| Domain | Tests | Match/Close | Error | Accuracy | Trust |
|--------|-------|-------------|-------|----------|-------|
| Paylater | 8 | 6 | 2 | 75% | High (but fix column names) |
| Vay Nhanh | 7 | 7 | 0 | 100% | High |
| TTT | 7 | 6 | 1 | 86% | High |
| InsurTech | 7 | 3 | 4 | 43% | Low (CC_STATUS random bug) |
| FI Solutions (CLO) | 5 | 5 | 0 | 100% | High |
| Moni/Chatbot | 4 | 3 | 1 | 75% | High |
| **TOTAL** | **38** | **30** | **8** | **~79%** | — |

## Bug Catalog

| # | Bug | Severity | Domains | Frequency | Workaround |
|---|-----|----------|---------|-----------|------------|
| 1 | Feb 29 in non-leap years | CRITICAL | All | Every Feb query | Use non-Feb months |
| 2 | CC_STATUS 'Thành Công' vs 'SUCCESS' | HIGH | InsurTech | Random (~50%) | Always use 'SUCCESS' |
| 3 | Wrong column names on PAYLATER_ALL_TRANS | HIGH | Paylater | Always | Map: usecase→service_category, agent_id→user_id, trans_id→doesn't exist |
| 4 | Missing result_code/trans_type filters | HIGH | Paylater | Sometimes | Always add result_code=0 + trans_type filter |
| 5 | Missing MAU_TYPE/MFU_TYPE filters | MEDIUM | TTT | Rarely | Context-dependent: AUM=no filter, MAU/MFU=filter |

## 20 Lessons Learned (consolidated in lt-memory/errors/sql-gotchas.md)

1. API field is `user_email` not `user`
2. InsurTech date column is `trans_date` not `CC_DATE`
3. BigQuery reserved word `GROUPS`
4. QLCT AGE_GROUP exact format with brackets
5. PAYLATER_MAU_SEGMENT is 1-row-per-user-per-month
6. PAYLATER_ALL_TRANS: service_category, user_id, COUNT(*), created_date, amount
7. PAYLATER_ALL_TRANS: must filter result_code=0 + trans_type
8. TTT: always filter MAU_TYPE/MFU_TYPE (except AUM)
9. TTT: full month scan, not end-of-month snapshot for MAU
10. TTT: REGEXP_EXTRACT for total dedup, raw user_id when GROUP BY IS_MP
11. TTT: sum ALL sub-channel columns for cashin/cashout
12. TTT: include Money Pool in MAU reporting
13. SQL AND/OR precedence — always parenthesize OR
14. Moni MAU = PRODUCT='MONI' AND ACTION='CHAT'
15. Vay Nhanh: DISBURSED_DATE vs CREATED_DATE semantics
16. FI Solutions CLO: STATUS_CODE includes CONTRACT_SIGNED
17. InsurTech CC_STATUS = 'SUCCESS' (English, not Vietnamese)
18. InsurTech CC_STATUS optional for revenue SUM
19. TTT AUM: no MFU_TYPE filter (churned users hold balances)
20. Deduplication pattern for demographics join (ROW_NUMBER)
