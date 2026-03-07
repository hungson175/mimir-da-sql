# MoMo Business Potential Assessment: 2023-2025 Data + 2026-2027 Strategy

**Research Date:** February 28, 2026
**Data Sources:** BigQuery (BU_FI, MBI_DA datasets) + Market Research (Google/Temasek/Bain e-Conomy SEA 2025, IMARC, Mordor Intelligence, GlobalNewsWire)
**Prepared for:** C-level strategic planning

---

## Executive Summary

Based on 3 years of MoMo transaction data and comprehensive Vietnamese market research:

**Top 3 highest-potential businesses for 2026-2027:**
1. **Vay Nhanh (Digital Lending)** — 24.2T VND disbursed in 2025, 7.6x growth in 2 years, only 3% user penetration
2. **Paylater (BNPL)** — 2.49M users, gateway product that feeds Vay Nhanh (55.5% conversion)
3. **InsurTech** — Fastest growing fintech vertical (CAGR 27.24%), post-bancassurance white space

**Key insight:** MoMo's payment layer is mature (P2P revenue declining). The profit engine has shifted to **lending**, and the next frontier is **insurance + wealth management**, all powered by **AI** on 31M users' behavioral data.

---

## Part 1: MoMo Data Analysis (BigQuery 2023-2025)

### 1.1 Vay Nhanh (Quick Loans) — The Rocket

| Metric | 2023 | 2024 | 2025 | Growth |
|--------|------|------|------|--------|
| Total Disbursed | 3.2T VND | 5.95T VND | **24.2T VND** | 7.6x in 2 years |
| Monthly Peak | 418B (Dec) | 978B (Dec) | **3.13T (Dec)** | 23x from Jan '23 |
| Unique Borrowers | 281K | 436K | **909K** | 3.2x |
| Avg Loan Size | 9.4M VND | 10.6M VND | **15.5M VND** | +65% |
| Total Loans | 341K | 563K | **1.56M** | 4.6x |

**Monthly Disbursement Trend:**
```
Jan 2023:  135B VND  |===
Jun 2023:  320B VND  |======
Dec 2023:  418B VND  |========
Jun 2024:  ---       |(data gap)
Dec 2024:  978B VND  |===================
Jun 2025:  2.17T VND |===========================================
Dec 2025:  3.13T VND |==============================================================
```

**Key dynamics:**
- **Re-loan dominance (2025):** Re-loans = 16.8T VND (70%) vs First-time = 7.3T (30%). Strong product-market fit.
- **Lender shift:** Viet Credit became #1 in 2025 (15.7T of 24.2T = 65%), displacing Amber. Multi-lender marketplace working.
- **Credit expansion:** Avg credit score dropped 762 → 670 — penetrating deeper into underbanked. NPL risk to monitor.
- **New vs Re-loan borrowers:** 611K first-time + 507K re-loaners = healthy mix

**Lender Breakdown (2025):**
| Lender | Borrowers | Disbursed | Share |
|--------|-----------|-----------|-------|
| Viet Credit | 593K | 15.7T VND | 65% |
| MCredit | 220K | 5.1T VND | 21% |
| Amber | 228K | 3.4T VND | 14% |

### 1.2 Paylater (BNPL) — The Engine

| Metric | 2023 | 2024 | 2025 | Growth |
|--------|------|------|------|--------|
| Dec MAU | 682K | 996K | **1.44M** | 2.1x |
| Unique Users/Year | 1.4M | 1.76M | **2.49M** | 1.8x |
| New Users/Year | 734K | 763K | **1.15M** | +57% |

**Monthly MAU Trajectory:**
```
Jan 2023: 507K  |==========
Jun 2023: 597K  |============
Dec 2023: 682K  |==============
Jun 2024: 782K  |================
Dec 2024: 996K  |====================
Jun 2025: 1.17M |=======================
Dec 2025: 1.44M |=============================
```

**Quarterly Average MAU:**
| Quarter | Avg MAU | QoQ Growth |
|---------|---------|------------|
| Q1 2023 | 513K | — |
| Q4 2023 | 667K | — |
| Q4 2024 | 934K | +40% YoY |
| Q4 2025 | 1.38M | +48% YoY |

