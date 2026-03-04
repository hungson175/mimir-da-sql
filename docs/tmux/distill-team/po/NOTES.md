# PO Notes — Nguyen Manh Tuong

## BATCH 15 FINAL SUMMARY (2026-03-03)

### MoMo FS Credit Book Feb 2026
- Vay Nhanh: **17.32T VND** (865K borrowers)
- Paylater: **1.88T VND** | CLO: **1.92T VND**
- **TOTAL: ~21T VND (~$850M USD)**

### Super-App Jan 2026
- TTT+PL (core): 500,946 users — +10% GMV vs single-product
- TTT+PL+VN (high LTV): 35,042 | **TTT+PL+INS (WM target 2026): 12,362**
- 233K prime cross-sell: unfunded TTT + active Paylater → activation campaign
- 55.6% VN borrowers also use Paylater

### Mimir Trust (Post Batch 15)
| Domain | Trust | Change |
|--------|-------|--------|
| InsurTech | **HIGH** | Upgraded — EXACT MATCH GMV confirmed |
| Paylater | HIGH | No change |
| Vay Nhanh | MEDIUM | Feb 29 bug + 3x disbursement undercount confirmed |
| TTT | MEDIUM | No change |
| CLO | MEDIUM | No change |

### Strategic Priorities 2026
1. TTT+PL+INS = Wealth Management direction
2. 233K cross-sell campaign: TTT funding activation
3. Money Pool: quality acquisition (stop Wave 1-type campaigns)
4. InsurTech Distribution: invest in Dec momentum

### Next Session Priorities
1. Non-FS domains (P2P Revenue, Billpay, Airtime)
2. Build mimir-distill skill package (threshold met: ~98 pairs, ~46 lessons)
3. InsurTech: Sep -16% Distribution dip investigation
4. Paylater NPL/overdue rate (proper DPD table)
5. H8 Forecast (extrapolate Q2 2026)


---

## BATCH 16 ADDITIONS (2026-03-03)

### Non-FS Utility Scale (January 2026)
| Product | Users | GMV | Trust |
|---------|-------|-----|-------|
| DLS Online | 6.7M | 12.9T | Mimir-only (BQ blocked) |
| Airtime | 5.0M | 676B | Mimir-only (BQ blocked) |
| VietQR W2B senders | 3.6M | 26T | BQ verified |
| Billpay | 3.1M | 3.5T | BQ verified |

### Critical Risk: Paylater Credit Quality
- 308K users with penalty (21.2% of borrowers) — 72.6% repeat offenders
- 86K overlap: Paylater penalty + active VN loan → double exposure
- Paylater outstanding for penalty users: 120.93B VND
- Penalty rate trending up: Jul 5.82% → Feb 7.23% → watch March
- Alert threshold: >7% sustained = credit quality issue

### Paylater + VN Cross-Risk
- Penalty users have +18% higher VN still-active loan rate (44.9% vs 38.0%)
- Directional signal only — need collections DPD system for confirmation
- 86K users need enhanced credit monitoring

### InsurTech Vehicle Insurance
- Motor cycle renewal season (Dec-Jan): structural annual spike
- Vehicle Ins revenue: 1.14B (Oct) → 3.31B (Feb) = +190% in 4 months
- Mark calendar: push Vehicle Insurance hard every Nov-Dec

### P2P Revenue Mimir Bug
- Mimir counts W2W (free) → gives ~0 VND
- Real answer = W2B + CASHOUT fees = 49.44B VND (Jan)
- Trust: NONE for P2P revenue without correction

### VietQR Cross-Sell Math
- 1.59M VietQR-only users (44% with no FS product)
- Convert 20% = 318K new FS users at near-zero CAC
- Campaign: "Vừa thanh toán QR — để tiền dư trong TTT, nhận lãi ngay"

### Action Items from Batch 16
1. Get collections system DPD access for borrower-level VN NPL
2. Flag 86K Paylater-penalty + VN-loan overlap for enhanced monitoring
3. Launch VietQR → TTT activation campaign targeting 1.59M users
4. Investigate VietQR fee model — QR cannibalizing direct P2B at 55 VND vs 1,665 VND
5. Vehicle Insurance: Nov-Dec 2026 push = annual revenue booster

