# P2P Revenue Domain

**Domain ID:** `67150ae4-a5a7-47b0-88a1-5a75e6635988`
**Name:** BU Payment: P2P REVENUE
**Description:** Tất cả các giao dịch để tính revenue cho p2p

## Tables

### 1. HOANG_P2P_PROJECT_W2B_FEE_RECEIVER_SEGMENTS
**Table:** `momovn-prod.MBI_DA.HOANG_P2P_PROJECT_W2B_FEE_RECEIVER_SEGMENTS`
**Description:** Bảng lưu trữ thông tin về các phân khúc ngườ nhận phí trong dự án P2P

| Column | Type | Description |
|--------|------|-------------|
| month | DATE | Tháng của dữ liệu |
| user_id | STRING | Định danh mã ngườ dùng nhận phí |
| segment | STRING | Phân khúc ngườ nhận phí (Lookalike Seller, Driver phonebook, SME, Super hardcore, Driver Momo, Hardcore upload) |

### 2. HOANG_P2P_ALL_CASHOUT_W2W_BY_TID
**Table:** `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
**Description:** Thông tin chi tiết về các giao dịch rút tiền mặt từ ví sang ví MoMo (W2W)

| Column | Type | Description |
|--------|------|-------------|
| tid | STRING | Mã giao dịch định danh duy nhất |
| date | DATE | Ngày diễn ra giao dịch |
| datetime | DATETIME | Thờ điểm chính xác diễn ra giao dịch |
| month | DATE | Tháng diễn ra giao dịch |
| amount | FLOAT | Số tiền được rút |
| user_id | STRING | ID ngườ dùng thực hiện giao dịch |
| receiver_id | STRING | ID ngườ nhận tiền |
| fee | FLOAT | Phí giao dịch (0, 3950, 6550...) |
| service | STRING | Loại dịch vụ (W2W, W2B, CASHOUT) |
| money_source | STRING | Nguồn tiền (01. Momo, 02. Bank, 06. TTT, 07. Paylater...) |
| serviceid | STRING | ID dịch vụ (transfer_via_link_w2w, transfer_p2p, transfer_p2b_scan_vietqr) |

## Domain Knowledge

- **Paid user** = user có fee > 0
- **Nguồn tiền Túi Thần Tài** = money_source = '06. TTT'
- Phí giao dịch W2W thường là: 0, 3950, 6550 VNĐ

## Last Updated
2026-02-28
