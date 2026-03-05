# BU Payment: P2P W2W

**Domain ID:** `f3d8838b-5f96-4f78-8c39-2b146978dbd8`

## Description
Records all transaction of P2P W2W

## Tables

### `momovn-prod.MBI_DA.LOAN_P2P_W2W_RAW_MAPPING`
> Bảng momovn-prod.MBI_DA.LOAN_P2P_W2W_RAW_MAPPING chứa thông tin liên quan đến giao dịch chuyển tiền từ ví MoMo này sang ví MoMo kia (P2P W2W). 
Mục đích và ứng dụng của bảng này bao gồm: 
- Theo dõi và quản lý các khoản vay P2P W2W trên MoMo. 
- Phân tích xu hướng sử dụng và hiệu suất của các dịch vụ chuyển tiền giữa các ví MoMo. 
- Đánh giá và cải thiện trải nghiệm người dùng trong các dịch vụ chuyển tiền của MoMo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `TID` | STRING | Mã định danh cho giao dịch. | 115678362409, 115741341797, 115732499565 |
| `datetime` | DATETIME | Ngày và giờ thực hiện giao dịch. | 2024-07-31 19:21:44, 2025-01-29 00:52:48, 2025-01-29 00:43:03 |
| `DATE` | DATE | Ngày thực hiện giao dịch. | 2024-10-10, 2024-07-15, 2024-08-10 |
| `month` | DATE | Tháng thực hiện giao dịch. | 2024-07-01, 2024-10-01, 2024-08-01 |
| `user_id` | STRING | Mã định danh người dùng thực hiện giao dịch. | 89146178, 89146180, 87339451 |
| `receiver_id` | STRING | Mã định danh người nhận tiền trong giao dịch. | 92619653, 92511563, 84157961 |
| `SERVICE_CODE` | STRING | Mã dịch vụ liên quan đến giao dịch. | u2u, quynhom, cardcashin.balnapas05 |
| `SERVICEID` | STRING | Mã dịch vụ cho loại dịch vụ sử dụng trong giao dịch. | transfer_via_link_w2w, transfer_p2p, transfer_aioqr |
| `FUNDID` | FLOAT | Mã định danh cho nguồn quỹ trong giao dịch. | 2, 1, 6 |
| `AMOUNT` | FLOAT | Số tiền giao dịch. | 100000, 50000, 200000 |
| `COMMENT_VALUE` | STRING | Giá trị bình luận của người dùng trong giao dịch. | 🍛 Tiền ăn uống, Chuyển tiền theo yêu cầu rút quỹ,  |
| `PAYMENT_CHANNEL` | STRING | Kênh thanh toán sử dụng trong giao dịch. | payment_link, tab_p2p, myqr |

### `momovn-prod.MBI_DA.LOAN_P2P_W2W_USER_TYPE`
> Bảng này lưu trữ thông tin về các loại người dùng liên quan đến dịch vụ P2P và W2W của MoMo. 
Mục đích và trường hợp sử dụng của bảng:
- Xác định loại người dùng của dịch vụ P2P và W2W qua các thông tin như nhóm thành phố và nhóm tuổi.
- Phân tích xu hướng sử dụng dịch vụ P2P và W2W theo loại người dùng.
- Theo dõi sự thay đổi trong loại người dùng qua từng tháng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng cụ thể mà thông tin người dùng được ghi nhận. | 2024-02-01, 2023-12-01, 2023-01-01 |
| `user_id` | STRING | Mã định danh của người dùng sử dụng dịch vụ P2P và W2W. | 50426494, 40289467, 40689741 |
| `date` | DATE | Ngày cụ thể khi thông tin người dùng được ghi nhận. | 2024-02-01, 2024-07-01, 2023-12-01 |
| `user_type` | STRING | Loại người dùng của dịch vụ P2P và W2W. | 2. Retention, 3. Churn, 1. New |
| `city_group` | STRING | Nhóm thành phố nơi người dùng sinh sống. | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam |
| `age_group` | STRING | Nhóm tuổi của người dùng. | [3].18-23, [4].24-29, [5].30-40 |

