# Domain: BU Payment: P2P W2W

## Identity
- **Domain ID:** `f3d8838b-5f96-4f78-8c39-2b146978dbd8`
- **Description:** Records all transaction of P2P W2W
- **Tables:** 8
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.LOAN_P2P_W2W_RAW_MAPPING
> Báº£ng momovn-prod.MBI_DA.LOAN_P2P_W2W_RAW_MAPPING chá»©a thÃ´ng tin liÃªn quan Äáº¿n giao dá»ch chuyá»n tiá»n tá»« vÃ­ MoMo nÃ y sang vÃ­ MoMo kia (P2P W2W). 
Má»¥c ÄÃ­ch vÃ  á»©ng dá»¥ng cá»§a báº£ng nÃ y bao gá»m: 
- Theo dÃµi vÃ  quáº£n lÃ½ cÃ¡c khoáº£n vay P2P W2W trÃªn MoMo. 
- PhÃ¢n tÃ­...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| TID | STRING | MÃ£ Äá»nh danh cho giao dá»ch. | 115678362409, 115741341797, 115732499565 |
| datetime | DATETIME | NgÃ y vÃ  giá» thá»±c hiá»n giao dá»ch. | 2024-07-31 19:21:44, 2025-01-29 00:52:48, 2025-01-29 00:43:03 |
| DATE | DATE | NgÃ y thá»±c hiá»n giao dá»ch. | 2024-10-10, 2024-07-15, 2024-08-10 |
| month | DATE | ThÃ¡ng thá»±c hiá»n giao dá»ch. | 2024-07-01, 2024-10-01, 2024-08-01 |
| user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng thá»±c hiá»n giao dá»ch. | 89146178, 89146180, 87339451 |
| receiver_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i nháº­n tiá»n trong giao dá»ch. | 92619653, 92511563, 84157961 |
| SERVICE_CODE | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n giao dá»ch. | u2u, quynhom, cardcashin.balnapas05, cardcashin.balnapas04, cardcashin.balnapas0... |
| SERVICEID | STRING | MÃ£ dá»ch vá»¥ cho loáº¡i dá»ch vá»¥ sá»­ dá»¥ng trong giao dá»ch. | transfer_via_link_w2w, transfer_p2p, transfer_aioqr, transfer_myqr, transfer_p2p... |
| FUNDID | FLOAT | MÃ£ Äá»nh danh cho nguá»n quá»¹ trong giao dá»ch. | 2, 1, 6 |
| AMOUNT | FLOAT | Sá» tiá»n giao dá»ch. | 100000, 50000, 200000 |
| COMMENT_VALUE | STRING | GiÃ¡ trá» bÃ¬nh luáº­n cá»§a ngÆ°á»i dÃ¹ng trong giao dá»ch. | 🍛 Tiền ăn uống, Chuyển tiền theo yêu cầu rút quỹ,  |
| PAYMENT_CHANNEL | STRING | KÃªnh thanh toÃ¡n sá»­ dá»¥ng trong giao dá»ch. | payment_link, tab_p2p, myqr, aioqr, contact_input_search |

