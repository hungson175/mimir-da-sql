# BU Payment: P2P W2B

**Domain ID:** `526c040d-6956-4cb9-8919-87828de05cfc`

## Description
records all transaction of P2P W2B

## Tables

### `momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING`
> Bảng lưu trữ dữ liệu gốc của các giao dịch cho vay P2P (peer-to-peer) từ ví cá nhân (P) sang doanh nghiệp (B) – W2B. Bao gồm thông tin giao dịch, kênh thanh toán, quỹ, phí và thông tin ngân hàng liên quan.

Thông tin có thể lấy từ bảng này:
- Theo dõi chi tiết giao dịch cho vay P2P W2B theo thời gian thực.
- Phân tích quỹ, mức phí và kênh thanh toán được sử dụng.
- Kiểm tra thông tin ngân hàng và tên chủ tài khoản liên quan đến giao dịch.Bảng lưu trữ dữ liệu gốc của các giao dịch cho vay P2P (peer-to-peer) từ ví cá nhân (P) sang doanh nghiệp (B) – W2B. Bao gồm thông tin giao dịch, kênh thanh toán, quỹ, phí và thông tin ngân hàng liên quan.

Thông tin có thể lấy từ bảng này:
- Theo dõi chi tiết giao dịch cho vay P2P W2B theo thời gian thực.
- Phân tích quỹ, mức phí và kênh thanh toán được sử dụng.
- Kiểm tra thông tin ngân hàng và tên chủ tài khoản liên quan đến giao dịch.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `TID` | STRING | Mã giao dịch duy nhất của từng lần cho vay P2P W2B.Mã giao dịch duy nhất của từng lần cho vay P2P W2B.  **Sample value**: 72496663426, 72438871822, 72500705128 | 112704777407, 112725474447, 112651059438 |
| `datetime` | DATETIME | Thời điểm giao dịch được tạo, gồm cả ngày và giờ.Thời điểm giao dịch được tạo, gồm cả ngày và giờ.  **Sample value**: 2024-11-27 21:16:46, 2024-11-27 07:35:51, 2024-11-27 22:35:19 | 2025-11-11 19:38:58, 2025-11-10 17:52:23, 2025-12-15 19:17:26 |
| `DATE` | DATE | Ngày diễn ra giao dịch.Ngày diễn ra giao dịch.  **Sample value**: 2024-11-27 | 2026-01-10, 2026-01-15, 2026-01-17 |
| `month` | DATE | Tháng tương ứng của giao dịch, luôn là ngày đầu tiên của tháng.Tháng tương ứng của giao dịch, luôn là ngày đầu tiên của tháng.  **Sample value**: 2024-11-01 | 2025-12-01, 2026-01-01, 2025-11-01 |
| `user_id` | STRING | Sender, người thực hiện giao dịch, người chuyển tiền W2B.sender, người thực hiện giao dịch, người chuyển tiền W2B | 25847745, 76962598, 63631128 |
| `SERVICE_CODE` | STRING | Mã dịch vụ liên quan đến giao dịch cho vay. | cardcashout.mbbank_w2b, cardcashout.balvccb_cashout, cardcashout.0911597342 |
| `SERVICEID` | STRING | Mã định danh dịch vụ cho giao dịch cho vay. | transfer_p2b_scan_vietqr, transfer_p2b, transfer_p2b_scan_vietqr_upload |
| `FUNDID` | FLOAT | Nguồn tiền, SOF (source of fund).Nguồn tiền, SOF (source of fund) | 1, 2, 6 |
| `AMOUNT` | FLOAT | Số tiền gốc của giao dịch cho vay (đơn vị VND).Số tiền gốc của giao dịch cho vay (đơn vị VND).  **Sample value**: 2000.0, 5000.0, 10000.0 | 50000, 100000, 20000 |
| `TOTAL_AMOUNT` | FLOAT | Tổng số tiền giao dịch (thường bằng AMOUNT, chưa bao gồm phí).Tổng số tiền giao dịch (thường bằng AMOUNT, chưa bao gồm phí).  **Sample value**: 2000.0, 5000.0, 10000.0 | 50000, 100000, 20000 |
| `FEE` | FLOAT | Phí giao dịch được tính; 0 nếu miễn phí.Phí giao dịch được tính; 0 nếu miễn phí.  **Sample value**: 0.0, 3333.0 | 0, 3950, 4600 |
| `BANK_ACC_NO` | STRING | Số tài khoản ngân hàng nhận tiền.Số tài khoản ngân hàng nhận tiền. | — |
| `BANK_NAME` | STRING | Tên ngân hàng của tài khoản nhận tiền.Tên ngân hàng của tài khoản nhận tiền.  **Sample value**: ABBank | MBBank, Vietcombank, Techcombank |
| `ACC_NAME` | STRING | Tên chủ tài khoản ngân hàng nhận tiền.Tên chủ tài khoản ngân hàng nhận tiền. | — |
| `BENF_PHONE_NUMBER_DETECT_AID` | STRING | Số điện thoại của người hưởng lợi được phát hiện qua mã ID. | 47430166, 72867953, 96112399 |
| `PAYMENT_CHANNEL` | STRING | Kênh thanh toán hoặc tab mà giao dịch được thực hiện.Kênh thanh toán hoặc tab mà giao dịch được thực hiện.  **Sample value**: tab_p2p, trans_result_success | scan_vietqr, scan_vietqr_upload, bank_popular |

