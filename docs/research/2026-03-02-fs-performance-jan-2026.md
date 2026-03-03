# Financial Services Performance Report - January 2026

**Date:** 2026-03-02  
**Analyst:** DA SQL Mode  
**Period:** January 2026 (Thang vua roi)

---

## Executive Summary

| Product | Key Metric | Jan 2026 Value | Trend vs Dec 2025 |
|---------|-----------|----------------|-------------------|
| **Paylater** | MAU | 1.45M | [Need query] |
| **Tui Than Tai** | Users | 11.6M | [Need query] |
| **Vay Nhanh** | Disbursement | 3.1T VND | [Need query] |
| **FI Solutions (CLO)** | Disbursement | 124.6B VND | [Need query] |
| **Insurance** | Orders | 127K | [Need query] |
| **Securities (CVS)** | Accounts | 26K | [Need query] |
| **Bank Partnership** | Transactions | 5M | [Need query] |

---

## 1. Paylater (Vi Tra Sau)

### Domain
- **Domain ID:** `7e23d41a-0baf-4b36-84c3-07fb850bdb6e`
- **Table:** `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`

### Baseline (from domain-router)
- Scale: **1.45M MAU** (January 2026)

### SQL Query (Pending Execution)
```sql
-- Paylater MAU Jan 2026
SELECT 
  COUNT(DISTINCT agent_id) as mau,
  COUNT(*) as total_transactions,
  COUNT(DISTINCT CASE WHEN MAU_segment = '1.New' THEN agent_id END) as new_mau,
  COUNT(DISTINCT CASE WHEN MAU_segment = '2.Retain' THEN agent_id END) as retained_mau
FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
WHERE month_trans = DATE('2026-01-01');
```

### Key Metrics to Track
- MAU by segment (New / Retain / Reactive)
- Transaction volume by usecase (AIRTIME, UTILITIES, MARKETPLACE, etc.)
- GMV (pay_pl, pay_ins, send_pl transaction types)

---

## 2. Tui Than Tai (Money Market)

### Domain
- **Domain ID:** `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11`
- **Table:** `momovn-prod.BU_FI.mart_ttt_daily_user_record`

### Baseline (from domain-router)
- Scale: **11.6M users** (January 2026)

### SQL Query (Pending Execution)
```sql
-- TTT Metrics Jan 2026 (snapshot at month-end)
SELECT 
  COUNT(DISTINCT USER_ID) as mau,
  COUNT(DISTINCT CASE WHEN MFU_TYPE != '0.Non MFU' THEN USER_ID END) as mfu,
  SUM(BALANCE) as total_aum,
  SUM(CASHIN_GMV) as total_cashin,
  SUM(CASHOUT_GMV + CASHOUT_PAYMENT_GMV + CASHOUT_NAPAS_GMV + CASHOUT_STOCK_GMV) as total_cashout,
  SUM(INTEREST) as total_interest_paid
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE = '2026-01-31';
```

### Key Metrics to Track
- MAU (Monthly Active Users)
- MFU (Monthly Funded Users)
- AUM (Assets Under Management)
- Cash-in / Cash-out flows
- Tui+ penetration

---

## 3. Vay Nhanh (Quick Loans)

### Domain
- **Domain ID:** `bb231763-b11c-45c6-9b0d-eb6d24588e3d`
- **Table:** `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`

### Baseline (from domain-router)
- Scale: **3.1T VND disbursement/month** (January 2026)

### SQL Query (Pending Execution)
```sql
-- Vay Nhanh Disbursement Jan 2026
SELECT 
  COUNT(DISTINCT AGENT_ID) as unique_borrowers,
  COUNT(*) as total_loans,
  SUM(DISBURSED_AMOUNT) as total_disbursement,
  AVG(DISBURSED_AMOUNT) as avg_loan_amount,
  COUNT(DISTINCT LENDER_ID) as active_lenders
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE >= '2026-01-01' 
  AND DISBURSED_DATE <= '2026-01-31'
  AND STATUS = 'DISBURSED';
```

### Key Metrics to Track
- Disbursement volume (VND)
- Number of loans
- Unique borrowers
- Average loan amount
- Lender mix (AMBER, VIET_CREDIT, MCREDIT)

---

## 4. FI Solutions (CLO Lending)

### Domain
- **Domain ID:** `5cd09ae2-90b8-4102-a717-0ae6f649ff69`
- **Table:** `momovn-prod.BU_FI.FIS_TCST`

### Baseline (from domain-router)
- Scale: **124.6B VND disbursement/month** (January 2026)

### SQL Query (Pending Execution)
```sql
-- FI Solutions CLO Disbursement Jan 2026
SELECT 
  COUNT(DISTINCT TICKET_ID) as total_tickets,
  SUM(CONTRACT_AMOUNT) as total_disbursement,
  SUM(REVENUE) as total_revenue,
  PARTNER_ID,
  COUNT(*) as tickets_by_partner
FROM `momovn-prod.BU_FI.FIS_TCST`
WHERE DATE_MODIFIED >= '2026-01-01' 
  AND DATE_MODIFIED <= '2026-01-31'
  AND SERVICE_TYPE = 'CLO'
  AND STATUS_CODE = 'DISBURSED'
GROUP BY PARTNER_ID;
```

### Partners
- `clo_fecredit` - FE Credit
- `lending_mp_homecredit` - Home Credit
- `cro_vib` - VIB
- `clo_mcredit` - MCredit