### `momovn-prod.MBI_DA.LOAN_P2P_W2W_ERROR_TRANS_MAPPING`
> Bảng momovn-prod.MBI_DA.LOAN_P2P_W2W_ERROR_TRANS_MAPPING ghi lại thông tin về các lỗi trong giao dịch từ ví MoMo này sang ví MoMo khác (W2W) trong dịch vụ P2P. Người dùng có thể sử dụng bảng để: 
- Theo dõi lỗi giao dịch giữa các ví MoMo 
- Phân tích các giao dịch không thành công 
- Đánh giá hiệu quả của dịch vụ P2P W2W.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `TID` | STRING | Mã giao dịch duy nhất cho mỗi giao dịch lỗi trong dịch vụ P2P W2W. | 98699282702, 98674817538, 98666226277 |
| `datetime` | DATETIME | Thời gian cụ thể khi lỗi giao dịch xảy ra. | 2025-08-29 02:23:18, 2025-07-23 11:17:17, 2025-08-29 02:23:41 |
| `DATE` | DATE | Ngày mà lỗi giao dịch xảy ra. | 2025-09-10, 2025-09-03, 2025-09-30 |
| `month` | DATE | Tháng mà lỗi giao dịch xảy ra. | 2025-09-01, 2025-08-01, 2025-07-01 |
| `user_id` | STRING | Mã định danh của người dùng liên quan đến giao dịch lỗi. | 77308674, 46603063, 66107599 |
| `AMOUNT` | FLOAT | Số tiền trong giao dịch lỗi. | 100000, 50000, 111 |
| `STATUSID` | INTEGER | Mã trạng thái của giao dịch lỗi. Mỗi giá trị biểu thị một trạng thái cụ thể của giao dịch. | 6 |
| `result_code` | STRING | Mã kết quả của giao dịch lỗi. | 1001, 16, 4432 |
| `ERROR` | STRING | Mô tả về lỗi xảy ra trong giao dịch P2P W2W. | Insufficient funds, Target suspended, Ví MoMo của người nhận đang bị đóng vì chưa xác thực sinh trắc học theo Thông tư 40/2024/TT-NHNN. |
| `VI_DESC` | STRING | Mô tả chi tiết bằng tiếng Việt về lỗi của giao dịch. | Tài khoản không đủ tiền, Tài khoản người nhận tạm ngưng hoạt động, Ví MoMo của người nhận đang bị đóng do không liên kết với tài khoản thanh toán/thẻ ghi nợ nào. |

### `momovn-prod.MBI_DA.P2P_DEVICE_TYPE`
> Bảng chứa thông tin về loại thiết bị mà người dùng sử dụng để thực hiện giao dịch P2P trên MoMo. Các dữ liệu này có thể được sử dụng để phân tích hành vi người dùng theo loại thiết bị, đánh giá hiệu suất của các thiết bị, và để theo dõi các hệ điều hành được sử dụng phổ biến nhất.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng khi giao dịch P2P được thực hiện. | 2024-08-01, 2024-05-01, 2024-06-01 |
| `user_id` | STRING | Mã định danh của người dùng thực hiện giao dịch P2P. | 53172170, 9537090, 79293386 |
| `device` | STRING | Loại thiết bị mà người dùng sử dụng để thực hiện giao dịch P2P. | iphone 12 pro max, iphone 11, iphone 11 pro max |
| `device_os` | STRING | Hệ điều hành của thiết bị người dùng sử dụng trong giao dịch P2P. | IOS, ANDROID, ios |
| `device_performance` | STRING | Hiệu suất hoạt động của thiết bị khi thực hiện giao dịch P2P. | high-end, low-end |

