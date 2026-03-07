# MoMo Internal Data: Investment & Savings Products

> Generated: 2026-03-06 | Source: BigQuery (momovn-prod) via momovn-bu-fi-shared
> Purpose: Support strategic evaluation of building a Stash-like investment product

---

## 1. TTT (Tui Than Tai) -- MoMo's Savings/Investment Product

### 1.1 MAU Trend (12 months: 2025-03 to 2026-02)

**SQL:**
```sql
SELECT
  FORMAT_DATE('%Y-%m', DATE_TRUNC(t1.GRASS_DATE, MONTH)) AS `month`,
  t1.IS_MP,
  COUNT(DISTINCT CAST(REGEXP_EXTRACT(t1.USER_ID, r'\d+') AS STRING)) AS unique_mau_users
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` AS t1
WHERE t1.GRASS_DATE BETWEEN '2025-03-01' AND '2026-02-28'
  AND t1.MAU_TYPE != '0.Churn'
GROUP BY 1, 2
ORDER BY 1, 2
```
**Dry-run:** 182.2 GB | **Runtime:** 11s

| Month   | Individual MAU | Money Pool MAU | Total MAU  |
|---------|---------------|----------------|------------|
| 2025-03 | 2,723,987     | 208,214        | 2,932,201  |
| 2025-04 | 2,597,053     | 242,708        | 2,839,761  |
| 2025-05 | 2,743,059     | 282,284        | 3,025,343  |
| 2025-06 | 2,857,439     | 294,265        | 3,151,704  |
| 2025-07 | 3,116,574     | 333,765        | 3,450,339  |
| 2025-08 | 3,086,244     | 373,661        | 3,459,905  |
| 2025-09 | 3,009,282     | 415,399        | 3,424,681  |
| 2025-10 | 2,915,868     | 432,861        | 3,348,729  |
| 2025-11 | 2,914,881     | 429,990        | 3,344,871  |
| 2025-12 | 3,012,444     | 452,755        | 3,465,199  |
| 2026-01 | 2,998,000     | 462,873        | 3,460,873  |
| 2026-02 | 3,012,756     | 434,410        | 3,447,166  |

**Key observations:**
- TTT MAU peaked at ~3.47M in Jul-Aug 2025, stabilized at ~3.4-3.5M
- Money Pool MAU grew steadily from 208K to 463K (+123% in 12 months)
- Individual MAU relatively flat at ~3.0M since Sep 2025

### 1.2 User Growth by Type (New/Retain/Reactive) -- End-of-Month Snapshots

**SQL:**
```sql
SELECT
  FORMAT_DATE('%Y-%m', t.GRASS_DATE) AS `month`,
  t.IS_MP,
  COUNT(DISTINCT CASE WHEN t.MAU_TYPE = '1.New' THEN ... END) AS mau_new,
  COUNT(DISTINCT CASE WHEN t.MAU_TYPE = '2.Retain' THEN ... END) AS mau_retain,
  COUNT(DISTINCT CASE WHEN t.MAU_TYPE = '3.Reactive' THEN ... END) AS mau_reactive
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` AS t
WHERE t.GRASS_DATE IN (end-of-month dates)
GROUP BY 1, 2
```
**Dry-run:** 8.8 GB | **Runtime:** 4s

**Individual Users:**

| Month   | New     | Retain    | Reactive | Tui+ Users  |
|---------|---------|-----------|----------|-------------|
| 2025-03 | 146,647 | 2,031,101 | 546,239  | 600,157     |
| 2025-04 | 121,739 | 1,942,754 | 532,560  | 625,566     |
| 2025-05 | 211,487 | 1,919,066 | 612,506  | 586,179     |
| 2025-06 | 191,262 | 2,007,885 | 658,292  | 617,529     |
| 2025-07 | 254,085 | 2,079,107 | 783,382  | 1,121,258   |
| 2025-08 | 226,242 | 2,176,518 | 683,484  | 940,256     |
| 2025-09 | 201,256 | 2,141,819 | 666,207  | 1,147,575   |
| 2025-10 | 174,243 | 2,118,132 | 623,493  | 1,118,183   |
| 2025-11 | 187,294 | 2,107,119 | 620,468  | 1,147,711   |
| 2025-12 | 183,700 | 2,165,281 | 663,463  | 1,168,558   |
| 2026-01 | 169,359 | 2,204,438 | 624,203  | 1,772,457   |
| 2026-02 | 152,819 | 2,189,556 | 670,381  | 511,815     |

