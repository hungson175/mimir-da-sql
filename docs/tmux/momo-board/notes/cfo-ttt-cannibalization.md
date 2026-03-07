# CFO Analysis: TTT Cannibalization Model

**Author:** CFO | **Date:** 2026-03-06 | **Session:** momo-board Round 2

---

## The $2.72 Threshold — Full Derivation

### Step 1: TTT Net Spread Per User

From actual BQ data (Feb 2026):

| Metric | Value | Source |
|--------|-------|--------|
| TTT AUM | 12.46T VND ($490M) | BQ: mart_ttt_daily_user_record |
| MFU (funded users) | 2.88M | BQ: mart_ttt_daily_user_record |
| Average AUM per MFU | 4.33M VND ($170) | Calculated |
| Gross yield from bank partners | 6.0% annually | Estimated from data |
| Interest paid to users | 420B VND/year ($16.5M) | BQ: actual interest column |
| Effective user rate | 3.37% | 420B / 12.46T |
| Monthly gross | 62.3B VND | 12.46T x 6% / 12 |
| Monthly interest paid | 37.9B VND | Actual from BQ |
| Monthly net | 24.4B VND | 62.3 - 37.9 |
| Annual net spread | 293B VND ($11.5M) | 24.4 x 12 |
| **Net spread rate** | **2.35%** | 293B / 12.46T |

**TTT revenue per funded user = $11.5M / 2.88M = $3.99/year**

### Step 2: Investment Product Revenue Per User

If the same user moves their $170 average to an investment product:

| Product | Distribution Fee |
|---------|-----------------|
| Money market fund | 0.4-0.6% |
| Short-term bond fund | 0.8-1.0% |
| Blended Phase 1 (capital preservation) | 0.75% |

**Revenue per user: $170 x 0.75% = $1.28/year**

### Step 3: The Migration Threshold

```
Revenue LOST per migrated user:
  $3.99 (TTT spread) - $1.28 (investment fee) = $2.72/year

In percentage terms:
  $170 (avg AUM) x (2.35% TTT spread - 0.75% investment fee)
  = $170 x 1.6%
  = $2.72
```

**$2.72 = annual revenue haircut per user when they migrate from TTT to investment products.**

### Assumptions Driving the $2.72

1. Average AUM/user = $170 (actual BQ data, Feb 2026)
2. TTT net spread = 2.35% (actual: gross 6% minus 3.65% paid to users)
3. Investment distribution fee = 0.75% (blended Phase 1 product mix)
4. User migrates 100% of TTT balance (worst case)

### Sensitivity Analysis

| Scenario | Avg AUM | Spread Delta | Threshold |
|----------|---------|--------------|-----------|
| Average user | $170 | 1.6% | $2.72 |
| 3M+ tier user | $400 | 1.6% | $6.40 |
| 100M+ user | $3,937 | 1.6% | $63.00 |
| If investment fee = 1.0% (balanced funds) | $170 | 1.35% | $2.30 |
| If investment fee = 0.4% (pure MM) | $170 | 1.95% | $3.32 |

### Critical Insight

**AUM concentration is extreme: 0.7% of users hold 60.8% of AUM.** The $2.72 average masks the real risk — high-value user migration. Guardrails MUST be segmented by tier.

---

## 10% TTT AUM Migration — Net P&L Impact

### Scenario: 10% of TTT AUM migrates to investment products

| Metric | Value |
|--------|-------|
| Migration volume | 10% of $490M = $49M |
| Affected users | ~288K (10% of 2.88M MFU) |
| Avg migrated balance | $170/user |

**Revenue Impact:**

| Line Item | Annual |
|-----------|--------|
| TTT revenue LOST | $49M x 2.35% = -$1.15M |
| Investment revenue GAINED | $49M x 0.75% = +$367K |
| **Net P&L impact** | **-$783K/year** |
| Monthly impact | -$65K/month |
| As % of TTT revenue | -6.8% |

### Offset Ratio

For each $1 migrated from TTT to Investment:
- Lost: $0.0235 (TTT spread)
- Gained: $0.0075 (investment fee)
- Net: -$0.016 per dollar

**To offset, we need $2.13 of NEW external money for every $1 of TTT money that migrates.**

At 10% migration ($49M): need $104M of new external AUM to offset.

Achievable if we capture 5% of the 935K investor segment's external flows ($2B/year to TCBS/SSI) = $100M.

---

## -5% TTT Revenue Trigger (President Thuan's Condition)

### What -5% Looks Like in Hard Dollars

