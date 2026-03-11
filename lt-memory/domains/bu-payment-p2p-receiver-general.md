# BU Payment: P2P RECEIVER GENERAL

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `390df75f-43e9-4caa-a418-0959e0691f73`

## Description
Bao gồm các thông tin nhận tiền về MoMo (các luồng TITAN, QR, W2W)

## Tables

### `momovn-prod.MBI_DA.P2P_RECEIVER_PERFORMANCE`
> Bảng đo lường hiệu suất của người nhận trong giao dịch P2P. Thông tin này có thể được sử dụng để đánh giá hiệu suất của người nhận dựa trên mỗi giao dịch, xác định các giao dịch tự động và các giao dịch giữa các ví cá nhân. Ngoài ra, bảng này hỗ trợ trong việc phân tích phí và loại hình dịch vụ liên quan đến giao dịch P2P.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `tid` | STRING | Mã định danh của giao dịch P2P. | 95193055077, 95199794086, 80217104518 |
| `date` | DATE | Ngày thực hiện giao dịch P2P. | 2024-02-10, 2024-02-01, 2024-02-19 |
| `datetime` | DATETIME | Thời gian thực hiện giao dịch P2P. | 2024-02-10 23:35:12, 2024-04-10 21:56:43, 2024-03-12 11:48:44 |
| `month` | DATE | Tháng thực hiện giao dịch P2P. | 2024-02-01, 2024-07-01, 2024-06-01 |
| `amount` | FLOAT | Số tiền trong giao dịch P2P. | 100000, 50000, 200000 |
| `user_id` | STRING | Mã định danh của người gửi trong giao dịch P2P. | 0541103953007, 212356786, 86336757 |
| `receiver_id` | STRING | Mã định danh của người nhận trong giao dịch P2P. | 84157961, 89086590, 88673699 |
| `fee` | FLOAT | Phí giao dịch liên quan đến giao dịch P2P. | 0, 4600, 9800 |
| `serviceid` | STRING | Mã dịch vụ liên quan đến giao dịch P2P. | transfer_via_link_w2w, transfer_p2p, transfer_aioqr |
| `type` | STRING | Loại hình dịch vụ trong giao dịch P2P. | 2. Non-QR, 1. QR |
| `is_self_transfer` | BOOLEAN | Xác định giao dịch có phải là tự chuyển tiền giữa các ví cá nhân. True: là tự chuyển, False: không phải tự chuyển. | false, true |
| `is_auto_receive` | BOOLEAN | Xác định giao dịch có được nhận tự động. True: là nhận tự động, False: không phải nhận tự động. | true, false |

### `momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU`
> User bật auto receive (nhận tiền tự động về Túi thần tài) hàng tháng. Table này cung cấp thông tin về: 
- Tháng và ngày cụ thể khi action auto receive được bật
- Danh sách các user bật auto receive
- User nhận tiền từ auto receive trong thángUser bật auto receive (nhận tiền tự động về Túi thần tài) hàng tháng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng có action bật auto receiveTháng có action bật auto receive | 2026-01-01, 2025-12-01, 2025-11-01 |
| `DATE` | DATE | Ngày cuối cùng trong tháng có action bật auto receiveNgày cuối cùng trong tháng có action bật auto receive | 2026-01-22, 2025-12-31, 2025-11-30 |
| `user_id` | STRING | UserID của người dùngUserID của người dùng | 45206314, 50496728, 48087383 |
| `receiver_id` | STRING | User có nhận tiền trong cùng thángUser có nhận tiền trong cùng tháng | 40755428, 44851281, 67837666 |

### `momovn-prod.MBI_DA.TUAN_ALL_RECEIVER_USER_TYPE`
> Bảng thông tin về người nhận, được chia theo tháng và ngày, gồm các thuộc tính về loại người dùng, nhóm thành phố, giới tính và tuổi. Thông tin này có thể được sử dụng để: 
- Phân tích đặc điểm người dùng nhận để tối ưu hóa chiến dịch marketing.
- Phân loại người dùng theo khu vực thành phố để cải thiện dịch vụ.
- Xác định độ tuổi và giới tính phổ biến của người dùng nhận ở từng vùng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng ghi nhận thông tin của người nhận. | 2024-02-01, 2025-01-01, 2024-01-01 |
| `date` | DATE | Ngày ghi nhận thông tin của người nhận. | 2024-02-01, 2024-10-01, 2024-07-01 |
| `receiver_id` | STRING | Mã định danh của người nhận. | 38253964, 72458225, 6687772 |
| `user_type` | STRING | Loại người dùng nhận. | [2]. Retention, [3]. Reactivation, [1]. New to service |
| `city_group` | STRING | Nhóm thành phố nơi người nhận sinh sống. | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam |
| `city` | STRING | Thành phố nơi người nhận sinh sống. | Hồ Chí Minh, Hà Nội, Bình Dương |
| `gender` | STRING | Giới tính của người nhận. | MALE, FEMALE |
| `age_group` | STRING | Nhóm tuổi của người nhận. | [2].18-22, [3].23-27, [4].28-35 |
| `age` | INTEGER | Tuổi của người nhận. | 21, 22, 20 |