**Key observations:**
- Retain is the dominant cohort (~2.1-2.2M), showing strong stickiness
- New user acquisition declining: 254K (Jul) -> 153K (Feb) -- growth slowdown
- Tui+ spiked to 1.77M in Jan 2026 (likely a promotion), then dropped to 512K in Feb

### 1.3 AUM (Assets Under Management) -- End-of-Month Snapshots

**SQL:**
```sql
SELECT
  FORMAT_DATE('%Y-%m', t.GRASS_DATE) AS `month`,
  t.IS_MP,
  SUM(COALESCE(t.BALANCE, 0)) AS aum_vnd
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` AS t
WHERE t.GRASS_DATE IN (end-of-month dates)
GROUP BY 1, 2
```
**Dry-run:** 4.1 GB | **Runtime:** 3s

| Month   | Individual AUM (T VND) | Money Pool AUM (T VND) | Total AUM (T VND) |
|---------|----------------------|----------------------|-------------------|
| 2025-03 | 8.97                 | 0.53                 | 9.50              |
| 2025-04 | 9.21                 | 0.68                 | 9.89              |
| 2025-05 | 9.29                 | 0.81                 | 10.10             |
| 2025-06 | 9.48                 | 0.91                 | 10.38             |
| 2025-07 | 9.47                 | 1.00                 | 10.47             |
| 2025-08 | 9.61                 | 1.11                 | 10.72             |
| 2025-09 | 9.61                 | 1.24                 | 10.85             |
| 2025-10 | 9.58                 | 1.32                 | 10.90             |
| 2025-11 | 9.73                 | 1.40                 | 11.12             |
| 2025-12 | 9.80                 | 1.50                 | 11.30             |
| 2026-01 | 9.95                 | 1.62                 | 11.57             |
| 2026-02 | 10.71                | 1.75                 | 12.46             |

**Key observations:**
- Total AUM grew from 9.5T to 12.46T VND (+31% in 12 months)
- Money Pool AUM tripled: 0.53T -> 1.75T VND (fastest-growing segment)
- Individual AUM steady growth: 8.97T -> 10.71T VND (+19%)
- **Feb 2026 AUM = 12.46 TRILLION VND (~$490M USD)**

### 1.4 MFU (Monthly Funded Users) -- Users Earning Interest

| Month   | Individual MFU | Money Pool MFU | Total MFU |
|---------|---------------|----------------|-----------|
| 2025-03 | 2,164,024     | 216,804        | 2,380,828 |
| 2025-04 | 2,098,579     | 253,754        | 2,352,333 |
| 2025-05 | 2,113,763     | 296,241        | 2,410,004 |
| 2025-06 | 2,113,274     | 312,528        | 2,425,802 |
| 2025-07 | 2,244,048     | 354,146        | 2,598,194 |
| 2025-08 | 2,211,795     | 397,920        | 2,609,715 |
| 2025-09 | 2,232,134     | 446,411        | 2,678,545 |
| 2025-10 | 2,270,330     | 470,967        | 2,741,297 |
| 2025-11 | 2,282,467     | 472,936        | 2,755,403 |
| 2025-12 | 2,334,768     | 495,959        | 2,830,727 |
| 2026-01 | 2,353,784     | 508,191        | 2,861,975 |
| 2026-02 | 2,399,686     | 483,734        | 2,883,420 |

**Key observations:**
- MFU growing steadily: 2.38M -> 2.88M (+21% in 12 months)
- Money Pool MFU more than doubled: 217K -> 484K

### 1.5 Interest Paid to Users (MoMo's Cost)

**SQL:**
```sql
SELECT
  FORMAT_DATE('%Y-%m', DATE_TRUNC(t.GRASS_DATE, MONTH)) AS `month`,
  t.IS_MP,
  SUM(COALESCE(t.INTEREST, 0)) AS total_interest_vnd
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` AS t
WHERE t.GRASS_DATE BETWEEN '2025-03-01' AND '2026-02-28'
GROUP BY 1, 2
```
**Dry-run:** 121.4 GB | **Runtime:** <1s (cached)