### `momovn-prod.MBI_DA.P2P_W2W_USER_RETENTION_TYPE`
> Chứa thông tin liên quan đến active_type của user có user_type là Retention. Active type ở đây bao gồm '01. Active 2M', '02. Active 3M', '03. Active at least 4M'. Bảng này giúp phân loại và theo dõi mức độ hoạt động của người dùng thuộc nhóm Retention theo thời gian. Người dùng có thể tìm kiếm thông tin về: 
- Thời gian hoạt động của người dùng trong các thành phố khác nhau 
- Phân loại người dùng theo nhóm tuổi 
- Mã định danh của người dùng để phân tích hành vichứa thông tin liên quan đến active_type của user có user_type là Retention. Active type ở đây bao gồm '01. Active 2M' , '02. Active 3M', '03. Active at least 4M'

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng mà dữ liệu được ghi nhận | 2024-01-01, 2024-02-01, 2024-07-01 |
| `date` | DATE | Ngày mà dữ liệu được ghi nhận | 2024-02-01, 2024-10-01, 2024-07-01 |
| `user_type` | STRING | Loại người dùng, với giá trị cụ thể là Retention | 02. Retention, 2. Retention |
| `user_id` | STRING | Mã định danh của người dùng | 3622688, 41547779, 50426639 |
| `city_group` | STRING | Nhóm thành phố mà người dùng thuộc về | Hồ Chí Minh, KCN Miền Nam, Tỉnh khác |
| `age_group` | STRING | Nhóm tuổi của người dùng | [3].18-23, [4].24-29, [5].30-40 |
| `active_type` | STRING | Loại hoạt động của người dùng, bao gồm '01. Active 2M', '02. Active 3M', '03. Active at least 4M' | 03. Active at least 4M, 01. Active 2M, 02. Active 3M |

### `momovn-prod.MBI_DA.HOANG_P2P_W2W_ACQUISITION_SOURCE_FOR_TRACKING`
> Bảng momovn-prod.MBI_DA.HOANG_P2P_W2W_ACQUISITION_SOURCE_FOR_TRACKING theo dõi nguồn gốc của người dùng P2P và W2W. Thông tin từ bảng này có thể được sử dụng để: 
 - Phân tích nguồn gốc người dùng dựa trên scheme hoặc organic.
 - Theo dõi xu hướng người dùng theo thời gian và theo vùng.
 - Đo lường và đánh giá hiệu quả của các chương trình khuyến mãi và chiến dịch tiếp thị.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng trong năm. | 2024-10-01, 2024-12-01, 2024-11-01 |
| `user_id` | STRING | Mã định danh người dùng MoMo. | 76790928, 81728715, 38965602 |
| `region` | STRING | Vùng địa lý của người dùng. | Hồ Chí Minh, KCN Miền Nam, Tỉnh khác |
| `amount` | FLOAT | Số tiền giao dịch. | 100000, 50000, 111 |
| `date` | DATE | Ngày thực hiện giao dịch. | 2024-10-01, 2024-11-01, 2024-12-01 |
| `day` | INTEGER | Ngày trong tháng. | 1, 2, 3 |
| `user_type` | STRING | Loại người dùng. | 2. Retention, 3. Churn, 1. New |
| `acq_source_lv1` | STRING | Nguồn gốc level 1: chia 2 loại, Scheme hoặc Organic.level 1: chia 2 type, Scheme hoặc Organic | Organic, Scheme, <= 1K not scheme |
| `acq_source_lv2` | STRING | Nguồn gốc level 2: chia thành các loại scheme như Voucher, Fixed Amount, Game, CRM, Conm...level 2: chia thành các loại scheme như Voucher, Fixed Amount, Game, CRM, Conm... | 01. > 1K, 01. CRM, 08. <= 1K not scheme |
| `acq_source_lv3` | STRING | Nguồn gốc level 3: chia cụ thể các scheme của level 2 thành từng gift_id, game_id...level 3: chia cụ thể các scheme của level 2 thành từng gift_id, game_id... | > 1K, CRM 111đ, <= 1K not scheme |
| `tid` | STRING | Mã định danh giao dịch. | 79128604875, 79083835409, 79064466242 |
| `serviceid` | STRING | Mã dịch vụ liên quan đến giao dịch. | transfer_p2p, transfer_via_link_w2w, transfer_myqr |

