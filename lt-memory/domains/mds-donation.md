# Domain: BU MDS: Donation

## Identity
- **Domain ID:** `dd5f63eb-9981-4d0b-ba85-bd73ce80f52f`
- **Description:** Donation là nền tảng gây quỹ từ thiện tích hợp trong ví điện tử. Người dùng có thể quyên góp tiền hoặc heo vàng cho các dự án xã hội (trẻ em, người già, giáo dục, y tế, v.v) thông qua nhiều hình thức như chuyển tiền trực tiếp, quyên góp bằng item heo đất nhận được khi chơi game, quét mã QR, hoặc mua hàng gây quỹ.
- **Tables:** 6
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.MBI_DA.DONATION_ENGAGEMEN_OVERLAP_MOMO_A90_MEU
> Báº£ng phÃ¢n tÃ­ch sá»± giao thoa giá»¯a ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng hÃ ng thÃ¡ng trong ngá»¯ cáº£nh quyÃªn gÃ³p vÃ  ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng 90 ngÃ y trÃªn ná»n táº£ng MoMo. 
ThÃ´ng tin cÃ³ thá» láº¥y ÄÆ°á»£c tá»« báº£ng nÃ y: 
- PhÃ¢n tÃ­ch ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng hÃ ng thÃ¡ng theo...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng bÃ¡o cÃ¡o (YYYY-MM-DD), Äáº¡i diá»n cho ngÃ y snapshot cá»§a phÃ¢n tÃ­ch sá»± giao thoa. | 2025-09-01 |
| total_meu | INTEGER | Tá»ng sá» ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng hÃ ng thÃ¡ng (MEU) trong ngá»¯ cáº£nh quyÃªn gÃ³p cho thÃ¡... | 441615 |
| total_a90 | INTEGER | Tá»ng sá» ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng trong 90 ngÃ y gáº§n nháº¥t (A90) trÃªn ná»n táº£ng MoMo. | 12651341, 12894361 |
| overlap_meu_a90 | INTEGER | Sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng Äá»c ÄÃ¡o cÃ³ máº·t trong cáº£ nhÃ³m MEU quyÃªn gÃ³p vÃ  nhÃ³m A90 t... |  |
| only_meu | INTEGER | NgÆ°á»i dÃ¹ng trong nhÃ³m MEU quyÃªn gÃ³p nhÆ°ng KHÃNG thuá»c nhÃ³m A90 trÃªn ná»n táº£ng (Tá»n... |  |
| only_a90 | INTEGER | NgÆ°á»i dÃ¹ng trong nhÃ³m A90 trÃªn ná»n táº£ng nhÆ°ng KHÃNG tham gia vá»i MEU quyÃªn gÃ³p (Tá»... |  |
| pct_meu_in_a90 | FLOAT | Tá»· lá» pháº§n trÄm ngÆ°á»i dÃ¹ng MEU quyÃªn gÃ³p cÅ©ng lÃ  má»t pháº§n cá»§a cÆ¡ sá» A90 (Sá»... |  |

### project-5400504384186300846.MBI_DA.DONATION_TRANSACTION_AGG
> Báº£ng tá»ng há»£p giao dá»ch quyÃªn gÃ³p. Báº£ng nÃ y chá»©a thÃ´ng tin chi tiáº¿t vá» cÃ¡c giao dá»ch quyÃªn gÃ³p, bao gá»m ngÃ y giao dá»ch, ngÆ°á»i dÃ¹ng quyÃªn gÃ³p, sá» tiá»n quyÃªn gÃ³p vÃ  hÃ nh Äá»ng cá»§a ngÆ°á»i dÃ¹ng. ThÃ´ng tin tá»« báº£ng nÃ y cÃ³ thá» dÃ¹ng Äá»:
PhÃ¢n t...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| date_ | DATE | NgÃ y giao dá»ch cá»¥ thá» (YYYY-MM-DD).The specific transaction date (YYYY-MM-DD). | 2025-06-13, 2025-05-23, 2025-05-20 |
| month | DATE | ThÃ¡ng bÃ¡o cÃ¡o (YYYY-MM-01) Äá» phÃ¢n tÃ­ch cohort vÃ  retention. | 2024-12-01, 2025-06-01, 2024-09-01 |
| user_id | STRING | MÃ£ Äá»nh danh duy nháº¥t cá»§a ngÆ°á»i quyÃªn gÃ³p.Unique identifier of the donor. | 40417928, 46892922, 50495932 |
| creditor | STRING | MÃ£ ngÆ°á»i nháº­n hoáº·c chiáº¿n dá»ch nháº­n quyÃªn gÃ³p. | dbp_vietqrp2p_052025, dbp_vietqr_122024, dbp_vietqr_final |
| donate_type | STRING | Danh má»¥c quyÃªn gÃ³p (vÃ­ dá»¥: donate_heo_vang).Category of the donation (e.g., donate_heo_vang). | donate_heo_vang, donate_money |
| game_id | STRING | MÃ£ Äá»nh danh cá»§a trÃ² chÆ¡i/tÃ­nh nÄng trigger quyÃªn gÃ³p. | dbp_vietqrp2p_052025, dbp_vietqr_122024, dbp_vietqr_final |
| action | STRING | HÃ nh Äá»ng chÃ­nh cá»§a ngÆ°á»i dÃ¹ng ÄÆ°á»£c ghi nháº­n.Primary user action captured. | donate_heo_vang, donate_by_purchase, donate_money_trai_tim, donate_other, donate... |
| action_2 | STRING | PhÃ¢n loáº¡i thá»© cáº¥p hoáº·c chi tiáº¿t hÆ¡n vá» hÃ nh Äá»ng cá»§a ngÆ°á»i dÃ¹ng. | donate_heo_vang, donate_by_purchase, donate_cash, donate_qr_code |
| total_amount | FLOAT | Tá»ng sá» tiá»n quyÃªn gÃ³p (ÄÆ¡n vá» tiá»n hoáº·c Äiá»m). | 10, 20, 9 |
| total_trans | INTEGER | Sá» lÆ°á»£ng giao dá»ch cho má»i sá»± káº¿t há»£p ngÆ°á»i dÃ¹ng/ngÃ y/hÃ nh Äá»ng cá»¥ thá». | 1, 2, 3 |
| last_month_donate | DATE | GiÃ¡ trá» thÃ¡ng cá»§a láº§n quyÃªn gÃ³p trÆ°á»c ÄÃ³ cá»§a ngÆ°á»i dÃ¹ng Äá» kiá»m tra sá»± l... | 2025-05-01, 2024-09-01, 2024-12-01 |
| mon_retain_segment | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng dá»±a trÃªn hÃ nh vi thÃ¡ng qua thÃ¡ng (vÃ­ dá»¥: 'Ligh', 'New', 'Medium... | Retain, New, Redonated_3_mon, Redonated_2_mon, Redonated_1_mon |
| num_date_donate_by_action | INTEGER | Sá» lÆ°á»£ng ngÃ y riÃªng biá»t ngÆ°á»i dÃ¹ng ÄÃ£ quyÃªn gÃ³p theo hÃ nh Äá»ng. | 1, 2, 3 |
| num_date_donate_by_action_2 | INTEGER | Sá» lÆ°á»£ng ngÃ y riÃªng biá»t ngÆ°á»i dÃ¹ng ÄÃ£ quyÃªn gÃ³p theo hÃ nh Äá»ng thá»© cáº¥p. | 1, 2, 30 |
| num_date_donate | INTEGER | Tá»ng sá» ngÃ y riÃªng biá»t ngÆ°á»i dÃ¹ng ÄÃ£ quyÃªn gÃ³p trong thÃ¡ng. | 1, 2, 31 |
| lag_date_in_month | DATE | Sá» lÆ°á»£ng ngÃ y ká» tá»« láº§n quyÃªn gÃ³p trÆ°á»c ÄÃ³ cá»§a ngÆ°á»i dÃ¹ng trong cÃ¹ng thÃ¡n... | 2025-06-05, 2025-06-06, 2025-05-20 |
| lag_date_in_month_by_action_2 | DATE | Sá» lÆ°á»£ng ngÃ y ká» tá»« láº§n quyÃªn gÃ³p trÆ°á»c ÄÃ³ cá»§a ngÆ°á»i dÃ¹ng theo hÃ nh Äá»n... | 2025-06-05, 2025-06-06, 2025-05-20 |
| first_donate_in_month | INTEGER | Cá» nhá» phÃ¢n (1/0) chá» Äá»nh ÄÃ¢y lÃ  láº§n Äáº§u tiÃªn ngÆ°á»i dÃ¹ng quyÃªn gÃ³p trong t... | 0, 1 |
| first_donate_in_month_by_action_2 | INTEGER | Cá» nhá» phÃ¢n (1/0) chá» Äá»nh ÄÃ¢y lÃ  láº§n Äáº§u tiÃªn ngÆ°á»i dÃ¹ng quyÃªn gÃ³p theo hÃ... | 0, 1 |
| all_action_in_month | STRING | Chuá»i káº¿t há»£p hoáº·c danh sÃ¡ch táº¥t cáº£ cÃ¡c hÃ nh Äá»ng mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ thá»±c h... | donate_by_purchase, donate_by_purchase,donate_by_purchase, donate_by_purchase,do... |

### project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_RETENTION
> project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_RETENTION lÆ°u trá»¯ thÃ´ng tin vá» má»©c Äá» tham gia vÃ  giá»¯ chÃ¢n ngÆ°á»i dÃ¹ng trong hoáº¡t Äá»ng quyÃªn gÃ³p theo tá»«ng thÃ¡ng. Trong báº£ng nÃ y, cÃ¡c thÃ´ng tin cÃ³ thá» ÄÆ°á»£c khai thÃ¡c bao gá»m: 
- ThÃ¡ng bÃ¡o cÃ¡o cho dá»...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng bÃ¡o cÃ¡o cho dá»¯ liá»u, thÆ°á»ng ÄÆ°á»£c Äáº¡i diá»n bá»i ngÃ y Äáº§u tiÃªn cá»§a th... | 2024-05-01, 2025-06-01, 2025-05-01 |
| engage_type | STRING | Danh má»¥c cá»¥ thá» cá»§a loáº¡i hÃ¬nh tham gia quyÃªn gÃ³p (vÃ­ dá»¥: engage_feed, engage_communi... | engage_fashion, engage_walk, engage_at_least_one_type, engage_invite, engage_com... |
| total_user | INTEGER | Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng duy nháº¥t tham gia vÃ o loáº¡i hÃ¬nh tham gia quyÃªn gÃ³p cá»¥ ... | 50144, 236256, 665535 |
| user_retain_next_month | INTEGER | Sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng duy nháº¥t tá»« nhÃ³m ngÆ°á»i dÃ¹ng cá»§a thÃ¡ng hiá»n táº¡i ÄÃ£ trá... | 0, 415530, 120484 |
| retention_rate | FLOAT | Tá»· lá» pháº§n trÄm ngÆ°á»i dÃ¹ng ÄÆ°á»£c giá»¯ chÃ¢n, ÄÆ°á»£c tÃ­nh báº±ng cÃ´ng thá»©c (user... | 49.591441204542356, 20.11601881880053, 0 |

### project-5400504384186300846.MBI_DA.DONATION_OVERLAP_MAU_MEU
> Báº£ng nÃ y chá»©a thÃ´ng tin vá» sá»± giao thoa giá»¯a ngÆ°á»i dÃ¹ng tÆ°Æ¡ng tÃ¡c vá»i ná»n táº£ng quyÃªn gÃ³p vÃ  ngÆ°á»i dÃ¹ng cÃ³ hÃ nh Äá»ng quyÃªn gÃ³p trÃªn MoMo trong tá»«ng thÃ¡ng. CÃ¡c thÃ´ng tin cÃ³ thá» láº¥y tá»« báº£ng nÃ y bao gá»m: 
- Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng duy ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month | DATE | ThÃ¡ng bÃ¡o cÃ¡o (YYYY-MM-DD) cho áº£nh chá»¥p giao thoa. | 2025-05-01, 2024-12-01, 2025-06-01 |
| total_user | INTEGER | Tá»ng sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng duy nháº¥t trong phÃ¢n tÃ­ch (Tá»ng cá»§a Only_MEU + Only_MAU +... | 761367, 382896 |
| total_meu_user | INTEGER | Sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng duy nháº¥t tÆ°Æ¡ng tÃ¡c vá»i ná»n táº£ng quyÃªn gÃ³p (vÃ­ dá»¥: chÆ¡i... | 472103, 566596, 718942 |
| TYPE | STRING | Danh má»¥c phÃ¢n Äoáº¡n: 'Only_MEU' (TÆ°Æ¡ng tÃ¡c/chÆ¡i games nhÆ°ng khÃ´ng quyÃªn gÃ³p), 'Only_MAU... | Only_MEU, OVERLAP_MAU_MEU |
| total_user_by_type | INTEGER | Sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng duy nháº¥t thuá»c vá» danh má»¥c cá»¥ thá» ÄÆ°á»£c Äá»nh nghÄ©a t... | 46384, 62205, 215539 |

### project-5400504384186300846.MBI_DA.DONATION_FIRST_DONATE
> project-5400504384186300846.MBI_DA.DONATION_FIRST_DONATE lÃ  báº£ng ghi nháº­n thÃ´ng tin vá» láº§n Äáº§u ngÆ°á»i dÃ¹ng tham gia hoáº¡t Äá»ng quyÃªn gÃ³p trÃªn ná»n táº£ng MoMo. Báº£ng nÃ y giÃºp theo dÃµi cÃ¡c thÃ´ng tin liÃªn quan Äáº¿n viá»c quyÃªn gÃ³p cá»§a ngÆ°á»i dÃ¹ng, Äáº·c biá»t...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| user_id | STRING | MÃ£ Äá»nh danh duy nháº¥t cá»§a ngÆ°á»i quyÃªn gÃ³p. | 36499718, 43668038, 55784366 |
| action | STRING | PhÆ°Æ¡ng thá»©c hoáº·c kÃªnh quyÃªn gÃ³p cá»¥ thá» ÄÆ°á»£c sá»­ dá»¥ng (vÃ­ dá»¥: MÃ£ QR, Tiá»n T... | donate_by_purchase, donate_heo_vang, donate_money_trai_tim, donate_other, donate... |
| first_date_donate_by_action | DATE | NgÃ y sá»m nháº¥t (YYYY-MM-DD) ngÆ°á»i dÃ¹ng thá»±c hiá»n phÆ°Æ¡ng thá»©c 'action' cá»¥ thá» nÃ ... | 2024-08-29, 2024-08-30, 2024-08-31 |
| first_date | DATE | NgÃ y Äáº§u tiÃªn tuyá»t Äá»i mÃ  ngÆ°á»i dÃ¹ng tá»«ng thá»±c hiá»n báº¥t ká»³ hoáº¡t Äá»ng ... | 2024-08-29, 2024-08-30, 2022-07-18 |

### project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_AGG
> Báº£ng nÃ y chá»©a thÃ´ng tin vá» má»©c Äá» tÆ°Æ¡ng tÃ¡c cá»§a ngÆ°á»i dÃ¹ng vá»i ná»n táº£ng quyÃªn gÃ³p. ThÃ´ng tin trong báº£ng cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» phÃ¢n tÃ­ch xu hÆ°á»ng tÆ°Æ¡ng tÃ¡c cá»§a ngÆ°á»i dÃ¹ng theo thá»i gian, xÃ¡c Äá»nh ngÆ°á»i dÃ¹ng má»i tham gia, vÃ  ph...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| date_ | DATE | NgÃ y cá»¥ thá» cá»§a tÆ°Æ¡ng tÃ¡c (YYYY-MM-DD).The specific date of engagement (YYYY-MM-DD). | 2022-08-10, 2022-01-18, 2022-08-17 |
| month | DATE | ThÃ¡ng bÃ¡o cÃ¡o (YYYY-MM-01) dÃ¹ng Äá» phÃ¢n tÃ­ch xu hÆ°á»ng. | 2022-08-01, 2022-10-01, 2022-01-01 |
| user_id | STRING | ID Äá»c nháº¥t cá»§a ngÆ°á»i dÃ¹ng.Unique identifier of the user. |  |
| engage_type | STRING | Danh má»¥c cáº¥p cao cá»§a tÆ°Æ¡ng tÃ¡c (vÃ­ dá»¥: engage_community). | engage_feed, engage_walk, engage_school, engage_study, engage_fashion |
| action | STRING | Hoáº¡t Äá»ng cá»¥ thá» thá»±c hiá»n trong loáº¡i tÆ°Æ¡ng tÃ¡c. | feed_pig, walk_reward_100g, submit_event, submit_study, feed_my_pig |
| n_action | INTEGER | Tá»ng sá» láº§n hoáº¡t Äá»ng ÄÆ°á»£c thá»±c hiá»n trong ngÃ y nÃ y. | 1, 3, 2 |
| first_date_engage_by_type | DATE | NgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng tÆ°Æ¡ng tÃ¡c vá»i loáº¡i engage_type cá»¥ thá» nÃ y. | 2021-10-01, 2021-10-02, 2023-04-28 |
| first_date_engage | DATE | NgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng tÆ°Æ¡ng tÃ¡c vá»i ná»n táº£ng quyÃªn gÃ³p (Global First Engageme... | 2021-10-01, 2019-10-31, 2019-11-01 |
| num_date_by_engage | INTEGER | Tá»ng sá» ngÃ y khÃ¡c nhau ngÆ°á»i dÃ¹ng tÆ°Æ¡ng tÃ¡c vá»i loáº¡i cá»¥ thá» trong thÃ¡ng. | 0, 31, 30 |
| num_date_engage | INTEGER | Tá»ng sá» ngÃ y khÃ¡c nhau ngÆ°á»i dÃ¹ng tÆ°Æ¡ng tÃ¡c vá»i báº¥t ká»³ pháº§n nÃ o cá»§a ná»n tá... | 0, 31, 30 |
| segment_in_month_by_engage | STRING | PhÃ¢n Äoáº¡n cÆ°á»ng Äá» cá»§a ngÆ°á»i dÃ¹ng (vÃ­ dá»¥: Light, Heavy) dá»±a trÃªn tÆ°Æ¡ng tÃ¡c ... | Heavy, Medium, Light, New |
| segment_in_month | STRING | PhÃ¢n Äoáº¡n cÆ°á»ng Äá» toÃ n bá» cá»§a ngÆ°á»i dÃ¹ng (vÃ­ dá»¥: Light, Heavy) dá»±a trÃªn tá... | Heavy, Medium, Light, Heavy_tu_do, Medium_tu_do |
| lag_date_in_month | DATE | Sá» ngÃ y trÃ´i qua tá»« láº§n tÆ°Æ¡ng tÃ¡c trÆ°á»c trong thÃ¡ng hiá»n táº¡i. | 2022-08-17, 2022-10-13, 2022-08-15 |
| lag_date_in_month_by_engage | DATE | Sá» ngÃ y trÃ´i qua tá»« láº§n tÆ°Æ¡ng tÃ¡c trÆ°á»c vá»i loáº¡i cá»¥ thá» trong thÃ¡ng hiá»n tá... | 2022-10-18, 2022-08-18, 2022-08-11 |
| first_engage_in_month | INTEGER | Cá» bÃ¡o (1/0) chá» ra cÃ³ pháº£i ÄÃ¢y lÃ  láº§n tÆ°Æ¡ng tÃ¡c Äáº§u tiÃªn cá»§a ngÆ°á»i dÃ¹ng t... | 0, 1 |
| first_engage_in_month_by_engage | INTEGER | Cá» bÃ¡o (1/0) chá» ra cÃ³ pháº£i ÄÃ¢y lÃ  láº§n tÆ°Æ¡ng tÃ¡c Äáº§u tiÃªn cá»§a ngÆ°á»i dÃ¹ng t... | 0, 1 |
| agent_id | STRING | ID Äá»c nháº¥t cá»§a ngÆ°á»i dÃ¹ng.Unique identifier of the user. | 50539017, 62201827, 62934468 |

## Domain Knowledge (from Mimir)

- Khi xử lý MAU, cột ACTION không nên là 'Donate by purchase', mà là 'donate_by_purchase'

## Suggested Probe Questions

- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
