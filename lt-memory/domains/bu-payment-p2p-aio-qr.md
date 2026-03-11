# BU Payment: P2P AIO_QR

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `05cf9a74-c3c0-4b95-923c-71c8d42ed8aa`

## Description
Records all transaction of P2P AIO_QR

## Tables

### `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ORIGINAL_TABLE`
> Bảng lưu trữ thông tin các giao dịch qua AIO-QR giữa các ví MoMo. Các mục tiêu và ứng dụng tiềm năng của bảng này trong một lĩnh vực có thể bao gồm: 
- Kiểm tra chi tiết các giao dịch chuyển-nhận tiền giữa các user qua mã QR 
- Đánh giá phí giao dịch qua AIO-QR và số tiền giao dịch 
- Phân tích dữ liệu người dùng liên quan đến vị trí địa lý, nhóm tuổi của người nhận tiền

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `serviceid` | STRING | Serviceid của giao dịch (luồng product user thực hiện chuyển-nhận tiền qua AIO-QR)Serviceid của giao dịch (luồng product user thực hiện chuyển-nhận tiền qua AIO-QR) | transfer_aioqr, transfer_myqr, transfer_myqr_upload |
| `tid` | STRING | TID của giao dịch qua AIO QRTID của giao dịch qua AIO QR | 40717832865, 40684159709, 40713541684 |
| `datetime` | DATETIME | Thời gian giao dịch  AIO-QRThời gian giao dịch  AIO-QR | 2024-02-05 20:11:45, 2025-09-30 17:36:40, 2024-02-10 15:01:40 |
| `date` | DATE | Ngày giao dịch qua AIO-QRNgày giao dịch qua AIO-QR | 2024-02-19, 2025-12-10, 2026-01-15 |
| `month` | DATE | Tháng giao dịch qua AIO-QRTháng giao dịch qua AIO-QR | 2025-12-01, 2025-11-01, 2025-10-01 |
| `amount` | FLOAT | Giá trị giao dịch qua AIO-QRGiá trị giao dịch qua AIO-QR | 100000, 50000, 200000 |
| `statusid` | INTEGER | GD thành công nếu statusid = 2, thất bại nếu statusid = 6GD thành công nếu statusid = 2, thất bại nếu statusid = 6 | 2, 6 |
| `fee` | FLOAT | Phí giao dịch qua AIO-QRPhí giao dịch qua AIO-QR | 0 |
| `receiver_id` | STRING | User ID của user nhận tiền về MoMoUser ID của user nhận tiền về MoMo | 48064999, 84157961, 67349367 |
| `user_id` | STRING | User ID của user gửi tiền (có thể là user_id MoMo nếu internal trans (W2W), bank account nếu là giao dịch B2W)User ID của user gửi tiền (có thể là user_id MoMo nếu internal trans (W2W) , bank account nếu là giao dịch B2W) | 0541103953007, 212356786, 14754910 |
| `age` | INTEGER | Tuổi của user nhận tiềnTuổi của user nhận tiền | 19, 20, 21 |
| `age_group` | STRING | Nhóm tuổi của user nhận tiềnNhóm tuổi của user nhận tiền | [2].18-22, [4].28-35, [3].23-27 |
| `city` | STRING | Thành phố sinh sống của user nhận tiềnThành phố sinh sống của user nhận tiền | Hồ Chí Minh, Hà Nội, Bình Dương |
| `city_group` | STRING | Khu vực sinh sống của user nhận tiềnKhu vực sinh sống của user nhận tiền | Hồ Chí Minh, Tỉnh khác, Hà Nội |
| `cheat_type` | STRING | User nhận tiền có phải cheat không (thông thường không tính đến feature cheat này)User nhận tiền có phải cheat không (thông thường không tính đến feature cheat này) | [2]. Not cheat, [1]. Cheat |
| `va_account_bank_code` | STRING | Mã ngân hàng của tài khoản VA | 970454, 971025 |