**Top Usecases by Users (2025):**
| Usecase | Users | Growth vs 2023 |
|---------|-------|-----------------|
| Airtime | 1.12M | +69% |
| Utilities | 881K | +106% |
| App Store | 674K | +109% |
| Marketplace | 644K | +69% |
| Logistics | 594K | **+141%** |
| Data | 482K | +184% |
| Insurance | 47K | **+250%** |
| Cinema | 201K | +117% |

**Key insight:** Logistics (+141%) and Insurance (+250%) are the fastest-growing usecases — signals where credit demand is expanding.

### 1.3 Tui Than Tai (Money Market/Micro-Investing) — Steady Foundation

| Metric | Q1 2025 | Q4 2025 | In-Year Growth |
|--------|---------|---------|----------------|
| Users | 9.9M | **11.3M** | +14.5% |
| AUM | 9.0T VND | **9.8T VND** | +8.9% |
| Interest/Quarter | ~930M VND | ~1.03B VND | +10.5% |

- 11.3M users = MoMo's largest financial product by user count
- AUM per user ~866K VND — small amounts but massive base
- Low-yield, high-stickiness product that keeps users in MoMo ecosystem

### 1.4 P2P Revenue (Payments/Transfers) — Mature, Revenue Declining

| Metric | 2023 | 2024 | 2025 | Trend |
|--------|------|------|------|-------|
| Revenue | 518B VND | **705B VND** | 529B VND | Peak then decline |
| Txn Volume | 897M | 1.13B | **1.29B** | +44% growing |
| Txn Value | 380T VND | 440T VND | **501T VND** | +32% growing |
| Paid Users | 2.2M | 2.5M | **2.1M** | Declining |

**Monthly Revenue Trend (key moments):**
```
Jan 2023: 41B VND (baseline)
Jul 2024: 68B VND (PEAK)
May 2025: 33B VND (trough — fee reduction)
Dec 2025: 50B VND (partial recovery)
```

Volume growing but revenue declining = fee compression from free VietQR transfers via banking apps. P2P is now a retention tool, not a profit center.

---

## Part 2: Vietnamese Market Context

### 2.1 Macro Environment

| Factor | Value | Source |
|--------|-------|--------|
| Vietnam digital economy 2025 | **$39B** (+17% YoY) | e-Conomy SEA 2025 |
| Digital economy % of GDP | **18.3%** | VietnamNet |
| GDP growth 2024 | **7.09%** (highest in SEA) | National Assembly |
| Internet penetration | **84%** (80M users) | DataReportal |
| Smartphone penetration | **84%** | VietnamPlus |
| Daily AI users | **81%** (highest in SEA) | Google/Bain |
| E-wallet market 2024 | **$41.6B** | IMARC |
| SBV cashless target 2030 | **80%** of transactions | Decree 52 |

### 2.2 Competitive Landscape

| Player | Share | Users | Key Strength |
|--------|-------|-------|-------------|
| **MoMo** | ~56% | 31M+ | Super app, first profitability 2024, deepest financial product suite |
| **ZaloPay** | ~23% | 21M | Zalo 100M+ user integration, 60% lower CAC, cross-border QR |
| **VNPay** | ~15% | — | Embedded in 40+ banking apps, infrastructure play |
| **ShopeePay** | — | — | Captive Shopee e-commerce traffic, SPayLater |
| **Viettel Money** | — | — | 95M+ telecom subscribers, rural reach |

### 2.3 Market Size by Vertical

| Vertical | 2024 Size | Growth | 2030 Projection |
|----------|-----------|--------|-----------------|
| BNPL | $1.91B | 36.5% YoY | **$8.51B** (CAGR 26.7%) |
| Alternative Lending | $8.68B | 14.2% YoY | **$16.63B** |
| InsurTech | — | **CAGR 27.24%** | Fastest vertical |
| E-wallet | $41.6B | 13.9% CAGR | $152.3B by 2033 |
| QR payments | — | **106.7% volume growth** | Leading payment method |