### `momovn-prod.MBI_DA.LOAN_P2P_W2B_ERROR_TRANS_RAW`
> Giao dịch bị lỗi kèm thông tin: mã lỗi, bank bị lỗi và giải thích về lỗi đó. Bảng này dùng để ghi lại các thông tin giao dịch bị lỗi giữa ví người dùng và ngân hàng, bao gồm mã lỗi, tên ngân hàng bị lỗi và thông điệp phản hồi lỗi. Bảng này có thể được sử dụng để xác định các vấn đề thường gặp trong giao dịch, hỗ trợ xử lý và khắc phục lỗi nhanh chóng, đồng thời cung cấp thông tin cho việc phân tích lỗi giao dịch.Giao dịch bị lỗi kèm thông tin: mã lỗi, bank bị lỗi và giải thích về lỗi đó

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng phát sinh lỗi giao dịch. | 2025-11-01, 2025-10-01, 2025-12-01 |
| `date` | DATE | Ngày phát sinh lỗi giao dịch. | 2025-11-10, 2025-11-13, 2025-10-10 |
| `tid` | STRING | Mã định danh cho mỗi giao dịch. | 1763009237303, 1763004988665, 1758553609009 |
| `user_id` | STRING | Mã định danh của người dùng liên quan đến giao dịch lỗi. | 51895755, 107517346, 106083142 |
| `response_code` | STRING | Mã lỗi trả về từ giao dịch. | 1001, -9999, -200101 |
| `RESPONSE_MESSAGE` | STRING | Thông điệp phản hồi mô tả chi tiết về lỗi trong giao dịch. | Da co loi xay ra trong qua trinh xu ly, ban vui long thu lai giup Momo nhe., He thong chuyen tien lien ngan hang dang bao tri. Xin quy khach vui long thu lai sau., Co loi xay ra trong qua trinh thuc hien giao dich. Ban thu lai trong giay lat nhe. |
| `bank_name` | STRING | Tên ngân hàng liên quan đến lỗi giao dịch. | Techcombank, MBBank, Vietcombank |

