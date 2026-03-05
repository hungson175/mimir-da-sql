# BU Payment: P2P SOCIAL

**Domain ID:** `a7a4abe7-ba98-48dd-b9f0-8d0752c75910`

## Description
Dữ liệu liên quan các sản phẩm Social của P2P

## Tables

### `momovn-prod.MBI_DA.P2P_SOCIAL_LUCKYMONEY_TRANS_RAW`
> Bảng lưu từng giao dịch của chuyển tiền nhân dịp đặc biệt. Được gọi là chuyển tiền kèm thiệp. Bảng này có thể được sử dụng để: 
- Theo dõi các giao dịch chuyển tiền nhân dịp đặc biệt mà người dùng thực hiện. 
- Phân tích xu hướng người dùng sử dụng dịch vụ on special occasions. 
- Đánh giá kênh thanh toán và hiệu suất dịch vụ được sử dụng.Bảng lưu từng giao dịch của chuyển tiền nhân dịp đặc biệt. Được gọi là chuyển tiền kèm thiệp,

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng thực hiện giao dịch | 2023-01-01, 2024-02-01, 2025-01-01 |
| `date` | DATE | Ngày thực hiện giao dịch | 2023-01-22, 2024-02-10, 2025-01-29 |
| `datetime` | DATETIME | Ngày và giờ cụ thể thực hiện giao dịch | 2024-02-10 00:45:41, 2024-02-10 00:00:23, 2023-01-22 00:29:32 |
| `tid` | STRING | Mã giao dịch của chuyển tiền đặc biệt | 98600804590, 98650980026, 107380809165 |
| `user_id` | STRING | ID của người gửi trong giao dịch P2P | 21502252, 38744123, 73298381 |
| `receiver_id` | STRING | ID của người nhận trong giao dịch P2P | 70595660, 25926797, 40660294 |
| `amount` | FLOAT | Số tiền được chuyển trong giao dịch | 100, 111, 100000 |
| `serviceid` | STRING | Mã dịch vụ của giao dịch chuyển tiền đặc biệt | transfer_luckymoney |
| `payment_channel` | STRING | Kênh thanh toán được sử dụng trong giao dịch | luckymoney_icon_input_w2w, luckymoney_chat, luckymoney_search |

