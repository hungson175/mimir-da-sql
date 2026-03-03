# Domain: BU Payment: Data (Non Sensitive)

## Identity
- **Domain ID:** `be004a0c-5e7c-442d-ab51-a7026eed5433`
- **Description:** All detailed transaction of service Data since 2021
- **Tables:** 2
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| id | INTEGER | MÃ£ Äá»nh danh cá»§a giao dá»chtransaction id |  |
| date | DATE | NgÃ y thá»±c hiá»n giao dá»chngÃ y thá»±c hiá»n id |  |
| datetime | DATETIME | Thá»i gian thá»±c hiá»n giao dá»chthá»i gian thá»±c hiá»n id |  |
| hour | INTEGER | Giá» thá»±c hiá»n giao dá»chgiá» thá»±c hiá»n id |  |
| user_payment | FLOAT | ID ngÆ°á»i dÃ¹ng thá»±c hiá»n giao dá»chuser_id thá»±c hiá»n id |  |
| amount | FLOAT | Tá»ng sá» tiá»n cá»§a giao dá»chtá»ng sá» tiá»n cá»§a id |  |
| mm_amount | FLOAT | Tá»ng sá» tiá»n dÃ¹ng trong ngÄn vÃ­ Momo cá»§a giao dá»chtá»ng sá» tiá»n dÃ¹ng trong ngÄn ... |  |
| vc_amount | FLOAT | Tá»ng sá» tiá»n khuyáº¿n mÃ£i cá»§a giao dá»chtá»ng sá» tiá»n khuyáº¿n mÃ£i cá»§a id |  |
| voucher_or_not | STRING | PhÃ¢n loáº¡i giao dá»ch cÃ³ sá»­ dá»¥ng voucher hay khÃ´ng. |  |
| cate | STRING | NhÃ  máº¡ng cá»§a ngÆ°á»i ÄÆ°á»£c náº¡pNhÃ  máº¡ng cá»§a ngÆ°á»i ÄÆ°á»£c náº¡p |  |
| service | STRING | Dá»ch vá»¥ sá»­ dá»¥ng: TOPUP: topup, MATHE: mÃ£ tháº», COMBO: combo data, SIM: dá»ch vá»¥ mua SIM... |  |
| subcategory | STRING | PhÃ¢n loáº¡i phá»¥ cá»§a dá»ch vá»¥ |  |
| group_service | STRING | NhÃ³m dá»ch vá»¥ |  |
| merchant | STRING | TÃªn dá»ch vá»¥ vÃ  nhÃ  máº¡ng cá»§a giao dá»ch, ÄÆ°á»£c viáº¿t dÆ°á»i dáº¡ng in hoa khÃ´ng dáº... |  |
| region | STRING | Khu vá»±c cá»§a merchantKhu vá»±c cá»§a merchant |  |
| supplier | STRING | NhÃ  cung cáº¥p cá»§a giao dá»chNhÃ  cung cáº¥p cá»§a id |  |
| service_code | STRING | MÃ£ dá»ch vá»¥ |  |
| bonus | FLOAT | Sá» tiá»n thÆ°á»ng thÃªm cho ngÆ°á»i dÃ¹ngsá» tiá»n bonus cho user |  |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹nggiá»i tÃ­nh cá»§a user |  |
| group_age | STRING | NhÃ³m Äá» tuá»i cá»§a ngÆ°á»i dÃ¹nggroup Äá» tuá»i cá»§a user |  |
| age | NUMERIC | Äá» tuá»i cá»§a ngÆ°á»i dÃ¹ngÄá» tuá»i cá»§a user |  |
| statusid | INTEGER | Tráº¡ng thÃ¡i giao dá»ch, 6 = giao dá»ch tháº¥t báº¡i, 2 = giao dá»ch thÃ nh cÃ´ngtráº¡ng thÃ¡i g... |  |
| group_user | STRING | NhÃ³m ngÆ°á»i dÃ¹ng |  |
| province | STRING | Tá»nh thÃ nh nÆ¡i ngÆ°á»i dÃ¹ng Äang á»Tá»nh thÃ nh user Äang á» |  |
| province_group | STRING | NhÃ³m tá»nh thÃ nh nÆ¡i ngÆ°á»i dÃ¹ng Äang á»group tá»nh tÃ­nh user Äang á» |  |
| Revenue | FLOAT | Doanh thu cá»§a giao dá»chDoanh thu cá»§a id |  |
| quantity | FLOAT | Sá» lÆ°á»£ng sáº£n pháº©m ngÆ°á»i dÃ¹ng muaSá» lÆ°á»£ng sáº£n pháº©m user mua |  |
| menh_gia | FLOAT | Má»nh giÃ¡ cá»§a sáº£n pháº©mmá»nh giÃ¡ cá»§a sáº£n pháº©m |  |
| goi_cuoc | STRING | MÃ£ gÃ³i cÆ°á»c cá»§a sáº£n pháº©mmÃ£ gÃ³i cÆ°á»c cá»§a sáº£n pháº©m |  |
| dung_luong | STRING | Dung lÆ°á»£ng data cá»§a gÃ³i cÆ°á»cdung lÆ°á»£ng data cá»§a gÃ³i cÆ°á»c |  |
| expire | STRING | Thá»i gian háº¿t háº¡n cá»§a gÃ³i cÆ°á»cThá»i gian háº¿t háº¡n cá»§a gÃ³i cÆ°á»c |  |
| month_active | DATE | ThÃ¡ng ngÆ°á»i dÃ¹ng kÃ­ch hoáº¡tThÃ¡ng user active |  |
| user_segment | STRING | PhÃ¢n khÃºc ngÆ°á»i dÃ¹ng trong thÃ¡ng active: retain_user: user ÄÃ£ active á» thÃ¡ng trÆ°á»c Ä... |  |
| churn_duration | INTEGER | Sá» thÃ¡ng ngÆ°á»i dÃ¹ng rá»i bá» dá»ch vá»¥sá» thÃ¡ng user rá»i bá» dá»ch vá»¥ |  |
| money_source | STRING | Nguá»n tiá»n ngÆ°á»i dÃ¹ng sá»­ dá»¥ng cho giao dá»chNguá»n tiá»n user sá»­ dá»¥ng cho giao dá... |  |
| typeid | STRING | Tháº» quÃ /mÃ£ nháº­p sá»­ dá»¥ng cho khuyáº¿n mÃ£iTháº» quÃ /mÃ£ nháº­p sá»­ dá»¥ng cho promotion |  |
| voucher_cost | FLOAT | Chi phÃ­ voucher |  |
| telco_source | STRING | Äiá»m xuáº¥t phÃ¡t tá»« miniapp cá»§a giao dá»chEntry point tá»« miniapp cá»§a giao dá»ch |  |
| serviceid | STRING | MÃ£ dá»ch vá»¥service id  |  |
| telco_source_raw | STRING | Dá»¯ liá»u thÃ´ Äiá»m xuáº¥t phÃ¡t tá»« telco |  |
| suffix | STRING | Äiá»m tiáº¿p nháº­n ná»i bá» cá»§a giao dá»ch (vÃ­ dá»¥: button screen,. |  |
| user_raw | STRING | Dá»¯ liá»u thÃ´ ngÆ°á»i dÃ¹ng |  |
| ttt_user_segment | STRING | PhÃ¢n Äoáº¡n ngÆ°á»i dÃ¹ng theo dá»ch vá»¥ tÃºi tháº§n tÃ i |  |
| voucher_type_by_gmv | STRING | Loáº¡i voucher theo GMV |  |
| voucher_type_by_trans | STRING | Loáº¡i voucher theo giao dá»ch |  |
| previous_voucher_type_by_trans | STRING | Loáº¡i voucher trÆ°á»c ÄÃ³ theo giao dá»ch |  |
| previous_voucher_type_by_gmv | STRING | Loáº¡i voucher trÆ°á»c ÄÃ³ theo GMV |  |
| acquire_user_channel | STRING | KÃªnh thu hÃºt ngÆ°á»i dÃ¹ng |  |
| promotion_cost_type | STRING | Loáº¡i chi phÃ­ khuyáº¿n mÃ£i |  |
| partner | STRING | Äá»i tÃ¡c |  |
| partner_type | STRING | Loáº¡i Äá»i tÃ¡c |  |
| partner_momo_user | STRING | NgÆ°á»i dÃ¹ng MoMo cá»§a Äá»i tÃ¡c |  |

### project-5400504384186300846.BU_UTILITIES_TELCO.DATA_SEGMENT_USER

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month_active | DATE | ThÃ¡ng ngÆ°á»i dÃ¹ng Äang hoáº¡t Äá»ng |  |
| reference | STRING | Tham chiáº¿u sá» liá»u ngÆ°á»i dÃ¹ng |  |
| month_lead | DATE | ThÃ¡ng ngÆ°á»i dÃ¹ng tiá»m nÄng |  |
| retain | DATE | NgÃ y ngÆ°á»i dÃ¹ng ÄÆ°á»£c giá»¯ láº¡i |  |
| month_churn | DATE | ThÃ¡ng ngÆ°á»i dÃ¹ng rá»i bá» |  |
| user_segment | STRING | PhÃ¢n Äoáº¡n ngÆ°á»i dÃ¹ng |  |
| churn_user | STRING | ThÃ´ng tin ngÆ°á»i dÃ¹ng ÄÃ£ rá»i bá» |  |
| churn_duration | INTEGER | Thá»i gian rá»i bá» cá»§a ngÆ°á»i dÃ¹ng (tÃ­nh báº±ng ngÃ y) |  |
| FIRST_DATE | DATE | NgÃ y Äáº§u tiÃªn cá»§a hoáº¡t Äá»ng ngÆ°á»i dÃ¹ng |  |
| LAST_DATE | DATE | NgÃ y gáº§n nháº¥t cÃ³ hoáº¡t Äá»ng cá»§a ngÆ°á»i dÃ¹ng |  |
| CHURN_DURATION_DAY | INTEGER | Thá»i gian rá»i bá» cá»§a ngÆ°á»i dÃ¹ng (tÃ­nh báº±ng ngÃ y) |  |
| TRANS | INTEGER | Sá» lÆ°á»£ng giao dá»ch cá»§a ngÆ°á»i dÃ¹ng |  |
| PREVIOUS_TRANS | INTEGER | Sá» lÆ°á»£ng giao dá»ch trÆ°á»c ÄÃ³ cá»§a ngÆ°á»i dÃ¹ng |  |
| GMV | FLOAT | GiÃ¡ trá» giao dá»ch tá»ng cá»§a ngÆ°á»i dÃ¹ng |  |
| PREVIOUS_GMV | FLOAT | GiÃ¡ trá» giao dá»ch tá»ng trÆ°á»c ÄÃ³ cá»§a ngÆ°á»i dÃ¹ng |  |
| PROMOTION_COST | FLOAT | Chi phÃ­ khuyáº¿n máº¡i cho ngÆ°á»i dÃ¹ng |  |
| PREVIOUS_VC_AMOUNT | FLOAT | Sá» lÆ°á»£ng voucher trÆ°á»c ÄÃ³ cá»§a ngÆ°á»i dÃ¹ng |  |
| VOUCHER_TYPE_BY_GMV | STRING | Loáº¡i voucher dá»±a trÃªn giÃ¡ trá» giao dá»ch tá»ng |  |
| PREVIOUS_VOUCHER_TYPE_BY_GMV | STRING | Loáº¡i voucher trÆ°á»c ÄÃ³ dá»±a trÃªn giÃ¡ trá» giao dá»ch tá»ng |  |
| VOUCHER_TYPE_BY_TRANS | STRING | Loáº¡i voucher dá»±a trÃªn sá» lÆ°á»£ng giao dá»ch |  |
| PREVIOUS_VOUCHER_TYPE_BY_TRANS | STRING | Loáº¡i voucher trÆ°á»c ÄÃ³ dá»±a trÃªn sá» lÆ°á»£ng giao dá»ch |  |
| GMV_TYPE | STRING | Loáº¡i giÃ¡ trá» giao dá»ch tá»ng |  |
| PREVIOUS_GMV_TYPE | STRING | Loáº¡i giÃ¡ trá» giao dá»ch tá»ng trÆ°á»c ÄÃ³ |  |
| first_tid | INTEGER | ID giao dá»ch Äáº§u tiÃªn cá»§a ngÆ°á»i dÃ¹ng |  |

## Domain Knowledge (from Mimir)

- giao dịch thành công: statusid = 2
- giao dịch thành công: statusid = 2
- TTT: Túi Thần Tài
- MAU: phải thêm điều kiện statusid = 2
- giftid: typeid 

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
