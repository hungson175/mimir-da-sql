# SQL Corrections — Batch 9: H1 FS YoY (2024 vs 2025)

> CEO Question (Hard): "Tình hình làm ăn mảng FS năm 2025 so với 2024?"
> First Phase 5 question — tests multi-domain YoY comparison.

## Sub-queries Decomposed

H1 was decomposed into 8 sub-queries across 6 FS domains:
- Q34: Paylater MAU YoY
- Q35: Paylater GMV YoY
- Q36: Vay Nhanh disbursement YoY
- Q37: InsurTech orders + revenue YoY
- Q38: CLO contracts + revenue YoY
- Q39: TTT MAU 2025 trend (no 2024 data available — table starts Jan 2025)
- Q40: Moni MAU Sep 2024 - Dec 2025 (table starts Sep 2024)
- Q41: TTT AUM 2025 trend

## Results Summary

| # | Domain | Metric | Verdict | Key Finding |
|---|--------|--------|---------|-------------|
| Q34 | Paylater | MAU | **EXACT MATCH** | Both use agent_id from PAYLATER_MAU_SEGMENT |
| Q35 | Paylater | GMV | **EXACT MATCH** | Mimir correctly applied result_code=0 + trans_type filters |
| Q36 | Vay Nhanh | Disbursement | **ERROR (Mimir)** | SQL GROUP BY error — EXTRACT column not in GROUP BY |
| Q37 | InsurTech | Revenue + Orders | **CLOSE** | Mimir omitted CC_STATUS filter; <1% diff |
| Q38 | CLO | Revenue + Contracts | **MISMATCH** | Mimir used DATE_MODIFIED (wrong), should be DATE_REQUESTED |
| Q39 | TTT | MAU | **CLOSE** | Individual exact; Money Pool 204K (us) vs 163K (Mimir) |
| Q40 | Moni | MAU | **EXACT MATCH** | All 16 months identical |
| Q41 | TTT | AUM | **MAJOR ERROR (Mimir)** | Summed BALANCE across all days (~30x inflation) |

**Score: 3 MATCH, 2 CLOSE, 1 MISMATCH, 2 ERROR** (3/8 exact, 5/8 match, 5/8 usable)

---

## Q34: Paylater MAU — EXACT MATCH

All 24 months (Jan 2024 - Dec 2025) identical. Mimir SQL:
```sql
SELECT FORMAT_DATE('%Y-%m', month_trans) AS month, EXTRACT(YEAR FROM month_trans) AS year,
    COUNT(DISTINCT agent_id) AS mau
FROM PAYLATER_MAU_SEGMENT WHERE EXTRACT(YEAR FROM month_trans) IN (2024, 2025)
GROUP BY 1, 2 ORDER BY 1, 2
```

**Key trend:** Paylater MAU grew from 693K (Jan 2024) → 1.44M (Dec 2025) = +107% YoY growth.

## Q35: Paylater GMV — EXACT MATCH

Mimir correctly applied all required filters. Jan 2024 GMV: 1.009T ✅
```sql
WHERE result_code = 0 AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')
```

**Key trend:** GMV grew from 1.01T/month (Jan 2024) → 2.37T/month (Dec 2025) = +135% YoY.

## Q36: Vay Nhanh — ERROR (Mimir SQL bug)

Mimir's SQL failed with: "SELECT list expression references column DISBURSED_DATE which is neither grouped nor aggregated"

Mimir tried:
```sql
SELECT FORMAT_DATE('%Y-%m', DISBURSED_DATE) AS month_year,
    EXTRACT(YEAR FROM DISBURSED_DATE) AS year,  -- NOT in GROUP BY!
    EXTRACT(MONTH FROM DISBURSED_DATE) AS month, -- NOT in GROUP BY!
    COUNT(LOAN_ID) AS total_disbursed_loans, SUM(DISBURSED_AMOUNT) AS total_disbursed_amount
```
Missing EXTRACT columns in GROUP BY clause.

