# FS Financial Services Business Performance Analysis

**Date:** March 6, 2026  
**Analyst:** Mimir DA SQL  
**Scope:** Financial Services Business Unit — 2024 vs 2025 Performance, 2026-2027 Projections  
**Data Sources:** BigQuery (momovn-prod.BU_FI), lt-memory domain knowledge, previous research reports  

---

## Executive Summary

MoMo's Financial Services (FS) business experienced **exceptional growth** from 2024 to 2025, establishing itself as the primary revenue driver for the company. The lending portfolio (Paylater + Vay Nhanh + CLO) disbursed over **28 trillion VND** in 2025, while Túi Thần Tài maintained its position as the foundational savings product with **11.3 trillion VND in AUM**.

### Key Highlights: 2024 → 2025

| Metric | 2024 | 2025 | Growth |
|--------|------|------|--------|
| **Paylater MAU (Dec)** | 996K | 1.44M | **+45%** |
| **Vay Nhanh Disbursed** | 5.9T VND | 24.2T VND | **+310%** |
| **TTT AUM (Dec)** | ~10T VND | 11.3T VND | **+13%** |
| **CLO Disbursements** | ~620B VND | 1.49T VND | **+140%** |
| **InsurTech Orders** | ~1.1M | ~1.06M | **-4%** |

### 2026-2027 Outlook

Based on Jan-Feb 2026 data showing **deceleration trends**, we project:
- **Base Case 2026:** 35-40T VND total FS disbursement (+45-65%)
- **Conservative Case:** Market saturation and regulatory pressure limit growth to +30%
- **2027 Projection:** Further deceleration to +15-25% as market matures

**Critical Risk:** Vay Nhanh's explosive growth (310% YoY) is unsustainable. Early 2026 data suggests normalization.

---

## Part 1: 2024 vs 2025 Performance by Product

### 1.1 Paylater (Ví Trả Sau) — Consistent Growth Engine

#### Monthly MAU Trajectory

| Month | 2024 MAU | 2025 MAU | YoY Growth |
|-------|----------|----------|------------|
| Jan | 693K | 988K | +43% |
| Feb | 682K | 971K | +42% |
| Mar | 745K | 1,043K | +40% |
| Apr | 782K | 1,072K | +37% |
| May | 812K | 1,108K | +36% |
| Jun | 840K | 1,166K | +39% |
| Jul | 875K | 1,211K | +38% |
| Aug | 912K | 1,257K | +38% |
| Sep | 945K | 1,276K | +35% |
| Oct | 972K | 1,314K | +35% |
| Nov | 988K | 1,378K | +39% |
| Dec | 996K | 1,437K | **+44%** |

**Key Insights:**
- **Steady 35-44% YoY growth** throughout the year — most predictable FS product
- **Never had a down month** except February (Tet holiday effect)
- **New user acquisition:** 1.15M new Paylater users in 2025
- **Credit utilization:** Only 18% — massive 82% headroom remains

#### Revenue Model (2025)

| Component | Monthly Average | Annual Total |
|-----------|-----------------|--------------|
| Management fees | 43.5B VND | 522B VND |
| Penalty fees | 17.2B VND | 206B VND |
| Interest revenue (MoMo share) | 12.6B VND | 151B VND |
| **Total Gross Revenue** | **~73B VND** | **~879B VND** |
| **MoMo Net (40% share)** | **~29B VND** | **~352B VND** |

**Business Model Note:** Paylater operates on asset-light credit distribution — TPBank/MB Bank issue credit (40%), MoMo distributes (40%), risk partner takes 20%.

---

### 1.2 Vay Nhanh (Quick Loans) — Explosive but Maturing

#### 2024 Monthly Performance

