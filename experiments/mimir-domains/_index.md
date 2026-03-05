# Mimir Domains — Full Index

Total: **65 domains**

---


## CDO (Data Office)

### ✓ CDO: Data Ownership
- **ID:** `51216294-46c7-4058-8ba2-aa53f7409fe6`
- **File:** `cdo-data-ownership.json`
- **Description:** Thông tin về data contract, data owner, những bảng đã được lên contract và data quality của những bả
- **Tables (3):**
  - `momovn-cdo-shared.DATA_OWNERSHIP.DIM_CONTRACT_LAST_VERSION`
  - `momovn-cdo-shared.DATA_OWNERSHIP.AURORA_FACT_TABLES_IN_CONTRACT`
  - `momovn-cdo-shared.DATA_OWNERSHIP.AURORA_FACT_APPROVALS`

### ✓ CDO: User Consent
- **ID:** `350f9466-757c-4292-af88-5e7e16e65d6a`
- **File:** `cdo-user-consent.json`
- **Description:** Dữ liệu user đồng ý chia sẻ dữ liệu cá nhân với MoMo
- **Tables (7):**
  - `momovn-prod.MBI_DA.BEHALF_USERS_CONSENT_HISTORY`
  - `momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_TRANS`
  - `momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_LOGIN`
  - `momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_MINIAPP`
  - `momovn-prod.MBI_DA.USER_CONSENT_DAILY`
  - `momovn-prod.MBI_DA.USER_CONSENT_MONTHLY`
  - `project-5400504384186300846.MBI_DA.D_OP_USER_PROFILE`


## Customer Experience

### ✓ Customer Experience: CEE USER SUGGESTIONS
- **ID:** `20e405eb-5b2b-4a23-bacc-35196c4e707d`
- **File:** `customer-experience-cee-user-suggestions.json`
- **Description:** The dataset records information about user suggestions received through Feedback Feature in all CS c
- **Tables (0):**
  - *(no tables or schema_ddl empty)*

### ✓ Customer Experience: CS
- **ID:** `63409031-024f-465a-8ac7-da361d19f5f4`
- **File:** `customer-experience-cs.json`
- **Description:** The dataset records information about user suggestions received through custommer service and chatbo
- **Tables (1):**
  - `momovn-prod.CS.CRM_TICKET`


## FS (Financial Services)

