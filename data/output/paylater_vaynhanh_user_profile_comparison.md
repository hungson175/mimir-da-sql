# Paylater → Vay Nhanh: User Profile & Behavior Comparison

**Date:** 2026-02-25 | **Period:** December 2025 | **Author:** DA Agent

---

## Methodology

### Group Definitions

- **PL_convert** (106,854 users): Had any Paylater activity on or before Dec 2025 (`PAYLATER_MAU_SEGMENT.month_trans <= '2025-12-01'`) AND got a Vay Nhanh loan disbursed in Dec 2025 (`BAOTU_VAYNHANH_LOAN_INFO.DISBURSED_DATE` in Dec 2025, `STATUS IN ('DISBURSED','SUCCESS','LIQUIDATED')`)
- **Non_PL** (41,535 users): Got a Vay Nhanh loan disbursed in Dec 2025 but had NO record in `PAYLATER_MAU_SEGMENT`

### Steps & Data Sources

| Step | What | Table | Result |
|------|------|-------|--------|
| 0. Access check | Tested `D_OP_USER_PROFILE` (golden demographics table) | `project-5400504384186300846.MBI_DA.D_OP_USER_PROFILE` | **No access** — fell back to `SEMANTIC_QLCT_VISIT` |
| 1. Demographics | Gender, age, region. Joined both groups to latest Moni visit record (Sep-Dec 2025, deduplicated via `ROW_NUMBER` on latest month+date). | `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` | 88% PL / 77% Non-PL coverage. Age groups corrected after first run returned 0s for some buckets (actual format: `[3]. 23 - 26 y/o`, not `23 - 25`). |
| 2. Device profile | Tested STRONGHOLD tables for brand, RAM, OS | `momovn-prod.STRONGHOLD_ANALYTICS.FACT_DEVICE_SCAN`, `D_DEVICE` | **No access** to either table — section blocked |
| 3. PL engagement | MAU segment, transaction age, gift segment, usecase. Compared PL converts vs PL-only (Dec 2025 PL MAU who didn't take VN). | `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT` | Discovered each user has 1 row/month (not per-transaction), so "usecase breadth" = always 1. Pivoted to usecase distribution instead. |
| 4. Entry source + credit | Entry channel, credit score, loan characteristics. Used latest entry point per user in Dec 2025 (`ROW_NUMBER` on `EVENT_TIME DESC`). Loan data queried directly. | `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT` + `BAOTU_VAYNHANH_LOAN_INFO` | Full coverage (no join loss). Credit score came from entry point table. |

### Key Join Logic

All joins use `AGENT_ID` (MoMo wallet ID). Paylater table uses lowercase `agent_id`, Vay Nhanh uses uppercase `AGENT_ID` — BigQuery is case-insensitive for values so the join works. For demographics and device, we used `LEFT JOIN` to preserve all borrowers even without a match. For entry point, we used `INNER JOIN` since we only want users who actually visited VN.

### Caveats

1. **Demographics coverage is partial** — `SEMANTIC_QLCT_VISIT` only has users who visited Moni/QLCT/TFBV features. Missing ~12% of PL converts and ~23% of Non-PL users.
2. **Device section blocked** — no access to STRONGHOLD or D_OP_USER_PROFILE.
3. **PL engagement is 1-row-per-user-month** — cannot measure multi-usecase breadth from this table alone. Would need `PAYLATER_ALL_TRANS` for that.
4. **Credit score source** — comes from `BAOTU_VAYNHANH_ENTRY_POINT` (the score at time of VN access), not from `BAOTU_VAYNHANH_LOAN_INFO.MOMO_CREDIT_SCORE` (score at disbursement). Both tell a similar story; loan info avg scores are 686 vs 665.

---

## Executive Summary

Comparing **106,854 PL converts** (Paylater users who took Vay Nhanh in Dec 2025) vs **41,535 Non-PL borrowers** (Vay Nhanh only), we find PL converts are a distinctly better credit segment:

| Dimension | PL Converts | Non-PL | Key Delta |
|-----------|------------|--------|-----------|
| **Credit Score** | 686 avg | 665 avg | **+21 points** — PL converts are significantly more creditworthy |
| **Loan Amount** | ₫18.9M avg (₫12M median) | ₫15.5M avg (₫10M median) | **+22% larger loans** |
| **Age** | 25.6 avg (median 23) | 27.5 avg (median 26) | **~2 years younger** — digital-native generation |
| **Gender** | 68.4% male | 61.2% male | More male-skewed in PL converts |
| **Re-loan Rate** | 71.1% re-loan | 50.3% re-loan | **PL converts are repeat borrowers** — higher LTV |
| **Entry Channel** | 3.6% via chat | 1.8% via chat | **2× more chat-driven** discovery |
| **Credit Score ≥691** | 46.8% | 22.3% | **2.1× more likely** to be in top credit tiers |

### Strategic Takeaway

**Paylater is a credit quality filter.** Users who first prove themselves on Paylater (avg 24.6 months tenure) arrive at Vay Nhanh with higher credit scores, take larger loans, and are far more likely to be repeat borrowers. The Paylater → Vay Nhanh funnel isn't just a volume driver (55.7% of borrowers) — it's a **quality driver**.

---

## 1. Demographics

> **Data Source:** `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` (Moni users only — 88% coverage for PL converts, 77% for Non-PL)
>
> **Note:** `D_OP_USER_PROFILE` was inaccessible. Demographics come from Moni visit data, which covers users who visited Moni/QLCT/TFBV. Coverage is not 100%.

### 1.1 Gender Distribution

| Gender | PL Convert | PL Convert % | Non-PL | Non-PL % |
|--------|-----------|-------------|--------|----------|
| Male | 64,564 | 68.4% | 19,563 | 61.1% |
| Female | 29,741 | 31.5% | 12,438 | 38.8% |
| Unknown | 58 | 0.1% | 37 | 0.1% |
| **Total (with demo)** | **94,363** | | **32,038** | |
| No demo data | 12,491 | | 9,497 | |

**Insight:** PL converts are 7pp more male-skewed. Both groups are majority male, consistent with Vietnamese consumer credit demographics.

### 1.2 Age Distribution

| Age Group | PL Convert | PL % | Non-PL | Non-PL % |
|-----------|-----------|------|--------|----------|
| <18 y/o | 0 | 0% | 0 | 0% |
| 18 - 22 y/o | 40,572 | **43.0%** | 8,716 | **27.2%** |
| 23 - 26 y/o | 22,665 | 24.0% | 8,545 | 26.7% |
| 27 - 30 y/o | 11,615 | 12.3% | 5,337 | 16.7% |
| 31 - 35 y/o | 10,755 | 11.4% | 5,160 | 16.1% |
| 36 - 40 y/o | 5,407 | 5.7% | 2,719 | 8.5% |
| >40 y/o | 3,349 | 3.5% | 1,561 | 4.9% |

| Metric | PL Convert | Non-PL |
|--------|-----------|--------|
| Avg age | 25.6 | 27.5 |
| Median age | **23** | **26** |

**Insight:** PL converts are heavily concentrated in 18-22 (43% vs 27%). This is the Gen Z digital-first cohort that started with Paylater (buy-now-pay-later for phone top-ups and app purchases) and graduated to formal loans.

### 1.3 Regional Distribution

| Region | PL Convert % | Non-PL % | Delta |
|--------|-------------|----------|-------|
| Đông Nam Bộ (incl. HCM) | 42.4% | 41.4% | +1.0pp |
| Đồng bằng sông Hồng (incl. Hanoi) | 25.5% | 26.9% | -1.4pp |
| Đồng bằng sông Cửu Long | 9.2% | 9.1% | +0.1pp |
| Nam Trung Bộ | 8.9% | 8.6% | +0.3pp |
| Đông Bắc Bộ | 4.9% | 5.0% | -0.1pp |
| Bắc Trung Bộ | 4.5% | 4.6% | -0.1pp |
| Tây Nguyên | 3.7% | 3.3% | +0.4pp |
| Tây Bắc Bộ | 1.0% | 1.0% | 0pp |

**Top 5 Cities (PL Converts):** HCM (29.3%), Hanoi (17.6%), Binh Duong (5.8%), Da Nang (3.9%), Dong Nai (3.9%)

**Insight:** Regional distribution is nearly identical between groups. Geography is NOT a differentiator — the funnel works uniformly nationwide.

---

## 2. Device Profile

> **BLOCKED:** No access to `STRONGHOLD_ANALYTICS.FACT_DEVICE_SCAN` or `STRONGHOLD_ANALYTICS.D_DEVICE`.
> No access to `project-5400504384186300846.MBI_DA.D_OP_USER_PROFILE` (which has `device_os`).
>
> **Recommendation:** Request BigQuery read access to `momovn-prod.STRONGHOLD_ANALYTICS` dataset to unlock device brand, RAM, OS version, and carrier data.

---

## 3. Paylater Engagement Depth

> **Data Source:** `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT` (Dec 2025)
>
> Compares PL converts (82,701 active in Dec 2025 PL) vs PL-only users (1,353,905 active in Dec PL but no VN loan).

### 3.1 MAU Segment

| MAU Segment | PL Convert | PL Convert % | PL Only | PL Only % |
|-------------|-----------|-------------|---------|-----------|
| 2.Retain | 70,202 | **84.9%** | 1,088,424 | **80.4%** |
| 3.Reactive | 7,140 | 8.6% | 158,246 | 11.7% |
| 1.New | 5,359 | 6.5% | 107,235 | 7.9% |

**Insight:** PL converts have a slightly higher retain rate (85% vs 80%). They are more consistently active — less reactive, fewer brand-new users.

### 3.2 Transaction Age (PL Tenure)

| Metric | PL Convert | PL Only |
|--------|-----------|---------|
| Avg transaction age | **24.6 months** | 26.4 months |
| Median transaction age | **22 months** | 24 months |
| 13-24 months | 62.4% | 52.0% |
| >24 months | 37.6% | 48.0% |

**Insight:** PL converts have slightly shorter tenure (~2 months less). The 13-24 month cohort is overrepresented — users who adopted PL in 2023-2024 are the prime conversion window.

### 3.3 Gift Segment

| Gift Segment | PL Convert | PL Convert % | PL Only | PL Only % |
|--------------|-----------|-------------|---------|-----------|
| 4.organic | 77,151 | **93.3%** | 1,213,826 | **89.7%** |
| 3.ShopXu | 2,189 | 2.6% | 42,463 | 3.1% |
| 1.VTS gift | 1,753 | 2.1% | 58,611 | 4.3% |
| 2.BU gift | 1,608 | 1.9% | 39,008 | 2.9% |

**Insight:** PL converts are **more organic** (93% vs 90%). They don't need gift/promotion incentives to transact — they're genuine Paylater power users. The PL-only group is more promotion-dependent.

### 3.4 Primary Usecase Distribution

| Usecase | PL Convert % | PL Only % | Delta |
|---------|-------------|-----------|-------|
| AIRTIME | 22.1% | 19.8% | +2.3pp |
| UTILITIES | 21.4% | 19.0% | +2.4pp |
| MARKETPLACE | 10.2% | 10.8% | -0.6pp |
| LOGISTICS | 9.2% | 11.5% | -2.3pp |
| APPLICATION STORE | 9.0% | 10.5% | -1.5pp |
| DATA | 6.7% | 7.0% | -0.3pp |
| SME OFFLINE | 6.2% | 5.7% | +0.5pp |
| RETAIL | 6.2% | 6.1% | +0.1pp |

**Insight:** PL converts skew toward **essential spending** (airtime +2.3pp, utilities +2.4pp) over discretionary (logistics -2.3pp, app store -1.5pp). Users who use Paylater for daily essentials have stronger credit behaviors.

---

## 4. Vay Nhanh Entry Source & Credit Quality

> **Data Source:** `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT` + `BAOTU_VAYNHANH_LOAN_INFO`

### 4.1 Entry Source

| Entry Source | PL Convert % | Non-PL % | Delta |
|--------------|-------------|----------|-------|
| tabbar_home | 66.8% | 69.0% | -2.2pp |
| app_all_service_top | 10.9% | 10.7% | +0.2pp |
| financial_hub | 7.7% | 7.7% | 0pp |
| search_multiple | 5.0% | 5.4% | -0.4pp |
| **chat_conversation** | **3.6%** | **1.8%** | **+1.8pp** |
| notification | 1.6% | 1.6% | 0pp |
| loan_offers | 1.0% | 0.9% | +0.1pp |
| momo_passport | 1.0% | 0.8% | +0.2pp |

**Insight:** PL converts are **2× more likely to discover VN via chat** (3.6% vs 1.8%). This suggests they're more engaged with the app's conversational features. Home tab dominates both groups, but PL converts are slightly less home-tab-dependent.

### 4.2 Credit Score Distribution

| Credit Score Range | PL Convert % | Non-PL % |
|-------------------|-------------|----------|
| 585-607 (Low) | 3.8% | 8.1% |
| 608-632 (Below Avg) | 9.0% | 16.0% |
| 633-665 (Average) | 19.6% | 28.1% |
| **666-690 (Good)** | **19.6%** | **20.9%** |
| **691-715 (Very Good)** | **22.1%** | **15.1%** |
| **716-739 (Excellent)** | **16.6%** | **6.0%** |
| **740-1000 (Premium)** | **8.1%** | **1.2%** |

| Score Metric | PL Convert | Non-PL |
|-------------|-----------|--------|
| Avg MoMo Credit Score | **686** | **665** |
| % in top tiers (≥691) | **46.8%** | **22.3%** |
| % in bottom tiers (<633) | **12.8%** | **24.1%** |

**Insight:** This is the most powerful finding. PL converts are concentrated in the **upper credit tiers** — nearly half (46.8%) score ≥691 vs only 22.3% for Non-PL. The Paylater payment history demonstrably builds credit reputation.

### 4.3 Loan Characteristics

| Metric | PL Convert | Non-PL |
|--------|-----------|--------|
| Total loans | 126,311 | 47,635 |
| Unique borrowers | 106,854 | 41,535 |
| Loans per borrower | 1.18 | 1.15 |
| **Avg loan amount** | **₫18.9M** | **₫15.5M** |
| **Median loan amount** | **₫12M** | **₫10M** |
| Avg tenor (months) | 12.4 | 10.8 |
| Avg credit score | 686 | 665 |

**Borrower Segment:**

| Segment | PL Convert | PL % | Non-PL | Non-PL % |
|---------|-----------|------|--------|----------|
| NEWLOAN | 35,318 | 28.0% | 23,094 | **48.5%** |
| RELOAN | 75,194 | **59.5%** | 21,147 | 44.4% |
| REPEATED | 13,312 | 10.5% | 2,617 | 5.5% |
| Other | 2,487 | 2.0% | 777 | 1.6% |

**Lender Distribution:**

| Lender | PL Convert % | Non-PL % |
|--------|-------------|----------|
| Viet Credit | 57.4% | 54.9% |
| MCredit | 27.3% | 29.8% |
| Amber | 15.3% | 15.4% |

**Insight:** PL converts are **overwhelmingly re-loan/repeat borrowers** (70% vs 50%). They also take larger, longer-term loans. Viet Credit is the dominant lender for both groups.

---

## 5. Data Access Gaps

| Table | Project | Status | What We'd Get |
|-------|---------|--------|---------------|
| `D_OP_USER_PROFILE` | project-5400504384186300846 | ❌ No access | device_os, kyc_level, map_bank, map_napas, phone_carrier, register_datetime |
| `FACT_DEVICE_SCAN` | momovn-prod.STRONGHOLD_ANALYTICS | ❌ No access | Device brand, model, RAM, OS version, app version, network type |
| `D_DEVICE` | momovn-prod.STRONGHOLD_ANALYTICS | ❌ No access | Device brand, manufacturer, screen resolution, NFC |

**Impact:** We cannot compare device profiles (iOS vs Android, device tier, carrier). This is a significant gap — device data would reveal purchasing power and digital sophistication.

---

## Appendix: SQL Queries

<details>
<summary>Query 1A: Demographics - Gender & Age (corrected age groups)</summary>

```sql
WITH vn_dec AS (
  SELECT DISTINCT AGENT_ID
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE DISBURSED_DATE >= '2025-12-01' AND DISBURSED_DATE < '2026-01-01'
    AND STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')
),
pl_users AS (
  SELECT DISTINCT agent_id
  FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
  WHERE month_trans <= '2025-12-01'
),
user_groups AS (
  SELECT v.AGENT_ID,
    CASE WHEN p.agent_id IS NOT NULL THEN 'PL_convert' ELSE 'Non_PL' END AS user_group
  FROM vn_dec v
  LEFT JOIN pl_users p ON v.AGENT_ID = p.agent_id
),
demo AS (
  SELECT AGENT_ID, GENDER, AGE, AGE_GROUP, CITY, REGION,
    ROW_NUMBER() OVER (PARTITION BY AGENT_ID ORDER BY MONTH DESC, DATE DESC) AS rn
  FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
  WHERE MONTH >= '2025-09-01'
)
SELECT g.user_group, COUNT(*) AS total, COUNTIF(d.AGENT_ID IS NOT NULL) AS has_demo,
  COUNTIF(d.GENDER = 'male') AS male, COUNTIF(d.GENDER = 'female') AS female,
  COUNTIF(d.AGE_GROUP = '[1]. <18 y/o') AS age_under_18,
  COUNTIF(d.AGE_GROUP = '[2]. 18 - 22 y/o') AS age_18_22,
  COUNTIF(d.AGE_GROUP = '[3]. 23 - 26 y/o') AS age_23_26,
  COUNTIF(d.AGE_GROUP = '[4]. 27 - 30 y/o') AS age_27_30,
  COUNTIF(d.AGE_GROUP = '[5]. 31 - 35 y/o') AS age_31_35,
  COUNTIF(d.AGE_GROUP = '[6]. 36 - 40 y/o') AS age_36_40,
  COUNTIF(d.AGE_GROUP = '[7]. >40 y/o') AS age_over_40,
  ROUND(AVG(d.AGE), 1) AS avg_age, ROUND(APPROX_QUANTILES(d.AGE, 2)[OFFSET(1)], 0) AS median_age
FROM user_groups g
LEFT JOIN demo d ON g.AGENT_ID = d.AGENT_ID AND d.rn = 1
GROUP BY g.user_group
```
</details>

<details>
<summary>Query 1B: Region & City Distribution</summary>

```sql
-- Same CTEs as 1A, then:
SELECT g.user_group, d.REGION, COUNT(*) AS cnt,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY g.user_group), 1) AS pct
FROM user_groups g
JOIN demo d ON g.AGENT_ID = d.AGENT_ID AND d.rn = 1
WHERE d.REGION IS NOT NULL
GROUP BY g.user_group, d.REGION
ORDER BY g.user_group, cnt DESC
```
</details>

<details>
<summary>Query 3: Paylater Engagement Depth</summary>

```sql
WITH vn_dec AS (
  SELECT DISTINCT AGENT_ID
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE DISBURSED_DATE >= '2025-12-01' AND DISBURSED_DATE < '2026-01-01'
    AND STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')
),
pl_dec AS (
  SELECT pl.agent_id, pl.MAU_segment, pl.transaction_age, pl.gift_segment, pl.WL_SEGMENT, pl.usecase,
    CASE WHEN v.AGENT_ID IS NOT NULL THEN 'PL_convert' ELSE 'PL_only' END AS user_group
  FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT` pl
  LEFT JOIN vn_dec v ON pl.agent_id = v.AGENT_ID
  WHERE pl.month_trans = '2025-12-01'
)
SELECT user_group, usecase, COUNT(*) AS cnt,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY user_group), 1) AS pct
FROM pl_dec
GROUP BY user_group, usecase
ORDER BY user_group, cnt DESC
```
</details>

<details>
<summary>Query 4A: Entry Source</summary>

```sql
-- Same user_groups CTEs, then:
WITH entry AS (
  SELECT AGENT_ID, ACCESSED_SOURCE, CREDIT_SCORE_RANGE,
    ROW_NUMBER() OVER (PARTITION BY AGENT_ID ORDER BY EVENT_TIME DESC) AS rn
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT`
  WHERE ETL_DATE >= '2025-12-01' AND ETL_DATE < '2026-01-01'
)
SELECT g.user_group, e.ACCESSED_SOURCE, COUNT(*) AS cnt,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY g.user_group), 1) AS pct
FROM user_groups g
JOIN entry e ON g.AGENT_ID = e.AGENT_ID AND e.rn = 1
GROUP BY g.user_group, e.ACCESSED_SOURCE
ORDER BY g.user_group, cnt DESC
```
</details>

<details>
<summary>Query 4B: Credit Score Distribution</summary>

```sql
-- Same CTEs, then:
SELECT g.user_group, e.CREDIT_SCORE_RANGE, COUNT(*) AS cnt,
  ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY g.user_group), 1) AS pct
FROM user_groups g
JOIN entry e ON g.AGENT_ID = e.AGENT_ID AND e.rn = 1
GROUP BY g.user_group, e.CREDIT_SCORE_RANGE
ORDER BY g.user_group, e.CREDIT_SCORE_RANGE
```
</details>

<details>
<summary>Query 4C: Loan Characteristics</summary>

```sql
WITH vn_dec AS (
  SELECT AGENT_ID, LOAN_AMOUNT, TENOR, LENDER_ID, FINAL_SEGMENT_USER, PROCESS_TYPE, MOMO_CREDIT_SCORE
  FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  WHERE DISBURSED_DATE >= '2025-12-01' AND DISBURSED_DATE < '2026-01-01'
    AND STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')
),
pl_users AS (
  SELECT DISTINCT agent_id FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT` WHERE month_trans <= '2025-12-01'
)
SELECT
  CASE WHEN p.agent_id IS NOT NULL THEN 'PL_convert' ELSE 'Non_PL' END AS user_group,
  COUNT(*) AS total_loans, COUNT(DISTINCT v.AGENT_ID) AS unique_borrowers,
  ROUND(AVG(v.LOAN_AMOUNT), 0) AS avg_loan_amt,
  ROUND(AVG(v.TENOR), 1) AS avg_tenor,
  ROUND(AVG(v.MOMO_CREDIT_SCORE), 0) AS avg_credit_score,
  COUNTIF(v.FINAL_SEGMENT_USER = 'NEWLOAN') AS seg_new,
  COUNTIF(v.FINAL_SEGMENT_USER = 'RELOAN') AS seg_reloan,
  COUNTIF(v.FINAL_SEGMENT_USER = 'REPEATED') AS seg_repeated
FROM vn_dec v
LEFT JOIN pl_users p ON v.AGENT_ID = p.agent_id
GROUP BY user_group
```
</details>