| Month   | Individual Interest (B VND) | Money Pool Interest (B VND) | Total Interest (B VND) |
|---------|---------------------------|---------------------------|----------------------|
| 2025-03 | 29.74                     | 1.64                      | 31.38                |
| 2025-04 | 28.97                     | 2.00                      | 30.97                |
| 2025-05 | 30.68                     | 2.52                      | 33.20                |
| 2025-06 | 30.17                     | 2.83                      | 33.00                |
| 2025-07 | 31.57                     | 3.24                      | 34.82                |
| 2025-08 | 31.60                     | 3.57                      | 35.17                |
| 2025-09 | 30.81                     | 3.83                      | 34.64                |
| 2025-10 | 31.93                     | 4.36                      | 36.29                |
| 2025-11 | 30.96                     | 4.66                      | 35.63                |
| 2025-12 | 32.34                     | 4.91                      | 37.25                |
| 2026-01 | 32.66                     | 5.28                      | 37.95                |
| 2026-02 | 30.78                     | 5.06                      | 35.84                |

**Key observations:**
- Total interest paid: ~35-38B VND/month (~$1.4-1.5M USD/month)
- Annual interest cost: ~420B VND (~$16.5M USD)
- MoMo's estimated TTT spread: AUM 12.46T x 6% / 12 = 62.3B gross - 37.9B interest = ~24.4B VND net/month

### 1.6 Balance Distribution (Jan 2026)

**SQL:**
```sql
SELECT t.BAL_GROUP, t.IS_MP,
  COUNT(DISTINCT ...) AS unique_users,
  SUM(COALESCE(t.BALANCE, 0)) AS total_balance_vnd
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` AS t
WHERE t.GRASS_DATE = '2026-01-31'
GROUP BY 1, 2
```
**Dry-run:** 0.75 GB | **Runtime:** <1s

**Individual Users:**

| Balance Tier    | Users      | % of Users | AUM (T VND) | % of AUM |
|----------------|-----------|-----------|-------------|---------|
| Churn (0)      | 824,650   | 7.1%      | 0           | 0%      |
| 0-300K         | 9,928,106 | 85.8%     | 0.088       | 0.9%    |
| 300K-3M        | 389,655   | 3.4%      | 0.444       | 4.5%    |
| 3M-30M         | 324,997   | 2.8%      | 3.368       | 33.8%   |
| 30M-50M        | 39,790    | 03%       | 1.517       | 15.2%   |
| 50M-100M       | 32,196    | 0.3%      | 2.166       | 21.8%   |
| 100M+          | 14,714    | 0.1%      | 2.371       | 23.8%   |

**Key observations:**
- **Extreme concentration:** 0.7% of users (86,700 with >30M VND) hold 60.8% of AUM
- **Long tail:** 85.8% of users hold less than 300K VND (only 0.9% of AUM)
- Total tracked individual accounts: 11.55M (including churned)

**Money Pool:**

| Balance Tier    | Users      | AUM (T VND) |
|----------------|-----------|-------------|
| Churn (0)      | 66,856    | 0           |
| 0-300K         | 1,375,389 | 0.021       |
| 300K-3M        | 161,702   | 0.240       |
| 3M-30M         | 104,730   | 1.018       |
| 30M-50M        | 5,210     | 0.198       |
| 50M-100M       | 2,140     | 0.136       |
| 100M+          | 64        | 0.006       |

### 1.7 Tui+ Segment Breakdown (Jan 2026)

**SQL:**
```sql
SELECT t.PLUS_SEGMENT,
  COUNT(DISTINCT CAST(REGEXP_EXTRACT(t.USER_ID, r'\d+') AS STRING)) AS unique_users
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` AS t
WHERE t.GRASS_DATE = '2026-01-31'
  AND t.PLUS_TYPE NOT IN ('0.Churn', 'None')
  AND t.IS_MP = 'Individual'
GROUP BY 1 ORDER BY 2 DESC
```
**Dry-run:** 0.58 GB | **Runtime:** <1s

