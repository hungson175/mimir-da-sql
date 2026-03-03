# Domain: BU Payment: P2P QUYNHOM

## Identity
- **Domain ID:** `3a52651b-b3a6-4865-8a11-7b06ea99be24`
- **Description:** Domain này bao gồm những thông tin sau của sản phẩm QUỸ (NHÓM)
(1) transaction details: Lịch sử giao dịch trong quỹ
(2) fund creation information: Thông tin quỹ được tạo
(3) ending balance: Số dư quỹ
(4) active users MoMo: User có ít nhất 1 giao dịch trong bảng iDeA_TRANS_CORE
(4) event tracking: Product event thao tác trên miniapp quỹ nhóm
(5) promotion gift: Số user được nhận gift, redeem gift
- **Tables:** 7
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND_TRANSFER
> Báº£ng nÃ y ghi láº¡i cÃ¡c thÃ´ng tin liÃªn quan Äáº¿n viá»c chuyá»n quá»¹ trong dá»ch vá»¥ P2P MONEYPOOL. Báº£ng cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá»: 
- Theo dÃµi tráº¡ng thÃ¡i vÃ  chi tiáº¿t cá»§a cÃ¡c hoáº¡t Äá»ng chuyá»n quá»¹ giá»¯a cÃ¡c ngÆ°á»i dÃ¹ng trong dá»ch vá»¥ P2P MONEYPOOL. 
...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng diá»n ra hoáº¡t Äá»ng chuyá»n quá»¹. | 2025-12-01, 2025-11-01, 2025-10-01 |
| date | DATE | NgÃ y diá»n ra hoáº¡t Äá»ng chuyá»n quá»¹. | 2025-12-05, 2025-12-12, 2025-12-10 |
| datetime | DATETIME | NgÃ y giá» cá»¥ thá» cá»§a hoáº¡t Äá»ng chuyá»n quá»¹. | 2025-11-25 05:07:14.852, 2025-11-05 22:53:38.440, 2025-12-13 07:56:14.848 |
| FUND_ID | STRING | MÃ£ Äá»nh danh cho quá»¹ ÄÆ°á»£c chuyá»n. | mp_11050877_lpkwst8a5oq4xghrzx1bf, mp_59832398_4s0zxg5ejhovhmm51rkbvo, mp_261428... |
| USER_ID | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng tham gia chuyá»n quá»¹. | 71351460, 95936547, 27345607 |
| ACTION | FLOAT | HÃ nh Äá»ng liÃªn quan Äáº¿n chuyá»n quá»¹. | 9, 1, -1 |
| ACTION_NAME | STRING | TÃªn cá»§a hÃ nh Äá»ng liÃªn quan Äáº¿n chuyá»n quá»¹. | Claim Interest, Cash In, Payment SOF, Withdraw, Withdraw to Wallet for Payment |
| ROLE | FLOAT | Vai trÃ² cá»§a ngÆ°á»i dÃ¹ng trong hoáº¡t Äá»ng chuyá»n quá»¹. | 1, 2, 3 |
| FUND_TYPE | STRING | Loáº¡i quá»¹ ÄÆ°á»£c sá»­ dá»¥ng trong quÃ¡ trÃ¬nh chuyá»n quá»¹. | [1]. Individual, [2]. 2 People, [3]. 3-4 People, [4]. 5+ People |
| FUND_TYPE_include_B2W | STRING | Loáº¡i quá»¹ bao gá»m cáº£ giao dá»ch B2W. | [1]. Individual, [2]. Couple, [3]. Family & Friends |
| USER_ID_OWNER | STRING | MÃ£ Äá»nh danh cá»§a chá»§ sá» há»¯u quá»¹. | 11050877, 36964031, 59832398 |
| STATUS_FUND | FLOAT | Tráº¡ng thÃ¡i cá»§a quá»¹ táº¡i tá»«ng bÆ°á»c trong quÃ¡ trÃ¬nh chuyá»n quá»¹. | 1, 0, 3, 2 |
| FUND_SIZE | INTEGER | KÃ­ch thÆ°á»c hoáº·c sá» lÆ°á»£ng cá»§a quá»¹. | 1, 2, 3 |
| STATUS_FUND_final | FLOAT | Tráº¡ng thÃ¡i cuá»i cÃ¹ng cá»§a quá»¹ sau khi hoáº¡t Äá»ng chuyá»n quá»¹ hoÃ n táº¥t. | 1, 0 |
| OWNER_AGE | STRING | Äá» tuá»i cá»§a chá»§ sá» há»¯u quá»¹. | [2].Owner >18, [1].Owner Under 18 |
| USER_TYPE_to_service | STRING | Loáº¡i ngÆ°á»i dÃ¹ng tham gia dá»ch vá»¥. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| new_user_type_to_service | STRING | Loáº¡i ngÆ°á»i dÃ¹ng má»i tham gia dá»ch vá»¥. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| FUND_TYPE_active | STRING | Loáº¡i quá»¹ Äang hoáº¡t Äá»ng trong quÃ¡ trÃ¬nh chuyá»n quá»¹. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| UniqueOwner_to_service | STRING | Chá» sá» Äá»nh danh duy nháº¥t cá»§a chá»§ sá» há»¯u trong dá»ch vá»¥. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| CORE_MONEY_SOURCE | STRING | Nguá»n tiá»n cá»t lÃµi ÄÆ°á»£c sá»­ dá»¥ng trong giao dá»ch. | Khác, MoMo wallet, Banklink, Túi thần tài, Quỹ nhóm |
| TID | FLOAT | MÃ£ giao dá»ch liÃªn quan Äáº¿n chuyá»n quá»¹. | 0, 108879701119, 104078432272 |
| PAYMENT_TID | FLOAT | MÃ£ giao dá»ch cá»§a thanh toÃ¡n liÃªn quan Äáº¿n chuyá»n quá»¹. | 87290368707, 89407319324, 100649064228 |
| PARENT_TID | FLOAT | MÃ£ giao dá»ch gá»c liÃªn quan Äáº¿n cÃ¡c giao dá»ch con. | 86593114534, 107408070067, 93905637910 |
| STATUS | STRING | Tráº¡ng thÃ¡i cá»§a giao dá»ch chuyá»n quá»¹. | success, refunded, refunding, failed, processing |
| ERROR_CODE | FLOAT | MÃ£ lá»i náº¿u cÃ³ trong quÃ¡ trÃ¬nh chuyá»n quá»¹. | 0, 1219101, 1219100 |
| PAYMENT_CHANNEL | STRING | KÃªnh thanh toÃ¡n ÄÆ°á»£c sá»­ dá»¥ng trong chuyá»n quá»¹. | scan_qr, detail_home, link_private, link_public, link_private_requested |
| MESSAGE_TRANSFER | STRING | ThÃ´ng Äiá»p kÃ¨m theo trong quÃ¡ trÃ¬nh chuyá»n quá»¹. | Pfj8Zi1Tc63jgxBMFAGTQV1udyRpAmKhgtcs/YoqPjQ=, eNIXuGs0S21+UG/qiQDHo09Olh06DsYuTV... |
| AMOUNT | FLOAT | GiÃ¡ trá» cá»§a sá» tiá»n ÄÆ°á»£c chuyá»n trong giao dá»ch. | 1, 20000, 10000 |
| B2W_user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng trong giao dá»ch B2W. | 49305308e5c3bd38203bf9df59d7eb6a028645ede7cd29aa56a5a96fe37a59fd, f043dd0cff4720... |
| tknh_momo_type | STRING | Loáº¡i tÃ i khoáº£n MoMo liÃªn quan Äáº¿n giao dá»ch. | [2]. not overlap, [1]. overlap |
| tknh_tknh_type | STRING | Loáº¡i tÃ i khoáº£n ngÃ¢n hÃ ng liÃªn quan Äáº¿n giao dá»ch. | [2]. not overlap, [1]. overlap |
| SOURCE_ACCOUNT_MOMO_USER_TYPE | STRING | Loáº¡i ngÆ°á»i dÃ¹ng MoMo cá»§a tÃ i khoáº£n nguá»n trong giao dá»ch. | [1]. Đã map, [2]. Chưa map -> Đã map |
| SOURCE_ACCOUNT_MOMO_USER_ID | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng MoMo tá»« tÃ i khoáº£n nguá»n trong giao dá»ch. | 72559601, 30885744, 48864194 |
| FUND_INVESTMENT_STATUS | FLOAT | Tráº¡ng thÃ¡i Äáº§u tÆ° quá»¹ trong quÃ¡ trÃ¬nh giao dá»ch. | 1, 0, 2 |
| REGISTER_INVESTMENT_TIME | DATETIME | Thá»i gian ÄÄng kÃ½ Äáº§u tÆ° quá»¹. | 2025-02-15 17:55:17.331, 2024-12-10 09:51:43.465, 2025-05-13 13:55:53.349 |
| fund_type_by_purpose | STRING | Loáº¡i quá»¹ theo má»¥c ÄÃ­ch sá»­ dá»¥ng. | [2]. Saving, [1]. Spending |
| FUND_INVESTMENT_TYPE | STRING | Loáº¡i Äáº§u tÆ° quá»¹. | [1]. TTT, [2]. Non-TTT |
| FIRST_INVESTMENT_TID_TYPE | STRING | Loáº¡i mÃ£ giao dá»ch cá»§a láº§n Äáº§u tÆ° Äáº§u tiÃªn. | [1]. ACTION (1) đi kèm ACTION (-3) |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng tham gia. | others, [2].18-22, [3].23-27, [4].28-35, [1].<18  |
| citygroup | STRING | NhÃ³m thÃ nh phá» cá»§a ngÆ°á»i dÃ¹ng. | UNKNOWN, Thành Phố Hồ Chí Minh, Hà Nội |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ng. | FEMALE, MALE |
| avail_balance | FLOAT | Sá» dÆ° kháº£ dá»¥ng trong tÃ i khoáº£n. | 1807525297643, 1680149887402, 1584838726227 |

### momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_ENDING_BALANCE_BY_FUNDID_FULL_daily
> Báº£ng chá»©a thÃ´ng tin sá» dÆ° cuá»i ká»³ cá»§a dá»ch vá»¥ P2P MONEYPOOL theo tá»«ng fund_id hÃ ng ngÃ y, bao gá»m sá» dÆ° kháº£ dá»¥ng cho cÃ¡c loáº¡i tiá»n khÃ¡c nhau vÃ  tráº¡ng thÃ¡i cá»§a quá»¹. Má»¥c ÄÃ­ch cá»§a báº£ng nÃ y bao gá»m:
- Theo dÃµi sá» dÆ° kháº£ dá»¥ng cho má»i quá»¹ ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng cá»§a dá»¯ liá»u sá» dÆ°. | 2025-12-01, 2025-11-01, 2025-10-01 |
| date | DATE | NgÃ y cá»§a dá»¯ liá»u sá» dÆ°. | 2026-01-04, 2026-01-03, 2026-01-02 |
| fund_id | STRING | MÃ£ Äá»nh danh cá»§a quá»¹ trong dá»ch vá»¥ P2P MONEYPOOL. | mp_45528504_5bvnpotmbhqdvs5iqnz6bz, mp_5776589_2xzbs2avr0ogxb1hspqi0b, mp_307343... |
| avail_balance_non_ttt | FLOAT | Sá» dÆ° kháº£ dá»¥ng khÃ´ng bao gá»m tÃºi tháº§n tÃ i (TTT). | 0, 1000, 2000 |
| avail_balance_ttt | FLOAT | Sá» dÆ° kháº£ dá»¥ng bao gá»m tÃºi tháº§n tÃ i (TTT). | 0, 352, 1000 |
| avail_balance | FLOAT | Sá» dÆ° kháº£ dá»¥ng tá»ng cá»ng. | 0, 1000, 352 |
| STATUS_FUND_final | FLOAT | Tráº¡ng thÃ¡i cuá»i cÃ¹ng cá»§a quá»¹. | 1, 0, 2 |
| FUND_TYPE_include_B2W | STRING | Loáº¡i hÃ¬nh cá»§a quá»¹, bao gá»m cáº£ loáº¡i B2W. | , [1]. Individual, [2]. Couple, [3]. Family & Friends |
| avail_balance_group | STRING | NhÃ³m sá» dÆ° kháº£ dá»¥ng. | [0]. 0, [0].(0;10K), [4].[100K;500K), [6].[1M;3M), [2].[20K;50K) |

### momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_EVENT_ALL_STEP_BY_TYPE
> Báº£ng nÃ y chá»©a dá»¯ liá»u chi tiáº¿t vá» sá»± kiá»n cá»§a P2P Moneypool trÃªn MoMo. Báº£ng cung cáº¥p thÃ´ng tin vá»: 
- Loáº¡i sá»± kiá»n vÃ  nÄm tá» chá»©c.
- ThÃ´ng tin vá» ngÆ°á»i dÃ¹ng tham gia vÃ  loáº¡i quá»¹ liÃªn quan Äáº¿n B2W.
- Vai trÃ² vÃ  loáº¡i chá»§ sá» há»¯u theo thÃ¡...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| type | STRING | Loáº¡i sá»± kiá»n cá»§a P2P Moneypool trÃªn MoMo | [Fund Home]. H.thị home tính năng quỹ nhóm (đã có quỹ), [Fund Home]. Total User ... |
| user_id | STRING | ID ngÆ°á»i dÃ¹ng tham gia sá»± kiá»n P2P Moneypool | 35908390, 17286936, 58589410 |
| date | DATE | NgÃ y diá»n ra sá»± kiá»n P2P Moneypool | 2025-01-29, 2025-01-28, 2025-01-30 |
| month | DATE | ThÃ¡ng diá»n ra sá»± kiá»n P2P Moneypool | 2025-03-01, 2025-01-01, 2025-05-01 |
| FUND_TYPE_include_B2W | STRING | Loáº¡i quá»¹ liÃªn quan tham gia sá»± kiá»n, bao gá»m B2W | [2]. Couple, [1]. Individual, [3]. Family & Friends |
| ROLE | FLOAT | Vai trÃ² cá»§a ngÆ°á»i dÃ¹ng trong sá»± kiá»n | 1, 2, 3 |
| OWNER_TYPE_bymonth | STRING | Loáº¡i chá»§ sá» há»¯u sá»± kiá»n tÃ­nh theo thÃ¡ng | [2]. Existing (Member/Owner), [1]. New User |

### momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND
> Báº£ng fact nÃ y chá»©a thÃ´ng tin liÃªn quan Äáº¿n cÃ¡c Quá»¹ nhÃ³m P2P MONEYPOOL, phá»¥c vá»¥ cho viá»c phÃ¢n tÃ­ch vÃ  quáº£n lÃ½ sá»± tham gia vÃ  hoáº¡t Äá»ng cá»§a ngÆ°á»i dÃ¹ng trong cÃ¡c quá»¹ nhÃ³m. 
CÃ¡c thÃ´ng tin cÃ³ thá» khai thÃ¡c tá»« báº£ng nÃ y bao gá»m: 
- Theo dÃµi thá»i g...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| create_month | DATE | ThÃ¡ng táº¡o ra quá»¹ | 2025-05-01, 2025-07-01, 2025-08-01 |
| create_date | DATE | NgÃ y táº¡o ra quá»¹ | 2025-05-11, 2025-05-15, 2025-05-10 |
| create_datetime | DATETIME | NgÃ y vÃ  giá» táº¡o ra quá»¹ | 2025-05-15 15:50:01.227, 2025-05-15 15:50:25.898, 2025-05-15 15:49:50.725 |
| update_time_fund | DATE | Thá»i gian cáº­p nháº­t quá»¹ | 2025-11-23, 2025-05-20, 2025-05-15 |
| end_date | DATE | NgÃ y káº¿t thÃºc quá»¹ | 1970-01-01, 2025-12-31, 2026-01-01 |
| FUND_ID | STRING | MÃ£ Äá»nh danh cá»§a quá»¹ | mp_93332841_25rbdf4nio6xnzdf5nctog, mp_94337171_ojp82c2c3hkymwhjovknz, mp_637701... |
| TARGET | FLOAT | Má»¥c tiÃªu cá»§a quá»¹ | 0, 10000000, 5000000 |
| USER_ID_OWNER | STRING | ID ngÆ°á»i sá» há»¯u quá»¹ | 94328737, 94195778, 94337412 |
| USER_ID_MEMBER | STRING | ID thÃ nh viÃªn cá»§a quá»¹ | 17286936, 93676868, 58589410 |
| ROLE | FLOAT | Vai trÃ² trong quá»¹ | 1, 2, 3 |
| STATUS_FUND | FLOAT | Tráº¡ng thÃ¡i hoáº¡t Äá»ng cá»§a quá»¹ | 1, 0, 3 |
| STATUS_MEMBER | FLOAT | Tráº¡ng thÃ¡i cá»§a thÃ nh viÃªn trong quá»¹ | 1, 0, 3, 8, 4 |
| NAME | STRING | TÃªn quá»¹ | ATM99 Nạp 100k nhận 888k https://biitly.site/xMuB, 🍀 Tích lũy cho tương lai, Ae ... |
| DESC_FUND | STRING | MÃ´ táº£ quá»¹ | ATM99 Nạp 100k nhận 888k https://biitly.site/xMuB, Cùng nhau tích lũy, cùng vun ... |
| CATEGORY | STRING | Danh má»¥c cá»§a quá»¹ | other_fund, couple_fund, personal_fund, sc25, friend_fund |
| INVESTMENT_STATUS | FLOAT | Tráº¡ng thÃ¡i Äáº§u tÆ° | 1, 0, 2 |
| REGISTER_INVESTMENT_TIME | DATETIME | Thá»i gian ÄÄng kÃ½ Äáº§u tÆ° | 2025-04-17 19:44:43.177, 2025-05-20 10:19:12.309, 2024-11-09 02:26:43.171 |
| REGISTER_INVESTMENT_DATE | DATE | NgÃ y ÄÄng kÃ½ Äáº§u tÆ° | 2025-07-14, 2025-07-15, 2025-07-16 |
| FIRST_INVESTMENT_TID | FLOAT | MÃ£ Äá»nh danh Äáº§u tÆ° Äáº§u tiÃªn | 99365766880, 87993255172, 70954856979 |
| DEPOSIT_AIO_QR_STATUS | FLOAT | Tráº¡ng thÃ¡i náº¡p tiá»n qua QR | 1, 0 |
| TARGET_GOAL | STRING | Má»¥c tiÃªu quá»¹ nhÃ³m | saving, travel, shopping, living_expenses, eat_drink |
| COVER | STRING | áº¢nh bÃ¬a cá»§a quá»¹ nhÃ³m cÃ³ chá»©a thÃ´ng tin nháº¡y cáº£m |  |
| IMAGES | STRING | HÃ¬nh áº£nh quá»¹ nhÃ³m cÃ³ chá»©a thÃ´ng tin nháº¡y cáº£m |  |
| COVER_TYPE | STRING | Loáº¡i áº£nh bÃ¬a | [1]. Default, [2]. Changed |
| USER_DISPLAYNAME | STRING | TÃªn hiá»n thá» cá»§a ngÆ°á»i dÃ¹ng cÃ³ chá»©a thÃ´ng tin nháº¡y cáº£m |  |
| FUND_SIZE | INTEGER | Quy mÃ´ quá»¹ | 1, 2, 3 |
| FUND_TYPE | STRING | Loáº¡i hÃ¬nh quá»¹ | [1]. Individual, [4]. 5+ People, [2]. 2 People, [3]. 3-4 People |
| FUND_TYPE_detail | STRING | Chi tiáº¿t loáº¡i hÃ¬nh quá»¹ | [1]. Individual, [6]. Group 9+, [2]. Couple, [4]. Group 4-6, [3]. Group 3 |
| FUND_TYPE_include_B2W | STRING | Loáº¡i hÃ¬nh quá»¹ bao gá»m B2W | [1]. Individual, [3]. Family & Friends, [2]. Couple |
| STATUS_FUND_final | FLOAT | Tráº¡ng thÃ¡i cuá»i cÃ¹ng cá»§a quá»¹ | 1, 0, 3 |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i tham gia | [2].18-22, [3].23-27, [4].28-35, others, [1].<18  |
| citygroup | STRING | NhÃ³m thÃ nh phá» cá»§a ngÆ°á»i tham gia | Thành Phố Hồ Chí Minh, Tỉnh khác, Hà Nội, UNKNOWN, KCN Miền Nam |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i tham gia | male, female, unknown |
| ACTIVE_POOL_FUND | STRING | Quá»¹ nhÃ³m Äang hoáº¡t Äá»ng | [1]. Active, [2]. Non-active |
| USER_TYPE_bymonth | STRING | Loáº¡i hÃ¬nh ngÆ°á»i dÃ¹ng theo thÃ¡ng | [1]. New User, [2]. Existing |
| OWNER_AGE | STRING | Tuá»i cá»§a chá»§ sá» há»¯u quá»¹ | [2].Owner >18, [1].Owner Under 18 |
| ACTIVE_FUND | STRING | Quá»¹ Äang hoáº¡t Äá»ng | [1]. Chưa khóa - Active, [1]. Chưa khóa - Non-Active, [2]. Đã khóa - Active, [2]... |
| avail_balance | FLOAT | Sá» dÆ° kháº£ dá»¥ng trong quá»¹ | 0, 1000, 2000 |
| FLOW_TAO_QUY | STRING | Quy trÃ¬nh táº¡o quá»¹ | [Fund Home]. Toast tạo quỹ thành công - Mainflow (not template), [Fund Home]. To... |

