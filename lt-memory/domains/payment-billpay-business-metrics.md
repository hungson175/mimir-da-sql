# Domain: BU Payment: Billpay - Business metrics

## Identity
- **Domain ID:** `28214cde-da94-48ef-9039-00fa6f448da7`
- **Description:** Records all business information of Billpay services (including mau, transaction details, user demographics, etc.)
- **Tables:** 3
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.BU_UTILITIES_TELCO.MIMIR_BILLPAY_DETAILS

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month_active | DATE | ThÃ¡ng mÃ  ngÆ°á»i dÃ¹ng thá»±c hiá»n thanh toÃ¡n hÃ³a ÄÆ¡nThe month that the user has payment  | 2025-11-01, 2025-10-01, 2025-08-01 |
| date | DATE | NgÃ y diá»n ra giao dá»ch thanh toÃ¡n hÃ³a ÄÆ¡nDate of the transaction | 2025-11-03, 2025-09-03, 2025-07-03 |
| user_id | STRING | ID Äá»nh danh duy nháº¥t cá»§a ngÆ°á»i dÃ¹ngUnique ID of a user | 85111949, 22879770, 47220537 |
| subcategory | STRING | Danh má»¥c dá»ch vá»¥ liÃªn quan Äáº¿n thanh toÃ¡n hÃ³a ÄÆ¡n. | DIEN, NUOC, INTERNET, OTHER, DIEN THOAI TRA SAU |
| merchant | STRING | TÃªn nhÃ  cung cáº¥p dá»ch vá»¥ hÃ³a ÄÆ¡n ÄÆ°á»£c thanh toÃ¡nName of the supplier | EVN HO CHI MINH, ADSL FPT, EVN HA NOI, MYVIETTEL-ONETIME, VNPT TOAN QUOC |
| transaction_count | INTEGER | Sá» lÆ°á»£ng giao dá»ch ÄÃ£ thá»±c hiá»nThe number of transaction made | 1, 2, 3 |
| amount | FLOAT | Sá» tiá»n cá»§a cÃ¡c giao dá»ch (ÄÆ¡n vá»: VND)The amount of the transactions (currency: VND) | 600000, 1200000, 1800000 |
| voucher_amount | FLOAT | Sá» tiá»n ÄÆ°á»£c giáº£m giÃ¡ tá»« voucherThe discounted amount  | 0, 60000, 20000 |
| voucher_or_not | STRING | Cho biáº¿t ngÆ°á»i dÃ¹ng cÃ³ sá»­ dá»¥ng voucher hay khÃ´ng. | Non_voucher, Voucher |
| revenue | FLOAT | Lá»£i nhuáº­n cÃ´ng ty tá»« cÃ¡c giao dá»chRevenue our company gets from the transactions | 0, 23999.999999999996, 11999.999999999998 |
| user_type | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng theo hÃ³a ÄÆ¡n. | retain_user, recover_user, new_user, unknown |
| user_type_sub | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng theo danh má»¥c dá»ch vá»¥ liÃªn quan Äáº¿n hÃ³a ÄÆ¡nSegment of the u... | retain_user, recover_user, new_user, unknown |
| user_type_mer | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng theo nhÃ  cung cáº¥p dá»ch vá»¥ hÃ³a ÄÆ¡nSegment of the user (by merch... | retain_user, recover_user, new_user, unknown |
| region | STRING | Khu vá»±c Äá»a lÃ½ nÆ¡i ngÆ°á»i dÃ¹ng cÆ° trÃºRegion of user's location | Đông Nam Bộ, Đồng bằng sông Hồng, Nam Trung Bộ |
| city_group | STRING | NhÃ³m thÃ nh phá» nÆ¡i ngÆ°á»i dÃ¹ng cÆ° trÃºGroup of city of user's location | Thành Phố Hồ Chí Minh, Tỉnh khác, Hà Nội, KCN Miền Nam, TP Lớn |
| city | STRING | TÃªn thÃ nh phá» nÆ¡i ngÆ°á»i dÃ¹ng cÆ° trÃºThe city name of user's location | Hồ Chí Minh, Hà Nội, Bình Dương |
| age | NUMERIC | Tuá»i cá»§a ngÆ°á»i dÃ¹ng (null cÃ³ nghÄ©a lÃ  khÃ´ng biáº¿t)User's age (null means unknown) | 31, 29, 30 |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ngUser's age group | [4].28-35, [5].36-50, [3].23-27, [2].18-22, [6].>50 |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ngUser's gender | male, female, unknown |
| login_app_count | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng ÄÄng nháº­p á»©ng dá»¥ng di Äá»ng cá»§a chÃºng tÃ´iThe number of sessi... | 0, 4, 12 |
| login_billpay_center_count | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng ÄÄng nháº­p trung tÃ¢m dá»ch vá»¥ hÃ³a ÄÆ¡n trong á»©ng dá»¥ng di Äá»... | 0, 12, 24 |
| display_xbanner_count | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng nhÃ¬n tháº¥y xbanner (banner nháº¯c ná»£) trong á»©ng dá»¥ng cá»§a chÃºng ... | 0, 12, 6 |
| click_xbanner_count | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng nháº¥n chuá»t vÃ o xbanner cá»§a chÃºng tÃ´iThe number of clicks that the... | 0, 12, 6 |

### momovn-prod.BU_UTILITIES_TELCO.USER_JOURNEY_BILLPAY_PIVOT

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| dt | DATE | NgÃ y phÃ¡t sinh dá»¯ liá»u.date | 2023-03-10, 2023-03-15, 2023-03-14 |
| user_id | STRING | MÃ£ Äá»nh danh duy nháº¥t cho má»i ngÆ°á»i dÃ¹ng.Unique ID of each user | 8169410, 13016619, 31968159 |
| bill_detail_screen | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng nhÃ¬n hoáº·c hiá»n thá» mÃ n hÃ¬nh chi tiáº¿t hÃ³a Ä... | 2, 4, 1 |
| billpay_center_screen | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng nhÃ¬n hoáº·c hiá»n thá» mÃ n hÃ¬nh dá»ch vá»¥ trung ... | 2, 1, 4 |
| Button_save_bill | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng kiá»m tra thÃ´ng tin hÃ³a ÄÆ¡n thÃ nh cÃ´ng vÃ  lÆ°u ... | 1, 2, 3 |
| button_trans_result | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n káº¿t quáº£ cá»§a giao dá»ch thÃ´ng qua nÃºt báº¥m. | 1, 2, 4 |
| click_noti | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng nháº¥p vÃ o thÃ´ng bÃ¡o vá» dá»ch vá»¥ Billpay. | 1, 2, 3 |
| click_xbanner | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng nháº¥p vÃ o X-banner. | 1, 2, 3 |
| close_xbanner | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng ÄÃ³ng X-banner. | 1, 2, 0 |
| displayed_xbanner | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi X-banner ÄÆ°á»£c hiá»n thá» cho ngÆ°á»i dÃ¹ng. | 1, 2, 3 |
| MHTTAT | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi mÃ n hÃ¬nh thanh toÃ¡n an toÃ n (MHTTAT) ÄÆ°á»£c hiá»n thá» cho ngÆ... | 1, 2, 3 |
| my_wallet | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n liÃªn quan Äáº¿n tÃ­nh nÄng vÃ­ cá»§a tÃ´i trong á»©ng dá»¥ng. | 1, 2, 3 |
| search | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng thá»±c hiá»n thao tÃ¡c tÃ¬m kiáº¿m. | 1, 2, 3 |
| trans_confirmation | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n xÃ¡c nháº­n giao dá»ch. | 1, 2, 3 |
| icon_click | INTEGER | Sá» lÆ°á»£ng sá»± kiá»n khi ngÆ°á»i dÃ¹ng nháº¥p vÃ o biá»u tÆ°á»£ng trÃªn mÃ n hÃ¬nh Home cá»§a... | 1, 2, 3 |

### momovn-prod.BU_UTILITIES_TELCO.BILLPAY_ADD_BILLS

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| user_id | STRING | ID duy nháº¥t cá»§a ngÆ°á»i dÃ¹ng.Unique ID of the user | 41202429, 41625780, 19006549 |
| bill_id | STRING | ID duy nháº¥t cá»§a hÃ³a ÄÆ¡n.Unique ID of the bill |  |
| category | STRING | Dá»ch vá»¥ mÃ  hÃ³a ÄÆ¡n thuá»c vá». | Điện, Finance Collection Inapp, Nước, Internet, Điện thoại |
| add_bill_date | DATE | NgÃ y mÃ  ngÆ°á»i dÃ¹ng kiá»m tra vÃ  thÃªm hÃ³a ÄÆ¡n thÃ nh cÃ´ng vÃ o vÃ­ Äiá»n tá»­ cá»§a há... | 2022-06-23, 2024-09-10, 2021-03-10 |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng.User's age group | [5]. 31 - 35 Y/O, [4]. 27 - 30 Y/O, [7]. >40 Y/O, [3]. 23 - 26 Y/O, [6]. 36 - 40... |
| most_city_a60 | STRING | TÃªn thÃ nh phá» mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ sinh sá»ng trong 60 ngÃ y gáº§n nháº¥t. | UNKNOWN, HỒ CHÍ MINH, HÀ NỘI |
| most_district_a60 | STRING | TÃªn quáº­n mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ sinh sá»ng trong 60 ngÃ y gáº§n nháº¥t. | UNKNOWN, BÌNH THẠNH, GÒ VẤP |
| most_ward_a60 | STRING | TÃªn phÆ°á»ng mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ sinh sá»ng trong 60 ngÃ y gáº§n nháº¥t. |  |
| most_region | STRING | TÃªn khu vá»±c mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ sinh sá»ng trong 60 ngÃ y gáº§n nháº¥t. | ĐÔNG NAM BỘ, UNKNOWN, ĐỒNG BẰNG SÔNG HỒNG, ĐỒNG BẰNG SÔNG CỬU LONG, NAM TRUNG BỘ |

## Domain Knowledge (from Mimir)

- Tháng này: tháng này là date_trunc(date(current_date('+7')), month )
- Số người truy cập billpay: Số người truy cập billpay = count(distinct case when billpay_center_screen > 0 then user_id end)

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
