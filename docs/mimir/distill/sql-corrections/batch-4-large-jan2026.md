# SQL Corrections — Batch 4: LARGE Queries (Jan 2026)

## Q14: TTT AUM — CLOSE (0.7% Individual, <0.1% MP)

| | Ours | Mimir |
|---|------|-------|
| Individual AUM | 9,883,454,772,582 (9.88T) | 9,953,775,948,932 (9.95T) |
| Money Pool AUM | 1,617,507,679,650 (1.62T) | 1,619,073,507,627 (1.62T) |
| Total AUM | ~11.50T | ~11.57T |
| Filter | `MFU_TYPE != '0.Churn'` | **None** |
| Date | `GRASS_DATE = '2026-01-31'` | `grass_date = '2026-01-31'` |

**Learning:** Mimir does NOT filter MFU_TYPE for AUM queries. This is correct — AUM measures total assets under management, including churned accounts that still hold balances. The 70B difference (0.7%) represents balance held by churned Individual accounts.

**Correct Mimir SQL:**
```sql
SELECT
    is_mp,
    SUM(balance) AS total_aum
FROM
    `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE
    grass_date = '2026-01-31'
GROUP BY
    is_mp
ORDER BY
    is_mp
```

**Rule: AUM = all accounts. MAU = active accounts only (filter MAU_TYPE/MFU_TYPE).**

## Q15: TTT MAU + Cashin/Cashout — MISMATCH on GMV columns

| Metric | Ours | Mimir | Match? |
|--------|------|-------|--------|
| Individual MAU | 2,998,000 | 2,998,000 | EXACT |
| Money Pool MAU | 462,873 | 462,873 | EXACT |
| Individual cashin | 7.72T | **15.43T** | MISMATCH (2x) |
| Individual cashout | 1.72T | **15.34T** | MISMATCH (9x) |
| Individual interest | 27.19B | 27.19B | EXACT |
| Money Pool cashin | 0 | 0 | EXACT |
| Money Pool cashout | 0 | **1.82T** | MISMATCH |
| Money Pool interest | 4.72B | 4.72B | EXACT |

**Root cause:** We used `cashin_gmv` and `cashout_gmv` as single columns. Mimir correctly sums ALL sub-channel GMV columns:

```sql
-- Mimir's cashin calculation (CORRECT):
SUM(
  COALESCE(cashin_gmv, 0)
  + COALESCE(cashin_p2p_gmv, 0)
  + COALESCE(cashin_va_gmv, 0)
  + COALESCE(cashin_ai_gmv, 0)
  + COALESCE(cashin_stock_gmv, 0)
  + COALESCE(cashin_payout_gmv, 0)
) AS total_cashin_gmv

-- Mimir's cashout calculation (CORRECT):
SUM(
  COALESCE(cashout_napas_gmv, 0)
  + COALESCE(cashout_payment_gmv, 0)
  + COALESCE(cashout_gmv, 0)
  + COALESCE(cashout_stock_gmv, 0)
  + COALESCE(cashout_p2p_gmv, 0)
  + COALESCE(cashout_mp_gmv, 0)
  + COALESCE(cashout_payment_mp_gmv, 0)
) AS total_cashout_gmv
```

**Learning:** `cashin_gmv` is NOT total cashin. The table splits cashin into sub-channels (p2p, va, ai, stock, payout). Same for cashout (napas, payment, stock, p2p, mp). **Always sum ALL sub-channel columns with COALESCE for totals.**

**Also learned:** Mimir adds Money Pool-specific columns (`cashin_mp_gmv`, `cashout_mp_gmv`, `cashout_payment_mp_gmv`) into the cashout sum. These were separate from the main cashout columns.

---

## Summary
- Q14 AUM: CLOSE — learned AUM = no churn filter (include all accounts)
- Q15 MAU/GMV: MATCH on MAU+interest, MISMATCH on cashin/cashout — learned sub-channel summing pattern
- **2 new SQL lessons** to add to sql-gotchas.md