### `momovn-prod.MBI_DA.LOAN_2022_NEWTOMOMO_usecase`
> Bảng loan 2022 new to momo, sử dụng cho trường hợp mới tham gia MoMo.
Thông tin có thể được lấy từ bảng này bao gồm:
- Phân tích các trường hợp sử dụng MoMo mới.
- Đánh giá mức độ phổ biến của dịch vụ theo thành phố và nhóm tuổi.
- Xác định người dùng có hành vi gian lận dựa trên các chỉ số đã thu thập.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `TID` | FLOAT | ID giao dịch, định danh giao dịch cụ thể. | 745107119, 933470043, 3837146993 |
| `AGENTID` | FLOAT | Mã định danh cho mỗi ví MoMo. | 68717914, 26853652, 34557623 |
| `month` | DATE | Tháng thực hiện giao dịch. | 2022-03-01, 2022-04-01, 2022-05-01 |
| `date` | DATE | Ngày thực hiện giao dịch. | 2020-03-22, 2020-10-27, 2022-08-25 |
| `service_code` | STRING | Mã dịch vụ liên quan đến hóa đơn. | u2u, cashinbank, m4becomadyen_apple |
| `Mar22_Level1_BUName` | STRING | Tên đơn vị kinh doanh cấp độ 1 vào tháng 3 năm 2022. | BU_P2P, BU_VTTI, BU_DLS |
| `Mar22_Level2_Usecase` | STRING | Trường hợp sử dụng cấp độ 2 vào tháng 3 năm 2022. | AIRTIME, P2P - EWALLET TO EWALLET, CI Bank |
| `Mar22_Level3_SubUsecase` | STRING | Phân loại trường hợp sử dụng vào tháng 3 năm 2022 ở cấp độ 3. | AIRTIME, P2P - EWALLET TO EWALLET, CI Bank |
| `city` | STRING | Tên thành phố nơi diễn ra giao dịch. | Hồ Chí Minh, Hà Nội, UNKNOWN |
| `citygroup` | STRING | Nhóm thành phố cho phân loại địa lý. | Tỉnh khác, Hà Nội, Hồ Chí Minh |
| `age_group` | STRING | Nhóm tuổi của người sử dụng dịch vụ. | others, [2].18-22, [4].28-35 |
| `cheat_user` | FLOAT | Người dùng bị phát hiện có hành vi gian lận, giá trị 1 nếu phát hiện, 0 nếu không. | 102751296, 21278156, 96223331 |

### `momovn-prod.MBI_DA.HA_P2P_GIFT`
> Bảng chứa thông tin về quà tặng P2P (Peer-to-Peer) trên nền tảng MoMo. Thông tin lấy từ bảng này bao gồm: 
- Loại dịch vụ quà tặng P2P 
- Thời gian giao dịch quà tặng 
- Nguồn gốc giao dịch quà tặng 
- Số tiền và loại quà tặng 
- Thông tin người dùng liên quan đến giao dịch quà tặng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `service` | STRING | Tên dịch vụ liên quan đến quà tặng P2P. | W2B, W2W |
| `month` | DATE | Tháng diễn ra giao dịch quà tặng. | 2024-10-01, 2025-12-01, 2025-11-01 |
| `date` | DATE | Ngày diễn ra giao dịch quà tặng. | 2025-12-11, 2024-10-10, 2025-12-01 |
| `datetime` | DATETIME | Thời điểm cụ thể diễn ra giao dịch quà tặng. | 2024-10-10 00:00:00, 2024-10-11 00:00:00, 2024-10-05 00:00:00 |
| `source` | STRING | Nguồn gốc của giao dịch quà tặng. | kgs_sp302_w2b_iphone_7d_cb, kgs_sp302_w2b_copytransfer_cb, kgs_sp_w2w_tid_0424 |
| `gift_id` | STRING | Mã định danh của quà tặng P2P. | gift_M1J44C0C_0, gift_M0NQK0FB_5, rw_w2b_awo_251209_cbttt_100pt1k_dx1n5 |
| `amount` | FLOAT | Số tiền liên quan đến giao dịch quà tặng. | 1000, 7, 2000 |
| `p2p_amount` | FLOAT | Số tiền P2P liên quan đến quà tặng. | 10000, 2000, 100000 |
| `user_id` | STRING | Mã định danh của người dùng liên quan đến giao dịch quà tặng. | 18441403, 44195664, 40577643 |
| `gift_type` | STRING | Loại quà tặng P2P. | Voucher, Cashback - CAMPAIGN |
| `TID_gift` | STRING | Mã định danh giao dịch quà tặng. | 52515987715, 68799621627, 68851010007 |
| `PARENTID` | STRING | Mã định danh cha của quà tặng. | 0, 58283213918, 69833637115 |

## Memory
*9 entries — user-trained knowledge*