### momovn-prod.MBI_DA.LOAN_P2P_W2W_USER_TYPE
> Báº£ng nÃ y lÆ°u trá»¯ thÃ´ng tin vá» cÃ¡c loáº¡i ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n dá»ch vá»¥ P2P vÃ  W2W cá»§a MoMo. 
Má»¥c ÄÃ­ch vÃ  trÆ°á»ng há»£p sá»­ dá»¥ng cá»§a báº£ng:
- XÃ¡c Äá»nh loáº¡i ngÆ°á»i dÃ¹ng cá»§a dá»ch vá»¥ P2P vÃ  W2W qua cÃ¡c thÃ´ng tin nhÆ° nhÃ³m thÃ nh phá» vÃ  nhÃ³m...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cá»¥ thá» mÃ  thÃ´ng tin ngÆ°á»i dÃ¹ng ÄÆ°á»£c ghi nháº­n. | 2024-02-01, 2023-12-01, 2023-01-01 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng sá»­ dá»¥ng dá»ch vá»¥ P2P vÃ  W2W. | 50426494, 40289467, 40689741 |
| date | DATE | NgÃ y cá»¥ thá» khi thÃ´ng tin ngÆ°á»i dÃ¹ng ÄÆ°á»£c ghi nháº­n. | 2024-02-01, 2024-07-01, 2023-12-01 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng cá»§a dá»ch vá»¥ P2P vÃ  W2W. | 2. Retention, 3. Churn, 1. New |
| city_group | STRING | NhÃ³m thÃ nh phá» nÆ¡i ngÆ°á»i dÃ¹ng sinh sá»ng. | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam, Hà Nội, KCN Miền Bắc |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng. | [3].18-23, [4].24-29, [5].30-40, [0].unknown, [6].41-60 |

### momovn-prod.MBI_DA.LOAN_P2P_W2W_ERROR_TRANS_MAPPING
> Báº£ng momovn-prod.MBI_DA.LOAN_P2P_W2W_ERROR_TRANS_MAPPING ghi láº¡i thÃ´ng tin vá» cÃ¡c lá»i trong giao dá»ch tá»« vÃ­ MoMo nÃ y sang vÃ­ MoMo khÃ¡c (W2W) trong dá»ch vá»¥ P2P. NgÆ°á»i dÃ¹ng cÃ³ thá» sá»­ dá»¥ng báº£ng Äá»: 
- Theo dÃµi lá»i giao dá»ch giá»¯a cÃ¡c vÃ­ MoMo 
- PhÃ¢n tÃ­ch ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| TID | STRING | MÃ£ giao dá»ch duy nháº¥t cho má»i giao dá»ch lá»i trong dá»ch vá»¥ P2P W2W. | 98699282702, 98674817538, 98666226277 |
| datetime | DATETIME | Thá»i gian cá»¥ thá» khi lá»i giao dá»ch xáº£y ra. | 2025-08-29 02:23:18, 2025-07-23 11:17:17, 2025-08-29 02:23:41 |
| DATE | DATE | NgÃ y mÃ  lá»i giao dá»ch xáº£y ra. | 2025-09-10, 2025-09-03, 2025-09-30 |
| month | DATE | ThÃ¡ng mÃ  lá»i giao dá»ch xáº£y ra. | 2025-09-01, 2025-08-01, 2025-07-01 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n giao dá»ch lá»i. | 77308674, 46603063, 66107599 |
| AMOUNT | FLOAT | Sá» tiá»n trong giao dá»ch lá»i. | 100000, 50000, 111 |
| STATUSID | INTEGER | MÃ£ tráº¡ng thÃ¡i cá»§a giao dá»ch lá»i. | 6 |
| result_code | STRING | MÃ£ káº¿t quáº£ cá»§a giao dá»ch lá»i. | 1001, 16, 4432 |
| ERROR | STRING | MÃ´ táº£ vá» lá»i xáº£y ra trong giao dá»ch P2P W2W. | Insufficient funds, Target suspended, Ví MoMo của người nhận đang bị đóng vì chư... |
| VI_DESC | STRING | MÃ´ táº£ chi tiáº¿t báº±ng tiáº¿ng Viá»t vá» lá»i cá»§a giao dá»ch. | Tài khoản không đủ tiền, Tài khoản người nhận tạm ngưng hoạt động, Ví MoMo của n... |

