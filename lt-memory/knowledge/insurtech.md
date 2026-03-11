# Knowledge: InsurTech
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-06

## SQL Gotchas

### `sp` Column Values: COMPLETE ENUM (BQ-verified Jan 2026) (2026-03-06)
All distinct SP values confirmed via BQ `att_fi_ins_nl_ver2` Jan 2026:
| SP | Jan 2026 Txns | Users | GMV |
|----|---------------|-------|-----|
| Vehicle Ins | 48,484 | 44,756 | 5.98B |
| PA Bus | 34,601 | 24,169 | 1.04B |
| Travel Ins | 30,303 | 23,748 | 2.18B |
| Cyber Ins | 10,160 | 10,066 | 94M |
| Property Ins | 3,353 | 2,985 | 10.1B |
| Health Ins | 323 | 297 | 44M |
| Claim | 127 | 120 | 138M |
| Payment Gateway | 1 | 1 | 66K |

**PA Bus = 2nd largest by transactions (34,601) — NOT in domain description! Domain documentation gap.**
Use EXACT strings above. Wrong values return 0 rows.

### InsurTech Mimir Domain: Times Out on Complex Queries (2026-03-06)
Domain `800bf3e8` times out on SP enum/analytical questions. Simple MAU/revenue queries work fine.

### Date Column is `trans_date`, Revenue is `final_rev` (2026-02-25)
In `att_fi_ins_nl_ver2`: date = `trans_date` (NOT `CC_DATE`), user = `debitor`, revenue = `final_rev` (NOT `REVENUE`).
Also available: `rev_after_sharing`, `amount`.

### CC_STATUS Inconsistency (2026-03-03)
Actual value = English `'SUCCESS'` (not Vietnamese 'Thành Công'). Mimir is inconsistent.
- **Order COUNT:** Must filter `CC_STATUS='SUCCESS'`
- **Revenue SUM:** CC_STATUS filter nearly redundant — non-SUCCESS orders have ~0 revenue

### MAU: USER_PAYMENT ≈ DEBITOR (2026-03-03)
In `att_fi_ins_nl_ver2`, difference < 1% on MAU counts. Both valid.
CC_STATUS filter also barely affects MAU (< 1% difference).

### MAU = UNION of Distribution + Collection (2026-03-03)
```sql
SELECT COUNT(DISTINCT user_id) AS mau FROM (
  SELECT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
  UNION ALL
  SELECT CAST(USER_PAYMENT AS STRING) AS user_id
  FROM `momovn-prod.BU_FI.INS_COL_ALL_TRANS`
  WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
)
```
Baselines: Dec 2025 ~128K, Jan 2026 ~141K, Feb 2026 ~148K. Growing trend.

### Contract Count: Mimir = New Only, BQ = New + Renewals (2026-03-04)
Mimir misses SP_DETAIL='Renewal Voluntary Car' etc. For total orders always use BQ.

## Business Insights

### September = Annual Seasonal Trough (2026-03-03)
Aug→Sep: -21% (2024), -16% (2025). Both new AND returning users drop equally → systemic.
Post-trough: Oct-Nov flat, Dec = year-end motor renewal breakout.

### Collection Drives Seasonal Spikes, Distribution Drives Growth (2026-03-03)
- Distribution (buy policies): Steady growth ~54-57K/month
- Collection (pay premiums): Spike/crash seasonally
- Oct 2025 = insurance renewal → Collection spike → total 133K
- Nov 2025 wave ended → Collection dropped 50% → total 94K

### Travel vs Vehicle: Very Different Seasonality (2026-03-03)
**Travel:** Steady +47% compound growth. Oct bump = holidays. Year-round marketing.
**Vehicle:** Plateau Jul-Nov, then EXPLOSIVE Dec-Feb (motorcycle renewal). Revenue 2.3× more valuable per order.
**PA Bus:** Mandatory passenger accident. Single partner PVI. 15K avg, not strategic.

### Car Insurance: DOUBLE Seasonal Peak (2026-03-04)
Motorcycle: November-December. **Car: February = renewal season** (Tet purchases renew in Feb).
Liberty car orders: Nov 145 → Dec 259 → Jan 275 → Feb 666 (+142%).

### PA Bus: Post-Tet Return = Real Peak (2026-03-04)
Spike occurs AFTER Tet, not before. Feb 18-25: peak 2,200-2,541/day (2× normal).

