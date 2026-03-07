# CFO Analysis: MoMo Wealth War Plan

## 1. REVENUE MODEL REALITY CHECK

### Distribution Fee (0.15-0.40%) - Is It Realistic?

YES, the range is realistic for Vietnam. Fund management fees in Vietnam:
- Money market funds: 0.5-0.8% management fee
- Bond funds: 0.8-1.2% management fee
- Equity funds: 1.5-2.0% management fee

Distribution/trailer fees are typically 30-50% of management fee:
- Money market: 0.15-0.25% distribution (matches war plan low end)
- Bond: 0.25-0.40% distribution
- Equity: 0.40-0.60% distribution

The 0.15-0.40% range is CORRECT but weighted toward the LOW end because Phase 1 is money market only. Realistic blended rate for Phase 1: **0.15-0.20%**, not 0.40%.

### CRITICAL FINDING: ARPU Math Doesn't Add Up

War plan claims Y1: 500K users x $5 ARPU = $2.5M revenue.

Let's verify with their own numbers:
- 500K funded users, avg $50/user = $25M new AUM
- At 0.20% distribution fee: $25M x 0.20% = **$50,000/year**
- To get $2.5M at 0.20%: need $1.25 BILLION in new AUM
- To get $5 ARPU at 0.20%: need $2,500 AUM per user (vs stated $50)

**The $2.5M Y1 revenue figure is off by ~50x from the fee structure.**

Either:
1. AUM/user is wildly understated ($50 should be $2,500) - unlikely for micro-savers
2. Fee rate is understated (would need ~4% not 0.20%) - unrealistic
3. Revenue includes existing TTT spread (double-counting)
4. Revenue assumes subscription revenue that doesn't exist in Phase 1

### Corrected Revenue Projections

**Distribution Fee Only (honest model):**

| Year | Funded Users | Avg AUM/User | Total New AUM | Fee Rate | Revenue |
|------|-------------|-------------|--------------|---------|---------|
| Y1 | 500K | $50 | $25M | 0.20% | $50K |
| Y2 | 1.5M | $100 | $150M | 0.25% | $375K |
| Y3 | 3M | $167 | $500M | 0.30% | $1.5M |

**With Subscription (Phase 2+, $1/mo, 10% uptake):**

| Year | Subscribers | Sub Revenue | Distribution | Total |
|------|-----------|------------|-------------|-------|
| Y1 | 0 | $0 | $50K | $50K |
| Y2 | 150K | $1.8M | $375K | $2.2M |
| Y3 | 300K | $3.6M | $1.5M | $5.1M |

**Reality: Revenue is subscription-dependent, not AUM-dependent at this scale.**

---

## 2. COST STRUCTURE - IS $500K-1M ENOUGH FOR PHASE 1?

### Phase 1 Launch Cost (90 days)

| Item | Estimate | Notes |
|------|---------|-------|
| Engineering (5-8 people x 3mo) | $150-300K | Round-up engine, goal UI, fund API integration |
| Fund partner integration | $50-100K | API, testing, reconciliation |
| Compliance/legal | $50-100K | SSC verification, disclaimers, terms |
| Marketing (stated) | $200-400K | Paid + organic |
| Ops setup | $30-50K | Support training, escalation process |
| **Total launch** | **$480K-950K** | Fits the $500K-1M envelope |

VERDICT: $500K-1M is TIGHT but feasible for launch IF using existing engineering teams (opportunity cost not counted).

### What's Missing: Post-Launch Year 1 Operating Cost

| Item | Annual Cost | Notes |
|------|-----------|-------|
| Engineering maintenance (3-4 FTE) | $150-200K | Bug fixes, feature iteration |
| Compliance monitoring | $50-100K | Ongoing regulatory reporting |
| Customer support (investment disputes) | $100-200K | Much higher cost than payments support |
| Marketing (sustained) | $300-500K | Can't stop after 90 days |
| Fund partner management | $30-50K | Relationship, reconciliation |
| **Total Y1 operating** | **$630K-1.05M** | ON TOP of launch cost |
| **Total Y1 all-in** | **$1.1M-2.0M** | Launch + operations |