| Metric | Value |
|--------|-------|
| TTT annual spread | $11.5M |
| 5% of that | $575K/year |
| Monthly threshold | $47.9K/month |
| At $2.72/user migration cost | 211K users fully migrating |
| At $170 avg AUM/user | $35.9M AUM migration |
| As % of total AUM | 7.3% |

**The trigger fires if ~7% of TTT AUM migrates to investment in any rolling 30-day period.**

### High-Value User Risk

The 86,700 high-value users (30M+ VND) hold 60.8% of AUM. If just 3,500 of them migrate (4% of high-value segment):
- 3,500 x avg $3,100 balance x 1.6% delta = $174K
- That's already 36% of the monthly trigger ($47.9K)

---

## Tiered Guardrail Design (Board-Approved)

### Tier 1: TTT Balance <3M VND (<$118)

| Metric | Value |
|--------|-------|
| Users | 10.32M (89.2% of base) |
| AUM | 532B VND ($21M, 4.3% of total) |
| Max migration impact (100% leave) | $336K/year |
| **Policy** | **FREE MIGRATION. Low revenue impact. Goodwill > $336K.** |

### Tier 2: TTT Balance 3M-50M VND ($118-$1,970)

| Metric | Value |
|--------|-------|
| Users | 364K (3.2% of base) |
| AUM | 4.89T VND ($192M, 39.0% of total) |
| Max migration impact (10% leave) | $307K/year |
| **Policy** | **MONITOR + FLAG. Weekly report. Alert if >10% migration in rolling 30 days.** |

### Tier 3: TTT Balance 50M+ VND (>$1,970)

| Metric | Value |
|--------|-------|
| Users | 46,910 (0.4% of base) |
| AUM | 4.54T VND ($178M, 36.3% of total) |
| Max migration impact (5% leave) | $142K/year |
| **Policy** | **PREMIUM SERVICE (not lock-in). Expand wallet, don't defend TTT balance.** |

Tier 3 mechanisms:
- Dedicated support line (WhatsApp/Zalo)
- Curated fund selection (Dragon Capital premium funds)
- Priority settlement (T+0 for Tui+ members)
- Investment coaching with Moni AI
- Track TOTAL AUM (TTT + Investment), not just TTT balance

### Wallet Expansion Model (Tier 3)

If a 50M+ TTT user ADDS 50M in investments while keeping 30M in TTT:
- TTT: loses 20M VND balance -> -$12.56/year in spread
- Investment: gains 50M VND AUM -> +$14.75/year in fees
- **NET: +$2.19/year per user**

**Net positive when: Investment AUM added > 2.13x TTT AUM lost**

Example: 50M invested / 20M moved from TTT = 2.5x ratio = NET POSITIVE

### Global Emergency Brake

- Tiers = smoke detectors (early warning)
- -5% trigger ($575K/year) = fire alarm (global stop)
- Tier 2 yellow flag + Tier 3 red flag = ~$449K annualized = 78% of global trigger
- Tiered system catches problems BEFORE global trigger fires

### Hard Throttle Mechanism (4 Steps)

If migration exceeds 5% monthly trigger:
1. Remove 'Transfer from TTT' as default funding option
2. Add friction: confirmation screen explaining yield difference
3. If sustained 2 months: cap TTT-to-Investment transfers at 50% of balance
4. CEO + CFO joint approval required to lift throttle

---

## Instrumentation Requirements (Pre-Launch, Non-Negotiable)

### 1. Daily Dashboard — TTT-to-Investment Migration Tracker
- Metric: users with TTT withdrawal + same-day/week investment deposit
- Segmented by balance tier (0-300K, 300K-3M, 3M-30M, 30M+)
- Source: BQ join between TTT daily_user_record and investment transaction log
- Alert: automated Slack alert if rolling 7-day rate exceeds 1% of any tier

### 2. Net AUM Flow Tracking
- Total inflow to investment products: new money vs TTT-sourced
- Tag every investment deposit: 'TTT-transfer' vs 'wallet-top-up' vs 'bank-transfer'
- Weekly report: % of investment AUM funded from TTT

### 3. Revenue Impact Calculator
- Real-time: (TTT AUM lost x 2.35%) - (Investment AUM gained x 0.75%)
- Dashboard shows: 'Net revenue impact this month: +$X or -$X'
- Color-coded: green (<2%), yellow (2-4%), red (>4% of TTT spread)

### 4. Quarterly Board Report
- TTT health scorecard: AUM trend, net spread, migration rate
- Investment product scorecard: AUM growth, % from new money vs TTT
- Combined P&L: net revenue impact of wealth product on overall FS business

**Technical build estimate:** 2-3 weeks of engineering, ~$50K cost. Must be live BEFORE beta opens.