### momovn-prod.MBI_DA.P2P_DEVICE_TYPE
> Báº£ng chá»©a thÃ´ng tin vá» loáº¡i thiáº¿t bá» mÃ  ngÆ°á»i dÃ¹ng sá»­ dá»¥ng Äá» thá»±c hiá»n giao dá»ch P2P trÃªn MoMo. CÃ¡c dá»¯ liá»u nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» phÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng theo loáº¡i thiáº¿t bá», ÄÃ¡nh giÃ¡ hiá»u suáº¥t cá»§a cÃ¡c thiáº¿t bá»,...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng khi giao dá»ch P2P ÄÆ°á»£c thá»±c hiá»n. | 2024-08-01, 2024-05-01, 2024-06-01 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng thá»±c hiá»n giao dá»ch P2P. | 53172170, 9537090, 79293386 |
| device | STRING | Loáº¡i thiáº¿t bá» mÃ  ngÆ°á»i dÃ¹ng sá»­ dá»¥ng Äá» thá»±c hiá»n giao dá»ch P2P. | iphone 12 pro max, iphone 11, iphone 11 pro max |
| device_os | STRING | Há» Äiá»u hÃ nh cá»§a thiáº¿t bá» ngÆ°á»i dÃ¹ng sá»­ dá»¥ng trong giao dá»ch P2P. | IOS, ANDROID, ios, android,  |
| device_performance | STRING | Hiá»u suáº¥t hoáº¡t Äá»ng cá»§a thiáº¿t bá» khi thá»±c hiá»n giao dá»ch P2P. | high-end, low-end |

### momovn-prod.MBI_DA.P2P_W2W_USER_RETENTION_TYPE
> Chá»©a thÃ´ng tin liÃªn quan Äáº¿n active_type cá»§a user cÃ³ user_type lÃ  Retention. Active type á» ÄÃ¢y bao gá»m '01. Active 2M', '02. Active 3M', '03. Active at least 4M'. Báº£ng nÃ y giÃºp phÃ¢n loáº¡i vÃ  theo dÃµi má»©c Äá» hoáº¡t Äá»ng cá»§a ngÆ°á»i dÃ¹ng thuá»c nhÃ³m Retention the...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng mÃ  dá»¯ liá»u ÄÆ°á»£c ghi nháº­n | 2024-01-01, 2024-02-01, 2024-07-01 |
| date | DATE | NgÃ y mÃ  dá»¯ liá»u ÄÆ°á»£c ghi nháº­n | 2024-02-01, 2024-10-01, 2024-07-01 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng, vá»i giÃ¡ trá» cá»¥ thá» lÃ  Retention | 02. Retention, 2. Retention |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng | 3622688, 41547779, 50426639 |
| city_group | STRING | NhÃ³m thÃ nh phá» mÃ  ngÆ°á»i dÃ¹ng thuá»c vá» | Hồ Chí Minh, KCN Miền Nam, Tỉnh khác, Hà Nội, TP Lớn |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng | [3].18-23, [4].24-29, [5].30-40, [2].18-22, [3].23-27 |
| active_type | STRING | Loáº¡i hoáº¡t Äá»ng cá»§a ngÆ°á»i dÃ¹ng, bao gá»m '01. | 03. Active at least 4M, 01. Active 2M, 02. Active 3M |

### momovn-prod.MBI_DA.HOANG_P2P_W2W_ACQUISITION_SOURCE_FOR_TRACKING
> Báº£ng momovn-prod.MBI_DA.HOANG_P2P_W2W_ACQUISITION_SOURCE_FOR_TRACKING theo dÃµi nguá»n gá»c cá»§a ngÆ°á»i dÃ¹ng P2P vÃ  W2W. ThÃ´ng tin tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá»: 
 - PhÃ¢n tÃ­ch nguá»n gá»c ngÆ°á»i dÃ¹ng dá»±a trÃªn scheme hoáº·c organic.
 - Theo dÃµi xu hÆ°á»ng...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng trong nÄm. | 2024-10-01, 2024-12-01, 2024-11-01 |