### `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ACQUISITION_BY_SOURCE_TABLE`
> Bảng này chứa thông tin chi tiết về hoạt động nhận tiền của người dùng thông qua AIO-QR theo nguồn. 
Thông tin có thể được lấy từ bảng này bao gồm: 
- Thời gian và ngày tháng mà người dùng active nhận tiền 
- Giá trị giao dịch và thành phố nơi người nhận sinh sống 
- Phân loại người dùng và thông tin khuyến mãi liên quan

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng user active nhận tiềnTháng user active nhận tiền | 2025-12-01, 2025-11-01, 2026-01-01 |
| `date` | DATE | Ngày user active nhận tiềnNgày user active nhận tiền | 2025-12-01, 2026-01-01, 2025-11-01 |
| `datetime` | DATETIME | Thời gian user active nhận tiềnThời gian user active nhận tiền | 2024-02-09 22:02:17, 2024-02-09 22:03:42, 2024-02-09 22:02:19 |
| `receiver_id` | STRING | UserID user nhận tiền qua AIO-QRUserID user nhận tiền qua AIO-QR | 67891171, 45940625, 52928240 |
| `tid` | STRING | TID 1st active đầu tiên của thángTID 1st active đầu tiên của tháng | 52773367706, 52781500810, 52763360289 |
| `amount` | FLOAT | Giá trị giao dịchGiá trị giao dịch | 100000, 10000, 50000 |
| `serviceid` | STRING | ServiceID 1st active đầu tiên trong thángServiceID 1st active đầu tiên trong tháng | transfer_aioqr, transfer_myqr, transfer_myqr_upload |
| `user_type` | STRING | Loại active của user (New/Retain, Reactive)Loại active của user (New/Retain, Reactive) | [2]. Retention, [1]. New to service, [3]. Reactivation |
| `city` | STRING | Thành phố receiver sinh sốngThành phố receiver sinh sống | Hồ Chí Minh, Hà Nội, Bình Dương |
| `city_group` | STRING | Khu vực receiver sinh sốngKhu vực receiver sinh sống | Hồ Chí Minh, Tỉnh khác, Hà Nội |
| `age_group` | STRING | Độ tuổi của receiverĐộ tuổi của receiver | [2].18-22, [3].23-27, [4].28-35 |
| `age` | INTEGER | Tuổi của receiverTuổi của receiver | 19, 20, 21 |
| `promotion_lv1` | STRING | User 1st active tháng là Promo/OrganicUser 1st active tháng là Promo/Organic | [1]. Organic, [2]. Promotion |
| `promotion_lv2` | STRING | Loại Promotion (LV2) - BU definedLoại Promotion (LV2) - BU defined | [4]. Game, [2]. Mission, [3]. Scheme sender QR |
| `promotion_lv3` | STRING | Loại Promotion (LV3) - BU definedLoại Promotion (LV3) - BU defined | LX25, Đấu Trường Tri Thức, Quay Thưởng QR |
| `source` | STRING | Nguồn giao dịch thông qua AIO-QR | banner, noti |

### `momovn-prod.MBI_DA.LOAN_P2P_RECEIVER_SEGMENT_ALL`
> Bảng chứa thông tin về phân đoạn người nhận dịch vụ P2P cho vay theo tháng. Bảng này dùng để phân tích và nhóm đối tượng người nhận dựa trên các thuộc tính vay. 
Chứa dữ liệu phân loại người nhận dịch vụ P2P. 
Có thể sử dụng để theo dõi và phân tích hành vi của nhóm người nhận dịch vụ. 
Giúp xác định các mô hình vay và xu hướng trong người nhận dịch vụ P2P theo tháng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng mà dữ liệu phân đoạn người nhận dịch vụ P2P được ghi nhận. | 2025-05-01, 2025-04-01, 2025-03-01 |
| `user_id` | STRING | ID của người dùng nhận dịch vụ P2P. | 49499220, 18183072, 57029291 |
| `segment` | STRING | Phân đoạn của người nhận dịch vụ P2P trong tháng. | [5]. Driver phonebook, [3]. Social seller, [2]. Lookalike seller |
| `df` | STRING | Thuộc tính phân đoạn đặc biệt của người nhận dịch vụ P2P. | P2M, P2P |

