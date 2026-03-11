# Knowledge: P2P Revenue
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-04

## SQL Gotchas

### W2W Personal Transfers Are FREE — Revenue = W2B + CASHOUT (2026-03-03)
`HOANG_P2P_ALL_CASHOUT_W2W_BY_TID` contains 3 service types. W2W = 0 fee.

| Service | Description | Jan 2026 Fee Revenue |
|---------|-------------|----------------------|
| W2B | Merchant payment → charged fee | 45.03B VND |
| CASHOUT | User withdraws to bank → fee | 4.41B VND |
| W2W | Personal transfer (free) | ~0 VND |
| **TOTAL** | | **49.44B VND** |

**Mimir bug:** Filters `service='W2W'` when asked about "P2P W2W revenue" → gets 81 VND (essentially 0). Wrong by ~600M×.

Correct SQL:
```sql
SELECT month, SUM(fee) AS total_fee_revenue
FROM `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
WHERE month IN ('2026-01-01', '2026-02-01')
GROUP BY 1
```

### W2B Fees: Weekend = 40-60% Lower (2026-03-04)
Sunday: 0.51B | Weekday avg: 1.0-1.5B/day. Always use Mon-Fri average for monthly extrapolation.

### VietQR MDR: Weekend Data Unreliable (2026-03-04)
Weekend MDR ~30% of weekday rate. Only use Mon-Fri data for MDR trend analysis.

## Business Insights

### VietQR Fee Increase: Mid-January 2026 (CONFIRMED) (2026-03-03)
MoMo raised VietQR scan fees around Jan 15-16, 2026. Before: ~40 VND/txn. After: 70-128 VND/txn.
Annual revenue impact: +40.8B VND/year. SILENT pricing change — discovered via data analysis.

### VietQR Fee Model: % of GMV (NOT flat per-txn) (2026-03-03)
Fee ≈ 0.024-0.033% of transaction GMV (MDR-style).
Correct metric: `SUM(fee) / SUM(amount)`. NOT `AVG(fee)`.
Rate: Jul 2025 0.024% → Feb 2026 0.033% (+35% in 7 months). Deliberate gradual increase.

### Strategic Two-Sided Pricing (2026-03-04)
| Channel | Jul MDR | Feb MDR | Trend |
|---------|---------|---------|-------|
| VietQR scan | 0.024% | 0.033% | +35% rising |
| Direct P2B | 0.282% | 0.208% | -26% declining |

MoMo lowers direct P2B (retain merchants), raises VietQR (monetize QR-adopters). Classic platform pricing.

### VietQR Cross-Sell: Largest Untapped FS Funnel (2026-03-03)
3.61M unique VietQR users (Jan 2026). 44% (1.59M) use VietQR but NO FS products.
VietQR fee ~55 VND/txn. Revenue model = volume strategy → FS cross-sell monetization.

### P2P CASHOUT Revenue Table (2026-03-04)
`HOANG_P2P_ALL_REVENUE_W2B_CASHOUT_TRANSACTION` has `fee` and `cost` columns.
P2P W2B net margin: 38.6/42.8 = 90.2% (after network fees).

### VietQR Cross-Sell Gap: 377K Active Users, Zero FS Campaigns (2026-03-09)
Mar 1-8: 2.19M VietQR users. 54% have FS products, 46% (1.01M) = pure QR.
Of pure-QR users: 37% (377K) are regular/active/power users (4+ txns in 8 days).
30.6M VietQR campaign notifications in Jan — ALL promote QR usage (vouchers).
ZERO campaigns cross-sell FS products to VietQR users. Biggest untapped campaign opportunity.

### VietQR Pure-QR User Profile (2026-03-09)
| Segment | Users | Avg GMV (8d) |
|---------|-------|-------------|
| One-time (1 txn) | 342K (34%) | 326K |
| Light (2-3) | 289K (29%) | 577K |
| Regular (4-8) | 248K (25%) | 1.0M |
| Active (9-20) | 114K (11%) | 1.8M |
| Power (21+) | 16K (1.5%) | 4.2M |

Pure-QR avg ticket 246K vs FS-users 324K (-24%). They spend less per txn but are still engaged.

## Mimir Trust
- W2W revenue bug: FIXED as of 2026-03-06 — Mimir now correctly filters `service IN ('W2B','CASHOUT')`. Previous bug (filters W2W only → 81 VND) no longer occurs.
- Jan 2026: MATCH (49,440,277,536 VND = exact BQ)
- Mar 2026 partial: MATCH (4,356,936,553 VND = exact BQ)
- VietQR fee: HIGH
- Overall: HIGH (W2W bug confirmed fixed)