### `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_TYPE`
> Bảng này chứa thông tin về các receiver sử dụng dịch vụ AIO-QR trên MoMo. Bảng cho phép kiểm tra tháng người dùng kích hoạt dịch vụ, ngày đầu tiên kích hoạt dịch vụ trong tháng, và thông tin chi tiết về receiver như địa chỉ tài khoản và vị trí sống.
Các mục đích sử dụng của bảng này bao gồm:
- Xác định tháng và ngày đầu tiên người dùng kích hoạt dịch vụ AIO-QR.
- Phân tích đặc điểm nhân khẩu học của receiver như tuổi, thành phố, và nhóm khu vực.
- Phân loại người dùng theo loại hoạt động (New, Retain, Reactive).

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng user active nhận tiềnTháng user active nhận tiền | 2026-01-01, 2025-12-01, 2025-11-01 |
| `date` | DATE | Ngày đầu tiên active dịch vụ nhận tiền trong thángNgày đầu tiên active dịch vụ nhận tiền trong tháng | 2025-12-01, 2026-02-01, 2026-01-01 |
| `receiver_id` | STRING | UserID của receiver AIO-QRUserID của receiver AIO-QR | 48117433, 54308626, 65734565 |
| `city` | STRING | Thành phố sinh sống của receiverThành phố sinh sống của receiver | Hồ Chí Minh, Hà Nội, Bình Dương |
| `city_group` | STRING | Khu vực sinh sống của receiverKhu vực sinh sống của receiver | Hồ Chí Minh, Tỉnh khác, Hà Nội |
| `age` | INTEGER | Tuổi của receiverTuổi của receiver | 19, 20, 21 |
| `age_group` | STRING | Nhóm tuổi của receiverNhóm của receiver | [2].18-22, [3].23-27, [4].28-35 |
| `user_type` | STRING | Loại active của user (New/Retain/Reactive)Loại active của user (New/Retain/Reactive) | [2]. Retention, [3]. Reactivation, [1]. New to service |

### `momovn-prod.MBI_DA.P2P_RECEIVER_TITAN_MONTHLY_RECEIVER`
> Bảng tổng hợp các thông tin hàng tháng của người nhận trong các giao dịch P2P Titan. Bảng này cung cấp thông tin như:
- Tháng của giao dịch
- ID người nhận
- Ngày hoạt động đầu tiên của người nhận
- Tổng số lượng giao dịch thực hiện
- Tổng giá trị giao dịch (TPV)
- Loại người nhận
- Thành phố của người nhận
- Nhóm thành phố của người nhận
- Tuổi và nhóm tuổi của người nhận
- Giới tính của người nhận
- Số dư cuối cùng của người nhận sau giao dịch

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng của giao dịch | 2026-01-01, 2026-02-01, 2025-12-01 |
| `receiver_id` | STRING | ID người nhận trong các giao dịch P2P Titan | 96664306, 49775839, 102825026 |
| `first_active_date` | DATE | Ngày đầu tiên người nhận tham gia hoạt động/giao dịch | 2026-02-01, 2026-02-02, 2026-02-03 |
| `tnx_count` | INTEGER | Tổng số lượng giao dịch thực hiện trong tháng | 1, 2, 3 |
| `total_tpv` | FLOAT | Tổng giá trị giao dịch (Total Processing Value) trong tháng | 2000, 10000, 100000 |
| `user_type` | STRING | Loại người nhận (ví dụ: Cá nhân, Doanh nghiệp) | [1]. New to service, [2]. Retention, [3]. Reactivation |
| `city` | STRING | Thành phố nơi người nhận cư trú | Hồ Chí Minh, Hà Nội, Bình Dương |
| `city_group` | STRING | Nhóm thành phố của người nhận, phân loại theo vùng miền | Hồ Chí Minh, Tỉnh khác, Hà Nội |
| `age` | INTEGER | Tuổi của người nhận | 19, 20, 18 |
| `age_group` | STRING | Nhóm tuổi của người nhận, phân loại theo độ tuổi | [2].18-22, [3].23-27, [4].28-35 |
| `gender` | STRING | Giới tính của người nhận | MALE, FEMALE |
| `post_balance` | FLOAT | Số dư cuối cùng của người nhận sau giao dịch | 5, 10, 80 |

