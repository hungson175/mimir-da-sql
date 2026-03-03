# Domain: BU Payment: Airtime

## Identity
- **Domain ID:** `3165cb58-8f0a-4c7d-96e6-ae0b189ff572`
- **Description:** records all transaction (exclude blacklist user), demographic, user segment of Airtime Service since 2021
- **Tables:** 3
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_SEGMENT_USER

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| month_active | DATE | ThÃ¡ng mÃ  ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng. |  |
| reference | STRING | Tham chiáº¿u hoáº·c mÃ£ Äá»nh danh liÃªn quan Äáº¿n thÃ´ng tin ngÆ°á»i dÃ¹ng. |  |
| month_lead | DATE | ThÃ¡ng dáº«n Äáº§u cá»§a ngÆ°á»i dÃ¹ng trong hoáº¡t Äá»ng viá»n thÃ´ng tiá»n Ã­ch. |  |
| retain | DATE | Thá»i gian giá»¯ chÃ¢n ngÆ°á»i dÃ¹ng trÆ°á»c khi rá»i Äi. |  |
| month_churn | DATE | ThÃ¡ng mÃ  ngÆ°á»i dÃ¹ng kháº£ nÄng rá»i Äi (churn). |  |
| user_segment | STRING | PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng theo nhÃ³m giÃ¡ trá» hoáº·c hÃ nh vi. |  |
| churn_user | STRING | ThÃ´ng tin vá» ngÆ°á»i dÃ¹ng cÃ³ kháº£ nÄng rá»i Äi. |  |
| churn_duration | INTEGER | Thá»i gian dá»± kiáº¿n trÆ°á»c khi ngÆ°á»i dÃ¹ng rá»i Äi, tÃ­nh báº±ng sá» ngÃ y. |  |
| FIRST_DATE | DATE | NgÃ y Äáº§u tiÃªn ghi nháº­n dá»¯ liá»u hoáº·c giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. |  |
| LAST_DATE | DATE | NgÃ y cuá»i cÃ¹ng ghi nháº­n dá»¯ liá»u hoáº·c giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. |  |
| CHURN_DURATION_DAY | INTEGER | Sá» ngÃ y dá»± kiáº¿n trÆ°á»c khi ngÆ°á»i dÃ¹ng rá»i Äi. |  |
| TRANS | INTEGER | Sá» lÆ°á»£ng giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. |  |
| PREVIOUS_TRANS | INTEGER | Sá» lÆ°á»£ng giao dá»ch trong giai Äoáº¡n trÆ°á»c cá»§a ngÆ°á»i dÃ¹ng. |  |
| GMV | FLOAT | Tá»ng giÃ¡ trá» giao hÃ ng (GMV) tá»« cÃ¡c giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. |  |
| PREVIOUS_GMV | FLOAT | Tá»ng giÃ¡ trá» giao hÃ ng (GMV) tá»« cÃ¡c giao dá»ch trÆ°á»c cá»§a ngÆ°á»i dÃ¹ng. |  |
| PROMOTION_COST | FLOAT | Chi phÃ­ khuyáº¿n mÃ£i liÃªn quan Äáº¿n ngÆ°á»i dÃ¹ng. |  |
| PREVIOUS_VC_AMOUNT | FLOAT | Sá» lÆ°á»£ng voucher ÄÃ£ sá»­ dá»¥ng trong giai Äoáº¡n trÆ°á»c. |  |
| VOUCHER_TYPE_BY_GMV | STRING | Loáº¡i voucher phÃ¢n loáº¡i dá»±a trÃªn tá»ng giÃ¡ trá» giao hÃ ng (GMV). |  |
| PREVIOUS_VOUCHER_TYPE_BY_GMV | STRING | Loáº¡i voucher trÆ°á»c phÃ¢n loáº¡i dá»±a trÃªn tá»ng giÃ¡ trá» giao hÃ ng (GMV). |  |
| VOUCHER_TYPE_BY_TRANS | STRING | Loáº¡i voucher phÃ¢n loáº¡i dá»±a trÃªn sá» lÆ°á»£ng giao dá»ch. |  |
| PREVIOUS_VOUCHER_TYPE_BY_TRANS | STRING | Loáº¡i voucher trÆ°á»c phÃ¢n loáº¡i dá»±a trÃªn sá» lÆ°á»£ng giao dá»ch. |  |
| GMV_TYPE | STRING | Loáº¡i tá»ng giÃ¡ trá» giao hÃ ng (GMV) ÄÆ°á»£c phÃ¢n loáº¡i. |  |
| PREVIOUS_GMV_TYPE | STRING | Loáº¡i tá»ng giÃ¡ trá» giao hÃ ng (GMV) trÆ°á»c ÄÆ°á»£c phÃ¢n loáº¡i. |  |
| partner_type | STRING | Loáº¡i Äá»i tÃ¡c liÃªn quan Äáº¿n giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. |  |
| num_service | INTEGER | Sá» lÆ°á»£ng dá»ch vá»¥ mÃ  ngÆ°á»i dÃ¹ng ÄÃ£ sá»­ dá»¥ng. |  |
| first_tid | INTEGER | MÃ£ Äá»nh danh Äáº§u tiÃªn cá»§a giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. |  |