**The war plan's $500K-1M only covers launch. True Y1 cost is $1.1-2.0M.**

---

## 3. BREAK-EVEN TIMELINE

### Scenario A: Distribution Fee Only (No Subscription)

- Y1 cost: $1.5M (midpoint), revenue: $50K -> Loss: $1.45M
- Y2 cost: $1.2M (ops), revenue: $375K -> Loss: $825K
- Y3 cost: $1.5M (scaling ops), revenue: $1.5M -> Breakeven
- Cumulative loss by Y3: ~$2.3M
- **Break-even: Late Y3 / Early Y4**

### Scenario B: Distribution + Subscription (Base Case)

- Y1 cost: $1.5M, revenue: $50K -> Loss: $1.45M
- Y2 cost: $1.5M, revenue: $2.2M -> Profit: $700K
- Y3 cost: $2.0M, revenue: $5.1M -> Profit: $3.1M
- Cumulative breakeven: Mid Y2
- **Break-even: ~18-20 months post-launch**

### Scenario C: Bear Case (Half Conversion, $3 ARPU)

- Y1: 250K users, revenue: $25K (distribution only) -> Loss: $1.5M
- Y2: 750K users, 75K subs x $1/mo = $900K + $190K dist = $1.1M -> Loss: $400K
- Y3: 1.5M users, 150K subs = $1.8M + $750K dist = $2.6M -> Profit: $600K
- Cumulative breakeven: Late Y3
- **Break-even: ~30-36 months**

---

## 4. STRESS TEST: WAR PLAN Y1-Y3 PROJECTIONS

### War Plan Numbers vs Reality

| Metric | War Plan | CFO Base | CFO Bear | Gap |
|--------|---------|---------|---------|-----|
| Y1 Revenue | $2.5M | $50K | $25K | **50x overestimated** |
| Y2 Revenue | $15M | $2.2M | $1.1M | **7x overestimated** |
| Y3 Revenue | $45M | $5.1M | $2.6M | **9x overestimated** |

**The war plan revenue projections are not credible without explaining the ARPU math.**