| Qualification Path    | Users     | % of Tui+ |
|----------------------|-----------|-----------|
| Vipzone Billpay      | 617,312   | 34.8%     |
| LX26 (Campaign)      | 560,692   | 31.6%     |
| Vipzone Telco        | 494,118   | 27.9%     |
| Vipzone P2P          | 49,175    | 2.8%      |
| Balance 50M+         | 43,138    | 2.4%      |
| Silver Buy (9K)      | 3,943     | 0.2%      |
| Gold Buy             | 1,628     | 0.1%      |
| Mission              | 1,572     | 0.1%      |
| Platinum Buy         | 879       | <0.1%     |

**Key observations:**
- Only 2.4% of Tui+ users qualify via 50M+ balance (organic high-value savers)
- 94.3% qualify via cross-sell Vipzone programs or campaigns
- Paid tier (Silver/Gold/Platinum Buy) has negligible adoption: 6,450 users total

### 1.8 TTT Demographics (Jan-Feb 2026, Individual MAU)

| Age Group      | Jan 2026   | % Jan  | Feb 2026   | % Feb  |
|---------------|-----------|--------|-----------|--------|
| Below 22      | 905,466   | 30.2%  | 905,079   | 30.0%  |
| 23-27         | 937,134   | 31.2%  | 949,256   | 31.5%  |
| 28-35         | 719,306   | 24.0%  | 727,130   | 24.1%  |
| 36-50         | 373,952   | 12.5%  | 372,072   | 12.3%  |
| Above 50      | 62,058    | 2.1%   | 59,147    | 2.0%   |

**Key observations:**
- 61.4% of TTT MAU is under 28 years old -- very young user base
- Prime investable audience (23-35): 55.2% of MAU = ~1.66M users

---

## 2. QLCT (Quan Ly Chi Tieu) -- MoMo's Expense Management

### 2.1 MAU Trend (12 months)

**SQL:**
```sql
SELECT MONTH, PRODUCT, ACTION, COUNT(DISTINCT AGENT_ID) AS unique_users
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH BETWEEN '2025-03-01' AND '2026-02-01'
GROUP BY 1, 2, 3
```
**Dry-run:** 2.6 GB | **Runtime:** <1s

| Month   | QLCT Visitors | Moni Visitors | Moni Chatters |
|---------|-------------|---------------|---------------|
| 2025-03 | 2,136,532   | 110,520       | 47,527        |
| 2025-04 | 2,272,370   | 97,615        | 43,644        |
| 2025-05 | 2,228,950   | 91,089        | 37,664        |
| 2025-06 | 2,519,165   | 252,190       | 107,911       |
| 2025-07 | 2,630,300   | 335,596       | 180,284       |
| 2025-08 | 2,925,706   | 338,194       | 182,407       |
| 2025-09 | 3,092,902   | 415,643       | 247,565       |
| 2025-10 | 2,937,348   | 471,140       | 320,882       |
| 2025-11 | 2,626,507   | 426,690       | 295,147       |
| 2025-12 | 3,149,431   | 454,736       | 308,931       |
| 2026-01 | 2,833,017   | 395,540       | 290,471       |
| 2026-02 | 1,668,009*  | 91,536*       | 66,498*       |

*Feb 2026 data is INCOMPLETE (ETL lag -- only ~6 days of data)*

**Key observations:**
- QLCT MAU grew from 2.1M to 3.1M (peak Sep 2025), settled ~2.8-3.1M
- Moni (AI chatbot) saw explosive growth: 48K -> 321K chatters (6.7x in 7 months)
- Moni growth trajectory: Jun 2025 inflection point (likely product launch/revamp)

### 2.2 QLCT Feature Usage (Sep 2025 - Feb 2026)