### 2.4 Regulatory Environment

| Regulation | Impact |
|-----------|--------|
| Circular 41/2025 | E-wallet cap VND 100M/month, biometric KYC, single brand per provider |
| Decree 52/2024 | First-ever e-money definition, SBV National Payment Strategy |
| BNPL regulation (expected 2025-26) | Mandatory disclosures, late-fee caps, eligibility checks |
| Law on Credit Institutions 2024 | e-KYC for credit, embedded lending via fintech channels |
| Cross-border QR | Vietnam-China live Dec 2025, Korea/Japan in pipeline |

---

## Part 3: Business Potential Ranking

### Rank 1: Vay Nhanh (Digital Lending) — Highest Growth + Revenue

**Why #1:**
- 24.2T VND disbursed in 2025 = massive revenue engine (lending margins >> payment margins)
- Only 909K borrowers out of 31M MoMo users = **3% penetration** — enormous runway
- 70% re-loan rate proves product-market fit
- 55.5% of all Vay Nhanh borrowers came from Paylater (proven cross-sell funnel)
- Vietnam alt-lending market: $8.68B → $16.63B by 2029

### Rank 2: Paylater (BNPL) — The Gateway to Financial Services

**Why #2:**
- 2.49M unique users, growing 41% YoY
- Vietnam BNPL market growing 36.5% to $2.61B in 2025
- Only ~5% of Vietnamese have credit cards — BNPL is the default credit product
- Trains users on credit behavior, builds history for Vay Nhanh conversion
- BNPL regulation will consolidate market around licensed players (MoMo advantage)

### Rank 3: InsurTech — Blue Ocean, Fastest CAGR

**Why #3:**
- InsurTech CAGR 27.24% = fastest fintech vertical in Vietnam
- Insurance penetration only ~3% of GDP (vs 5% SEA average)
- Post-bancassurance scandal created white space for digital distribution
- Paylater Insurance usecase grew +250% (2023→2025)
- Embedded micro-insurance (travel, phone, health) has natural fit in MoMo flows

### Rank 4: Tui Than Tai (Wealth Management) — Long-term Stickiness

**Why #4:**
- 11.3M users — largest financial product by count
- Only 3% mutual fund penetration in Vietnam
- AUM per user only 866K VND — massive room to grow
- Keeps users depositing daily (habit formation), source of funds for ecosystem

### Rank 5: P2P Payments — Infrastructure, Not Growth Driver

**Why #5:**
- Volume growing but revenue declining (fee compression from VietQR)
- Retention tool + data collection engine, not profit center
- Value is in cross-sell and credit scoring data, not transaction fees

---

## Part 4: Strategic Recommendations for 2026-2027

### Recommendation 1: Scale Vay Nhanh Aggressively (with Risk Management)

**Target:** 3% → 8-10% user penetration = 2.5-3M borrowers
**Actions:**
- Add more lender partners beyond Viet Credit/Amber/MCredit — banks want this channel
- Build proprietary credit scoring using Paylater history, TTT savings, P2P patterns
- Introduce graduated products: Paylater (small) → Vay Nhanh (medium) → bank partner loans (large)
- **Critical:** Avg credit score dropped to 670. Build better NPL prediction with AI before expanding further.

**Why now:** BNPL regulation coming 2025-2026 consolidates market around licensed, data-rich players. MoMo has both.

### Recommendation 2: Build InsurTech as Next Revenue Pillar

**Target:** 500K+ policies by end 2027
**Actions:**
- Embed micro-insurance into existing flows: travel insurance at OTA checkout, phone protection at App Store, health insurance at BNPL enrollment
- Target 2.49M Paylater users who are already comfortable with MoMo financial products
- Partner with 3-4 carriers for white-label products (risk-sharing, not just commissions)
- Use AI to personalize insurance offers based on transaction patterns

**Why now:** Post-bancassurance scandal = white space. 97% uninsured. CAGR 27.24% with almost no e-wallet competition.

### Recommendation 3: Accept P2P Revenue Decline, Monetize Through Data