### project-5400504384186300846.MBI_DA.flat_quy_gift
> Flat_quy_gift, láº¥y raw data tá»« model gift: https://atlassiantool.mservice.com.vn:9443/pages/viewpage.action?spaceKey=BS&title=G_7_8+DB+Schema#G_7_8DBSchema-ii.GIFT_INFO. Báº£ng nÃ y cÃ³ chá»©a cÃ¡c thÃ´ng tin má»i: service code, tá»ng há»£p thÃ´ng tin chi tiáº¿t vá» cÃ¡c mÃ³n quÃ , bao gá»m ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| gift_id | STRING | ID cá»§a gift.Gift id | 0NC506PM6XDJ0, 0NC2MKKZAWMG0, 0NC45BT52WQ80 |
| gift_type_id | STRING | ID loáº¡i gift.Gift type id | qn_movie_10k_250423_giam_100pt10k_xip57, qn_15k_new_t6_250602_giam_100pt15k_cylw... |
| amount | FLOAT | GiÃ¡ trá» cá»§a gift.giÃ¡ trá» gift amount | 10000, 15000, 5000 |
| status | FLOAT | Tráº¡ng thÃ¡i cá»§a gift. Status = 6 lÃ  ÄÃ£ redeem.Status cá»§a gift. Status = 6 lÃ  ÄÃ£ redeem | 5, 6, 1, 8 |
| agent_id | STRING | MÃ£ Äá»nh danh cá»§a user.MÃ£ Äá»nh danh cá»§a user | 47475273, 52912959, 85255659 |
| start_date | DATE | NgÃ y báº¯t Äáº§u cá»§a gift (collect).NgÃ y báº¯t Äáº§u cá»§a gift (collect) | 2025-04-25, 2025-06-03, 2025-04-24 |
| start_datetime | DATETIME | Thá»i gian báº¯t Äáº§u cá»§a gift (collect).Thá»i gian báº¯t Äáº§u cá»§a gift (collect) | 2025-11-24 19:56:27.032, 2025-04-25 13:02:33.474, 2025-04-26 10:47:14.595 |
| end_datetime | DATETIME | Thá»i gian káº¿t thÃºc cá»§a gift (collect).Thá»i gian káº¿t thÃºc cá»§a gift (collect) | 2025-05-15 23:59:59, 2025-07-31 23:59:59, 2025-07-06 00:00:00 |
| modify_datetime | DATETIME | Thá»i gian cáº­p nháº­t cá»§a gift (collect).Thá»i gian cáº­p nháº­t cá»§a gift (collect) | 2025-05-16 21:00:00, 2025-05-16 20:00:00, 2025-08-01 20:00:00 |
| agent | STRING | MÃ£ Äá»nh danh cá»§a user.MÃ£ Äá»nh danh cá»§a user | kgs_sp301_20250424_0051, kgs_sp301_20250602_0041, kgs_sp301_20250704_0015 |
| ver | FLOAT | PhiÃªn báº£n cá»§a gift. | 1, 9 |
| created_datetime | DATETIME | Thá»i gian táº¡o gift.Thá»i gian táº¡o gift | 2025-04-21 18:05:52, 2025-05-12 17:34:02, 2025-03-27 19:43:29 |
| is_reward | BOOLEAN | CÃ³ pháº£i gift thuá»c schema reward khÃ´ng. | false, true |
| tran_id | FLOAT | Transaction ID cá»§a giao dá»ch redeem.Transaction id cá»§a giao dá»ch redeem | 112998699150, 112543719051, 112513082271 |
| total_amount | FLOAT | Tá»ng giÃ¡ trá» cá»§a gift.Tá»ng tiá»n cá»§a gift | 10000, 20000, 5000 |
| promo_amount | FLOAT | Tá»ng giÃ¡ trá» promotion cá»§a gift.Tá»ng giÃ¡ trá» promotion cá»§a gift | 3000, 10000, 1111 |
| vc_amount | FLOAT | Tá»ng giÃ¡ trá» voucher cá»§a gift.Tá»ng giÃ¡ trá» voucher cá»§a gift | 0, 10000, 5000 |
| cb_amount | FLOAT | Tá»ng giÃ¡ trá» cashback cá»§a gift.Tá»ng giÃ¡ trá» cashback cá»§a gift | 0, 3000, 1111 |
| bnvc_amount | FLOAT | ChÆ°a rÃµ.ChÆ°a rÃµ | 0 |
| is_redeemed | BOOLEAN | Gift ÄÃ£ ÄÆ°á»£c redeem chÆ°a. | false, true |
| redeem_datetime | DATETIME | Thá»i gian gift ÄÆ°á»£c redeem.Thá»i gian gift ÄÆ°á»£c redeem | 2025-10-08 20:53:58, 2025-08-22 18:19:46, 2025-12-09 09:28:43 |
| service_code | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n gift. | Unknown, u2u, cardcashout.mbbank_w2b |
| owner_monthly_active_type | STRING | Loáº¡i hoáº¡t Äá»ng hÃ ng thÃ¡ng cá»§a chá»§ sá» há»¯u. | Unknown, [03]. Reactivation, [01]. New to service, [02]. Retention |
| fund_type | STRING | Loáº¡i fund cá»§a gift. | Unknown, [1]. Individual, [2]. Couple, [3]. Family & Friends |
| specialproject | STRING | Dá»± Ã¡n Äáº·c biá»t liÃªn quan Äáº¿n gift. | Unknown, P2P - EWALLET TO BANK, AIRTIME, P2P - EWALLET TO EWALLET, UTILITIES |
| is_active_from_redeem | BOOLEAN | Gift cÃ³ hoáº¡t Äá»ng tá»« lÃºc redeem khÃ´ng. | false, true |
| gift_type_name | STRING | TÃªn cá»§a loáº¡i gift. | Giảm 10K Cho đơn từ 0đ, Giảm 10K  Vé Xem Phim từ 0đ, Giảm 15K khi sử dụng Quỹ Nh... |
| USER_ID_OWNER | STRING | MÃ£ Äá»nh danh cá»§a chá»§ sá» há»¯u user. | 32083706, 59459161, 35879376 |
| is_active_user | BOOLEAN | User cÃ³ hoáº¡t Äá»ng khÃ´ng. | false, true |
| is_active_owner | BOOLEAN | Chá»§ sá» há»¯u cÃ³ hoáº¡t Äá»ng khÃ´ng. | false, true |

