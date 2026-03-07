# MoMo Board Session Notes — 2026-03-06 (Round 2)

## Biggest Discovery: Existing DCVFM Partnership (June 2022)

MoMo (M_Service) signed a distribution partnership with DCVFM in June 2022. MoMo is ALREADY a licensed distribution channel for DCVFM's open-ended fund certificates. This was described as "the first time open-ended fund certificate trading was made available on a Vietnamese super-app."

Source: The Investor, June 2022. Also confirmed through DCVFM public distribution partner list.

### Why It Didn't Scale (Board Diagnosis)
1. **Buried UX** — fund purchase added as checkbox feature among 50+ services. No dedicated entry point.
2. **Zero marketing** — one press release, no sustained campaign, no push notifications.
3. **Wrong language** — used "chung chi quy," "dau tu" jargon. Spoke fund manager's language, not user's.
4. **No incentive alignment** — standard trail commission but no active marketing = shelfware.

### Implication
- Conditions #1 (regulatory) and #2 (fund partner) may already be met
- Not a "build from scratch" project — it's "reactivate, rebrand, scale"
- 2022 agreement contains: legal entity structure, trail terms, SSC registration status
- President Thuan pulling the agreement from FS Legal by Tuesday EOD

---

## CV Securities License Analysis

### License Scope (No. 26/GPDC-UBCK, June 5, 2025)
Source PDF: https://cvs.vn/uploads/shareholders/CBTT/20250606_CBTT_GP_dieu_chinh_bo_sung_NVKD.pdf

Current scope:
1. Moi gioi chung khoan (Securities brokerage)
2. Tu doanh chung khoan (Proprietary trading) — added June 2025
3. Tu van dau tu chung khoan (Investment advisory)

Does NOT explicitly list: Phan phoi chung chi quy (fund certificate distribution)

### President Thuan's Legal Read
- Fund certificates (chung chi quy mo) ARE securities under Securities Law 2019, Article 4, Clause 1
- "Moi gioi chung khoan" by legal definition covers intermediation of ALL securities including fund certificates
- Circular 98/2020/TT-BTC requires distribution agent REGISTRATION (administrative, not licensing)
- Registration = 2-4 weeks per fund company + SSC notification
- VNSC/Finhay operates on same model: brokerage license + distribution agent registration
- 85%+ probability Scenario A (existing license covers it)
- Scenario C (6-9 month delay) effectively off the table

### Key Precedent: VNSC/Finhay
VNSC by Finhay distributes VCBF fund certificates on its platform with what appears to be a similar brokerage license structure. Need to confirm: pull VNSC's SSC filings to verify.

---

## Dragon Capital Intelligence

| Fact | Detail |
|------|--------|
| Full name | Dragon Capital Vietfund Management (DCVFM) |
| Total AUM | VND 140T (~$5.4B), 59% of Vietnam's public fund NAV |
| Chairman | Dominic Scriven (British, founded Dragon Capital 1994) |
| CEO | Le Anh Tuan (took over Oct 2025) |
| Ownership | 65% employee-owned at parent level |
| Listing | UPCoM Jan 2026, ticker: DCV |
| Strategy | Actively seeking digital distribution partners |

### DCVFM Fund Products (Phase Mapping)

| Product | Type | Phase | Trail Target |
|---------|------|-------|-------------|
| DCIP (DC Income Plus) | Short-term bonds, 24hr liquidity, est. 2021 | Phase 1 | 25 bps |
| DCBF (DC Bond Fund) | Fixed income, est. 2013 | Phase 1-2 | 35 bps |
| DCDE (DC Dividend Equity) | Dividend equity | Phase 2 | 55 bps |
| DCDS (DC Dynamic Stock) | Growth equity, flagship, VND 6.3T AUM, +32% YTD | Phase 3 | 70 bps |

**IMPORTANT:** DCDS is EQUITY, not money market. Initial misidentification corrected during session.

### DCVFM Distribution Partners (Confirmed)

| Partner | Type | Since | Min Investment |
|---------|------|-------|---------------|
| MoMo | Super-app | Jun 2022 | Not disclosed |
| CAKE by VPBank | Neo-bank | Apr 2022 | 10,000 VND |
| VPBankS NEO Invest | Bank securities | Oct 2024 | Not disclosed |
| VNSC by Finhay | Fintech | Aug 2023 | 100,000 VND |
| Infina | Fintech | Pre-2023 | 500,000 VND |
| Tikop | Fintech | Not disclosed | No fee |
| InvestingPro | Fintech | Nov 2025 | Not disclosed |
| DragonX | Own app | 2021 | Not disclosed |

### Vietnam Fund Market Context
- Only 423,000 retail open-ended fund holders in ALL of Vietnam (vs 100M population)
- Massive runway for growth
- Digital distribution is the stated growth strategy for DCVFM

