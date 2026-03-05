# BU Payment: P2P REVENUE

**Domain ID:** `67150ae4-a5a7-47b0-88a1-5a75e6635988`

## Description
Tất cả các giao dịch để tính revenue cho p2p

## Tables

### `momovn-prod.MBI_DA.HOANG_P2P_PROJECT_W2B_FEE_RECEIVER_SEGMENTS`
> Bảng này lưu trữ thông tin về các phân khúc người nhận phí trong dự án P2P. Mục đích và các trường hợp sử dụng của bảng: 
 - Xác định các phân khúc người dùng nhận phí trong dự án P2P 
 - Theo dõi sự thay đổi theo thời gian của các phân khúc trong dự án P2P 
 - Phân tích chi tiết về người dùng nhận phí và phân khúc của họ để cải thiện dịch vụ

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | — | Tháng của dữ liệu liên quan đến phân khúc người nhận phí. | 2025-02-01, 2024-08-01, 2024-12-01 |
| `user_id` | — | Định danh mã người dùng trong dự án P2P nhận phí. | 34007595, 12990433, 51008534 |
| `segment` | — | Phân khúc của người nhận phí trong dự án P2P. | [5]. Lookalike Seller, [6]. Driver phonebook, [1]. SME |

### `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
> Bảng này chứa thông tin chi tiết về các giao dịch rút tiền mặt từ ví sang ví MoMo (W2W) và được phân loại theo mã giao dịch (tid). Thông tin này có thể được sử dụng để theo dõi các giao dịch rút tiền cụ thể, phân tích phí giao dịch, và tìm hiểu nguồn tiền sử dụng trong các giao dịch.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `tid` | — | Mã giao dịch định danh duy nhất cho mỗi giao dịch rút tiền trong ví sang ví MoMo. | 86476809612, 86459969758, 86432705617 |
| `date` | — | Ngày diễn ra giao dịch rút tiền. | 2025-10-10, 2025-10-20, 2024-10-10 |
| `datetime` | — | Thời điểm chính xác diễn ra giao dịch rút tiền trong ví MoMo. | 2023-11-02 20:32:31, 2024-07-28 20:03:10, 2023-12-07 20:39:45 |
| `month` | — | Tháng diễn ra giao dịch rút tiền. | 2025-10-01, 2025-09-01, 2025-08-01 |
| `amount` | — | Số tiền được rút trong giao dịch. | 100000, 50000, 200000 |
| `user_id` | — | ID của người dùng thực hiện giao dịch rút tiền từ ví MoMo. | 87339451, 89146178, 89146176 |
| `receiver_id` | — | ID của người nhận tiền từ giao dịch rút tiền trong ví MoMo. | — |
| `fee` | — | Phí giao dịch áp dụng cho mỗi lần rút tiền. | 0, 3950, 6550 |
| `service` | — | Loại dịch vụ liên quan đến giao dịch rút tiền từ ví. | W2W, W2B, CASHOUT |
| `money_source` | — | Nguồn tiền được sử dụng trong giao dịch rút tiền từ ví MoMo. | 01. Momo, 02. Bank, 06. TTT |
| `serviceid` | — | ID của dịch vụ liên quan đến giao dịch rút tiền từ ví. | transfer_via_link_w2w, transfer_p2p, transfer_p2b_scan_vietqr |

### `momovn-prod.MBI_DA.MINH_P2P_BLACKLIST_TEMP`
> Bảng tạm thời chứa thông tin danh sách đen P2P trên MoMo. Người dùng có thể tìm thấy thông tin về các user bị liệt vào danh sách đen, bao gồm mã định danh của người dùng và ngày bị chặn. Bảng này có thể được sử dụng để kiểm tra danh sách người dùng bị cấm giao dịch P2P, giám sát và quản lý hoạt động của hệ thống P2P, và hỗ trợ trong việc ra quyết định tài chính liên quan đến các user bị chặn.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `user_id` | — | Mã định danh của người dùng bị liệt vào danh sách đen trong giao dịch P2P. | 102086698, 95537984, 95554412 |
| `block_date` | — | Ngày mà người dùng bị chặn hoặc được thêm vào danh sách đen trong hệ thống P2P. | 2025-06-30, 2025-09-30, 2025-08-04 |

## Memory
*2 entries — user-trained knowledge*

1. Paid user là user có fee > 0 _2025-11-03_
2. Nguồn tiền túi thần tài ứng với money_source là '06. TTT' _2025-10-05_
