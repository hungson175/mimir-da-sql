# CMO Analysis Notes: MoMo Wealth War Plan

**Date:** 2026-03-06 | **Status:** Complete

---

## 1. Market Sizing Assessment (TAM $2.73B, SAM $410M, SOM $15-45M)

### TAM $2.73B — INFLATED, but directionally fine
- Source: GlobeNewswire "Vietnam embedded finance 2029" at 45.1% CAGR
- Problem: "Embedded finance" includes payments, lending, insurance — NOT just wealth/investment
- Vietnam digital investment AUM is only $249M (2024) per external research
- Open-end mutual fund market: ~$2B AUM, ~400K investors
- **My estimate:** Realistic Vietnam digital wealth TAM is $500M-$1B by 2029, not $2.73B
- The $2.73B number would need to include ALL embedded finance to hold up

### SAM $410M (15% of TAM) — Methodology is weak
- 15% "wealth/investment segment" of embedded finance is a finger-in-the-air number
- If TAM is really $500M-$1B, SAM is more like $75-150M
- Still a meaningful market, but less impressive slide-ware

### SOM $15-45M (Year 1-3) — Actually reasonable
- 500K funded users x $5 ARPU = $2.5M (Y1) — conservative, achievable
- 1.5M x $10 = $15M (Y2) — aggressive but possible if product-market fit works
- 3M x $15 = $45M (Y3) — very ambitious, requires everything to go right
- **Verdict:** SOM is the most grounded part. TAM/SAM are inflated for deck purposes.

---

## 2. Four-Segment Model Assessment

