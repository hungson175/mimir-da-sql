# CFO Analysis: Unit Economics — Day 1 to Break-Even

**Author:** CFO | **Date:** 2026-03-06 | **Session:** momo-board Round 2

---

## Cost Per Funded Account: $14.70

| Component | Cost | Notes |
|-----------|------|-------|
| Marketing CAC (internal conversion) | $6.50 | Converting existing MoMo users, not acquiring new ones. 935K self-identify as investors. Push + in-app placement. |
| Securities KYC (incremental) | $1.50 | Standard eKYC already done; SSC-grade identity verification is incremental. |
| Tech allocation | $6.70 | Y1 build budget $1.68M / 250K target users. Includes trading engine, custody API, compliance systems. |
| **Total (fully loaded)** | **$14.70** | Marginal cost drops to $8-9 after Month 12 as tech amortizes. |

## Minimum AUM Per User: $1,200

**Steady-state annual opex: $2.5M**

| Category | Annual Cost |
|----------|------------|
| Tech maintenance (4 engineers + infra) | $1.0M |
| Operations (support team, settlement) | $700K |
| Compliance (reporting, audit, legal) | $400K |
| Marketing (retention) | $400K |
| **Total** | **$2.5M** |

**Revenue model:** 0.8% blended distribution fee on AUM (conservative; money market + short-term bond = lower fee)

**Plus Tui+ investment bundle:** 15% uptake at VND 19K/mo ($9/yr) = 37,500 subscribers x $9 = $337K/year

**Break-even equation:**

```
(250K x AUM x 0.8%) + $337K = $2.5M
AUM per user = ($2.5M - $337K) / (250K x 0.8%)
AUM per user = $1,081 minimum
Rounded to $1,200 for safety margin = 30.6M VND per user
```

**Is $1,200 realistic for target segments?**

| TTT Tier | Users | Avg Balance |
|----------|-------|-------------|
| 3M-30M VND | 325K | $407 |
| 30M-50M VND | 40K | $1,500 |
| 50M+ VND | 47K | $3,700 |
| Combined 3M+ | 412K | $901 |

Plus external money: 935K investor segment invests ~$2,172/year outside MoMo. Capturing 55% = $1,200 avg AUM. Achievable.

## At 250K Funded Users — Minimum Average Balance

| Avg Balance | Total AUM | Revenue (0.8% + Tui+) | vs $2.5M Opex | Status |
|-------------|-----------|----------------------|---------------|--------|
| $1,200 | $300M | $2.74M | +$240K | Break-even |
| $800 | $200M | $1.94M | -$560K | NOT break-even |
| $500 | $125M | $1.34M | -$1.16M | Deep red |

**The line is $1,200. Below that, unit economics don't close at 250K users.**

## Base Case — Month 18-20 Break-Even (REVISED: see below)

### Monthly Buildup

**Month 1-6 (Build + Soft Launch):**
- Cumulative spend: $1.2M (Tech $800K, Compliance $150K, Team 6 FTE $180K, Marketing $70K)
- Funded users: 0 -> 30K (beta + early adopters)
- AUM: ~$15M
- Revenue: $10K/month by Month 6
- Month-6 kill gate checkpoint: 100K funded + 15% Tui+ + NPS>30

**Month 7-12 (Scale Phase 1):**
- Spend: $180K/month ($1.08M for 6 months)
- Funded users: 30K -> 120K
- AUM: $15M -> $80M
- Revenue: $10K -> $53K/month
- Cumulative investment: $2.28M | Cumulative revenue: $190K | Net: -$2.09M

**Month 13-18 (Scale Phase 2):**
- Spend: $200K/month ($1.2M for 6 months)
- Funded users: 120K -> 250K
- AUM: $80M -> $300M
- Revenue: $53K -> $228K/month
- Cumulative investment: $3.48M | Cumulative revenue: $1.03M | Net: -$2.45M

**Month 19-20: BREAK-EVEN POINT**
- Monthly revenue: $228K+ (run-rate $2.74M/year)
- Monthly opex: $208K
- Monthly profit: $20K
- Total invested: ~$3.7M
- Payback of total investment: Month 38-40
- Maximum cash hole: $2.45M at Month 18

## REVISED Break-Even (Post-CMO Funnel Correction)

CMO's revised numbers: Y1 90K users / $50M AUM / $200K revenue (0.4% money market fee)

**Phase 1 money market at 0.4% fee changes everything. Month 18-20 break-even is DEAD.**

**Revised Timeline:**

| Phase | Period | Spend | Revenue | Net | Cumulative |
|-------|--------|-------|---------|-----|------------|
| Phase 1: Trust-building | Month 1-12 | $1.8M | $200K | -$1.6M | -$1.6M |
| Phase 2: Revenue ramp | Month 13-24 | $1.5M | $700K | -$800K | -$2.4M |
| Phase 3: Break-even | Month 25-36 | $2.0M | $4.0M | +$1.5M (Y3 net) | -$900K |
| Payback | Month 42-44 | — | — | — | $0 |

**Key assumptions for Phase 3 break-even:**
- Product evolution to balanced funds (0.8-1.2% fee) required
- $500M AUM threshold with 0.8% blended fee = $4M/year revenue
- Opex at scale: $2.5M/year

**REFRAME: This is $4M strategic capex, not an ROI play.**

Context:
- Grab paid $425M for Stash
- TCBS earns ~$100M+ annually from retail brokerage
- We're paying $4M to enter with 30M users in-hand
- Max loss at Month-6 kill gate: $800K

## Bear Case — Month 30-36 Break-Even

**What changes (each independently pushes break-even out):**

| Assumption | Base Case | Bear Case |
|------------|-----------|-----------|
| Conversion rate | 2.5% of MoMo base | 1.5% |
| Funded users at Month 18 | 250K | 150K |
| AUM per user | $1,200 | $800 |
| Tui+ uptake | 15% | 10% |
| Annual churn | 15% | 25% |
| Blended fee | 0.8% | 0.6% |

**Bear case numbers:**
- Month 18: 150K users x $800 AUM = $120M AUM
- Revenue: $120M x 0.6% + $108K = $828K/year = $69K/month
- Opex (trimmed): $150K/month ($1.8M/year)
- Gap: $81K/month -> need $280M AUM to close
- $280M at $800/user = 350K users -> reached Month 30-36
- Maximum cash hole: $4.2M
- Total investment to break-even: $5.0M

## Total Downside Envelope

- $4M capex + $783K/year TTT cannibalization = ~$4.4M over 3 years (not additive — cannibalization partially included in revenue model)
- Bear case: $6.3M if cannibalization high AND external capture fails
- Still <1.5% of annual company revenue ($52M+ confirmed floor). Survivable.