### project-5400504384186300846.MBI_DA.fact_quy_owner_monthly
> Báº£ng fact lÆ°u trá»¯ thÃ´ng tin hÃ nh vi vÃ  Äáº·c Äiá»m hoáº¡t Äá»ng cá»§a chá»§ quá»¹ (owner) P2P FUND theo thÃ¡ng. - PhÃ¢n tÃ­ch nhÃ³m ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng (retention, reactivation) trong thÃ¡ng Äá»i vá»i tá»«ng quá»¹. - Äo lÆ°á»ng hiá»u quáº£ cá»§a cÃ¡c chiáº¿n dá»ch/tacti...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng tÃ­nh dá»¯ liá»u (Äá»nh dáº¡ng yyyy-mm-01)ThÃ¡ng tÃ­nh dá»¯ liá»u (Äá»nh dáº¡ng yyyy-mm... | 2025-12-01, 2025-09-01, 2025-11-01 |
| owner_aid | STRING | MÃ£ Äá»nh danh vÃ­ MoMo cá»§a chá»§ quá»¹MÃ£ Äá»nh danh vÃ­ MoMo cá»§a chá»§ quá»¹

**Sample val... | 52450319, 51461473, 81459126 |
| monthly_active_type | STRING | PhÃ¢n loáº¡i hoáº¡t Äá»ng trong thÃ¡ng cá»§a chá»§ quá»¹: [01] New, [02] Retention, [03] Reactivat... | [02]. Retention, [03]. Reactivation, [01]. New to service |
| action_type | STRING | Loáº¡i hÃ nh Äá»ng cuá»i cÃ¹ng cá»§a chá»§ quá»¹ trong thÃ¡ng: final_action, first_action. | final_action |
| fund_id | STRING | MÃ£ quá»¹ nhÃ³m P2P FUND do chá»§ quá»¹ táº¡o raMÃ£ quá»¹ nhÃ³m P2P FUND do chá»§ quá»¹ táº¡o ra

**... | mp_99453831_1zexrxakn0fwrebcaw5s61, mp_68663598_4xql1ltl6nok6d2nyahpjl, mp_86757... |
| tid | FLOAT | MÃ£ transaction ID cá»§a hÃ nh Äá»ng cuá»i thÃ¡ng (dáº¡ng sá» thá»±c)MÃ£ transaction ID cá»§a hÃ... | 113024320203, 113316939863, 112940817248 |
| date | DATE | NgÃ y active Äáº§u tiÃªn trong thÃ¡ngNgÃ y active Äáº§u tiÃªn trong thÃ¡ng

**Sample value**: 2025... | 2025-12-01, 2026-01-01, 2025-10-01 |
| datetime | DATETIME | Thá»i Äiá»m active Äáº§u tiÃªn trong thÃ¡ngThá»i Äiá»m active Äáº§u tiÃªn trong thÃ¡ng

**Sa... | 2025-06-05 22:26:44.136, 2025-02-07 12:49:53.072, 2025-02-02 21:06:18.715 |
| milisecond_diff | INTEGER | Khoáº£ng thá»i gian tÃ­nh báº±ng mili-giÃ¢y (null náº¿u khÃ´ng Ã¡p dá»¥ng)Khoáº£ng thá»i gian tÃ­n... | 0, 100, 103 |
| detail_id | STRING | Ná»i dung chi tiáº¿t dáº¡ng json/message (private)Ná»i dung chi tiáº¿t dáº¡ng json/message (privat... |  |
| tactic | STRING | Tactic gÃ¢y áº£nh hÆ°á»ng: Organic, Paid, Noti. | Organic, voucher, gamification, reward, comm |
| kpi_type | STRING | Loáº¡i KPI tÆ°Æ¡ng á»©ng vá»i tactic: Organic, Paid, Noti. | Organic, growth, engage |
| sub_tactics | STRING | Sub-tactic chi tiáº¿t cá»§a tactic: Organic, PaidSearch, Display. | Organic, tran_game, redeem_voucher_collect, collect_voucher, redeem_reward_gift |
| campaign_name_lv1 | STRING | TÃªn campaign cáº¥p Äá» 1 (cáº¥p cao nháº¥t)TÃªn campaign cáº¥p Äá» 1 (cáº¥p cao nháº¥t)

**Samp... | Organic, , SC25 |
| campaign_name_lv2 | STRING | TÃªn campaign cáº¥p Äá» 2 (cáº¥p con cá»§a lv1)TÃªn campaign cáº¥p Äá» 2 (cáº¥p con cá»§a lv1)

... | Organic, , qn_w2b_251204_cbttt_100pt3k_hje7k |
| priority_rank_lv1 | INTEGER | Thá»© tá»± Æ°u tiÃªn cá»§a tactic trong cÃ¹ng campaign lv1 (0 = tháº¥p nháº¥t)Thá»© tá»± Æ°u tiÃªn c... | 0, 3, 2 |
| priority_rank_lv3 | INTEGER | Thá»© tá»± Æ°u tiÃªn cá»§a tactic trong cÃ¹ng campaign lv3 (0 = tháº¥p nháº¥t)Thá»© tá»± Æ°u tiÃªn c... | 0, 3, 2 |
| attribution_rank | INTEGER | Thá»© háº¡ng attribution cá»§a tactic (null náº¿u khÃ´ng Ã¡p dá»¥ng)Thá»© háº¡ng attribution cá»§a t... | 1 |

### momovn-prod.MBI_DA.P2P_FUND_SURVEY_SOF
> Báº£ng nÃ y chá»©a dá»¯ liá»u kháº£o sÃ¡t liÃªn quan Äáº¿n dá»ch vá»¥ Quá»¹ nhÃ³m P2P. Báº£ng bao gá»m thÃ´ng tin vá» ngÆ°á»i tham gia kháº£o sÃ¡t, thá»i gian báº¯t Äáº§u vÃ  hoÃ n thÃ nh kháº£o sÃ¡t, cÃ¹ng vá»i cÃ¡c cÃ¢u tráº£ lá»i cho tá»«ng cÃ¢u há»i trong kháº£o sÃ¡t. CÃ¡c thÃ´ng tin ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| user_id | INTEGER | ID cá»§a ngÆ°á»i dÃ¹ng tham gia kháº£o sÃ¡t | 7265934, 45489588, 27969159 |
| status | STRING | Tráº¡ng thÃ¡i cá»§a kháº£o sÃ¡t, vÃ­ dá»¥: ÄÃ£ hoÃ n thÃ nh hoáº·c chÆ°a hoÃ n thÃ nh | COMPLETED |
| time_start | TIMESTAMP | Thá»i gian khi ngÆ°á»i dÃ¹ng báº¯t Äáº§u kháº£o sÃ¡t | 2025-12-30 11:00:50+00, 2025-12-29 19:59:19+00, 2026-01-04 11:38:23+00 |
| time_submit | TIMESTAMP | Thá»i gian khi ngÆ°á»i dÃ¹ng hoÃ n táº¥t vÃ  ná»p kháº£o sÃ¡t | 2025-12-31 09:48:36+00, 2026-01-03 14:40:07+00, 2025-12-30 17:15:45+00 |
| q1_1 | STRING | CÃ¢u tráº£ lá»i cho cÃ¢u há»i sá» 1 pháº§n 1 cá»§a kháº£o sÃ¡t | Có thể chuyển trực tiếp tiền từ Quỹ A sang Quỹ B, không cần rút về Ví rồi nạp lạ... |
| q1_2 | STRING | CÃ¢u tráº£ lá»i cho cÃ¢u há»i sá» 1 pháº§n 2 cá»§a kháº£o sÃ¡t | Dùng Quỹ để thanh toán thêm các dịch vụ bên ngoài MoMo (Vd: Grab, TikTok) |
| q1_3 | STRING | CÃ¢u tráº£ lá»i cho cÃ¢u há»i sá» 1 pháº§n 3 cá»§a kháº£o sÃ¡t | Tự động góp Quỹ định kỳ, không lo quên lịch góp |
| q1_4 | STRING | CÃ¢u tráº£ lá»i cho cÃ¢u há»i sá» 1 pháº§n 4 cá»§a kháº£o sÃ¡t | Ẩn một số Quỹ khi thanh toán để tránh tiêu nhầm (Vd: quỹ dự phòng, quỹ nhóm) |
| q1_5 | STRING | CÃ¢u tráº£ lá»i cho cÃ¢u há»i sá» 1 pháº§n 5 cá»§a kháº£o sÃ¡t | Cho phép cài đặt Quỹ ở thứ tự thanh toán số 1 để không cần chọn lại Quỹ mỗi lần ... |
| q1_7 | STRING | CÃ¢u tráº£ lá»i cho cÃ¢u há»i sá» 1 pháº§n 7 cá»§a kháº£o sÃ¡t | Dùng Quỹ để thanh toán hóa đơn định kỳ (Vd: hóa đơn điện), Dùng Quỹ để thanh toá... |
| q1_7_other | STRING | ThÃ´ng tin khÃ¡c náº¿u cÃ³ cho cÃ¢u há»i sá» 1 pháº§n 7 cá»§a kháº£o sÃ¡t | Ok, ok, Để chế độ uỷ quyền để cùng rút tiền không cần phê duyệt |
| q2_grab | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n dá»ch vá»¥ Grab trong kháº£o sÃ¡t | Grab |
| q2_shopee | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n dá»ch vá»¥ Shopee trong kháº£o sÃ¡t | Shopee |
| q2_xanhsm | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n dá»ch vá»¥ xanhsm trong kháº£o sÃ¡t | XanhSM |
| q2_be | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n dá»ch vá»¥ Be trong kháº£o sÃ¡t | be |
| q2_tiktok_shop | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n TikTok Shop trong kháº£o sÃ¡t | TikTok Shop |
| q2_netflix | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n dá»ch vá»¥ Netflix trong kháº£o sÃ¡t | Netflix |
| q2_app_store | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n dá»ch vá»¥ App Store trong kháº£o sÃ¡t | App Store |
| q2_google_play | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n dá»ch vá»¥ Google Play trong kháº£o sÃ¡t | Cửa hàng Google (Google Play) |
| q2_youtube_premium | STRING | CÃ¢u tráº£ lá»i liÃªn quan Äáº¿n YouTube Premium trong kháº£o sÃ¡t | Youtube Premium |
| q2_other | STRING | ThÃ´ng tin khÃ¡c náº¿u cÃ³ cho cÃ¢u há»i sá» 2 cá»§a kháº£o sÃ¡t | Mua đồ, Thanh toán hoá đơn ăn uống, Lazada |
| q3_need | STRING | CÃ¢u tráº£ lá»i vá» nhu cáº§u cá»§a ngÆ°á»i dÃ¹ng trong kháº£o sÃ¡t | ., không, Dễ sử dụng |

## Domain Knowledge (from Mimir)

- Payment SOF tương ứng với các ACTION in (-2, -4, -5, -6)
- MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE
- STATUS_MEMBER mapping: 1 = '[1]. ACTIVE', 2 = '[2]. LEAVE', 3 = '[3]. INVITE TO JOIN', 4 = '[4]. REJECT INVITATION', 5 = '[5]. REQUEST TO JOIN', 6 = '[6]. REJECT REQUEST', 0 = '[0]. DEACTIVATE'
- INVESTMENT_STATUS mapping: case when INVESTMENT_STATUS = 1 then '[1]. Quỹ Sinh Lời' else '[2]. Quỹ không sinh lời' end as INVESTMENT_STATUS
- STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND
- Churned User: Người dùng được coi là rời bỏ của tháng X, nếu họ không thực hiện bất kỳ giao dịch nào trong tháng X-1, nhưng đã có giao dịch nạp quỹ trong tháng X-2.
- Khi đếm số lượng quỹ, sử dụng COUNT(DISTINCT FUND_ID) thay vì COUNT(FUND_ID)
- User churn (P2P Moneypool): A user is considered churned in month M if they had at least one transaction in any month prior to M, but had no transactions in month M.
- Nạp quỹ bao gồm 3 ACTION: Cash In, CashIn AIOQR (bank-ví), Cash In AIOQR (ví-ví)
- MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE
- STATUS_MEMBER mapping: 1 = '[1]. ACTIVE', 2 = '[2]. LEAVE', 3 = '[3]. INVITE TO JOIN', 4 = '[4]. REJECT INVITATION', 5 = '[5]. REQUEST TO JOIN', 6 = '[6]. REJECT REQUEST', 0 = '[0]. DEACTIVATE'
- STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND
- STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND
- Move tiền behavior: User có nhu cầu move tiền khi có giao dịch rút tiền (ACTION_NAME = 'Withdraw') từ quỹ X về ví MoMo, và liền sau đó (gap time 1-3 ngày) có giao dịch góp tiền (ACTION_NAME = 'Cash In' với CORE_MONEY_SOURCE = 'MoMo wallet') vào quỹ B khác
- Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-1 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X
- Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-2 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X-1
- Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-1 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X
- Khi query quỹ có tên ở dạng 'đấu trường tri thức', sử dụng điều kiện lower(FUND_NAME) LIKE '%đấu trường tri thức%'
- MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE
- MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE
- active_members_bank: thành viên góp quỹ bằng cách quét QR từ app ngân hàng, tương ứng với ACTION_NAME = 'CashIn AIOQR (bank-ví)'
- STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND
- ACTION = -6 tương ứng với 'Withdraw as requested'
- ROLE = 3 tương ứng với "phó quỹ" trong bảng momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND
- Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-2 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X-1

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