### What's right:
- Data-driven: segments come from actual BigQuery data, not personas
- Segment 3 (Serious Savers, 87K) is the revenue anchor — 60.8% of AUM
- Segment 2 (935K self-ID'd investors) is the highest-intent signal

### What's missing or wrong:

**Missing Segment: The Money Pool Crowd**
- Money Pool MAU grew 123% (208K -> 463K), AUM tripled (0.53T -> 1.75T)
- These are SOCIAL savers — they save in groups
- This is a completely different behavioral pattern (social proof, peer accountability)
- Product fit: social investing, group investment challenges
- The war plan ignores Money Pool entirely as a segment

**Segment 1 concern: 9.9M micro-savers ($12 balance) is not a real segment**
- 85.8% hold < 300K VND, contributing 0.9% of AUM
- At $2-3 ARPU, these users cost more to serve than they generate
- Many are likely dormant or accidental TTT users
- Should be treated as a "future funnel" not a current segment
- **Risk: building product for 9.9M who can't invest is a distraction**

**Segment overlap unclear:**
- Can a user be in multiple segments? The 1.2M TTT+QLCT overlap probably spans Segments 1-4
- Needs cleaner exclusivity rules for targeting

---

## 3. 90-Day GTM Playbook Assessment

### What's executable:
- Days 1-30 (Build): Realistic if fund partners are pre-aligned. Dragon Capital relationship exists.
- Using existing eKYC = massive speed advantage
- In-app channels (40% budget) is smart — $0 CPL for existing users
- Kill criteria are well-defined (activation <20%, NPS <20, etc.)

### What's missing or unrealistic:

**Beta target of 10K funded in 30 days is aggressive**
- From a beta cohort of Segment 4 (1.2M eligible), 10K = 0.8% conversion
- Achievable IF the in-app UX is seamless and yield is compelling at launch
- But fund partner integration in 30 days is the real bottleneck

**Content production timeline is too tight**
- "5 educational articles + 3 explainer videos" in 30 days alongside product build
- Vietnamese financial literacy content needs cultural sensitivity review
- Recommend: start content production NOW, pre-launch

**$200-400K marketing budget for Phase 1**
- For 100K funded users at CPL < VND 30K ($1.20) = budget allows 333K leads at $1.20
- But 100K FUNDED (not just downloaded/registered) requires much higher conversion funnel
- If activation is 50% and funding rate is 30%, need 667K registrations
- Budget may be too thin for the 100K funded target

**Missing: regulatory timeline**
- "Verify SSC distribution agent certificate" in Week 3 sounds simple
- But compliance review with fund partners could take 4-8 weeks alone
- This is the #1 timeline risk

---

## 4. Competitive Positioning vs Grab+Stash

### 18-month window: REALISTIC but not guaranteed
- Grab closes 50.1% in Q3 2026 — then integration begins
- Stash is US-focused, SEA deployment needs: localization, licensing per country, fund partners
- Vietnam has separate SSC licensing requirements — Grab can't just "turn on" Stash
- **Realistic Grab-in-Vietnam timeline: H2 2027 at earliest**

### Can we win?
- YES if we define "win" as "500K+ funded users before Grab arrives"
- NO if we try to match Stash's tech sophistication (AI Coach, Stock-Back)
- Our moat is distribution (30M users) + payment rails (375M txn/mo) + local trust
- Grab's moat will be tech + global brand + Stash's proven playbook

### The real competitor isn't Grab — it's Finhay
- Finhay has 2.7M registered, ~300K funded, min VND 50K
- They're already in-market with mutual funds
- If Finhay accelerates (they raised from Insignia), they capture the early adopter window
- War plan underestimates Finhay threat (rated "LOW" — should be MEDIUM)

---

## 5. ARPU Targets ($5-15)

### Benchmarks:
- Yu'e Bao (China): $1-2 ARPU — massive base, distribution fee only
- KakaoPay (Korea): $25-40 — but Korea GDP per capita is 6x Vietnam
- Acorns (US): $53-70 — subscription model, US market
- Finhay (Vietnam): not disclosed but likely $1-3 given avg balances

### Vietnam reality check:
- Vietnam GDP per capita: ~$4,300 (2025)
- Average TTT balance per funded user: $170 (4.33M VND)
- At 0.20% distribution fee on $170 = $0.34/year per user
- To hit $5 ARPU, need EITHER much higher balances OR subscription revenue
- $5 Y1 is achievable with subscription + distribution hybrid
- $15 Y3 requires significant balance growth or premium tier adoption
- **The plan's ARPU assumes balance growth that may not materialize**

### The math problem:
- 86% of TTT users hold <$12
- Even if they "invest," average investment will be tiny
- Distribution fee on $12 at 0.20% = $0.024/year
- Need 200x more balance per user to make distribution fees work
- **Subscription model is MANDATORY for mass-market segment to work financially**

---

## 6. Can Micro-Savers Become Investors?

### The honest answer: SOME can, MOST won't (in Year 1)

**Arguments FOR conversion:**
- 61% under 28 = early career, income will grow
- Vietnamese savings culture is strong (gold, cash, informal savings)
- Round-ups on 375M txn/mo could automate small investments painlessly
- Education via Moni can shift mindset over time

**Arguments AGAINST:**
- $12 balance signals these users barely use TTT as savings
- Many are likely "opened TTT for a promo, forgot about it"
- Vietnam's investment literacy is very low (~5% invest)
- Cultural preference for tangible assets (gold, real estate, not funds)
- Fund minimums (even at VND 10K/$0.40) may not motivate behavior change

**My verdict:**
- Don't TARGET micro-savers as primary segment
- Let round-ups PASSIVELY convert them over 12-24 months
- Focus GTM firepower on Segment 2 (935K self-ID'd investors) and Segment 4 (1.2M power users)
- The 9.9M micro-savers are a LONG-TERM funnel, not a launch segment

---

## 7. WEAKEST ASSUMPTION (CEO asked for this)

**The weakest assumption: "17% conversion from TTT MAU" for Year 1 (500K funded)**

Why this is fragile:
- 500K funded out of 3.45M TTT MAU = 14.5% conversion (war plan says 17%)
- TTT "MAU" includes users who opened the app, not necessarily active savers
- Actual funded users (MFU) earning interest: 2.88M — but 86% hold <$12
- Users who hold meaningful balances (>300K VND): only 801K
- Asking someone with $12 in savings to "invest" is a fundamentally different ask
- **Realistic Y1 target: 200-300K funded (from Segments 2+4), not 500K**

**Second weakest: yield competitiveness assumption**
- War plan assumes partner funds deliver 5-7% vs TTT's 4%
- But TTT rate may have changed since Jul 2025 (data caveat in internal_data.md)
- If bank deposits pay 5-6% and partner funds pay 5-7%, the yield delta is marginal
- GrabInvest died because yields weren't compelling enough
- If yields compress (like Yu'e Bao: 7% -> 1.27%), the entire value prop collapses

---

## 8. WHERE I'M MOST WORRIED

1. **Brand risk from investment losses** — TTT is capital-preserved savings. The moment a user sees their investment balance go DOWN, trust erosion begins. MoMo's brand is "safe money." Investment is inherently "risky money." This transition is harder than the plan acknowledges.

2. **Finhay is already there** — 300K funded users in mutual funds. They have product-market fit. We have distribution. But distribution without PMF is just spam.

3. **The plan conflates "savings upgrade" with "investment product"** — These are psychologically different products. A user who saves $12/month is not ready to "invest." The language, UX, and mental model are completely different.

---

## OVERALL VERDICT

The war plan is **strategically sound but operationally optimistic**. The core thesis (MoMo has distribution advantage + Grab is coming) is correct. But:

- TAM is inflated ~3x
- Y1 funded user target should be 200-300K, not 500K
- Micro-savers segment needs reframing as long-term funnel
- Money Pool is a missed segment opportunity
- 90-day timeline assumes zero regulatory/partner friction
- ARPU math only works with subscription model

**My recommendation:** Option B (Strike Fast) is correct, but with de-risked targets and Segment 2+4 focus, not mass-market. Launch as "TTT Savings+" (safe, familiar naming), not "MoMo Invest" (scary, unfamiliar).

---

## 9. CFO DEBATE: Revenue Model & Cannibalization (Round 2)

### Distribution fees are dead on arrival as primary revenue
- CFO confirmed: 500K users x $170 avg x 0.20% = $170K, not $2.5M
- War plan's Y1 $2.5M implied ARPU of $5 — impossible from distribution alone
- **Subscription is the ONLY path to meaningful revenue**

### Subscription pricing for Vietnam
- Free tier (Phase 1): Round-ups + 1 fund + basic goals. User acquisition layer.
- Pro tier (Phase 2): VND 19K/mo (~$0.75). Below VND 20K psychological barrier.
- Why VND 19K: price of 1 banh mi. Vietnamese digital subs (YouTube 79K, Spotify 59K) are normalized for 22-35 demo.
- Uptake: 5-8% initially → 12-15% by Y3
- Revenue: 8% of 1.5M x VND 19K x 12 = ~$1.34M Y2. 12% of 3M = ~$3.2M Y3.
- **Key unlock: Bundle into Tui+ (1.1M existing users understand premium MoMo)**

### TTT cannibalization mitigation
- Every dollar TTT→funds loses MoMo $0.018 net annually
- Messaging: "Grow Beyond Your Savings" — TTT = emergency fund, Funds = growth money
- Product guardrails: min TTT balance recommendation, round-ups from payments (not TTT transfers), separate UI jars, default funding from wallet not TTT
- Net positive IF we capture external investment flows (935K users sending 4.3T VND/mo to TCBS/SSI)

### Opportunity cost vs Paylater/InsurTech — WRONG FRAME
- Paylater = lending (linear, capped by credit risk). Wealth = asset business (compounds, sticky).
- User with pay+save+invest has 3 reasons to stay. Paylater-only user can switch anytime.
- Competitive argument is existential: if Grab offers invest+ride+food+pay, our users leave EVERYTHING
- Phase 1 costs $500K-1M — rounding error vs Paylater budget. Not an either/or.
