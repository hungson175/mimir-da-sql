# Knowledge: Tui Than Tai (TTT)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-04

## SQL Gotchas

### Always Filter by MAU_TYPE or MFU_TYPE (2026-03-02)
Table stores ALL users including churned. Without filter, COUNT(DISTINCT USER_ID) = ~11M (total ever), not active.

| Metric | Filter | Jan 2026 |
|--------|--------|----------|
| Total accounts | None | 11.1M |
| MFU (funded) | `MFU_TYPE != '0.Churn'` | 1.67M |
| MAU (active) | `MAU_TYPE != '0.Churn'` | 3.46M (Individual 3.0M + Money Pool 463K) |

### Correct MAU Query Pattern (2026-03-02)
Use full month date range (NOT end-of-month snapshot), REGEXP_EXTRACT for USER_ID dedup, GROUP BY IS_MP:
```sql
SELECT t1.IS_MP,
    COUNT(DISTINCT (CAST(REGEXP_EXTRACT(t1.USER_ID, r'\d+') AS STRING))) AS unique_mau_users
FROM momovn-prod.BU_FI.mart_ttt_daily_user_record AS t1
WHERE t1.GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND t1.MAU_TYPE != '0.Churn'
GROUP BY t1.IS_MP
```

Mistakes to avoid:
- Do NOT use single end-of-month snapshot
- Do NOT use raw USER_ID — always REGEXP_EXTRACT for dedup
- Group by IS_MP to separate Individual vs Money Pool

### MAU_TYPE vs MFU_TYPE: Different Metrics! (2026-03-02)
- **MAU_TYPE**: Monthly Active Users — anyone who used/visited TTT
- **MFU_TYPE**: Monthly Funded Users — anyone who has money in TTT
- Example: Dec 2025 Retain — MAU=2.79M, MFU=2.49M
- Churn pool is massive: ~12.2M churned vs ~3.7M active

### Include Money Pool in MAU (2026-03-02)
Always GROUP BY IS_MP. Individual ~3.0M + Money Pool ~463K = Total 3.46M (not just 3.0M).

### USER_ID Dedup: Context Matters (2026-03-02)
- **Total unique humans:** Use REGEXP_EXTRACT — same person can appear as both Individual and Money Pool
- **Per-IS_MP:** Raw user_id (higher, counts accounts) or REGEXP_EXTRACT (lower, counts humans)

### AUM: End-of-Month Snapshot, NOT Sum Across Days (2026-03-03)
**Mimir gets AUM wrong** — sums BALANCE across all days (~30x inflation).
```sql
-- CORRECT: end-of-month snapshot
WHERE GRASS_DATE = LAST_DAY(DATE '2025-01-01')
```
Jan 2026 AUM: Individual 9.95T + Money Pool 1.62T = **11.57T VND total**

### AUM: Do NOT Filter by MFU_TYPE (2026-03-03)
AUM measures total balance across ALL accounts, including churned (may still hold balances).
- AUM query: NO MFU_TYPE filter
- MAU query: `MAU_TYPE != '0.Churn'`
- MFU query: `MFU_TYPE != '0.Churn'`

### Cashin/Cashout: Sum ALL Sub-Channel Columns (2026-03-03)
`cashin_gmv` is NOT total — it's one sub-channel. Must sum all:
**Cashin:** `cashin_gmv` + `cashin_p2p_gmv` + `cashin_va_gmv` + `cashin_ai_gmv` + `cashin_stock_gmv` + `cashin_payout_gmv`
**Cashout:** `cashout_gmv` + `cashout_napas_gmv` + `cashout_payment_gmv` + `cashout_stock_gmv` + `cashout_p2p_gmv` + `cashout_mp_gmv` + `cashout_payment_mp_gmv`
Always COALESCE(col, 0). Using just `cashin_gmv` = ~50% of actual.

### Column Names (2026-03-03)
- Interest: `interest` (NOT `interest_gmv`)
- Balance: `balance` (NOT `saving_balance`)
- Average balance: `avg_balance`

## Business Insights