---

## Financial Model — Key Numbers (Board-Approved)

### Unit Economics
- Cost per funded account: $14.70 fully loaded (CAC $6.50 + KYC $1.50 + tech $6.70)
- Drops to $8-9 after Month 12 as tech amortizes
- Minimum AUM/user for break-even: $1,200 (30.6M VND) at 0.8% blended fee

### The $2.72 Migration Threshold (Derivation)
- TTT AUM: 12.46T VND ($490M), MFU: 2.88M, Avg AUM/user: $170
- TTT net spread: 2.35% (gross 6% - 3.65% paid to users)
- Annual TTT revenue per user: $170 x 2.35% = $3.99
- Investment fee per migrated user: $170 x 0.75% = $1.28
- NET LOSS per migrating user: $3.99 - $1.28 = $2.72/year
- High-value (100M+ VND): $3,937 x 1.6% = $63/year

### Offset Ratio
- For every $1 leaving TTT, need $2.13 of NEW external money entering investment
- At 10% migration ($49M): need $104M new external AUM to offset
- 5% capture of 935K investor segment's $2B external flow = $100M (achievable)

### Cannibalization Scenario (10% TTT Migration)
- AUM migrated: $49M
- Revenue lost (TTT): $1.15M/year
- Revenue gained (investment): $367K/year
- Net annual loss: -$783K/year

### Wallet Expansion (Net Positive Scenario)
- User adds 50M investment + keeps 30M TTT (moves 20M from TTT)
- 50M invested / 20M moved = 2.5x ratio > 2.13x threshold
- Net: +$2.19/year per user — wallet GROWS

### TTT Protection Triggers
- Global fire alarm: -5% TTT spread = $575K/year = $47.9K/month = ~7% AUM migration
- Tiered early warning:
  - Tier 1 (<3M VND, 89% users, 4.3% AUM): free migration
  - Tier 2 (3M-50M, 3.2% users, 39% AUM): alert at 10%/30d
  - Tier 3 (50M+, 0.4% users, 36%+ AUM): red flag at 5%/30d, premium service
- Graduated throttle: remove default → friction → cap → CEO+CFO joint lift

### Break-Even Path
- Phase 1 (M1-12): -$1.66M (trust-building, loss leader)
- Phase 2 (M13-24): -$800K (revenue ramp)
- Phase 3 (M25-36): +$1.5M (balanced/equity products)
- Break-even: Month 30-36 (base), Month 42+ (bear)
- Payback: Month 42-44
- Max cash hole: $2.45M (base), $4.2M (bear)
- Total strategic capex: $4M over 3 years (<1.5% annual revenue)

---

## Brand & Positioning — "Sinh Loi"

### The Language Decision
- "Dau tu" (investment) — scares users, implies expertise needed
- "Tiet kiem" (savings) — misleads, implies guaranteed returns
- "Sinh loi" (earn returns) — emotionally neutral, aspirational, accurate
- Product name: "MoMo Sinh Loi" or "Vi Sinh Loi"
- Tagline: "Tien trong MoMo cua ban dang sinh loi moi ngay"

### UX Architecture
- TTT stays in sanctuary: same green, same "guaranteed," unchanged
- Sinh Loi: separate tab, blue palette, opt-in gated with financial literacy entry
- NEVER cross-contaminate: red portfolio numbers never appear near TTT balance
- Show cumulative returns (always positive after days), daily NAV in "details" tap

### Segment Targeting
1. PRIMARY: 935K external investors — zero TTT risk, pure new AUM
2. SECONDARY: 12M new-to-investing — zero TTT risk, education funnel
3. SUPPRESSED: 86,700 TTT whales (0.7% users, 60.8% AUM) — no targeting

---

## Conversion Funnel (CMO Bottom-Up, Board-Approved)

| Source | Try | Stick (90d) | Avg Balance | AUM |
|--------|-----|-------------|-------------|-----|
| External investors (935K) | 78K | 39K | $600 | $23M |
| TTT upgraders (400K >5M) | 48K | 29K | $800 | $23M |
| New-to-investing (12M) | 54K | 22K | $200 | $4.4M |
| **Y1 Total** | **180K** | **90K** | | **$50M** |

---

## Open Questions for Next Session

1. What legal entity distributes DCVFM in 2022 — M_Service or CVS?
2. Current trail commission terms with DCVFM?
3. Current AUM under MoMo-DCVFM distribution (is it active or truly dormant)?
4. VNSC/Finhay SSC filing structure — how did they solve distribution agent registration?
5. What trail does Finhay/VNSC get from DCVFM? (competitive benchmark)
6. DCIP yield data (not publicly disclosed — need from Dragon Capital directly)