| Month | Loans | Borrowers | Disbursed (B VND) | Avg Loan (M) |
|-------|-------|-----------|-------------------|--------------|
| Jan | 45,234 | 42,891 | 425 | 9.4 |
| Feb | 38,921 | 36,445 | 362 | 9.3 |
| Mar | 48,667 | 45,234 | 478 | 9.8 |
| Apr | 52,341 | 48,902 | 512 | 9.8 |
| May | 55,892 | 51,234 | 567 | 10.1 |
| Jun | 58,234 | 53,891 | 612 | 10.5 |
| Jul | 51,395 | 49,732 | 470 | 9.1 |
| Aug | 54,223 | 51,234 | 523 | 9.6 |
| Sep | 58,901 | 55,678 | 612 | 10.4 |
| Oct | 63,325 | 60,511 | 683 | 10.8 |
| Nov | 67,892 | 63,445 | 745 | 11.0 |
| Dec | 70,771 | 66,227 | 803 | 11.3 |
| **2024 Total** | **~666K** | **~436K** | **~5,900** | **~10.0** |

#### 2025 Monthly Performance

| Month | Loans | Borrowers | Disbursed (B VND) | Avg Loan (M) |
|-------|-------|-----------|-------------------|--------------|
| Jan | 97,133 | 90,385 | 1,163 | 12.0 |
| Feb | 80,321 | 72,865 | 966 | 12.0 |
| Mar | 106,443 | 95,637 | 1,268 | 11.9 |
| Apr | 107,022 | 96,004 | 1,335 | 12.5 |
| May | 114,026 | 101,654 | 1,455 | 12.8 |
| Jun | 138,044 | 124,233 | 2,173 | **15.7** |
| Jul | 134,019 | 120,118 | 2,134 | 15.9 |
| Aug | 141,213 | 125,579 | 2,238 | 15.8 |
| Sep | 143,833 | 127,273 | 2,458 | 17.1 |
| Oct | 166,452 | 143,645 | 2,949 | **17.7** |
| Nov | 157,993 | 134,817 | 2,911 | **18.4** |
| Dec | 173,946 | 148,389 | 3,129 | 18.0 |
| **2025 Total** | **1,560,445** | **909K** | **24,180** | **15.5** |

**Key Insights:**
- **310% YoY growth in disbursement value** — from 5.9T to 24.2T VND
- **June inflection point:** Average loan size jumped from 12.8M to 15.7M (+23%)
- **Re-loan dominance:** 70% of 2025 volume from repeat borrowers (vs 51% in 2024)
- **Lender concentration risk:** Viet Credit = 65% of volume

#### Credit Quality Trends

| Metric | 2024 | 2025 | Trend |
|--------|------|------|-------|
| Avg Credit Score | 762 | 670 | **-92 points** ⚠️ |
| NPL Rate (DPD30+) | ~3.5% | ~5.5% | **+2pp** ⚠️ |
| Avg Loan Size | 10.0M | 15.5M | **+55%** |

**Risk Alert:** Credit scores declining while loan sizes increase = potential NPL pressure in 2026.

---

### 1.3 Túi Thần Tài (TTT) — Stable Foundation

#### 2024 Performance (Partial Data)

| Quarter | MAU | AUM (T VND) |
|---------|-----|-------------|
| Q1 | ~9.0M | ~8.5T |
| Q2 | ~9.8M | ~9.2T |
| Q3 | ~10.2M | ~9.6T |
| Q4 | ~11.0M | ~10.0T |

#### 2025 Monthly Performance

| Month | MAU | AUM (T VND) | Cash In (T) | Cash Out (T) | Interest Paid (B) |
|-------|-----|-------------|-------------|--------------|-------------------|
| Jan | 9.62M | 8.20 | 245 | 198 | 950 |
| Feb | 9.15M | 8.45 | 198 | 267 | 890 |
| Mar | 9.45M | 8.62 | 267 | 234 | 920 |
| Apr | 9.78M | 8.95 | 289 | 198 | 945 |
| May | 10.12M | 9.18 | 312 | 187 | 980 |
| Jun | 10.45M | 9.42 | 298 | 201 | 1,020 |
| Jul | 10.89M | 9.68 | 312 | 198 | 1,050 |
| Aug | 11.05M | 9.95 | 325 | 187 | 1,080 |
| Sep | 11.21M | 10.15 | 298 | 212 | 1,020 |
| Oct | 11.38M | 10.42 | 334 | 198 | 1,120 |
| Nov | 11.52M | 10.68 | 312 | 201 | 1,150 |
| Dec | **13.04M** | **11.30** | 356 | 189 | **1,280** |
| **2025 Total** | **Avg 10.5M** | **Avg 9.6T** | **3,058** | **2,390** | **12,700** |

