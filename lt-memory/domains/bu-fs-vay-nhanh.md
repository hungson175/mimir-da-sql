# BU FS: Vay Nhanh

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `bb231763-b11c-45c6-9b0d-eb6d24588e3d`

## Description
Data liên quan đến giải ngân, traffic Vaynhanh

## Tables

### `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo liên quan đến khoản vay. | 31438382, 4422885, 13504368 |
| `LENDER_ID` | STRING | Mã định danh của người cho vay trong khoản vay nhanh. | AMBER, VIET_CREDIT, MCREDIT |
| `LOAN_ID` | STRING | Mã định danh duy nhất của mỗi khoản vay. | MM20122437806, MM21010486236, MM21010499852 |
| `CREATED_TIME` | TIMESTAMP | Thời gian khoản vay được tạo ra. | 2024-04-08 08:19:54+00, 2021-04-08 03:07:34+00, 2023-02-03 03:34:13+00 |
| `CREATED_DATE` | DATE | Ngày tạo khoản vay. | 2022-01-26, 2022-01-27, 2022-09-07 |
| `SUBMITTED_TIME` | TIMESTAMP | Thời gian gửi đơn vay. | 2022-01-26 16:16:04+00, 2022-08-04 09:15:47+00, 2021-11-26 03:09:57+00 |
| `SUBMITTED_DATE` | DATE | Ngày gửi đơn vay. | 2022-01-26, 2022-01-27, 2022-09-07 |
| `DISBURSED_TIME` | TIMESTAMP | Thời gian khoản vay được giải ngân. | 2022-10-18 10:33:32+00, 2022-12-01 17:02:19+00, 2022-10-15 05:15:14+00 |
| `DISBURSED_DATE` | DATE | Ngày giải ngân khoản vay. | 2025-06-05, 2025-10-10, 2025-06-10 |
| `LIQUIDATED_TIME` | TIMESTAMP | Thời gian thanh lý khoản vay. | 2023-07-20 08:55:48+00, 2023-08-17 04:17:48+00, 2023-08-24 02:33:40+00 |
| `LIQUIDATED_DATE` | DATE | Ngày thanh lý khoản vay. | 2025-10-06, 2025-11-05, 2025-11-10 |
| `MOMO_CREDIT_SCORE` | FLOAT | Điểm tín dụng của MoMo cho người vay. | 750, 751, 752 |
| `STATUS` | STRING | Trạng thái hiện tại của khoản vay. | LIQUIDATED, SUCCESS, CANCELLED |
| `REJECTED_REASON` | STRING | Lý do từ chối đơn vay nếu có. | RJ_BLACKLIST_AMBER_VGFT, 04 FASTMONEY_REF_BLACKLIST, RJ_BAD_DEBT |
| `LOAN_AMOUNT` | FLOAT | Số tiền được vay. | 6000000, 15000000, 10000000 |
| `TENOR` | FLOAT | Kỳ hạn của khoản vay. | 6, 9, 12 |
| `DISBURSED_AMOUNT` | FLOAT | Số tiền đã được giải ngân. | 6000000, 15000000, 10000000 |
| `FIRST_DUE_DATE` | DATE | Ngày đến hạn đầu tiên của khoản vay. | 2025-12-05, 2025-12-06, 2025-12-07 |
| `EMI` | FLOAT | Số tiền trả góp định kỳ. | 1247000, 1252000, 1240000 |
| `PROCESS_TYPE` | STRING | Loại quy trình áp dụng cho khoản vay. | First loan, Re-loan |
| `PROCESS_TYPE_BY_LENDER` | STRING | Loại quy trình do người cho vay quyết định. | First loan, Re-loan |
| `DISBURSED_COUNT_TIME` | INTEGER | Số lần tính giải ngân. | 1, 2, 3 |
| `DISBURSED_COUNT_TIME_BY_LENDER` | INTEGER | Số lần tính giải ngân do người cho vay quyết định. | 1, 2, 3 |
| `SEGMENT_USER` | STRING | Phân loại người dùng ban đầu. | REPEATED, RELOAN, NEW |
| `FINAL_SEGMENT_USER` | STRING | Phân loại người dùng cuối cùng sau khi xử lý. | NEWLOAN, RELOAN, REPEATED |

### `momovn-prod.BU_FI.BAOTU_VAYNHANH_ENTRY_POINT`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ETL_DATE` | DATE | Ngày trích xuất, chuyển đổi và tải dữ liệu. | 2025-08-04, 2025-11-10, 2025-10-10 |
| `EVENT_TIME` | TIMESTAMP | Thời gian diễn ra sự kiện truy cập dịch vụ vay nhanh. | 2025-04-06 17:02:15.836+00, 2025-08-04 15:37:31.767+00, 2025-08-04 09:11:31.267+00 |
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo của đại lý. | 25836034, 70915932, 70335833 |
| `ACCESSED_SOURCE` | STRING | Nguồn gốc truy cập vào dịch vụ vay nhanh. | tabbar_home, app_all_service_top, financial_hub |
| `momo_session_id_v2` | STRING | ID phiên giao dịch của người dùng MoMo khi truy cập dịch vụ vay nhanh. | 34C4C79B-9AB9-4E28-A991-E53026EFCCD6, 8F8C7C3F-DE54-482B-9E31-5306BD407630, 7F1155BF-0E53-4F51-9F02-BF78E26D7BEA |
| `WHITELIST_CHECK` | STRING | Kiểm tra danh sách trắng (whitelist) của người dùng. | 1 IN WHITELIST, 2 NOT IN WHITELIST |
| `USER_TYPE` | STRING | Loại người dùng truy cập dịch vụ vay nhanh. | 1 First loan, 2 Re-loan, 3 UNKNOWN |
| `SCORE_VERSION` | STRING | Phiên bản điểm số tín dụng được sử dụng. | MOMO_CREDIT_SCORE_FMPL_V6, MOMO_CREDIT_SCORE_FMPL_V7, MOMO_CREDIT_SCORE_FMPL_V5 |
| `CREDIT_SCORE_RANGE` | STRING | Phạm vi điểm số tín dụng của người dùng. | 01 < 606, 08 666 - 690, 09 691 - 715 |

### `momovn-prod.BU_FI.BAOTU_VAYNHANH_USER_ACCESSED`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ETL_DATE` | DATE | Ngày thực hiện quy trình ETL. | — |
| `EVENT_TIME` | TIMESTAMP | Thời gian xảy ra sự kiện truy cập. | — |
| `momo_session_id_v2` | STRING | Mã phiên làm việc của người dùng trên ứng dụng MoMo. | — |
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo của người dùng truy cập. | — |
| `WHITELIST_CHECK` | STRING | Kiểm tra trạng thái danh sách trắng của người dùng. | — |
| `SCORE_VERSION` | STRING | Phiên bản của hệ thống chấm điểm được sử dụng. | — |
| `CREDIT_SCORE_RANGE` | STRING | Phạm vi điểm tín dụng của người dùng. | — |
| `ROUTING_LENDER` | STRING | Nhà cho vay được phân luồng. | — |
| `USER_TYPE` | STRING | Loại hình người dùng truy cập. | — |
| `USER_TYPE_BY_LENDER` | STRING | Loại hình người dùng được đánh giá bởi nhà cho vay. | — |

## Memory
*1 entries — user-trained knowledge*

1. A30 = tập user có truy cập vào Vay Nhanh trong vòng 30 ngày gần nhất. A60 = tập user có truy cập vào Vay Nhanh trong vòng 60 ngày gần nhất. A90 = tập user có truy cập vào Vay Nhanh trong vòng 90 ngày gần nhất. _2025-12-03_