| user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng MoMo. | 76790928, 81728715, 38965602 |
| region | STRING | VÃ¹ng Äá»a lÃ½ cá»§a ngÆ°á»i dÃ¹ng. | Hồ Chí Minh, KCN Miền Nam, Tỉnh khác |
| amount | FLOAT | Sá» tiá»n giao dá»ch. | 100000, 50000, 111 |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»ch. | 2024-10-01, 2024-11-01, 2024-12-01 |
| day | INTEGER | NgÃ y trong thÃ¡ng. | 1, 2, 3 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng. | 2. Retention, 3. Churn, 1. New |
| acq_source_lv1 | STRING | Nguá»n gá»c level 1: chia 2 loáº¡i, Scheme hoáº·c Organic. | Organic, Scheme, <= 1K not scheme |
| acq_source_lv2 | STRING | Nguá»n gá»c level 2: chia thÃ nh cÃ¡c loáº¡i scheme nhÆ° Voucher, Fixed Amount, Game, CRM, Conm. | 01. > 1K, 01. CRM, 08. <= 1K not scheme, 03. Voucher, 06. Game |
| acq_source_lv3 | STRING | Nguá»n gá»c level 3: chia cá»¥ thá» cÃ¡c scheme cá»§a level 2 thÃ nh tá»«ng gift_id, game_id. | > 1K, CRM 111đ, <= 1K not scheme |
| tid | STRING | MÃ£ Äá»nh danh giao dá»ch. | 79128604875, 79083835409, 79064466242 |
| serviceid | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n giao dá»ch. | transfer_p2p, transfer_via_link_w2w, transfer_myqr, transfer_p2p_search_paste, t... |

### momovn-prod.MBI_DA.LOAN_2022_NEWTOMOMO_usecase
> Báº£ng loan 2022 new to momo, sá»­ dá»¥ng cho trÆ°á»ng há»£p má»i tham gia MoMo.
ThÃ´ng tin cÃ³ thá» ÄÆ°á»£c láº¥y tá»« báº£ng nÃ y bao gá»m:
- PhÃ¢n tÃ­ch cÃ¡c trÆ°á»ng há»£p sá»­ dá»¥ng MoMo má»i.
- ÄÃ¡nh giÃ¡ má»©c Äá» phá» biáº¿n cá»§a dá»ch vá»¥ theo thÃ nh phá» vÃ  nhÃ³m tuá»i.
-...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| TID | FLOAT | ID giao dá»ch, Äá»nh danh giao dá»ch cá»¥ thá». | 745107119, 933470043, 3837146993 |
| AGENTID | FLOAT | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | 68717914, 26853652, 34557623 |
| month | DATE | ThÃ¡ng thá»±c hiá»n giao dá»ch. | 2022-03-01, 2022-04-01, 2022-05-01 |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»ch. | 2020-03-22, 2020-10-27, 2022-08-25 |
| service_code | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n hÃ³a ÄÆ¡n. | u2u, cashinbank, m4becomadyen_apple |
| Mar22_Level1_BUName | STRING | TÃªn ÄÆ¡n vá» kinh doanh cáº¥p Äá» 1 vÃ o thÃ¡ng 3 nÄm 2022. | BU_P2P, BU_VTTI, BU_DLS, BU_Bank, BU_BANK |
| Mar22_Level2_Usecase | STRING | TrÆ°á»ng há»£p sá»­ dá»¥ng cáº¥p Äá» 2 vÃ o thÃ¡ng 3 nÄm 2022. | AIRTIME, P2P - EWALLET TO EWALLET, CI Bank, P2P - EWALLET TO BANK, APPLICATION S... |
| Mar22_Level3_SubUsecase | STRING | PhÃ¢n loáº¡i trÆ°á»ng há»£p sá»­ dá»¥ng vÃ o thÃ¡ng 3 nÄm 2022 á» cáº¥p Äá» 3. | AIRTIME, P2P - EWALLET TO EWALLET, CI Bank, P2P - EWALLET TO BANK, APPLE |
| city | STRING | TÃªn thÃ nh phá» nÆ¡i diá»n ra giao dá»ch. | Hồ Chí Minh, Hà Nội, UNKNOWN |
| citygroup | STRING | NhÃ³m thÃ nh phá» cho phÃ¢n loáº¡i Äá»a lÃ½. | Tỉnh khác, Hà Nội, Hồ Chí Minh, KCN Miền Nam, UNKNOWN |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i sá»­ dá»¥ng dá»ch vá»¥. | others, [2].18-22, [4].28-35, [5].36-50, [3].23-27 |
| cheat_user | FLOAT | NgÆ°á»i dÃ¹ng bá» phÃ¡t hiá»n cÃ³ hÃ nh vi gian láº­n, giÃ¡ trá» 1 náº¿u phÃ¡t hiá»n, 0 náº¿u k... | 102751296, 21278156, 96223331 |