### Next Session Priorities (Batch 17)
1. Collections system DPD data access (risk team coordination needed)
2. Airtime trend 8 months (Mimir — no BQ access)
3. DLS by merchant category (Mimir)
4. PA Bus product investigation (what is it exactly?)
5. Paylater NPL DPD using proper risk tables

---

## BATCH 17 ADDITIONS (2026-03-03)

### BOARD ITEM: VietQR MDR Strategy (Non-FS Revenue Story 2026-2027)

**Strategic two-sided pricing confirmed:**
| Channel | Jul 2025 MDR | Feb 2026 MDR | Trend |
|---------|-------------|-------------|-------|
| VietQR scan | 0.024% | 0.033% | +35% rising → target 0.05% |
| Direct P2B | 0.282% | 0.208% | -26% declining → merchant subsidy |

**Revenue projection:**
- Current (0.033% × 7.19T GMV): 2.24B VND/month
- Target (0.05% × ~10T GMV): 5B VND/month = +123% from VietQR alone
- Timeline to 0.05% MDR: ~March-April 2027 (at +0.00129%/month pace)
- Annual target revenue: 5B × 12 = **60B VND/year** from VietQR fees

**Board message:** MoMo is executing classic fintech platform MDR playbook. VietQR fee at 0.033% still well below market (Visa/MC: 1-2%, regional QR fintech: 0.05-0.3%). Significant headroom.

### Total MoMo Payment GMV Jan 2026
| Product | Monthly GMV |
|---------|------------|
| W2W personal | 15.95T |
| W2B merchant | 26.08T |
| DLS Online | 12.9T (some W2B overlap) |
| Billpay | 3.48T |
| Paylater | 2.45T |
| **Net unique estimate** | **~50-55T VND/month (~$2.1-2.3B USD)** |

### InsurTech: Sep = Annual Structural Trough
- Confirmed pattern both 2024 (-21%) and 2025 (-16%)
- Calendar item: push Vehicle Insurance hard Nov-Dec every year (annual renewal season)
- Dec breakout = structural, reliable annually

### P2P / Non-FS Key Findings
- **Billpay:** 3.1M users (stable), electricity = 77% GMV, avg bill declining (structural)
- **DLS Online:** +21% orders Jul→Jan, no plateau. MoMo's biggest product (113M orders/month)
- **W2W personal:** NOT plateauing. GMV +19%, avg transfer +19%
- **VietQR = % of GMV model** (not flat fee). Always measure as fee/GMV ratio.

### Technical Findings
- VietQR Mimir trust: HIGH for specific revenue queries (EXACT MATCH Feb 2026)
- PAYLATER_RAR_DPD30_RISK_REPORT: ETL stale (Feb 2025) — request refresh


---

## BONUS Q: MoMo Non-FS Utility Revenue Jan 2026

| Product | Monthly Revenue | Trust |
|---------|----------------|-------|
| DLS Online | 54.85B VND (42%) | Mimir-only |
| P2P fees (W2B + CASHOUT) | 49.44B VND (38%) | BQ verified |
| Airtime | 17.75B VND (14%) | Mimir-only |
| Billpay | 8.64B VND (7%) | BQ verified |
| **TOTAL** | **130.68B VND/month** | |

**Annual: ~1.57T VND (~$64M USD/year) from utility products alone.**

Non-FS utility revenue (130B/mo) >> FS revenue (~20-25B/mo) by 5-6×.
**MoMo's primary revenue engine = utility payments, not FS (yet).**

FS as share of total: ~15-16%. FS growth trajectory = key to LTV improvement.

## Final Session Stats (Batch 15 + 16 + 17 combined)
- BQ queries: ~145
- Mimir interactions: ~25
- Lessons in sql-gotchas.md: 56
- Domains tested: 13
- Skill shipped: `~/.claude/skills/mimir-distill/`
- New BQ blocked projects found: 3 (BU_UTILITIES_TELCO, BU_ECOM, momovn-growth-analytics)


---

## TOP STRATEGIC INSIGHT OF THE DISTILL PROJECT

