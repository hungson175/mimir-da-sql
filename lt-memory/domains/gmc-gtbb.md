# GMC: GTBB

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `16f33834-123a-4fef-aaeb-7e71da9346d6`

## Description
Scheme giới thiệu bạn bè ở momo

## Tables

### `momovn-growth-shared.GMC_SHARE.GMC_SEMANTIC_GTBB_INFO`
> Bảng này chứa thông tin chi tiết liên quan đến GMC Semantic GTBB (Growth Team Big Bet) với mục đích theo dõi thông tin phát triển và tăng trưởng. Dữ liệu từ bảng này có thể được tận dụng cho các mục đích như phân tích hoạt động của đại lý qua các tháng, đánh giá hiệu quả các chương trình khuyến mãi dựa trên thông tin mã khuyến mãi, và xác định các kênh phát triển chính.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `B_PHONE` | — | Số điện thoại của người dùng (B). | — |
| `AX_PHONE` | — | Số điện thoại của người dùng (AX). | — |
| `AX_AGENT_ID` | — | Mã định danh cho ví MoMo của người dùng (AX). | 36542111, 53908432, 55506296 |
| `new_to_AX_in_month` | — | Thông tin mới về người dùng trong tháng dành cho AX. | Retained AX, New to AX |
| `TYPE_GTBB_LIFE_TIME` | — | Loại GTBB trong suốt vòng đời. | 07. >50 Lifetime, 01. 1 Lifetime, 02. 2-3 Lifetime |
| `TYPE_GTBB_IN_MONTH` | — | Loại GTBB trong tháng. | 01. 1 in month, 07. >50 in month, 02. 2-3 in month |
| `TYPE_RETENT_AX` | — | Loại giữ chân người dùng đối với AX. | NEW, ACTIVE, REACTIVE |
| `TYPE_AX_PER_B` | — | Loại của AX theo B. | 1, 2, 3 |
| `B_AGENT_ID` | — | Mã định danh cho ví MoMo của người dùng (B). | 62966526, 44840455, 19309980 |
| `FIRST_DATETIME_B` | — | Thời điểm diễn ra đầu tiên của người dùng (B). | 2022-08-18 11:40:06+00, 2023-07-23 14:28:21+00, 2021-08-27 18:02:39+00 |
| `FIRST_DATE_B` | — | Ngày diễn ra đầu tiên của người dùng (B). | 2020-03-22, 2020-02-14, 2021-06-28 |
| `PROMOTION_ID` | — | Mã khuyến mãi áp dụng cho người dùng. | 163, 44, 98 |
| `CHANNEL` | — | Kênh phát triển được sử dụng. | GTBB_DEFAULT, GTBB_REFERRAL_WEB, GTBB_OTHERS |
| `B_BANK` | — | Ngân hàng liên kết với người dùng (B). | VCB, BIDV, VTB |
| `AX_AGENTID_GET_GIFT` | — | Mã định danh của AX nhận quà. | 55506296, 36542111, 42779210 |
| `B_AGENTID_GET_GIFT` | — | Mã định danh của B nhận quà. | 46020306, 45433816, 39453006 |
| `GROUP_MAU` | — | Nhóm MAU (Monthly Active Users). | NOT FRAUD-NOT REMOVE MAU, FRAUD-REMOVED MAU, FRAUD-NOT REMOVE MAU |

### `momovn-prod.REPORT.GMC_CS_CASE_CHECK_GTBB`
> Bảng này chứa thông tin báo cáo về các trường hợp kiểm tra GMC CS tại GTBB. Thông tin từ bảng này có thể được sử dụng để: 
 - Theo dõi và phân tích các tác động của chương trình khuyến mãi (PROMOTION_ID) đến các trường hợp 
 - Nghiên cứu và đánh giá ngân hàng liên quan (BANK) 
 - Kiểm tra mã code gia nhập (DATE_ENTERCODE) trong từng báo cáo

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATE_REPORT` | — | Ngày báo cáo các trường hợp kiểm tra trong hệ thống GTBB | — |
| `BANK` | — | Tên ngân hàng liên quan đến từng trường hợp trong báo cáo | VCB, TCB |
| `AX_AGENT_ID` | — | Mã định danh của đối tượng AX trong báo cáo | — |
| `B_AGENT_ID` | — | Mã định danh của đối tượng B trong báo cáo | 47746100 |
| `PROMOTION_ID` | — | Mã chương trình khuyến mãi liên quan đến báo cáo | 98 |
| `DATE_ENTERCODE` | — | Ngày nhập mã code trong hệ thống để báo cáo | 2025-10-24 09:50:16\t |
| `DESCRIPTION` | — | Mô tả chi tiết về từng trường hợp trong báo cáo | — |

## Memory
*4 entries — user-trained knowledge*

1. Khi người dùng hỏi về "đủ điều kiện trả thưởng", hãy kiểm tra các cột sau trong bảng GMC_SEMANTIC_GTBB_INFO: GROUP_MAU, TYPE_GTBB_LIFE_TIME (của AX), TYPE_GTBB_IN_MONTH (của AX), B_BANK (của B), FIRST_DATE_B (của B), PROMOTION_ID (của B), AX_AGENTID_GET_GIFT, B_AGENTID_GET_GIFT. Đồng thời, cần tính toán số lượng B fraud trong tháng/năm hiện tại cho AX đó. _2025-10-31_
2. Khi người dùng hỏi về "đủ điều kiện trả thưởng", hãy kiểm tra các cột sau trong bảng GMC_SEMANTIC_GTBB_INFO: GROUP_MAU, TYPE_GTBB_LIFE_TIME (của AX), TYPE_GTBB_IN_MONTH (của AX), B_BANK (của B), FIRST_DATE_B (của B), PROMOTION_ID (của B), AX_GET_GIFT, B_AGENTID_GET_GIFT. Đồng thời, cần tính toán số lượng B fraud trong tháng/năm hiện tại cho AX đó. _2025-10-31_
3. Khi người dùng hỏi về "đủ điều kiện trả thưởng", hãy kiểm tra cột GROUP_MAU trong bảng GMC_SEMANTIC_GTBB_INFO. _2025-10-30_
4. Khi người dùng hỏi về "đủ điều kiện trả thưởng", hãy kiểm tra các cột sau trong bảng GMC_SEMANTIC_GTBB_INFO: GROUP_MAU, TYPE_GTBB_LIFE_TIME (của AX), TYPE_GTBB_IN_MONTH (của AX), B_BANK (của B), FIRST_DATE_B (của B), PROMOTION_ID (của B). Đồng thời, cần tính toán số lượng B fraud trong tháng/năm hiện tại cho AX đó. _2025-10-30_