**Actions:**
- Stop trying to extract fees from P2P — market moved to free (VietQR)
- Use P2P flow data for: credit scoring, merchant pattern identification, product triggers
- Focus QR on merchant acquisition (offline SME in Tier-2/3 cities)
- Invest in cross-border QR (Vietnam-China tourist corridor = new revenue)

### Recommendation 4: Upgrade TTT to Wealth Management Platform

**Target:** AUM per user from 866K → 2-3M VND
**Actions:**
- Add mutual fund distribution, structured deposits, securities integration
- AI robo-advisory for personalized savings goals
- Tui+ upsell to drive higher AUM and cross-product engagement

### Recommendation 5: AI as the Strategic Moat

**Actions:**
- **Credit AI:** Proprietary scoring on MoMo ecosystem data (Paylater + TTT + P2P + merchant types)
- **Product AI:** Right product, right moment (flight search → travel insurance + Paylater)
- **Moni AI:** Financial advisor chatbot (290K MAU, 479K conversations/month)
- **Fraud AI:** 375M txns/month = fraud detection at scale

**Why now:** 81% of Vietnamese use AI daily. MoMo's moat is AI models trained on 31M users' behavioral data, not the payment rail.

---

## The Flywheel

```
P2P Payments (retention + data)
    → Paylater (credit habit formation, 2.49M users)
        → Vay Nhanh (revenue engine, 24.2T VND/yr)
            → Insurance (next revenue pillar, CAGR 27%)
                → TTT/Wealth Mgmt (long-term AUM, 11.3M users)
                    → AI ties it all together (personalization + risk)
```

---

## Data Appendix

### A1: Paylater Monthly MAU (2023-2025)

| Month | 2023 | 2024 | 2025 |
|-------|------|------|------|
| Jan | 507K | 693K | 989K |
| Feb | 502K | 659K | 971K |
| Mar | 530K | 729K | 1.04M |
| Apr | 534K | 733K | 1.07M |
| May | 562K | 761K | 1.11M |
| Jun | 597K | 782K | 1.17M |
| Jul | 612K | 797K | 1.21M |
| Aug | 631K | 826K | 1.26M |
| Sep | 634K | 851K | 1.28M |
| Oct | 651K | 886K | 1.31M |
| Nov | 667K | 921K | 1.38M |
| Dec | 682K | 996K | 1.44M |

### A2: Vay Nhanh Monthly Disbursement (2023-2025)

| Month | 2023 | 2024 | 2025 |
|-------|------|------|------|
| Jan | 135B | 454B | 1.16T |
| Feb | 214B | 345B | 966B |
| Mar | 143B | 463B | 1.27T |
| Apr | 215B | 342B | 1.34T |
| May | 129B | 35B* | 1.46T |
| Jun | 320B | — | 2.17T |
| Jul | 268B | 513B | 2.13T |
| Aug | 255B | 577B | 2.24T |
| Sep | 357B | 620B | 2.46T |
| Oct | 406B | 770B | 2.95T |
| Nov | 346B | 853B | 2.91T |
| Dec | 418B | 978B | 3.13T |

*May-Jun 2024: Data gap (likely lender pause)

### A3: P2P Revenue Monthly (2023-2025)

| Month | 2023 | 2024 | 2025 |
|-------|------|------|------|
| Jan | 41B | 54B | 53B |
| Feb | 33B | 54B | 45B |
| Mar | 41B | 56B | 50B |
| Apr | 40B | 54B | 36B |
| May | 40B | 57B | 33B |
| Jun | 40B | 62B | 35B |
| Jul | 39B | 68B | 40B |
| Aug | 41B | 67B | 45B |
| Sep | 41B | 58B | 48B |
| Oct | 55B | 60B | 47B |
| Nov | 53B | 57B | 46B |
| Dec | 55B | 57B | 50B |

---

*Report generated from MoMo internal BigQuery data (BU_FI.PAYLATER_MAU_SEGMENT, BU_FI.BAOTU_VAYNHANH_LOAN_INFO, MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID, BU_FI.mart_ttt_daily_user_record) and external market research.*