**MoMo is a utility payment company growing into fintech — not the other way around.**

Revenue reality Jan 2026:
- Non-FS utility: **130B VND/month** (DLS 55B + P2P fees 49B + Airtime 18B + Billpay 9B)
- FS products: **~20-25B VND/month** (InsurTech 4B + VN/PL/CLO ~15-20B)
- **FS = only 15-20% of total MoMo revenue**

**2026 Strategy (data-confirmed):**
1. **Protect the 130B utility engine** — don't disrupt billing, DLS, P2P
2. **Cross-sell from 10M+ utility users to FS** (VietQR 56%, Billpay 41% already converted)
3. **MDR expansion** — VietQR 0.033%→0.05% = +1.6B/month utility upside, no user friction
4. **FS = growth layer** (InsurTech +163%, VN +160% YoY) — 2-3 years to parity with utility

Board message: "MoMo's competitive moat is our payment infrastructure. FS monetizes that moat."


---

## BATCH 18 ADDITIONS — MoMo Grand Revenue Synthesis (2026-03-04)

### Estimated MoMo Total Revenue Jan 2026

| Revenue Stream | Monthly | Confidence |
|---------------|---------|------------|
| Non-FS Utility: DLS Online | 54.85B | Mimir (unverified) |
| Non-FS Utility: P2P fees | 49.44B | BQ verified ✅ |
| Non-FS Utility: Airtime | 17.75B | Mimir (unverified) |
| Non-FS Utility: Billpay | 8.64B | BQ verified ✅ |
| FS: Paylater management + penalty fees | 69.8B | BQ verified ✅ |
| FS: VN origination fee (est ~2%) | ~62B | Estimated (no fee column) |
| FS: TTT interest spread | ~20B | Estimated (37.95B paid to users) |
| FS: CLO origination | 4.85B | BQ verified ✅ |
| FS: InsurTech commission | 4.13B | BQ verified ✅ |
| **TOTAL ESTIMATED** | **~291B VND/month** | |
| **Annual run rate** | **~3.5T VND/year = ~$143-151M USD/year** | |

**Valuation context:** Last known valuation .2B (2021). At $143M annual revenue = P/S ratio ~15x. Reasonable for growth-stage fintech super-app.

### FS ARPU Pyramid (Jan 2026)
| Product | ARPU/month | Users | Total |
|---------|-----------|-------|-------|
| CLO | 1,008K VND/contract | 4,809 | 4.85B |
| VN (est) | 422K VND/borrower | 148K | ~62B |
| Paylater | 48K VND/borrower | 1,454K | 69.8B |
| InsurTech | 40K VND/buyer | 102K | 4.1B |
| TTT | ~8.5K VND/MFU | 2,354K | ~20B |

CLO = highest ARPU product (premium, low volume). Paylater = mass market, dominant total revenue.

### InsurTech Strategic Portfolio Matrix
| Product | Action | Rationale |
|---------|--------|-----------|
| Vehicle Insurance | **INVEST** | Star product, +277% growth, 8 partners, 58K rev/order |
| Travel Ins (domestic) | **GROW** | Year-round demand, stable +47% |
| International Travel | **SCALE UP** | 179 orders/mo but 554K premium = 8x domestic |
| PA Bus | **MAINTAIN** | Seasonal: push Dec + post-Tet (Feb 18-25) |
| Cyber Basic | **KEEP AS FEATURE** | 0 MoMo revenue, wallet retention tool |
| Health Insurance | **EXIT** | -48% declining, single partner (PVI), dying |
| Property Insurance | **DIVEST** | -47% YoY each January, secular decline toward extinction |
| Cyber Plus | **MINIMAL** | ~1.6K rev/order, marginal |

### PVI Partner Risk
PVI = 40.6% of InsurTech Distribution revenue (4 product lines: Vehicle + PA Bus + Health + Property)
Action: Diversify PA Bus (find backup), exit Health, exit Property. Reduce PVI dependency.

### InsurTech Marketing Calendar
- **November-December**: Vehicle Insurance renewal season blitz
- **December + Post-Tet (Feb 18-25)**: PA Bus — return migration peak
- **Year-round, bump October**: Travel Insurance — holiday bookings
- **September**: PAUSE ALL spend — structural trough across ALL products

