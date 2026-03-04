# SQL Gotchas

## Mimir API: Field Name is `user_email`

The send_question API field is `user_email`, NOT `user`. Using `user` returns 500 NullPointerException.

```json
{"user_email":"son.pham9@mservice.com.vn","domain_id":"...","question":"..."}
```

## InsurTech: Date Column is `trans_date`, Revenue is `final_rev`

The date column in `att_fi_ins_nl_ver2` is `trans_date` (NOT `CC_DATE`). User ID column is `debitor`. Revenue column is `final_rev` (NOT `REVENUE` — that column doesn't exist). Also available: `rev_after_sharing`, `amount`.

## BigQuery Reserved Words

`GROUPS` is a reserved keyword in BigQuery. Use `user_groups`, `grp`, or `user_grp` instead.

## SEMANTIC_QLCT_VISIT AGE_GROUP Format

The actual values are:
```
UNKNOWN
[1]. <18 y/o
[2]. 18 - 22 y/o
[3]. 23 - 26 y/o
[4]. 27 - 30 y/o
[5]. 31 - 35 y/o
[6]. 36 - 40 y/o
[7]. >40 y/o
```

Use exact string match (`= '[2]. 18 - 22 y/o'`), not LIKE patterns. The ranges are 23-26 and 27-30 (not 23-25, 26-30 as you might guess).

## PAYLATER_MAU_SEGMENT: 1-Row-Per-User-Per-Month, User Column is `agent_id`

User column is `agent_id` (NOT `user_id` — that column doesn't exist in this table). Contrast with PAYLATER_ALL_TRANS where user column IS `user_id`.

Each user has exactly 1 row per `month_trans`. The `usecase` column is the user's primary usecase for that month, NOT per-transaction. You cannot count "distinct usecases per user" from this table — it will always be 1. For transaction-level data, use `PAYLATER_ALL_TRANS` instead.

## PAYLATER_ALL_TRANS: Column Names and Filters

**Mimir gets multiple column names wrong on this table.** Verified correct names:
- Use case: `service_category` (NOT `usecase`)
- User ID: `user_id` (NOT `agent_id`)
- Transaction count: `COUNT(*)` (NOT `COUNT(trans_id)` — `trans_id` doesn't exist)
- Date: `created_date`
- Amount: `amount`

`PAYLATER_ALL_TRANS` contains failed AND non-payment transactions. Without filtering, counts and GMV are ~3x inflated.

**Required filters for business metrics:**
```sql
WHERE result_code = 0                                    -- success only
  AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')     -- payment types only
```

| Filter | Without | With | Ratio |
|--------|---------|------|-------|
| Jan 2026 trans | 27.1M | 12.8M | 2.1x |
| Jan 2026 GMV | 7.34T | 2.45T | 3.0x |

**Known trans_types:** `pay_pl` (direct payment), `pay_ins` (installment), `send_pl` (send via Paylater).

## TTT mart_ttt_daily_user_record: Always Filter by MAU_TYPE or MFU_TYPE

The table stores ALL users including churned accounts. Without filtering, `COUNT(DISTINCT USER_ID)` returns ~11M (total accounts ever), not actual active users.

| Metric | Filter | Jan 2026 (snapshot) | Jan 2026 (full month) | Feb 2026 (full month) |
|--------|--------|---------------------|----------------------|----------------------|
| Total accounts | None | 11.1M | — | — |
| MFU (funded users) | `MFU_TYPE != '0.Churn'` | 1.67M | — | — |
| MAU (active users) | `MAU_TYPE != '0.Churn'` | 720K (single day) | 3.46M (Individual 3.0M + Money Pool 463K) | 3.45M (Individual 3.01M + Money Pool 434K) |

**⚠ The 720K figure was from a single-day snapshot.** Full-month scan returns ~3.4M MAU. Always use full-month range for accurate MAU.

**Always specify which metric you mean.** "TTT users" is ambiguous — use "TTT MAU" or "TTT MFU" or "TTT total accounts."

### Correct MAU Query Pattern

Use **full month date range** (not just end-of-month snapshot), `REGEXP_EXTRACT` for USER_ID dedup, and group by `IS_MP`:

```sql
SELECT
    t1.IS_MP,
    COUNT(DISTINCT (CAST(REGEXP_EXTRACT(t1.USER_ID, r'\d+') AS STRING))) AS unique_mau_users
FROM
    momovn-prod.BU_FI.mart_ttt_daily_user_record AS t1
WHERE
    t1.GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
    AND t1.MAU_TYPE != '0.Churn'
GROUP BY
    t1.IS_MP
```

**Key mistakes to avoid:**
- Do NOT use single end-of-month snapshot (`GRASS_DATE = '2026-01-31'`) — scan the entire month
- Do NOT use raw `USER_ID` — always `REGEXP_EXTRACT(USER_ID, r'\d+')` for proper dedup
- Group by `IS_MP` to separate Individual vs Money Pool accounts

## SQL Operator Precedence: Always Parenthesize OR Clauses

`WHERE A AND B OR C` evaluates as `(A AND B) OR C`, NOT `A AND (B OR C)`.

**Wrong:**
```sql
WHERE IS_MP = 'Individual' AND MOD(EXTRACT(DAY FROM GRASS_DATE), 30) = 0 OR EXTRACT(DAY FROM GRASS_DATE) = 1
```
This applies `IS_MP` only to the first condition; day=1 rows get no IS_MP filter.

**Correct:**
```sql
WHERE IS_MP = 'Individual' AND (MOD(EXTRACT(DAY FROM GRASS_DATE), 30) = 0 OR EXTRACT(DAY FROM GRASS_DATE) = 1)
```

## Moni MAU: Must Filter PRODUCT='MONI' AND ACTION='CHAT'

Moni is the AI chatbot **inside** the QLCT (expense management) product. The `SEMANTIC_QLCT_VISIT` table has three user segments:

| PRODUCT | ACTION | What it is | Feb 2026 |
|---------|--------|------------|----------|
| QLCT | VISIT | Expense tracking visitors | 1,668,009 |
| MONI | VISIT | Saw Moni but didn't chat | 91,536 |
| MONI | CHAT | Actually chatted with Moni | 66,498 |

**"Moni MAU" = `PRODUCT='MONI' AND ACTION='CHAT'`**. Without this filter, you get all QLCT visitors (1.69M) which is NOT Moni MAU.

```sql
-- CORRECT Moni MAU
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE PRODUCT = 'MONI' AND ACTION = 'CHAT' AND MONTH = '2026-02-01'
```

Known baselines: Jan 2026 = 290K, Feb 2026 = 66K.

## Vay Nhanh: DISBURSED_DATE vs CREATED_DATE, STATUS Matters!

- **"don vay" (loan applications)** → use `CREATED_DATE`, no STATUS filter needed
- **"giai ngan" (disbursements)** → use `DISBURSED_DATE`
- **⚠ STATUS filter is NOT redundant!** DISBURSED_DATE is populated for BOTH statuses:
  - `DISBURSED`: currently active loans (not yet repaid)
  - `LIQUIDATED`: fully repaid/settled loans
- **"Total disbursement volume this month"** → NO STATUS filter (count all loans disbursed)
- **"Currently outstanding portfolio"** → `STATUS = 'DISBURSED'` (active loans only)
- **ARPU (per borrower):** Mimir uses STATUS='DISBURSED' (active borrowers). Without filter, count is ~3x higher.
- User column: `AGENT_ID` (not BORROWER_ID, which doesn't exist)

## TTT user_id Dedup: Context Matters

- **Total unique humans (no IS_MP grouping):** Use `REGEXP_EXTRACT(USER_ID, r'\d+')` — same person can appear as both Individual and Money Pool
- **Per-IS_MP segment analysis (GROUP BY IS_MP):** Two valid approaches:
  - **Raw `user_id`:** counts distinct accounts (higher, e.g. 691K Money Pool Dec 2025)
  - **REGEXP_EXTRACT:** counts distinct humans (lower, e.g. 453K Money Pool Dec 2025, -34%)
  - Individual MAU is unaffected (user_ids are just numbers)
- Mimir always uses REGEXP_EXTRACT even when GROUP BY IS_MP. Need domain owner confirmation.

## TTT MAU_TYPE vs MFU_TYPE: Different Metrics!

- **MAU_TYPE**: Monthly Active Users — anyone who used/visited TTT
- **MFU_TYPE**: Monthly Funded Users — anyone who has money in TTT (subset of MAU)
- Example: Dec 2025 Retain — MAU=2.79M, MFU=2.49M (MFU < MAU)
- Always specify which metric when reporting "TTT users"
- Churn pool is massive: ~12.2M churned vs ~3.7M active (Dec 2025)

## TTT MAU: Include Money Pool

TTT MAU should report BOTH Individual and Money Pool users. Always GROUP BY IS_MP:
- Individual: ~3.0M (Jan 2026)
- Money Pool: ~463K (Jan 2026)
- **Total MAU: ~3.46M** (not just 3.0M)

Without grouping, COUNT DISTINCT may only return Individual count due to USER_ID dedup behavior.

## FI Solutions CLO: STATUS_CODE and Date Columns

- **Disbursement:** `STATUS_CODE IN ('CONTRACT_SIGNED', 'DISBURSED')` with `DATE_MODIFIED`
- **Revenue:** Use `DATE_REQUESTED` (not DATE_MODIFIED), no STATUS filter needed
- Mimir taught us: CONTRACT_SIGNED should be included alongside DISBURSED for disbursement counts.
- **⚠ Mimir persistently uses DATE_MODIFIED for CLO** — confirmed wrong in Batch 5 and Batch 9 (H1). DATE_MODIFIED shows 0 contracts for Jan-May 2024, while DATE_REQUESTED shows correct activity.

## InsurTech: CC_STATUS Inconsistency

The actual value is English `'SUCCESS'` (not Vietnamese 'Thành Công'). Mimir itself is inconsistent — sometimes generates Vietnamese, sometimes English. Always use `'SUCCESS'`.

**Revenue vs Count context:**
- **Order COUNT:** Must filter `CC_STATUS='SUCCESS'` (otherwise includes CANCEL orders)
- **Revenue SUM:** CC_STATUS filter is nearly redundant — non-SUCCESS orders have ~0 revenue (Mimir skips it for revenue queries)

## TTT AUM: End-of-Month Snapshot, No MFU_TYPE Filter

**Mimir gets AUM wrong** — it sums BALANCE across all days in a month (~30x inflation). The correct column is `balance` (end-of-month snapshot) or `avg_balance` (pre-calculated average).

```sql
-- CORRECT: end-of-month snapshot
WHERE GRASS_DATE = LAST_DAY(DATE '2025-01-01')
-- WRONG (Mimir's approach): sums across all days
SUM(BALANCE) ... WHERE GRASS_DATE BETWEEN '2025-01-01' AND '2025-01-31'
```

## TTT AUM: Do NOT Filter by MFU_TYPE

AUM (Assets Under Management) measures total balance across ALL accounts, including churned ones. Churned users may still hold balances.

- **AUM query:** `WHERE GRASS_DATE = 'end-of-month'` — NO MFU_TYPE filter
- **MAU query:** `WHERE MAU_TYPE != '0.Churn'` — active users only
- **MFU query:** `WHERE MFU_TYPE != '0.Churn'` — funded users only

Jan 2026 AUM: Individual 9.95T + Money Pool 1.62T = **11.57T VND total**

## TTT Cashin/Cashout: Sum ALL Sub-Channel Columns

`cashin_gmv` is NOT total cashin — it's one sub-channel. The table splits GMV into sub-channels:

**Cashin:** `cashin_gmv` + `cashin_p2p_gmv` + `cashin_va_gmv` + `cashin_ai_gmv` + `cashin_stock_gmv` + `cashin_payout_gmv`

**Cashout:** `cashout_gmv` + `cashout_napas_gmv` + `cashout_payment_gmv` + `cashout_stock_gmv` + `cashout_p2p_gmv` + `cashout_mp_gmv` + `cashout_payment_mp_gmv`

Always use `COALESCE(col, 0)` and sum all sub-channels for totals. Using just `cashin_gmv` gives ~50% of actual total.

## TTT Column Names

- Interest column: `interest` (NOT `interest_gmv`)
- Balance column: `balance` (NOT `saving_balance`)
- Average balance: `avg_balance`
- These are the CORRECT names — check INFORMATION_SCHEMA before guessing.

## VN Column Names

- User column: `AGENT_ID` (NOT `BORROWER_ID` which doesn't exist)
- Status values: `DISBURSED` (active loan), `LIQUIDATED` (repaid loan)

## Mimir Timeout: Complex Analytical Queries

Mimir sometimes times out on complex queries (MFU distribution with monthly GROUP BY, MoM growth calculations). Simple single-metric aggregations succeed; multi-step analytical queries may fail. Consider breaking into simpler sub-questions when asking about derived metrics.

## PAYLATER_MAU_SEGMENT vs PAYLATER_ALL_TRANS

Two different tables, different column names:
- `PAYLATER_MAU_SEGMENT`: user = `agent_id`, date = `month_trans`, segment = `MAU_segment`
- `PAYLATER_ALL_TRANS`: user = `user_id`, date = `created_date`, usecase = `service_category`

Mimir handles MAU_SEGMENT correctly but gets ALL_TRANS column names wrong (3 known errors).

## Mimir: Long-Running BQ Queries Can Take 20+ Minutes (NOT a real timeout)

Some large table scans on BigQuery take 20+ minutes to execute. Mimir stays in `"NEW"` status while BQ runs — this is **normal**, not a Mimir bug.

**Do NOT declare TIMEOUT before 15-20 minutes have passed.**

Wait strategy:
- Poll every 60s for first 3 minutes
- If still NEW, switch to every 2-3 minutes
- Declare TIMEOUT only after 15-20 min with no AI response

| Query Type | Typical Wait |
|-----------|--------|
| Single month MAU | < 90s |
| 3-month GROUP BY | 1-2 min |
| 8-month GROUP BY | potentially 10-20 min — wait! |
| Complex multi-join or large tables | up to 20 min |

---

## InsurTech MAU: USER_PAYMENT ≈ DEBITOR, Status Filter Barely Matters for MAU

**Batch 15 finding (2026-03-03):**

In `att_fi_ins_nl_ver2` (Distribution), `USER_PAYMENT` and `DEBITOR` refer to nearly the same person in practice — difference < 1% on MAU counts. Mimir uses `USER_PAYMENT`, we used `DEBITOR`; both valid.

**CC_STATUS filter barely affects MAU:** Users who fail transactions almost always also have successful ones. So `COUNT(DISTINCT user_id)` with vs without `CC_STATUS='SUCCESS'` differs < 1%. For MAU counting purposes, skipping status filter is acceptable.

**InsurTech MAU = UNION of Distribution + Collection:**
```sql
SELECT COUNT(DISTINCT user_id) AS mau
FROM (
  SELECT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
  UNION ALL
  SELECT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.INS_COL_ALL_TRANS`
  WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
)
```

**Verified baselines (MATCH with Mimir, < 1% diff):**
| Month | MAU |
|-------|-----|
| Dec 2025 | ~128K |
| Jan 2026 | ~141K |
| Feb 2026 | ~148K |

**Trend: growing (+10% Dec→Jan, +5% Jan→Feb)** — not Dec seasonal spike.

---

## Deduplication Pattern for Demographics Join

`SEMANTIC_QLCT_VISIT` has multiple rows per user (one per day/product/action). Deduplicate with:
```sql
ROW_NUMBER() OVER (PARTITION BY AGENT_ID ORDER BY MONTH DESC, DATE DESC) AS rn
-- then filter WHERE rn = 1
```
Filter `MONTH >= '2025-09-01'` (last ~3 months) to keep scan cost down while ensuring coverage.

## InsurTech MAU: Collection Drives Seasonal Spikes, Distribution Drives Growth

**InsurTech MAU = Distribution users + Collection users.** The two components have very different behavior:

| Component | Pattern | Table |
|-----------|---------|-------|
| **Distribution** (buy policies) | Steady growth, ~54-57K/month | `att_fi_ins_nl_ver2` |
| **Collection** (pay premiums) | Spike/crash seasonally | `INS_COL_ALL_TRANS` |

**Oct 2025 was an insurance renewal/collection season** → Collection MAU spiked → total InsurTech MAU 133K.  
**Nov 2025 wave ended** → Collection MAU dropped ~50% → total MAU crashed to 94K.  
**Dec 2025 onwards** → Distribution growth accelerated (+46% MoM orders) → steady climb to 149K by Feb 2026.

**For seasonality analysis:** Separate Distribution and Collection MAU. Don't mix them into a single "InsurTech MAU" trend.


## Vay Nhanh DPD/NPL: Use Vintage Table, Not Loan Info Table

**DPD data is NOT in `BAOTU_VAYNHANH_LOAN_INFO`** — there's no DPD column there.

Use `DASH_RISK_PORTFOLIO_FASTMONEY_VINTAGE_DPD_ALL` for vintage-based DPD analysis:
- `MONTH_DISBURSE` = disbursement cohort
- `MOB` = months on book
- `DPD30`, `DPD90`, `DPD180` = count of loans in each DPD bucket at that MOB
- `TOTAL_LOAN` = total loans in cohort

**To get current DPD rate:** Join with latest MOB per vintage.

**Verified baselines (Feb 2026):**
| Vintage | MOB | DPD30 rate | DPD90 rate (NPL) |
|---------|-----|------------|------------------|
| Jul 2025 | 8 | 8.46% | 5.96% |
| Aug 2025 | 7 | 7.45% | 4.62% |
| Sep 2025 | 6 | 6.53% | 3.19% |
| Oct 2025 | 5 | 4.98% | 1.46% |

5-6% NPL at MOB8 = typical for VN fintech consumer lending. Not in distress.

## Paylater DPD: Experiment Table Has Per-Day Structure

`20260201_PAYLATER_RECOVERY_EXPERIMENT_CALLBOT_OUTSTANDING_BY_DPD` is NOT a simple snapshot — it has 1.6M rows per DPD day value (multiple rows per loan). The `dpd` column has negative values (days before due) and positive values (days past due). This is a recovery operations table, not a standard portfolio report.

To get Paylater DPD snapshot, need the standard portfolio or risk table.


## SEMANTIC_QLCT_VISIT: Data Freshness — Always Check Max DATE

`SEMANTIC_QLCT_VISIT` has ETL lag. Data may not be available for the full current month.

**Verified issue (2026-03-03):** Table only has data through Feb 6, 2026. Feb 7-28 = NO DATA.

**Always verify:**
```sql
SELECT MAX(DATE) FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
-- before trusting any monthly aggregate for the most recent month
```

If `MAX(DATE)` < last day of month → current month MAU is INCOMPLETE. Extrapolate or use prior month.

**False alarm trap:** Feb 2026 Moni MAU appears 66K (vs Jan 290K = -77%) — NOT real. Only 6 days of data (Feb 1-6). Real Feb MAU ~280K.

Daily baseline for Moni (ACTION='CHAT', PRODUCT='MONI'): ~10-11K/day weekdays, ~19K peak on Tet (Feb 2).


## Vay Nhanh: Mimir Undercounts Disbursements 3x — STATUS Filter Bug Persists

**Mimir VN disbursement count = 3x lower than BQ reality.** Confirmed Batch 15:

| Month | Our BQ (correct) | Mimir (wrong) | Ratio |
|-------|-----------------|---------------|-------|
| Jan 2026 | 171,573 loans | 58,267 loans | 2.95x |
| Feb 2026 | 143,176 loans | 49,333 loans | 2.90x |

**Root causes:**
1. **Feb 29 bug**: Mimir generates `'2026-02-29'` for Feb 2026 range (2026 is NOT a leap year) → SQL crash → partial/wrong results
2. **STATUS filter**: Mimir likely filters by `STATUS = 'DISBURSED'` (currently active) instead of counting ALL loans disbursed in that month regardless of current status

**Correct approach:**
```sql
-- Count ALL loans disbursed in a month (regardless of current repayment status)
WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-01-31'
-- NO STATUS filter — DISBURSED_DATE is populated for both DISBURSED and LIQUIDATED
```

VN domain trust: **MEDIUM** (MAU metrics OK, disbursement counts ~3x undercounted by Mimir).


## P2P Revenue: W2W Personal Transfers Are FREE — Revenue = W2B + CASHOUT

**Critical misunderstanding:** `HOANG_P2P_ALL_CASHOUT_W2W_BY_TID` is named "W2W" but contains 3 service types. **W2W personal transfers have 0 fee.** Real P2P revenue comes from:

| Service | Description | Jan 2026 Fee Revenue |
|---------|-------------|----------------------|
| W2B | Merchant/business receives payment → charged a fee | 45.03B VND |
| CASHOUT | User withdraws to bank → charged a fee | 4.41B VND |
| W2W | Personal transfer (free) | ~0 VND |
| **TOTAL** | | **49.44B VND** |

**Mimir bug:** Mimir filters `service='W2W'` when asked about "P2P W2W revenue" → gets 81 VND (essentially 0). Verdict: **MISMATCH** (Mimir wrong by ~600M×).

**Correct SQL:**
```sql
SELECT month, SUM(fee) AS total_fee_revenue
FROM `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
WHERE month IN ('2026-01-01', '2026-02-01')
-- NO service filter — include W2B + CASHOUT (W2W fees = 0 anyway)
GROUP BY 1
```

**Verified baselines:**
- Jan 2026: 49.44B VND (W2B 45.03B + CASHOUT 4.41B)
- Feb 2026: 41.75B VND (W2B 37.94B + CASHOUT 3.81B)
- Daily rate: 1.60B/day (Jan) → 1.49B/day (Feb), slight softening


## Airtime: BQ Access Blocked — Use Mimir Instead

Airtime tables are in a DIFFERENT BQ project: `project-5400504384186300846.BU_UTILITIES_TELCO`

**Our account (`son.pham9@mservice.com.vn` using job project `momovn-bu-fs-ondemand`) CANNOT query these tables.** Error: `Access Denied: Table project-5400504384186300846:BU_UTILITIES_TELCO.AIRTIME_SEGMENT_USER`

**For Airtime data: use Mimir domain `3165cb58-8f0a-4c7d-96e6-ae0b189ff572`** which has access to both:
- `BU_UTILITIES_TELCO.AIRTIME_DETAILS` — transaction-level (id, date, amount, revenue, cate/carrier, statusid=2 for success)
- `BU_UTILITIES_TELCO.AIRTIME_SEGMENT_USER` — user segments + TRANS + GMV columns

## P2P Revenue: W2W Personal Transfers Are FREE — Revenue = W2B + CASHOUT (already saved above)

## VietQR Cross-Sell: Largest Untapped FS Funnel

VietQR users (Jan 2026): **3.61M unique users** — larger than any single FS product.
- 56% already use TTT or Paylater
- 44% (1.59M) use VietQR but NO FS products → prime cross-sell targets

VietQR fee per transaction: ~55 VND (nearly free). Revenue model = volume strategy → FS cross-sell monetization.


## BQ Access Map: Blocked Datasets (Updated Batch 16)

Our account (`son.pham9@mservice.com.vn`, job project `momovn-bu-fs-ondemand`) CANNOT query:

| Dataset | Example Table | Alternative |
|---------|--------------|-------------|
| `project-5400504384186300846.BU_UTILITIES_TELCO` | AIRTIME_SEGMENT_USER | Use Mimir domain `3165cb58` |
| `momovn-prod.BU_ECOM` | DLS_ALL_TRANS_V3_1 | Use Mimir domain `ca851de3` |

CAN query:
- `momovn-prod.BU_FI.*` — All FS product tables ✅
- `momovn-prod.MBI_DA.*` — P2P, Billpay, QLCT, SEMANTIC_ tables ✅
- `momovn-prod.BU_FI.INFORMATION_SCHEMA` — Schema discovery ✅


## InsurTech Distribution: September = Annual Seasonal Trough

**Confirmed pattern (both 2024 and 2025):**
- Aug → Sep: -21% in 2024, -16% in 2025
- Cause: BOTH new AND returning users drop equally (~16%) → systemic seasonal, not campaign/product issue
- Post-trough: Oct-Nov flat, Dec = year-end motor renewal breakout (+61% Dec 2025)

**Key dates for InsurTech planning:**
- Sep = low month (budget allocation, not concern)
- Nov-Dec = push Vehicle Insurance hard (motorcycle renewal season)
- This pattern should hold annually

**Baselines:**
| Month | 2024 MAU | 2025 MAU |
|-------|----------|----------|
| Aug | 57,670 | 62,648 |
| Sep | 45,563 (-21%) | 52,419 (-16%) |
| Dec | 58,825 | 86,323 (+47% YoY) |

## Paylater DPD30: PAYLATER_RAR_DPD30_RISK_REPORT — ETL Stopped Feb 2025

Table exists but ETL stopped ~Feb 2025. Latest data = 13 months old.

Feb 2025 DPD30 outstanding: 65.53B VND (estimated DPD30 rate ~4-5% of portfolio)
For current DPD30: **request data team to refresh ETL on PAYLATER_RAR_DPD30_RISK_REPORT**

Alternative proxy: penalty_txns / purchase_txns rate (= 6.36% Jan 2026) — not exact DPD but directional.


## VietQR Fee Increase: Mid-January 2026 (CONFIRMED)

MoMo raised VietQR scan fees around January 15-16, 2026. Before: ~40 VND/txn. After: 70-128 VND/txn.

**Fee timeline:**
| Period | Avg fee/txn |
|--------|-------------|
| Jul-Sep 2025 | 43-49 VND (baseline) |
| Jan 1-15, 2026 | 38 VND (still old rate) |
| Jan 16-31, 2026 | 70.5 VND (+75%) |
| Feb 1-6, 2026 (Tet) | 25 VND (suppressed activity) |
| Feb 23-28, 2026 (post-Tet) | 128 VND (+220% vs baseline) |

Annual revenue impact: +40.8B VND/year additional from VietQR fee increase alone.
This was a SILENT pricing change — not announced. Discovered via data analysis.


## VietQR Fee Model: % of GMV (NOT flat per-txn), Rate Rising +35% in 7 Months

VietQR fee is NOT a flat per-transaction amount. It's approximately **0.024-0.033% of transaction GMV** (MDR-style).

**Correct metric:** `SUM(fee) / SUM(amount)` = fee rate. NOT `AVG(fee)` (misleading).

**Fee rate trend (Jul 2025–Feb 2026):**
| Month | Fee Rate |
|-------|----------|
| Jul 2025 | 0.024% |
| Oct 2025 | 0.028% |
| Jan 2026 | 0.031% |
| Feb 2026 | 0.033% |

Rate increased +35% over 7 months. Appears to be a deliberate gradual increase, not seasonal noise. Board-level finding.

**Mimir accuracy on VietQR fee:** When asked specifically about `transfer_p2b_scan_vietqr` fees, Mimir gives EXACT MATCH (verified Feb 2026: 2.437B VND). Trust: HIGH for specific VietQR revenue queries.


## P2P Strategic Pricing: VietQR MDR Rising, Direct P2B MDR Declining

**Strategic two-sided pricing (confirmed Jul 2025 – Feb 2026):**

| Channel | Jul MDR | Feb MDR | Trend |
|---------|---------|---------|-------|
| VietQR scan | 0.024% | 0.033% | +35% rising |
| Direct P2B transfer | 0.282% | 0.208% | -26% declining |

Interpretation: MoMo lowers direct P2B to retain traditional merchants, raises VietQR to monetize QR-adopting merchants. Classic platform two-sided pricing.

At current pace: VietQR reaches 0.05% MDR by ~March-April 2027.

Revenue at 0.05% MDR × 10T GMV = 5B VND/month (vs current 2.24B).

**Always use fee/GMV ratio** for P2P pricing analysis — not avg fee per txn which is GMV-size dependent.


## BQ Access Map: Additional Blocked Project (Batch 17)

`momovn-growth-analytics` — BLOCKED. Contains media/marketing spend data.
- Table: `momovn-growth-analytics.REPORT_MEDIA.MEDIA_FACT_AD_AGG`
- Use Mimir domain `bf6c7cb8-75d4-493a-894c-ffd71d729cb1` instead

Full blocked list:
1. `project-5400504384186300846.BU_UTILITIES_TELCO` — Airtime (use Mimir `3165cb58`)
2. `momovn-prod.BU_ECOM` — DLS Online (use Mimir `ca851de3`)
3. `momovn-growth-analytics.REPORT_MEDIA` — Media AD spend (use Mimir `bf6c7cb8`)


## InsurTech: Travel vs Vehicle — Very Different Seasonality

**Travel Insurance:** Steady +47% compound growth Jul 2025→Jan 2026. No dramatic spikes.
- Oct bump = holiday travel bookings (Q4 vacations)
- Feb slight dip = Tet period (people stay local, don't buy travel insurance)
- Year-round marketing: consistent demand, push anytime

**Vehicle Insurance:** Plateau Jul-Nov (15-19K orders/month), then EXPLOSIVE Dec-Feb
- Dec +61% | Jan +57% | Feb +19% = motorcycle renewal season
- Revenue per order: 58.5K VND (2.3× more valuable than Travel at 24.9K VND)
- Marketing calendar: concentrate Nov-Dec for maximum annual renewal capture

**PA Bus** = Bảo hiểm tai nạn hành khách (mandatory passenger accident coverage)
- Single partner: PVI
- Very cheap: 15K VND avg revenue/order
- Not a strategic product — regulatory/mandatory, not voluntarily purchased

## CLO Lenders: Home Credit Dominant + SHB is a Partner (New Finding)

CLO has 5 active lenders (Jan 2026):
| Lender ID | Share | Avg Loan | Note |
|-----------|-------|----------|------|
| lending_mp_homecredit | 62% contracts, 72% revenue | 26.6M | Dominant |
| clo_fecredit | 18% | 32.3M | Premium segment, largest loans |
| clo_shb | 14% | 17.1M | SHB bank — new partner, not previously documented |
| clo_mcredit | 5% | 20.1M | |
| clo_f88 | 0.3% | 16.0M | F88 pawn chain |

Home Credit concentration risk: 72% of CLO revenue. If Home Credit exits = 72% revenue loss.
SHB (State commercial bank) is a CLO partner — adds credibility/diversification.


## Cyber Insurance: Basic Tier = 0 MoMo Revenue (Free Wallet Feature)

`Cyber Ins` (basic) in `att_fi_ins_nl_ver2`:
- Cathay NonLife underwriter, 9,000 VND premium per policy
- `FINAL_REV` = 0 for basic Cyber Ins → MoMo earns NOTHING from basic tier
- Only Cyber Plus and renewals earn MoMo revenue (1,636-3,424 VND/order)
- Basic Cyber Ins = wallet protection feature (acquisition/retention tool), not revenue product

## Paylater = Revolving Credit (No Fixed Tenor)

Paylater is a monthly billing cycle product (credit card style), NOT fixed-term loans.
- No `tenor` or `loan_term` column exists in any Paylater BQ table
- `PAYLATER_ACCOUNT_GDS` has credit_limit, status, rank — no tenor
- `PAYLATER_BILL_V2_GDS` has monthly statement balance — no tenor
- Loan term breakdown analysis is NOT APPLICABLE for Paylater by design

## CLO: SHB Joined November 2025 (New Partner)

`clo_shb` (SHB State Commercial Bank) first contract date: 2025-11-26.
SHB = very new CLO partner (2 months in as of Jan 2026, 687 contracts).

CLO diversification trajectory:
- Jan 2025: ONLY Home Credit (100% concentration)
- Jan 2026: 5 lenders (HC 62%, FE Credit 18%, SHB 14%, McCredit 5%, F88 0.3%)

HC concentration declining: 100% → 62% in 1 year = healthy diversification.

## Travel Insurance: Domestic Bundle vs International (179 orders, 8x premium)

`Travel Ins` in att_fi_ins_nl_ver2:
- 99% of orders = Travel Easy Bundle (Bảo Việt, 69K VND avg premium, ~24K VND/order MoMo rev)
- 1% = International Travel (Liberty, 554K VND avg premium, 166K VND/order MoMo rev)
- International = 8x higher premium, 7x higher MoMo revenue per transaction
- Growth opportunity: convert 1% international → 5%+ = massive revenue lift


## CLO: SHB Explosive Growth (Feb 2026) — Watch Credit Quality

SHB CLO ramp: Nov 2 contracts → Dec 598 → Jan 687 → **Feb 3,830 (+457% MoM)**

SHB overtook Home Credit in Feb 2026 (3,830 vs HC ~2,990 in Jan). Very fast ramp.
Fast ramp = potential credit quality risk if underwriting not tight.

**CLO lender concentration has INVERTED in Feb 2026:**
- HC was 100% → 62% → likely <50% in Feb as SHB explodes
- Monitor CLO monthly by lender — this is now a dynamic story

## InsurTech: MoMo Take Rates by Partner (Jan 2026)
| Partner | Product | Take Rate |
|---------|---------|-----------|
| Cathay NonLife | Vehicle | 64% (highest) |
| GIC | Vehicle | 59% |
| Bảo Long | Vehicle | 52% |
| PVI | PA Bus | 50% |
| PVI | Vehicle | 45% |
| Bảo Việt | Travel Easy | 35% |
| Liberty | Intl Travel | 30% |
| Cathay NonLife | Cyber (basic) | 4% → effectively 0% |

AMOUNT column = MoMo's collected amount (commission share from insurer), not full policy premium.
FINAL_REV = MoMo's net revenue after costs = take rate of AMOUNT.


## CLO: SHB 6.5% Approval Rate — Conservative, Not Reckless

SHB Feb 2026 funnel: 60K+ applications → 3,830 disbursed = 6.5% approval rate.
SHB is SELECTIVE. Rejects 93.5% of applicants. Not a credit quality risk.

HC declining (-19% contracts Nov→Feb) while SHB explodes (+457% Jan→Feb).
MoMo appears to be strategically shifting CLO volume from HC to SHB.
- SHB take rate: 4.09% (higher than HC's 3.80%) → MoMo earns more per VND from SHB
- SHB = state bank = better regulatory credibility

**CLO revenue trajectory:** Jan ~4.83B → Feb estimated ~6.1B (+26% MoM). Driven by SHB ramp.


## InsurTech: PVI = 40.6% Revenue Dependency (Major Partner Risk)

PVI contributes 40.6% of InsurTech Distribution revenue (Jan 2026: 1.68B out of 4.13B).
PVI covers 4 product lines: Vehicle + PA Bus + Health + Property.
If PVI exits → -40.6% revenue AND 4 product lines collapse.

**Diversified (safe): Vehicle** — 8 partners (PVI, Bảo Long, Cathay, GIC, Liberty, Bảo Việt, MIC, PJICO)
**Single-partner risk: PA Bus, Health, Property, Cyber** — 1 partner each

Action: Find backup partners for PA Bus (PVI), Health (PVI), Property (PVI), Cyber (Cathay).

## PA Bus: Post-Tet Return is the Real Peak (Not Pre-Tet)

PA Bus spike occurs AFTER Tet, not before:
- Tet 2026: ~Jan 29-Feb 4 (quiet period for PA Bus)
- POST-Tet return (Feb 18-25): peak 2,200-2,541 orders/day (2× normal)

Marketing: Buy PA Bus ads in POST-Tet period (Feb 18-25). Not pre-Tet departure.

## InsurTech Seasonal Marketing Calendar

| Product | Push timing | Peak pattern |
|---------|-------------|-------------|
| Vehicle Ins | November-December | Annual motorcycle renewal season |
| PA Bus | December + Post-Tet (Feb 18-25) | Tet migration + return journey |
| Travel Ins | Year-round, bump October | Q4 holidays; Feb slight Tet dip |
| Health Ins | Skip — declining | -48% orders in 6 months |
| Property Ins | Skip — small, seasonal Jan dip | Annual cycle unclear |
| Cyber Plus | Minimal — near-zero take rate basic | Wallet feature, not revenue |
| **September** | **PAUSE ALL spend** | Structural annual trough |


## Paylater Revenue Model: Subscription-Like Fee (30K VND/month per account)

Paylater earns revenue via FEES from borrowers, not merchant MDR:
- **Management fee** (`pay_pl_fee_manage`): ~30K VND/month per active billing account
- **Penalty fee** (`pay_pl_fee_penalty`): ~52K VND per late payment event
- **DPD1 penalty** (`record_pl_pen_fee_dpd1`): ~28K VND
- **Total fee revenue Jan 2026: 69.8B VND** (1.45M borrowers × avg 48K VND/month)

This is MoMo's largest FS revenue stream. Subscription-like model = predictable, scalable.

## FS ARPU Ranking (Jan 2026)

| Product | ARPU/month | Revenue type |
|---------|-----------|--------------|
| CLO | ~1,008K VND/contract | One-time origination fee (~168K/month if 6m tenure) |
| VN (est) | ~422K VND/borrower | Origination/referral fee (~2% est) |
| Paylater | 48K VND/borrower | Monthly management + penalty fees |
| InsurTech | 40K VND/buyer | One-time commission per order |
| TTT | ~8.5K VND/MFU user | Interest spread (gross 57.9B - paid 37.95B = ~20B net) |

CLO highest ARPU by far (premium B2B2C lending). Paylater largest by total revenue (mass market).

## Property Insurance: Secular Decline (-47-51% YoY Each January)

Jan 2024: 13,078 orders | Jan 2025: 6,385 (-51%) | Jan 2026: 3,353 (-47%)
At this pace: Jan 2027 = ~1,700 orders. Product approaching extinction.
Strategic decision: divest marketing, plan exit from Property Insurance product.


## VN Revenue: Not in BQ — Settlement System Only

MoMo's origination/referral fee from Vay Nhanh partners (VIET_CREDIT, MCREDIT, AMBER) is NOT in any accessible BQ table.

- `QH_VAYNHANH_DISBURSED_DETAIL` has SERVICE_FEE = fee charged by LENDER to BORROWER, not MoMo's cut
- `BAOTU_VAYNHANH_LOAN_INFO` has no revenue/fee column (only MOMO_CREDIT_SCORE)
- Mimir also confirms it doesn't have this data
- VN origination revenue = in a settlement/accounting system outside BQ scope

**DO NOT estimate VN revenue as 2% of disbursement** — this equals lender's interest income, not MoMo's referral fee. MoMo's actual VN revenue is likely 0.5-2B per month (referral fee basis), unknown without settlement data.

## TTT Interest: `interest` Column = Paid to Users (MoMo's Cost)

In `mart_ttt_daily_user_record`, the `interest` column = interest credited to user accounts per day.
- Jan 2026: ~1,049M VND/day credited to Individual users + 172M/day to Money Pool
- Monthly total: ~37.95B VND paid to savers
- This is MoMo's liability/cost, NOT income

MoMo's TTT income (from investing AUM in money market) is NOT in BQ — it's in accounting systems.
Estimate: 11.57T AUM × 6% annual / 12 = 57.9B gross → minus 37.95B paid to users = ~20B net spread.

## Paylater Early Repayment: 10.8-11.8% Stable

Each month: 10.8-11.8% of active Paylater borrowers repay before the billing cycle.
Management fee revenue = only from billed accounts (89-90% of active borrowers).
Floor: 1,297K accounts × 30K = 39.0B/month (growing with borrower count).


## Paylater Revenue Split: 40% MoMo / 40% Bank / 20% Risk (CONFIRMED)

Paylater uses banking partners (TPBank = 6.3M accounts, MB Bank = 1.2M accounts).
Revenue sharing is **exactly 40%/40%/20%** — confirmed from partner tables in BU_FI.

**Tables:**
- `ANHNGUYEN61_PAYLATER_TPB_REVENUE` — TPB partnership P&L
- `ANHNGUYEN61_PAYLATER_MBV_REVENUE` — MBV partnership P&L

**Jan 2026 actual:**
- Total gross Paylater revenue (TPB table): 109.31B VND (includes fees + interest)
- TPB share: 43.72B (40%)
- MoMo net: 43.49B (40%)
- Risk/credit loss provisions: ~22.1B (20%)

**Why 109.31B > 69.8B fee revenue:** TPB table includes BOTH management fees AND interest on Paylater balances. The 69.8B from PAYLATER_ALL_TRANS = fee portion only. Total gross = fees + interest earned on outstanding credit.

**MoMo's true Paylater net: ~56B/month** (43.49B TPB portion + ~12.58B MBV portion).

DO NOT use 69.8B as MoMo's Paylater net revenue. 69.8B = gross fee revenue before partner split.


## Final MoMo Revenue Structure (Jan 2026, BQ-Verified)

| Product | Gross Revenue | MoMo Net | Notes |
|---------|-------------|----------|-------|
| Paylater | ~140B | ~47.8B | 40/40/20 split with TPB+MBV. Tables: ANHNGUYEN61_PAYLATER_TPB_REVENUE, ANHNGUYEN61_PAYLATER_MBV_REVENUE |
| CLO | 4.85B | 4.85B | 100% MoMo. Lenders pay origination fee. |
| InsurTech | 9.49B GWP | 4.13B | 43.6% commission. 56.4% → insurers. |
| P2P W2B | 42.8B | 38.6B | 4.2B network/processing costs (VietQR/Napas) |
| P2P CASHOUT | 4.41B | ~4.41B | No cost data found |
| Billpay | 8.64B | ~8.64B | No partner split found (utility companies pay MoMo) |
| **TOTAL VERIFIED** | | **~107.8B/month** | ~$53M USD/year confirmed |

P2P CASHOUT revenue table: `HOANG_P2P_ALL_REVENUE_W2B_CASHOUT_TRANSACTION` has `fee` and `cost` columns.
P2P W2B net margin: 38.6/42.8 = 90.2% (after network fees).

NOT VERIFIABLE from BQ: Airtime, DLS, TTT interest spread, VN origination fee.


## Paylater Economics: Asset-Light Credit Distribution Model

Paylater 40/40/20 split interpretation:
- **40% → MoMo**: Pure distribution fee. MoMo bears ZERO credit risk. Asset-light.
- **40% → TPBank**: Credit risk + funding cost + profit for providing 1.88T Paylater portfolio
- **20% → Credit loss buffer**: Absorbed before split (~5.6% DPD31 portfolio × ~44% provision = 28B/month)

Collection risk rate (DPD31+): consistently 5.57-5.99% of portfolio (Oct 2025 - Jan 2026)
`ANHNGUYEN61_PAYLATER_TPB_REVENUE` column: `collection_risk_rate`

**Paylater = Visa/Mastercard model**: MoMo = scheme/distributor (earns 40% distribution fee), TPBank = credit issuer (earns 40% for bearing credit risk).

Economically viable: 5.6% DPD31 is within normal BNPL range (SEA avg 4-8%). No structural credit quality problem.


## TTT Money Pool: Cohort Deepening Pattern Confirmed

Jan 2025 cohort balance evolution (14 months):
- Start: 77.5K users × 1.95M avg = 173.5B total
- Survivors (14m later): 71K users × 3.65M avg = 417.6B total
- Avg balance growth: **+87% in 14 months** (1.95M → 3.65M VND/user)
- User attrition: -8.4% (slow churn, mostly early months)

Total portfolio STABLE (~390-420B) because user growth offsets balance deepening.
Classic cohort pattern: weak savers churn in months 1-3, power savers remain and compound.

Jan 2026 new cohort quality: avg 569K, median 1K, micro 68% → BETTER than Jan 2025 (94% micro).
Wave 1 (Jul-Aug 2025) still worst: 272 VND median. Acquisition quality improving trend.

Use `GRASS_DATE = DATE_TRUNC(GRASS_DATE, MONTH)` to get first-of-month snapshot for cohort tracking.
**Note:** Feb 2026 has data anomaly (total 797.9B vs normal 390-420B). Ignore that month's total.


## Travel Insurance March Recovery: Domestic Bundle Driving +24% Post-Tet

Travel Insurance Mar 2026 recovery = 100% from Travel Easy Bundle (domestic).
- Travel Easy Bundle: 1,138/day (vs Feb avg 1,024/day = +11%)
- International Travel: 5.5/day (barely changed, still tiny)

Revenue uplift: +30% MoM travel commission (914M vs 703M Feb).
Post-Tet domestic travel planning = people booking Q2 holidays.

March Vehicle -18% | Travel +30% → Net InsurTech revenue shift: favorable, Travel partially offsets Vehicle.

## SHB CLO: Monthly Batch vs Daily Processing

SHB showed 0 contracts in Mar 1-2. Possible batch processing pattern:
- Feb: all 3,830 contracts appeared in Feb (monthly batch?)
- Mar 1-2: 0 contracts

If still 0 on Mar 7 = deliberate pause after Feb surge (credit quality review).
If appears Mar 7+ = monthly batch confirmed (SHB disburses in weekly/bi-weekly batches).

Do NOT alarm on SHB March until Mar 7+ data available.


## Vay Nhanh: MBV (MB Bank) is a New Lender (Appears March 2026)

MBV appeared in VN disbursement data on Mar 1-2, 2026 with 441 loans/day.
Not present in earlier VN analysis (Jan-Feb 2026 showed only VIET_CREDIT, MCREDIT, AMBER).

**Updated VN lender list:**
| Lender | Mar 2026 share | Avg loan |
|--------|---------------|---------|
| VIET_CREDIT | 67% | 19.6M (Jan) |
| MCREDIT | 14% | 16M |
| AMBER | 10% | 14.5M |
| **MBV (NEW)** | **8.5%** | ~17.5M (est) |

MBV = MB Bank = same bank that is MoMo's secondary Paylater partner. Now also providing VN loans.
Check if MBV VN started in Jan/Feb 2026 or only visible in March data.


## P2P W2B Fees: Weekend = 40-60% Lower Than Weekday

P2P W2B merchant fees follow day-of-week pattern:
- Sunday (Mar 1): 0.51B fee → lowest
- Monday (Mar 2): 0.65B fee → recovering
- Weekday avg (est): 1.0-1.5B/day

**Always use Monday-Friday average for monthly extrapolation. Never use weekend data.**
Jan monthly avg: 45.03B / 31 = 1.45B/day includes all days.
Sunday is structurally 40-60% lower due to lower merchant activity.

## Mimir Partial Month Issue: Reports Incomplete Month as Complete

Mimir Q7 (Mar 2026 Paylater): reported MAU 403K and GMV 210B for 'March 2026'.
This is only 2 days of data (Mar 1-2). Mimir doesn't check if month is complete.
- 210B / 2 days = 105B/day ← correct daily rate
- Reported as monthly = -91% vs Feb = WRONG interpretation

**Always verify MAX(date) for BOTH BQ AND Mimir before accepting current-month figures.**
The SEMANTIC_QLCT_VISIT ETL lag (Feb 6 cutoff) and this Paylater partial month are both examples.

When Mimir says 'March 2026: MAU = X' for a month in progress → data is incomplete.

## MBV is Also a Vay Nhanh Lender (Since Nov 17, 2025)

MBV (MB Bank) started VN disbursements on 2025-11-17. 
- Total Nov 2025 - Mar 2026: 21,050 loans | 253.5B disbursed
- Mar 2026: 441 loans/day = 8.5% of VN volume
- MBV serves both Paylater (secondary bank partner) AND VN (lending partner)

Updated VN lender list: VIET_CREDIT (67%) + MCREDIT (14%) + AMBER (10%) + MBV (8.5%) + others


## VietQR MDR: Weekend Data Unreliable for Trend Analysis

VietQR MDR on weekend (Mar 1=Sunday): 0.0094% vs Jan monthly avg 0.0311%.
Weekend = ~30% of weekday MDR rate.

**Rule: Only use Monday-Friday VietQR data for MDR trend analysis.**
Weekend lower because: smaller-value merchant transactions, batch settlements deferred, lower commercial activity.

## Mimir Domain Isolation: Cannot Cross Products for Total MAU

When asked for 'total MoMo MAU across all products', Mimir (from any single domain) says it can only report its own product's MAU. Mimir domains are siloed — no cross-product aggregation available.

Total MoMo MAU must be computed from BQ by UNIONING all product user tables (complex, expensive query).


## Paylater: 18% Credit Utilization — 82% Headroom

Total approved Paylater credit lines:
- TPB: 9.253T VND (1.9M ACTIVED accounts × 4.88M avg limit)
- MBV: 2.1T VND (348K ACTIVED × 6.03M avg limit)
- Combined: 11.35T VND approved

Actual outstanding (Feb 2026): ~2.035T VND
**Utilization rate: 17.9%** — only 18% of approved credit is being used.

If utilization grows 18% → 25%: outstanding increases +39% (2.035T → 2.83T).
Revenue would grow proportionally (more outstanding × same fee rate).

This is the largest unrealized growth lever for Paylater — no new users needed.

## InsurTech Partners: PJICO is Only New 2026 Addition

Partner vintage:
- 2018 originals: GIC, VBI, MIC, PTI-SG, Liberty
- 2019: PVI, Bảo Long
- 2022: Cathay NonLife, Manulife
- 2026: PJICO (first order Jan 29, 2026 — 15 orders, 1.21M VND/order = high-value)

PJICO = well-known Vietnamese P&C insurer. Product type unclear (high avg order = vehicle?).
All other partners are 2018-2022 vintage. Partner pipeline has been stable.


## InsurTech Contract Count: Mimir = New Only, BQ = New + Renewals

Mimir counts Voluntary Car Insurance = 177 contracts (Jan 2026).
BQ total = 202 (177 new Voluntary Car + 25 Renewal Voluntary Car).

Mimir appears to count only SP_DETAIL='Voluntary Car' (new contracts) and misses SP_DETAIL='Renewal Voluntary Car'.

**For total InsurTech orders = always use BQ** (includes both new + renewal).
**Mimir undercount on renewal-heavy products** (Cyber Plus renewal, Renewal Motor Ins, etc.) — verify with BQ.


## Vehicle Insurance: Nov 27 = True Campaign Start Date (Not Nov 1)

Daily Vehicle Insurance orders Nov 2025:
- Nov 1-26: steady 486-740/day (baseline)
- Nov 27: 951/day ← SUDDEN +73% spike

The renewal season surge starts Nov 27, not Nov 1.
**Optimal campaign start: Nov 20-25 to capture end-of-month surge.**
Don't run Vehicle Insurance campaigns Nov 1-19 (low baseline, wasted spend).

## Paylater New Borrower Acquisition: Steady 88-122K/Month

New first-time Paylater borrowers per month:
- Range: 88K (Sep trough) to 122K (Nov peak)
- NOT accelerating — stable organic growth
- Sep = structural low (same as all MoMo products)
- Nov = peak (year-end shopping drives new credit users)
- Jan = elevated at 93K (New Year effect) vs 107K Jan 2026

No large campaigns visible in acquisition data. Dormant activation = untested opportunity.


## Paylater Campaign Timing: Thursday-Saturday = Peak Spending Days

Paylater GMV by day of week (Jan 2026):
- Saturday: 407.1B GMV (HIGHEST) — weekend shopping
- Friday: 385.9B (high) — end-of-week purchases
- Thursday: 384.4B (high) — pre-weekend shopping prep
- Wednesday: 291.3B (LOWEST) — avoid for campaigns
- Sunday: 313.6B (low) — post-weekend recovery

**Optimal campaign timing: Launch Thursday, target Fri-Sat for maximum GMV.**
**Never launch Wednesday** (lowest engagement + GMV day).

## TTT Unfunded: 53% Ever-Funded (Reactivation) vs 47% Never-Funded (Activation)

Of 1,171,382 unfunded Individual MAU users in Jan 2026:
- **623,212 (53%)**: Previously had money in TTT, now unfunded → REACTIVATION (3-5× easier)
- **548,170 (47%)**: Never funded → ACTIVATION (harder, needs first-time education)

Use different campaigns:
- Reactivation: "Your TTT account misses you. Resume saving." → 30% est. conversion
- Activation: "Start your first savings habit — 50K VND today." → 5-10% est. conversion


## VN Repeat Borrower Rate: 64% RE-LOAN (Highly Sticky)

VIET_CREDIT Jan 2026: 64% of loans = RELOAN (repeat customers), 25% = NEW borrowers.
SEGMENT_USER column: 'RELOAN' = returning, 'NEW' = first-time, 'REPEATED' = previously repeated.

Avg loan by type:
- RELOAN: 22.1M VND (repeat borrowers get larger loans)
- NEWLOAN: 12.9M VND (first-time borrowers start small)
- FM_MERCHANT_NEW: 32.5M VND (merchant segment = highest value)

MoMo is both ACQUISITION channel (25%) AND RETENTION engine (64%) for VN lenders.
64% reloan = mutual dependency. VIET_CREDIT needs MoMo for repeat customers too.


## Car Insurance Has DOUBLE Seasonal Peak (Different from Motorcycle)

Motorcycle renewal: November-December annual cycle.
**Car insurance (Liberty data): FEBRUARY is also a major car insurance month!**

Liberty car insurance orders:
- Nov 2025: 145/month (pre-motorcycle renewal)
- Dec 2025: 259 (+79% — year-end car purchases)
- Jan 2026: 275 (still strong)
- Feb 2026: 666 (+142% — POST-TET CAR RENEWAL WAVE!)

**February = car insurance renewal season.** Cars bought/gifted during Tet need annual renewal in Feb.

Updated InsurTech marketing calendar:
- Nov 20-Dec: Motorcycle mandatory renewal blitz
- **February: Car insurance (Compulsory + Voluntary) push month**
- Year-round: Travel Insurance
- Sep: PAUSE all (structural trough)


## Mimir Paylater MAU Definition: Registered vs Active Transacting

Mimir Paylater MAU = from PAYLATER_MAU_SEGMENT table (all registered/approved users).
Our BQ MAU = users with result_code=0 AND trans_type IN ('pay_pl','pay_ins','send_pl') in PAYLATER_ALL_TRANS.

Mimir's Q4 2025 MAU (1,798,675) > BQ active (1,376K avg) = Mimir counts registered, we count transacting.

**When asking Mimir for Paylater MAU:**
Use Vietnamese: 'người dùng có giao dịch thành công' (users with successful transactions)
NOT just 'người dùng hoạt động' (active users) which Mimir may interpret as registered.

This pattern likely applies to ALL domains — always clarify metric definition.


## Paylater Dormant: 87% LAPSED (Ever-Transacted), Only 13% Never-Used

Of 1.18M dormant TPB Paylater accounts:
- **995,229 (86.8%)** = ever-transacted (lapsed users — used before, now stopped)
- **151,614 (13.2%)** = never-transacted (never made a single purchase)

Reactivation campaign priority: Target the 995K LAPSED users first.
Estimated conversion rate: 25-35% (vs 5-10% for never-used).
These users know Paylater, had at least 1 successful transaction, just lost the habit.

Campaign message: "Bạn đã mua hàng với Paylater — thử lại với hóa đơn điện tháng này."

## Liberty Voluntary Car: Established Product (Apr 2023), Broke Out Jun 2025

Liberty Voluntary Car Insurance NOT a new product — first order April 2023.
Stagnant at 2-20 orders/month for 2+ years, then BREAKOUT in Jun 2025 (+165% in 9 months).

Something triggered Jun 2025 acceleration (app placement change? Campaign? Feature update?).
PJICO joining Jan 2026 = validation of the growing market Liberty proved.

Key question: What was the Jun 2025 trigger? If repeatable → apply to PJICO ramp-up.


## InsurTech: Vehicle Insurance = Only Product with Active Campaigns (TYPEID='dd')

Jan 2026 promo vs organic:
- Vehicle Insurance: 11,204 promo orders (23%) + 37,280 organic (77%)
- ALL other InsurTech products (Travel, PA Bus, Cyber, Health, Property) = 100% ORGANIC

Travel Insurance 30K+ orders/month = entirely organic. With campaigns, potential 2-3× growth.
PA Bus 34K orders = entirely organic. Campaign could spike Tet period significantly.

**Insight:** MoMo only campaigns for Vehicle Insurance. All other products are underinvested in marketing.

## Liberty Voluntary Car: TYPEID='dd' Campaign Created Breakout, Still Running

Liberty Voluntary Car trajectory:
- Pre-campaign (2023-Apr 2025): 2-20 orders/month, stagnant for 2 years
- May 2025: TYPEID='dd' campaign launched → 18 orders (+500%)
- Jun-Feb 2026: 39-76 orders/month (new baseline maintained)
- Organic orders growing: 1-3/month → 13-23/month (self-sustaining)

To replicate for PJICO: launch TYPEID campaign → expect 3-month ramp to new baseline.
Liberty 'dd' campaign still running as of Feb 2026.

## Paylater Lapsed Recency: 66% = 1-3 Months (Act Within 60 Days)

Of 995K lapsed TPB accounts:
- 658K (66%) = warm (1-3 months inactive) → ACT NOW, 30-60 day window
- 100K (10%) = medium (4-6 months)
- 71K (7%) = cold (7-12 months)
- 166K (17%) = very cold (>12 months)

Conversion rate estimates: warm 30-35%, medium 15-20%, cold 5-10%, very cold 2-5%.


## Vehicle Insurance Campaigns: ADDITIVE Not Cannibalistic

Vehicle Insurance organic AND promo grew simultaneously (Oct 2025→Jan 2026):
- Organic: +191% (12,793 → 37,280)
- Promo: +287% (2,898 → 11,204)
- Total: +209% (15,691 → 48,484)

**Campaigns grow the total pie, NOT at the expense of organic.** Scale with confidence.
True annual retention: 30.2% (Jan 2025 cohort renewed in Dec 2025-Feb 2026 window).
70% gap = cohort targeting opportunity each November.

