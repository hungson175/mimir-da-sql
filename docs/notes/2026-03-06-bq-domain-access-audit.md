# BQ Domain Access Audit

> Account: `son.pham9@mservice.com.vn` | Job project: `momovn-bu-fi-shared`
> Tested: 2026-03-06 | Method: BQ dry-run `SELECT 1 FROM <table> LIMIT 1`

## Summary

| Status | Count |
|--------|-------|
| ACCESS | 32 |
| DENIED | 27 |
| NO SCHEMA (untestable) | 5 |
| NOT FOUND | 1 |
| **Total** | **65** |

---

## ACCESS (32 domains)

| # | Domain | Table Tested | BQ Dataset |
|---|--------|-------------|------------|
| 1 | BU FS: Bank Partnership | `BANK_W2B_RAW` | `momovn-prod.BU_FI` |
| 2 | BU FS: Chung Khoan CV | `MIMIR_CVS_TRANSACTION` | `momovn-cvs.BU_CVS` |
| 3 | BU FS: CreditTech Merchant Financing | `FMOB_PERFORMANCE_BY_OFFER` | `momovn-prod.BU_FI` |
| 4 | BU FS: CreditTech Paylater | `PAYLATER_MAU_SEGMENT` | `momovn-prod.BU_FI` |
| 5 | BU FS: FI Solutions | `FIS_CLO_TRAFFIC_FLOW` | `momovn-prod.BU_FI` |
| 6 | BU FS: Financial Hub | `FINHUB_TTTC_QLTK_TRAFFIC` | `momovn-prod.PRODUCT_BANK` |
| 7 | BU FS: InsurTech Insurance | `INS_PUBLIC_HEALTH_FUNNEL` | `momovn-prod.BU_FI` |
| 8 | BU FS: Tui Than Tai | `fact_ttt_event_tracking` | `momovn-prod.BU_FI` |
| 9 | BU FS: Vay Nhanh | `BAOTU_VAYNHANH_LOAN_INFO` | `momovn-prod.BU_FI` |
| 10 | BU Growth Platform: Expense Management | `SEMANTIC_QLCT_VISIT` | `momovn-prod.MBI_DA` |
| 11 | BU MDS: Journey | `journey_track_node_agg_v2` | `momovn-prod.MBI_DA` |
| 12 | BU MDS: OTA | `2022_HUY_EVENTS_LANDINGPAGE_V2_PIVOTED_UNION` | `momovn-prod.REPORT` |
| 13 | BU MDS: Promotion Platform Performance | `PROMOTION_PERFORMANCE_AGG` | `momovn-prod.MBI_DA` |
| 14 | BU Payment: OFFLINE M4B ENGAGEMENT | `kmean-feature-20251012-firstsaved` | `momovn-prod.MBI_DA` |
| 15 | BU Payment: P2P AIO_QR | `HOANG_P2P_AIO_QR_ORIGINAL_TABLE` | `momovn-prod.MBI_DA` |
| 16 | BU Payment: P2P ERROR | `P2P_ERROR_ALL` | `momovn-prod.MBI_DA` |
| 17 | BU Payment: P2P OVERALL | `P2P_SOF_ALL_RAW` | `momovn-prod.MBI_DA` |
| 18 | BU Payment: P2P QUY NHOM SELF SERVE | `HA_P2P_MONEYPOOL_PAYMENT_SOF` | `momovn-prod.MBI_DA` |
| 19 | BU Payment: P2P QUYNHOM | `HA_P2P_MONEYPOOL_FUND_TRANSFER` | `momovn-prod.MBI_DA` |
| 20 | BU Payment: P2P RECEIVER GENERAL | `P2P_RECEIVER_PERFORMANCE` | `momovn-prod.MBI_DA` |
| 21 | BU Payment: P2P REVENUE | `HOANG_P2P_PROJECT_W2B_FEE_RECEIVER_SEGMENTS` | `momovn-prod.MBI_DA` |
| 22 | BU Payment: P2P SOCIAL | `P2P_SOCIAL_LUCKYMONEY_TRANS_RAW` | `momovn-prod.MBI_DA` |
| 23 | BU Payment: P2P W2B | `LOAN_P2P_W2B_RAW_MAPPING` | `momovn-prod.MBI_DA` |
| 24 | BU Payment: P2P W2W | `LOAN_P2P_W2W_RAW_MAPPING` | `momovn-prod.MBI_DA` |
| 25 | BU Payment: Transaction MoMo | `DAILY_PAID_USER_TRANS_VER2` | `project-5400504384186300846.REPORT` |
| 26 | CDO: User Consent | `BEHALF_USERS_CONSENT_HISTORY` | `momovn-prod.MBI_DA` |
| 27 | Chatbot Moni | `QLCT_CHATBOT_CONVERSATION_LOG` | `momovn-prod.MBI_DA` |
| 28 | Customer Experience: CS | `CRM_TICKET` | `momovn-prod.CS` |
| 29 | GMC: Manual Account Termination | `GMC_RETENTION_TERMINATE_ACCOUNT_PERFORMANCE` | `project-5400504384186300846.REPORT` |
| 30 | ITC MLBIZ: CREDITTECH | `ALEXIS_LOAN_PAYMENT_PROCESSOR_V2_LOG_SNAPSHOT_*` | `momovn-prod.ALEXIS` |
| 31 | Lich su giao dich | `LSGD_CTGD_FILTER_LABEL_RAW` | `momovn-prod.MBI_DA` |
| 32 | [PAYMENT PLATFORM] Electronic Data Capture | `THAI_CDO_EDC_PAYMENT` | `momovn-prod.MBI_DA` |