### `momovn-prod.MBI_DA.TUAN_RECEIVER_MOMO_REWARD_MISSION`
> Bảng này chứa thông tin về các nhiệm vụ nhận thưởng MoMo trong tuần. Bảng có thể được sử dụng để: 
- Theo dõi và phân tích hoạt động nhận phần thưởng của người dùng theo nhiệm vụ
- Lập báo cáo về số lượng coin và loại hình quà tặng được từng người sử dụng
- Quản lý thông tin nhiệm vụ và loại giao dịch liên quan đến phần thưởng trong hệ thống MoMo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date` | DATE | Ngày diễn ra nhiệm vụ nhận thưởng. | 2026-01-06, 2026-01-07, 2026-01-08 |
| `datetime` | DATETIME | Thời điểm cụ thể diễn ra nhiệm vụ nhận thưởng. | 2025-08-21 16:42:41, 2025-07-11 16:57:43, 2025-08-21 16:41:23 |
| `user_id` | STRING | Mã định danh cho người dùng trong nhiệm vụ nhận thưởng. | 40364477, 55219179, 53489966 |
| `mission_id` | STRING | Mã định danh của nhiệm vụ nhận thưởng. | mission_20251020_p2p_receive_bank_100xu, mission_20250701_p2p_receive_bank_20xu, mission_20250516_p2p_receive_bank_200xu_cofund |
| `mission_name` | STRING | Tên của nhiệm vụ nhận thưởng. | Nhận tiền qua QR từ Ngân hàng, Nhận tiền qua QR 100% nhận Xu (từ App Ngân hàng), Nhận tiền qua QR từ Ví MoMo |
| `coin_amount` | INTEGER | Số lượng coin người dùng nhận được từ nhiệm vụ. | 25, 100, 20 |
| `tid` | STRING | Mã định danh giao dịch liên quan đến nhiệm vụ nhận thưởng. | 109120434997, 85683316379, 85999658890 |
| `trans_type` | STRING | Loại hình giao dịch liên quan đến nhiệm vụ nhận thưởng. | earn_non_trans_mission, burn_exchange_gift |
| `gift_type_id` | STRING | Mã định danh của loại hình quà tặng trong nhiệm vụ nhận thưởng. | rewards_exchange_coin_260129_4jprp8m32 |

## Memory
*9 entries — user-trained knowledge*

1. is_self_transfer: là cột chứa thông tin của các giao dịch self transfer hay không _2026-01-20_
2. Dùng cột user_id trong bảng momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU _2025-12-28_
3. Retention Rate (Tỷ lệ giữ chân) của Monthly Active Users (MAU) được tính bằng cách: (Số người dùng từ Cohort gốc vẫn hoạt động trong Tháng N) / (Tổng số người dùng trong Cohort gốc). Cohort gốc là nhóm người dùng hoạt động trong một tháng cụ thể (Tháng 0). _2026-02-04_
4. A30 receivers = người dùng active nhận tiền ít nhất 1 lần trong tháng _2026-02-04_
5. Số lượng người dùng nhận tiền trong tháng 11/2025 có bật tính năng auto receive được tính bằng cách join bảng TUAN_RECEIVER_ALL_BEHAVIOR và LOAN_P2P_AUTORECEIVE_MAU _2025-12-28_
6. Khi xử lý vấn đề liên quan tới receiver_id, dùng user_id cho cột t2 _2025-12-28_
7. is_self_transfer: là cột chứa thông tin của các giao dịch self transfer hay không _2026-01-20_
8. Số dư xu của user được snapshot tại bảng momovn-prod.MBI_DA.P2P_RECEIVER_TITAN_MONTHLY_RECEIVER, cột post_balance _2026-02-08_
9. Self-transfer: Là giao dịch mà user_id và receiver_id trùng nhau. _2026-01-20_