### `momovn-prod.MBI_DA.TUAN_P2P_W2B_EXC_VIETQR_ACQUISITION_ALL_SOURCES`
> Bảng này lưu trữ thông tin liên quan đến việc thu hút khách hàng thông qua tất cả các nguồn cho giao dịch từ ví MoMo sang ngân hàng ngoại trừ VietQR. Thông tin có thể lấy từ bảng này bao gồm: 
- Thời gian giao dịch với cột 'month', 'date' và 'datetime'.
- Mã giao dịch và dịch vụ thông qua cột 'tid' và 'serviceid'.
- Số tiền giao dịch với 'amount'.
- Phân loại người dùng và vùng địa lý qua 'user_type' và 'citygroup'.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng giao dịch. | 2025-12-01, 2026-01-01, 2025-11-01 |
| `date` | DATE | Ngày giao dịch. | 2025-12-01, 2026-01-01, 2025-11-01 |
| `datetime` | DATETIME | Thời gian chi tiết giao dịch. | 2024-11-01 10:13:31, 2025-09-01 18:16:14, 2024-09-01 17:46:07 |
| `tid` | STRING | Mã định danh duy nhất cho mỗi giao dịch. | 34725838234, 34681368200, 34687293409 |
| `serviceid` | STRING | Mã dịch vụ liên quan đến giao dịch. | transfer_p2b, transfer_p2b_scan_vietqr_upload, transfer_p2b_globalsearch |
| `user_id` | STRING | ID người dùng tham gia giao dịch. | 33944377, 40263048, 65130831 |
| `amount` | FLOAT | Số tiền của giao dịch. | 100000, 200000, 50000 |
| `user_type` | STRING | Loại người dùng tham gia giao dịch. | 02. Retention, 2. Retention, 03. Reactivation |
| `citygroup` | STRING | Phân nhóm thành phố nơi thực hiện giao dịch. | Thành Phố Hồ Chí Minh, Tỉnh khác, KCN Miền Nam |
| `lv1_acq` | STRING | Level 1: chia 2 type, Scheme hoặc Organic.level 1: chia 2 type, Scheme hoặc Organic | [1]. Organic, [2]. Scheme |
| `lv2_acq` | STRING | Level 2: chia thành các loại scheme như Voucher, Fixed Amount, Game.level 2: chia thành các loại scheme như Voucher, Fixed Amount, Game... | [2]. > 10K, [1]. <= 10K, 01. Voucher |
| `lv3_acq` | STRING | Level 3: chia cụ thể các scheme của level 2 thành từng gift_id, game_id.level 3: chia cụ thể các scheme của level 2 thành từng gift_id, game_id... | [2]. > 10K, [1]. <= 10K, Scheme 2024đ |

### `momovn-prod.MBI_DA.LOAN_P2P_W2B_USER_TYPE`
> Bảng chứa thông tin về người dùng liên quan đến các khoản vay P2P W2B. Các thông tin có thể lấy từ bảng này bao gồm:
- Xác định loại người dùng dựa trên số lượng giao dịch và xếp hạng.
- Phân tích xu hướng người dùng theo nhóm tuổi và khu vực thành phố.
- Theo dõi sự thay đổi của người dùng qua các tháng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng của giao dịch hoặc hoạt động. | 2025-12-01, 2026-01-01, 2025-11-01 |
| `user_id` | STRING | Mã định danh người dùng liên quan đến khoản vay. | 43801703, 42394269, 42834373 |
| `date` | DATE | Ngày thực hiện giao dịch hoặc hoạt động. | 2025-12-01, 2026-01-01, 2025-11-01 |
| `user_type` | STRING | Loại người dùng trong các giao dịch P2P W2B. Có thể là người cho vay hoặc người vay. | 2. Retention, 3.Reactive, 1. New |
| `city_group` | STRING | Nhóm thành phố nơi người dùng sống. Dùng để phân loại theo khu vực địa lý. | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam |
| `age_group` | STRING | Nhóm tuổi của người dùng. Dùng để phân loại theo độ tuổi. | [3].18-23, [4].24-29, [5].30-40 |

### `momovn-prod.MBI_DA.P2P_W2B_USER_NEW`
> Bảng này chứa thông tin người dùng mới trong hoạt động chuyển tiền P2P và W2B. Thông tin có thể được sử dụng để phân tích số lượng người dùng mới theo tháng. Theo dõi hoạt động giao dịch của người dùng. Nghiên cứu tác động của nguồn tiền và hình thức chuyển tiền.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng thực hiện giao dịch hoặc sự kiện của người dùng mới. | 2025-12-01, 2025-11-01, 2024-09-01 |
| `date` | DATE | Ngày thực hiện giao dịch hoặc sự kiện của người dùng mới. | 2024-07-01, 2026-01-12, 2024-07-10 |
| `user_id` | STRING | Mã định danh người dùng mới. | 104693443, 99819220, 30872829 |
| `ntmm_p2p` | STRING | Thông tin chuyển tiền P2P của người dùng mới. | 61864416, 95156702, 102769333 |
| `ntmm` | STRING | Thông tin liên quan đến người dùng mới. | 94105987, 101616201, 101944004 |