**Accessible BQ projects/datasets:**
- `momovn-prod.BU_FI` (all FS tables)
- `momovn-prod.MBI_DA` (P2P, QLCT, EDC, etc.)
- `momovn-prod.PRODUCT_BANK`
- `momovn-prod.REPORT`
- `momovn-prod.CS`
- `momovn-prod.ALEXIS`
- `momovn-cvs.BU_CVS`
- `project-5400504384186300846.REPORT`

---

## DENIED (27 domains)

| # | Domain | Table Tested | BQ Dataset (blocked) |
|---|--------|-------------|---------------------|
| 1 | BU MDS: Business Page | `OA_MASTER_INFO` | `project-5400504384186300846.MBI_DA` |
| 2 | BU MDS: Donation | `DONATION_ENGAGEMEN_OVERLAP_*` | `project-5400504384186300846.MBI_DA` |
| 3 | BU MDS: Notification for BU | `daily_notification_metrics` | `momovn-mds-dc.dwh` |
| 4 | BU MDS: Notification for Platform | `daily_notification_metrics` | `momovn-mds-dc.dwh` |
| 5 | BU MDS: Tho Dia MoMo | `DM_MART_PROFILE_USER_LOGIN` | `project-5400504384186300846.MBI_DA` |
| 6 | BU Payment: Airtime | `AIRTIME_SEGMENT_USER` | `project-5400504384186300846.BU_UTILITIES_TELCO` |
| 7 | BU Payment: Billpay (Non Sensitive) | `MIMIR_BILLPAY_DETAILS` | `project-5400504384186300846.BU_UTILITIES_TELCO` |
| 8 | BU Payment: Billpay | `MIMIR_BILLPAY_DETAILS` | `project-5400504384186300846.BU_UTILITIES_TELCO` |
| 9 | BU Payment: Data (Non Sensitive) | `DATA_DETAILS` | `project-5400504384186300846.BU_UTILITIES_TELCO` |
| 10 | BU Payment: Data | `DATA_DETAILS` | `project-5400504384186300846.BU_UTILITIES_TELCO` |
| 11 | BU Payment: DLS ONLINE | `DLS_ONLINE_NFC_INFO` | `momovn-prod.BU_ECOM` |
| 12 | BU Payment: EPS-TOPBRAND | `DM_EPS_USER_TRANSACTION` | `project-5400504384186300846.MBI_DA` |
| 13 | BU Payment: M4B HUB | `dim_m4b_merchant_profile` | `project-5400504384186300846.MBI_DA` |
| 14 | BU Payment: SME OFFLINE PAYMENT | `DM_OFF_TRANSACTION` | `project-5400504384186300846.MBI_DA` |
| 15 | BU Payment: SUPPLIER TRACKING | `TELCO_WAREHOUSE_ARGG_ALL` | `project-5400504384186300846.BU_UTILITIES_TELCO` |
| 16 | BU Payment: Telco Funnel | `FULL_FUNNEL_TELCO_OPTIMIZE` | `momovn-prod.BU_UTILITIES_TELCO` |
| 17 | BU Payment: VTTI Overview | `VTTI_TRANID_ALL` | `project-5400504384186300846.BU_UTILITIES_TELCO` |
| 18 | CDO: Data Ownership | `DIM_CONTRACT_LAST_VERSION` | `momovn-cdo-shared.DATA_OWNERSHIP` |
| 19 | Customer Experience: CEE USER SUGGESTIONS | `FF_CONTENTS_V2` | `momovn-cee-shared.CEE_MAIL` |
| 20 | Data Loss Prevention | `OBJECT_TAG_STAGING` | `momovn-res-data-services.DLP` |
| 21 | GMC: GTBB | `GMC_SEMANTIC_GTBB_INFO` | `momovn-growth-shared.GMC_SHARE` |
| 22 | ITC: MiniApp Performance | `STT_APDEX_BY_DETAIL` | `momovn-mini-app-analyst.MINI_APP_PLATFORM` |
| 23 | ITC: STRONGHOLD Device Info | `D_DEVICE` | `momovn-prod.STRONGHOLD_ANALYTICS` |
| 24 | MEDIA - AD Platform | `MEDIA_FACT_AD_AGG` | `momovn-growth-analytics.REPORT_MEDIA` |
| 25 | MiMir Performance | `MIMIR_CONVERSATION_LOG_*` | `momovn-mimir.MIMIR` |
| 26 | User Trust: Check Scam | `CHECK_SCAM_IDENTIFIER_SEARCH_*` | `project-5400504384186300846.SHERLOCK` |
| 27 | User Trust: Report Scam | `REPORT_SCAM_USER_REPORT_DATA` | `momovn-prod.SHERLOCK` |