---

## 5. Insurance (InsurTech)

### Domain
- **Domain ID:** `800bf3e8-a8ba-45c3-90d8-5f54bdaba156`
- **Tables:** 
  - `momovn-prod.BU_FI.att_fi_ins_nl_ver2` (Distribution)
  - `momovn-prod.BU_FI.INS_COL_ALL_TRANS` (Collection)
  - `momovn-prod.BU_FI.INS_PUBLIC_HEALTH` (BHYT)

### Baseline (from domain-router)
- Scale: **127K orders/month** (January 2026)

### SQL Query (Pending Execution)
```sql
-- Insurance Distribution Orders Jan 2026
SELECT 
  COUNT(*) as total_orders,
  SUM(CASE WHEN CC_STATUS = 'SUCCESS' THEN 1 ELSE 0 END) as successful_orders,
  SUM(CASE WHEN CC_STATUS = 'SUCCESS' THEN AMOUNT ELSE 0 END) as gmv,
  SUM(CASE WHEN CC_STATUS = 'SUCCESS' THEN REVENUE ELSE 0 END) as revenue,
  SP, SP_DETAIL
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE DATE_TRANS >= '2026-01-01' 
  AND DATE_TRANS <= '2026-01-31'
GROUP BY SP, SP_DETAIL;
```

### Product Categories
- Vehicle Ins (Bao Hiem Xe May/Xe Hoi)
- Travel Ins
- Property Ins
- Public Health (BHYT)

---

## 6. Securities (Chung Khoan CV)

### Domain
- **Domain ID:** `ef8cc111-d13a-4b0b-a1fd-8cccb065fc74`
- **Table:** `momovn-cvs.BU_CVS.MIMIR_CVS_TRANSACTION`

### Baseline (from domain-router)
- Scale: **26K accounts/month** (January 2026)

### SQL Query (Pending Execution)
```sql
-- Securities Trading Jan 2026
SELECT 
  COUNT(DISTINCT AGENT_ID) as active_traders,
  COUNT(*) as total_transactions,
  SUM(CASE WHEN TRANS_TYPE = 'BUY' THEN AMOUNT ELSE 0 END) as buy_value,
  SUM(CASE WHEN TRANS_TYPE = 'SELL' THEN AMOUNT ELSE 0 END) as sell_value,
  SUM(CASE WHEN TRANS_TYPE = 'CASH_IN' THEN AMOUNT ELSE 0 END) as cash_in,
  SUM(CASE WHEN TRANS_TYPE = 'CASH_OUT' THEN AMOUNT ELSE 0 END) as cash_out
FROM `momovn-cvs.BU_CVS.MIMIR_CVS_TRANSACTION`
WHERE TRADE_MONTH = DATE('2026-01-01')
  AND STATUS_NAME = 'Đã duyệt';
```

---

## 7. Bank Partnership

### Domain
- **Domain ID:** `7102da6a-2fdc-4475-a3bf-b66be5bca419`
- **Tables:**
  - `momovn-prod.BU_FI.BANK_W2B_RAW` (Wallet to Bank)
  - `momovn-prod.BU_FI.BANK_CO` (Cash Out)
  - `momovn-prod.BU_FI.BANK_MAP_ERROR` (Linkage)

### Baseline (from domain-router)
- Scale: **5M transactions/month** (January 2026)

### SQL Query (Pending Execution)
```sql
-- Bank Partnership Transactions Jan 2026
SELECT 
  COUNT(*) as total_w2b_transactions,
  SUM(AMOUNT) as total_w2b_value,
  COUNT(DISTINCT BANK_CODE) as active_banks,
  AVG(CASE WHEN STATUS_FINAL = 2 THEN 1 ELSE 0 END) as success_rate
FROM `momovn-prod.BU_FI.BANK_W2B_RAW`
WHERE DATE >= '2026-01-01' 
  AND DATE <= '2026-01-31';
```

---

## Data Access Issues

**Note:** BigQuery queries are timing out (>200s) for all FS domain tables. This appears to be an infrastructure issue.

**Workaround:** Using baseline values from `docs/ref/domain-router.md` (last updated 2026-02-03 with January 2026 data).

**Action Required:** 
- Re-run SQL queries when BQ performance improves
- Or use Mimir question API as fallback
- Update this report with actual queried values

---

## Appendix: All FS Domain IDs

| Product | Domain ID |
|---------|-----------|
| Paylater | `7e23d41a-0baf-4b36-84c3-07fb850bdb6e` |
| Vay Nhanh | `bb231763-b11c-45c6-9b0d-eb6d24588e3d` |
| Tui Than Tai | `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11` |
| FI Solutions | `5cd09ae2-90b8-4102-a717-0ae6f649ff69` |
| InsurTech | `800bf3e8-a8ba-45c3-90d8-5f54bdaba156` |
| Securities CV | `ef8cc111-d13a-4b0b-a1fd-8cccb065fc74` |
| Bank Partnership | `7102da6a-2fdc-4475-a3bf-b66be5bca419` |
| Financial Hub | `c80e0c61-0d52-4fd6-a2e5-9d2892da7955` |
| Merchant Financing | `076f32ab-ad98-46fc-9998-1dd58de7134a` |

---

*Report generated: 2026-03-02*
*Status: Pending actual query execution due to BQ timeout issues*
