# Knowledge: CLO (FI Solutions)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-04

## SQL Gotchas

### STATUS_CODE and Date Columns (2026-03-02)
- **Disbursement:** `STATUS_CODE IN ('CONTRACT_SIGNED', 'DISBURSED')` with `DATE_MODIFIED`
- **Revenue:** Use `DATE_REQUESTED` (not DATE_MODIFIED), no STATUS filter
- Mimir persistently uses DATE_MODIFIED for CLO — confirmed wrong. DATE_MODIFIED shows 0 for Jan-May 2024.
- Always filter `SERVICE_TYPE = 'CLO'` for CLO data

## Business Insights

### Home Credit Dominant + SHB New Partner (2026-03-03)
Jan 2026 lender share:
| Lender | Share | Avg Loan |
|--------|-------|----------|
| lending_mp_homecredit | 62% contracts, 72% revenue | 26.6M |
| clo_fecredit | 18% | 32.3M |
| clo_shb | 14% | 17.1M |
| clo_mcredit | 5% | 20.1M |
| clo_f88 | 0.3% | 16.0M |

HC concentration risk: 72% of revenue. But diversification improving: 100%→62% in 1 year.

### SHB Joined Nov 2025 (2026-03-04)
First contract: 2025-11-26. SHB = state commercial bank.
Ramp: Nov 2 → Dec 598 → Jan 687 → **Feb 3,830 (+457%)**

### SHB 6.5% Approval Rate — Conservative (2026-03-04)
60K+ applications → 3,830 disbursed = 6.5%. Rejects 93.5%. Not a credit quality risk.
SHB take rate 4.09% > HC's 3.80% → MoMo earns more from SHB.
Revenue trajectory: Jan ~4.83B → Feb ~6.1B (+26% MoM).

### SHB March 2026: CREDIT POLICY TIGHTENING (2026-03-06)
Mar 1-5: 0 contracts. NOT batch processing. FIS_TCST shows 1,202 OFFER_REJECTED on Mar 3.
Applications ARE coming in but rejected at credit scoring stage (before APPLICATION_SUBMITTED).
This = credit policy reset, not system failure. SHB tightened underwriting post-Tet.
Escalation needed to CLO/SHB partnership team. No BQ NPL data available to diagnose root cause.

### Correct CLO table: FIS_TCST (not FIS_CLO) (2026-03-06)
FIS_CLO max date = Jan 2025 (archived). Current data is in FIS_TCST.
Key columns: PARTNER_ID, STATUS_CODE, DATE_REQUESTED, CONTRACT_AMOUNT, REVENUE, SERVICE_TYPE.
Filter: SERVICE_TYPE='CLO', STATUS_CODE IN ('CONTRACT_SIGNED','DISBURSED').
Disbursement amount = CONTRACT_AMOUNT (not DISBURSED_CREDIT_AMOUNT).

## Mimir Trust
- DATE_MODIFIED usage: LOW (persistently wrong)
- General: MEDIUM