### momovn-prod.MBI_DA.HA_P2P_GIFT
> Báº£ng chá»©a thÃ´ng tin vá» quÃ  táº·ng P2P (Peer-to-Peer) trÃªn ná»n táº£ng MoMo. ThÃ´ng tin láº¥y tá»« báº£ng nÃ y bao gá»m: 
- Loáº¡i dá»ch vá»¥ quÃ  táº·ng P2P 
- Thá»i gian giao dá»ch quÃ  táº·ng 
- Nguá»n gá»c giao dá»ch quÃ  táº·ng 
- Sá» tiá»n vÃ  loáº¡i quÃ  táº·ng 
- ThÃ´ng tin...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| service | STRING | TÃªn dá»ch vá»¥ liÃªn quan Äáº¿n quÃ  táº·ng P2P. | W2B, W2W |
| month | DATE | ThÃ¡ng diá»n ra giao dá»ch quÃ  táº·ng. | 2024-10-01, 2025-12-01, 2025-11-01 |
| date | DATE | NgÃ y diá»n ra giao dá»ch quÃ  táº·ng. | 2025-12-11, 2024-10-10, 2025-12-01 |
| datetime | DATETIME | Thá»i Äiá»m cá»¥ thá» diá»n ra giao dá»ch quÃ  táº·ng. | 2024-10-10 00:00:00, 2024-10-11 00:00:00, 2024-10-05 00:00:00 |
| source | STRING | Nguá»n gá»c cá»§a giao dá»ch quÃ  táº·ng. | kgs_sp302_w2b_iphone_7d_cb, kgs_sp302_w2b_copytransfer_cb, kgs_sp_w2w_tid_0424 |
| gift_id | STRING | MÃ£ Äá»nh danh cá»§a quÃ  táº·ng P2P. | gift_M1J44C0C_0, gift_M0NQK0FB_5, rw_w2b_awo_251209_cbttt_100pt1k_dx1n5 |
| amount | FLOAT | Sá» tiá»n liÃªn quan Äáº¿n giao dá»ch quÃ  táº·ng. | 1000, 7, 2000 |
| p2p_amount | FLOAT | Sá» tiá»n P2P liÃªn quan Äáº¿n quÃ  táº·ng. | 10000, 2000, 100000 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n giao dá»ch quÃ  táº·ng. | 18441403, 44195664, 40577643 |
| gift_type | STRING | Loáº¡i quÃ  táº·ng P2P. | Voucher, Cashback - CAMPAIGN |
| TID_gift | STRING | MÃ£ Äá»nh danh giao dá»ch quÃ  táº·ng. | 52515987715, 68799621627, 68851010007 |
| PARENTID | STRING | MÃ£ Äá»nh danh cha cá»§a quÃ  táº·ng. | 0, 58283213918, 69833637115 |

## Domain Knowledge (from Mimir)

