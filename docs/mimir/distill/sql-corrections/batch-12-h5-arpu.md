# SQL Corrections — Batch 12: H5 ARPU (Jul-Dec 2025)

> CEO Question (Hard): "ARPU theo từng sản phẩm, xu hướng 6 tháng gần nhất?"
> Tests derived metric (Revenue/MAU) requiring cross-table JOINs.

## Sub-queries

| # | Domain | BQ | Mimir | Verdict |
|---|--------|-----|-------|---------|
| Q51 | Paylater ARPU (GMV/MAU) | ✅ | ✅ | **EXACT MATCH** |
| Q52 | VN ARPU (disb/borrowers) | ✅ | ✅ | **MISMATCH** (STATUS filter) |
| Q53 | InsurTech ARPU (rev/buyers) | ✅ | — | BQ only |

## Q51: Paylater ARPU — EXACT MATCH ✅

Mimir used CTE with MonthlyGMV + MonthlyMAU from two different tables, correct filters on ALL_TRANS.

| Month | MAU | GMV | ARPU (VND/user) |
|-------|-----|-----|-----------------|
| Jul 2025 | 1.21M | 2.09T | 1,723,773 |
| Aug 2025 | 1.26M | 2.19T | 1,738,350 |
| Sep 2025 | 1.28M | 2.18T | 1,709,403 |
| Oct 2025 | 1.31M | 2.28T | 1,735,321 |
| Nov 2025 | 1.38M | 2.28T | 1,656,667 |
| Dec 2025 | 1.44M | 2.37T | 1,647,855 |

**Trend:** ARPU slightly declining (1.72M → 1.65M). MAU growing faster than GMV.

## Q52: VN ARPU — MISMATCH (MAJOR LESSON)

**Mimir added `STATUS = "DISBURSED"` filter. Our query didn't.**

| Month | Our Borrowers | Mimir Borrowers | Our Disb | Mimir Disb |
|-------|--------------|----------------|----------|-----------|
| Jul | 120,118 | 42,928 | 2.13T | 1.00T |
| Dec | 148,389 | 103,336 | 3.13T | 2.15T |

**Root cause:** DISBURSED_DATE is populated for TWO statuses:
- `DISBURSED` (42,928 in Jul): Active loans, not yet repaid
- `LIQUIDATED` (91,091 in Jul): Fully repaid loans

Our previous gotcha "STATUS filter is redundant" was **WRONG**. Fixed in sql-gotchas.md.

**Which is correct?**
- Mimir's approach: counts only active borrowers → ARPU = 23.4M (Jul) → 20.8M (Dec) — **declining**
- Our approach: counts all borrowers → ARPU = 17.8M (Jul) → 21.1M (Dec) — **growing**

The ARPU trend REVERSES depending on interpretation! For CEO reporting, specify which definition is used.

## Q53: InsurTech ARPU — BQ Only

| Month | Buyers | Revenue | ARPU (VND/buyer) |
|-------|--------|---------|-----------------|
| Jul 2025 | 58,840 | 2.01B | 34,084 |
| Aug 2025 | 65,792 | 2.04B | 31,074 |
| Sep 2025 | 52,345 | 1.80B | 34,305 |
| Oct 2025 | 53,808 | 2.09B | 38,869 |
| Nov 2025 | 56,218 | 2.39B | 42,475 |
| Dec 2025 | 86,197 | 3.29B | 38,152 |

**Trend:** ARPU growing (31K → 42K), dipped Dec due to influx of new buyers (86K vs 56K).

---

## H5 CEO Answer: ARPU Comparison

| Product | Metric | Jul 2025 | Dec 2025 | Trend |
|---------|--------|----------|----------|-------|
| Paylater | GMV/user | 1.72M | 1.65M | Slightly declining (-4%) |
| VN (active) | Disb/borrower | 23.4M | 20.8M | Declining (-11%) |
| VN (all) | Disb/borrower | 17.8M | 21.1M | Growing (+19%) |
| InsurTech | Rev/buyer | 34K | 38K | Growing (+12%) |

**Key insight:** VN ARPU trend depends entirely on whether you count active-only or all borrowers. This is a classic "denominator problem" — the answer changes with the definition.

---

## New Lessons (3)

1. **VN STATUS filter is NOT redundant!** DISBURSED_DATE exists for both DISBURSED and LIQUIDATED statuses. Our previous gotcha was corrected.
2. **VN user column is AGENT_ID** (not BORROWER_ID, which doesn't exist).
3. **Mimir handles cross-table derived metrics (ARPU) well** — Paylater ARPU used correct CTE pattern joining MAU_SEGMENT and ALL_TRANS tables. This is the most complex SQL pattern we've seen Mimir generate correctly.

**Running total: 59 queries, 59 SQL pairs, 32 lessons**