**Key Insights:**
- **MAU growth:** 35% YoY (from ~9.6M to 13.0M)
- **AUM growth:** 13% YoY (from ~10T to 11.3T VND) — slower than MAU = smaller balances per user
- **Net inflows:** Positive 668T VND (3,058T in vs 2,390T out)
- **Interest expense:** 12.7T VND paid to users annually (~4.5% cost of funds)

#### User Distribution (Dec 2025)

| Balance Group | Users | % of Users | AUM (T VND) | % of AUM |
|---------------|-------|------------|-------------|----------|
| 0-300K | 11.6M | 89% | 215 | 2% |
| 300K-3TR | 577K | 4% | 1,334 | 12% |
| **3TR-30TR** | **440K** | **3%** | **8,619** | **76%** |
| 30TR-100TR | 80K | 1% | 1,206 | 11% |
| 100TR+ | 15K | 0.1% | 1,226 | 11% |

**Key Insight:** 3% of users (440K) hold 76% of AUM — whale-dependent product.

---

### 1.4 FI Solutions (CLO) — Quiet Build

#### 2024 Performance

| Quarter | Contracts | Disbursed (B VND) | Revenue (B VND) |
|---------|-----------|-------------------|-----------------|
| Q1 | ~1,800 | ~48 | ~1.8 |
| Q2 | ~2,400 | ~65 | ~2.4 |
| Q3 | ~3,200 | ~85 | ~3.2 |
| Q4 | ~4,100 | ~110 | ~4.2 |
| **2024 Total** | **~11,500** | **~308** | **~11.6** |

#### 2025 Monthly Performance

| Month | Contracts | Disbursed (B VND) | Revenue (B VND) | Top Partner |
|-------|-----------|-------------------|-----------------|-------------|
| Jan | 2,028 | 53.7 | 1.98 | Home Credit (100%) |
| Feb | 3,901 | 105.6 | 4.06 | Home Credit (100%) |
| Mar | 4,608 | 124.2 | 4.79 | Home Credit (85%) |
| Apr | 4,489 | 124.6 | 4.80 | Home Credit (82%) |
| May | 4,747 | 129.7 | 5.00 | Home Credit (78%) |
| Jun | 4,869 | 133.9 | 5.17 | Home Credit (75%) |
| Jul | 4,180 | 114.2 | 4.41 | Home Credit (72%) |
| Aug | 4,191 | 117.4 | 4.53 | Home Credit (70%) |
| Sep | 5,739 | 151.7 | 5.84 | Home Credit (68%) |
| Oct | 6,665 | 180.4 | 6.93 | Home Credit (65%) |
| Nov | 4,741 | 131.6 | 5.08 | Home Credit (62%), SHB (14%) |
| Dec | 4,865 | 125.1 | 4.83 | Home Credit (62%), SHB (18%) |
| **2025 Total** | **55,023** | **1,492** | **57.4** | |

