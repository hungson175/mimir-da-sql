# Domain: BU FS: Vay Nhanh

## Identity
- **Domain ID:** `bb231763-b11c-45c6-9b0d-eb6d24588e3d`
- **Description:** Data liên quan đến giải ngân, traffic Vaynhanh
- **Tables:** 3
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo liÃªn quan Äáº¿n khoáº£n vay. | 31438382, 4422885, 13504368 |
| LENDER_ID | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i cho vay trong khoáº£n vay nhanh. | AMBER, VIET_CREDIT, MCREDIT |
| LOAN_ID | STRING | MÃ£ Äá»nh danh duy nháº¥t cá»§a má»i khoáº£n vay. | MM20122437806, MM21010486236, MM21010499852 |
| CREATED_TIME | TIMESTAMP | Thá»i gian khoáº£n vay ÄÆ°á»£c táº¡o ra. | 2024-04-08 08:19:54+00, 2021-04-08 03:07:34+00, 2023-02-03 03:34:13+00 |
| CREATED_DATE | DATE | NgÃ y táº¡o khoáº£n vay. | 2022-01-26, 2022-01-27, 2022-09-07 |
| SUBMITTED_TIME | TIMESTAMP | Thá»i gian gá»­i ÄÆ¡n vay. | 2022-01-26 16:16:04+00, 2022-08-04 09:15:47+00, 2021-11-26 03:09:57+00 |
| SUBMITTED_DATE | DATE | NgÃ y gá»­i ÄÆ¡n vay. | 2022-01-26, 2022-01-27, 2022-09-07 |
| DISBURSED_TIME | TIMESTAMP | Thá»i gian khoáº£n vay ÄÆ°á»£c giáº£i ngÃ¢n. | 2022-10-18 10:33:32+00, 2022-12-01 17:02:19+00, 2022-10-15 05:15:14+00 |
| DISBURSED_DATE | DATE | NgÃ y giáº£i ngÃ¢n khoáº£n vay. | 2025-06-05, 2025-10-10, 2025-06-10 |
| LIQUIDATED_TIME | TIMESTAMP | Thá»i gian thanh lÃ½ khoáº£n vay. | 2023-07-20 08:55:48+00, 2023-08-17 04:17:48+00, 2023-08-24 02:33:40+00 |
| LIQUIDATED_DATE | DATE | NgÃ y thanh lÃ½ khoáº£n vay. | 2025-10-06, 2025-11-05, 2025-11-10 |
| MOMO_CREDIT_SCORE | FLOAT | Äiá»m tÃ­n dá»¥ng cá»§a MoMo cho ngÆ°á»i vay. | 750, 751, 752 |
| STATUS | STRING | Tráº¡ng thÃ¡i hiá»n táº¡i cá»§a khoáº£n vay. | LIQUIDATED, SUCCESS, CANCELLED, DISBURSED, PARTNER REJECTED |
| REJECTED_REASON | STRING | LÃ½ do tá»« chá»i ÄÆ¡n vay náº¿u cÃ³. | RJ_BLACKLIST_AMBER_VGFT, 04 FASTMONEY_REF_BLACKLIST, RJ_BAD_DEBT, 02 CHECK_FRAUD... |
| LOAN_AMOUNT | FLOAT | Sá» tiá»n ÄÆ°á»£c vay. | 6000000, 15000000, 10000000 |
| TENOR | FLOAT | Ká»³ háº¡n cá»§a khoáº£n vay. | 6, 9, 12 |
| DISBURSED_AMOUNT | FLOAT | Sá» tiá»n ÄÃ£ ÄÆ°á»£c giáº£i ngÃ¢n. | 6000000, 15000000, 10000000 |
| FIRST_DUE_DATE | DATE | NgÃ y Äáº¿n háº¡n Äáº§u tiÃªn cá»§a khoáº£n vay. | 2025-12-05, 2025-12-06, 2025-12-07 |
| EMI | FLOAT | Sá» tiá»n tráº£ gÃ³p Äá»nh ká»³. | 1247000, 1252000, 1240000 |
| PROCESS_TYPE | STRING | Loáº¡i quy trÃ¬nh Ã¡p dá»¥ng cho khoáº£n vay. | First loan, Re-loan |
| PROCESS_TYPE_BY_LENDER | STRING | Loáº¡i quy trÃ¬nh do ngÆ°á»i cho vay quyáº¿t Äá»nh. | First loan, Re-loan |
| DISBURSED_COUNT_TIME | INTEGER | Sá» láº§n tÃ­nh giáº£i ngÃ¢n. | 1, 2, 3 |
| DISBURSED_COUNT_TIME_BY_LENDER | INTEGER | Sá» láº§n tÃ­nh giáº£i ngÃ¢n do ngÆ°á»i cho vay quyáº¿t Äá»nh. | 1, 2, 3 |
| SEGMENT_USER | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng ban Äáº§u. | REPEATED, RELOAN, NEW, FM_MERCHANT_NEW, FM_STUDENT_NEW |
| FINAL_SEGMENT_USER | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng cuá»i cÃ¹ng sau khi xá»­ lÃ½. | NEWLOAN, RELOAN, REPEATED, FM_MERCHANT_NEW, FM_STUDENT_NEW |

### momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| ETL_DATE | DATE | NgÃ y trÃ­ch xuáº¥t, chuyá»n Äá»i vÃ  táº£i dá»¯ liá»u. | 2025-08-04, 2025-11-10, 2025-10-10 |
| EVENT_TIME | TIMESTAMP | Thá»i gian diá»n ra sá»± kiá»n truy cáº­p dá»ch vá»¥ vay nhanh. | 2025-04-06 17:02:15.836+00, 2025-08-04 15:37:31.767+00, 2025-08-04 09:11:31.267+... |
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo cá»§a Äáº¡i lÃ½. | 25836034, 70915932, 70335833 |
| ACCESSED_SOURCE | STRING | Nguá»n gá»c truy cáº­p vÃ o dá»ch vá»¥ vay nhanh. | tabbar_home, app_all_service_top, financial_hub, momo_passport, search_multiple |
| momo_session_id_v2 | STRING | ID phiÃªn giao dá»ch cá»§a ngÆ°á»i dÃ¹ng MoMo khi truy cáº­p dá»ch vá»¥ vay nhanh. | 34C4C79B-9AB9-4E28-A991-E53026EFCCD6, 8F8C7C3F-DE54-482B-9E31-5306BD407630, 7F11... |
| WHITELIST_CHECK | STRING | Kiá»m tra danh sÃ¡ch tráº¯ng (whitelist) cá»§a ngÆ°á»i dÃ¹ng. | 1 IN WHITELIST, 2 NOT IN WHITELIST |
| USER_TYPE | STRING | Loáº¡i ngÆ°á»i dÃ¹ng truy cáº­p dá»ch vá»¥ vay nhanh. | 1 First loan, 2 Re-loan, 3 UNKNOWN |
| SCORE_VERSION | STRING | PhiÃªn báº£n Äiá»m sá» tÃ­n dá»¥ng ÄÆ°á»£c sá»­ dá»¥ng. | MOMO_CREDIT_SCORE_FMPL_V6, MOMO_CREDIT_SCORE_FMPL_V7, MOMO_CREDIT_SCORE_FMPL_V5 |
| CREDIT_SCORE_RANGE | STRING | Pháº¡m vi Äiá»m sá» tÃ­n dá»¥ng cá»§a ngÆ°á»i dÃ¹ng. | 01 < 606, 08 666 - 690, 09 691 - 715, 06 642 - 655, 07 656 - 669 |

### momovn-prod.BU_FI.BAOTU_VAYNHANH_USER_ACCESSED

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| ETL_DATE | DATE | NgÃ y thá»±c hiá»n quy trÃ¬nh ETL. |  |
| EVENT_TIME | TIMESTAMP | Thá»i gian xáº£y ra sá»± kiá»n truy cáº­p. |  |
| momo_session_id_v2 | STRING | MÃ£ phiÃªn lÃ m viá»c cá»§a ngÆ°á»i dÃ¹ng trÃªn á»©ng dá»¥ng MoMo. |  |
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo cá»§a ngÆ°á»i dÃ¹ng truy cáº­p. |  |
| WHITELIST_CHECK | STRING | Kiá»m tra tráº¡ng thÃ¡i danh sÃ¡ch tráº¯ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| SCORE_VERSION | STRING | PhiÃªn báº£n cá»§a há» thá»ng cháº¥m Äiá»m ÄÆ°á»£c sá»­ dá»¥ng. |  |
| CREDIT_SCORE_RANGE | STRING | Pháº¡m vi Äiá»m tÃ­n dá»¥ng cá»§a ngÆ°á»i dÃ¹ng. |  |
| ROUTING_LENDER | STRING | NhÃ  cho vay ÄÆ°á»£c phÃ¢n luá»ng. |  |
| USER_TYPE | STRING | Loáº¡i hÃ¬nh ngÆ°á»i dÃ¹ng truy cáº­p. |  |
| USER_TYPE_BY_LENDER | STRING | Loáº¡i hÃ¬nh ngÆ°á»i dÃ¹ng ÄÆ°á»£c ÄÃ¡nh giÃ¡ bá»i nhÃ  cho vay. |  |

## Domain Knowledge (from Mimir)

- A30 = tập user có truy cập vào Vay Nhanh trong vòng 30 ngày gần nhất. A60 = tập user có truy cập vào Vay Nhanh trong vòng 60 ngày gần nhất. A90 = tập user có truy cập vào Vay Nhanh trong vòng 90 ngày gần nhất.

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
