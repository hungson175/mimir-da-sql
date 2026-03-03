# Domain: BU Payment: P2P RECEIVER GENERAL

## Identity
- **Domain ID:** `390df75f-43e9-4caa-a418-0959e0691f73`
- **Description:** Bao gồm các thông tin nhận tiền về MoMo (các luồng TITAN, QR, W2W)
- **Tables:** 6
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.P2P_RECEIVER_PERFORMANCE
> Báº£ng theo dÃµi hiá»u suáº¥t cá»§a ngÆ°á»i nháº­n trong cÃ¡c giao dá»ch P2P trÃªn á»©ng dá»¥ng MoMo. ThÃ´ng tin tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» phÃ¢n tÃ­ch hiá»u suáº¥t nháº­n tiá»n cá»§a ngÆ°á»i dÃ¹ng, xÃ¡c Äá»nh cÃ¡c giao dá»ch tá»± nháº­n vÃ  tá»± chuyá»n tiá»n, ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| tid | STRING | MÃ£ Äá»nh danh giao dá»ch cá»§a má»t láº§n chuyá»n tiá»n P2P. | 62365171199, 62381871733, 62379724149 |
| date | DATE | NgÃ y diá»n ra giao dá»ch P2P. | 2024-02-10, 2024-02-01, 2024-02-19 |
| datetime | DATETIME | Thá»i gian chÃ­nh xÃ¡c diá»n ra giao dá»ch P2P. | 2024-01-30 17:52:31, 2024-05-16 12:17:45, 2024-07-08 20:03:08 |
| month | DATE | ThÃ¡ng diá»n ra giao dá»ch P2P. | 2024-02-01, 2024-07-01, 2024-06-01 |
| amount | FLOAT | Sá» tiá»n ÄÆ°á»£c chuyá»n trong giao dá»ch P2P. | 100000, 50000, 200000 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i sá»­ dá»¥ng gá»­i tiá»n trong giao dá»ch P2P. | 0541103953007, 212356786, 86336757 |
| receiver_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i nháº­n trong giao dá»ch P2P. | 84157961, 89086590, 88673699 |
| fee | FLOAT | PhÃ­ ÄÆ°á»£c tÃ­nh cho giao dá»ch P2P. | 0, 3625, 4600 |
| serviceid | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n giao dá»ch P2P. | transfer_via_link_w2w, transfer_p2p, transfer_aioqr, transfer_myqr, transfer_p2p... |
| type | STRING | Loáº¡i giao dá»ch P2P, khÃ¡c nhau tÃ¹y tá»«ng dá»ch vá»¥ liÃªn quan. | 2. Non-QR, 1. QR |
| is_self_transfer | BOOLEAN | XÃ¡c Äá»nh xem giao dá»ch cÃ³ pháº£i lÃ  tá»± chuyá»n khoáº£n khÃ´ng (true: tá»± chuyá»n khoáº£... | false, true |
| is_auto_receive | BOOLEAN | XÃ¡c Äá»nh xem giao dá»ch cÃ³ ÄÆ°á»£c tá»± Äá»ng nháº­n khÃ´ng (true: tá»± Äá»ng nháº­n, fal... | true, false |

### momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU
> User báº­t auto receive (nháº­n tiá»n tá»± Äá»ng vá» TÃºi tháº§n tÃ i) hÃ ng thÃ¡ngUser báº­t auto receive (nháº­n tiá»n tá»± Äá»ng vá» TÃºi tháº§n tÃ i) hÃ ng thÃ¡ng

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cÃ³ action báº­t auto receiveThÃ¡ng cÃ³ action báº­t auto receive | 2026-01-01, 2025-12-01, 2025-11-01 |
| DATE | DATE | NgÃ y cuá»i cÃ¹ng trong thÃ¡ng cÃ³ action báº­t auto receiveNgÃ y cuá»i cÃ¹ng trong thÃ¡ng cÃ³ act... | 2026-01-22, 2025-12-31, 2025-11-30 |
| user_id | STRING | UserID cá»§a ngÆ°á»i dÃ¹ngUserID cá»§a ngÆ°á»i dÃ¹ng | 80959018, 64125725, 78493590 |
| receiver_id | STRING | User cÃ³ nháº­n tiá»n trong cÃ¹ng thÃ¡ngUser cÃ³ nháº­n tiá»n trong cÃ¹ng thÃ¡ng | 48390296, 41018676, 5120006 |

### momovn-prod.MBI_DA.TUAN_ALL_RECEIVER_USER_TYPE
> Báº£ng lÆ°u trá»¯ thÃ´ng tin vá» cÃ¡c loáº¡i ngÆ°á»i dÃ¹ng nháº­n trong má»t khoáº£ng thá»i gian cá»¥ thá», bao gá»m cÃ¡c thÃ´ng tin vá» ngÃ y, thÃ¡ng, loáº¡i ngÆ°á»i dÃ¹ng, vÃ  cÃ¡c Äáº·c Äiá»m khÃ¡c nhÆ° giá»i tÃ­nh, Äá» tuá»i, nhÃ³m thÃ nh phá».
Use cases:
- Theo dÃµi vÃ  phÃ¢n tÃ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cá»§a dá»¯ liá»u. | 2024-02-01, 2025-01-01, 2024-01-01 |
| date | DATE | NgÃ y cá»§a dá»¯ liá»u. | 2024-02-01, 2024-10-01, 2024-07-01 |
| receiver_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i nháº­n. | 9243436, 53223467, 85388388 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng, chá» Äá»nh Äáº·c Äiá»m hoáº·c phÃ¢n khÃºc mÃ  ngÆ°á»i dÃ¹ng thuá»c. | [2]. Retention, [3]. Reactivation, [1]. New to service |
| city_group | STRING | NhÃ³m thÃ nh phá» mÃ  ngÆ°á»i nháº­n thuá»c vá». | Hồ Chí Minh, Tỉnh khác, KCN Miền Nam, Hà Nội, KCN Miền Bắc |
| city | STRING | ThÃ nh phá» nÆ¡i ngÆ°á»i nháº­n cÆ° trÃº. | Hồ Chí Minh, Hà Nội, Bình Dương |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i nháº­n. | MALE, FEMALE |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i nháº­n. | [2].18-22, [3].23-27, [4].28-35, [5].36-50, [1].<18  |
| age | INTEGER | Tuá»i cá»§a ngÆ°á»i nháº­n. | 21, 22, 20 |

### momovn-prod.MBI_DA.HOANG_P2P_AIO_QR_RECEIVER_TYPE
> Báº£ng nÃ y chá»©a thÃ´ng tin vá» cÃ¡c user hoáº¡t Äá»ng khi nháº­n tiá»n qua AIO-QR P2P. Báº£ng nÃ y giÃºp phÃ¢n tÃ­ch hoáº¡t Äá»ng cá»§a user theo thÃ¡ng, ngÃ y kÃ­ch hoáº¡t dá»ch vá»¥ nháº­n tiá»n, thÃ´ng tin nhÃ¢n kháº©u há»c cá»§a ngÆ°á»i nháº­n nhÆ° khu vá»±c, tuá»i vÃ  loáº¡i hoáº¡...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng user active nháº­n tiá»nThÃ¡ng user active nháº­n tiá»n | 2025-12-01, 2026-01-01, 2025-11-01 |
| date | DATE | NgÃ y Äáº§u tiÃªn active dá»ch vá»¥ nháº­n tiá»n trong thÃ¡ngNgÃ y Äáº§u tiÃªn active dá»ch vá»... | 2025-12-01, 2026-01-01, 2025-11-01 |
| receiver_id | STRING | UserID cá»§a receiver AIO-QRUserID cá»§a receiver AIO-QR | 61750282, 44867675, 48617860 |
| city | STRING | ThÃ nh phá» sinh sá»ng cá»§a receiverThÃ nh phá» sinh sá»ng cá»§a receiver  | Hồ Chí Minh, Hà Nội, Bình Dương |
| city_group | STRING | Khu vá»±c sinh sá»ng cá»§a receiverKhu vá»±c sinh sá»ng cá»§a receiver  | Hồ Chí Minh, Tỉnh khác, Hà Nội, KCN Miền Nam, KCN Miền Bắc |
| age | INTEGER | Tuá»i cá»§a receiverTuá»i cá»§a receiver | 19, 20, 21 |
| age_group | STRING | NhÃ³m tuá»i cá»§a receiverNhÃ³m cá»§a receiver | [2].18-22, [3].23-27, [4].28-35, [1].<18 , [5].36-50 |
| user_type | STRING | Loáº¡i active cá»§a user (New/Retain/Reactive)Loáº¡i active cá»§a user (New/Retain/Reactive) | [2]. Retention, [1]. New to service, [3]. Reactivation |

### momovn-prod.MBI_DA.P2P_RECEIVER_TITAN_MONTHLY_RECEIVER
> Báº£ng momovn-prod.MBI_DA.P2P_RECEIVER_TITAN_MONTHLY_RECEIVER lÆ°u trá»¯ thÃ´ng tin vá» cÃ¡c ngÆ°á»i nháº­n tiá»n qua dá»ch vá»¥ P2P (peer-to-peer) hÃ ng thÃ¡ng. Báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá»: 
- Theo dÃµi sá» lÆ°á»£ng giao dá»ch hÃ ng thÃ¡ng cá»§a ngÆ°á»i nháº­n.
- PhÃ¢n t...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng mÃ  dá»¯ liá»u ÄÆ°á»£c ghi nháº­n. | 2026-01-01, 2025-12-01, 2025-11-01 |
| receiver_id | STRING | ID cá»§a ngÆ°á»i nháº­n tiá»n qua dá»ch vá»¥ P2P. | 56024423, 46785809, 107923697 |
| first_active_date | DATE | NgÃ y Äáº§u tiÃªn ngÆ°á»i nháº­n tiá»n hoáº¡t Äá»ng. | 2025-12-10, 2026-01-08, 2026-01-28 |
| tnx_count | INTEGER | Sá» lÆ°á»£ng giao dá»ch mÃ  ngÆ°á»i nháº­n ÄÃ£ thá»±c hiá»n trong thÃ¡ng. | 1, 2, 3 |
| total_tpv | FLOAT | Tá»ng giÃ¡ trá» giao dá»ch cá»§a ngÆ°á»i nháº­n trong thÃ¡ng. | 100000, 10000, 9999 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng cá»§a ngÆ°á»i nháº­n. | [1]. New to service, [2]. Retention, [3]. Reactivation |
| city | STRING | ThÃ nh phá» mÃ  ngÆ°á»i nháº­n cÆ° trÃº. | Hồ Chí Minh, Hà Nội, Bình Dương |
| city_group | STRING | NhÃ³m thÃ nh phá» mÃ  ngÆ°á»i nháº­n thuá»c vá». | Hồ Chí Minh, Tỉnh khác, Hà Nội, KCN Miền Nam, KCN Miền Bắc |
| age | INTEGER | Tuá»i cá»§a ngÆ°á»i nháº­n. | 19, 18, 20 |
| age_group | STRING | NhÃ³m tuá»i mÃ  ngÆ°á»i nháº­n thuá»c vá». | [2].18-22, [3].23-27, [4].28-35, [5].36-50, [1].<18  |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i nháº­n. | MALE, FEMALE |
| post_balance | FLOAT | Sá» dÆ° sau khi giao dá»ch cá»§a ngÆ°á»i nháº­n. | 5, 10, 500 |

### momovn-prod.MBI_DA.TUAN_RECEIVER_MOMO_REWARD_MISSION
> Báº£ng momovn-prod.MBI_DA.TUAN_RECEIVER_MOMO_REWARD_MISSION lÆ°u trá»¯ thÃ´ng tin vá» cÃ¡c nhiá»m vá»¥ mÃ  ngÆ°á»i dÃ¹ng MoMo ÄÃ£ nháº­n ÄÆ°á»£c Äá» nháº­n thÆ°á»ng. Báº£ng nÃ y cung cáº¥p cÃ¡c thÃ´ng tin nhÆ°: 
- NgÃ y vÃ  thá»i gian thá»±c hiá»n nhiá»m vá»¥ 
- MÃ£ Äá»nh danh ngÆ°á»i ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| date | DATE | NgÃ y thá»±c hiá»n nhiá»m vá»¥ | 2026-01-06, 2026-01-07, 2026-01-08 |
| datetime | DATETIME | Thá»i Äiá»m thá»±c hiá»n nhiá»m vá»¥ | 2025-04-07 19:01:16, 2025-04-04 20:15:17, 2025-07-11 16:57:49 |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng thá»±c hiá»n nhiá»m vá»¥ | 14375447, 97175364, 90807955 |
| mission_id | STRING | MÃ£ Äá»nh danh cá»§a nhiá»m vá»¥ | mission_20251020_p2p_receive_bank_100xu, mission_20250701_p2p_receive_bank_20xu,... |
| mission_name | STRING | TÃªn cá»§a nhiá»m vá»¥ | Nhận tiền qua QR từ Ngân hàng, Nhận tiền qua QR 100% nhận Xu (từ App Ngân hàng),... |
| coin_amount | INTEGER | Sá» lÆ°á»£ng coin mÃ  ngÆ°á»i dÃ¹ng nháº­n ÄÆ°á»£c tá»« nhiá»m vá»¥ | 25, 20, 100 |
| tid | STRING | ID giao dá»ch liÃªn quan Äáº¿n nhiá»m vá»¥ | 98846208456, 90416113962, 98862029592 |

## Domain Knowledge (from Mimir)

- Dùng cột user_id trong bảng momovn-prod.MBI_DA.LOAN_P2P_AUTORECEIVE_MAU
- is_self_transfer: là cột chứa thông tin của các giao dịch self transfer hay không
- Số lượng người dùng nhận tiền trong tháng 11/2025 có bật tính năng auto receive được tính bằng cách join bảng TUAN_RECEIVER_ALL_BEHAVIOR và LOAN_P2P_AUTORECEIVE_MAU
- Khi xử lý vấn đề liên quan tới receiver_id, dùng user_id cho cột t2
- is_self_transfer: là cột chứa thông tin của các giao dịch self transfer hay không
- Self-transfer: Là giao dịch mà user_id và receiver_id trùng nhau.

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