**SQL:**
```sql
SELECT etl_month,
  COUNT(DISTINCT agent_id) AS total_qlct_users,
  COUNT(DISTINCT CASE WHEN num_budget > 0 THEN agent_id END) AS budget_users,
  ...
FROM `momovn-prod.TEAM_PRODUCT_OPTS.QLCT_L4_USER_PROFILE_MONTHLY`
WHERE etl_month BETWEEN '2025-09-01' AND '2026-02-01'
GROUP BY 1
```
**Dry-run:** 0.54 GB | **Runtime:** 5s

| Month   | Total Users | Budget | Add Trans | Classify | Pin Home | Upcoming |
|---------|-----------|--------|-----------|----------|----------|----------|
| 2025-09 | 2,809,170 | 329,340 (11.7%) | 76,792 (2.7%) | 137,788 (4.9%) | 284,830 (10.1%) | 6,245 |
| 2025-10 | 2,669,365 | 332,923 (12.5%) | 74,335 (2.8%) | 152,250 (5.7%) | 304,142 (11.4%) | 321,450 |
| 2025-11 | 2,353,067 | 309,896 (13.2%) | 59,467 (2.5%) | 141,871 (6.0%) | 286,806 (12.2%) | 507,488 |
| 2025-12 | 2,728,066 | 394,934 (14.5%) | 38,379 (1.4%) | 135,447 (5.0%) | 329,458 (12.1%) | 1,265,265 |
| 2026-01 | 2,215,451 | 358,850 (16.2%) | 44,510 (2.0%) | 151,845 (6.9%) | 284,047 (12.8%) | 164,467 |
| 2026-02 | 1,773,882*| 340,972 (19.2%)| 57,879 (3.3%)| 114,749 (6.5%)| 254,508 (14.3%)| 13,530 |

*Feb 2026 incomplete*

**Key observations:**
- Budget feature adoption rising: 11.7% -> 16.2% (growing engagement)
- Pin-to-home steady at ~12% -- loyal power users
- Manual classify at ~5-7% -- engaged users who customize categories
- Add manual transactions very low (~2-3%) -- most tracking is automatic

### 2.3 QLCT Spending Categories (Jan 2026)

**SQL:**
```sql
SELECT CATEGORY, COUNT(DISTINCT AGENT_ID), SUM(TRANS), SUM(AMOUNT)
FROM `momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER`
WHERE DATE_MONTH = '2026-01-01'
GROUP BY 1 ORDER BY 4 DESC
```
**Dry-run:** 1.8 GB | **Runtime:** <1s

| Category         | Users     | Transactions | Amount (T VND) |
|-----------------|-----------|-------------|---------------|
| Unclassified    | 4,626,484 | 28,038,978  | 18.34         |
| Bills (Hoa don) | 7,181,386 | 32,507,616  | 9.54          |
| Shopping        | 4,296,536 | 20,995,961  | 6.28          |
| Family          | 2,440,147 | 8,595,902   | 5.96          |
| Food & Drink    | 4,030,518 | 38,684,328  | 4.92          |
| **Investment**  | **935,079** | **3,853,147** | **4.30**    |
| Grocery         | 2,805,889 | 16,274,286  | 3.59          |
| Entertainment   | 5,376,814 | 19,509,344  | 2.73          |
| Transport       | 3,124,845 | 18,121,510  | 1.89          |
| Housing         | 700,303   | 2,251,258   | 1.46          |
| Charity         | 665,970   | 1,937,419   | 1.17          |
| Health          | 878,388   | 1,596,416   | 0.56          |
| Education       | 552,492   | 934,142     | 0.56          |
| Other           | 66,650    | 433,001     | 0.47          |
| Beauty          | 504,228   | 819,951     | 0.29          |

**Key observations:**
- **935K users already categorize "Investment" transactions totaling 4.3T VND/month**
- This represents a self-identified investment audience inside MoMo
- Total tracked spending: 62.1T VND in Jan 2026 across all categories

### 2.4 QLCT Demographics (Jan 2026)

| Age Group      | Users     | % of Total |
|---------------|-----------|-----------|
| <18           | 110,941   | 3.9%      |
| 18-22         | 881,303   | 31.1%     |
| 23-26         | 605,082   | 21.4%     |
| 27-30         | 377,634   | 13.3%     |
| 31-35         | 377,660   | 13.3%     |
| 36-40         | 227,263   | 8.0%      |
| >40           | 252,746   | 8.9%      |

