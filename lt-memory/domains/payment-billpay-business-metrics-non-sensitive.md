# Domain: BU Payment: Billpay - Business metrics (Non Sensitive)

## Identity
- **Domain ID:** `f9ccec9b-d24b-47b8-9e81-1805aa865726`
- **Description:** Records all business information of Billpay services (including mau, transaction details, user demographics, etc.)
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.BU_UTILITIES_TELCO.MIMIR_BILLPAY_DETAILS

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month_active | DATE | ThÃ¡ng mÃ  ngÆ°á»i dÃ¹ng thá»±c hiá»n thanh toÃ¡nThe month that the user has payment  | 2025-11-01, 2025-10-01, 2025-09-01 |
| date | DATE | NgÃ y diá»n ra giao dá»chDate of the transaction | 2025-11-03, 2025-09-03, 2025-07-03 |
| user_id | STRING | ID duy nháº¥t cá»§a ngÆ°á»i dÃ¹ngUnique ID of a user | 85111949, 43416840, 22879770 |
| subcategory | STRING | Danh má»¥c cá»§a dá»ch vá»¥: "DIEN" lÃ  Äiá»n, "NUOC" lÃ  NÆ°á»c, "INTERNET" lÃ  Internet, "TRUO... | DIEN, NUOC, INTERNET, OTHER, DIEN THOAI TRA SAU |
| merchant | STRING | TÃªn cá»§a nhÃ  cung cáº¥p dá»ch vá»¥Name of the supplier | EVN HO CHI MINH, ADSL FPT, EVN HA NOI, MYVIETTEL-ONETIME, VNPT TOAN QUOC |
| transaction_count | INTEGER | Sá» lÆ°á»£ng giao dá»ch ÄÃ£ thá»±c hiá»nThe number of transaction made | 1, 2, 3 |
| amount | FLOAT | Sá» tiá»n cá»§a cÃ¡c giao dá»ch (ÄÆ¡n vá»: VNÄ)The amount of the transactions (currency: VND) | 600000, 1200000, 1800000 |
| voucher_amount | FLOAT | Sá» tiá»n ÄÆ°á»£c giáº£m giÃ¡The discounted amount  | 0, 60000, 20000 |
| voucher_or_not | STRING | Chá» ra ngÆ°á»i dÃ¹ng cÃ³ sá»­ dá»¥ng voucher hay khÃ´ng: "Voucher" nghÄ©a lÃ  ngÆ°á»i dÃ¹ng ÄÃ£... | Non_voucher, Voucher |
| revenue | FLOAT | Doanh thu cÃ´ng ty nháº­n ÄÆ°á»£c tá»« cÃ¡c giao dá»chRevenue our company gets from the transactio... | 0, 23999.999999999996, 11999.999999999998 |
| user_type | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng (theo tiÃªu chÃ­ hÃ³a ÄÆ¡n): "retain_user" nghÄ©a lÃ  ngÆ°á»i dÃ¹ng th... | retain_user, recover_user, new_user |
| user_type_sub | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng theo danh má»¥c phá»¥Segment of the user (by subcategory) | retain_user, recover_user, new_user, unknown |
| user_type_mer | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng theo nhÃ  cung cáº¥pSegment of the user (by merchant) | retain_user, recover_user, new_user, unknown |
| region | STRING | VÃ¹ng cá»§a vá» trÃ­ ngÆ°á»i dÃ¹ngRegion of user's location | Đông Nam Bộ, Đồng bằng sông Hồng, Nam Trung Bộ |
| city_group | STRING | NhÃ³m thÃ nh phá» cá»§a vá» trÃ­ ngÆ°á»i dÃ¹ngGroup of city of user's location | Thành Phố Hồ Chí Minh, Tỉnh khác, Hà Nội, KCN Miền Nam, TP Lớn |
| city | STRING | TÃªn thÃ nh phá» cá»§a vá» trÃ­ ngÆ°á»i dÃ¹ngThe city name of user's location | Hồ Chí Minh, Hà Nội, Bình Dương |
| age | NUMERIC | Tuá»i cá»§a ngÆ°á»i dÃ¹ng (null nghÄ©a lÃ  khÃ´ng rÃµ)User's age (null means unknown) | 31, 29, 30 |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ngUser's age group | [4].28-35, [5].36-50, [3].23-27, [2].18-22, [6].>50 |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ngUser's gender | male, female, unknown |
| login_app_count | INTEGER | Sá» phiÃªn mÃ  ngÆ°á»i dÃ¹ng ÄÄng nháº­p vÃ o á»©ng dá»¥ng di Äá»ng cá»§a chÃºng tÃ´iThe numbe... | 0, 4, 12 |
| login_billpay_center_count | INTEGER | Sá» phiÃªn mÃ  ngÆ°á»i dÃ¹ng ÄÄng nháº­p vÃ o trung tÃ¢m dá»ch vá»¥ hÃ³a ÄÆ¡n bÃªn trong á»©ng... | 0, 12, 24 |
| display_xbanner_count | INTEGER | Sá» phiÃªn mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ tháº¥y xbanner (banners nháº¯c ná»£) trong á»©ng dá»¥ng khi Äáº... | 0, 12, 6 |
| click_xbanner_count | INTEGER | Sá» láº§n ngÆ°á»i dÃ¹ng nháº¥p vÃ o xbannerThe number of clicks that the user clicked on our xbann... | 0, 12, 6 |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
