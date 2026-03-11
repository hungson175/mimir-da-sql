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

### SHB Mar 2026: CONFIRMED Credit Freeze (2026-03-09)
Data through Mar 8: 0 contracts, 1,202 OFFER_REJECTED (all Mar 3). No activity Mar 4-8.
8 days of zero = confirmed credit policy freeze, not batch processing.
CLO total Mar projected: ~3,038 (-58% vs Feb 7,167). SHB was 53% of Feb volume.
FE Credit +25% and F88 +205% but too small to offset SHB gap.
CLO = 3% of total FS credit volume — SHB freeze is partnership problem, not revenue crisis.

## Mimir Trust
- DATE_MODIFIED usage: LOW (persistently wrong)
- General: MEDIUM

## DA Review Knowledge (2026-03-11)
> From domain review xlsx — DA-written gotchas and rules.

- PARTNER_ID aliases: 'home' = 'lending_mp_homecredit', 'FE' = 'clo_fecredit', 'CRO'/'VIB' = 'cro_vib'
- Exclude user_id: use 'WHERE NOT EXISTS' (not 'user_id NOT IN')
- Application submitted status_codes: APPLICATION_CANCELED, APPLICATION_REJECTED, APPLICATION_APPROVED, APPLICATION_RESUBMIT, APPLICATION_SUBMITTED, DISBURSED, CONTRACT_SIGNED, RESET
- User segments: New (first txn), Retention (continuous), Reactive (returned after churn), Churn (stopped)
- FIS_CLO_TRAFFIC_FLOW: filter by VALUE column (not PARTNER_ID) for partner
- Avg CONTRACT_AMOUNT: use SUM(CONTRACT_AMOUNT)/COUNT(DISTINCT ticket_id) (not AVG)
- Home Credit disbursed: CONTRACT_SIGNED + DISBURSED. Other lenders: DISBURSED only.

### FI_TRANS Reference (from DA review)
BU_GROUP_CODE hierarchy:
- L1: 'PAYMENT' = all thu hộ
- L2: 'LOAN COLLECTION' (thu hộ khoản vay), 'CREDIT CARD COLLECTION' (thu hộ thẻ tín dụng), 'PAYOUT' (chi hộ)
- L3: 'FINCOS' (công ty tài chính), 'BANK' (ngân hàng), 'OTHERS' (giấy phép cầm đồ), 'FM' (Vay Nhanh)
- L4: 'DISBURSEMENT' (chi hộ), 'COLLECTION' (thu hộ). Deprecated: DISBURSEMENT_VAY+, DISBURSEMENT_BANK
- statusid: 2 = thành công, 6 = thất bại
- service_group: 1 = thu hộ, 10/'null' = chi hộ, 5 = thu phí
- type: 'App MoMo' = app MoMo, 'Paygate' = app đối tác qua MoMo
- Chi hộ filter: trans_type IN ('transfer','cardcashout_fi','disburse','billpay','m4bpay','cardcashout_disburse')
- Quick filter TTKV/TTTD: BU_GROUP_CODE_L2 IN ('LOAN COLLECTION','CREDIT CARD COLLECTION') AND STATUSID=2 AND SERVICE_GROUP=1
- Quick filter exclude VN+CCM: fis_dash IN ('loan','card')
- Merchant info: https://docs.google.com/spreadsheets/d/1QI6YIIRT4fttWW5IHCP6XISLmGa3MFEmxSVe1CMziq8/

### FIS_TCST Key Columns (from DA review)
- ticket_id, partner_id, status_code (T-1 snapshot), date_requested (submit time), date_modified (last update)
- core_id (revenue TID), contract_id, contract_amount (disbursed amount), revenue (CRO không dùng), offer_type (new/reloan)
- Note: user vào luồng + out WL không thuộc bảng này
- Note: status_code meanings can change between flow versions → contact ngoc.nguyen18

### FIS_CLO_CHANGE_STATUS (from DA review)
- Shows offer/app approved/rejected at exact moment (vs FIS_TCST = final status only)
- offer_rate = OFFER_APPROVED / (OFFER_APPROVED + OFFER_REJECTED)
- approval_rate = APPLICATION_APPROVED / (APPLICATION_APPROVED + APPLICATION_REJECTED)
- Future: will switch to APPROVED/SUBMITTED once data is in BQ