### `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_FUNNEL_RECEIVING_SCREEN_AGGREGATION`
> Bảng tổng hợp dữ liệu về quá trình nhận giao dịch P2P thông qua QR trên màn hình nhận. Bảng này phục vụ việc phân tích hành vi người dùng bao gồm ghi nhận số lần click, số phiên, và thông tin người nhận. Mục đích có thể bao gồm:
 - Theo dõi và phân tích tình hình nhận giao dịch qua QR
 - Đánh giá các phân khúc người nhận theo loại hình hoạt động và nhóm tuổi
 - Tối ưu hóa quy trình tiếp cận và nhận giao dịch của người dùng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng của giao dịch được tổng hợp | 2024-02-01, 2024-06-01, 2025-12-01 |
| `date` | DATE | Ngày của giao dịch được tổng hợp | 2024-02-10, 2024-02-19, 2024-02-18 |
| `user_id` | STRING | ID của người thực hiện giao dịch P2P qua QR | 0, 68675720, 72435100 |
| `lv1_type` | STRING | Loại hình cấp 1 trong quy trình nhận giao dịch | [1]. Entry point |
| `lv2_type` | STRING | Điểm nhập (entry point) của quy trình nhận giao dịchentry point | [1]. Momo top icon, [2]. My profile, [14]. QR Payment - Bottom Nav |
| `click` | INTEGER | Số lần người dùng click trong quy trình nhận giao dịch | 1, 2, 3 |
| `session` | INTEGER | Số phiên người dùng tham gia vào quy trình nhận giao dịch | 1, 2, 3 |
| `user_type` | STRING | Loại người dùng trong quy trình nhận giao dịch | [1]. New to service, [2]. Retention, [3]. Reactivation |
| `receiver_id` | STRING | ID của người nhận trong giao dịch P2P qua QR | 35243800, 44530417, 51741205 |
| `CVR_1` | STRING | Tỷ lệ chuyển đổi bước 1 trong quy trình nhận giao dịch | 70419966, 35243800, 41720909 |
| `segment` | STRING | Phân khúc của người nhận giao dịch | [9]. Individual, [2]. Lookalike seller, [8]. Micro Seller |
| `city_group` | STRING | Nhóm thành phố của người nhận giao dịch | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam |
| `age_group` | STRING | Nhóm tuổi của người nhận giao dịch | [2].18-22, [4].28-35, [3].23-27 |

### `momovn-prod.MBI_DA.LOAN_P2P_TOTAL_RAW`
> Bảng raw dữ liệu về tổng khoản vay P2P cho người dùng. Bảng này cung cấp thông tin về các khoản vay giữa các ví MoMo trong một mốc thời gian nhất định. Bảng này có thể được sử dụng để: 
 - Theo dõi số lượng khoản vay P2P trong một khoảng thời gian. 
 - Phân tích lịch sử giao dịch vay của từng loại người dùng. 
 - Xác định xu hướng vay P2P theo thời gian.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng của khoản vay P2P. | 2025-12-01, 2025-11-01, 2024-12-01 |
| `date` | DATE | Ngày của khoản vay P2P. | 2025-12-01, 2026-01-01, 2024-07-01 |
| `user_id` | STRING | ID định danh cho người dùng MoMo tham gia vào giao dịch P2P. | 44785300, 64213359, 19541668 |
| `user_type` | STRING | Loại người dùng MoMo trong giao dịch vay P2P. | W2W, W2B, VIETQR |

