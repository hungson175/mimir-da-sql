# SQL Corrections — Batch 14: H6 Unit Economics (Jul-Dec 2025)

> CEO Question (Hard): "Mảng nào của FS hiệu quả nhất per-user? Unit economics đơn giản"

## Sub-queries

| # | Domain | Metric | BQ | Mimir | Verdict |
|---|--------|--------|-----|-------|---------|
| Q56 | TTT | Interest per MFU | ✅ | ✅ | **CLOSE** (MFU count differs: REGEXP_EXTRACT) |
| Q57 | CLO | Revenue per contract | ✅ | ✅ | **CLOSE** (DATE_MODIFIED vs DATE_REQUESTED, <3% diff) |

**Combined with H5 data for full picture.**

## Q56: TTT Interest per MFU — CLOSE

Our MFU count (raw user_id): 2.75M → Mimir MFU (REGEXP_EXTRACT): 2.60M (difference: 5.7%).
Interest totals match. Per-user metric slightly different.

| Month | Our Interest/MFU | Mimir Interest/MFU (combined) |
|-------|-----------------|------------------------------|
| Jul | 12,639 | 13,395 |
| Dec | 12,124 | 13,162 |

Mimir also broke down by IS_MP — Individual ~14K/user, Money Pool ~9K/user.

## Q57: CLO Revenue per Contract — CLOSE

Mimir used DATE_MODIFIED (wrong), but per-contract metric is close (<3%):

| Month | Ours (DATE_REQUESTED) | Mimir (DATE_MODIFIED) | Diff |
|-------|----------------------|----------------------|------|
| Jul | 1,546,383 | 1,566,855 | 1.3% |
| Sep | 1,258,912 | 1,253,540 | 0.4% |
| Dec | 1,201,904 | 1,237,610 | 3.0% |

Same trend direction: declining rev/contract (from 1.55M to 1.20M).

---

## H6 CEO Answer: Unit Economics Comparison

| Product | Metric | Jul 2025 | Dec 2025 | Trend | Scale |
|---------|--------|----------|----------|-------|-------|
| **Paylater** | GMV/user | 1.72M | 1.65M | -4% | 1.4M users |
| **VN (active)** | Disb/borrower | 23.4M | 20.8M | -11% | 103K borrowers |
| **CLO** | Rev/contract | 1.55M | 1.20M | -22% | 4K contracts |
| **InsurTech** | Rev/buyer | 34K | 38K | +12% | 86K buyers |
| **TTT** | Interest/MFU | 12.6K | 12.1K | -4% | 3.1M funded users |

**Most efficient per user:** VN (20.8M per borrower) > Paylater (1.65M per user) > CLO (1.20M per contract) > InsurTech (38K per buyer) > TTT (12.1K per funded user)

**Interpretation:** VN has highest per-user value but smallest user base (103K). TTT has lowest per-user value but by far largest base (3.1M). **Scale x Unit Economics** comparison:

| Product | Monthly Revenue/Volume Proxy | User Base | Total |
|---------|------------------------------|-----------|-------|
| Paylater | 2.37T GMV | 1.44M | Dominant |
| VN | 3.13T disbursement | 148K | High-value niche |
| TTT | 37.2B interest | 3.07M | Low-yield, massive base |
| InsurTech | 3.29B revenue | 86K | Small but growing |
| CLO | 4.83B revenue | 4K | Tiny but high-value |

---

## Lessons (2)

1. **TTT interest column is `interest`** (not `interest_gmv` which doesn't exist). Another column name gotcha.
2. **CLO DATE_MODIFIED gives close-enough per-contract metrics** — While wrong for attribution timing, the average revenue per contract is similar (<3%) because most contracts have DATE_REQUESTED and DATE_MODIFIED in the same month. Only total counts/revenue differ significantly between the two date columns.

**Running total: 63 queries, 63 SQL pairs, 36 lessons**