### Cyber Insurance Basic = 0 Revenue (2026-03-03)
`FINAL_REV` = 0 for basic Cyber Ins. Only Cyber Plus earns MoMo revenue (1,636-3,424 VND/order).
Basic = wallet protection feature (acquisition tool), not revenue product.

### MoMo Take Rates by Partner (Jan 2026) (2026-03-03)
| Partner | Product | Take Rate |
|---------|---------|-----------|
| Cathay NonLife | Vehicle | 64% |
| GIC | Vehicle | 59% |
| Bảo Long | Vehicle | 52% |
| PVI | PA Bus | 50% |
| PVI | Vehicle | 45% |
| Bảo Việt | Travel Easy | 35% |
| Liberty | Intl Travel | 30% |
| Cathay NonLife | Cyber basic | ~0% |

### PVI = 40.6% Revenue Dependency (2026-03-04)
PVI covers 4 product lines: Vehicle + PA Bus + Health + Property. If PVI exits = -40.6% revenue + 4 products collapse.
Vehicle diversified (8 partners). PA Bus, Health, Property, Cyber = single-partner risk.

### Travel Insurance: Domestic 99%, International 1% (2026-03-03)
International = 8x premium, 7x MoMo revenue per order. Convert 1%→5% = massive revenue lift.

### Vehicle Campaigns: ADDITIVE Not Cannibalistic (2026-03-04)
Organic AND promo grew simultaneously (+191% and +287%). Campaigns grow total pie.
True annual retention: 30.2%. 70% gap = cohort targeting opportunity each November.

### Only Vehicle Has Active Campaigns (2026-03-04)
All other InsurTech products (Travel 30K+, PA Bus 34K) = 100% ORGANIC. Massively underinvested.

### Liberty Voluntary Car Breakout: TYPEID='dd' Campaign (2026-03-04)
Stagnant 2 years → May 2025 campaign launched → 3-month ramp to new baseline. Replicate for PJICO.

### PJICO = Only New 2026 Partner (2026-03-04)
First order Jan 29, 2026 — 15 orders, 1.21M VND/order (high-value). All other partners 2018-2022 vintage.

### Property Insurance: Secular Decline (2026-03-04)
Jan 2024: 13K → Jan 2025: 6.4K (-51%) → Jan 2026: 3.4K (-47%). Approaching extinction.

### Seasonal Marketing Calendar (2026-03-04)
| Product | Push timing | Peak pattern |
|---------|-------------|-------------|
| Vehicle | Nov 20-Dec | Annual motorcycle renewal |
| Car | February | Post-Tet car renewal |
| PA Bus | Dec + Post-Tet (Feb 18-25) | Tet migration + return |
| Travel | Year-round, bump October | Q4 holidays |
| Health | Skip — declining | -48% in 6 months |
| **September** | **PAUSE ALL** | Structural annual trough |

### Vehicle Peaked Feb, Travel Accelerating Mar (2026-03-09)
Daily orders Mar 1-8: Vehicle 2,056→1,261 (-39%), Travel 1,024→1,113 (+9%).
Vehicle = seasonal (Nov-Feb motorcycle renewal over). Travel = year-round, entering spring peak.
Orders nearly equal (1.1x gap). Travel likely passes Vehicle on order count by Apr-May.
Revenue crossover unlikely — Vehicle 2.5x revenue/order (59K vs 27K VND).

### AMBER = Entry-Level VN Lender (2026-03-09)
Avg loan 14.2M (vs VIET_CREDIT 17.9M). Sweet spot 5-20M (86% of loans). No micro (<5M), no large (>30M).
Dec acquisition push: 46.6% first-time borrowers (12.4K new users). Mar +36% = Tet rebound, not structural.

## Mimir Trust
- MAU: HIGH (< 1% diff from BQ)
- CC_STATUS: HIGH (consistently uses English 'SUCCESS' as of 2026-03-06, previously inconsistent)
- Contract count: HIGH (exact match Feb 2026: 138,727)
- General: HIGH

## DA Review Knowledge (2026-03-11)
> From domain review xlsx — DA-written gotchas and rules.

- Bảo Hiểm Xe Máy Bắt Buộc: SP_DETAIL = 'Motor Ins'

