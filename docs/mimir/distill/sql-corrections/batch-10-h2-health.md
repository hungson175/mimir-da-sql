# SQL Corrections — Batch 10: H2 Product Health (2025)

> CEO Question (Hard): "Sản phẩm FS nào đang healthy, sản phẩm nào cần lo?"
> Requires multi-signal analysis: MAU growth, retention, revenue trend, new user ratio.

## Sub-queries

| # | Domain | Query | Source |
|---|--------|-------|--------|
| Q42 | Paylater | MAU segment (New/Retain/Reactive) 2025 | BQ ✅ |
| Q43 | TTT | MFU_TYPE distribution 2025 | BQ ✅ |
| Q44 | All | Growth rates calculated from H1 data | Derived |
| Q45 | Paylater | Retention question to Mimir | Mimir MATCH ✅ |
| Q46 | TTT | MFU distribution to Mimir | Mimir TIMEOUT |
| Q47 | VN | Growth MoM to Mimir | Mimir TIMEOUT |

## Q42: Paylater MAU Segments — Our Data

| Month | New | Retain | Reactive | Total | Retain% |
|-------|-----|--------|----------|-------|---------|
| Jan 2025 | 93K | 788K | 107K | 989K | 79.7% |
| Jun 2025 | 110K | 926K | 131K | 1.17M | 79.4% |
| Dec 2025 | 113K | 1.16M | 165K | 1.44M | 80.7% |

**Assessment:** HEALTHY. Retain% stable/improving (79.7% → 80.7%). New user intake growing. Total MAU +44% YoY.

## Q43: TTT MFU Distribution — Our Data

| Month | New | Retain | Reactive | Total MFU | Retain% |
|-------|-----|--------|----------|-----------|---------|
| Jan 2025 | 293K | 1.92M | 281K | 2.49M | 77.0% |
| Jun 2025 | 207K | 2.12M | 236K | 2.56M | 82.7% |
| Dec 2025 | 268K | 2.49M | 312K | 3.07M | 81.1% |

**Assessment:** HEALTHY. Retain% improved from 77% → 81%. Total MFU grew 23% (2.49M → 3.07M).

## Q45: Paylater Segments — EXACT MATCH ✅

Mimir returned exact same segment counts. Also calculated percentages and created a trend chart.
- Mimir SQL used correct `MAU_segment` column names ('1.New', '2.Retain', '3.Reactive')
- Used CTE pattern: MonthlyTotal + SegmentedUsers + percentage calculation
- **No SQL errors, no column name issues, no missing filters**

This is notable because previous Paylater queries had column name errors on PAYLATER_ALL_TRANS. The PAYLATER_MAU_SEGMENT table works well for Mimir.

## Q46: TTT MFU — TIMEOUT

Mimir did not respond within 2 minutes. TTT queries on large tables sometimes timeout for complex aggregations.

## Q47: VN Growth MoM — TIMEOUT

Same as Q46 — Mimir did not respond.

**Learning:** Mimir sometimes times out on complex analytical queries (MoM growth, multi-metric breakdowns). Simple aggregations succeed, but derived metrics may fail.

---

## H2 CEO Answer: Product Health Dashboard

### Health Assessment (based on H1 + H2 data)

| Product | MAU Trend | Revenue Trend | Retention | New Users | Verdict |
|---------|-----------|---------------|-----------|-----------|---------|
| **Paylater** | +44% YoY | +69% GMV YoY | 80.7% retain | 113K/mo | **HEALTHY** |
| **Vay Nhanh** | N/A | +241% disb YoY | N/A | N/A | **STRONG GROWTH** |
| **TTT** | Stable ~3M Ind | N/A (no 2024) | 81% retain | 268K/mo | **HEALTHY** |
| **InsurTech** | +43% rev YoY | +43% YoY | N/A | N/A | **MODERATE** |
| **CLO** | +331% rev YoY | +331% rev YoY | N/A | N/A | **EXPLOSIVE GROWTH** |
| **Moni** | +280% MAU YoY | N/A | N/A | N/A | **STRONG GROWTH** |

### Products to Watch

1. **InsurTech** — Lowest trust level, metadata issues. Jan 2025 spike (208K orders) looks anomalous — investigate if campaign-driven or organic. Without the spike, growth is more modest.

2. **TTT Individual MAU** — Declining Jan-Apr 2025 (3.25M → 2.60M), recovered by Jul (3.12M). May indicate seasonal pattern. Money Pool MAU steadily growing (162K → 691K). Watch the Individual segment.

3. **Vay Nhanh** — Explosive growth (+241%) but no retention/segment data available. Pure disbursement growth without understanding user quality could be risky.

---

## New Lessons (2)

1. **Mimir times out on complex analytical queries** — MFU distribution with GROUP BY month, derived metrics (MoM growth). Simple single-metric aggregations work; multi-step analytical queries may timeout. Consider breaking into simpler sub-questions.
2. **Paylater MAU_SEGMENT table works reliably for Mimir** — No column name errors, correct segment values, good chart generation. Contrast with PAYLATER_ALL_TRANS which has 3 known column name errors.

**Running total: 53 queries, 53 SQL pairs, 28 lessons**