### `momovn-prod.MBI_DA.P2P_W2B_USER_RETENTION_TYPE`
> Bảng momovn-prod.MBI_DA.P2P_W2B_USER_RETENTION_TYPE chứa thông tin về việc giữ chân người dùng chuyển tiền giữa ví MoMo và ví doanh nghiệp. Dữ liệu từ bảng này có thể được sử dụng để phân tích hành vi người dùng theo tháng, đánh giá sự tương tác của người dùng trong các nhóm tuổi và khu vực địa lý khác nhau, cũng như phân loại người dùng dựa trên mức độ hoạt động.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng ghi nhận dữ liệu. | 2025-12-01, 2026-01-01, 2025-11-01 |
| `date` | DATE | Ngày ghi nhận dữ liệu. | 2025-12-01, 2026-01-01, 2025-11-01 |
| `user_id` | STRING | Định danh của người dùng, mã hóa để bảo mật thông tin cá nhân. | 63824741, 82987624, 59590842 |
| `user_type` | STRING | Loại người dùng, phân loại theo hình thức sử dụng dịch vụ (ví dụ: cá nhân, doanh nghiệp). | 2. Retention, 02. Retention |
| `citygroup` | STRING | Nhóm thành phố nơi người dùng sinh sống, có thể dùng để phân tích địa lý. | Thành Phố Hồ Chí Minh, Tỉnh khác, KCN Miền Nam |
| `age_group` | STRING | Nhóm tuổi của người dùng, dùng để phân tích hành vi người dùng theo nhóm tuổi. | [3].18-23, [2].18-22, [4].24-29 |
| `active_type` | STRING | Loại hoạt động của người dùng, xác định mức độ hoạt động của người dùng trên MoMo. | 03. Active at least 4M, 01. Active 2M, 02. Active 3M |

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

## Memory
*24 entries — user-trained knowledge*

