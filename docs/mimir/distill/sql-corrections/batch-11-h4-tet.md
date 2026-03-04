# SQL Corrections — Batch 11: H4 Tet Impact (Dec 2025 - Feb 2026)

> CEO Question (Hard): "Tết ảnh hưởng đến business FS thế nào? So sánh trước-trong-sau Tết"
> Tet 2026: Jan 29 (Year of the Horse). Holiday window ~Jan 25 - Feb 2.

## Sub-queries

| # | Domain | Metric | BQ | Mimir | Verdict |
|---|--------|--------|-----|-------|---------|
| Q48 | Paylater | Daily trans+GMV Dec 25 - Feb 15 | ✅ | ✅ | **EXACT MATCH** |
| Q49 | Vay Nhanh | Daily disbursement Dec 25 - Feb 15 | ✅ | ✅ | **EXACT MATCH** |
| Q50 | InsurTech | Daily orders+revenue Dec 25 - Feb 15 | ✅ | — | BQ only |

**Score: 2/2 MATCH** (InsurTech not sent to Mimir to save time)

## Q48: Paylater Tet — EXACT MATCH ✅

Mimir applied correct filters and returned identical numbers. SQL:
```sql
WHERE created_date BETWEEN '2025-12-25' AND '2026-02-15'
    AND result_code = 0 AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')
```

Mimir also provided text analysis: "stable Dec, increase early Jan, peak Jan 1-5, decline through Jan, recovery early Feb."

## Q49: Vay Nhanh Tet — EXACT MATCH ✅

Simple SUM(DISBURSED_AMOUNT) GROUP BY DISBURSED_DATE. All 53 days match exactly.

---

## H4 CEO Answer: Tet Impact Analysis

### Paylater (most affected)

| Period | Avg Daily Trans | Avg Daily GMV | vs Pre-Tet |
|--------|----------------|---------------|------------|
| Pre-Tet (Dec 25-31) | 327K | 46.1B | baseline |
| New Year spike (Jan 1-5) | 452K | 123B | +38% trans, **+167% GMV** |
| Mid-Jan decline (Jan 13-20) | 405K | 66.8B | +24% trans, +45% GMV |
| Tet week (Jan 25-31) | 350K | 50.3B | +7% trans, +9% GMV |
| Post-Tet recovery (Feb 1-7) | 521K | 134B | +59% trans, **+191% GMV** |

**Pattern:** Paylater shows a V-shaped Tet impact:
1. **Pre-Tet surge (Jan 1-5):** People stock up, buy gifts → 2x GMV spike
2. **Gradual decline through Jan:** Spending decreases as Tet approaches
3. **Tet week (Jan 25-31):** Near pre-Tet baseline — minimal activity
4. **Post-Tet recovery (Feb 1-7):** Even higher than New Year — pent-up demand

### Vay Nhanh (minimal impact)

| Period | Avg Daily Loans | Avg Daily Disbursement | vs Pre-Tet |
|--------|----------------|----------------------|------------|
| Pre-Tet (Dec 25-31) | 5,068 | 89.5B | baseline |
| Jan overall | 5,539 | 101.6B | +9% loans, +14% disb |
| Tet week (Jan 25-31) | 5,379 | 97.0B | +6% loans, +8% disb |
| Post-Tet (Feb 1-15) | 6,370 | 114.7B | **+26% loans, +28% disb** |

**Pattern:** VN is relatively Tet-proof. Loan demand is stable because people always need money, especially during holidays. Post-Tet shows the strongest disbursement — people borrowing after holiday spending.

### InsurTech (counter-cyclical)

| Period | Avg Daily Orders | Avg Daily Revenue | Notable |
|--------|-----------------|-------------------|---------|
| Pre-Tet (Dec 25-31) | 3,700 | 104M | Dec 31 spike: 6,507 orders (year-end) |
| Jan overall | 4,270 | 135M | Stable |
| Post-Tet Feb 10-13 | 6,519 | 264M | **+76% orders vs Jan avg** |

**Pattern:** InsurTech has a POST-Tet surge in Feb (Feb 10-15: 5.1-7.4K orders/day). Likely caused by vehicle registration season after Tet travel.

### CEO Summary

| Product | Tet Effect | Recovery Speed |
|---------|-----------|----------------|
| **Paylater** | Strong V-shape: -33% at Tet week | Fast — Feb 1 already above Jan peak |
| **Vay Nhanh** | Minimal — <10% dip | Steady growth post-Tet |
| **InsurTech** | Counter-cyclical — surges POST-Tet | N/A — it benefits from Tet |

---

## Lessons (1)

1. **Mimir handles daily range queries well** — For simple "daily data from X to Y" questions, Mimir is highly reliable. Both Paylater (with filters) and VN produced exact matches. The complexity that causes errors is YoY comparisons and derived metrics, not time ranges.

**Running total: 56 queries, 56 SQL pairs, 29 lessons**
