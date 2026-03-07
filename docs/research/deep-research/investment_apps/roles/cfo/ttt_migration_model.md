# TTT Migration Optimization Model

## The Core Tension

TTT earns 2% net spread ($0.020 per dollar). Partner fund distribution earns 0.20% ($0.002 per dollar).
Pure migration = 10x revenue destruction per dollar.
BUT: migration creates engaged users who may subscribe + cross-sell.

## Variables

- TTT AUM: $490M, 2.88M funded users, avg $170/user
- TTT net spread: 2% = $9.8M/year
- Distribution fee: 0.20%
- Subscription: $12/year ($1/mo)
- Cross-sell LTV uplift: $0-5/user/year (insurance, credit upsell to engaged wealth users)

## Model: Total Ecosystem Revenue at Different Migration Rates

Assumptions:
- Migrating users = more financially engaged
- 15% of migrated users subscribe (aggressive but required for model)
- $3-5/user/year incremental LTV from cross-sell (speculative)

### WITHOUT Subscription/LTV (Pure Migration Economics)

| Migration % | TTT Spread | Fund Dist | Total | vs Status Quo |
|------------|-----------|----------|-------|--------------|
| 0% (status quo) | $9.80M | $0 | $9.80M | -- |
| 10% ($49M) | $8.82M | $98K | $8.92M | **-$882K** |
| 20% ($98M) | $7.84M | $196K | $8.04M | **-$1.76M** |
| 30% ($147M) | $6.86M | $294K | $7.15M | **-$2.65M** |

Pure migration ALWAYS destroys value. No optimal rate exists — zero is best.

### WITH Subscription (15% uptake among migrated users)

| Migration % | Users Migrated | TTT | Fund Dist | Subscription | Total | vs SQ |
|------------|---------------|-----|----------|-------------|-------|-------|
| 0% | 0 | $9.80M | $0 | $0 | $9.80M | -- |
| 10% | ~288K | $8.82M | $98K | $518K | $9.44M | **-$364K** |
| 20% | ~576K | $7.84M | $196K | $1.04M | $9.07M | **-$728K** |
| 30% | ~864K | $6.86M | $294K | $1.56M | $8.71M | **-$1.09M** |

Still negative! 15% subscription doesn't compensate for spread loss.

### WITH Subscription + Cross-Sell LTV ($5/user/year)

| Migration % | TTT | Fund | Sub | LTV | Total | vs SQ |
|------------|-----|------|-----|-----|-------|-------|
| 0% | $9.80M | $0 | $0 | $0 | $9.80M | -- |
| 10% | $8.82M | $98K | $518K | $1.44M | $10.88M | **+$1.08M** |
| 20% | $7.84M | $196K | $1.04M | $2.88M | $11.96M | **+$2.16M** |
| 30% | $6.86M | $294K | $1.56M | $4.32M | $13.03M | **+$3.23M** |

Positive! But ONLY if $5/user LTV uplift is real.

### Breakeven Analysis Per Migrated User

- Spread lost per user: $170 x 1.8% = $3.06/year
- Distribution gained: $170 x 0.20% = $0.34/year
- Net gap to fill: $2.72/year per user

To break even, each migrated user needs to generate $2.72/year from subscription + LTV:
- At $12/year subscription: need 22.7% subscription rate (with zero LTV)
- At 15% sub rate + LTV: need $12 x 15% + LTV = $1.80 + LTV >= $2.72 -> LTV >= $0.92/user
- At 10% sub rate: need LTV >= $1.52/user

### Optimal Migration Rate

The model is LINEAR — more migration is better IF subscription + LTV assumptions hold.
If they DON'T hold, ZERO migration is optimal.

Therefore: **There is no "optimal middle ground." It's binary.**
- If sub+LTV > $2.72/user: let migration happen freely (higher = better)
- If sub+LTV < $2.72/user: prevent migration entirely

RECOMMENDATION: Start with TTT wall (zero migration). Measure subscription conversion and LTV on NET NEW fund users only. Once proven sub+LTV > $2.72/user, THEN allow controlled TTT graduation.
