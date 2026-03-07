# Vietnam Fintech & Investment Market Research
## Should MoMo Build a Wealth Management / Financial Advisor App?

**Research Date:** 2026-03-02
**Prepared for:** MoMo Product Strategy
**Scope:** Vietnam investment market, regulatory environment, competitive landscape, user behavior, SEA context, market sizing

---

## Executive Summary

Vietnam's investment market is at an inflection point. Retail investor accounts surpassed 6.65 million (6.6% of population) by end of 2024, and the government targets 8% by 2030. Personal financial assets are projected to reach $600 billion by 2027, yet less than 1% of GDP is managed through open-end funds — compared to 18% in India and 21% in China. The gap between latent wealth and structured investment products is enormous.

MoMo, with 40+ million active users and existing touchpoints in savings (Moni), gold, and fund certificates, is uniquely positioned to capture this white space — but faces regulatory complexity, growing competition from fintech-native players, and the structural challenge of low financial literacy.

**Verdict:** The market timing is favorable. The strategic question is not whether to build, but how to position (robo-advisory vs. marketplace vs. full wealth platform) and which user segment to prioritize first.

---

## 1. Vietnam Investment Market Overview

### 1.1 Retail Investor Accounts (VSD Data)

| Metric | Value | Source |
|--------|-------|--------|
| Domestic retail investor accounts (Sep 2024) | 6.65 million (~6.6% of population) | VSD via VietnamPlus |
| New accounts opened in 9M 2024 | 2.4 million | VSD |
| New accounts opened in Oct 2024 | 96,427 (5th consecutive month of decline) | VSD |
| Government target by 2025 | 5% of population | MoF |
| Government target by 2030 | 8% of population | MoF |
| Individual investors' share of transactions (Q1 2025) | 85.7% | Market data |

Note: The surge of 2.4M new accounts in 9M 2024 already exceeded the combined total for 2018-2021 combined, reflecting a generational step-change in investment participation.

### 1.2 Stock Market Growth Trajectory

- Vietnam's stock market delivered a CAGR of ~6.6%/year over the past 5 years, outperforming real estate (~6.3%/year).
- The market is increasingly accessible via mobile-first brokerages (VPS, TCBS, SSI iBoard Pro).
- Individual investors dominate at 85-90% of all market transactions.
- Vietnam is classified as a frontier market but has been on the FTSE and MSCI upgrade watch list; an upgrade to Emerging Market status would attract significant foreign institutional capital and further legitimize the market.

### 1.3 Mutual Funds / Open-End Funds

| Metric | Value |
|--------|-------|
| Open-end fund AUM (end 2024) | ~VND 53 trillion (~$2.03 billion) — doubled YoY |
| Retail investors in open-end funds | ~400,000 |
| Fund AUM as % of GDP | Less than 1% |
| Fund AUM benchmark (China) | ~21% of GDP |
| Fund AUM benchmark (India) | ~18% of GDP |

The low penetration (~0.7-1% of GDP vs 18-21% in peer markets) signals a multi-decade growth runway. The 400,000 fund investors vs 6.65 million stock accounts shows most retail investors still avoid managed products.

### 1.4 Popular Investment Products (Ranked by Mass Market Preference)

1. **Bank savings deposits** — most trusted, zero perceived risk, 4-6% p.a.
2. **Real estate** — culturally dominant, illiquid but deeply embedded
3. **Gold** — traditional store of value, highly liquid, deeply trusted
4. **Stocks** — growing rapidly, 6.65M accounts
5. **Fund certificates** — emerging, ~400K investors
6. **Insurance-linked savings** — bundled, often missold
7. **Crypto** — technically illegal for payments but popular among young tech-savvy users

---

## 2. Regulatory Environment

### 2.1 Key Regulatory Bodies

| Body | Jurisdiction |
|------|-------------|
| State Securities Commission (SSC) | Capital markets, securities, fund management |
| State Bank of Vietnam (SBV) | Banking, payment systems, e-wallets, fintech sandbox |
| Ministry of Finance (MoF) | Overall financial policy |