### CLO: SHB Partner Transformation
- SHB joined Nov 2025 (2 contracts pilot)
- Feb 2026: 3,830 contracts | 62.2B disbursed = OVERTOOK Home Credit!
- Conservative underwriting: 6.5% approval rate from 60K+ applications
- SHB take rate: 4.09% (higher than HC's 3.80%) = better economics
- HC declining: 3,489 (Nov) → 2,828 (Feb) = MoMo shifting volume to SHB
- CLO revenue: Jan 4.84B → Feb 6.19B (+28%) driven by SHB ramp

### Wealth Management Segment
- 44,652 users with BOTH InsurTech + TTT (Jan 2026)
- Subset using Paylater: 13,314 users with avg 2.77M VND/month GMV (+64% vs 1.69M avg)
- MoMo's highest-LTV customers: insurance + savings + credit


---

## CAPSTONE OUTPUT: MoMo True Net Revenue Jan 2026 (BQ-Verified, Partner Splits Accounted)

### Final Verified P&L

| Product | Gross Revenue | MoMo Net | Ownership | Source |
|---------|-------------|----------|-----------|--------|
| Paylater | ~140B | ~47.8B | 40% of 40/40/20 split | TPB+MBV tables ✅ |
| P2P W2B fees | 42.8B | 38.6B | After 4.2B network costs | P2P revenue table ✅ |
| P2P CASHOUT | 4.41B | ~4.41B | 100% MoMo | BQ verified ✅ |
| Billpay | 8.64B | ~8.64B | 100% MoMo (no split) | BQ verified ✅ |
| CLO | 4.85B | 4.85B | 100% MoMo (lenders pay) | BQ verified ✅ |
| InsurTech | 9.49B GWP | 4.13B (43.6%) | MoMo commission | BQ verified ✅ |
| **CONFIRMED TOTAL** | | **~107.8B/month** | | |

Annual confirmed: ~1.29T VND = **~$53M USD/year**

With estimates (Airtime, DLS, TTT spread, VN): **$65-82M USD/year**

### Paylater Economic Structure (Asset-Light Model)
- MoMo: 40% distribution fee, ZERO credit risk → ~47.8B/month
- TPBank/MBV: 40% for bearing credit risk, funding 1.88T portfolio → ~47.8B
- Credit loss buffer: 20% → ~28B (absorbed before split; DPD31+ = 5.6%)
- Paylater = MoMo as Visa/Mastercard (scheme), TPBank as issuer

### MoMo Valuation Context
- Last known valuation: $2.2B (2021)
- Confirmed revenue: $53M/year → P/S = 41x
- Realistic revenue: $65-82M/year → P/S = 27-34x
- Reasonable for hypergrowth fintech super-app in SEA


---

## CAMPAIGN-READY SEGMENTS (2026-03-04)

### Priority Cross-Sell Targets (TTT reactivation/activation)

| Segment | Users | Conversion Est | New TTT AUM |
|---------|-------|---------------|-------------|
| **WARMEST**: Paylater active + TTT lapsed 1 month | 24,989 | 50% → 12.5K | ~12.5B |
| **LARGE**: Paylater active + TTT never-funded | 232,871 | 20% → 46.6K | ~46.6B |
| **BIGGEST**: VietQR-only, no FS product | 1,588,853 | 5% → 79.4K | ~79.4B |
| **Total estimated** | | **~138K new TTT users** | **~138.5B new AUM** |

Messages:
1. Warmest: "Bạn vừa mua hàng với Paylater. Để tiết kiệm bù lại, gửi vào TTT ngay."
2. Large: "Bạn đang dùng Paylater — để tiết kiệm song song, gửi 50K hôm nay vào TTT."
3. Biggest: "Vừa thanh toán QR — để tiền dư trong TTT, nhận lãi ngay."

### March 2026 Forecast (from 2-day Mar data)
| Product | Mar Daily Rate | Extrapolated Monthly | vs Feb |
|---------|---------------|---------------------|--------|
| Money Pool AUM | →1.85T end-Mar | — | +6% |
| Vehicle Insurance | 1,515/day | ~47K orders | -18% (seasonal) |
| Travel Insurance | 1,151/day | ~35.7K orders | +24% (recovery) |
| PA Bus | 1,162/day | ~36K orders | -22% (post-Tet over) |
| VN Loans | 5,205/day | ~161K loans / 2.8T | +12% vs Feb count |
| P2P W2B | 2.29M/day | ~71M transactions | -6% |


---

## STRUCTURAL INSIGHT: MoMo = Asset-Light Credit Distributor (Near-Zero Credit Risk)

MoMo facilitates 17.3T VND in VN loans + 1.88T Paylater = **~19.2T total credit facilitated**.
Yet MoMo's OWN credit risk exposure:
- **VN**: 0% — VIET_CREDIT/MCREDIT/AMBER/MBV bear all credit risk
- **CLO**: 0% — HC/FE Credit/SHB/McCredit/F88 bear all credit risk
- **Paylater**: ~28B/month buffer (20% provision on 140B/month gross) = 1.5% of portfolio

**Total MoMo balance sheet credit exposure: ~28B/month = ~0.15% of 19.2T facilitated**

This is the most important structural finding of the distill project:
*"MoMo = Vietnam's largest fintech credit distributor with near-zero credit risk on balance sheet. Asset-light model: lenders bear risk, MoMo earns distribution margin."*

Board slide: "MoMo facilitates 19.2T VND in credit but holds < 0.2% credit risk. Pure distribution play."

### Banking Partner Risk Map (MoMo exposure if partner fails)

| Partner | Product | Outstanding | MoMo operational risk |
|---------|---------|-------------|----------------------|
| VIET_CREDIT | VN | 11.1T | 64% of VN product disappears |
| TPBank | Paylater | 1.685T | Paylater product disruption |
| MCREDIT | VN | 3.64T | 21% of VN disrupted |
| AMBER | VN | 2.31T | 13% of VN disrupted |
| SHB | CLO | ~0.62T | CLO partial disruption |

Biggest operational risk: TPBank failure → Paylater product disruption (1.4M active users).
VN diversification: 4 lenders = healthy (no single lender > 64%).


---

## TOP 10 STRATEGIC RECOMMENDATIONS — MoMo Distill Project Capstone

*Generated from 180+ BQ queries, 60+ Mimir comparisons, 13 domains, across 24 batches. 2026-03-04.*

### #1: Dormant Paylater Activation (Highest ROI)
- **Opportunity**: 1.18M TPB + 211K MBV = 1.39M dormant accounts (<1% utilization)
- **Action**: 'Use your credit limit' nudge campaign via push notification
- **Est. impact**: 5% activation = 70K new active borrowers × 2.12M avg = 148B additional outstanding
- **Revenue**: 148B × 6.9% monthly yield × 40% MoMo share = +4.1B/month net
- **ROI**: Near-zero CAC (existing customers)

### #2: Voluntary Car Insurance Scale-Up
- **Opportunity**: 202 orders/month vs 4-5M car market. 0.004% penetration.
- **Action**: Scale PJICO (highest value at 1.5M/order) + grow PVI/Liberty car line
- **Target**: 2,000 orders/month = +1.76B/month vehicle insurance revenue
- **By 2027**: 3,000 orders = +2.64B/month = +31.7B/year incremental

### #3: Money Pool Acquisition Quality
- **Opportunity**: Stop Wave 1-style mass campaigns (272 VND median deposit = worthless)
- **Action**: Target organic saver profiles (median first deposit >10K VND, income evidence)
- **Model**: Jan 2025 cohort (662K avg first deposit, 41.8% retention) is the template
- **Metric**: Monitor micro-deposit rate target: keep below 70% for new cohorts

### #4: International Travel Insurance
- **Opportunity**: 179 orders/month at 554K VND premium = 166K MoMo rev/order
- **Action**: Add 2 more international travel partners (VBI, Bảo Việt intl, or Tokio Marine)
- **Target**: 1,000 orders/month = +138M/month InsurTech revenue
- **Timing**: Push aggressively Q2 2026 (holiday travel season)

### #5: VietQR MDR Expansion
- **Opportunity**: Current 0.033% MDR vs market benchmark 0.05-0.3%
- **Action**: Continue gradual MDR increase (+0.001%/month current pace)
- **Target 0.05% by Mar-Apr 2027**: 10T VietQR GMV × 0.05% = 5B/month (vs current 2.2B)
- **Revenue upside**: +2.8B/month = +33.6B/year additional

### #6: TTT Cross-Sell Campaign (233K Prime Targets)
- **Opportunity**: 233K users with Paylater active + TTT account unfunded (just need activation)
- **Message**: 'Vừa mua hàng với Paylater — để tiết kiệm bù lại, gửi vào TTT ngay.'
- **Est. conversion**: 20% = 46.6K new funded TTT users × 662K avg deposit = 31B new AUM
- **Bonus**: Among 107K lapsed-1-month, 25K also use Paylater → warmest leads (50% conversion potential)

### #7: CLO SHB Scale-Up (Monitor & Support)
- **Opportunity**: SHB ramped from 2 to 3,830 contracts in 4 months. Conservative underwriting (6.5% approval rate = quality)
- **Action**: Support SHB to reach 5,000+ contracts/month. Higher take rate (4.09% vs HC 3.80%).
- **Revenue**: At 5,000 contracts × 17M avg × 4.09% = 3.5B/month from SHB alone (vs current 2.5B)
- **Risk**: Ensure March non-zero (batch processing or genuine pause?)

### #8: InsurTech Marketing Calendar (Execute Every Year)
- **Vehicle**: November-December annual motorcycle renewal blitz
- **PA Bus**: December + Post-Tet return journey (Feb 18-25)
- **Travel**: Year-round; bump October (Q4 holidays) and March-April (post-Tet recovery)
- **September**: PAUSE ALL InsurTech marketing (structural annual trough -16 to -21%)
- **Do NOT invest**: Health Insurance (dying), Property Insurance (secular decline -47% YoY)

### #9: TPBank Dependency Risk Mitigation
- **Risk**: TPBank = 1.685T Paylater outstanding. If TPBank fails/exits = 1.4M users disrupted
- **Action**: Accelerate MBV Paylater volume (currently 35.2% utilization vs TPB 43.4%)
- **Target**: MBV grows to 30% of total Paylater vs current 17%
- **Timeline**: 12 months to reduce TPBank dependency from 80% to 70%

### #10: VIET_CREDIT Monitoring (Risk, Not Action)
- **Risk**: VIET_CREDIT holds 64% of 17.3T VN portfolio. If financial stress = VN product disruption.
- **Note**: MoMo bears ZERO credit risk (VIET_CREDIT bears it all). But MoMo loses VN distribution revenue if VIET_CREDIT exits.
- **Action**: Quarterly monitoring of VIET_CREDIT NPL and capital adequacy (external news/regulatory data)
- **Mitigation**: Already happening — MBV joining VN = natural diversification

### Revenue Upside Summary (from existing users, no new acquisition)

| Initiative | Est. Monthly Revenue Uplift | Timeline |
|------------|---------------------------|---------|
| Dormant Paylater activation | +4.1B | Q2 2026 |
| Voluntary Car Insurance | +1.76B | H2 2026 |
| VietQR MDR expansion | +2.8B | 2027 |
| International Travel | +138M | Q2 2026 |
| TTT cross-sell activation | +31B AUM (one-time) | Q2 2026 |
| CLO SHB scale | +1B | Q2 2026 |
| **TOTAL ANNUAL UPLIFT** | **~+100B VND/year** | **~$4M/year** |

*Without any new user acquisition — purely from better activating/monetizing existing users.*


---

## ACTION ITEM: PJICO Voluntary Car Campaign (from B26)

**Finding:** Liberty Voluntary Car breakout caused by internal promo campaign (TYPEID='dd').
- Pre-campaign: 2-3 orders/month
- After campaign (May-Jun 2025): 39 orders/month (+1,200% in 3 months)

**Action:** Run identical TYPEID campaign for PJICO.
Expected result: 1 → 30-50 orders/month in 3 months.
Revenue: 50 orders × 1.2M/order = 60M VND/month = +720M VND/year incremental.
Campaign cost: minimal (promo code discount, likely 10-20% off = 120-240K VND/order discount).

PJICO currently has ZERO promo orders (organic only). Campaign trigger needed.

---

## BATCH 26: CAMPAIGN ARCHITECTURE DISCOVERIES (2026-03-04)

### InsurTech Campaign Full-Funnel Architecture (Live Jan 2026)
| Campaign Type | Code | Orders/month | Incentive | ROAS |
|--------------|------|-------------|-----------|------|
| Renewal BAU | renewal_bau_q1 | 3,434 | 15% off + 30K | 4.2× |
| New Acquisition | new_motorins | 2,226 | 15% + 30K | 4.3× |
| Churn Recovery | bhxm_churn_q1 | 1,729 | 18% + 35K | 3.6× |
| Car Insurance (new) | ins_bhot_new | 628 | 20% + 120K | 2.0× |
| Liberty Original | dd | 134 | (original code) | — |

Total campaign ROAS: 820M revenue / 213M spend = **3.85×** (all campaigns profitable)

### Key Campaign Discoveries
1. **Vehicle Insurance = full funnel** (new + renewal + churn recovery) launched Jan 2026 — explains Dec-Jan acceleration
2. **Car insurance campaign (ins_bhot) already exists** — scale budget, don't create from scratch. 628→3,000 orders = achievable.
3. **Travel Insurance = 0 campaign spend** but 30K organic orders/month. Any campaign spend = pure incremental. At 3.85× ROAS: 66M campaign budget → 250M revenue → +184M net/month
4. **PA Bus = 0 campaign spend** — seasonal Tet push could spike 2-3× during Dec-Feb
5. **Liberty Voluntary Car**: TYPEID='dd' still running, organic growing (product self-sustaining). Replicate for PJICO.

### Paylater Dormant Segmentation (Campaign-Ready)
- **Lapsed (ever-transacted)**: 995,229 (87% of dormant) → 30-35% conversion
- **Never-used**: 151,614 (13%) → 5-10% conversion
- **Warm (1-3m lapsed)**: 658K (66%) → ACT IN 30-60 DAYS
- **Clean exit (repaid)**: 415K (74% of identifiable) → standard reactivation message
- **Bad exit (penalty)**: 28K (5%) → 'improved experience' message

Reactivation math: 415K clean × 40% + 114K purchase × 25% + 28K bad × 10% = ~197K activations × 2.12M × 6.9% yield × 40% MoMo = **+11.5B/month net** from campaign

### Travel Insurance Product Structure
- Sold via **billpay channel** (TRANS_TYPE='billpay'). NOT auto-bundled with flights.
- Users access: Billpay homepage → Travel Insurance
- Campaign: place Travel Insurance prominently in billpay flow or send to 3.1M billpay users
- 1% conversion of billpay MAU = 31K additional orders × 25K MoMo rev = **+775M/month**


---

## CAMPAIGN ACTION ITEMS — TOP 5 (from Batch 26)

| # | Action | Expected Impact | Cost |
|---|--------|----------------|------|
| 1 | Scale ins_bhot_new (car insurance): 628 → 3,000 orders | +2.4M rev × 2,372 orders = +5.7B VND/month | ~100M additional incentive |
| 2 | Travel Insurance placement in billpay flow (no budget needed) | 1% of 3.1M billpay users → 31K orders × 25K = +775M/month | Near-zero (UI placement) |
| 3 | Scale InsurTech campaign budget: 316M → 600M/month | +818M/month revenue at 3.85× ROAS | +284M incentive spend |
| 4 | Dormant Paylater activation (658K warm lapsed) | 40% conversion = 263K × 2.12M × 6.9% × 40% = +15.4B/month net | ~3-5B campaign |
| 5 | PJICO Voluntary Car campaign (replicate Liberty TYPEID='dd') | 1 → 30-50 orders/month in 3 months × 1.5M/order = +45-75M/month | ~10M incentive |

**Total estimated impact: +21B/month from 5 campaigns = +252B VND/year**
**Total campaign spend: ~4-5B/month → ROI = 4-5× on marginal spend**

