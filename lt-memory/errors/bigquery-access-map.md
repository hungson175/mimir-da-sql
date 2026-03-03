# BigQuery Access Map

> Tested 2026-02-25 with account `son.pham9@mservice.com.vn`, job project `momovn-bu-fs-ondemand` (temporary, prev: `momovn-bu-fi-shared`).

## Accessible

| Dataset | Example Table | Notes |
|---------|--------------|-------|
| `momovn-prod.BU_FI` | PAYLATER_MAU_SEGMENT, BAOTU_VAYNHANH_LOAN_INFO, BAOTU_VAYNHANH_ENTRY_POINT, mart_ttt_daily_user_record, fact_ttt_event_tracking | Full read access |
| `momovn-prod.MBI_DA` | SEMANTIC_QLCT_VISIT, HOANG_P2P_ALL_CASHOUT_W2W_BY_TID, HOANG_P2P_PROJECT_W2B_FEE_RECEIVER_SEGMENTS | Read access |

## Inaccessible

| Dataset / Table | Error | What We'd Get |
|----------------|-------|---------------|
| `project-5400504384186300846.REPORT.DAILY_PAID_USER_TRANS_VER2` | Access Denied | Transaction MoMo: all wallet transactions, GMV, BU breakdown |
| `momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1` | Access Denied | DLS Online: daily life service transactions, GMV, revenue, categories |
| `momovn-prod.BU_ECOM.*` | Access Denied | All DLS/ECOM tables (TOKEN_TRANS, MAU_BY_USECASE_VER2, CAISHEN_CASH_BACK_TRANSACTION, etc.) |
| `project-5400504384186300846.MBI_DA.D_OP_USER_PROFILE` | Access Denied | Golden demographics: gender, age, device_os, kyc_level, map_bank, map_napas, phone_carrier, register_datetime |
| `momovn-prod.STRONGHOLD_ANALYTICS.FACT_DEVICE_SCAN` | Access Denied | Device scan: RAM, app version, carrier, network type, OS version |
| `momovn-prod.STRONGHOLD_ANALYTICS.D_DEVICE` | Access Denied | Device master: brand, manufacturer, model, screen resolution, NFC |

## Fallback Strategy

- **Demographics:** Use `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` — has GENDER, AGE, AGE_GROUP, CITY, REGION, IS_A30_USER. Coverage is partial (~80-90% of financial product users) since it only covers users who visited Moni/QLCT/TFBV features.
- **Device info:** No fallback available. Need to request access to STRONGHOLD_ANALYTICS.
