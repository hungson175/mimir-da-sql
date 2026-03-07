# MoMo Vay Nhanh vs Vietnam Digital Lending Competitors

**Date:** 2026-03-04
**Context:** MoMo Vay Nhanh 6-month performance (Sep 2025 - Feb 2026) benchmarked against market

---

## MoMo Vay Nhanh — Our Numbers

**Source: BigQuery (`momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`), queried 2026-03-04.**

| Metric | Sep 25 | Oct 25 | Nov 25 | Dec 25 | Jan 26 | Feb 26 |
|--------|--------|--------|--------|--------|--------|--------|
| Submissions | 204,825 | 227,505 | 228,735 | 255,317 | 258,996 | 219,210 |
| Unique submitters | 178,135 | 187,711 | 183,937 | 205,249 | 207,951 | 178,617 |
| Disbursed | 143,837 | 166,415 | 158,026 | 173,993 | 171,523 | 143,171 |
| Screening pass rate | 73.8% | 76.4% | 72.5% | 71.4% | 69.6% | 69.0% |
| Disbursement rate | 70.2% | 73.2% | 69.1% | 68.2% | 66.2% | 65.3% |
| Disbursed (B VND) | 2,458 | 2,948 | 2,911 | 3,130 | 3,108 | 2,515 |
| Avg ticket (M VND) | 17.1 | 17.7 | 18.4 | 18.0 | 18.1 | 17.6 |