### Interest Column = Paid to Users (MoMo's Cost) (2026-03-04)
`interest` = interest credited to users per day. Jan 2026: ~1,049M/day Individual + 172M/day Money Pool.
Monthly: ~37.95B paid to savers. This is MoMo's cost, NOT income.
MoMo's TTT income = 11.57T AUM × 6% / 12 = 57.9B gross - 37.95B = ~20B net spread.

### Money Pool: Cohort Deepening Pattern (2026-03-04)
Jan 2025 cohort: start 77.5K users × 1.95M avg → 14m later 71K users × 3.65M avg (+87% balance growth).
User attrition -8.4%. Weak savers churn months 1-3, power savers remain and compound.

### Unfunded Users: 53% Ever-Funded vs 47% Never-Funded (2026-03-04)
Of 1.17M unfunded Individual MAU: 623K (53%) = previously funded (reactivation 3-5× easier), 548K (47%) = never funded.

### TTT User Count: 11.6M is WRONG (2026-03-06)
The "11.6M users" figure that appeared in DA_PROMPT, domain-router, and research files was a BUG — it counted total-ever accounts (including all churned). Actual metrics:
- Total accounts ever: ~11.1M (mostly churned)
- MAU (active): ~3.46M (Individual 3.0M + Money Pool 463K)
- MFU (funded): ~1.67M
Never use 11.6M as TTT user count. Always query with MAU_TYPE filter.
Source: user correction

### Mimir REGEXP_EXTRACT Bug: Double-Escaping (2026-03-09)
When question contains `r'\d+'` regex, Mimir double-escapes to `r"\\d+"` → matches nothing → returns 0.
**Workaround:** Never include regex patterns in Mimir questions. Ask in plain Vietnamese:
- BAD: "COUNT DISTINCT REGEXP_EXTRACT(USER_ID, r'\d+') WHERE MAU_TYPE LIKE '%New%'"
- GOOD: "Bao nhiêu user mới (MAU_TYPE chứa New) trong tháng 1/2026? Đếm unique user."

### TTT Used as Payment Source (FUNDID=6 in FI_TRANS) (2026-03-06)
4.8% of TTT MAU use TTT balance for direct payments. Top uses:
- Loan repayment from TTT: 125,870 users, 412.9B Jan 2026 (LARGEST)
- Credit card repayment: 25,786 users, 109.7B
- Insurance premium payment from TTT: 3,165 users, 14.9B
TTT is a savings account (3.3M VND avg balance), not a spending float. The 4.8% payment users
are a "TTT flywheel" — earn interest in TTT, then repay loans from there. High-value segment.

### TTT Interest Rates — Current (2026-03-06)
Individual: 3.74–3.89% annual. Money Pool: 3.70–3.91% annual. Both ~3.85% avg.
Below typical bank savings rates (4-5%). Stickiness = ecosystem convenience, not rate.

### TTT 2025 vs 2026 Seasonal Pattern (2026-03-06)
2025: Money Pool GREW through Feb-Mar (249B → 469B, no post-Tet dip).
2026: Money Pool PEAKED Feb 20 at 1.796T, then DECLINING to 1.738T by Mar 5 (-3.2%).
Pattern is DIFFERENT from 2025 — not purely seasonal, likely maturation of product growth phase.
2026 Money Pool at 1.74T = 4x of Mar 2025 (430B). Growth normalizing, not structural crisis.

### TTT Whales: Save+Insure, Don't Borrow (2026-03-09)
14,721 users with >100M balance = 0.88% of MFU but hold 20.5% of AUM (2.37T / 11.57T).
Top whale: 1.225B VND (user 33946413). Top 10 = ALL Individual, 9 of 10 use ZERO FS products.
Cross-sell: Paylater 10.2% (below avg), Vay Nhanh 0.5% (near zero), InsurTech 14.5% (3x above avg).
85.5% of whales (12,587 users) have NO insurance = premium upsell target.

## Mimir Trust
- MAU/MFU: HIGH (exact match Feb 2026, correct REGEXP_EXTRACT + MAU_TYPE filter)
- AUM: HIGH (bug FIXED as of 2026-03-06 — Mimir now uses end-of-month snapshot, not sum across days)
- General: HIGH
- Feb 29 bug: persists but Mimir self-corrects with retry