### project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_DETAILS

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| id | INTEGER | ID giao dá»ch.Transaction id | 22857325793, 22873421530, 22873909899 |
| date | DATE | NgÃ y cá»§a ID giao dá»ch.Date of Transaction id | 2021-12-31, 2024-10-10, 2025-09-02 |
| datetime | DATETIME | Thá»i gian cá»§a ID giao dá»ch.datetime of Transaction id | 2023-06-16 10:00:57, 2023-06-16 10:00:56, 2023-06-16 10:01:15 |
| amount | FLOAT | Sá» tiá»n cá»§a ID giao dá»ch.amount of Transaction id | 10000, 20000, 50000 |
| mm_amount | FLOAT | Sá» tiá»n Momo trong ID giao dá»ch (náº¿u ngÆ°á»i dÃ¹ng sá»­ dá»¥ng vÃ­ Momo Äá» thanh toÃ¡n). | 10000, 20000, 50000 |
| cate | STRING | Máº¡ng di Äá»ng cá»§a ID giao dá»ch.mobile network of transaction id | Viettel, Mobifone, Vinaphone, Vietnamobile, Reddi |
| service | STRING | Dá»ch vá»¥ cá»§a ID giao dá»ch (TOPUP: dá»ch vá»¥ Topup, MATHE: dá»ch vá»¥ mua mÃ£ tháº», OTHER:... | TOPUP, MATHE, OTHERS |
| subcategory | STRING | PhÃ¢n loáº¡i phá»¥ cá»§a dá»ch vá»¥ giao dá»ch. | WHYPAY, Mobifone, OCTA/LOGICH, Vinaphone, ZOTA/FIVI |
| group_service | STRING | NhÃ³m dá»ch vá»¥ cá»§a giao dá»ch. | Topup&Mathe |
| merchant | STRING | TÃªn nhÃ  cung cáº¥p cá»§a ID giao dá»ch.merchant name of transaction id | TOPUP VIETTEL, TOPUP MOBIFONE, TOPUP VINAPHONE, MA THE VIETTEL, TOPUP VIETNAMOBI... |
| region | STRING | Khu vá»±c cá»§a nhÃ  cung cáº¥p.region of merchant | Mien Bac |
| supplier | STRING | NhÃ  cung cáº¥p cá»§a ID giao dá»ch.supplier of transaction id | WHYPAY, Mobifone, OCTA/LOGICH, Vinaphone, ZOTA/FIVI |
| service_code | STRING | MÃ£ dá»ch vá»¥ cá»§a ID giao dá»ch.service code of transaction id | vms2.airtime, vttiwhypay_vt.airtime, vttiocta_vt.airtime |
| bonus | FLOAT | ThÆ°á»ng cho ngÆ°á»i dÃ¹ng khi thá»±c hiá»n ID giao dá»ch. | 0, 1500, 750 |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i thanh toÃ¡n.gender of user_payment | male, female, MALE, FEMALE, UNKNOWN |
| group_age | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i thanh toÃ¡n.group age of user_payment | [2]. 18 - 22 y/o, 23_to_27, [3]. 23 - 26 y/o, 18_to_22, 28_to_32 |
| age | NUMERIC | Tuá»i cá»§a ngÆ°á»i thanh toÃ¡n.age of user_payment | 22, 23, 21 |
| statusid | INTEGER | Tráº¡ng thÃ¡i cá»§a ID giao dá»ch, 6 = tháº¥t báº¡i, 2 = thÃ nh cÃ´ng. | 2, 6 |
| province | STRING | Tá»nh cá»§a ngÆ°á»i thanh toÃ¡n.province of user_payment | Hồ Chí Minh, Hà Nội, Bình Dương |
| province_group | STRING | NhÃ³m tá»nh cá»§a ngÆ°á»i thanh toÃ¡n.province group of user_payment | Hồ Chí Minh, Others, KCN Miền Nam, Hà Nội, KCN Miền Bắc |
| user_payment | STRING | NgÆ°á»i dÃ¹ng thá»±c hiá»n ID giao dá»ch (dáº¡ng mÃ£ hÃ³a). | 53401441, 61629589, 47499914 |
| money_source | STRING | Nguá»n tiá»n cá»§a ID giao dá»ch khi thanh toÃ¡n. | momo, bank_link, pay_later, TTT, napas |
| serviceid | STRING | ID dá»ch vá»¥ cá»§a ID giao dá»ch.service id of transaction id | topup_Viettel, topup_Mobifone, topup_Vinaphone |
| partner | STRING | Sá» Äiá»n thoáº¡i ÄÆ°á»£c náº¡p cá»§a ID giao dá»ch (náº¿u dá»ch vá»¥ = MATHE, thÃ¬ khÃ´ng cÃ³... | no data, mathe, 11065161 |
| telcosource | STRING | Äiá»m Äáº§u vÃ o cá»§a ID giao dá»ch.entry point of transaction id | tabbar_home, transaction_result, vouchers_folder_service, vouchers_folder, app_a... |
| revenue | FLOAT | Doanh thu cá»§a ID giao dá»ch.revenue of transaction id | 310, 950, 170 |
| month_active | DATE | ThÃ¡ng hoáº¡t Äá»ng cá»§a ID giao dá»ch.month of transaction id | 2025-01-01, 2025-11-01, 2024-09-01 |
| retain | DATE | GiÃ¡ trá» giá»¯ láº¡i. | 2024-12-01, 2024-11-01, 2024-09-01 |
| user_segment | STRING | PhÃ¢n khÃºc ngÆ°á»i dÃ¹ng cá»§a ngÆ°á»i thanh toÃ¡n trong thÃ¡ng. | retain_user, recover_user, new_user |
| churn_duration | INTEGER | Thá»i gian khÃ¡ch hÃ ng khÃ´ng hoáº¡t Äá»ng = thÃ¡ng hoáº¡t Äá»ng - thÃ¡ng cuá»i cÃ¹ng khÃ¡ch ... | 1, 2, 3 |
| quantity | FLOAT | Sá» lÆ°á»£ng sáº£n pháº©m khi ngÆ°á»i dÃ¹ng thá»±c hiá»n giao dá»ch. | 1, 2, 5 |
| menh_gia | FLOAT | Má»nh giÃ¡ cá»§a sáº£n pháº©m.má»nh giÃ¡ cá»§a sáº£n pháº©m | 10000, 20000, 50000 |
| goi_cuoc | STRING | ID sáº£n pháº©m cá»§a ID giao dá»ch.product id of transaction id | TUVTT10, TUMBF10, TUVTT20 |
| dung_luong | STRING | Dung lÆ°á»£ng sáº£n pháº©m. |  |
| expire | STRING | NgÃ y háº¿t háº¡n sáº£n pháº©m. |  |
| partner_type | STRING | Loáº¡i Äá»i tÃ¡c trong thÃ¡ng cá»§a ngÆ°á»i thanh toÃ¡n. | owner_partner, only_owner, only_partner, only_mathe, mathe_owner_partner |
| typeid | STRING | ID quÃ  hoáº·c mÃ£ nháº­p (vá»i chÆ°Æ¡ng trÃ¬nh giáº£m giÃ¡ trá»±c tiáº¿p) cá»§a ID giao dá»ch, ná... | crm1908_mathe_10_napdt, crm1908_mathe_10_napdt_2312, crm1908_mathe_5_napdt |
| vc_amount | FLOAT | Sá» lÆ°á»£ng voucher.voucher amount  | 0, 10000, 5000 |
| voucher_or_not | STRING | Loáº¡i khuyáº¿n mÃ£i cá»§a ID giao dá»ch. | Non voucher, Voucher |
| promotion_type | STRING | Loáº¡i khuyáº¿n mÃ£i. | organic, voucher, cashback, entercode |
| partner_momo_user | STRING | Loáº¡i ngÆ°á»i dÃ¹ng ÄÆ°á»£c náº¡p. | owner, momo user, mathe, non momo user, no data |
| voucher_type_by_gmv | STRING | HÃ nh vi sá»­ dá»¥ng khuyáº¿n mÃ£i GMV cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ng. | ONLY ORGANIC, ONLY VOUCHER, GMV MORE ORGANIC, GMV MORE VOUCHER |
| previous_voucher_type_by_gmv | STRING | HÃ nh vi sá»­ dá»¥ng khuyáº¿n mÃ£i GMV cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ng trÆ°á»c khi sá»­ dá»¥ng dá... | ONLY ORGANIC, ONLY VOUCHER, GMV MORE ORGANIC, GMV MORE VOUCHER |
| voucher_type_by_trans | STRING | HÃ nh vi sá»­ dá»¥ng khuyáº¿n mÃ£i trong cÃ¡c giao dá»ch cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ng. | ONLY ORGANIC, ONLY VOUCHER, TRANS MORE ORGANIC, TRANS MORE VOUCHER |
| previous_voucher_type_by_trans | STRING | HÃ nh vi sá»­ dá»¥ng khuyáº¿n mÃ£i trong cÃ¡c giao dá»ch cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ng trÆ°á»c... | ONLY ORGANIC, ONLY VOUCHER, GMV MORE ORGANIC, GMV MORE VOUCHER, TRANS MORE ORGAN... |
| prev_aov | FLOAT | GiÃ¡ trá» ÄÆ¡n hÃ ng trung bÃ¬nh cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ng trÆ°á»c khi hoáº¡t Äá»ng. | 10000, 20000, 100000 |
| telco_source_raw | STRING | Nguá»n gá»c thÃ´ cá»§a telco. | tabbar_home_revamp_payX, tabbar_home_payX, tabbar_home |
| suffix | STRING | NÆ¡i chi tiáº¿t cá»§a nguá»n telco.details place of telco_source | button_vts, button_ttt, cross_sale_both, cross_sale_AI, cross_sale_config |
| user_raw | STRING | Dá»¯ liá»u thÃ´ cá»§a ngÆ°á»i dÃ¹ng. | 53401441, 47499914, 21654350 |
| promotion_cost_type | STRING | Loáº¡i chi phÃ­ khuyáº¿n mÃ£i cá»§a giao dá»ch. | organic, other teams, BU |
| rfm_type | STRING | Xáº¿p háº¡ng lÃ²ng trung thÃ nh cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ng.loyalty rank of user in month | Champions, Potential Loyalist, Loyal Customers, Recent Customers, About To Sleep |
| last_3_month_rfm_type | STRING | Xáº¿p háº¡ng lÃ²ng trung thÃ nh cá»§a ngÆ°á»i dÃ¹ng trong 3 thÃ¡ng trÆ°á»c. | Champions, Potential Loyalist, Loyal Customers, Recent Customers, About To Sleep |
| acquire_user_channel | STRING | Loáº¡i chi phÃ­ khuyáº¿n mÃ£i cá»§a giao dá»ch Äáº§u tiÃªn cá»§a ngÆ°á»i dÃ¹ng. | organic, other teams, BU |
| movement_status | STRING | Tráº¡ng thÃ¡i trung thÃ nh cá»§a ngÆ°á»i dÃ¹ng trong 3 thÃ¡ng trÆ°á»c. | maintain customer type, educate success, on educate process, educate fail |
| ttt_segment | STRING | PhÃ¢n khÃºc TTT. | churn_TTT, non_TTT, 2.Retain, 3.Reactive, 1.New |

### project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_MAU_BY_1ST_TRAN_ALL

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| USER_PAYMENT | STRING | PhÆ°Æ¡ng thá»©c thanh toÃ¡n cá»§a ngÆ°á»i dÃ¹ng. | 40051189, 63887607, 63118040 |
| USER_SEGMENT | STRING | PhÃ¢n khÃºc ngÆ°á»i dÃ¹ng. | retain_user, recover_user, new_user |
| VOUCHER_OR_NOT | STRING | Tráº¡ng thÃ¡i sá»­ dá»¥ng voucher hay khÃ´ng. | Non voucher, Voucher |
| DATE | DATE | NgÃ y giao dá»ch Äáº§u tiÃªn trong thÃ¡ng. | 2025-09-02, 2025-12-01, 2024-07-01 |
| DATETIME | DATETIME | NgÃ y vÃ  giá» cá»¥ thá» cá»§a giao dá»ch. | 2025-06-02 10:30:42, 2025-09-09 15:37:06, 2022-03-13 16:34:46 |
| MONTH_ACTIVE | DATE | ThÃ¡ng hoáº¡t Äá»ng cá»§a ngÆ°á»i dÃ¹ng. | 2025-11-01, 2024-09-01, 2025-10-01 |
| CATE | STRING | Danh má»¥c dá»ch vá»¥ ÄÆ°á»£c sá»­ dá»¥ng. | Viettel, Mobifone, Vinaphone, Vietnamobile, Reddi |
| SERVICE | STRING | TÃªn dá»ch vá»¥ ÄÆ°á»£c sá»­ dá»¥ng. | TOPUP, MATHE, OTHERS |
| AMOUNT | FLOAT | Sá» tiá»n giao dá»ch airtime. | 10000, 100000, 50000 |
| ID | INTEGER | ID Äá»nh danh cho giao dá»ch. | 69045401858, 69024132187, 69005214187 |
| REVENUE | FLOAT | Doanh thu tá»« giao dá»ch airtime. | 170, 180, 310 |
| VC_AMOUNT | FLOAT | GiÃ¡ trá» voucher ÄÆ°á»£c sá»­ dá»¥ng trong giao dá»ch. | 10000, 5000, 7000 |
| typeid | STRING | Loáº¡i giao dá»ch ÄÆ°á»£c thá»±c hiá»n. | crm1908_mathe_10_napdt_2312, crm1908_mathe_10_napdt, crm1908_mathe_5_napdt_vcn_e... |
| MENH_GIA | FLOAT | Má»nh giÃ¡ giao dá»ch airtime. | 10000, 100000, 50000 |
| CHURN_DURATION | INTEGER | Thá»i gian ngÆ°á»i dÃ¹ng ngá»«ng hoáº¡t Äá»ng trÆ°á»c ÄÃ³. | 1, 2, 3 |
| PROVINCE_GROUP | STRING | NhÃ³m tá»nh thÃ nh cá»§a ngÆ°á»i dÃ¹ng. | Hồ Chí Minh, Others, KCN Miền Nam, Hà Nội, KCN Miền Bắc |
| GROUP_AGE | STRING | NhÃ³m Äá» tuá»i cá»§a ngÆ°á»i dÃ¹ng. | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [4]. 27 - 30 y/o, [5]. 31 - 35 y/o, [6]. 36 ... |
| GENDER | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ng. | male, female, unknown |
| PARTNER_TYPE | STRING | Loáº¡i Äá»i tÃ¡c cung cáº¥p dá»ch vá»¥. | only_owner, only_partner, owner_partner, only_mathe, mathe_owner |
| promotion_cost_type | STRING | Loáº¡i chi phÃ­ khuyáº¿n mÃ£i Ã¡p dá»¥ng cho giao dá»ch. | organic, other teams, BU |
| money_source | STRING | Nguá»n tiá»n sá»­ dá»¥ng trong giao dá»ch. | momo, bank_link, TTT, pay_later, napas |
| RANK_USER | INTEGER | Xáº¿p háº¡ng ngÆ°á»i dÃ¹ng dá»±a trÃªn má»©c Äá» hoáº¡t Äá»ng. | 1 |

## Domain Knowledge (from Mimir)

- cùng kỳ: extract(day from date) of month_active = extract(day from date) of last month
- Doanh thu cần được chia cho 1.1 khi tính toán
- Khi xử lý dữ liệu người dùng duy nhất hàng ngày của voucher team khác, sử dụng bảng `BU_UTILITIES_TELCO.AIRTIME_MAU_BY_1ST_TRAN_ALL` thay vì `BU_UTILITIES_TELCO.AIRTIME_DETAILS`
- user: user_payment or reference
- giftid: typeid
- Truy vấn MAU nạp điện thoại topup tháng 9 không cần lọc theo trạng thái giao dịch
- Unique user sử dụng bảng project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_MAU_BY_1ST_TRAN_ALL
- MAU: phải thêm điều kiện statusid = 2
- Để lấy số lượng transaction, sử dụng count(distinct id)
- Dữ liệu trong bảng AIRTIME_SEGMENT_USER tự động loại trừ các người dùng trong danh sách đen (blacklist)
- Khi user hỏi nhà mạng, hỏi user lấy nhà mạng chính hay lấy nhà mạng ảo (mnvo)
- Bảng AIRTIME_MAU_BY_1ST_TRAN_ALL không chứa thông tin về trạng thái giao dịch
- DAU sử dụng bảng project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_DETAILS
- giao dịch thành công: statusid = 2
- TTT: Túi Thần Tài
- Khi xử lý dữ liệu nhóm tuổi, sử dụng giá trị group_age = '[2]. 18 - 22 y/o' hoặc group_age = '18_to_22'
- Khi xử lý vấn đề liên quan tới MAU, không cần lọc theo lower(cate)
- Logic unique user: số user ngày sau không bao gồm user đã active ngày trước đó
- Tỷ lệ giữ chân hàng tháng (retention rate tháng T) = số lượng retain user tháng T / MAU tháng T-1
- MAU có thể được tính từ ngày 1/11/2025 đến 5/11/2025 bằng cách sử dụng cột date thay vì MONTH_ACTIVE
- Mặc định các giao dịch thành công có statusid = 2. Chỉ khi nào được hỏi về giao dịch thất bại thì mới đổi thành statusid = 6.
- Túi thần tài: money_source = TTT
- Để lấy số lượng user active, sử dụng count(distinct user_payment)
- Nếu user muốn lấy nhà mạng ảo thì dùng câu query với case statement cho các serviceid tương ứng
case
  when serviceid in ('EPAY_VIETTEL', 'topup_Viettel') then 'Viettel'
  when serviceid in ('topup_Vinaphone', 'EPAY_VINAFONE') then 'Vinaphone'
  when serviceid = 'topup_Itel' then 'iTel'
  when serviceid in ('EPAY_VIETNAMOBILE', 'topup_Vietnamobile') then 'Vietnamobile'
  when serviceid = 'topup_Local' then 'Local'
  when serviceid in ('buycard_Reddi', 'topup_Reddi') then 'Wintel'
  when serviceid = 'topup_Saymee' then 'Saymee'
  when serviceid in ('topup_Mobifone', 'EPAY_MOBIFONE') then 'Mobifone'
  else 'OUTAPP PAYMENT'
end as mvno
- Nếu user muốn lấy nhà mạng chính thì dùng cột cate
- Khi truy vấn số lượng người dùng theo từng nhóm, cần sử dụng count(distinct user_payment)
- Số user sử dụng voucher: dùng cột voucher_or_not = 'Voucher'
- Số user theo loại promotion: cột promotion_cost_type, trong đó: BU = voucher từ budget của Airtime, organic: user không dùng voucher, other teams: voucher từ budget của team khác

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