**Rate definitions:**
- **Screening pass rate** = applications not rejected by partner/decider/knockout rules ÷ total submissions. This is closer to the product team's "approval rate" (~69-74%).
- **Disbursement rate** = actually disbursed (DISBURSED + LIQUIDATED + SUCCESS) ÷ total submissions (~65-73%).
- Feb still has 2,131 PROCESSING loans (vs Sep's 529), so Feb rates will tick up ~1pp when those resolve.

**Lender mix (Mar 2026 first 3 days, from BQ):**

| Lender | Submissions | Share | Approved | Approval % | Disbursed (B VND) |
|--------|------------|-------|----------|------------|-------------------|
| VietCredit | 16,329 | 69% | 10,671 | 65.3% | 192.2 |
| MCredit | 3,171 | 13% | 2,159 | 68.1% | 38.2 |
| Amber | 2,397 | 10% | 1,585 | 66.1% | 22.5 |
| MBV | 1,664 | 7% | 1,335 | 80.2% | 21.4 |

---

## Competitive Landscape

### Tier 1: Traditional Consumer Finance Giants

These are balance-sheet lenders — they hold credit risk directly. MoMo competes for the *distribution channel*, not the credit risk.

| Company | Total Assets | Customers | Market Share | 2024 Profit | NPL |
|---------|-------------|-----------|-------------|-------------|-----|
| **FE Credit** (VPBank) | VND 66.4T+ | 14M+ | ~50% | VND 515B pre-tax | <20% |
| **Home Credit** (→SCBX) | VND 27.3T | 16M | ~9.6% | VND 1,291B after-tax | 1.76% |
| **HD Saison** | — | — | Top 3 | — | — |

> **Sources — FE Credit:** Market share, total assets, customer count from [Vietnam News "Over a decade at the top", 2025](https://vietnamnews.vn/brandinfo/1722800/over-a-decade-at-the-top-of-viet-nam-s-consumer-finance-market.html). Disbursement growth +19% H1/2025 and NPL from [Vietnam News "Pioneering consumer credit", 2025](https://vietnamnews.vn/brandinfo/1724627/pioneering-consumer-credit-fe-credit-helps-realise-millions-of-dreams.html). 2025 profit target VND 1,126B from [FiinGroup, 2024](https://fiingroup.vn/NewsInsights/Detail/11130948).
>
> **Sources — Home Credit:** Total assets VND 27.3T, NPL 1.76% from [Vietnam.vn financial report, 2025](https://www.vietnam.vn/en/home-credit-viet-nam-cong-bo-bao-cao-tai-chinh-2024-lai-1-291-ty-dong). 2024 profit VND 1,291B, 16M customers from [Vietnam.vn business results, 2025](https://www.vietnam.vn/en/home-credit-viet-nam-cong-bo-ket-qua-kinh-doanh-nam-2024). Market share 9.6% from [VIR, 2025](https://vir.com.vn/home-credit-vietnam-the-answer-is-always-with-the-customer-120198.html). H1/2025 profit +124% from [The Investor, 2025](https://theinvestor.vn/consumer-finance-firm-home-credit-vietnam-sees-124-h1-profit-jump-d12076.html). SCBX acquisition ~EUR 800M from [SCBX, 2024](https://www.scbx.com/en/news/scbx-acquires-100-of-home-credit-vietnam/).
>
> **Sources — HD Saison:** Top 3 ranking from [Vietnam News, 2021](https://vietnamnews.vn/economy/898552/three-companies-dominate-consumer-lending-market-in-vn.html). Detailed 2024-2025 financials not found in public sources.

**Additional FE Credit details:**
- Loan range: 10M - 70M VND for cash loans
- Distribution: 13,000+ POS locations nationwide
- H1/2025 disbursement: +19% YoY
- 2025 profit target: VND 1,126B (2x 2024)
- Approval rate: Not publicly disclosed

**Additional Home Credit details:**
- Loan range: 5M - 250M VND, 3-57 month terms, 8.99-33.94% annual interest
- Distribution: 14,000 POS across 34 provinces
- Outstanding credit growth: +12.4% in 2024
- H1/2025 profit: +124% YoY

### Tier 2: MoMo's Lending Partners (on Vay Nhanh platform)

MoMo share percentages are from our BQ data (Mar 2026 first 3 days). Financial data from public sources.

| Lender | MoMo Share | Outstanding Loans | Key Metric | Financial Health |
|--------|-----------|------------------|------------|-----------------|
| **VietCredit** | ~65-70% | VND 9,300B+ (Q3/2025) | +136% YoY loan growth | Profit VND 460B pre-tax by Q3/2025 |
| **MCredit** | ~13-15% | VND 24.9T liabilities | 3.7M customers | H1/2024 profit dropped 87%, stabilizing |
| **Amber** | ~8-10% | Part of FE Credit | — | Under FE Credit umbrella |
| **MBV** | ~7-8% | Not publicly disclosed | 80.2% approval rate | New on platform, no public financials |

> **Sources — VietCredit:** Outstanding VND 9,300B and total assets VND 11,600B from [CafeF, 2025](https://cafef.vn/vietcredit-tang-truong-tich-cuc-trong-2025-nhan-giai-vang-make-in-viet-nam-188260106115339744.chn). Loan growth +136% YoY, 2025 profit, credit card launch from [VIR "Consumer finance sector posts sharp profit growth", 2025](https://vir.com.vn/consumer-finance-sector-posts-sharp-profit-growth-146042.html). Also partners with Kredivo/Sendo for BNPL (same VIR source).
>
> **Sources — MCredit:** 3.7M customers, H1/2024 profit VND 43B (-87%), debt-to-equity 8.19x from [The Investor, 2025](https://theinvestor.vn/japan-invested-finance-firm-mcredit-sees-h1-profit-drop-87-d12110.html). A- credit rating, historical 33.2% CAGR from [VIR/FiinRatings, 2024](https://vir.com.vn/fiinratings-assigns-mcredit-a-stable-a-credit-rating-112176.html).
>
> **Sources — Amber & MBV:** Amber operates under FE Credit. MBV appeared on MoMo's platform in late 2025 (from BQ data). No separate public financials found for either entity.

### Tier 3: Digital/Fintech Competitors

| Player | Product Type | Known Scale | Disbursement Data |
|--------|-------------|-------------|-------------------|
| **SPayLater** (Shopee) | BNPL + cash loans | $7.9B loan book (SEA-wide) | Not disclosed for Vietnam |
| **ZaloPay** | BNPL + cash loans | Zalo ecosystem users | Not disclosed |
| **Cake** (VPBank) | Digital bank + loans | 5M users | Not disclosed |
| **Kredivo/Atome** | BNPL specialist | Top 4 BNPL in VN | Not disclosed |
| **Fundiin** | BNPL specialist | Top 4 BNPL in VN | Not disclosed |

> **Sources — SPayLater:** $7.9B loan book and 300% off-platform growth are SEA-wide figures from Sea Limited Q3 2025 earnings call. Vietnam-specific lending volumes are not publicly broken out. Partners with TPBank and VPBank for Vietnam BNPL.
>
> **Sources — ZaloPay:** Lending products (BNPL with Lotte Finance 8-13% rate, cash loans up to VND 30M, installments with CIMB/SHB Finance) from [FintechNews.sg, 2024](https://fintechnews.sg/101074/vietnam/zalopay-expand-lending-investments/). Cake Fast Loan partnership from [FintechNews.sg, 2024](https://fintechnews.sg/112282/vietnam/zalopay-cake/). *Note: The "16M users" figure in some reports refers to Zalo app users, not ZaloPay wallet users — actual ZaloPay lending users are likely much smaller.*
>
> **Sources — Cake:** 5M users, first profitable Vietnamese digital-only bank, income +225% in 9M/2025 from [VIR, 2025](https://vir.com.vn/cake-by-vpbank-posts-strong-gains-in-scale-and-efficiency-leveraging-ai-focus-144079.html).
>
> **Sources — Kredivo/Atome & Fundiin:** Listed as top 4 BNPL players in Vietnam from [BusinessWire/ResearchAndMarkets, 2025](https://www.businesswire.com/news/home/20250221652599/en/). Kredivo partners with Sendo + VietCredit from [VIR, 2025](https://vir.com.vn/consumer-finance-sector-posts-sharp-profit-growth-146042.html).

**Key gap:** None of the Tier 3 players publicly disclose Vietnam-specific monthly disbursement volumes, making direct comparison with MoMo's BQ-verified numbers impossible.

---

## Market Context

| Metric | Value |
|--------|-------|
| Vietnam consumer credit outstanding | VND 3,300T (~$132B), 21.5% of total credit |
| Alternative lending market | $8.68B (2024) → $16.63B (2029), 13.8% CAGR |
| BNPL market | $1.91B (2024) → $8.51B (2030), 26.7% CAGR |
| Consumer finance NPL (industry avg) | 9.6% Q3/2024, down from 15% in 2023 |
| Credit growth target 2025 | 16% (SBV) |
| Licensed consumer finance companies | 30+ |
| Fintech regulatory sandbox | Decree 94/2025, effective July 2025 |

> **Sources:** Consumer credit outstanding and NPL from [VIR "Assessment of NPLs", 2024](https://vir.com.vn/assessment-of-non-performing-loans-so-far-in-2024-113593.html). Alternative lending market from [GlobeNewsWire, 2026](https://www.globenewswire.com/news-release/2026/02/04/3232229/28124/en/). BNPL market from [GlobeNewsWire, 2025](https://www.globenewswire.com/news-release/2025/11/25/3194089/28124/en/). Credit growth target from [VietnamPlus, 2025](https://en.vietnamplus.vn/vietnam-targets-16-credit-growth-in-2025-as-lending-focuses-on-production-priority-sectors-post329862.vnp). Licensed companies from [FiinResearch, 2024](https://fiinresearch.vn/NewsInsights/NewsDetail/11607010). Regulatory sandbox from [LeTran Law, 2025](https://letranlaw.com/insights/understanding-vietnams-new-fintech-law-and-decree-94-2025/).

---

## MoMo's Competitive Position

### Strengths
1. **Distribution scale**: 30M+ users ([GlobeNewsWire, 2025](https://www.globenewswire.com/news-release/2025/06/23/3103746/0/en/)). *Note: A prior version cited "68% e-wallet market share" from [Mordor Intelligence](https://www.mordorintelligence.com/industry-reports/vietnam-fintech-market) — this likely refers to fintech market revenue share, not e-wallet user share. The e-wallet landscape includes VNPay, ZaloPay, ShopeePay. Treat with caution.*
2. **Asset-light model**: No credit risk on balance sheet — earns distribution/origination fees
3. **Scale**: ~$100-125M monthly disbursement, ~220-260K applications/month (from BQ)
4. **Speed**: 1-minute approval, instant disbursement ([MoMo product page](https://www.momo.vn/vay-nhanh))
5. **Profitability**: MoMo achieved first profitability in 2024 ([GlobeNewsWire, 2025](https://www.globenewswire.com/news-release/2025/06/23/3103746/0/en/))

### Weaknesses / Risks
1. **Declining screening pass rate**: 73.8% → 69.0% over 6 months (~4.8pp real decline, from BQ). Disbursement rate dropped 70.2% → 65.3% but Feb still has PROCESSING loans.
2. **VietCredit concentration**: 65-70% of volume through one lender (from BQ). If VietCredit tightens, MoMo volume drops.
3. **No direct lending license**: Dependent on partner willingness to lend
4. **Ticket size ceiling**: 17-18M avg (from BQ) vs Home Credit up to 250M VND

### Opportunities
1. **MBV addition**: New lender with 80.2% approval (from BQ) — diversifies away from VietCredit
2. **BNPL expansion**: $8.5B market by 2030 ([GlobeNewsWire](https://www.globenewswire.com/news-release/2025/11/25/3194089/28124/en/)), MoMo is top 4 player ([BusinessWire](https://www.businesswire.com/news/home/20250221652599/en/))
3. **Regulatory sandbox**: Decree 94/2025 enables e-KYC, embedded finance pilots ([LeTran Law](https://letranlaw.com/insights/understanding-vietnams-new-fintech-law-and-decree-94-2025/))

### Threats
1. **SPayLater**: 300% YoY off-platform growth (Sea Q3 earnings — SEA-wide, no VN breakout)
2. **Cake + ZaloPay**: Digital bank 5M users ([VIR](https://vir.com.vn/cake-by-vpbank-posts-strong-gains-in-scale-and-efficiency-leveraging-ai-focus-144079.html)) + wallet ([FintechNews.sg](https://fintechnews.sg/112282/vietnam/zalopay-cake/)) = direct competitor
3. **FE Credit digital**: Market leader going digital with FE ONLINE 2.0 app

---

## Monthly Disbursement Comparison

| Player | Monthly Disbursement | Confidence | Source |
|--------|---------------------|------------|--------|
| **MoMo Vay Nhanh** | 2,500-3,100B VND ($100-125M) | Verified | BQ data |
| **FE Credit** | ~5,000-6,000B VND | Estimated | Back-calculated from 19% H1 growth + VND 66T assets |
| **Home Credit** | ~2,000-2,500B VND | Estimated | Back-calculated from 12.4% credit growth + VND 27T assets |
| **VietCredit (total)** | ~1,500-2,000B VND | Estimated | Back-calculated from VND 9,300B outstanding |
| **SPayLater (VN)** | Unknown | — | Not publicly disclosed |
| **Cake** | Unknown | — | Not publicly disclosed |
| **ZaloPay lending** | Unknown | — | Not publicly disclosed |

> **Important caveat:** Only MoMo's numbers are from actual data (BigQuery). FE Credit, Home Credit, and VietCredit estimates are back-calculated from public financial reports and may be significantly off. Tier 3 players do not publicly disclose Vietnam-specific lending volumes.

MoMo is likely competitive with Home Credit in monthly disbursement — remarkable for a platform that holds zero credit risk. But precise ranking is impossible without disclosed data from competitors.