### ✓ BU FS: Bank Partnership
- **ID:** `7102da6a-2fdc-4475-a3bf-b66be5bca419`
- **File:** `bu-fs-bank-partnership.json`
- **Description:** Thông tin dữ liệu về các dịch vụ liên quan tới ngân hàng (nạp/ rút/ liên kết/ direct debit/ w2b/ ...
- **Tables (3):**
  - `momovn-prod.BU_FI.BANK_W2B_RAW`
  - `momovn-prod.BU_FI.BANK_MAP_ERROR`
  - `momovn-prod.BU_FI.BANK_CO`

### ✓ BU FS: Chứng khoán CV
- **ID:** `ef8cc111-d13a-4b0b-a1fd-8cccb065fc74`
- **File:** `bu-fs-chứng-khoán-cv.json`
- **Description:** Hỏi về thông tin đăng ký tài khoản, giao dịch chứng khoán và traffic user.
- **Tables (2):**
  - `momovn-cvs.BU_CVS.MIMIR_CVS_TRANSACTION`
  - `momovn-cvs.BU_CVS.MIMIR_CVS_EVENT_DATA`

### ✓ BU FS: CreditTech Paylater
- **ID:** `7e23d41a-0baf-4b36-84c3-07fb850bdb6e`
- **File:** `bu-fs-credittech-paylater.json`
- **Description:** Data của sản phẩm Ví Trả Sau/Paylater. 
- **Tables (1):**
  - `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`

### ✓ BU FS: CreditTech – Merchant Financing
- **ID:** `076f32ab-ad98-46fc-9998-1dd58de7134a`
- **File:** `bu-fs-credittech-merchant-financing.json`
- **Description:** Data của sản phẩm Vay nhanh cho nhà bán hàng, bao gồm các step accessed/submitted/disbursed
- **Tables (1):**
  - `momovn-prod.BU_FI.FMOB_PERFORMANCE_BY_OFFER`

### ✓ BU FS: FI Solutions
- **ID:** `5cd09ae2-90b8-4102-a717-0ae6f649ff69`
- **File:** `bu-fs-fi-solutions.json`
- **Description:** Data về traffic và giải ngân của sản phẩm CLO và giao dịch thanh toán khoản vay, thanh toán thẻ tín 
- **Tables (3):**
  - `momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW`
  - `momovn-prod.BU_FI.FI_TRANS`
  - `momovn-prod.BU_FI.FIS_TCST`

### ✓ BU FS: Financial Hub
- **ID:** `c80e0c61-0d52-4fd6-a2e5-9d2892da7955`
- **File:** `bu-fs-financial-hub.json`
- **Description:** The dataset records information about Financial Hub miniapp, including:
(1) traffic login TTTC (Trun
- **Tables (4):**
  - `momovn-prod.PRODUCT_BANK.FINHUB_TTTC_QLTK_TRAFFIC`
  - `momovn-prod.PRODUCT_BANK.FINHUB_TTTC_QLTK_ENTRY_POINT`
  - `momovn-prod.PRODUCT_BANK.FINHUB_TTTC_QLTK_RETENTION`
  - `momovn-prod.PRODUCT_BANK.PHUC_SOF_TTTC_ACTION_AGG_BY_COMPONENT`

### ✓ BU FS: InsurTech - Insurance
- **ID:** `800bf3e8-a8ba-45c3-90d8-5f54bdaba156`
- **File:** `bu-fs-insurtech-insurance.json`
- **Description:** Lưu trữ dữ liệu của FS_InsurTech với những sản phẩm tương ứng dưới đây:
1) Traffic Flow đổ vào Insur
- **Tables (5):**
  - `momovn-prod.BU_FI.INS_PUBLIC_HEALTH_FUNNEL`
  - `momovn-prod.BU_FI.INS_COL_ALL_TRANS`
  - `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
  - `momovn-prod.BU_FI.INS_TRAFFIC_FLOW`
  - `momovn-prod.BU_FI.INS_PUBLIC_HEALTH`

### ✓ BU FS: Túi Thần Tài
- **ID:** `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11`
- **File:** `bu-fs-túi-thần-tài.json`
- **Description:** Trả lời cho toàn bộ câu hỏi về Business metric của Túi Thần Tài và Traffic vào TTT và Túi+ kèm Entry
- **Tables (2):**
  - `momovn-prod.BU_FI.fact_ttt_event_tracking`
  - `momovn-prod.BU_FI.mart_ttt_daily_user_record`

### ✓ BU FS: Vay Nhanh
- **ID:** `bb231763-b11c-45c6-9b0d-eb6d24588e3d`
- **File:** `bu-fs-vay-nhanh.json`
- **Description:** Data liên quan đến giải ngân, traffic Vaynhanh
- **Tables (3):**
  - `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
  - `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT`
  - `momovn-prod.BU_FI.BAOTU_VAYNHANH_USER_ACCESSED`


## GMC

### ✓ GMC: GTBB
- **ID:** `16f33834-123a-4fef-aaeb-7e71da9346d6`
- **File:** `gmc-gtbb.json`
- **Description:** Scheme giới thiệu bạn bè ở momo
- **Tables (2):**
  - `momovn-growth-shared.GMC_SHARE.GMC_SEMANTIC_GTBB_INFO`
  - `momovn-prod.REPORT.GMC_CS_CASE_CHECK_GTBB`

### ✓ GMC: Manual Account Termination
- **ID:** `f1f9aae9-0343-40c9-8e1b-db35889ac849`
- **File:** `gmc-manual-account-termination.json`
- **Description:** Domain chuyên về performance của luồng Hủy ví thủ công ("Đây không phải là tôi") 
- **Tables (3):**
  - `project-5400504384186300846.REPORT.GMC_RETENTION_TERMINATE_ACCOUNT_PERFORMANCE`
  - `project-5400504384186300846.REPORT.GMC_RETENTION_TERMINATE_ACCOUNT_ERROR_CHECK_CONDITION`
  - `project-5400504384186300846.REPORT.GMC_RETENTION_TERMINATE_ACCOUNT_ERROR_AUTHEN`


## Growth Platform

### ✓ BU Growth Platform: Expense Management
- **ID:** `af241589-f5be-4b97-8928-fe0823c8dc75`
- **File:** `bu-growth-platform-expense-management.json`
- **Description:** Phân tích về sản phẩm Quản Lý Chi tiêu bao gồm:
- Các thông tin về người dùng
- Các thông tin về eve
- **Tables (0):**
  - `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
  - `momovn-prod.MBI_DA.QLCT_EVENT_TRACKING_VER2`
  - `momovn-prod.MBI_DA.LSGD_CTGD_FILTER_LABEL_RAW`
  - `momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER`
  - `momovn-prod.MBI_DA.HAI_QLCT_FEATURE_BUDGET_RAW`
  - `momovn-prod.MBI_DA.QLCT_L3_LABEL_WIDGET`
  - `momovn-prod.TEAM_PRODUCT_OPTS.QLCT_L4_USER_PROFILE_MONTHLY`


## ITC (Infrastructure/Tech)

### ✓ ITC MLBIZ: CREDITTECH
- **ID:** `cf246f90-8aba-44e5-be6e-d02ddb22b9c1`
- **File:** `itc-mlbiz-credittech.json`
- **Description:** Data các sản phẩm Lending 
- **Tables (1):**
  - `momovn-prod.ALEXIS.ALEXIS_LOAN_PAYMENT_PROCESSOR_V2_LOG_SNAPSHOT_20250101_20251013`

### ✓ ITC MLBIZ: Explanation Agent
- **ID:** `7e533485-3f9d-45d1-b97c-82eb59aa3d01`
- **File:** `itc-mlbiz-explanation-agent.json`
- **Tables (1):**
  - `momovn-dev.PASION.MERCHANT_VTS_OFFER_TRACING_YYYYMMDD`

### ✓ ITC: MiniApp Performance
- **ID:** `a8e52ce3-b404-42fe-afff-30201ea2897e`
- **File:** `itc-miniapp-performance.json`
- **Description:** Lấy các chỉ số của từng Miniapp trong MoMo
- **Tables (0):**
  - `momovn-mini-app-analyst.MINI_APP_PLATFORM.STT_APDEX_BY_DETAIL`
  - `momovn-mini-app-analyst.MINI_APP_PLATFORM.STG_MINIAPP_LOAD_TOAST_SCREEN_ERROR`

### ✓ ITC: STRONGHOLD - Device Info
- **ID:** `7994ad65-873f-4c9d-9c90-f49377367892`
- **File:** `itc-stronghold-device-info.json`
- **Description:** This data model captures device information of MoMo users, extracted during specific events at vario
- **Tables (4):**
  - `momovn-prod.STRONGHOLD_ANALYTICS.D_DEVICE`
  - `momovn-prod.STRONGHOLD_ANALYTICS.FACT_DEVICE_SCAN`
  - `momovn-prod.STRONGHOLD_ANALYTICS.HISTORY_USER_CHANGE_DEVICE`
  - `momovn-prod.STRONGHOLD_ANALYTICS.HISTORY_DEVICE_INFO`


## MDS (Merchant & Deals)

### ✓ BU MDS: Business Page
- **ID:** `3220e3ea-a817-4cad-a795-6221771b5956`
- **File:** `bu-mds-business-page.json`
- **Description:** The dataset records all information about features in BP, including: (1) information about BP (2) Me
- **Tables (4):**
  - `project-5400504384186300846.MBI_DA.OA_MASTER_INFO`
  - `project-5400504384186300846.MBI_DA.F_OA_USER_ACTION`
  - `project-5400504384186300846.MBI_DA.F_OA_MERCHANT_ACTION_TRACKING`
  - `project-5400504384186300846.MBI_DA.OA_TDMM_EVENT_v2_converted`

### ✓ BU MDS: Donation
- **ID:** `dd5f63eb-9981-4d0b-ba85-bd73ce80f52f`
- **File:** `bu-mds-donation.json`
- **Description:** Donation là nền tảng gây quỹ từ thiện tích hợp trong ví điện tử. Người dùng có thể quyên góp tiền ho
- **Tables (0):**
  - `project-5400504384186300846.MBI_DA.DONATION_ENGAGEMEN_OVERLAP_MOMO_A90_MEU`
  - `project-5400504384186300846.MBI_DA.DONATION_TRANSACTION_AGG`
  - `project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_RETENTION`
  - `project-5400504384186300846.MBI_DA.DONATION_OVERLAP_MAU_MEU`
  - `project-5400504384186300846.MBI_DA.DONATION_FIRST_DONATE`
  - `project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_AGG`
  - `project-5400504384186300846.MBI_DA.F_DONATION_ENGAGEMENT`
  - `project-5400504384186300846.MBI_DA.DONATION_USER_WITH_CLOTHES`

### ✓ BU MDS: Journey
- **ID:** `6471b001-623f-4ce2-a6a5-5bf63b2cf928`
- **File:** `bu-mds-journey.json`
- **Description:** Thông tin về journey camp chạy, gồm CVR enter, goal, ctr noti, ctr adv
Cách tạo journey ở đây https:
- **Tables (0):**
  - `momovn-prod.MBI_DA.journey_track_node_agg_v2`
  - `momovn-prod.MBI_DA.journey_track_camp_agg_v2`

### ✓ BU MDS: Notification for BU
- **ID:** `bcae6a77-3995-49e5-85ca-36b1ed664c13`
- **File:** `bu-mds-notification-for-bu.json`
- **Description:** Bảng Notification chỉ tổng hợp số lượng notiid giống dạng event, không theo user do bảng user quá nặ
- **Tables (0):**
  - `momovn-mds-dc.dwh.daily_notification_metrics`

### ✓ BU MDS: Notification for Platform
- **ID:** `750780b7-b20f-46b6-ab05-2a4241b591c6`
- **File:** `bu-mds-notification-for-platform.json`
- **Description:** BU MDS: Notification for Platform - Chỉ dành cho core team noti platform! A/c BU hay PO cell team vu
- **Tables (0):**
  - `momovn-mds-dc.dwh.daily_notification_metrics`

### ✓ BU MDS: OTA
- **ID:** `7172ddb9-dc48-40d4-bff7-1aa74f6ff435`
- **File:** `bu-mds-ota.json`
- **Description:** Record information about:
(1): User behaviors across airline & non-air booking funnel (search → view
- **Tables (2):**
  - `momovn-prod.REPORT.2022_HUY_EVENTS_LANDINGPAGE_V2_PIVOTED_UNION`
  - `momovn-prod.REPORT.ota_dwd_ota_user_funnel_traffic_source_daily`

### ✓ BU MDS: Promotion - Campaign Performance
- **ID:** `e9363d1c-6486-4072-8dc5-8d06260e9c7f`
- **File:** `bu-mds-promotion-campaign-performance.json`
- **Description:** Ghi nhận các tương tác của user với promotion campaign và gift (impression, click). Data được aggreg
- **Tables (0):**
  - *(no tables or schema_ddl empty)*

### ✓ BU MDS: Promotion - Platform Performance (Project team only)
- **ID:** `9d86b9d9-bf1e-4bab-8e11-86279716984a`
- **File:** `bu-mds-promotion-platform-performance-project-team-only.json`
- **Description:** Data từ delivery -> redeem, và engagement trên Promotion Platform. Các metric liên quan đến cost và 
- **Tables (2):**
  - `momovn-prod.MBI_DA.PROMOTION_PERFORMANCE_AGG`
  - `momovn-mds-dc.dmt.F_PROMO_USER_ENGAGEMENT_TOUCHPOINT_LEVEL_DAILY`

### ✓ BU MDS: Rewards - MEU
- **ID:** `be488435-9b4d-4449-92ba-7cb7fad81012`
- **File:** `bu-mds-rewards-meu.json`
- **Description:** Các thông tin của Rewards liên quan đến số user tương tác với các touchpoint của Rewards; tương tác 
- **Tables (0):**
  - *(no tables or schema_ddl empty)*

### ✓ BU MDS: Thổ Địa MoMo
- **ID:** `c123d8bc-9569-4dfd-955f-69d587062069`
- **File:** `bu-mds-thổ-địa-momo.json`
- **Description:** The dataset records information about 4 core features of TĐMM, including (1) login (2) engage (3) re
- **Tables (5):**
  - `project-5400504384186300846.MBI_DA.DM_MART_PROFILE_USER_LOGIN`
  - `project-5400504384186300846.MBI_DA.DM_MDS_TDMM_USER_ENGAGE`
  - `project-5400504384186300846.MBI_DA.DM_MDS_TDMM_DELIVERY_ORDER_last_update`
  - `project-5400504384186300846.MBI_DA.MART_ORDER_INFO`
  - `project-5400504384186300846.MBI_DA.DM_MDS_TDMM_REVIEWER_CLUB`


## Media

### ✓ MEDIA - AD Platform
- **ID:** `bf6c7cb8-75d4-493a-894c-ffd71d729cb1`
- **File:** `media-ad-platform.json`
- **Description:** Domain này phục vụ cho việc quản lý, tổng hợp và phân tích dữ liệu Media Marketing, bao gồm dữ liệu 
- **Tables (0):**
  - `momovn-growth-analytics.REPORT_MEDIA.MEDIA_FACT_AD_AGG`


## Other

### ✓ Chatbot Moni
- **ID:** `9066c2ad-5109-4fa9-abc0-06d85c6eed7e`
- **File:** `chatbot-moni.json`
- **Description:** Chatbot trả lời các câu hỏi liên quan đến sản phẩm Moni bao gồm user, hội thoại và event tracking
- **Tables (0):**
  - `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
  - `momovn-prod.MBI_DA.MONI_L3_LABEL_EVENT`
  - `momovn-prod.MBI_DA.TFBV_DAILY_ACTIVE_USER`

### ✓ Data Loss Prevention
- **ID:** `7a5b7857-5204-4a8a-a961-f427f228cf99`
- **File:** `data-loss-prevention.json`
- **Description:** Cung cấp thông tin về các vấn đề bảo mật, bao gồm danh sách các fields (cột) đang được gắn nhãn (pol
- **Tables (0):**
  - `momovn-res-data-services.DLP.OBJECT_TAG_STAGING`

### ✓ Fraud
- **ID:** `2892bd4e-f624-4d5e-b9b3-1477c5fd9a44`
- **File:** `fraud.json`
- **Description:** Thông tin về Fraud
- **Tables (0):**
  - *(no tables or schema_ddl empty)*

### ✓ Lịch sử giao dịch
- **ID:** `a9b8f0d4-dc8c-428a-ac05-8cbd29fc41e4`
- **File:** `lịch-sử-giao-dịch.json`
- **Description:** Bảng lưu trữ dữ liệu log sự kiện lọc và gán nhãn của người dùng trên màn hình lịch sử giao dịch (LSG
- **Tables (1):**
  - `momovn-prod.MBI_DA.LSGD_CTGD_FILTER_LABEL_RAW`

### ✓ MiMir Performance
- **ID:** `0affe82b-83ee-47f6-81e3-8a44e74db5f3`
- **File:** `mimir-performance.json`
- **Description:** Dữ liệu người dùng MiMir - Dữ liệu & AI Chatbot
- **Tables (4):**
  - `momovn-mimir.MIMIR.MIMIR_CONVERSATION_LOG_VER2_PROD`
  - `momovn-mimir.MIMIR.MIMIR_USER_LOG_VER2_PROD`
  - `momovn-mimir.MIMIR.MIMIR_DOMAIN_LOG_VER2_PROD`
  - `momovn-mimir.MIMIR.MIMIR_DOMAIN_PERMISSION_LOG_VER2_PROD`


## Payment

### ✓ BU Payment:  P2P QUY NHOM SELF SERVE ANALYTICS
- **ID:** `58aa0bc4-eda4-4442-9d64-9f67d36a54ca`
- **File:** `bu-payment-p2p-quy-nhom-self-serve-analytics.json`
- **Tables (0):**
  - `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_PAYMENT_SOF`
  - `project-5400504384186300846.MBI_DA.fact_quy_owner_monthly`
  - `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND_TRANSFER`
  - `project-5400504384186300846.MBI_DA.adhoc_momo_coin_balance_yester_day`
  - `project-5400504384186300846.MBI_DA.adhoc_hang_truong_survey_adopt_20260305`
  - `project-5400504384186300846.MBI_DA.adhoc_hang_truong_survey_drop_20260305`

### ✓ BU Payment: Airtime
- **ID:** `3165cb58-8f0a-4c7d-96e6-ae0b189ff572`
- **File:** `bu-payment-airtime.json`
- **Description:** records all transaction (exclude blacklist user), demographic, user segment of Airtime Service since
- **Tables (3):**
  - `project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_SEGMENT_USER`
  - `project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_DETAILS`
  - `project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_MAU_BY_1ST_TRAN_ALL`

### ✓ BU Payment: Airtime (Non Sensitive)
- **ID:** `63e7a2bc-2f9d-4b8f-9a1d-03c5ea7e16e8`
- **File:** `bu-payment-airtime-non-sensitive.json`
- **Description:** records all transaction (exclude blacklist user), demographic, user segment of Airtime Service since
- **Tables (0):**
  - *(no tables or schema_ddl empty)*

### ✓ BU Payment: Billpay - Business metrics
- **ID:** `28214cde-da94-48ef-9039-00fa6f448da7`
- **File:** `bu-payment-billpay-business-metrics.json`
- **Description:** Records all business information of Billpay services (including mau, transaction details, user demog
- **Tables (3):**
  - `project-5400504384186300846.BU_UTILITIES_TELCO.MIMIR_BILLPAY_DETAILS`
  - `momovn-prod.BU_UTILITIES_TELCO.USER_JOURNEY_BILLPAY_PIVOT`
  - `momovn-prod.BU_UTILITIES_TELCO.BILLPAY_ADD_BILLS`

### ✓ BU Payment: Billpay - Business metrics (Non Sensitive)
- **ID:** `f9ccec9b-d24b-47b8-9e81-1805aa865726`
- **File:** `bu-payment-billpay-business-metrics-non-sensitive.json`
- **Description:** Records all business information of Billpay services (including mau, transaction details, user demog
- **Tables (1):**
  - `project-5400504384186300846.BU_UTILITIES_TELCO.MIMIR_BILLPAY_DETAILS`

### ✓ BU Payment: DLS ONLINE
- **ID:** `ca851de3-b3cb-42bf-96d6-979acde0a7da`
- **File:** `bu-payment-dls-online.json`
- **Description:** Chi tiết giao dịch Daily Life Service (DLS) online sử dụng trên MoMo kể từ năm 2024
- **Tables (7):**
  - `momovn-prod.BU_ECOM.DLS_ONLINE_NFC_INFO`
  - `momovn-prod.BU_ECOM.TOKEN_TRANS_NUM_MERCHANT_CATE_BINDING`
  - `momovn-prod.BU_ECOM.DLS_GIFT_V3_VER2`
  - `momovn-prod.BU_ECOM.CAISHEN_CASH_BACK_TRANSACTION`
  - `momovn-prod.BU_ECOM.TOKEN_TRANS`
  - `momovn-prod.BU_ECOM.MAU_BY_USECASE_VER2`
  - `momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1`

### ✓ BU Payment: Data
- **ID:** `c210420f-d014-4463-bcb9-c9e4a38c0963`
- **File:** `bu-payment-data.json`
- **Description:** All detailed transaction of service Data since 2021
- **Tables (0):**
  - `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS`

### ✓ BU Payment: Data (Non Sensitive)
- **ID:** `be004a0c-5e7c-442d-ab51-a7026eed5433`
- **File:** `bu-payment-data-non-sensitive.json`
- **Description:** All detailed transaction of service Data since 2021
- **Tables (2):**
  - `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS`
  - `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_SEGMENT_USER`

### ✓ BU Payment: EPS-TOPBRAND
- **ID:** `72fbb966-0b9b-4205-a433-b14fca48597d`
- **File:** `bu-payment-eps-topbrand.json`
- **Description:** Domain này tập trung vào user và merchant thuộc Topband (Phòng ban là EPS: Enterprise project soluti
- **Tables (0):**
  - `project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION`
  - `momovn-prod.MBI_DA.F_OFFLINE_GIFT_REDEEM`
  - `momovn-prod.MBI_DA.F_OFFLINE_GIFT_APPLICABLE`
  - `project-5400504384186300846.MBI_DA.D_EPS_USER_TYPE_SOF_MONTHLY`
  - `project-5400504384186300846.MBI_DA.DM_EPS_USER_TYPE_MONTHLY`
  - `project-5400504384186300846.MBI_DA.DM_EPS_SKU_BY_BRAND`
  - `momovn-prod.MBI_DA.DM_EPS_VIETQR_IMPACT_SIZE`
  - `project-5400504384186300846.MBI_DA.NHI_CDO_EPS_RECEIVER_UPLIFT`
  - `project-5400504384186300846.MBI_DA.ORDER_MINIAPP`

### ✓ BU Payment: M4B HUB
- **ID:** `5d47c7cc-f998-41c5-ab4c-5caa4b441743`
- **File:** `bu-payment-m4b-hub.json`
- **Description:** Domain này chứa data engagement của merchant vào M4B (Sẽ bao gồm các touch point khác thuộc M4B quản
- **Tables (11):**
  - *(no tables or schema_ddl empty)*

### ✓ BU Payment: OFFLINE M4B ENGAGEMENT
- **ID:** `68f8f83f-cd21-4efc-9743-5c238b325818`
- **File:** `bu-payment-offline-m4b-engagement.json`
- **Description:** A DATASET containing processed information about offline payment
- **Tables (1):**
  - `momovn-prod.MBI_DA.kmean-feature-20251012-firstsaved`

### ✓ BU Payment: P2P AIO_QR
- **ID:** `05cf9a74-c3c0-4b95-923c-71c8d42ed8aa`
- **File:** `bu-payment-p2p-aio-qr.json`
- **Description:** Records all transaction of P2P AIO_QR
- **Tables (0):**
  - `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ORIGINAL_TABLE`
  - `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ACQUISITION_BY_SOURCE_TABLE`
  - `momovn-prod.MBI_DA.LOAN_P2P_RECEIVER_SEGMENT_ALL`
  - `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_FUNNEL_RECEIVING_SCREEN_AGGREGATION`
  - `momovn-prod.MBI_DA.LOAN_P2P_TOTAL_RAW`
  - `momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU`
  - `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_FUNNEL_ACTION_WITH_QR`

### ✓ BU Payment: P2P ERROR
- **ID:** `9e15b462-aa3d-4bdc-80ff-dc86a6f83837`
- **File:** `bu-payment-p2p-error.json`
- **Description:** Dữ liệu về các event lỗi và giao dịch lỗi của người dùng dịch vụ chuyển tiền P2P
- **Tables (0):**
  - `momovn-prod.MBI_DA.P2P_ERROR_ALL`

### ✓ BU Payment: P2P OVERALL
- **ID:** `838c1168-492d-4751-995d-d356dd8b9a42`
- **File:** `bu-payment-p2p-overall.json`
- **Description:** Hiện tại đang available data về
- Nguồn tiền (SOF) của user W2W/W2B
- User Type của user P2P
- Recei
- **Tables (0):**
  - `momovn-prod.MBI_DA.P2P_SOF_ALL_RAW`
  - `momovn-prod.MBI_DA.P2P_TOTAL_USER_TYPE`
  - `momovn-prod.MBI_DA.P2P_TOTAL_SENDER_RECEIVER_RAW`

### ✓ BU Payment: P2P QUYNHOM
- **ID:** `3a52651b-b3a6-4865-8a11-7b06ea99be24`
- **File:** `bu-payment-p2p-quynhom.json`
- **Description:** Domain này bao gồm những thông tin sau của sản phẩm QUỸ (NHÓM)
(1) transaction details: Lịch sử giao
- **Tables (7):**
  - `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND_TRANSFER`
  - `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_ENDING_BALANCE_BY_FUNDID_FULL_daily`
  - `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_EVENT_ALL_STEP_BY_TYPE`
  - `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND`
  - `project-5400504384186300846.MBI_DA.flat_quy_gift`
  - `project-5400504384186300846.MBI_DA.fact_quy_owner_monthly`
  - `momovn-prod.MBI_DA.P2P_FUND_SURVEY_SOF`

### ✓ BU Payment: P2P RECEIVER GENERAL
- **ID:** `390df75f-43e9-4caa-a418-0959e0691f73`
- **File:** `bu-payment-p2p-receiver-general.json`
- **Description:** Bao gồm các thông tin nhận tiền về MoMo (các luồng TITAN, QR, W2W)
- **Tables (0):**
  - `momovn-prod.MBI_DA.P2P_RECEIVER_PERFORMANCE`
  - `momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU`
  - `momovn-prod.MBI_DA.TUAN_ALL_RECEIVER_USER_TYPE`
  - `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_TYPE`
  - `momovn-prod.MBI_DA.P2P_RECEIVER_TITAN_MONTHLY_RECEIVER`
  - `momovn-prod.MBI_DA.TUAN_RECEIVER_MOMO_REWARD_MISSION`

### ✓ BU Payment: P2P REVENUE
- **ID:** `67150ae4-a5a7-47b0-88a1-5a75e6635988`
- **File:** `bu-payment-p2p-revenue.json`
- **Description:** Tất cả các giao dịch để tính revenue cho p2p
- **Tables (3):**
  - `momovn-prod.MBI_DA.HOANG_P2P_PROJECT_W2B_FEE_RECEIVER_SEGMENTS`
  - `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
  - `momovn-prod.MBI_DA.MINH_P2P_BLACKLIST_TEMP`

### ✓ BU Payment: P2P SOCIAL
- **ID:** `a7a4abe7-ba98-48dd-b9f0-8d0752c75910`
- **File:** `bu-payment-p2p-social.json`
- **Description:** Dữ liệu liên quan các sản phẩm Social của P2P
- **Tables (4):**
  - `momovn-prod.MBI_DA.P2P_SOCIAL_LUCKYMONEY_TRANS_RAW`
  - `momovn-prod.MBI_DA.P2P_SOCIAL_TABTOI_PERFORMANCE_RAW`
  - `momovn-prod.MBI_DA.P2P_TOTAL_SENDER_RECEIVER_RAW`
  - `momovn-prod.MBI_DA.P2P_DEVICE_TYPE`

### ✓ BU Payment: P2P W2B
- **ID:** `526c040d-6956-4cb9-8919-87828de05cfc`
- **File:** `bu-payment-p2p-w2b.json`
- **Description:** records all transaction of P2P W2B
- **Tables (0):**
  - `momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING`
  - `momovn-prod.MBI_DA.LOAN_P2P_W2B_ERROR_TRANS_RAW`
  - `momovn-prod.MBI_DA.TUAN_P2P_W2B_EXC_VIETQR_ACQUISITION_ALL_SOURCES`
  - `momovn-prod.MBI_DA.LOAN_P2P_W2B_USER_TYPE`
  - `momovn-prod.MBI_DA.P2P_W2B_USER_NEW`
  - `momovn-prod.MBI_DA.P2P_W2B_USER_RETENTION_TYPE`
  - `momovn-prod.MBI_DA.HA_P2P_GIFT`
  - `momovn-prod.MBI_DA.LOAN_2022_NEWTOMOMO_usecase`

### ✓ BU Payment: P2P W2W
- **ID:** `f3d8838b-5f96-4f78-8c39-2b146978dbd8`
- **File:** `bu-payment-p2p-w2w.json`
- **Description:** Records all transaction of P2P W2W
- **Tables (0):**
  - `momovn-prod.MBI_DA.LOAN_P2P_W2W_RAW_MAPPING`
  - `momovn-prod.MBI_DA.LOAN_P2P_W2W_USER_TYPE`
  - `momovn-prod.MBI_DA.LOAN_P2P_W2W_ERROR_TRANS_MAPPING`
  - `momovn-prod.MBI_DA.P2P_DEVICE_TYPE`
  - `momovn-prod.MBI_DA.P2P_W2W_USER_RETENTION_TYPE`
  - `momovn-prod.MBI_DA.HOANG_P2P_W2W_ACQUISITION_SOURCE_FOR_TRACKING`
  - `momovn-prod.MBI_DA.LOAN_2022_NEWTOMOMO_usecase`
  - `momovn-prod.MBI_DA.HA_P2P_GIFT`

### ✓ BU Payment: SME OFFLINE OPS
- **ID:** `4ece5632-02ec-4d9d-9ea9-70ed5d6cc1ed`
- **File:** `bu-payment-sme-offline-ops.json`
- **Description:** Domain này để tạo các product AI cho 1 số task adhoc offline
- **Tables (0):**
  - *(no tables or schema_ddl empty)*

### ✓ BU Payment: SME OFFLINE PAYMENT
- **ID:** `03f0b56d-7b56-49d8-9073-6bb94e564fe2`
- **File:** `bu-payment-sme-offline-payment.json`
- **Description:** A DATASET containing processed information about merchant payment and merchant profile
- **Tables (6):**
  - `project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION`
  - `project-5400504384186300846.MBI_DA.DM_OFF_STORE_PROFILE`
  - `project-5400504384186300846.MBI_DA.DM_OFF_STORE_MONTHLY_PERFORMANCE`
  - `project-5400504384186300846.MBI_DA.DM_OFF_MERCHANT_MONTHLY_PERFORMANCE`
  - `project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_ENTRY_POINT_JOURNEY`
  - `project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_INAPP_TRANSACTION`

### ✓ BU Payment: SUPPLIER TRACKING
- **ID:** `0c367c81-99d6-4b01-90e2-e7bab0b77677`
- **File:** `bu-payment-supplier-tracking.json`
- **Description:** Theo dõi performance của các nhà cung cấp Telco
- **Tables (1):**
  - *(no tables or schema_ddl empty)*

### ✓ BU Payment: Telco Funnel
- **ID:** `fdc4e81a-0f8e-4412-b5b4-1602705daae6`
- **File:** `bu-payment-telco-funnel.json`
- **Description:** Funnel cơ bản của user Airtime và Data.
Funnel cơ bản của user SIM.
Chỉ sử dụng khi tính về event, t
- **Tables (0):**
  - `momovn-prod.BU_UTILITIES_TELCO.FULL_FUNNEL_TELCO_OPTIMIZE`
  - `project-5400504384186300846.BU_UTILITIES_TELCO.FULL_FUNNEL_SIM_CDOVTTI-189`

### ✓ BU Payment: Transaction MoMo
- **ID:** `e5beb7b6-4273-47ff-9755-a5bcf8d51b97`
- **File:** `bu-payment-transaction-momo.json`
- **Description:** Lưu trữ thông tin cơ bản các giao dịch của ví điện tử MoMo 
- **Tables (0):**
  - `project-5400504384186300846.REPORT.DAILY_PAID_USER_TRANS_VER2`

### ✓ BU Payment: VTTI Overview
- **ID:** `1d4022aa-85c0-47d9-8f53-e346a8e74437`
- **File:** `bu-payment-vtti-overview.json`
- **Description:** Tất cả giao dịch của VTTI (không có revenue): Airtime, Data, Billpay, Dịch vụ Công từ 2017 đến hiện 
- **Tables (1):**
  - `project-5400504384186300846.BU_UTILITIES_TELCO.VTTI_TRANID_ALL`

### ✓ [PAYMENT PLATFORM] Electronic Data Capture
- **ID:** `fa727a68-0970-4e47-b52b-ed5b5cb7451d`
- **File:** `payment-platform-electronic-data-capture.json`
- **Description:** Bảng fact lưu trữ toàn bộ giao dịch thanh toán qua thiết bị EDC (Electronic Data Capture) tại các me
- **Tables (1):**
  - `momovn-prod.MBI_DA.THAI_CDO_EDC_PAYMENT`


## User Trust / Security

### ✓ User Trust: Security Product - Check Scam
- **ID:** `4f353121-0b27-437a-9746-e4b8897ad03b`
- **File:** `user-trust-security-product-check-scam.json`
- **Description:** Consolidates scam report data from multiple sources (both inside and outside MoMo), including MoMo u
- **Tables (2):**
  - `project-5400504384186300846.SHERLOCK.CHECK_SCAM_IDENTIFIER_SEARCH_YYYYMMDD`
  - `project-5400504384186300846.SHERLOCK.CHECK_SCAM_IDENTIFIER_SEARCH_CHANGE_YYYYMMDD`

### ✓ User Trust: Security Product - Report Scam 
- **ID:** `8676e18c-ed5e-401e-8e78-fc08b26a69ad`
- **File:** `user-trust-security-product-report-scam.json`
- **Description:** This domain stores app-collected user scam reports—incidents in or outside MoMo—with basic context (
- **Tables (1):**
  - `momovn-prod.SHERLOCK.REPORT_SCAM_USER_REPORT_DATA`