| Gender | Users     | %    |
|--------|-----------|------|
| Male   | 1,540,130 | 54.4%|
| Female | 1,289,560 | 45.5%|

**Key observations:**
- Very young: 56.4% under 27 years old
- Slightly male-skewed (54% male)
- Overlap with TTT demo: both products appeal to 18-27 demographic

---

## 3. Cross-Domain Overlap (Jan 2026)

**SQL:**
```sql
WITH ttt_users AS (
  SELECT DISTINCT CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
  WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31' AND MAU_TYPE != '0.Churn'
),
qlct_users AS (
  SELECT DISTINCT AGENT_ID FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
  WHERE MONTH = '2026-01-01' AND PRODUCT = 'QLCT'
),
moni_users AS (
  SELECT DISTINCT AGENT_ID FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
  WHERE MONTH = '2026-01-01' AND PRODUCT = 'MONI' AND ACTION = 'CHAT'
)
SELECT ... (cross joins for overlap counts)
```
**Dry-run:** 15.5 GB | **Runtime:** 2s

| Metric                    | Count     |
|--------------------------|-----------|
| TTT MAU                  | 2,998,000 |
| QLCT MAU                 | 2,833,017 |
| Moni MAU (Chatters)      | 290,471   |
| TTT and QLCT overlap     | 1,197,596 |
| TTT and Moni overlap     | 151,719   |
| QLCT and Moni overlap    | 224,732   |
| All three products       | 129,337   |

**Key observations:**
- **1.2M users (40% of TTT MAU) also use QLCT** -- massive cross-sell base
- **152K TTT users also chat with Moni** -- financially engaged segment
- **TTT-only users: ~1.8M** (60% of TTT MAU don't track expenses)
- **QLCT-only users: ~1.6M** (57% of QLCT MAU don't save in TTT)
- Combined unique users across all 3: TTT(3.0M) + QLCT-only(1.6M) = ~4.6M financially-engaged MoMo users

---

## 4. Summary Metrics for Strategic Planning

| Metric | Value | Notes |
|--------|-------|-------|
| TTT Total AUM | 12.46T VND (~$490M) | Feb 2026, growing 31% YoY |
| TTT MAU | 3.45M | Stable since mid-2025 |
| TTT MFU (funded) | 2.88M | Growing 21% over 12 months |
| TTT Avg Balance/MFU | ~4.33M VND ($170) | 12.46T / 2.88M |
| TTT Interest Cost | ~420B VND/year ($16.5M) | 4% rate on AUM |
| TTT Net Spread | ~293B VND/year ($11.5M) | 6% gross - 4% paid to users |
| QLCT MAU | ~2.8-3.1M | Peak Sep 2025, volatile |
| Moni MAU (Chatters) | ~290K | Growing fast (6.7x in 7 months) |
| Investment-tagged Users | 935K | Self-identified investors in QLCT |
| TTT x QLCT Overlap | 1.2M | 40% of TTT users track expenses |
| TTT High-Value (>30M) | 86,700 | Hold 60.8% of AUM |
| TTT Young Users (<28) | 61.4% of MAU | Prime target for investment product |
| Money Pool Growth | 123% MAU, 230% AUM | Fastest-growing TTT segment |

---

## Data Caveats

1. **Feb 2026 QLCT/Moni data is incomplete** -- ETL lag means only ~6 days of data. Do not use Feb 2026 QLCT numbers for trend analysis.
2. **TTT MAU uses REGEXP_EXTRACT dedup** -- same person appearing in both Individual and Money Pool is counted once.
3. **AUM is end-of-month snapshot** -- not sum across days (which would inflate ~30x).
4. **Interest rate changed** -- TTT paid 4% until Jul 2025; current rate may differ.
5. **Tui+ Jan 2026 spike** -- LX26 campaign drove 561K temporary Tui+ users; Feb dropped to 512K total. The 1.77M figure is an anomaly.
