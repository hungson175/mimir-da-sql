# FI Solutions Domain

**Domain ID:** `5cd09ae2-90b8-4102-a717-0ae6f649ff69`
**Name:** BU FS: FI Solutions
**Description:** Data về traffic và giải ngân của sản phẩm CLO và giao dịch thanh toán khoản vay, thanh toán thẻ tín dụng

## Tables

### 1. FIS_CLO_TRAFFIC_FLOW
**Table:** `momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW`
**Description:** Thông tin user truy cập vào sản phẩm CLO theo từng nguồn

| Column | Type | Description |
|--------|------|-------------|
| SOURCE | STRING | Nguồn dẫn user tới truy cập sản phẩm |
| VALUE | STRING | Đối tác: 'clo_fecredit' (FE CREDIT), 'lending_mp_homecredit' (HOME CREDIT), 'cro_vib' (VIB) |
| ETL_DATE | DATE | Ngày ngườ dùng truy cập |
| MOMO_SESSION_ID_V2 | STRING | Định danh cho lượt truy cập |
| AGENT_ID | STRING | Định danh mã ngườ dùng |

### 2. FI_TRANS
**Table:** `momovn-prod.BU_FI.FI_TRANS`
**Description:** Giao dịch liên quan tới dịch vụ tài chính: thu chi hộ, thanh toán khoản vay, thanh toán thẻ tín dụng

| Column | Type | Description |
|--------|------|-------------|
| ID | INT | tid / mã định danh giao dịch |
| DATE_PARTITION | INT | Thờ điểm update cuối cùng (UTC+7) |
| FUNDID | FLOAT | Nguồn tiền (1=Momo, 2=Bank, 3=Napas, 6=TTT, 7=Paylater...) |
| SERVICE_CODE | STRING | Dịch vụ của giao dịch |
| USER_PAYMENT | FLOAT | Agent_id thực hiện giao dịch |
| TRANS_TYPE | STRING | Loại giao dịch |
| STATUSID | INT | Trạng thái (2=thành công, 6=thất bại) |
| AMOUNT | FLOAT | Số tiền giao dịch |
| TOTAL_AMOUNT | FLOAT | Tổng giá trị bill (không tính chiết khấu) |
| MM_AMOUNT | FLOAT | Số tiền thực trả của user |
| VC_AMOUNT | FLOAT | Số tiền giảm trừ từ voucher |
| FEE | FLOAT | Số tiền thu phí dịch vụ |
| SERVICE_GROUP | FLOAT | ID nhóm dịch vụ (1=thanh toán, 2=chuyển tiền, 3=nạp tiền, 4=rút tiền, 10=giải ngân) |
| DATE_TRANS | DATE | Ngày thực hiện giao dịch |
| BU_GROUP_CODE_L1 | STRING | Nhóm dịch vụ L1 (luôn where = 'PAYMENT') |
| BU_GROUP_CODE_L2 | STRING | Nhóm dịch vụ L2: 'LOAN COLLECTION', 'CREDIT CARD COLLECTION', 'PAYOUT' |
| BU_GROUP_CODE_L3 | STRING | Nhóm dịch vụ L3: 'FM', 'BANK', 'FINCOS', 'OTHERS' |
| BU_GROUP_CODE_L4 | STRING | Nhóm dịch vụ L4: 'COLLECTION', 'DISBURSEMENT' |
| MERCHANT | STRING | Tên đối tác |
| SERVICE_DESCRIPTION | STRING | Mô tả cụ thể cho dịch vụ |
| BILLID | STRING | Mã hợp đồng |

### 3. FIS_TCST
**Table:** `momovn-prod.BU_FI.FIS_TCST`
**Description:** Dữ liệu sản phẩm CLO - trạng thái ticket, số tiền giải ngân và doanh thu

| Column | Type | Description |
|--------|------|-------------|
| TICKET_ID | STRING | Mã định danh yêu cầu/giao dịch |
| USER | STRING | Ngườ dùng thực hiện |
| PARTNER_ID | STRING | Mã đối tác: lending_mp_homecredit, cro_vib, clo_fecredit, clo_mcredit |
| STATUS_CODE | STRING | Mã trạng thái (PRE_CHECK, APPLICATION_SUBMITTED, DISBURSED...) |
| DATE_REQUESTED | DATE | Ngày yêu cầu được thực hiện |
| DATETIME_REQUESTED | DATETIME | Thờ điểm yêu cầu được thực hiện |
| DATE_MODIFIED | DATE | Ngày cập nhật trạng thái mới nhất (dùng để lấy theo trạng thái giải ngân) |
| CONTRACT_AMOUNT | FLOAT | Số tiền hợp đồng (dùng để tính giải ngân) |
| DISBURSED_CREDIT_AMOUNT | FLOAT | Số tiền tín dụng đã giải ngân |
| REVENUE_TEMP | FLOAT | Doanh thu tạm thờ |
| REVENUE | FLOAT | Doanh thu thực tế |
| OFFER_TYPE | STRING | Phân biệt ACL hay CLX (chỉ cho Home Credit) |
| SERVICE_TYPE | STRING | Phân biệt CRO hoặc CLO (luôn where = 'CLO') |

## Domain Knowledge

- **Số giải ngân (disbursed amount)** = tính bằng cột `CONTRACT_AMOUNT` trong bảng `FIS_TCST`
- Khi query số liệu giải ngân: luôn thêm `service_type = 'CLO'`
- **PARTNER_ID mapping:**
  - 'home' → 'lending_mp_homecredit' (Home Credit)
  - 'FE' → 'clo_fecredit' (FE Credit)
  - 'VIB' → 'cro_vib' (VIB)
  - 'mcredit' → 'clo_mcredit' (MCredit)
- Trong `FIS_CLO_TRAFFIC_FLOW`, dùng cột `VALUE` để lọc theo đối tác

## Last Updated
2026-02-28