1. active_type không cần thiết khi truy vấn số lượng người dùng đang hoạt động đã chuyển tiền _P2P W2W · 2025-06-23_
2. Các giá trị sau đây là lời nhắn mặc định: 'Ngàn lần như ý, vạn lần như mơ, triệu sự bất ngờ, tỷ lần hạnh phúc 🤗', 'Tết này Li xi cho em 2 tỷ - Hai tỷ cún: Hun tỷ cái! 💓', 'Năm mới hoan hỉ, sức khỏe bền bỉ, công danh đắc tài 🤗💪', 'Chúc ngoan xinh yêu của anh năm mới vui vẻ! 😘', 'Chúc Tết đến trăm điều như ý - Mừng xuân sang vạn sự thành công 💯', 'Chúc bạn mệt mỏi vì học giỏi. Buồn phiền vì nhiều tiền 😍', 'Chúc bạn 12 tháng phú quý, 365 ngày phát tài, 8.760 giờ sung túc', 'Chúc bạn năm mới luôn rực rỡ như vì tinh tú trên bầu trời ✨', 'Chỉ cần có em, mỗi ngày trong năm đều là Valentine ngọt ngào! 💓', 'Anh không giỏi nói lời yêu, nhưng thương mối tình này là điều quý giá nhất', 'Trái tim em thuộc về anh, hôm nay, ngày mai và mãi mãi. 💓', 'Chúc ngoan xinh yêu của anh Valentine vui vẻ 😘', 'Chúc cậu 8/3 ngọt ngào, xinh đẹp và luôn gặp được điều tuyệt vời nhất!', 'Chúc mừng mẹ mỗi ngày đều rạng rỡ như hoa, ngập tràn niềm vui và hạnh phúc!', 'Chúc bạn tuổi mới thật rực rỡ và hạnh phúc nhé 🎂💗', 'Chúc bạn tuổi mới thêm nhiều niềm vui, vạn điều như ý, không đếm tuổi! 💪', 'Gửi những lời chúc tốt đẹp nhất và ngọt ngào nhất đến em 💗', 'Mong những điều may mắn và tốt đẹp nhất sẽ đến với bạn trong tuổi mới này! 💗', 'Chúc cho lửa mãi hương nồng - Rằng lòng đâu bạc vẫn còn có nhau! 💗', 'Chúc cho cuộc sống hạnh phúc, luôn được yêu thương và trân trọng 💗', 'Đi đâu thì cũng nhớ tụi mình đó nghen! 😘', 'Quá tự hào bạn tôi!! 😻', '100 điểm, quá xứng đáng 💯', 'Cảm ơn vì những ngày tháng cùng cày KPI! 💪', 'Gửi liên lạc nhé bạn ơi! 💗', 'Đừng giận nữa mà 🥺', 'Thương thương ❤️', 'Miss you 😘', 'Love you ❤️', 'Bạn để đời luôn', 'Nói đúng bạn nhỉ nha 😋', 'Đừng quên uống nước đó!', 'Hôm nào gặp nhé!', 'Quẩy lên 🥳', 'OK bạn nhé!', 'Con gửi ba nhé 💗', 'Con gửi mẹ nhé 💗', 'Gửi gia đình mình nha 💗', 'Cảm ơn ba 💗', 'Cảm ơn mẹ 💗' _P2P W2W · 2025-07-16_
3. SERVICEID = "transfer_masking" có nghĩa là dịch vụ chuyển tiền mà thông tin người gửi hoặc người nhận được ẩn đi để bảo mật. _2026-01-09_
4. Khi truy vấn số lượng người dùng đã sử dụng tính năng quét mã QR, cần chọn DISTINCT user_id thay vì PAYMENT_CHANNEL _P2P W2W · 2025-07-01_
5. Lời nhắn chuyển tiền = comment_value _P2P W2W · 2025-07-15_
6. Người dùng hoạt động không cần lọc theo active_type, người dùng hoạt động được hiểu là tất cả các active_type _P2P W2W · 2025-06-23_
7. Khi đếm số lượng người dùng đang hoạt động đã chuyển tiền, cần sử dụng count(distinct user_id) _P2P W2W · 2025-06-24_
8. Để truy vấn số lượng người dùng đã sử dụng tính năng quét mã QR, cần lọc theo month = '2025-05-01' và SERVICEID chứa '%qr%' _P2P W2W · 2025-07-01_
9. sản phẩm gửi thiệp là SERVICEID = 'transfer_luckymoney' _P2P W2W · 2025-07-28_