To reach $45M Y3 revenue:
- At 0.30% distribution fee: need $15B AUM (30x Vietnam's entire open-end fund market)
- At $15 ARPU with 3M users: need ~$5,000 AUM/user AND subscription
- Most realistic path: 3M users x $1.50/mo subscription = $54M (but 10% of MoMo base subscribing to investment tier is VERY aggressive)

---

## 5. TTT ECONOMICS: THE CANNIBALIZATION TRAP

### Current TTT P&L

| Metric | Value |
|--------|-------|
| AUM | $490M (12.46T VND) |
| Gross yield (est.) | ~6% |
| Interest paid to users | ~4% ($16.5M/year) |
| **Net spread** | **~2% = $9.8-11.5M/year** |

### What Happens If Users Move to Partner Funds

Every dollar moved from TTT to partner fund:
- LOSE: $0.020 (2% net spread)
- GAIN: $0.002 (0.20% distribution fee)
- **NET LOSS: $0.018 per dollar migrated**

| Migration Scenario | AUM Moved | Revenue Lost | Revenue Gained | Net Impact |
|-------------------|----------|-------------|---------------|-----------|
| 10% migrates | $49M | $980K | $98K | **-$882K/year** |
| 20% migrates | $98M | $1.96M | $196K | **-$1.76M/year** |
| 30% migrates | $147M | $2.94M | $294K | **-$2.65M/year** |

**THIS IS THE SINGLE BIGGEST FINANCIAL RISK IN THE ENTIRE PROPOSAL.**

If MoMo Wealth succeeds in moving users to "higher yield" partner funds (5-7% vs TTT 4%), rational users WILL migrate from TTT. We'd be cannibalizing $10/year in net spread for $0.20/year in distribution fee.

### Mitigation Options
1. Position funds as COMPLEMENTARY to TTT (not replacement) - "TTT for emergency, funds for goals"
2. Keep TTT yield competitive so users don't feel compelled to move
3. Ensure fund onboarding doesn't allow direct TTT-to-fund transfers
4. Accept some cannibalization as cost of platform evolution

---

## 6. RISK: FINANCIAL DOWNSIDE & OPPORTUNITY COST

### If MoMo Wealth FAILS (worst case)

| Risk | Financial Impact |
|------|-----------------|
| Sunk cost (Y1 launch + ops) | $1.5-2.0M |
| Brand damage (users lose money) | Unquantifiable but severe |
| TTT cannibalization (partial) | $1-3M/year ongoing |
| Engineering opportunity cost | 5-8 engineers x 12mo = $300-600K equivalent |
| Management distraction | Not quantifiable |
| **Total downside** | **$3-5M + brand risk** |

### Opportunity Cost (What Else Could $1-2M Build?)

- Paylater expansion (proven unit economics, 40/40/20 model)
- VayNhanh scaling (growing, higher margin)
- InsurTech voluntary products (untapped $50M+ market)
- Core payments improvement (375M txn/mo monetization)

### If MoMo Wealth SUCCEEDS (best realistic case)

| Year | Revenue | Profit |
|------|---------|--------|
| Y1 | $50K | -$1.5M |
| Y2 | $2.2M | +$700K |
| Y3 | $5.1M | +$3.1M |
| Y5 | $10-15M | +$7-10M |

Cumulative 5-year value: ~$10-15M profit (if subscription model works).
NOT a $45M business by Y3. More like a $5-15M business by Y5.

---

## 7. OPTION B vs OPTION C

### Option B: Strike Fast ($500K-1M stated, $1.5-2M real Y1)

PROS:
- Low initial commitment, can pivot/kill quickly
- Uses existing assets (TTT base, fund license, engineering)
- Speed advantage (90-day launch)
- Kill criteria defined (can abort at beta)

CONS:
- Understated cost (real Y1 = $1.5-2M)
- Revenue projections wildly optimistic
- Limited product without subscription model
- Distribution fee alone doesn't build a business

### Option C: Go Big ($3-5M+)

PROS:
- Full control of value chain
- Own fund management = higher margins (1-2% mgmt fee vs 0.20% distribution)
- Stronger competitive moat
- More defensible against Grab

CONS:
- 12-18 month delay (Grab window concern)
- Higher capital at risk
- Securities license: VND 25B (~$1M) + 6-12 months SSC processing
- Need dedicated team (15-20 people)

### CFO View

Option B is the right starting point BUT:
1. Budget should be $1.5-2M (not $500K-1M) to cover full Y1
2. Revenue projections must be corrected (order of magnitude off)
3. Subscription model is the ONLY path to meaningful revenue
4. TTT cannibalization must be actively managed
5. Kill criteria at 6 months: if <100K funded AND <10% subscription conversion, shut down

---

## 8. CFO RECOMMENDATIONS

1. **APPROVE Option B with corrected budget ($1.5-2M Y1)** - the strategic logic is sound even if the financial model is wrong
2. **REJECT the $2.5M-$45M revenue projections** - they are off by 10-50x. Honest Y1-Y3: $50K -> $2.2M -> $5.1M
3. **MANDATE subscription model in Phase 2** - distribution fees alone cannot sustain this business
4. **BUILD TTT WALL** - do NOT allow easy TTT-to-fund migration. Position as complementary.
5. **SET KILL CRITERIA** - 6-month gate: 100K funded, 20% activation, NPS>30. Miss 2 of 3 = pause.
6. **PARTNER, don't build** for Phase 1-2. Acquire/license only if Phase 2 proves PMF.
7. **WATCH THE REAL METRIC**: not funded users, but NET revenue impact (new wealth revenue MINUS TTT cannibalization)
