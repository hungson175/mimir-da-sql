# SQL Corrections — Batch 13: H7 Churn & Retention (2025)

> CEO Question (Hard): "Churn rate của từng sản phẩm FS? Sản phẩm nào giữ user tốt nhất?"

## Sub-queries

| # | Domain | BQ | Mimir | Verdict |
|---|--------|-----|-------|---------|
| Q54 | Paylater segment % | ✅ | ✅ | **EXACT MATCH** |
| Q55 | TTT MAU_TYPE (incl. Churn) | ✅ | — | **TIMEOUT** |

## Q54: Paylater Retention — EXACT MATCH ✅

Mimir used identical CTE pattern. Same segment counts and percentages.

**Paylater retention summary 2025:**
- **Retain rate:** 78-82% (very stable, avg 80.2%)
- **New user rate:** 7-9% (healthy intake)
- **Reactive rate:** 11-14% (returning users)
- **Implied churn:** ~11-13% (1 - retain% from previous month)

## Q55: TTT MAU_TYPE — BQ Data (Mimir TIMEOUT)

Critical finding: TTT has massive churn pool.

| Month | Churn | New | Retain | Reactive | Active Total |
|-------|-------|-----|--------|----------|-------------|
| Jan 2025 | 9.10M | 304K | 2.39M | 758K | 3.45M |
| Jun 2025 | 10.14M | 202K | 2.39M | 688K | 3.28M |
| Dec 2025 | 12.21M | 197K | 2.79M | 716K | 3.70M |

**Key insight:** TTT has ~12.2M churned accounts vs 3.7M active. The churn POOL grows every month (9.1M → 12.2M) as new accounts are created and then go inactive. Active Retain grows too (2.39M → 2.79M) but the churn pool grows faster.

**MAU_TYPE vs MFU_TYPE (different metrics!):**
- MAU_TYPE: Active = anyone who logged in/used TTT
- MFU_TYPE: Funded = anyone who has money in TTT

MFU Retain (2.49M Dec from Q43) < MAU Retain (2.79M Dec from Q55). Makes sense — not all active users have funded accounts.

---

## H7 CEO Answer: Retention Comparison

| Product | Retain Rate | Churn Indicator | Assessment |
|---------|------------|-----------------|------------|
| **Paylater** | 80% monthly | Low — only 11% implicit churn | **Best retention** |
| **TTT** | 75% of active pool (Retain/Active) | Growing churn pool (9.1M → 12.2M) | **High churn pool, but Retain growing** |
| **VN** | N/A (no segment data) | N/A | Need different data |
| **InsurTech** | N/A | N/A | Episodic (insurance renewals, not monthly usage) |

**Answer: Paylater has the best user retention at ~80% monthly.** TTT has growing engagement (Retain 2.39M → 2.79M) but also a massive churned account pool.

---

## Lessons (2)

1. **TTT MAU_TYPE vs MFU_TYPE are different metrics** — MAU counts app users, MFU counts funded users. MFU is a subset of MAU. Always specify which when reporting.
2. **Mimir consistently times out on TTT analytical queries** — 3 TTT timeouts across H2, H7 (MFU dist, MAU_TYPE dist). Simple TTT queries (MAU count, AUM) succeed.

**Running total: 61 queries, 61 SQL pairs, 34 lessons**