**Blocked BQ projects/datasets:**
- `project-5400504384186300846.MBI_DA` (different from `momovn-prod.MBI_DA`)
- `project-5400504384186300846.BU_UTILITIES_TELCO`
- `project-5400504384186300846.SHERLOCK`
- `momovn-prod.BU_ECOM`
- `momovn-prod.BU_UTILITIES_TELCO`
- `momovn-prod.STRONGHOLD_ANALYTICS`
- `momovn-prod.SHERLOCK`
- `momovn-mds-dc.dwh`
- `momovn-cdo-shared.DATA_OWNERSHIP`
- `momovn-cee-shared.CEE_MAIL`
- `momovn-res-data-services.DLP`
- `momovn-growth-shared.GMC_SHARE`
- `momovn-growth-analytics.REPORT_MEDIA`
- `momovn-mini-app-analyst.MINI_APP_PLATFORM`
- `momovn-mimir.MIMIR`

---

## NO SCHEMA / UNTESTABLE (5 domains)

These domains have no table schemas in our domain files — cannot determine BQ table names to test.

| # | Domain | Domain ID |
|---|--------|-----------|
| 1 | BU MDS: Promotion Campaign Performance | `e9363d1c-6486-4072-8dc5-8d06260e9c7f` |
| 2 | BU MDS: Rewards MEU | `be488435-9b4d-4449-92ba-7cb7fad81012` |
| 3 | BU Payment: Airtime (Non Sensitive) | `63e7a2bc-2f9d-4b8f-9a1d-03c5ea7e16e8` |
| 4 | BU Payment: SME OFFLINE OPS | `4ece5632-02ec-4d9d-9ea9-70ed5d6cc1ed` |
| 5 | Fraud | `2892bd4e-f624-4d5e-b9b3-1477c5fd9a44` |

## NOT FOUND (1 domain)

| Domain | Table | Note |
|--------|-------|------|
| ITC MLBIZ: Explanation Agent | `momovn-dev.PASION.MERCHANT_VTS_OFFER_TRACING_YYYYMMDD` | Table doesn't exist (possibly a template/pattern name) |

---

## Key Insight

Access follows a clear pattern by **BQ project**:
- **`momovn-prod`** — mostly accessible (`BU_FI`, `MBI_DA`, `CS`, `PRODUCT_BANK`, `ALEXIS`, `REPORT`), but blocked for `BU_ECOM`, `BU_UTILITIES_TELCO`, `STRONGHOLD_ANALYTICS`, `SHERLOCK`
- **`project-5400504384186300846`** — only `REPORT` is accessible; `MBI_DA`, `BU_UTILITIES_TELCO`, `SHERLOCK` are blocked
- **Other projects** (`momovn-mds-dc`, `momovn-cdo-shared`, `momovn-cee-shared`, `momovn-growth-*`, `momovn-mini-app-analyst`, `momovn-mimir`) — all blocked

For denied domains, data is only accessible via the Mimir question API (not SQL).
