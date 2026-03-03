# Domain: BU Payment: P2P REVENUE

## Identity
- **Domain ID:** `67150ae4-a5a7-47b0-88a1-5a75e6635988`
- **Description:** Tất cả các giao dịch để tính revenue cho p2p
- **Tables:** 3
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.MBI_DA.HOANG_P2P_PROJECT_W2B_FEE_RECEIVER_SEGMENTS
> Bảng lưu trữ thông tin về các phân khúc người nhận phí trong dự án P2P W2B.

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | Tháng của dữ liệu liên quan đến phân khúc người nhận phí | 2025-02-01, 2024-08-01, 2024-12-01 |
| user_id | STRING | Định danh mã người dùng trong dự án P2P nhận phí | 34007595, 12990433, 51008534 |
| segment | STRING | Phân khúc của người nhận phí trong dự án P2P | [5]. Lookalike Seller, [6]. Driver phonebook, [1]. SME, [3]. Super hardcore, [2]. Driver Momo, [4]. Hardcore upload |

### momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID
> Bảng chứa thông tin chi tiết về các giao dịch rút tiền từ ví sang ví MoMo (W2W) và được phân loại theo mã giao dịch (tid). Dùng để theo dõi giao dịch, phân tích phí, và nguồn tiền.

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| tid | STRING | Mã giao dịch định danh duy nhất | 86476809612, 86459969758, 86432705617 |
| date | DATE | Ngày diễn ra giao dịch | 2025-10-10, 2025-10-20, 2024-10-10 |
| datetime | DATETIME | Thời điểm chính xác diễn ra giao dịch | 2023-11-02 20:32:31, 2024-07-28 20:03:10 |
| month | DATE | Tháng diễn ra giao dịch | 2025-10-01, 2025-09-01, 2025-08-01 |
| amount | FLOAT | Số tiền được rút trong giao dịch | 100000, 50000, 200000 |
| user_id | STRING | ID của người dùng thực hiện giao dịch | 87339451, 89146178, 89146176 |
| receiver_id | STRING | ID của người nhận tiền | — |
| fee | FLOAT | Phí giao dịch áp dụng cho mỗi lần rút tiền | 0, 3950, 6550 |
| service | STRING | Loại dịch vụ liên quan đến giao dịch | W2W, W2B, CASHOUT |
| money_source | STRING | Nguồn tiền sử dụng trong giao dịch | 01. Momo, 02. Bank, 06. TTT, 07. Paylater, 13. Group Fund, 03. Napas, 04. Visa Debit, 05. Visa Credit, 12. Direct Debit, 15. Unknown, 08. Unknown |
| serviceid | STRING | ID của dịch vụ liên quan đến giao dịch | transfer_via_link_w2w, transfer_p2p, transfer_p2b_scan_vietqr |

### momovn-prod.MBI_DA.MINH_P2P_BLACKLIST_TEMP
> Bảng tạm chứa danh sách đen P2P — người dùng bị cấm giao dịch P2P.

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| user_id | STRING | Mã định danh của người dùng bị liệt vào danh sách đen | 102086698, 95537984, 95554412 |
| block_date | DATE | Ngày người dùng bị chặn | 2025-06-30, 2025-09-30, 2025-08-04 |

## Domain Knowledge (from Mimir)

- Paid user là user có fee > 0
- Nguồn tiền túi thần tài ứng với money_source là '06. TTT'

## Suggested Probe Questions

- Revenue by quarter: `SUM(fee) ... GROUP BY EXTRACT(YEAR FROM date), quarter`
- Revenue by service type: W2W vs W2B vs CASHOUT
- Revenue by money_source
- Paid user count: `COUNT(DISTINCT user_id) WHERE fee > 0`
- Status: **Probed — schema verified 2026-02-25**
