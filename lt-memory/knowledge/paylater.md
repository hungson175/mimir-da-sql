# Knowledge: Paylater
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-06

## SQL Gotchas

### PAYLATER_ALL_TRANS: `created_date` + `amount`, NO `month_trans` or `gmv` (2026-03-06)
Date = `created_date` (DATE). Amount = `amount`. NO `month_trans` (that's in MAU_SEGMENT). NO `gmv` column.
Jan 2026: 1.45M MAU, 412K txns/day, 78.9B/day GMV, 191K avg ticket.
Mar 1-5 2026: 272K DAU/day avg, 128B/day GMV (+62%), 272K avg ticket (+42%).
+62% driven by BOTH more users (+13%) AND higher ticket (+42%).

### PAYLATER insurance breakdown (2026-03-06)
service_category='INSURANCE' in PAYLATER_ALL_TRANS = mix of life insurance AND P&C.
Life insurance (newvertical='INSURTECH – PAYMENT'): AIA 7.2M avg, Dai-ichi 5.6M, Prudential 5.98M, FWD 6.1M.
P&C insurance (newvertical='INSURTECH – DISTRIBUTION'): PVI 128K avg, Bảo Việt 65K, Bảo Long 93K.
Key: 'PAYMENT' = collecting premiums from existing policy holders. 'DISTRIBUTION' = selling new policies.

### PAYLATER_MAU_SEGMENT: 1-Row-Per-User-Per-Month, User Column is `agent_id` (2026-02-25)
User column is `agent_id` (NOT `user_id` — doesn't exist). Each user has exactly 1 row per `month_trans`.
The `usecase` column = user's PRIMARY usecase for that month, NOT per-transaction.
Cannot count "distinct usecases per user" from this table — always 1.
For transaction-level data, use `PAYLATER_ALL_TRANS`.

### PAYLATER_ALL_TRANS: Column Names and Filters (2026-02-25)
**Mimir gets multiple column names wrong.** Verified correct names:
- Use case: `service_category` (NOT `usecase`)
- User ID: `user_id` (NOT `agent_id`)
- Transaction count: `COUNT(*)` (NOT `COUNT(trans_id)` — doesn't exist)
- Date: `created_date`
- Amount: `amount`

**Required filters for business metrics:**
```sql
WHERE result_code = 0                                    -- success only
  AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')     -- payment types only
```

Without filters: counts ~2.1x inflated, GMV ~3.0x inflated.

### PAYLATER_MAU_SEGMENT vs PAYLATER_ALL_TRANS (2026-03-03)
Two different tables, different column names:
- `PAYLATER_MAU_SEGMENT`: user = `agent_id`, date = `month_trans`, segment = `MAU_segment`
- `PAYLATER_ALL_TRANS`: user = `user_id`, date = `created_date`, usecase = `service_category`

### Paylater DPD: Experiment Table Has Per-Day Structure (2026-03-03)
`20260201_PAYLATER_RECOVERY_EXPERIMENT_CALLBOT_OUTSTANDING_BY_DPD` is NOT a simple snapshot.
The `dpd` column has negative values (before due) and positive values (past due). Recovery operations table.

### Paylater DPD30 ETL Stopped (2026-03-03)
`PAYLATER_RAR_DPD30_RISK_REPORT` exists but ETL stopped ~Feb 2025. Latest data = 13 months old.

### Penalty Rate: Correct Methodology (2026-03-09)
Penalty trans_types: `pay_pl_fee_penalty`, `record_pl_pen_fee_dpd1/5/10/15`.
Denominator: users with `trans_type IN ('pay_pl','send_pl')` (purchase txns only, NOT `pay_ins`).
`pay_ins` = insurance payment, NOT penalty.
Jan 2026: 308,880 / 1,445,620 = **21.37%**. Feb 2026: 289,134 / 1,388,950 = **20.82%**.
DPD cascade: DPD1 291K → DPD5 181K (62%) → DPD10 127K (43%) → DPD15 116K (40%).
Previous "6.36%" figure was penalty_txn_count / purchase_txn_count (tx-level, not user-level). User-level = ~21%.

### Mimir Paylater MAU Definition (2026-03-04)
Mimir Paylater MAU = from PAYLATER_MAU_SEGMENT (all registered/approved users).
Our BQ MAU = users with result_code=0 AND trans_type IN ('pay_pl','pay_ins','send_pl').
When asking Mimir: use 'người dùng có giao dịch thành công' (users with successful transactions).

## Business Insights

### Paylater = Revolving Credit, No Fixed Tenor (2026-03-03)
Monthly billing cycle (credit card style), NOT fixed-term loans.
No `tenor` or `loan_term` column in any Paylater BQ table.

### Revenue Model: Subscription-Like Fee (2026-03-03)
- Management fee (`pay_pl_fee_manage`): ~30K VND/month per active billing account
- Penalty fee (`pay_pl_fee_penalty`): ~52K VND per late payment event
- DPD1 penalty (`record_pl_pen_fee_dpd1`): ~28K VND
- Total fee revenue Jan 2026: 69.8B VND (1.45M borrowers × avg 48K VND/month)

### Revenue Split: 40% MoMo / 40% Bank / 20% Risk (CONFIRMED) (2026-03-04)
Tables: `ANHNGUYEN61_PAYLATER_TPB_REVENUE`, `ANHNGUYEN61_PAYLATER_MBV_REVENUE`
- TPB: 6.3M accounts | MBV: 1.2M accounts
- Jan 2026 gross: 109.31B (includes fees + interest)
- MoMo true Paylater net: ~56B/month (43.49B TPB + ~12.58B MBV)
- DO NOT use 69.8B as MoMo's net — that's gross before partner split

### Asset-Light Credit Distribution Model (2026-03-04)
MoMo = scheme/distributor (earns 40%), TPBank = credit issuer (bears risk, earns 40%).
Collection risk rate (DPD31+): consistently 5.57-5.99% of portfolio (Oct 2025 - Jan 2026).

### 18% Credit Utilization — 82% Headroom (2026-03-04)
- TPB: 9.253T (1.9M ACTIVED × 4.88M avg limit)
- MBV: 2.1T (348K ACTIVED × 6.03M avg limit)
- Outstanding: ~2.035T. Utilization: 17.9%.
- Largest unrealized growth lever — no new users needed.

### Early Repayment: 10.8-11.8% Stable (2026-03-04)
Each month 10.8-11.8% repay before billing. Fee revenue = billed accounts only (89-90%).

### Dormant: 87% LAPSED, Only 13% Never-Used (2026-03-04)
Of 1.18M dormant TPB accounts: 995K (87%) = ever-transacted lapsed users.
66% of lapsed = warm (1-3 months inactive). Act within 60 days.

### New Borrower Acquisition: Steady 88-122K/Month (2026-03-04)
Not accelerating. Sep = structural low, Nov = peak. Dormant activation = untested opportunity.

### Campaign Timing: Thursday-Saturday = Peak (2026-03-04)
Saturday highest GMV (407B), Wednesday lowest (291B). Launch Thursday, target Fri-Sat.

### MBV Growing 35x Faster Than TPB (2026-03-09)
MoMo revenue share (Oct 25 → Feb 26):
- TPB: 39.9B → 44.8B (+12%)
- MBV: 1.1B → 5.5B (+428%)
MBV share: 2.6% → 11.0% of total PL revenue. MBV = premium segment (6.03M avg limit vs TPB 4.88M).
MBV joined Nov 17, 2025 — same month as SHB CLO. Revenue tables: `ANHNGUYEN61_PAYLATER_TPB_REVENUE` (audit_month, revenue_shared, revenue_total) and `ANHNGUYEN61_PAYLATER_MBV_REVENUE` (audit_month, revenue_shared, fee_shared).

### Paylater Mar Post-Tet Surge = UTILITIES (2026-03-09)
Mar 1-8 daily GMV +53% vs Feb. 71% of growth = UTILITIES category (26.8B → 55.5B/day).
Post-Tet bill payment catch-up (electricity/water/internet). 97% returning users, only 3% new.
Seasonal, not structural. Expect normalization mid-March.

### P2B Fee Erosion: VietQR Cannibalization (2026-03-09)
Total P2B fees: Jan 45.0B → Mar proj ~33.8B (-25%). Every VietQR txn (38 VND) replaces Direct P2B (870 VND) = 832 VND revenue loss per migrated txn. VietQR fee/txn RISING (32→38, +15%) but Direct P2B fee/txn FALLING (1,200→870, -30%).

## Mimir Trust
- MAU: MEDIUM (registered vs transacting definition mismatch)
- Column names on ALL_TRANS: LOW (3 known errors)
- MAU_SEGMENT: HIGH (handles correctly)