### `momovn-prod.MBI_DA.P2P_SOCIAL_TABTOI_PERFORMANCE_RAW`
> Bảng lưu thông tin về người dùng vào trang game Tab Tôi. Nếu người dùng thấy hứng thú và chơi game bằng cách thực hiện giao dịch chuyển tiền, thì sẽ có ít nhất giá trị trong cột first_w2w_TID hoặc first_w2b_TID. Nếu cả 2 cột đều null thì người dùng chỉ vào xem chứ không chơi. Khi chơi thì người dùng sẽ gọi là player. Bảng này có thể được sử dụng để phân tích hành vi người dùng trong trò chơi, đánh giá hiệu quả của trang Tab Tôi, và để tối ưu hóa trải nghiệm người dùng.
bảng lưu thông tin về người dùng vào trang game Tab Tôi. Nếu người dùng thấy hứng thú và chơi game bằng cách thực hiện giao dịch chuyển tiền, thì sẽ có ít nhất giá trị trong cột first_w2w_TID hoặc first_w2b_TID. Nếu cả 2 cột đều null thì người dùng chỉ vào xem chứ không chơi. Khi chơi thì người dùng sẽ gọi là player

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATETIME` | DATETIME | Thời điểm vào trang game Tab Tôi. | 2025-11-09 15:47:04.745, 2025-11-09 04:32:38.790, 2025-11-09 11:55:39.180 |
| `DATE` | DATE | Ngày vào trang game Tab Tôi. | 2025-12-04, 2025-12-05, 2025-12-03 |
| `agent_id` | STRING | Mã định danh cho mỗi ví MoMo của người dùng. | 42327287, 43106698, 62057366 |
| `event_id` | STRING | Mã định danh của sự kiện liên quan đến trang game Tab Tôi. | _KDo0jpJJcL0vbRMOQtds, foR7TJ52zuqgKX4I5rV1c, B6q6Vbh5uEXcdfcucAUGm |
| `max_src` | STRING | Nguồn mà người dùng đã truy cập để đến trang game Tab Tôi.từ nguồn nào mà đến trang game TabTôi | Bottom Nav, Noti |
| `first_event_name` | STRING | Tên sự kiện đầu tiên mà người dùng thực hiện sau khi vào trang game Tab Tôi. | service_button_clicked, service_carousel_swiped, service_icon_clicked |
| `first_w2w_TID` | STRING | Mã giao dịch W2W đầu tiên sau khi xem trang game Tab Tôi.mã giao dịch W2W đầu tiên sau khi view TabTôi | 108496627427, 109347867580, 98864194842 |
| `first_w2w_tnx_datetime` | DATETIME | Thời điểm diễn ra giao dịch W2W đầu tiên sau khi xem trang game Tab Tôi. | 2025-11-28 17:20:28, 2025-12-03 13:32:27, 2025-10-28 13:08:45 |
| `first_w2w_receiver` | STRING | Người nhận của giao dịch W2W đầu tiên sau khi xem trang game Tab Tôi.mã giao dịch W2B đầu tiên sau khi view TabTôi | 50794446, 102737928, 71739730 |
| `first_w2b_TID` | STRING | Mã giao dịch W2B đầu tiên sau khi xem trang game Tab Tôi. | 105262928924, 109882628049, 103983932674 |
| `first_w2b_tnx_datetime` | DATETIME | Thời điểm diễn ra giao dịch W2B đầu tiên sau khi xem trang game Tab Tôi. | 2025-09-08 08:24:43, 2025-11-09 05:31:46, 2025-10-15 19:35:30 |
| `first_w2b_receiver` | STRING | Người nhận của giao dịch W2B đầu tiên sau khi xem trang game Tab Tôi. | — |

### `momovn-prod.MBI_DA.P2P_TOTAL_SENDER_RECEIVER_RAW`
> Bảng thông tin giao dịch của P2P bao gồm W2W và W2B. 
 - Thống kê tổng số lượng giao dịch theo từng cặp người dùng trong ngày theo W2W hoặc W2B. 
 - Theo dõi thông tin người gửi và người nhận trong các giao dịch P2P. 
 - Phân tích xu hướng về tần suất giao dịch giữa các đối tượng người dùng.Bảng thông tin giao dịch của P2P bao gồm W2W và W2B

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng trong năm của giao dịch. | 2025-05-01, 2025-03-01, 2025-11-01 |
| `date` | DATE | Ngày thực hiện giao dịch. | 2025-01-10, 2025-06-10, 2025-11-10 |
| `user_id` | STRING | ID người gửi thực hiện giao dịch.người gửi | 83040571, 95575101, 95573100 |
| `receiver_id` | STRING | ID người nhận trong giao dịch.người nhận | +Psh5z9BuZ4X5iR4EEwMVtjzIzeZdfqHDiyyCIyzOf0=, UCmW/QRw27rwh10bMuD6wuPLhJNlQWsOeUHcZKIcW4Q=, 2ZKcEaxne45XmvnrTa80aX8MxsdVtIKrpfVh+lYmvSc= |
| `service` | STRING | Loại hình dịch vụ của giao dịch, bao gồm W2W và W2B.bao gồm W2W và W2B | W2W, W2B |
| `num_tranx` | INTEGER | Tổng số lượng giao dịch của cặp người gửi và người nhận vào ngày đó (đã aggregate).Tổng số lượng giao dịch của cặp đó vào ngày đó (đã aggregate) | 1, 2, 3 |

### `momovn-prod.MBI_DA.P2P_DEVICE_TYPE`
> Bảng dùng để lấy thông tin thiết bị người dùng đang sử dụng, đã được tổng hợp theo tháng. Giả định rằng trong suốt tháng đó, người dùng sẽ chỉ sử dụng một thiết bị và rất hiếm khi thay đổi thiết bị liên tục. Bảng này có thể được sử dụng trong việc phân tích mức độ ưu tiên của thiết bị người dùng, tối ưu hóa trải nghiệm người dùng trên ứng dụng, và hỗ trợ xác định các yếu tố liên quan đến hiệu suất thiết bị.bảng dùng để lấy thông tin thiết bị người dùng đang dùng. Đã aggregate theo tháng. Assump cả tháng đó user sẽ chỉ dùng 1 thiết bị, rất ít khi đổi liên tục

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng mà dữ liệu thiết bị được tổng hợp. | 2024-12-01, 2024-08-01, 2024-06-01 |
| `user_id` | STRING | Mã định danh người dùng trong hệ thống P2P. | 7QzjqYw34+4rJuQIrLbGyj1mRuM7siTDbe9oehd5WQQ=, oS7JVmVabMkXlZUQ3OTZNNq8RE4T+bGjTfzeRxKyC6M=, iSla3kK7TWSM4m1z0vRK5MyCsT9euzIRp9eByH0n2CI= |
| `device` | STRING | Tên thiết bị mà người dùng đang sử dụng. | iphone 12 pro max, iphone 11, iphone 11 pro max |
| `device_os` | STRING | Hệ điều hành của thiết bị mà người dùng đang sử dụng. | IOS, ANDROID,  |
| `device_performance` | STRING | Hiệu suất của thiết bị mà người dùng đang sử dụng. | high-end, low-end |

## Memory
*4 entries — user-trained knowledge*

1. VIEWER = user load tab tôi _2025-12-09_
2. RETAINED USER = người dùng thực hiện giao dịch trong tháng hiện tại và đã thực hiện giao dịch trong tháng trước đó _2025-10-30_
3. RETAINED USER = người dùng thực hiện giao dịch trong tháng hiện tại và đã thực hiện giao dịch trong tháng trước đó _2025-10-27_
4. RETAINED USER = người dùng thực hiện giao dịch trong tháng hiện tại và đã thực hiện giao dịch trong tháng trước đó _2025-10-27_