- active_type không cần thiết khi truy vấn số lượng người dùng đang hoạt động đã chuyển tiền
- Khi truy vấn số lượng người dùng đã sử dụng tính năng quét mã QR, cần chọn DISTINCT user_id thay vì PAYMENT_CHANNEL
- Lời nhắn chuyển tiền = comment_value
- Các giá trị sau đây là lời nhắn mặc định: 'Ngàn lần như ý, vạn lần như mơ, triệu sự bất ngờ, tỷ lần hạnh phúc 🤗', 'Tết này Li xi cho em 2 tỷ - Hai tỷ cún: Hun tỷ cái! 💓', 'Năm mới hoan hỉ, sức khỏe bền bỉ, công danh đắc tài 🤗💪', 'Chúc ngoan xinh yêu của anh năm mới vui vẻ! 😘', 'Chúc Tết đến trăm điều như ý - Mừng xuân sang vạn sự thành công 💯', 'Chúc bạn mệt mỏi vì học giỏi. Buồn phiền vì nhiều tiền 😍', 'Chúc bạn 12 tháng phú quý, 365 ngày phát tài, 8.760 giờ sung túc', 'Chúc bạn năm mới luôn rực rỡ như vì tinh tú trên bầu trời ✨', 'Chỉ cần có em, mỗi ngày trong năm đều là Valentine ngọt ngào! 💓', 'Anh không giỏi nói lời yêu, nhưng thương mối tình này là điều quý giá nhất', 'Trái tim em thuộc về anh, hôm nay, ngày mai và mãi mãi. 💓', 'Chúc ngoan xinh yêu của anh Valentine vui vẻ 😘', 'Chúc cậu 8/3 ngọt ngào, xinh đẹp và luôn gặp được điều tuyệt vời nhất!', 'Chúc mừng mẹ mỗi ngày đều rạng rỡ như hoa, ngập tràn niềm vui và hạnh phúc!', 'Chúc bạn tuổi mới thật rực rỡ và hạnh phúc nhé 🎂💗', 'Chúc bạn tuổi mới thêm nhiều niềm vui, vạn điều như ý, không đếm tuổi! 💪', 'Gửi những lời chúc tốt đẹp nhất và ngọt ngào nhất đến em 💗', 'Mong những điều may mắn và tốt đẹp nhất sẽ đến với bạn trong tuổi mới này! 💗', 'Chúc cho lửa mãi hương nồng - Rằng lòng đâu bạc vẫn còn có nhau! 💗', 'Chúc cho cuộc sống hạnh phúc, luôn được yêu thương và trân trọng 💗', 'Đi đâu thì cũng nhớ tụi mình đó nghen! 😘', 'Quá tự hào bạn tôi!! 😻', '100 điểm, quá xứng đáng 💯', 'Cảm ơn vì những ngày tháng cùng cày KPI! 💪', 'Gửi liên lạc nhé bạn ơi! 💗', 'Đừng giận nữa mà 🥺', 'Thương thương ❤️', 'Miss you 😘', 'Love you ❤️', 'Bạn để đời luôn', 'Nói đúng bạn nhỉ nha 😋', 'Đừng quên uống nước đó!', 'Hôm nào gặp nhé!', 'Quẩy lên 🥳', 'OK bạn nhé!', 'Con gửi ba nhé 💗', 'Con gửi mẹ nhé 💗', 'Gửi gia đình mình nha 💗', 'Cảm ơn ba 💗', 'Cảm ơn mẹ 💗'
- SERVICEID = "transfer_masking" có nghĩa là dịch vụ chuyển tiền mà thông tin người gửi hoặc người nhận được ẩn đi để bảo mật.
- Người dùng hoạt động không cần lọc theo active_type, người dùng hoạt động được hiểu là tất cả các active_type
- Khi đếm số lượng người dùng đang hoạt động đã chuyển tiền, cần sử dụng count(distinct user_id)
- Để truy vấn số lượng người dùng đã sử dụng tính năng quét mã QR, cần lọc theo month = '2025-05-01' và SERVICEID chứa '%qr%'
- sản phẩm gửi thiệp là SERVICEID = 'transfer_luckymoney'

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