### `momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU`
> User bật auto receive (nhận tiền tự động về Túi thần tài) hàng tháng. Thông tin có thể lấy từ bảng này bao gồm: 
- Ngày cuối cùng trong tháng có action bật auto receive
- Tháng có action bật auto receive
- Mã định danh và thông tin người dùng bật auto receive
- Mã định danh và thông tin người nhận tiền trong thángUser bật auto receive (nhận tiền tự động về Túi thần tài) hàng tháng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng có action bật auto receiveTháng có action bật auto receive | 2026-01-01, 2025-12-01, 2025-11-01 |
| `DATE` | DATE | Ngày cuối cùng trong tháng có action bật auto receiveNgày cuối cùng trong tháng có action bật auto receive | 2025-12-31, 2026-01-19, 2025-11-30 |
| `user_id` | STRING | UserID của người dùng bật auto receiveUserID của người dùng | 56578257, 66776936, 27785747 |
| `receiver_id` | STRING | User có nhận tiền trong cùng thángUser có nhận tiền trong cùng tháng | 63323121, 30372034, 39507978 |

### `momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_FUNNEL_ACTION_WITH_QR`
> Bảng lưu lại data có action với Mã QR (download, share, amount input, screenshot). 
Thông tin có thể lấy từ bảng này:
- Loại hành động cấp 1 và cấp 2 liên quan đến QR code.
- ID sự kiện khi tương tác với QR code.
- Thời gian và người dùng thực hiện hành động.Bảng lưu lại data có action với Mã QR (download, share, amount input, screenshot)

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `lv1_type` | STRING | Loại hành động cấp 1 khi người dùng tương tác với mã QR. | [3]. Action with QR |
| `lv2_type` | STRING | Loại hành động cấp 2 khi người dùng tương tác với mã QR. | [3]. Amount input, [1]. Download, [4]. Screenshot |
| `event_id` | STRING | ID của sự kiện khi người dùng thực hiện hành động với mã QR. | xK6XyrVaoYQCq_B0sMHks, T17QoD7y80xA_YdFwpDE-, dj0sB5LIIhCFhRodIrkIG |
| `trail_id` | STRING | ID mở rộng hoặc chuỗi theo dõi sự kiện trong hệ thống liên quan đến mã QR. | puoCvFCHX6Jjiu8InhXIl, dRNJgV7hxd9BIwJKV1uhb, wZhHx-84LABDar7HsbSKi |
| `user_id` | STRING | ID của người dùng thực hiện hành động với mã QR. | 96219246, 82195982, 48480087 |
| `datetime` | DATETIME | Thời điểm thực hiện hành động với mã QR. | 2025-10-04 20:37:58.956, 2024-09-20 19:46:40.532, 2025-06-03 21:16:17.126 |
| `date` | DATE | Ngày thực hiện hành động với mã QR. | 2024-02-10, 2025-12-10, 2024-02-19 |

## Memory
*7 entries — user-trained knowledge*

1. Không cần filter serviceid và statusid khi truy vấn số user nhận 2025đ qua QR nhận tiền MoMo trong tháng 6/2025 _P2P AIO_QR · 2025-07-28_
2. For metrics like MAU, DAU, TPV, user defines successful transactions as those with statusid = 2. This applies when using the statusid column, for example, from the momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_GENERAL_BEHAVIOR_TABLE. _P2P AIO_QR · 2025-06-20_
3. Để lấy tính năng quét mã QR thì lấy serviceid NOT LIKE '%upload%' _P2P AIO_QR · 2025-07-28_
4. Ngày login vào màn home phải nhỏ hơn hoặc bằng ngày active nhận tiền _2025-12-03_
5. Scheme nhận tiền 2025Đ là một promotion, cần filter promotion_lv1 = '[2]. Promotion' _P2P AIO_QR · 2025-08-11_
6. Dùng cột receiver_id trong bảng momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ORIGINAL_TABLE _2025-11-05_
7. Khi xử lý vấn đề liên quan tới lv1_type, không cần sử dụng '[1]. Entry point' _2025-12-29_