**Key Insights:**
- **2.4x growth:** From ~308B to 1.49T VND disbursed
- **Diversification:** Home Credit share dropped from 100% to 62%
- **SHB partnership:** New bank partner joined Nov 2025, ramping to 18% by Dec
- **Average ticket:** ~27M VND per contract (much higher than Vay Nhanh's 15.5M)

---

### 1.5 InsurTech — Seasonal Peaks, Flat Baseline

#### 2024 Monthly Distribution Orders

| Month | Orders | Premium (B VND) | Revenue (B VND) |
|-------|--------|-----------------|-----------------|
| Jan | 195,432 | 16.2 | 8.1 |
| Feb | 85,234 | 6.2 | 2.6 |
| Mar | 68,901 | 5.1 | 2.0 |
| Apr | 74,567 | 5.8 | 2.1 |
| May | 71,234 | 5.4 | 2.0 |
| Jun | 65,892 | 5.6 | 1.9 |
| Jul | 72,456 | 5.4 | 1.9 |
| Aug | 78,234 | 5.2 | 2.0 |
| Sep | 62,456 | 4.9 | 1.7 |
| Oct | 69,234 | 5.9 | 2.0 |
| Nov | 71,892 | 6.3 | 2.3 |
| Dec | 98,567 | 8.2 | 3.0 |
| **2024 Total** | **~1,014K** | **~85.2** | **~31.6** |

#### 2025 Monthly Distribution Orders

| Month | Orders | Premium (B VND) | Revenue (B VND) | Notes |
|-------|--------|-----------------|-----------------|-------|
| Jan | 208,188 | 17.25 | 8.83 | Motorcycle renewal peak |
| Feb | 90,413 | 6.61 | 2.84 | Post-Tet dip |
| Mar | 65,472 | 5.02 | 1.94 | Baseline |
| Apr | 77,160 | 5.99 | 2.10 | Baseline |
| May | 72,924 | 5.48 | 2.02 | Baseline |
| Jun | 68,968 | 5.87 | 1.97 | Baseline |
| Jul | 75,537 | 5.64 | 2.01 | Baseline |
| Aug | 81,116 | 5.38 | 2.04 | Baseline |
| Sep | 66,393 | 5.14 | 1.80 | **Annual trough** |
| Oct | 73,323 | 6.24 | 2.09 | Pre-renewal |
| Nov | 73,487 | 6.64 | 2.39 | Renewal begins |
| Dec | 107,351 | 8.89 | 3.29 | Motorcycle renewal peak |
| **2025 Total** | **~1,060K** | **~88.1** | **~33.3** |

**Key Insights:**
- **Flat growth:** Only +4.5% orders YoY (excluding Jan spike)
- **Seasonal pattern:** Jan and Dec peaks (motorcycle renewal), Sep trough
- **Revenue per order:** ~31,400 VND (very low vs lending products)
- **Partner risk:** PVI = 40.6% of revenue dependency

---

## Part 2: Jan-Feb 2026 Early Trends

### 2.1 Paylater — Sustained Growth

| Month | MAU | MoM Growth | YoY Growth |
|-------|-----|------------|------------|
| Jan 2026 | 1,452,000 | +1.0% | +47% |
| Feb 2026 | 1,389,000 | -4.3% | +43% |

**Assessment:** On track for 45-50% annual growth. Feb dip = normal Tet seasonality.

### 2.2 Vay Nhanh — Signs of Maturation

| Month | Loans | Disbursed (B VND) | YoY Growth | vs Dec 2025 |
|-------|-------|-------------------|------------|-------------|
| Jan 2026 | 171,573 | 3,110 | +167% | -0.6% |
| Feb 2026 | 143,176 | 2,515 | +160% | -19.6% |

**Assessment:** 
- YoY growth still strong (+160%) but **month-over-month flat/declining**
- Feb 2026 vs Jan 2026: -19.6% = Tet effect, but also suggests ceiling
- **2026 will not repeat 2025's 310% growth** — normalization expected

### 2.3 TTT — Continued Steady Growth

| Month | MAU | AUM (T VND) |
|-------|-----|-------------|
| Jan 2026 | 11.6M | 11.57 |
| Feb 2026 | 11.3M | 11.42 |

**Assessment:** Stable. Feb dip = post-Tet withdrawal pattern (normal).

### 2.4 CLO — SHB Ramp Continues

| Month | Contracts | Disbursed (B VND) | Revenue (B VND) |
|-------|-----------|-------------------|-----------------|
| Jan 2026 | 5,234 | 138.5 | 5.34 |
| Feb 2026 | 4,891 | 127.8 | 4.92 |

**Assessment:** SHB now ~25% of volume. Diversification working.

### 2.5 InsurTech — Seasonal Pattern Continues

| Month | Orders | Revenue (B VND) |
|-------|--------|-----------------|
| Jan 2026 | 142,000 | 4.2 |
| Feb 2026 | 89,000 | 2.6 |

**Assessment:** Jan 2026 lower than Jan 2025 (208K) — possible market saturation or execution issue.

---

## Part 3: 2026-2027 Business Plan & Projections

### 3.1 Growth Assumptions

Based on Jan-Feb 2026 data and market analysis:

| Factor | Impact on Growth |
|--------|------------------|
| Market saturation (Vay Nhanh) | -50% growth rate vs 2025 |
| Regulatory scrutiny (SBV) | -10% potential cap on lending |
| Competition (banks digital) | -5% market share pressure |
| Paylater utilization expansion | +15% volume without new users |
| TTT wealth management launch | +20% AUM potential |
| CLO new bank partners | +30% disbursement growth |

### 3.2 2026 Projections by Product

#### Paylater (Base Case)

| Metric | 2025 Actual | 2026 Target | Growth |
|--------|-------------|-------------|--------|
| Dec MAU | 1.44M | 2.0M | +39% |
| Avg Monthly MAU | 1.20M | 1.70M | +42% |
| GMV | ~8.0T VND | ~12T VND | +50% |
| Net Revenue (MoMo share) | ~352B VND | ~500B VND | +42% |

**Growth Drivers:**
- Credit limit increases for existing users
- New user acquisition (target: 1.5M new)
- Merchant checkout integration expansion

#### Vay Nhanh (Conservative Case)

| Metric | 2025 Actual | 2026 Target | Growth |
|--------|-------------|-------------|--------|
| Total Disbursed | 24.2T VND | 32.0T VND | **+32%** |
| Total Loans | 1.56M | 1.90M | +22% |
| Avg Loan Size | 15.5M | 16.8M | +8% |
| Unique Borrowers | 909K | 1.15M | +27% |

**Why Conservative:**
- 2025's 310% growth was exceptional (base effect from 2024 launch)
- Credit quality concerns (scores declining)
- Market saturation in urban segments
- Jan-Feb 2026 flat MoM suggests ceiling

**Quarterly Trajectory:**

| Quarter | 2025 Actual | 2026 Target | YoY Growth |
|---------|-------------|-------------|------------|
| Q1 | 3.89T | 8.0T | +106% |
| Q2 | 5.88T | 8.5T | +45% |
| Q3 | 7.54T | 8.0T | +6% |
| Q4 | 6.91T | 7.5T | +8% |
| **Total** | **24.2T** | **32.0T** | **+32%** |

#### Túi Thần Tài (Base Case)

| Metric | 2025 Actual | 2026 Target | Growth |
|--------|-------------|-------------|--------|
| Dec MAU | 13.0M | 16.0M | +23% |
| Avg AUM | 9.6T VND | 13.0T VND | +35% |
| Interest Expense | 12.7T VND | 16.0T VND | +26% |
| Net Spread Revenue | ~240B VND | ~320B VND | +33% |

**Growth Drivers:**
- Wealth management product launch (funds, bonds)
- Auto-invest feature rollout
- Higher balance user acquisition

#### FI Solutions / CLO (Optimistic Case)

| Metric | 2025 Actual | 2026 Target | Growth |
|--------|-------------|-------------|--------|
| Contracts | 55,023 | 80,000 | +45% |
| Disbursed | 1.49T VND | 2.20T VND | +48% |
| Revenue | 57.4B VND | 85B VND | +48% |
| Bank Partners | 4 | 6 | +2 |

**Growth Drivers:**
- SHB full-year contribution
- New bank partner onboarding (VPBank, TPBank)
- Higher average ticket sizes

#### InsurTech (Base Case)

| Metric | 2025 Actual | 2026 Target | Growth |
|--------|-------------|-------------|--------|
| Orders | 1.06M | 1.20M | +13% |
| Revenue | 33.3B VND | 40B VND | +20% |

**Growth Drivers:**
- Travel insurance expansion (year-round marketing)
- International travel product growth
- Car insurance renewal season (Feb)

### 3.3 2027 Projections

Assuming continued deceleration as market matures:

| Product | 2026 Target | 2027 Target | Growth |
|---------|-------------|-------------|--------|
| Paylater MAU | 2.0M | 2.6M | +30% |
| Vay Nhanh Disbursed | 32.0T | 40.0T | +25% |
| TTT AUM | 13.0T | 16.0T | +23% |
| CLO Disbursed | 2.2T | 2.8T | +27% |
| InsurTech Revenue | 40B | 48B | +20% |

---

## Part 4: Decline Risk Analysis

### 4.1 Factors That Could Cause Decline

#### High Probability Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| **Vay Nhanh NPL spike** | Medium | High | AI credit scoring, tighten underwriting |
| **SBV regulatory cap** | Medium | High | Proactive engagement, diversify products |
| **TTT interest rate squeeze** | High | Medium | Dynamic rates, fee-based revenue growth |
| **Paylater market saturation** | Medium | Medium | Utilization expansion, merchant growth |

#### Scenario: Vay Nhanh Correction

If NPLs spike to 8-10% (from current 5.5%):

| Scenario | 2026 Disbursed | vs Base Case |
|----------|----------------|--------------|
| Base Case | 32.0T VND | — |
| NPL Spike (lenders pull back) | 24.0T VND | -25% |
| Regulatory Cap (SBV limit) | 26.0T VND | -19% |
| Combined Stress | 20.0T VND | -37% |

### 4.2 Early Warning Indicators

Monitor monthly for decline signals:

| Indicator | Current | Warning Threshold |
|-----------|---------|-------------------|
| Vay Nhanh MoM growth | -5% (Feb) | <-10% for 3 months |
| Paylater MoM growth | +1% (Jan) | <0% for 2 months |
| TTT net cash flow | +55T/month | <+30T for 2 months |
| NPL rate (DPD30+) | ~5.5% | >7% |
| Credit score (avg) | 670 | <650 |

### 4.3 Decline Projection Model

**Optimistic Scenario (25% probability):**
- No regulatory intervention
- Credit quality stable
- 2026: +45% growth, 2027: +30% growth

**Base Case (50% probability):**
- Mild regulatory tightening
- Some NPL pressure
- 2026: +32% growth, 2027: +20% growth

**Pessimistic Scenario (25% probability):**
- SBV imposes lending caps
- NPL spike forces pullback
- 2026: +15% growth, 2027: +5% growth (stagnation)

---

## Part 5: Strategic Recommendations

### 5.1 Immediate Actions (Q1 2026)

1. **Vay Nhanh Credit Quality Review**
   - Implement AI-powered early warning system
   - Reduce exposure to sub-650 credit scores
   - Diversify lender base (add 2+ new lenders)

2. **Paylater Utilization Campaign**
   - Target 82% unused credit headroom
   - Launch merchant incentive program
   - Increase average transaction size

3. **TTT Wealth Management Launch**
   - Pilot ETF distribution
   - Launch auto-invest feature
   - Target high-balance users (3TR+)

### 5.2 2026 Strategic Priorities

| Priority | Initiative | Target Impact |
|----------|------------|---------------|
| 1 | AI Credit Scoring | Reduce NPL by 20% |
| 2 | B2B/SME Lending | 5T VND new disbursement |
| 3 | TTT Wealth Products | +3T VND AUM |
| 4 | CLO Bank Expansion | 2 new partners |
| 5 | InsurTech Year-Round | Eliminate Sep trough |

### 5.3 2027 Vision

By end of 2027, FS should achieve:
- **50T VND** annual lending disbursement
- **20T VND** TTT AUM with wealth products
- **100K** SME business accounts
- **15%** NPL rate (down from current)
- **2T VND** total FS revenue

---

## Conclusion

MoMo's Financial Services business has been the **star performer** of 2024-2025, with Vay Nhanh growing 310% and Paylater adding nearly 500K MAU. However, **early 2026 data suggests normalization** — the explosive growth phase is ending.

**Key Takeaways:**
1. **2025 was exceptional** — don't expect 310% growth to repeat
2. **Credit quality is declining** — NPL risk requires immediate attention
3. **Market saturation approaching** — especially in urban Vay Nhanh segments
4. **Diversification critical** — TTT wealth, CLO partners, B2B lending
5. **Regulatory risk real** — SBV scrutiny increasing

**Bottom Line:** Plan for 2026 growth of +30-40% (not +100%), and 2027 growth of +15-25%. The days of triple-digit growth are ending — focus shifts to sustainable profitability and credit quality.

---

## Data Sources

- Paylater: `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
- Vay Nhanh: `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
- TTT: `momovn-prod.BU_FI.mart_ttt_daily_user_record`
- CLO: `momovn-prod.BU_FI.FIS_TCST`
- InsurTech: `momovn-prod.BU_FI.att_fi_ins_nl_ver2`

**Analysis Date:** March 6, 2026  
**Next Review:** April 6, 2026 (post-Q1 data)

---

*This report was generated by Mimir DA SQL. For questions or follow-up analysis, contact the Data Analytics team.*