### 2.2 Securities Law Amendments (Effective Jan 1, 2025)

Vietnam amended the 2019 Securities Law on November 29, 2024 (effective January 1, 2025). Key changes include:
- Enhanced investor protection with revised disclosure requirements for structured products
- Mandatory risk-rating systems for investment instruments
- Improved digital KYC procedures (draft circulars in circulation)
- Proposed sandbox frameworks for blockchain-based asset tokenization

For MoMo to offer investment advisory or fund distribution services, it would need to either:
(a) Partner with a licensed fund management company (FMC), OR
(b) Apply for its own securities intermediary/distribution license

### 2.3 Fintech Regulatory Sandbox — Decree 94/2025/ND-CP

Decree 94/2025/ND-CP, effective July 1, 2025, creates Vietnam's first formal regulatory sandbox for fintech in the banking sector:
- Duration: Up to 2 years (with possible extension)
- Supervised by: State Bank of Vietnam (SBV)
- Eligible solutions: P2P lending, Open API, credit scoring
- Limitation: This sandbox is under SBV jurisdiction (banking), NOT SSC jurisdiction (securities/investments). A separate securities sandbox framework is still being developed.

**Implication for MoMo:** MoMo can participate in Decree 94 sandbox for lending/credit products. For investment products (funds, advisory), it must navigate SSC rules directly or operate under an existing licensed partner's umbrella.

### 2.4 Robo-Advisory Regulation

As of 2025:
- Vietnam does not yet have a specific legal framework for robo-advisory services
- Robo-advisory platforms are gaining traction but operate in a regulatory grey area
- The SSC has discussed sandbox frameworks for fintech in capital markets; no formal decree yet
- Mandatory compliance with data protection laws (PDP Decree 13/2023) applies to all platforms using personal financial data

### 2.5 Key Licensing Paths for MoMo

| Approach | License Needed | Regulatory Body | Complexity |
|----------|---------------|-----------------|------------|
| Fund distribution (sell fund certificates) | Fund distribution agent license | SSC | Medium |
| Investment advisory | Investment adviser license | SSC | High |
| Robo-advisory | No specific license yet; operates under general investment advisory | SSC (grey area) | High |
| Stock brokerage | Securities firm license | SSC | Very High |
| Gold trading | Already operational via partnership | SBV/MoF | Done |

**Lowest-friction path:** Expand fund distribution via existing licensed FMC partners (VFM, Eastspring, Dragon Capital) and gradually build advisory features on top.

---

## 3. Competitive Landscape

### 3.1 Brokerage Platforms (Stock Focus)

| Platform | 2024 Market Share (HSX) | Key Differentiator |
|----------|------------------------|-------------------|
| VPS Securities | 16.45% | Price: zero-commission trading; largest retail base |
| SSI (iBoard Pro) | 9.19% → 11.5% (2025) | Strongest 2025 growth; research quality |
| TCBS | 7.70% → 7.99% (2025) | Tech-first; bond marketplace pioneer |
| Pinetree | Top 10 | "Best Retail Brokerage" award 2025 |

Top 10 brokers = ~68.5% of HSX market share.

