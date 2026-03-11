# Knowledge: Vay Nhanh (VN)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-06

## ENTRY_POINT Semantics (2026-03-06)

`BAOTU_VAYNHANH_ENTRY_POINT` = **traffic vào màn hình Vay Nhanh**, không phải toàn bộ service.

- `WHITELIST_CHECK` phân loại user đó có trong whitelist hay không tại thời điểm truy cập
- **KHÔNG dùng** "whitelist users" như một metric độc lập — đây là traffic split, không phải pool user
- Metrics đúng:
  - **Traffic In Whitelist** = `COUNT(DISTINCT AGENT_ID) WHERE WHITELIST_CHECK = '1 IN WHITELIST'`
  - **Traffic Not In Whitelist** = `COUNT(DISTINCT AGENT_ID) WHERE WHITELIST_CHECK = '2 NOT IN WHITELIST'`
- Granularity: daily = COUNT DISTINCT per ETL_DATE. Weekly/monthly = COUNT DISTINCT across full period (không SUM daily counts)
- Jan 2026 avg/day: ~97K in WL, ~64K not in WL

## SQL Gotchas

### DISBURSED_DATE vs CREATED_DATE, STATUS Matters! (2026-02-28)
- **"don vay" (loan applications)** → use `CREATED_DATE`, no STATUS filter
- **"giai ngan" (disbursements)** → use `DISBURSED_DATE`
- DISBURSED_DATE is populated for BOTH statuses:
  - `DISBURSED`: currently active loans
  - `LIQUIDATED`: fully repaid loans
- **Total disbursement volume** → NO STATUS filter
- **Outstanding portfolio** → `STATUS = 'DISBURSED'` only
- ARPU: Mimir uses STATUS='DISBURSED' (active borrowers). Without filter, count ~3x higher.
- User column: `AGENT_ID` (NOT BORROWER_ID — doesn't exist)

### VN Column Names (2026-02-28)
- User: `AGENT_ID` (NOT `BORROWER_ID`)
- Status values: `DISBURSED` (active), `LIQUIDATED` (repaid)

### DPD: Use Vintage Table, Not Loan Info (2026-03-03)
DPD data NOT in `BAOTU_VAYNHANH_LOAN_INFO`. Use `DASH_RISK_PORTFOLIO_FASTMONEY_VINTAGE_DPD_ALL`:
- `MONTH_DISBURSE` = disbursement cohort
- `MOB` = months on book
- `DPD30`, `DPD90`, `DPD180` = count per bucket
- `TOTAL_LOAN` = cohort total

Baselines (Feb 2026): Jul vintage MOB8 = 5.96% NPL, Oct vintage MOB5 = 1.46% NPL.
5-6% NPL at MOB8 = typical for VN fintech consumer lending.

### Mimir Undercounts Disbursements 3x (2026-03-03)
| Month | BQ (correct) | Mimir (wrong) | Ratio |
|-------|-------------|---------------|-------|
| Jan 2026 | 171,573 | 58,267 | 2.95x |
| Feb 2026 | 143,176 | 49,333 | 2.90x |

Root causes:
1. **Feb 29 bug**: Mimir generates `'2026-02-29'` (2026 not leap year)
2. **STATUS filter**: Mimir filters STATUS='DISBURSED' instead of counting all

## Business Insights

### Revenue Not in BQ (2026-03-04)
MoMo's origination/referral fee NOT in any accessible BQ table.
`SERVICE_FEE` in QH_VAYNHANH_DISBURSED_DETAIL = lender's fee to borrower, not MoMo's cut.
DO NOT estimate as 2% of disbursement — that = lender's interest, not MoMo's referral fee.

### Repeat Borrower Rate: 64% RELOAN (2026-03-04)
VIET_CREDIT Jan 2026: 64% = RELOAN, 25% = NEW. RELOAN gets 22.1M avg, NEW gets 12.9M avg.
MoMo = both acquisition (25%) AND retention engine (64%) for lenders.

### VN Approval Rate Formula (2026-03-09)
```
approval_rate = DISBURSED / (DISBURSED + PARTNER_REJECTED + PARTNER_CANCELED)
```
- Numerator: only `DISBURSED` (NOT LIQUIDATED — those are repaid loans, not current approvals)
- Denominator: `DISBURSED + PARTNER REJECTED + PARTNER CANCELED` only
- Exclude from denominator: LIQUIDATED, UNKNOWN, PROCESSING, CANCELLED, LOAN DECIDER REJECTED, KNOCKOUT RULE REJECTED, CONFIRMED, APPROVED
- MBV Feb 2026: 83.45%
- VietCredit Feb 2026: 73.79%
Source: user correction

### MBV = New Lender Since Nov 2025 (2026-03-04)
MBV (MB Bank) started VN disbursements 2025-11-17. Mar 2026: 441 loans/day = 8.5% share.
Updated lender list: VIET_CREDIT (67%) + MCREDIT (14%) + AMBER (10%) + MBV (8.5%)

## Mimir Trust
- MAU: OK
- Disbursement count: LOW (3x undercount — STATUS filter bug + Feb 29 bug)
- Disbursement amount: HIGH (exact match Feb 2026: 2.515T VND)
- Overall: MEDIUM (amount OK, count still wrong)
- Note: LOAN_AMOUNT = DISBURSED_AMOUNT in BAOTU_VAYNHANH_LOAN_INFO (same values)
- Vietnamese ambiguity: "tong so giai ngan" = amount. For count, use "tong so khoan giai ngan".

## DA Review Knowledge (2026-03-11)
> From domain review xlsx — DA-written gotchas and rules.

- A30 = tập user có truy cập vào Vay Nhanh trong vòng 30 ngày gần nhất. A60 = tập user có truy cập vào Vay Nhanh trong vòng 60 ngày gần nhất. A90 = tập user có truy cập vào Vay Nhanh trong vòng 90 ngày gần nhất.