**Our data:** VN disbursement grew from 454B/month (Jan 2024) → 3.13T/month (Dec 2025) = +590% YoY growth.
**Learning:** Mimir struggles with YoY queries that need year/month extraction + grouping for VN domain.

## Q37: InsurTech Revenue + Orders — CLOSE

| Month | Our Revenue (CC_STATUS=SUCCESS) | Mimir Revenue (no filter) | Diff |
|-------|-------------------------------|--------------------------|------|
| 2024-01 | 2.026B | 2.027B | 0.09% |
| 2025-01 | 8.827B | 8.831B | 0.04% |
| 2025-12 | 3.289B | 3.295B | 0.18% |

Consistent with batch-7 finding: CC_STATUS filter is nearly redundant for revenue.

**Key trend:** InsurTech had a massive Jan 2025 spike (208K orders, 8.8B revenue — 4x normal). Then normalized. Dec 2025 also elevated (107K orders, 3.3B). Overall 2025 revenue +43% vs 2024.

## Q38: CLO Revenue + Contracts — MISMATCH

Mimir used `DATE_MODIFIED` instead of `DATE_REQUESTED`:
```sql
-- Mimir (WRONG for revenue)
WHERE EXTRACT(YEAR FROM DATE_MODIFIED) = 2024 AND SERVICE_TYPE = 'CLO'
-- Ours (CORRECT per batch-5 lesson)
WHERE DATE_REQUESTED BETWEEN '2024-01-01' AND '2024-12-31' AND SERVICE_TYPE = 'CLO'
```

Mimir's result: Jan-May 2024 showed 0 contracts (because DATE_MODIFIED doesn't reflect when revenue was generated). Our query shows activity starting Jan 2024.

**Key trend (our data):** CLO exploded in 2025 — from 41K contracts/month (Jan 2024) → 407K contracts/month (Dec 2025). Revenue tracking started Oct 2024 (~1B/month) → peaked 6.9B (Oct 2025).

**Learning:** CLO DATE_MODIFIED vs DATE_REQUESTED remains a persistent Mimir error. DATE_MODIFIED reflects contract state changes, DATE_REQUESTED reflects when service was requested (correct for revenue attribution).

## Q39: TTT MAU — CLOSE (Individual match, Money Pool diverges)

| Month | IS_MP | Our MAU (raw user_id) | Mimir MAU (REGEXP_EXTRACT) | Diff |
|-------|-------|----------------------|---------------------------|------|
| 2025-01 | Individual | 3,247,552 | 3,247,552 | 0% |
| 2025-01 | Money Pool | 204,247 | 162,773 | -20.3% |
| 2025-06 | Individual | 2,857,439 | 2,857,439 | 0% |
| 2025-06 | Money Pool | 426,313 | 294,265 | -31.0% |
| 2025-12 | Individual | 3,012,444 | 3,012,444 | 0% |
| 2025-12 | Money Pool | 690,883 | 452,755 | -34.5% |

**Pattern:** Individual always matches exactly. Money Pool MAU is 20-35% lower when using REGEXP_EXTRACT.

**Root cause:** `REGEXP_EXTRACT(USER_ID, r'\d+')` extracts only the first digit sequence. Different Money Pool user_ids (e.g., "MP_12345_v1" and "MP_12345_v2") collapse to the same number "12345", reducing count.