**VPS is the price-disruptor** (zero-commission model) and has the largest retail user base. SSI combines research depth with strong growth. TCBS (TCB's securities arm) is the most fintech-native.

### 3.2 Micro-Investment / Fund Platforms

| Platform | Description | Key Metrics |
|----------|-------------|-------------|
| **Finhay** | Mutual fund micro-investing for millennials; min VND 50,000 (~$2) | Personalized portfolios; AI-driven |
| **Tikop** | Mobile wealth platform; 22 fund certificates + ETF access | Free transactions |
| **Infina** | Retail investing app; $4M seed (2021); mission: seamless investing | Raised $2M (TechCrunch, 2021) |
| **Fmarket** | Fund distribution marketplace (backed by SSI) | Wide FMC partnerships |

Finhay + Infina collectively: ~$500M AUM as of 2024.

### 3.3 MoMo's Current Investment Offerings

| Product | Status | Notes |
|---------|--------|-------|
| **Moni** | Active | Savings/interest-bearing product |
| **Gold trading** | Active | Partnership-based gold buying/selling |
| **Fund certificates** | Active | Distribution of fund certificates via partner FMCs |
| **Stock trading** | Reportedly live | MoMo has integrated stock trading features |
| **Insurance** | Active | Micro-insurance distribution |
| **Micro-loans** | Piloting (via Law on Credit Institutions 2024) | e-KYC for credit applications |

MoMo has 40+ million active users and 140,000+ payment points. Its evolution toward financial assistant has been explicit in exec communications: "democratizing finance for underserved customers."

### 3.4 Market Gaps and Opportunities

1. **Integrated financial health score** — no player currently provides a holistic "financial health" view across spending + saving + investing
2. **Goal-based investing for mass market** — existing apps target millennials but do not serve the lower-middle class (monthly income $300-700)
3. **Vietnamese-language financial education + advisory** — low financial literacy creates a massive education gap; no app does this well at scale
4. **Fixed-income / bond distribution at retail** — TCBS pioneered bond sales but remains B-grade UX vs MoMo's polish
5. **Pension planning tools** — Vietnam's aging population (median age 32, rapidly aging) has no equivalent of 401k advisory tools
6. **Automated savings + investment rules** — round-up investing, auto-DCA, rule-based triggers; not yet present at MoMo scale

---

## 4. User Behavior

### 4.1 Financial Literacy

- Only 42% of young Vietnamese individuals engage in investing, with many perceiving it as highly risky
- Vietnam scores below regional peers on global financial literacy indices
- Financial literacy is higher in urban areas (Hanoi, Ho Chi Minh City) vs rural
- The growing middle class (60%+ of households earn over $5,000/year) creates demand but needs education on product selection

### 4.2 Investment Preferences by Asset Class

Vietnamese investors exhibit a clear trust hierarchy:
1. **Gold** — highest cultural trust; tangible, liquid, inflation hedge; deeply embedded across generations
2. **Bank deposits** — second-safest; 4-6% rates attractive vs inflation
3. **Real estate** — aspirational; primary store of generational wealth
4. **Stocks** — growing rapidly; 6.65M accounts but many inactive
5. **Mutual funds / ETFs** — very early adoption; ~400K participants
6. **Crypto** — younger demographic; technically restricted

**Key insight:** Vietnamese users move from low-risk to high-risk assets slowly. A wealth management app must start with savings/gold/deposits and gradually introduce funds and equities as trust is built.

### 4.3 Mobile-First Behavior

- 70%+ of adults own smartphones
- Nearly 60% of transactions conducted digitally
- Vietnam has one of Asia's highest daily mobile internet usage rates (6+ hours/day average)
- MoMo is already the top-of-mind financial app for most urban Vietnamese users

### 4.4 Trust Factors in Financial Services

- **Institutional backing** is critical: products perceived as government-backed or bank-affiliated convert better
- **Loss aversion is extreme** — negative experiences (e.g., corporate bond scandals of 2022, Van Thinh Phat) have made users wary of non-bank investment products
- **Social proof and community** — Vietnamese users heavily influenced by peer recommendations and social media (Zalo, Facebook groups)
- **Transparency of returns** — users want clear, simple yield numbers; complexity reduces conversion
- **The 2022 bond market scandal** (Tan Hoang Minh, Van Thinh Phat) severely damaged trust in non-bank fixed-income products; platforms must proactively signal safety

---

## 5. Southeast Asia Context

### 5.1 GCash (Philippines)

- 90+ million users; Philippines' leading super app
- **GFunds**: In-app mutual fund marketplace, starting at PHP 50 (~$0.90); partners include Manulife, ATRAM
- **GInvest** (launched March 2021): Equities and bond investments; min PHP 50
- Latest expansion: REIT funds and global property UITFs via Manulife partnership (Feb 2026)
- Model: Third-party fund distribution embedded in payments app — directly analogous to what MoMo could build

### 5.2 Grab Financial Group

- Operates across 8 Southeast Asian countries
- **GrabInvest**: Rebranded from acquired Bento Invest; core vertical under Grab Financial Group
- Stated mission: Democratize access to retail wealth management across SEA
- **Stash Acquisition (2026):** Grab agreed to acquire 100% of Stash Financial Inc. at $425M enterprise value (expected close Q3 2026)
  - Stash: $5B AUM, 1M+ paid subscribers, subscription-based investing + banking + financial education
  - Stash's **AI Money Coach**: ~50% of users take positive financial action same day; engagement up ~40% in 2025
  - Grab plans to explore introducing Stash's investing solutions in SEA post-acquisition

### 5.3 Gojek (Indonesia)

- **GoInvestasi**: Gold investment and micro-lending via bank partnerships
- More limited scope than GCash/GrabInvest; primarily gold + mutual funds

### 5.4 Key SEA Learnings for MoMo

| Insight | Evidence |
|---------|----------|
| Minimum investment threshold is a conversion lever | GCash at PHP 50 ($0.90), Finhay at VND 50,000 ($2) both onboarded millions |
| Financial education built into UX drives retention | Stash AI Money Coach: 50% same-day action rate |
| Fund distribution (not ownership) is the low-risk entry | GCash, GrabInvest both use third-party fund partners |
| Super app context increases stickiness | Users already in-app for payments; investment is a natural next action |
| Advisory features differentiate commodity fund marketplaces | AI-driven goal-based planning creates switching costs |

---

## 6. Market Size Estimation

### 6.1 Total Addressable Market (TAM)

**Vietnam Personal Financial Assets (PFA):**
- 2022 baseline: ~$360 billion
- 2027 projection: ~$600 billion (growing at 11% CAGR)
- Managed wealth opportunities: $65-75 billion additional by 2027

**Vietnam Wealth Management AUM:**
- Current (2025): ~$59 billion projected AUM
- 2029 projection: ~$61 billion (conservative; Statista)
- Open-end funds alone: ~$2 billion (2024); massive upside vs 1% GDP penetration

**Financial Advisory Market (Statista):**
- Vietnam financial advisory market is growing in line with wealth management; data available via Statista Market Forecast

### 6.2 Serviceable Addressable Market (SAM) — Mass Market Investment App

Target segment: MoMo's existing 40M users who currently do NOT invest

| Metric | Estimate | Rationale |
|--------|----------|-----------|
| MoMo active users | 40 million | Company-stated |
| Current MoMo investment users (fund certs + gold) | ~2-4 million (est.) | Extrapolated from 400K fund investors nationally |
| Conversion target (1-3 year horizon) | 8-12 million | 20-30% of active base; analogous to GCash GFunds adoption |
| Average AUM per mass-market user | $500-1,500 | VND 12-36 million; realistic for urban lower-middle class |
| SAM (AUM) | $4-18 billion | 8-12M users x $500-1,500 avg |

### 6.3 Revenue Model and SOM

| Revenue Stream | Model | Est. Rate | SOM Potential |
|---------------|-------|-----------|---------------|
| Fund distribution fee | % of AUM (trailer fee) | 0.5-1.5% p.a. | $20-270M p.a. |
| Premium advisory/subscription | Monthly fee | $1-3/month | $96-360M p.a. (at 8M users) |
| Gold spread | Bid-ask margin | 0.5-1% per transaction | Incremental |
| Financial product referral | CPA/revenue share | Per conversion | Incremental |

**Conservative 3-year SOM:** $30-80M annual revenue at 5M invested users
**Optimistic 3-year SOM:** $150-300M annual revenue at 10M+ invested users

### 6.4 Comparable Benchmarks

| Company | AUM | Revenue | Users |
|---------|-----|---------|-------|
| Finhay + Infina (Vietnam) | ~$500M | N/A | ~1-2M est. |
| Stash (USA, at acquisition) | $5B | N/A | 1M paid subscribers |
| GCash GFunds (Philippines) | Not public | N/A | Tens of millions accessible |
| Grab Financial Group | Not disclosed | Part of GFG | 8 SEA countries |

---

## 7. Strategic Implications for MoMo

### 7.1 Why Now

1. **Account opening growth is decelerating** — the easy wave has passed; now it's about depth of engagement, not breadth of account opening
2. **Regulatory window is opening** — SSC modernization + SBV sandbox signal government support for fintech-driven financial inclusion
3. **Competitive moat is time-limited** — Grab/Stash SEA expansion (post-Q3 2026), rising TCBS digital capabilities, and well-funded finhay/Infina are all competing for the same under-invested mass market
4. **MoMo has the distribution** — 40M users, trusted brand, daily habit = unmatched distribution advantage
5. **Macro tailwind** — Vietnam's middle class growing, $600B PFA market by 2027, government explicitly targeting 8% investor participation

### 7.2 Recommended Entry Approach

**Phase 1 (0-12 months): Deepen existing products**
- Expand fund certificate distribution (add more FMC partners)
- Launch goal-based savings features layered on top of Moni
- Add gold DCA (auto-invest) functionality
- Introduce financial health score (spending + saving dashboard)

**Phase 2 (12-24 months): Build advisory layer**
- Risk profiling (onboarding questionnaire)
- Algorithmic portfolio recommendations (robo-advisory-lite)
- Educational content in Vietnamese (financial literacy push)
- Integrate stocks access (via existing brokerage partnership)

**Phase 3 (24-36 months): Full wealth platform**
- AI-driven personalized advisor (similar to Stash's AI Money Coach)
- Pension/retirement planning tools
- Expanded fixed-income products (bonds, government bonds)
- Insurance-investment bundled products

### 7.3 Key Risks

| Risk | Mitigation |
|------|-----------|
| Regulatory uncertainty for robo-advisory | Start with fund distribution (already licensed); engage SSC proactively |
| User trust deficit post-2022 bond scandal | Partner with top-tier, government-affiliated FMCs; emphasize capital protection |
| Competition from Grab/Stash SEA entry | Move fast on Phase 1-2; MoMo's Vietnam-specific distribution is hard to replicate |
| Financial literacy gap limiting conversion | Invest heavily in in-app education; gamify investment concepts |
| SSC/SBV regulatory overlap | Form dedicated regulatory affairs team; engage both bodies |

---

## Sources

- [Number of new accounts continue to fall last month - VietnamPlus](https://en.vietnamplus.vn/number-of-new-accounts-continue-to-fall-last-month/243651.vnp)
- [Stock market remains attractive to retail investors - Vietnam News](https://vietnamnews.vn/economy/1659984/stock-market-remains-attractive-to-retail-investors.html)
- [5% of Vietnam's population are stock investors - VnExpress](https://e.vnexpress.net/news/business/data-speaks/5-pct-of-vietnam-s-population-stock-investors-4449028.html)
- [Online investment apps offering choice and clarity - Vietnam Investment Review](https://vir.com.vn/online-investment-apps-offering-choice-and-clarity-85448.html)
- [Top Fintech Companies in Vietnam: 2025 Edition - TMA Solutions](https://www.tmasolutions.com/insights/top-fintech-companies-in-vietnam)
- [Vietnamese investment app Infina lands $2M seed round - TechCrunch](https://techcrunch.com/2021/06/27/vietnamese-investment-app-infina-lands-2m-seed-round/)
- [Vietnam Fintech Market Size & Share Outlook to 2030 - Mordor Intelligence](https://www.mordorintelligence.com/industry-reports/vietnam-fintech-market)
- [Vietnam's fund management industry has chance for breakthrough - The Investor](https://theinvestor.vn/vietnams-fund-management-industry-has-chance-to-make-breakthrough-development-exec-d16350.html)
- [Vietnam SSC: 2025 a good year for securities sector - VietnamPlus](https://en.vietnamplus.vn/2025-a-good-year-for-vietnams-securities-sector-ssc-post334377.vnp)
- [Vietnam WealthTech and Robo-Advisory Market - Ken Research](https://www.kenresearch.com/vietnam-wealthtech-and-robo-advisory-market)
- [New Securities Law - YKVN](https://ykvn-law.com/new-securities-law-balancing-policy-objectives-with-a-greater-focus-on-risk-management/)
- [Wealth management in Vietnam: A $600 billion wealth market by 2027 - McKinsey](https://www.mckinsey.com/vn/our-insights/wealth-management-in-vietnam-a-600-billion-wealth-market-by-2027)
- [Unleashing the potential of Vietnam's wealth management market - VietnamPlus](https://en.vietnamplus.vn/unleashing-potential-of-vietnams-wealth-management-market-post268651.vnp)
- [Vietnam Wealth Management Market 2030 - Ken Research](https://www.kenresearch.com/industry-reports/vietnam-wealth-management-market)
- [Wealth Management in Vietnam: Rise of New Affluent Class 2025 - Incorp Asia](https://vietnam.incorp.asia/wealth-management/)
- [MoMo: E-wallet turned financial assistant - The Investor](https://theinvestor.vn/e-wallet-turned-financial-assistant-momo-banks-on-power-of-small-things-exec-d13093.html)
- [The super app ambitions of MoMo - Kapronasia](https://kapronasia.com/insight/blogs/fintech-research/the-super-app-ambitions-of-momo)
- [GCash: Becoming the Philippines' Leading Financial Super App - FinTech Magazine](https://fintechmagazine.com/articles/gcash-becoming-the-philippines-leading-financial-super-app)
- [GCash + Manulife global property investments on GFunds - Manila Times](https://www.manilatimes.net/2026/02/27/supplements/gcash-manulife-investments-philippines-expand-filipinos-access-to-global-property-investments-on-gfunds/2289541)
- [Grab adds investment feature - The Drum](https://www.thedrum.com/news/2020/02/04/grab-adds-investment-feature-its-super-app-ambitions-drive-on)
- [Grab acquires Stash Financial at $425M - Grab SG Press Release](https://www.grab.com/sg/press/others/grab-accelerates-financial-services-roadmap-with-acquisition-of-digital-investing-platform-stash-financial-inc/)
- [Grab moves into mass-market investing with Stash - Asian Banker](https://www.theasianbanker.com/press-releases/grab-moves-into-mass-market-investing-with-425-million-stash-acquisition)
- [VPS continues to lead brokerage market share in 2024 - Vietstock](https://en.vietstock.vn/2025/01/vps-continues-to-lead-in-brokerage-market-share-in-2024-962-597439.htm)
- [VPS widens lead as brokerage competition intensifies - Vietnam News](https://vietnamnews.vn/economy/1726770/vps-widens-lead-as-brokerage-competition-intensifies.html)
- [Brokerage competition tightens as market shares narrow - VIR](https://vir.com.vn/brokerage-competition-tightens-as-market-shares-narrow-144395.html)
- [Vietnam: New Decree 94/2025/ND-CP - regulatory sandbox in banking - DFDL](https://www.dfdl.com/insights/legal-and-tax-updates/vietnam-new-decree-no-94-2025-nd-cp-on-regulatory-sandbox-in-the-banking-sector/)
- [Understanding Vietnam's new fintech law and Decree 94 - Le Tran Law](https://letranlaw.com/insights/understanding-vietnams-new-fintech-law-and-decree-94-2025/)
- [Vietnam Issues Fintech Sandbox Decree - Tilleke & Gibbins](https://www.tilleke.com/insights/vietnam-issues-fintech-sandbox-decree/)
- [VN stock market outshines savings, real estate and gold - Vietnam News](https://vietnamnews.vn/economy/1652676/vn-s-stock-market-outshines-savings-real-estate-and-gold-attracting-domestic-investors.html)
- [Nexus between Financial Education and Behavior - Vietnamese Youth - MDPI](https://www.mdpi.com/2071-1050/15/20/14854)
- [Top 6 Fintech Apps in Vietnam 2025 - TechBullion](https://techbullion.com/top-6-fintech-apps-in-vietnam-to-watch-in-2025-payments-banking-investments/)
- [Financial Advisory Vietnam - Statista Market Forecast](https://www.statista.com/outlook/fmo/wealth-management/financial-advisory/vietnam)
- [Wealth Management Vietnam - Statista Market Forecast](https://www.statista.com/outlook/fmo/wealth-management/vietnam)
