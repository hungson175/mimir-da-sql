# Transaction MoMo Domain

**Domain ID:** `e5beb7b6-4273-47ff-9755-a5bcf8d51b97`
**Name:** BU Payment: Transaction MoMo
**Description:** Lưu trữ thông tin cơ bản các giao dịch của ví điện tử MoMo

## Tables

### 1. DAILY_PAID_USER_TRANS_VER2
**Table:** `project-5400504384186300846.REPORT.DAILY_PAID_USER_TRANS_VER2`
**Description:** Bảng báo cáo hằng ngày thống kê giao dịch đã thanh toán của ngườ dùng MoMo

| Column | Type | Description |
|--------|------|-------------|
| REFERENCE | FLOAT | Số tham chiếu giao dịch |
| user_payment | FLOAT | Mã định danh ngườ dùng (user_id, agent_id) |
| TRANS_DATE | DATE | Ngày giao dịch (múi giờ VN) |
| SERVICE_CODE | STRING | Mã kỹ thuật định danh dịch vụ/merchant |
| USER_TYPE | STRING | Loại ví (EWALLET BANK, EWALLET NON-BANK, OTC, OTHERS) |
| SERVICEID | STRING | Mã phiên bản/ID cụ thể của dịch vụ |
| VALUE_TRANS | FLOAT | Tổng giá trị tiền giao dịch (VNĐ) |
| NUMBER_TRANS | INTEGER | Số lượng giao dịch |
| MONTH_ACTIVE | DATE | Ngày đầu tháng của kỳ thống kê |
| GROUP_CODE_L1 | STRING | Nhóm cấp 1 (CASHIN, PAYMENT, TRANSFER, CASHOUT, MONEY DISBURSEMENT, PROMOTION, FEE) |
| SERVICE_DESCRIPTION | STRING | Mô tả giao dịch bằng chữ |
| BU_NAME | STRING | Tên Business Unit (BU_DLS, BU_P2P, BU_VTTI, BU_FS, BU_BANK...) |
| MERCHANT | STRING | Tên thương hiệu/merchant |
| KEY_MERCHANT_2 | STRING | Phân nhóm merchant cấp 2 (ECOMMERCE, TELECOM_ULTILITIES, MAPS...) |
| KEY_MERCHANT_3 | STRING | Chi tiết key merchant mức 3 (FACEBOOK, APPLE, BE, LAZADA, TIKTOK...) |
| BU_GROUP_CODE_L1 | STRING | Nhóm cấp 1 của đơn vị kinh doanh (P2P - EWALLET TO BANK, TELECOM, END USER, CREDITTECH LABS...) |
| BU_GROUP_CODE_L2 | STRING | Nhóm cấp 2 (PAYLATER, TTT, APPLICATION STORE, TRANSPORT, RETAIL...) |
| BU_GROUP_CODE_L3 | STRING | Nhóm cấp 3 (BANK, LOGISTICS, GROCERY, APPLE, FINCOS...) |
| NEWVERTICAL | STRING | Danh mục vertical mới cấp 1 (GAME, SUPERMARKET, OTA, CASHIN BANK, P2P...) |
| NEWVERTICAL_Merchant | STRING | Danh mục vertical của nhóm merchant (INTERNATIONAL MERCHANTS, MASS MERCHANT...) |
| SPECIALPROJECT | STRING | Dự án đặc biệt (GAME, RETAIL, OTA, ADS PAYMENT, P2P - EWALLET TO EWALLET...) |

## Domain Knowledge

- **MAU** = số ngườ dùng hoạt động hàng tháng (thực hiện ít nhất 1 giao dịch trong tháng)
- **A30 active user**: ngườ dùng thực hiện ít nhất 1 giao dịch trong 30 ngày gần nhất
- Khi đếm số lượng giao dịch: `count(distinct tranid)`
- **P2P** = Peer-to-Peer = giao dịch chuyển tiền giữa 2 ngườ dùng cá nhân (W2W và W2B)
- Khi hỏi P2P, W2W, W2B → dùng cột `SPECIALPROJECT` để filter

## Last Updated
2026-02-28