**Which is correct?** Depends on business context:
- **Raw user_id** (our approach): counts distinct accounts = 690K Money Pool MAU
- **REGEXP_EXTRACT** (Mimir's approach): counts distinct underlying humans = 453K Money Pool MAU
- Individual is unaffected because user_ids are just numbers

**Updated gotcha:** Previous rule "use raw user_id when GROUP BY IS_MP" may overcoun Money Pool. Mimir's REGEXP_EXTRACT approach may be more accurate for counting unique humans. **Need to verify with domain owner which is the intended metric.**

## Q40: Moni MAU — EXACT MATCH

All 16 months (Sep 2024 - Dec 2025) identical. ✅

**Key trend:** Moni launched Sep 2024 (14K), peaked Nov 2024 (88K), dipped to Mar-May 2025 (38-48K), then SURGED Jun 2025 onward. Dec 2025: 309K. Likely product improvements mid-2025.

## Q41: TTT AUM — MAJOR ERROR (Mimir)

Mimir's SQL:
```sql
SELECT LAST_DAY(GRASS_DATE, MONTH) AS month, IS_MP, SUM(BALANCE) AS aum
FROM mart_ttt_daily_user_record
WHERE GRASS_DATE BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY 1, 2
```

**Problem:** Sums BALANCE across ALL days in the month. Result: 260T VND (Jan Individual).
**Our end-of-month snapshot:** 8.8T VND (Jan Individual).
**Ratio:** 260T / 8.8T = ~29.5x ≈ 31 days in January.

Mimir's AUM is inflated by the number of days in each month because it sums daily snapshots instead of taking end-of-period snapshot.

**Correct AUM pattern:**
```sql
-- End-of-month snapshot (our approach)
WHERE EXTRACT(DAY FROM GRASS_DATE) = 28  -- or LAST_DAY()
-- OR use avg_balance column (pre-calculated)
SELECT SUM(avg_balance) AS aum
```

---

## New Lessons (6)

1. **InsurTech revenue column is `final_rev`** — not `REVENUE` (which doesn't exist). Table also has `rev_after_sharing` and `amount`.
2. **PAYLATER_MAU_SEGMENT user column is `agent_id`** — not `user_id` (which doesn't exist in this table). Contrast with PAYLATER_ALL_TRANS where user column IS `user_id`.
3. **TTT Money Pool REGEXP_EXTRACT reduces MAU by 20-35%** — Mimir uses REGEXP_EXTRACT even when GROUP BY IS_MP. Our previous rule "use raw user_id with GROUP BY IS_MP" may overcount. Need domain owner confirmation.
4. **Mimir TTT AUM: sums across all days (~30x inflation)** — Must use end-of-month snapshot or avg_balance column. Mimir does NOT handle AUM correctly.
5. **Mimir VN YoY query: SQL construction error** — For complex date comparisons, Mimir sometimes generates invalid GROUP BY clauses.
6. **Mimir CLO: DATE_MODIFIED error persists** — Confirmed again that Mimir uses DATE_MODIFIED for CLO queries. Correct column for revenue is DATE_REQUESTED.

**Running total: 46 queries, 46 SQL pairs, 26 lessons**

---

## Business Insights for H1 (CEO Answer)

### FS Performance 2025 vs 2024

| Product | Metric | 2024 Total/Avg | 2025 Total/Avg | YoY Growth |
|---------|--------|----------------|----------------|------------|
| Paylater | MAU (Dec) | 996K | 1.44M | +44% |
| Paylater | GMV (annual) | 13.4T | 22.6T | +69% |
| Vay Nhanh | Disbursement (annual) | 7.1T | 24.2T | +241% |
| Vay Nhanh | Loans (annual) | 688K | 1.56M | +127% |
| InsurTech | Revenue (annual) | 22.6B | 32.3B | +43% |
| CLO | Revenue (Oct-Dec only comparable) | 3.9B | 16.8B (Oct-Dec) | +331% |
| TTT | MAU Individual (Dec) | N/A | 3.0M | — |
| TTT | MAU Money Pool (Dec) | N/A | 691K | — |
| Moni | MAU (Dec) | 81K | 309K | +280% |

**Winners:** Vay Nhanh (+241% disbursement), Moni (+280% MAU), CLO (+331% revenue)
**Steady growers:** Paylater (+69% GMV, +44% MAU), InsurTech (+43% revenue)
**No YoY data:** TTT (table starts Jan 2025)
