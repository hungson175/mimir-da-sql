# SQL Corrections — Batch 3: MEDIUM Queries (Jan 2026)

## Q10: Vay Nhanh by Lender — MATCH
- Ours and Mimir identical results: VIET_CREDIT 2.15T, MCREDIT 605B, AMBER 304B, MBV 52B
- Mimir SQL: No STATUS filter, uses DISBURSED_DATE. Confirms Batch 2 lesson.
- **Nothing new to learn.**

## Q11: InsurTech by Product — MATCH
- Exact same numbers across all 8 products.
- Mimir used `COUNT(ID)` instead of `COUNT(*)`. Functionally equivalent.
- Mimir used `CC_STATUS = 'SUCCESS'` (English). Consistent with Q6 (Jan). The Vietnamese bug seems Feb-specific or random.
- **Nothing new to learn.**

## Q12: CLO by Partner — MATCH + BONUS LESSON

Same numbers. But Mimir added a **CASE WHEN** to translate PARTNER_ID codes to human-readable names:
```sql
CASE
    WHEN t2.PARTNER_ID = 'lending_mp_homecredit' THEN 'Home Credit'
    WHEN t2.PARTNER_ID = 'clo_fecredit' THEN 'FE CREDIT'
    WHEN t2.PARTNER_ID = 'cro_vib' THEN 'VIB'
    WHEN t2.PARTNER_ID = 'clo_mcredit' THEN 'MCREDIT'
    ELSE t2.PARTNER_ID
END AS Partner
```

**Learning:** Mimir knows the PARTNER_ID → display name mapping for CLO partners. This is useful for reports. Also note: `clo_shb` and `clo_f88` weren't in the CASE WHEN (fell through to ELSE), meaning they're newer partners not in Mimir's training data.

**Partner mapping (verified Jan 2026):**
| PARTNER_ID | Display Name | Jan 2026 Disbursement |
|------------|-------------|----------------------|
| lending_mp_homecredit | Home Credit | 79.5B |
| clo_fecredit | FE CREDIT | 28.1B |
| clo_shb | SHB (not in Mimir mapping) | 11.8B |
| clo_mcredit | MCREDIT | 5.0B |
| clo_f88 | F88 (not in Mimir mapping) | 272M |

## Q13: Paylater by Usecase — MATCH + BONUS DATA

Exact same top 15. Mimir returned the full 21 usecases (we limited to 15).

**Full usecase list (from Mimir, Jan 2026):**
1. AIRTIME: 294,198
2. UTILITIES: 275,973
3. LOGISTICS: 168,747
4. MARKETPLACE: 164,488
5. APPLICATION STORE: 154,261
6. RETAIL: 87,508
7. DATA: 84,846
8. SME OFFLINE: 82,480
9. CINEMA: 26,201
10. DIGITAL CONTENT: 22,281
11. GAME: 21,574
12. OTT: 16,362
13. FNB: 15,652
14. OTA: 13,564
15. PUBLIC SERVICE: 9,915
16. ADS PAYMENT: 5,287
17. MEDIUM SIZE POS MC: 5,055
18. INSURANCE: 4,914
19. MONEY MARKET FUNDS: 193
20. null: 83
21. P2P - EWALLET TO BANK: 1

**Learning:** There are 21 usecases total. Tail is very long — bottom 6 have <6K users each.

---

## Summary
All 4 MEDIUM queries matched. No new SQL corrections needed. Picked up:
1. CLO partner display name mapping
2. Full Paylater usecase list (21 categories)
