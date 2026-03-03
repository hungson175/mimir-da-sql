# Domain: BU Payment: P2P AIO_QR

## Identity
- **Domain ID:** `05cf9a74-c3c0-4b95-923c-71c8d42ed8aa`
- **Description:** Records all transaction of P2P AIO_QR
- **Tables:** 7
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ORIGINAL_TABLE
> Báº£ng lÆ°u trá»¯ thÃ´ng tin cÃ¡c giao dá»ch qua AIO-QR giá»¯a cÃ¡c vÃ­ MoMo. CÃ¡c má»¥c tiÃªu vÃ  á»©ng dá»¥ng tiá»m nÄng cá»§a báº£ng nÃ y trong má»t lÄ©nh vá»±c cÃ³ thá» bao gá»m: 
- Kiá»m tra chi tiáº¿t cÃ¡c giao dá»ch chuyá»n-nháº­n tiá»n giá»¯a cÃ¡c user qua mÃ£ QR 
- ÄÃ¡nh giÃ¡ phÃ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| serviceid | STRING | Serviceid cá»§a giao dá»ch (luá»ng product user thá»±c hiá»n chuyá»n-nháº­n tiá»n qua AIO-QR)Se... | transfer_aioqr, transfer_myqr, transfer_myqr_upload, transfer_aioqr_p2m, transfe... |
| tid | STRING | TID cá»§a giao dá»ch qua AIO QRTID cá»§a giao dá»ch qua AIO QR | 40717832865, 40684159709, 40713541684 |
| datetime | DATETIME | Thá»i gian giao dá»ch  AIO-QRThá»i gian giao dá»ch  AIO-QR | 2024-02-05 20:11:45, 2025-09-30 17:36:40, 2024-02-10 15:01:40 |
| date | DATE | NgÃ y giao dá»ch qua AIO-QRNgÃ y giao dá»ch qua AIO-QR | 2024-02-19, 2025-12-10, 2026-01-15 |
| month | DATE | ThÃ¡ng giao dá»ch qua AIO-QRThÃ¡ng giao dá»ch qua AIO-QR | 2025-12-01, 2025-11-01, 2025-10-01 |
| amount | FLOAT | GiÃ¡ trá» giao dá»ch qua AIO-QRGiÃ¡ trá» giao dá»ch qua AIO-QR | 100000, 50000, 200000 |
| statusid | INTEGER | GD thÃ nh cÃ´ng náº¿u statusid = 2, tháº¥t báº¡i náº¿u statusid = 6GD thÃ nh cÃ´ng náº¿u statusid = ... | 2, 6 |
| fee | FLOAT | PhÃ­ giao dá»ch qua AIO-QRPhÃ­ giao dá»ch qua AIO-QR | 0 |
| receiver_id | STRING | User ID cá»§a user nháº­n tiá»n vá» MoMoUser ID cá»§a user nháº­n tiá»n vá» MoMo | 48064999, 84157961, 67349367 |
| user_id | STRING | User ID cá»§a user gá»­i tiá»n (cÃ³ thá» lÃ  user_id MoMo náº¿u internal trans (W2W), bank account... | 0541103953007, 212356786, 14754910 |
| age | INTEGER | Tuá»i cá»§a user nháº­n tiá»nTuá»i cá»§a user nháº­n tiá»n | 19, 20, 21 |
| age_group | STRING | NhÃ³m tuá»i cá»§a user nháº­n tiá»nNhÃ³m tuá»i cá»§a user nháº­n tiá»n | [2].18-22, [4].28-35, [3].23-27, [5].36-50, [1].<18  |
| city | STRING | ThÃ nh phá» sinh sá»ng cá»§a user nháº­n tiá»nThÃ nh phá» sinh sá»ng cá»§a user nháº­n tiá»n | Hồ Chí Minh, Hà Nội, Bình Dương |
| city_group | STRING | Khu vá»±c sinh sá»ng cá»§a user nháº­n tiá»nKhu vá»±c sinh sá»ng cá»§a user nháº­n tiá»n | Hồ Chí Minh, Tỉnh khác, Hà Nội, KCN Miền Nam, KCN Miền Bắc |
| cheat_type | STRING | User nháº­n tiá»n cÃ³ pháº£i cheat khÃ´ng (thÃ´ng thÆ°á»ng khÃ´ng tÃ­nh Äáº¿n feature cheat nÃ y)... | [2]. Not cheat, [1]. Cheat |
| va_account_bank_code | STRING | MÃ£ ngÃ¢n hÃ ng cá»§a tÃ i khoáº£n VA | 970454, 971025 |

### momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ACQUISITION_BY_SOURCE_TABLE
> Báº£ng nÃ y chá»©a thÃ´ng tin chi tiáº¿t vá» hoáº¡t Äá»ng nháº­n tiá»n cá»§a ngÆ°á»i dÃ¹ng thÃ´ng qua AIO-QR theo nguá»n. 
ThÃ´ng tin cÃ³ thá» ÄÆ°á»£c láº¥y tá»« báº£ng nÃ y bao gá»m: 
- Thá»i gian vÃ  ngÃ y thÃ¡ng mÃ  ngÆ°á»i dÃ¹ng active nháº­n tiá»n 
- GiÃ¡ trá» giao dá»ch vÃ  thÃ n...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng user active nháº­n tiá»nThÃ¡ng user active nháº­n tiá»n | 2025-12-01, 2025-11-01, 2026-01-01 |
| date | DATE | NgÃ y user active nháº­n tiá»nNgÃ y user active nháº­n tiá»n | 2025-12-01, 2026-01-01, 2025-11-01 |
| datetime | DATETIME | Thá»i gian user active nháº­n tiá»nThá»i gian user active nháº­n tiá»n | 2024-02-09 22:02:17, 2024-02-09 22:03:42, 2024-02-09 22:02:19 |
| receiver_id | STRING | UserID user nháº­n tiá»n qua AIO-QRUserID user nháº­n tiá»n qua AIO-QR | 67891171, 45940625, 52928240 |
| tid | STRING | TID 1st active Äáº§u tiÃªn cá»§a thÃ¡ngTID 1st active Äáº§u tiÃªn cá»§a thÃ¡ng | 52773367706, 52781500810, 52763360289 |
| amount | FLOAT | GiÃ¡ trá» giao dá»chGiÃ¡ trá» giao dá»ch | 100000, 10000, 50000 |
| serviceid | STRING | ServiceID 1st active Äáº§u tiÃªn trong thÃ¡ngServiceID 1st active Äáº§u tiÃªn trong thÃ¡ng | transfer_aioqr, transfer_myqr, transfer_myqr_upload, transfer_b2w, transfer_aioq... |
| user_type | STRING | Loáº¡i active cá»§a user (New/Retain, Reactive)Loáº¡i active cá»§a user (New/Retain, Reactive) | [2]. Retention, [1]. New to service, [3]. Reactivation |
| city | STRING | ThÃ nh phá» receiver sinh sá»ngThÃ nh phá» receiver sinh sá»ng | Hồ Chí Minh, Hà Nội, Bình Dương, Đồng Nai, Đà Nẵng |
| city_group | STRING | Khu vá»±c receiver sinh sá»ngKhu vá»±c receiver sinh sá»ng | Hồ Chí Minh, Tỉnh khác, Hà Nội, KCN Miền Nam, KCN Miền Bắc |
| age_group | STRING | Äá» tuá»i cá»§a receiverÄá» tuá»i cá»§a receiver | [2].18-22, [3].23-27, [4].28-35, [1].<18 , [5].36-50 |
| age | INTEGER | Tuá»i cá»§a receiverTuá»i cá»§a receiver | 19, 20, 21 |
| promotion_lv1 | STRING | User 1st active thÃ¡ng lÃ  Promo/OrganicUser 1st active thÃ¡ng lÃ  Promo/Organic | [1]. Organic, [2]. Promotion |
| promotion_lv2 | STRING | Loáº¡i Promotion (LV2) - BU definedLoáº¡i Promotion (LV2) - BU defined | [4]. Game, [2]. Mission, [3]. Scheme sender QR, [2]. Scheme by amount, [1]. CRM |
| promotion_lv3 | STRING | Loáº¡i Promotion (LV3) - BU definedLoáº¡i Promotion (LV3) - BU defined | LX25, Đấu Trường Tri Thức, Quay Thưởng QR, MoMo Rewards, Euro24 |
| source | STRING | Nguá»n giao dá»ch thÃ´ng qua AIO-QR | banner, noti |

### momovn-prod.MBI_DA.LOAN_P2P_RECEIVER_SEGMENT_ALL
> Báº£ng chá»©a thÃ´ng tin vá» phÃ¢n Äoáº¡n ngÆ°á»i nháº­n dá»ch vá»¥ P2P cho vay theo thÃ¡ng. Báº£ng nÃ y dÃ¹ng Äá» phÃ¢n tÃ­ch vÃ  nhÃ³m Äá»i tÆ°á»£ng ngÆ°á»i nháº­n dá»±a trÃªn cÃ¡c thuá»c tÃ­nh vay. 
Chá»©a dá»¯ liá»u phÃ¢n loáº¡i ngÆ°á»i nháº­n dá»ch vá»¥ P2P. 
CÃ³ thá» sá»­ dá»¥ng ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng mÃ  dá»¯ liá»u phÃ¢n Äoáº¡n ngÆ°á»i nháº­n dá»ch vá»¥ P2P ÄÆ°á»£c ghi nháº­n. | 2025-05-01, 2025-04-01, 2025-03-01 |
| user_id | STRING | ID cá»§a ngÆ°á»i dÃ¹ng nháº­n dá»ch vá»¥ P2P. | 49499220, 18183072, 57029291 |
| segment | STRING | PhÃ¢n Äoáº¡n cá»§a ngÆ°á»i nháº­n dá»ch vá»¥ P2P trong thÃ¡ng. | [5]. Driver phonebook, [3]. Social seller, [2]. Lookalike seller, [1]. SME merch... |
| df | STRING | Thuá»c tÃ­nh phÃ¢n Äoáº¡n Äáº·c biá»t cá»§a ngÆ°á»i nháº­n dá»ch vá»¥ P2P. | P2M, P2P |

### momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_FUNNEL_RECEIVING_SCREEN_AGGREGATION
> Báº£ng tá»ng há»£p dá»¯ liá»u vá» quÃ¡ trÃ¬nh nháº­n giao dá»ch P2P thÃ´ng qua QR trÃªn mÃ n hÃ¬nh nháº­n. Báº£ng nÃ y phá»¥c vá»¥ viá»c phÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng bao gá»m ghi nháº­n sá» láº§n click, sá» phiÃªn, vÃ  thÃ´ng tin ngÆ°á»i nháº­n. Má»¥c ÄÃ­ch cÃ³ thá» bao gá»m:
 - T...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cá»§a giao dá»ch ÄÆ°á»£c tá»ng há»£p | 2024-02-01, 2024-06-01, 2025-12-01 |
| date | DATE | NgÃ y cá»§a giao dá»ch ÄÆ°á»£c tá»ng há»£p | 2024-02-10, 2024-02-19, 2024-02-18 |
| user_id | STRING | ID cá»§a ngÆ°á»i thá»±c hiá»n giao dá»ch P2P qua QR | 0, 68675720, 72435100 |
| lv1_type | STRING | Loáº¡i hÃ¬nh cáº¥p 1 trong quy trÃ¬nh nháº­n giao dá»ch | [1]. Entry point |
| lv2_type | STRING | Äiá»m nháº­p (entry point) cá»§a quy trÃ¬nh nháº­n giao dá»chentry point | [1]. Momo top icon, [2]. My profile, [14]. QR Payment - Bottom Nav, [0]. Momo QR... |
| click | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng click trong quy trÃ¬nh nháº­n giao dá»ch | 1, 2, 3 |
| session | INTEGER | Sá» phiÃªn ngÆ°á»i dÃ¹ng tham gia vÃ o quy trÃ¬nh nháº­n giao dá»ch | 1, 2, 3 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng trong quy trÃ¬nh nháº­n giao dá»ch | [1]. New to service, [2]. Retention, [3]. Reactivation |
| receiver_id | STRING | ID cá»§a ngÆ°á»i nháº­n trong giao dá»ch P2P qua QR | 35243800, 44530417, 51741205 |
| CVR_1 | STRING | Tá»· lá» chuyá»n Äá»i bÆ°á»c 1 trong quy trÃ¬nh nháº­n giao dá»ch | 70419966, 35243800, 41720909 |
| segment | STRING | PhÃ¢n khÃºc cá»§a ngÆ°á»i nháº­n giao dá»ch | [9]. Individual, [2]. Lookalike seller, [8]. Micro Seller, [5]. Driver phonebook... |
| city_group | STRING | NhÃ³m thÃ nh phá» cá»§a ngÆ°á»i nháº­n giao dá»ch | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam, Hà Nội, KCN Miền Bắc |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i nháº­n giao dá»ch | [2].18-22, [4].28-35, [3].23-27, [5].36-50, [1].<18  |

### momovn-prod.MBI_DA.LOAN_P2P_TOTAL_RAW
> Báº£ng raw dá»¯ liá»u vá» tá»ng khoáº£n vay P2P cho ngÆ°á»i dÃ¹ng. Báº£ng nÃ y cung cáº¥p thÃ´ng tin vá» cÃ¡c khoáº£n vay giá»¯a cÃ¡c vÃ­ MoMo trong má»t má»c thá»i gian nháº¥t Äá»nh. Báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá»: 
 - Theo dÃµi sá» lÆ°á»£ng khoáº£n vay P2P trong má»t ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cá»§a khoáº£n vay P2P. | 2025-12-01, 2025-11-01, 2024-12-01 |
| date | DATE | NgÃ y cá»§a khoáº£n vay P2P. | 2025-12-01, 2026-01-01, 2024-07-01 |
| user_id | STRING | ID Äá»nh danh cho ngÆ°á»i dÃ¹ng MoMo tham gia vÃ o giao dá»ch P2P. | 44785300, 64213359, 19541668 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng MoMo trong giao dá»ch vay P2P. | W2W, W2B, VIETQR |

### momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU
> User báº­t auto receive (nháº­n tiá»n tá»± Äá»ng vá» TÃºi tháº§n tÃ i) hÃ ng thÃ¡ng. ThÃ´ng tin cÃ³ thá» láº¥y tá»« báº£ng nÃ y bao gá»m: 
- NgÃ y cuá»i cÃ¹ng trong thÃ¡ng cÃ³ action báº­t auto receive
- ThÃ¡ng cÃ³ action báº­t auto receive
- MÃ£ Äá»nh danh vÃ  thÃ´ng tin ngÆ°á»i dÃ¹ng báº...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cÃ³ action báº­t auto receiveThÃ¡ng cÃ³ action báº­t auto receive | 2026-01-01, 2025-12-01, 2025-11-01 |
| DATE | DATE | NgÃ y cuá»i cÃ¹ng trong thÃ¡ng cÃ³ action báº­t auto receiveNgÃ y cuá»i cÃ¹ng trong thÃ¡ng cÃ³ act... | 2025-12-31, 2026-01-19, 2025-11-30 |
| user_id | STRING | UserID cá»§a ngÆ°á»i dÃ¹ng báº­t auto receiveUserID cá»§a ngÆ°á»i dÃ¹ng | 56578257, 66776936, 27785747 |
| receiver_id | STRING | User cÃ³ nháº­n tiá»n trong cÃ¹ng thÃ¡ngUser cÃ³ nháº­n tiá»n trong cÃ¹ng thÃ¡ng | 63323121, 30372034, 39507978 |

### momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_FUNNEL_ACTION_WITH_QR
> Báº£ng lÆ°u láº¡i data cÃ³ action vá»i MÃ£ QR (download, share, amount input, screenshot). 
ThÃ´ng tin cÃ³ thá» láº¥y tá»« báº£ng nÃ y:
- Loáº¡i hÃ nh Äá»ng cáº¥p 1 vÃ  cáº¥p 2 liÃªn quan Äáº¿n QR code.
- ID sá»± kiá»n khi tÆ°Æ¡ng tÃ¡c vá»i QR code.
- Thá»i gian vÃ  ngÆ°á»i dÃ¹ng thá»±c hiá...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| lv1_type | STRING | Loáº¡i hÃ nh Äá»ng cáº¥p 1 khi ngÆ°á»i dÃ¹ng tÆ°Æ¡ng tÃ¡c vá»i mÃ£ QR. | [3]. Action with QR |
| lv2_type | STRING | Loáº¡i hÃ nh Äá»ng cáº¥p 2 khi ngÆ°á»i dÃ¹ng tÆ°Æ¡ng tÃ¡c vá»i mÃ£ QR. | [3]. Amount input, [1]. Download, [4]. Screenshot, [2]. Sharing, [5]. QR tooltip |
| event_id | STRING | ID cá»§a sá»± kiá»n khi ngÆ°á»i dÃ¹ng thá»±c hiá»n hÃ nh Äá»ng vá»i mÃ£ QR. | xK6XyrVaoYQCq_B0sMHks, T17QoD7y80xA_YdFwpDE-, dj0sB5LIIhCFhRodIrkIG |
| trail_id | STRING | ID má» rá»ng hoáº·c chuá»i theo dÃµi sá»± kiá»n trong há» thá»ng liÃªn quan Äáº¿n mÃ£ QR. | puoCvFCHX6Jjiu8InhXIl, dRNJgV7hxd9BIwJKV1uhb, wZhHx-84LABDar7HsbSKi |
| user_id | STRING | ID cá»§a ngÆ°á»i dÃ¹ng thá»±c hiá»n hÃ nh Äá»ng vá»i mÃ£ QR. | 96219246, 82195982, 48480087 |
| datetime | DATETIME | Thá»i Äiá»m thá»±c hiá»n hÃ nh Äá»ng vá»i mÃ£ QR. | 2025-10-04 20:37:58.956, 2024-09-20 19:46:40.532, 2025-06-03 21:16:17.126 |
| date | DATE | NgÃ y thá»±c hiá»n hÃ nh Äá»ng vá»i mÃ£ QR. | 2024-02-10, 2025-12-10, 2024-02-19 |

## Domain Knowledge (from Mimir)

- Không cần filter serviceid và statusid khi truy vấn số user nhận 2025đ qua QR nhận tiền MoMo trong tháng 6/2025
- For metrics like MAU, DAU, TPV, user defines successful transactions as those with statusid = 2. This applies when using the statusid column, for example, from the momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_GENERAL_BEHAVIOR_TABLE.
- Để lấy tính năng quét mã QR thì lấy serviceid NOT LIKE '%upload%'
- Ngày login vào màn home phải nhỏ hơn hoặc bằng ngày active nhận tiền
- Scheme nhận tiền 2025Đ là một promotion, cần filter promotion_lv1 = '[2]. Promotion'
- Dùng cột receiver_id trong bảng momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_ORIGINAL_TABLE
- Khi xử lý vấn đề liên quan tới lv1_type, không cần sử dụng '[1]. Entry point'

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
