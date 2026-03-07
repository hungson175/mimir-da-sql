# Knowledge: OTA (Online Travel Agency)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-06

## SQL Gotchas

### Correct Table and Column Names (2026-03-06)
Main table: `momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE`
- Date: `DATE` (NOT `EVENT_DATE` — memory entry 16 in domain file)
- User: `user_payment`
- Status: `STATUSID = 2` (success)
- Airline filter: `sub_cate = '01. AIRLINE'`
- Hotel filter: `group_sub_cate = '03. HOTEL'`
- GMV: `TOTAL_AMOUNT`

### Mimir OTA Domain: TIMEOUT (2026-03-06)
Domain `7172ddb9-dc48-40d4-bff7-1aa74f6ff435` always timeouts (DomainSchemaHandler).
**Always use BQ directly for OTA queries.** Mimir is not usable for this domain.

## Business Insights

### Jan 2026 Baselines (2026-03-06)
| Category | Users | GMV | Transactions | Avg Ticket |
|----------|-------|-----|--------------|------------|
| Airline | 87,788 | 289.8B VND | 136,499 | 2.12M VND |
| Hotel | 19,060 | 12.1B VND | 32,762 | 370K VND |

**Top merchants by users:**
1. Vietjet Air: 55,859 users, 147.1B GMV
2. VN Airlines: 20,786 users, 78.2B GMV
3. Go2Joy (hourly hotel): 17,182 users, 9.05B GMV
4. Vietravel Airlines: 6,937 users, 16.3B GMV
5. Bamboo Airways: 6,827 users, 15.5B GMV

Airline dominates: 87.8K users (4.6x hotels). Hotel GMV avg ticket much lower (370K) vs airline (2.12M).
Vietjet = dominant airline at 64% of airline users.
Hourly hotel (Go2Joy) has 17K users — significant domestic travel category.

## Mimir Trust
- All queries: UNAVAILABLE (DomainSchemaHandler timeout, persistent)
- Use BQ directly for all OTA queries
