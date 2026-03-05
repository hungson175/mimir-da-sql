# BU Payment: P2P OVERALL

**Domain ID:** `838c1168-492d-4751-995d-d356dd8b9a42`

## Description
Hiện tại đang available data về
- Nguồn tiền (SOF) của user W2W/W2B
- User Type của user P2P
- Receiver của sender P2P

## Tables

### `momovn-prod.MBI_DA.P2P_SOF_ALL_RAW`
> Bảng này chứa dữ liệu thô về nguồn tiền trong các giao dịch P2P. Bảng này có thể được sử dụng để phân tích các nguồn tiền được sử dụng trong giao dịch P2P, đánh giá số lượng giao dịch theo từng nguồn tiền, và theo dõi các loại dịch vụ giao dịch P2P.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Thời điểm (tháng) của giao dịch P2P | 2025-12-01, 2025-11-01, 2025-10-01 |
| `date` | DATE | Ngày diễn ra giao dịch P2P | 2025-12-10, 2025-11-10, 2025-01-10 |
| `user_id` | STRING | Mã định danh của người dùng thực hiện giao dịch P2P | 86013249, 85186806, 41564694 |
| `money_src` | STRING | Nguồn tiền: bao gồm momo, bank_link, TTT, direct debit, group fundnguồn tiền: bao gồm momo, bank_link, TTT, direct debit, group fund | 2. bank_link, 1. momo, 3. TTT |
| `service` | STRING | Loại dịch vụ trong giao dịch P2P: W2W hoặc W2B, gom lại là P2P chuyển tiền uniqueW2W hoặc W2B, gom lại là P2P chuyển tiền unique | W2W, W2B |
| `num_tranx` | INTEGER | Số lượng giao dịch của nguồn tiền đósố lượng giao dịch của nguồn tiền đó | 1, 2, 3 |

### `momovn-prod.MBI_DA.P2P_TOTAL_USER_TYPE`
> Bảng này chứa thông tin phân loại người dùng cho các giao dịch P2P. Bảng dùng để phân tích giao dịch giữa các ví MoMo, theo dõi nhóm khách hàng, và kiểm tra xu hướng sử dụng dịch vụ của người dùng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng trong năm mà dữ liệu được ghi nhận. | 2025-12-01, 2025-01-01, 2026-01-01 |
| `user_id` | STRING | Mã định danh của người dùng MoMo. | 40835779, 77192863, 93193591 |
| `date` | DATE | Ngày tháng cụ thể khi dữ liệu được ghi nhận. | 2025-12-01, 2025-04-01, 2026-01-01 |
| `user_type` | STRING | Loại người dùng tham gia giao dịch P2P. | 2. Retention, 3. Churn, 1. New |

### `momovn-prod.MBI_DA.P2P_TOTAL_SENDER_RECEIVER_RAW`
> Bảng thông tin giao dịch của P2P bao gồm W2W và W2B. 
Bảng này cung cấp thông tin chi tiết về ngày tháng của mỗi giao dịch P2P. 
Dữ liệu giúp theo dõi tổng số giao dịch hàng ngày giữa người gửi và người nhận. 
Bảng còn cho biết loại dịch vụ được thực hiện là W2W (ví tới ví) hay W2B (ví tới ngân hàng). 
Có thể dùng để phân tích và đánh giá xu hướng giao dịch P2P trong từng tháng.Bảng thông tin giao dịch của P2P bao gồm W2W và W2B

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng mà giao dịch P2P diễn ra. | 2025-12-01, 2025-05-01, 2025-03-01 |
| `date` | DATE | Ngày mà các giao dịch P2P diễn ra. | 2025-01-10, 2025-12-10, 2025-06-10 |
| `user_id` | STRING | Mã người gửi trong giao dịch P2P.người gửi | 83040571, 95573107, 95573079 |
| `receiver_id` | STRING | Mã người nhận trong giao dịch P2P.người nhận | +Psh5z9BuZ4X5iR4EEwMVtjzIzeZdfqHDiyyCIyzOf0=, UCmW/QRw27rwh10bMuD6wuPLhJNlQWsOeUHcZKIcW4Q=, 2ZKcEaxne45XmvnrTa80aX8MxsdVtIKrpfVh+lYmvSc= |
| `service` | STRING | Loại dịch vụ liên quan, bao gồm W2W (ví tới ví) và W2B (ví tới ngân hàng).bao gồm W2W và W2B | W2W, W2B |
| `num_tranx` | INTEGER | Tổng số lượng giao dịch của cặp người gửi - người nhận trong ngày đó (đã aggregate).Tổng số lượng giao dịch của cặp đó vào ngày đó (đã aggregate) | 1, 2, 3 |

## Memory
*2 entries — user-trained knowledge*

1. RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này _2025-11-17_
2. User Type = nhóm người dùng theo New, Retained, Reactivated _2026-01-28_