1. Để tính số lượng user active hàng ngày của dịch vụ W2B, cần sử dụng bảng MINH_P2P_W2B_ALL_TRANS_MIMIR thay vì LOAN_P2P_W2B_FUNNEL_E2E_EVENT_AGG _P2P W2B · 2025-06-19_
2. Schema 5M: CASE 3 - amount + amount_before > 50M THEN (amount - (5000000 - amount_before) - 45000000) * 0.008 + 45000000 * 0.0065 + 3300 if amount_before < 5M, else (50000000 - amount_before) * 0.0065 + (amount + amount_before - 50000000) * 0.008 + 3300 if amount_before < 50M, else amount * 0.008 + 3300 _P2P W2B · 2025-06-05_
3. Service_ID "banklink_cashin" không tồn tại trong dữ liệu W2B, chỉ có "banklink_cashout_napas". Banklink_cashin có thể có nghĩa là dịch vụ nạp tiền từ ngân hàng liên kết vào ví MoMo (cash in = tiền vào) _2025-12-22_
4. tất cả các giao dịch trong bảng momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING, lấy điều kiện này (serviceid <> 'transfer_p2b_scan_vietqr' OR serviceid IS NULL) _2026-01-15_
5. Điều kiện lọc giao dịch W2B: (SERVICEID <> 'transfer_p2b_scan_vietqr' OR SERVICEID IS NULL) _P2P W2B · 2025-06-05_
6. TTT là viết tắt của Túi Thần Tài, tương ứng với FUNDID = 6 _P2P W2B · 2025-06-19_
7. Cách tính scheme_5M:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_10M:
- CASE 1 (amount + amount_before <= 10M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (10M < amount + amount_before <= 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 10M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_5M_freeTTT:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300. _2026-01-15_
8. Trong "schema 5M" không có quy định liên quan đến money_source. Tất cả các giao dịch trong bảng momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING cần được lọc với điều kiện (SERVICEID <> 'transfer_p2b_scan_vietqr' OR SERVICEID IS NULL) _2026-01-15_
9. Cách tính revenue theo các schema dựa vào số lượng giao dịch và amount trong tháng _P2P W2B · 2025-06-05_
10. Schema 5M: CASE 1 - amount + amount_before <= 5M THEN (amount * 0.0065 + 3300) if tran_before > 30, else 0 _P2P W2B · 2025-06-05_
11. Trong "schema 5M", không có quy định liên quan đến money_source _P2P W2B · 2025-06-05_
12. Cách tính scheme_5M:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_10M:
- CASE 1 (amount + amount_before <= 10M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (10M < amount + amount_before <= 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 10M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_5M_freeTTT:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300. _2026-01-15_
13. Trong "schema 5M" không có quy định liên quan đến money_source _2026-01-15_
14. FUNDID mapping: 1=momo, 2=bank_link, 3=napas, 4=visa debit, 5=visa credit, 6=TTT, 7=pay_later, 8=cashback, 9=visa ao ccm, 10=BNPL, 11=newton, 12=direct debit, 13=group fund, 14=transfer _P2P W2B · 2025-06-05_
15. Schema 5M: CASE 2 - 5M < amount + amount_before <= 50M THEN (amount - (5000000 - amount_before)) * 0.0065 + 3300 if amount_before < 5M, else amount * 0.0065 + 3300 _P2P W2B · 2025-06-05_
16. Mã lỗi -100031 có nghĩa là "Thẻ quà tạm hết lượt sử dụng." _P2P W2B · 2025-07-22_
17. "người dùng mới của MoMo" = người có 1st active trans (trong cả lifetime) trong tháng _P2P W2B · 2025-08-11_
18. Cách tính scheme_5M:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_10M:
- CASE 1 (amount + amount_before <= 10M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (10M < amount + amount_before <= 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 10M, phí = (amount - (10M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 10M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300.

Cách tính scheme_5M_freeTTT:
- CASE 0 (SOF TTT=free): Khi money_source = '[1]. TTT' thì phí là 0.
- CASE 1 (amount + amount_before <= 5M):
    - Nếu 1 + tran_before > 30, phí = amount * 0.0065 + 3300.
    - Ngược lại, phí = 0.
- CASE 2 (5M < amount + amount_before <= 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before)) * 0.0065 + 3300.
    - Ngược lại, phí = amount * 0.0065 + 3300.
- CASE 3 (amount + amount_before > 50M):
    - Nếu amount_before < 5M, phí = (amount - (5M - amount_before) - 45M) * 0.008 + 45M * 0.0065 + 3300.
    - Nếu amount_before >= 5M và amount_before < 50M, phí = (50M - amount_before) * 0.0065 + (amount + amount_before - 50M) * 0.008 + 3300.
    - Ngược lại, phí = amount * 0.008 + 3300. _2026-01-15_
19. Nhóm 'hard core' bao gồm '[3]. Super hardcore' hoặc '[4]. Hardcore upload' _P2P W2B · 2025-06-10_
20. Khi tính số user có giao dịch đầu tiên trong tháng 10/2025 với giá trị 2025, không bao gồm serviceid 'transfer_p2b_scan_vietqr', cần sử dụng bảng 'momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING' và đảm bảo chỉ lấy giao dịch đầu tiên của mỗi user trong tháng bằng cách sử dụng ROW_NUMBER() _2025-10-15_
21. MAU VietQR/W2B: active dịch vụ VietQR hoặc W2B và chỉ tính users có giao dịch đầu tiên tháng. Nếu user A dùng VietQR đầu tiên thì count là MAU VietQR, nếu user đó sau đó dùng W2B và giao dịch đó là first active thì count MAU W2B luôn và user đó vẫn là MAU VietQR = người này là overlap VietQR và W2B. Overlap VietQR và W2B nghĩa là tháng đó có active 2 dịch vụ. Only VietQR hoặc W2B nghĩa là tháng đó active chỉ VietQR hoặc chỉ W2B. _2026-01-14_
22. MAU (Tổng VietQR): Tổng số người dùng có ít nhất một giao dịch VietQR trong tháng. MAU (Tổng W2B): Tổng số người dùng có ít nhất một giao dịch W2B (không phải VietQR) trong tháng. MAU overlap W2B, VietQR: Số người dùng có ít nhất một giao dịch VietQR VÀ ít nhất một giao dịch W2B (không phải VietQR) trong cùng tháng. MAU (Chỉ VietQR): Số người dùng có ít nhất một giao dịch VietQR VÀ không có giao dịch W2B (không phải VietQR) nào trong tháng. MAU (Chỉ W2B): Số người dùng có ít nhất một giao dịch W2B (không phải VietQR) VÀ không có giao dịch VietQR nào trong tháng. _2026-01-14_
23. Danh sách đầy đủ các Service ID thuộc phạm vi W2B: transfer_p2b_scan_vietqr, transfer_p2b, transfer_p2b_scan_vietqr_upload, transfer_p2b_globalsearch, transfer_p2b_search_paste, transfer_p2b_capture, banklink_cashout, banklink_cashout_napas, transfer_p2p_search_paste, transfer_p2p_globalsearch, transfer_gp2b _2025-12-22_
24. Trong "schema 5M" không có quy định liên quan đến money_source. Tất cả các giao dịch trong bảng momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING cần được lọc với điều kiện (SERVICEID <> 'transfer_p2b_scan_vietqr' OR SERVICEID IS NULL) _2026-01-15_
