# Domain: BU Growth Platform: Expense Management

## Identity
- **Domain ID:** `af241589-f5be-4b97-8928-fe0823c8dc75`
- **Description:** Phân tích về sản phẩm Quản Lý Chi tiêu bao gồm:
- Các thông tin về người dùng
- Các thông tin về event của sản phẩm
- Các thông tin về các tính năng của sản phẩm
- **Tables:** 7
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT
> Báº£ng chá»©a thÃ´ng tin vá» lÆ°á»£t truy cáº­p cá»§a ngÆ°á»i dÃ¹ng vÃ o dá»ch vá»¥ quáº£n lÃ½ chi tiÃªu (QLCT) trÃªn MoMo. 
ÄÃ¢y lÃ  báº£ng giÃºp theo dÃµi vÃ  phÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng qua cÃ¡c chá» sá»: 
- Sá» lÆ°á»£t truy cáº­p vÃ  thá»i gian cá»¥ thá» cá»§a tá»«ng dá»ch vá»¥...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| AGENT_ID | STRING | ID cá»§a UserID cá»§a User | 38502644, 35831203, 25103427 |
| MONTH | DATE | ThÃ¡ng cÃ³ visit TFBVThÃ¡ng cÃ³ visit TFBV | 2025-12-01, 2025-09-01, 2025-10-01 |
| DATE_WEEK | DATE | Tuáº§n cÃ³ visit TFBVTuáº§n cÃ³ visit TFBV | 2025-08-31, 2025-09-28, 2025-12-28 |
| DAY | INTEGER | Thá»© tá»± ngÃ y trong thÃ¡ng cÃ³ visit TFBVThá»© tá»± ngÃ y trong thÃ¡ng cÃ³ visit TFBV | 3, 1, 5 |
| PRODUCT | STRING | Sáº£n pháº©m user dÃ¹ng. Bao gá»m: QLCT | MONISáº£n pháº©m user dÃ¹ng. Bao gá»m: QLCT | MONI | QLCT, MONI |
| ACTION | STRING | HÃ nh Äá»ng cá»§a user. Bao gá»m: VISIT | CHATHÃ nh ÄÃ´ng cá»§a user. Bao gá»m: VISIT | CHAT | VISIT, CHAT |
| FIRST_MONTH_TFBV | DATE | ThÃ¡ng Äáº§u tiÃªn user visit TFBVThÃ¡ng Äáº§u tiÃªn user visit TFBV | 2024-09-01, 2024-10-01, 2024-11-01 |
| FIRST_MONTH_QLCT | DATE | ThÃ¡ng Äáº§u tiÃªn user visit QLCTThÃ¡ng Äáº§u tiÃªn user visit QLCT | 2024-09-01, 2024-10-01, 2024-11-01 |
| FIRST_MONTH_MONI | DATE | ThÃ¡ng Äáº§u tiÃªn user visit MONIThÃ¡ng Äáº§u tiÃªn user visit MONI | 2025-10-01, 2025-09-01, 2025-11-01 |
| USER_TYPE_TFBV | STRING | Loáº¡i ngÆ°á»i dÃ¹ng cá»§a TFBV theo thÃ¡ng. | RETAIN, REACTIVE, NEW |
| USER_TYPE_QLCT | STRING | Loáº¡i ngÆ°á»i dÃ¹ng cá»§a QLCT theo thÃ¡ng. | RETAIN, REACTIVE, NEW |
| USER_TYPE_MONI | STRING | Loáº¡i ngÆ°á»i dÃ¹ng cá»§a MONI theo thÃ¡ng. | NEW, RETAIN, REACTIVE |
| MONTHLY_RETAIN_TFBV | STRING | User TFBV cÃ³ quay láº¡i vÃ o thÃ¡ng tiáº¿p theoUser TFBV cÃ³ quay láº¡i vÃ o thÃ¡ng tiáº¿p theo | 47712132, 15910557, 49573892 |
| MONTHLY_RETAIN_QLCT | STRING | User QLCT cÃ³ quay láº¡i vÃ o thÃ¡ng tiáº¿p theoUser QLCT cÃ³ quay láº¡i vÃ o thÃ¡ng tiáº¿p theo | 55215552, 44632204, 46031922 |
| MONTHLY_RETAIN_MONI | STRING | User MONI cÃ³ quay láº¡i vÃ o thÃ¡ng tiáº¿p theoUser MONI cÃ³ quay láº¡i vÃ o thÃ¡ng tiáº¿p theo | 47712132, 35831203, 25103427 |
| WEEKLY_RETAIN_TFBV | STRING | User TFBV cÃ³ quay láº¡i vÃ o tuáº§n tiáº¿p theoUser TFBV cÃ³ quay láº¡i vÃ o tuáº§n tiáº¿p theo | 25103427, 39231774, 47712132 |
| WEEKLY_RETAIN_QLCT | STRING | User QLCT cÃ³ quay láº¡i vÃ o tuáº§n tiáº¿p theoUser QLCT cÃ³ quay láº¡i vÃ o tuáº§n tiáº¿p theo | 67475245, 65459914, 57299017 |
| WEEKLY_RETAIN_MONI | STRING | User MONI cÃ³ quay láº¡i vÃ o tuáº§n tiáº¿p theoUser MONI cÃ³ quay láº¡i vÃ o tuáº§n tiáº¿p theo | 25103427, 38502644, 105023160 |
| MIN_DATE_TFBV | DATE | NgÃ y Äáº§u tiÃªn trong thÃ¡ng user cÃ³ visit TFBVNgÃ y Äáº§u tiÃªn trong thÃ¡ng user cÃ³ visit TF... | 2025-12-01, 2025-09-01, 2025-08-01 |
| MIN_DATE_QLCT | DATE | NgÃ y Äáº§u tiÃªn trong thÃ¡ng user cÃ³ visit QLCTNgÃ y Äáº§u tiÃªn trong thÃ¡ng user cÃ³ visit QL... | 2025-12-01, 2025-09-01, 2025-08-01 |
| MIN_DATE_MONI | DATE | NgÃ y Äáº§u tiÃªn trong thÃ¡ng user cÃ³ visit MONINgÃ y Äáº§u tiÃªn trong thÃ¡ng user cÃ³ visit MO... | 2025-08-01, 2025-12-01, 2025-11-01 |
| NEW_TO_MONTH_TFBV | STRING | User láº§n Äáº§u visit TFBV trong thÃ¡ngUser láº§n Äáº§u visit TFBV trong thÃ¡ng | 78008382, 52169180, 4564847 |
| NEW_TO_MONTH_QLCT | STRING | User láº§n Äáº§u visit QLCT trong thÃ¡ngUser láº§n Äáº§u visit QLCT trong thÃ¡ng | 42799274, 19171743, 48632377 |
| NEW_TO_MONTH_MONI | STRING | User láº§n Äáº§u visit MONI trong thÃ¡ngUser láº§n Äáº§u visit MONI trong thÃ¡ng | 55405613, 57236966, 50753157 |
| DATE | DATE | NgÃ y cÃ³ visit TFBVNgÃ y cÃ³ visit TFBV | 2026-01-05, 2025-10-03, 2024-12-30 |
| count_week | INTEGER | Sá» tuáº§n cÃ³ active TFBV trong thÃ¡ngSá» tuáº§n cÃ³ active TFBV trong thÃ¡ng | 1 |
| GENDER | STRING | Giá»i tÃ­nhGiá»i tÃ­nh | male, female, unknown |
| AGE | INTEGER | Tuá»iTuá»i | 19, 21, 20 |
| AGE_GROUP | STRING | NhÃ³m tuá»iNhÃ³m tuá»i | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [5]. 31 - 35 y/o, [4]. 27 - 30 y/o, [7]. >40... |
| IS_A30_USER | BOOLEAN | User cÃ³ giao dá»ch trong 30 ngÃ y gáº§n ÄÃ¢y: true | falseUser cÃ³ giao dá»ch trong 30 ngÃ y gáº... | true, false |
| CITY | STRING | Tá»nhTá»nh | Hồ Chí Minh, Hà Nội, Bình Dương |
| REGION | STRING | Khu vá»±cKhu vá»±c | Đông Nam Bộ, Đồng bằng sông Hồng, Đồng bằng sông Cửu Long |
| VIETQR_TRANS | INTEGER | Tá»ng sá» giao dá»ch VIETQR trong thÃ¡ngTá»ng sá» giao dá»ch VIETQR trong thÃ¡ng | 1, 2, 3 |
| P2P_TRANS | INTEGER | Tá»ng sá» giao dá»ch P2P trong thÃ¡ngTá»ng sá» giao dá»ch P2P trong thÃ¡ng | 1, 2, 3 |
| PAYMENT_TRANS | INTEGER | Tá»ng sá» giao dá»ch Payment trong thÃ¡ngTá»ng sá» giao dá»ch Payment trong thÃ¡ng | 1, 2, 3 |
| VIETQR_AMOUNTz | FLOAT | Tá»ng giÃ¡ trá» giao dá»ch VIETQR trong thÃ¡ngTá»ng giÃ¡ trá» giao dá»ch VIETQR trong thÃ¡ng | 100000, 50000, 20000 |
| P2P_AMOUNT | FLOAT | Tá»ng giÃ¡ trá» giao dá»ch P2P trong thÃ¡ngTá»ng giÃ¡ trá» giao dá»ch P2P trong thÃ¡ng | 111, 100000, 50000 |
| PAYMENT_AMOUNT | FLOAT | Tá»ng giÃ¡ trá» giao dá»ch Payment trong thÃ¡ngTá»ng giÃ¡ trá» giao dá»ch Payment trong thÃ¡ng | 10000, 20000, 100000 |
| TOTAL_AMOUNT | FLOAT | Tá»ng giÃ¡ trá» giao dá»ch trong thÃ¡ngTá»ng giÃ¡ trá» giao dá»ch trong thÃ¡ng | 10000, 20000, 100000 |
| TOTAL_TRANS | INTEGER | Tá»ng sá» giao dá»ch trong thÃ¡ngTá»ng sá» giao dá»ch trong thÃ¡ng | 1, 2, 3 |
| SEGMENT | STRING | PhÃ¢n nhÃ³m dá»±a theo sá» lÆ°á»£ng giao dá»ch trong thÃ¡ng, bao gá»m VIETQR + P2P + Payment. | 3. HARDCORE, 2. MEDIUM, 1. LIGHT |
| BUDGET | INTEGER | User cÃ³ táº¡o Budget trong thÃ¡ng 0: No 1: YesUser cÃ³ táº¡o Budget trong thÃ¡ng 0: No 1: Yes | 0, 1 |
| INPUT_TRANSACTION | INTEGER | User cÃ³ táº¡o ThÃªm giao dá»ch trong thÃ¡ng 0: No 1: YesUser cÃ³ táº¡o ThÃªm giao dá»ch trong thÃ... | 0, 1 |
| CLASSIFY | INTEGER | User cÃ³ táº¡o PhÃ¢n loáº¡i giao dá»ch trong thÃ¡ng 0: No 1: YesUser cÃ³ táº¡o PhÃ¢n loáº¡i giao dá... | 0, 1 |
| USECASE | INTEGER | Sá» dá»ch vá»¥ User sá»­ dá»¥ng trong thÃ¡ngSá» dá»ch vá»¥ User sá»­ dá»¥ng trong thÃ¡ng | 6, 7, 5 |

### momovn-prod.MBI_DA.QLCT_EVENT_TRACKING_VER2
> Báº£ng nÃ y chá»©a thÃ´ng tin vá» theo dÃµi sá»± kiá»n trong dá»ch vá»¥ quáº£n lÃ½ chi tiÃªu (QLCT). Dá»¯ liá»u trong báº£ng cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng cho cÃ¡c má»¥c ÄÃ­ch sau: 
- Theo dÃµi chi tiáº¿t cÃ¡c sá»± kiá»n mÃ  ngÆ°á»i dÃ¹ng thá»±c hiá»n trong á»©ng dá»¥ng QLCT.
- PhÃ¢n tÃ­ch ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_id | STRING | ID cá»§a sá»± kiá»n trong dá»ch vá»¥ quáº£n lÃ½ chi tiÃªu. | , kcpm-awBZVa-dZ7Yu2eCn, ZWB9EGFNAo9-03XTVk7xs |
| user_id | STRING | ID ngÆ°á»i dÃ¹ng tham gia vÃ o sá»± kiá»n. | 5092751, 45712094, 21896549 |
| date | DATE | NgÃ y diá»n ra sá»± kiá»n. | 2025-12-31, 2025-12-30, 2026-01-01 |
| week | DATE | Tuáº§n diá»n ra sá»± kiá»n. | 2025-12-28, 2026-01-04, 2025-11-30 |
| month | DATE | ThÃ¡ng diá»n ra sá»± kiá»n. | 2025-12-01, 2025-11-01, 2025-09-01 |
| datetime | DATETIME | Thá»i gian cá»¥ thá» diá»n ra sá»± kiá»n. | 2026-01-20 20:53:01.904, 2025-10-11 22:23:22.975, 2025-10-29 22:30:44.300 |
| trigger_id | STRING | ID cá»§a trigger kÃ­ch hoáº¡t sá»± kiá»n. |  |
| action_event | STRING | HÃ nh Äá»ng cá»§a ngÆ°á»i dÃ¹ng trong sá»± kiá»n. | Displayed, Clicked, Inputed, Viewed, Interacted |
| block_event | STRING | Sá»± kiá»n ÄÆ°á»£c tráº£ vá» tá»« block cá»¥ thá». | Home Page, Thêm giao dịch, Chi tiết cate, Sổ giao dịch, Setting |
| description | STRING | MÃ´ táº£ chi tiáº¿t vá» sá»± kiá»n. | Hiển thị function trên thanh menu tại MH Home Expense , User điền thông tin nhập... |
| screen_name | STRING | TÃªn mÃ n hÃ¬nh nÆ¡i diá»n ra sá»± kiá»n. | expense_home, expense_add_transaction, expense_category_detail, expense_notebook... |
| event_name | STRING | TÃªn cá»§a sá»± kiá»n. | service_component_displayed, service_icon_displayed, service_field_inputed |
| component_name | STRING | TÃªn thÃ nh pháº§n tham gia sá»± kiá»n. | , block_home, pie_chart, category_list, transaction_list |
| component_type | STRING | Loáº¡i thÃ nh pháº§n tham gia sá»± kiá»n. | list, block, chart, widget, item |
| button_name | STRING | TÃªn nÃºt báº¥m liÃªn quan Äáº¿n sá»± kiá»n. | , add_trans, date_selected, category, month_switch |
| icon_name | STRING | TÃªn biá»u tÆ°á»£ng liÃªn quan Äáº¿n sá»± kiá»n. | , 3, change_chart |
| block_name | STRING | TÃªn block trong giao diá»n liÃªn quan Äáº¿n sá»± kiá»n. | , total_transaction, monthly_limit, home_promotion, home_finhub |
| status | STRING | Tráº¡ng thÃ¡i cá»§a sá»± kiá»n hoáº·c hÃ nh Äá»ng. | on_report, up_normal, down_abnormal, RCM_SPENDING, RCM_DEFAULT |
| page | STRING | TÃªn trang chá»©a sá»± kiá»n. | overall, pie_chart, wrap_up, top_transactions, review_single |
| popup_name | STRING | TÃªn popup liÃªn quan Äáº¿n sá»± kiá»n. |  |
| checkbox_name | STRING | TÃªn Ã´ checkbox tham gia sá»± kiá»n. | count_expense_to_report |
| action | STRING | HÃ nh Äá»ng cá»¥ thá» trong sá»± kiá»n. | click, header, cta, start_change_cate, click_insight |
| tab_name | STRING | TÃªn tab liÃªn quan Äáº¿n sá»± kiá»n. | , Tổng quan, analysis, Lịch, Tiện ích |
| type | STRING | Loáº¡i cá»§a sá»± kiá»n. | expense, entry_point, income, analysis, Ăn uống |
| content_category | STRING | Danh má»¥c ná»i dung cá»§a sá»± kiá»n. | 3, null, 1 |

### momovn-prod.MBI_DA.LSGD_CTGD_FILTER_LABEL_RAW
> Báº£ng lÆ°u trá»¯ dá»¯ liá»u log sá»± kiá»n lá»c vÃ  gÃ¡n nhÃ£n cá»§a ngÆ°á»i dÃ¹ng trÃªn mÃ n hÃ¬nh lá»ch sá»­ giao dá»ch (LSGD - Lá»ch Sá»­ Giao Dá»ch), má»¥c ÄÃ­ch:
- PhÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng khi tÆ°Æ¡ng tÃ¡c vá»i cÃ¡c filter, component trÃªn mÃ n hÃ¬nh lá»ch sá»­ giao dá»c...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_id | STRING | MÃ£ Äá»nh danh duy nháº¥t cho má»i sá»± kiá»n log trong há» thá»ng. | -AqwqhzGo26UmcOiJ_LfD, 2aIlQyYBvkvExYg2CUmJG, nO-CdBpJURJeo-hyAm9bH |
| user_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng trÃªn MoMo, dÃ¹ng Äá» nháº­n diá»n khÃ¡ch hÃ ng. | 57621949, 67859651, 44717405 |
| date | DATE | NgÃ y diá»n ra sá»± kiá»n, dáº¡ng yyyy-MM-dd. | 2025-11-05, 2026-01-05, 2025-11-10 |
| week | DATE | NgÃ y báº¯t Äáº§u tuáº§n tÆ°Æ¡ng á»©ng vá»i date (thá»© Hai), dáº¡ng yyyy-MM-dd. | 2025-11-02, 2026-01-04, 2025-11-30 |
| month | DATE | NgÃ y Äáº§u tiÃªn cá»§a thÃ¡ng tÆ°Æ¡ng á»©ng vá»i date, dáº¡ng yyyy-MM-dd. | 2025-12-01, 2025-10-01, 2025-11-01 |
| datetime | DATETIME | Thá»i Äiá»m chÃ­nh xÃ¡c Äáº¿n giÃ¢y phÃ¡t sinh sá»± kiá»n. | 2025-11-22 11:43:54.445, 2025-10-13 14:53:40.094, 2025-10-09 22:18:06.891 |
| global_trigger_id | STRING | MÃ£ trigger toÃ n cá»¥c Äá»nh danh ngá»¯ cáº£nh cá»§a mÃ n hÃ¬nh lá»ch sá»­ giao dá»ch. | transactionhistory1230b445d2419504624e8f6db4640f4ff071, transactionhistory124699... |
| action_event | STRING | Loáº¡i hÃ nh Äá»ng diá»n ra vá»i component (Displayed/Clicked/Selected. | Displayed, Clicked, Swiped, Screenshot |
| block_event | STRING | TÃªn khá»i giao diá»n nÆ¡i sá»± kiá»n phÃ¡t sinh, vÃ­ dá»¥ khá»i LSGD (Lá»ch Sá»­ Giao Dá»ch). | LSGD, CTGD, Top nav, Filter, Xuất sao kê |
| description | STRING | Ná»i dung mÃ´ táº£ chi tiáº¿t sá»± kiá»n dÆ°á»i dáº¡ng vÄn báº£n ngáº¯n. | Hiển thị CTA chia bill, Hiển thị màn hình lịch sử giao dịch, Hiển thị CTA chuyển... |
| service_name | STRING | TÃªn dá»ch vá»¥ á»©ng dá»¥ng Äang liÃªn quan Äáº¿n sá»± kiá»n. | tabbar_transaction, transaction_history_detail, transaction_history_filter |
| screen_name | STRING | TÃªn mÃ n hÃ¬nh nÆ¡i sá»± kiá»n xáº£y ra. | transaction_history, transaction_detail, transaction_history_filter, download_st... |
| event_name | STRING | TÃªn sá»± kiá»n ÄÆ°á»£c log, vÃ­ dá»¥ service_button_displayed. | service_button_displayed, service_screen_displayed, service_block_clicked, servi... |
| component_name | STRING | TÃªn component cá»¥ thá» náº¿u cÃ³, Äá» trá»ng náº¿u khÃ´ng Ã¡p dá»¥ng. | , calendar, warning |
| component_type | STRING | Loáº¡i component nhÆ° Button, Icon, Label. | collapse, block, datepicker, extend |
| button_name | STRING | TÃªn nÃºt báº¥m liÃªn quan Äáº¿n sá»± kiá»n. | action_button, , date_selected |
| icon_name | STRING | TÃªn icon náº¿u cÃ³, hiá»n chÆ°a ÄÆ°á»£c ghi nháº­n. | , filter, expand_calendar |
| block_name | STRING | TÃªn block con trong khá»i giao diá»n, náº¿u cÃ³. | , transaction_list, calendar |
| status | STRING | Tráº¡ng thÃ¡i hiá»n táº¡i cá»§a component hoáº·c mÃ n hÃ¬nh. | success, fail |
| page | STRING | Sá» hoáº·c tÃªn page náº¿u cÃ³ paging; hiá»n chÆ°a ghi nháº­n. |  |
| popup_name | STRING | TÃªn popup khi sá»± kiá»n phÃ¡t sinh trÃªn popup. |  |
| checkbox_name | STRING | TÃªn checkbox náº¿u sá»± kiá»n liÃªn quan checkbox. |  |
| action | STRING | HÃ nh Äá»ng bá» xung Äá»ng thá»i vá»i action_event; hiá»n Äang None. | on |
| tab_name | STRING | TÃªn tab trong mÃ n hÃ¬nh cÃ³ nhiá»u tab. |  |
| type | STRING | Loáº¡i hÃ¬nh ná»i dung giao diá»n hoáº·c hÃ nh Äá»ng (chat_conversation, transfer_split_bill. | transfer_split_bill, sacombank_cashout, transfer_p2p |
| content_category | STRING | ChuyÃªn má»¥c ná»i dung mÃ  component/sá»± kiá»n thuá»c vá». |  |
| field_name | STRING | TÃªn trÆ°á»ng dá»¯ liá»u náº¿u sá»± kiá»n gáº¯n vá»i nháº­p liá»u form. | , search |
| filter_name | STRING | TÃªn filter hiá»n Äang None (chÆ°a gÃ¡n giÃ¡ trá»). |  |
| filter_type | STRING | Loáº¡i filter (checkbox, radio, text. | filter_by_month, filter_by_service, filter_by_account, filter_by_status, filter_... |
| filter_value | STRING | GiÃ¡ trá» lá»c ÄÆ°á»£c chá»n/sá»­ dá»¥ng; Äang None. | Tất cả, Ví MoMo, Nhận tiền, Tháng 10/2025, Chuyển tiền |
| source_from | STRING | Nguá»n module hoáº·c service táº¡o ra sá»± kiá»n. | home, others, billpaycenter |
| trans_category | STRING | NhÃ³m transaction liÃªn quan, náº¿u cÃ³. | th_p2p_w2b_cat3, th_token_cat2, th_electricity_cat2 |
| trans_status | STRING | Tráº¡ng thÃ¡i giao dá»ch liÃªn quan (Success, Failed. | success, pending, failed |
| position | STRING | Vá» trÃ­ hiá»n thá» cá»§a component trÃªn UI. | 2, 3, 1 |

### momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER
> Báº£ng momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER lÆ°u trá»¯ thÃ´ng tin lá»ch sá»­ giao dá»ch ngÆ°á»i dÃ¹ng phá»¥c vá»¥ cho dá»ch vá»¥ quáº£n lÃ½ chi tiÃªu. 
ThÃ´ng tin cÃ³ thá» ÄÆ°á»£c láº¥y tá»« báº£ng nÃ y gá»m cÃ³: 
- ThÃ¡ng thá»±c hiá»n phÃ¢n loáº¡i giao dá»ch 
- ID cá»§a ngÆ°á»i dÃ¹ng ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| DATE_MONTH | DATE | ThÃ¡ng thá»±c hiá»n phÃ¢n loáº¡i giao dá»chThÃ¡ng thá»±c hiá»n phÃ¢n loáº¡i giao dá»ch | 2025-12-01, 2025-09-01, 2025-11-01 |
| AGENT_ID | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMoUser ID | 76040441, 42011742, 47113325 |
| CATEGORY | STRING | Danh má»¥c phÃ¢n loáº¡i giao dá»chDanh má»¥c phÃ¢n loáº¡i | Hóa đơn, Giải trí, Ăn uống, Chưa phân loại, Mua sắm |
| TRANS | INTEGER | Sá» lÆ°á»£ng giao dá»chSá» lÆ°á»£ng giao dá»ch | 1, 2, 3 |
| AMOUNT | FLOAT | GiÃ¡ trá» giao dá»chGiÃ¡ trá» giao dá»ch | 100000, 50000, 10000 |

### momovn-prod.MBI_DA.HAI_QLCT_FEATURE_BUDGET_RAW
> Báº£ng nÃ y chá»©a thÃ´ng tin chi tiáº¿t vá» ngÃ¢n sÃ¡ch QLCT cá»§a tá»«ng user. Má»i báº£n ghi Äáº¡i diá»n cho ngÃ¢n sÃ¡ch liÃªn quan Äáº¿n má»t danh má»¥c hoáº·c tá»ng ngÃ¢n sÃ¡ch, vá»i cÃ¡c tham chiáº¿u Äáº¿n thá»i gian táº¡o láº­p vÃ  cáº­p nháº­t. ThÃ´ng tin cÃ³ thá» ÄÆ°á»£c sá»­ dá...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| autoid | FLOAT | MÃ£ budget_id cÅ© khÃ´ng cÃ²n sá»­ dá»¥ngMÃ£ budget_id cÅ© khÃ´ng cÃ²n sá»­ dá»¥ng | 2045130, 2389904, 1782958 |
| agent_id | STRING | MÃ£ Äá»nh danh tá»«ng userMÃ£ Äá»nh danh tá»«ng user | 86605749, 51350302, 21896549 |
| dt | DATE | NgÃ y ETL báº£ngNgÃ y ETL báº£ng | 2025-08-01, 2025-10-01, 2025-09-01 |
| create_date | DATE | NgÃ y táº¡o budgetNgÃ y táº¡o budget | 2024-11-06, 2024-11-07, 2024-11-05 |
| create_month | DATE | ThÃ¡ng táº¡o budgetThÃ¡ng táº¡o budget | 2024-11-01, 2024-12-01, 2024-10-01 |
| last_update | DATE | NgÃ y cáº­p nháº­t thÃ´ng tin vá» sá» tiá»n Äáº·t cho budgetNgÃ y cáº­p nháº­t thÃ´ng tin vá» s... | 2025-08-01, 2025-09-01, 2025-07-01 |
| update_month | DATE | ThÃ¡ng cáº­p nháº­t thÃ´ng tin vá» sá» tiá»n Äáº·t cho budgetThÃ¡ng cáº­p nháº­t thÃ´ng tin vá»... | 2025-10-01, 2025-09-01, 2025-08-01 |
| time_stamp_create | TIMESTAMP | Thá»i gian táº¡o budget theo timestampThá»i gian táº¡o budget theo timestamp | 2024-12-15 05:16:11+00, 2024-11-26 12:11:13+00, 2024-11-09 09:11:15+00 |
| year_budget | FLOAT | NÄm cáº­p nháº­t cá»§a budget Äi theo nÄm cá»§a last_updateNÄm cáº­p nháº­t cá»§a budget Äi the... | 2025, 2024, 2026 |
| TYPE_BUDGET | FLOAT | Loáº¡i budget, vá»i {'1': Total budget, '2': Category budget}Loáº¡i budget, vá»i {'1': Total budge... | 2, 1 |
| MASTER_ID | STRING | MÃ£ Äá»nh danh cá»§a budget, Äáº¿m master_id Äá» biáº¿t 1 user cÃ³ bao nhiÃªu budgetMÃ£ Äá»nh... |  |
| CATEGORY_ID | FLOAT | Category cá»§a budgetCategory cá»§a budget | 86, 105, 87 |
| JANUARY | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 1Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 1000 |
| FEBRUARY | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 2Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 1000 |
| MARCH | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 3Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 1000 |
| APRIL | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 4Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 1000 |
| MAY | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 5Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 1000 |
| JUNE | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 6Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 2000000 |
| JULY | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 7Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 2000000 |
| AUGUST | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 8Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 2000000 |
| SEPTEMBER | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 9Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡... | 1000000, 500000, 2000000 |
| OCTOBER | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 10Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ... | 1000000, 500000, 2000000 |
| NOVEMBER | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 11Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ... | 1000000, 1000, 500000 |
| DECEMBER | FLOAT | Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ¡ng 12Sá» tiá»n budget ÄÆ°á»£c user Äáº·t á» thÃ... | 1000000, 1000, 500000 |

### momovn-prod.MBI_DA.QLCT_L3_LABEL_WIDGET
> Báº£ng fact lÆ°u trá»¯ sá»± kiá»n hiá»n thá» vÃ  tÆ°Æ¡ng tÃ¡c cá»§a ngÆ°á»i dÃ¹ng vá»i cÃ¡c widget thuá»c dá»ch vá»¥ Quáº£n lÃ­ chi tiÃªu (QLCT) cáº¥p Äá» 3 trong á»©ng dá»¥ng MoMo. 
- PhÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng khi tÆ°Æ¡ng tÃ¡c vá»i widget QLCT (click, view, dismissâ¦) 
- Äo lÆ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_id | STRING | ID duy nháº¥t cá»§a sá»± kiá»n log, dÃ¹ng Äá» trace theo chuá»i hÃ nh Äá»ng trong cÃ¹ng má»t ... | , apenpup-api-prod-6cc77b6448-s5vjr_532197206_532197210_1767629348536, apenpup-a... |
| user_id | STRING | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng trong há» thá»ng MoMoMÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng trong há» th... | 33940422, 38666541, 47205998 |
| datetime | DATETIME | Thá»i Äiá»m ghi nháº­n sá»± kiá»n theo giá» phÃºt giÃ¢y (UTC+7 ÄÃ£ chuyá»n Äá»i)Thá»i Äiá... | 2025-12-29 20:41:50.286, 2026-01-05 10:05:15.171, 2025-12-01 16:51:50.993 |
| date | DATE | NgÃ y ghi nháº­n sá»± kiá»nNgÃ y ghi nháº­n sá»± kiá»n | 2026-01-05, 2025-10-10, 2025-12-31 |
| month | DATE | NgÃ y Äáº§u tiÃªn cá»§a thÃ¡ng Äá» phÃ¢n vÃ¹ng dá»¯ liá»u theo thÃ¡ngNgÃ y Äáº§u tiÃªn cá»§a th... | 2025-10-01, 2025-11-01, 2025-12-01 |
| widget_action | STRING | HÃ nh Äá»ng ngÆ°á»i dÃ¹ng Äá»i vá»i widget: âDisplayedâ â tháº¥y widget trÃªn mÃ n hÃ¬nh... | Displayed, Clicked |
| widget_type | STRING | Loáº¡i hiá»n thá» cá»§a widget: ânativeâ â widget code sáºµn trong app, âweb-viewâ, âb... | widget, native, mini app, button |
| widget_identify | STRING | MÃ£ widget duy nháº¥t theo design system cá»§a QLCT; vÃ­ dá»¥: QLCT_1 â widget tá»ng quan chi tiÃ... | 3, , QLCT_1 |
| description | STRING | Ghi chÃº ngáº¯n cá»§a sá»± kiá»n ÄÆ°á»£c backend Äáº©y vÃ o log, á» ÄÃ¢y chá» ghi nháº­n kiá»... | Widget QLCT / KQGD - Insight , Widget native level item -, Widget native level w... |
| service_name | STRING | TÃªn dá»ch vá»¥ trong á»©ng dá»¥ng, cá» Äá»nh lÃ  âexpenseâ â trang Quáº£n lÃ­ chi tiÃªuTÃ... | expense, vn.momo.financial_hub |
| event_name | STRING | Loáº¡i sá»± kiá»n phÃ¡t sinh; á» table nÃ y lÃ  âservice_component_displayedâ â component Ä... | service_component_displayed, service_component_clicked, service_button_clicked |
| screen_name | STRING | MÃ n hÃ¬nh nÆ¡i widget ÄÆ°á»£c renderMÃ n hÃ¬nh nÆ¡i widget ÄÆ°á»£c render | transaction_result, HomeScreen, TabMeInfo, momo_home, transaction_detail |
| component_name | STRING | TÃªn component tÆ°Æ¡ng á»©ng vá»i widget log; thÆ°á»ng lÃ  âwidget_nativeâTÃªn component tÆ°Æ¡... | widget_native, insight, expense_widget, insight_widget_QLCT, widget_native_3 |
| component_type | STRING | Loáº¡i cáº¥u thÃ nh parent UI; á» ÄÃ¢y lÃ  âwidgetâLoáº¡i cáº¥u thÃ nh parent UI; á» ÄÃ¢y lÃ... | widget, insight_widget |
| button_name | STRING | TÃªn button náº¿u hÃ nh Äá»ng lÃ  clickTÃªn button náº¿u hÃ nh Äá»ng lÃ  click | , arrow, cta, open_expense_detail |
| icon_name | STRING | TÃªn icon ÄÆ°á»£c click hoáº·c hiá»n thá»TÃªn icon ÄÆ°á»£c click hoáº·c hiá»n thá» |  |
| block_name | STRING | TÃªn block thuá»c tÃ­nh chá»©a widget trong layout â chá» Äá»nh vÃ¹ng trÃªn UI. | , QLCT_1, QLCT_9 |
| status | STRING | Tráº¡ng thÃ¡i ká»¹ thuáº­t cá»§a widget/component khi logTráº¡ng thÃ¡i ká»¹ thuáº­t cá»§a widget/com... | classified, on_report, detail_on_report, lookback_on_report, lookback_year_on_re... |
| page | STRING | Chá» sá» thá»© tá»± page náº¿u widget ÄÆ°á»£c phÃ¢n trangChá» sá» thá»© tá»± page náº¿u widget ... | 1, 2, 4 |
| popup_name | STRING | TÃªn popup khi log má»/ÄÃ³ng popupTÃªn popup khi log má»/ÄÃ³ng popup |  |
| checkbox_name | STRING | TÃªn checkbox khi log check/uncheckTÃªn checkbox khi log check/uncheck |  |
| source_from | STRING | Nguá»n gá»c widget Äá» thiáº¿t láº­p trackingNguá»n gá»c widget Äá» thiáº¿t láº­p tracking | expense, income |
| list_name | STRING | TÃªn list náº¿u widget thuá»c má»t listviewTÃªn list náº¿u widget thuá»c má»t listview |  |
| action | STRING | TÃªn action phá»¥, dÃ¹ng cho báº£n tin rá»ngTÃªn action phá»¥, dÃ¹ng cho báº£n tin rá»ng | not_edited, edited, header, cta, start_change_cate |
| tab_name | STRING | TÃªn tab phá»¥ náº¿u widget náº±m trong Äa tabTÃªn tab phá»¥ náº¿u widget náº±m trong Äa tab | , month_sum, demo_month_sum, top_list, demo_top_list |
| type | STRING | Loáº¡i phÃ¢n loáº¡i bá» sung cho sá»± kiá»nLoáº¡i phÃ¢n loáº¡i bá» sung cho sá»± kiá»n | Ăn uống, Hóa đơn, Chợ, siêu thị, Mua sắm, Giải trí |
| content_category | STRING | Danh má»¥c ná»i dung náº¿u cÃ³ Ã¡p dá»¥ng phÃ¢n loáº¡iDanh má»¥c ná»i dung náº¿u cÃ³ Ã¡p dá»¥ng ph... | 3, 11, null |
| card_name | STRING | TÃªn card hoáº·c block card náº¿u widget náº±m trong má»t tháº»TÃªn card hoáº·c block card náº¿u wi... | , insight_widget_QLCT_default, insight_widget_QLCT_1trieuxu, insight_widget_QLCT... |

### momovn-prod.TEAM_PRODUCT_OPTS.QLCT_L4_USER_PROFILE_MONTHLY
> projectid.dataset_name.QLCT_L4_USER_PROFILE_MONTHLY lÃ  báº£ng lÆ°u trá»¯ thÃ´ng tin hÃ ng thÃ¡ng vá» ngÆ°á»i dÃ¹ng Quáº£n lÃ½ chi tiÃªu trÃªn á»©ng dá»¥ng MoMo. 
Báº£ng nÃ y dÃ¹ng Äá» phÃ¢n tÃ­ch cÃ¡c hÃ nh vi cá»§a ngÆ°á»i dÃ¹ng, gá»m cÃ³:
- Theo dÃµi sá» lÆ°á»£ng ngÃ y ngÆ°á»i dÃ¹ng sá»­ ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| agent_id | STRING | MÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng Quáº£n lÃ½ chi tiÃªuMÃ£ Äá»nh danh cá»§a ngÆ°á»i dÃ¹ng Quáº... | 89978527, 23042880, 54988751 |
| etl_month | DATE | ThÃ¡ng visit Quáº£n lÃ½ chi tiÃªuThÃ¡ng visit Quáº£n lÃ½ chi tiÃªu | 2025-12-01, 2025-09-01, 2025-08-01 |
| month_of_year | STRING | TÃªn cá»§a thÃ¡ngTÃªn cá»§a thÃ¡ng | December, November, October, September, January |
| year | INTEGER | NÄm visit Quáº£n lÃ½ chi tiÃªuNÄm visit Quáº£n lÃ½ chi tiÃªu | 2025, 2024, 2026 |
| n2qlct_date | DATE | NgÃ y láº§n Äáº§u tiÃªn ngÆ°á»i dÃ¹ng Äáº¿n vá»i Quáº£n lÃ½ chi tiÃªuNgÃ y láº§n Äáº§u tiÃªn ng... | 2024-09-30, 2024-09-20, 2024-06-10 |
| n2month_date | DATE | NgÃ y láº§n Äáº§u trong thÃ¡ng ngÆ°á»i dÃ¹ng Äáº¿n vá»i Quáº£n lÃ½ chi tiÃªuNgÃ y láº§n Äáº§u t... | 2025-10-03, 2025-09-01, 2025-12-01 |
| monthly_user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng Quáº£n lÃ½ chi tiÃªu theo thÃ¡ngLoáº¡i ngÆ°á»i dÃ¹ng Quáº£n lÃ½ chi tiÃªu the... | 2. Retain, 3. Reactive, 1. New |
| is_n2qlct | BOOLEAN | ThÃ¡ng nÃ y cÃ³ pháº£i thÃ¡ng Äáº§u tiÃªn user Äáº¿n vá»i Quáº£n lÃ½ chi tiÃªu khÃ´ng, true: lÃ  ... | false, true |
| numday_visit | INTEGER | Sá» ngÃ y mÃ  ngÆ°á»i dÃ¹ng vÃ o Quáº£n lÃ½ chi tiÃªu trong thÃ¡ng nÃ ySá» ngÃ y mÃ  ngÆ°á»i dÃ¹... | 1, 2, 3 |
| qlct_segment | STRING | NgÆ°á»i dÃ¹ng thuá»c segment nÃ o trong Quáº£n lÃ½ chi tiÃªu ÄÆ°á»£c chia theo sá» ngÃ y visit t... | Light QLCT, Medium QLCT, Hardcore QLCT |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ngGiá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ng | male, female, unknown |
| age | INTEGER | Tuá»i cá»¥ thá» cá»§a ngÆ°á»i dÃ¹ngTuá»i cá»¥ thá» cá»§a ngÆ°á»i dÃ¹ng | 22, 23, 21 |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ngNhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [5]. 31 - 35 y/o, [4]. 27 - 30 y/o, [7]. >40... |
| most_city_a60 | STRING | ThÃ nh phá» mÃ  ngÆ°á»i dÃ¹ng Äang sá»ngThÃ nh phá» mÃ  ngÆ°á»i dÃ¹ng Äang sá»ng | Hồ Chí Minh, Hà Nội, Bình Dương |
| is_momo_employee | BOOLEAN | NgÆ°á»i dÃ¹ng nÃ y cÃ³ pháº£i nhÃ¢n viÃªn MoMo khÃ´ng, true: lÃ  nhÃ¢n viÃªn MoMo, false: khÃ´ng ph... | false, true |
| no_usecase | INTEGER | Sá» lÆ°á»£ng dá»ch vá»¥ ngÆ°á»i dÃ¹ng ÄÃ£ sá»­ dá»¥ng trong thÃ¡ngSá» lÆ°á»£ng dá»ch vá»¥ ngÆ°... | 4, 5, 3 |
| platform_segment | STRING | NgÆ°á»i dÃ¹ng thuá»c segment nÃ o á» Platform trong thÃ¡ngNgÆ°á»i dÃ¹ng thuá»c segment nÃ o á»... | Hardcore >=4 usecase, Medium 3 usecase, Light 1-2 usecase |
| user_type_lifecycle | STRING | Loáº¡i ngÆ°á»i dÃ¹ng lifetime theo PlatformLoáº¡i ngÆ°á»i dÃ¹ng lifetime theo Platform | 2. Retain, 3. Reactive, 1. New |
| total_trans | INTEGER | Tá»ng sá» lÆ°á»£ng giao dá»ch cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ngTá»ng sá» lÆ°á»£ng giao dá»ch c... | 1, 2, 3 |
| total_gmv | FLOAT | Tá»ng sá» tiá»n giao dá»ch cá»§a ngÆ°á»i dÃ¹ng trong thÃ¡ngTá»ng sá» tiá»n giao dá»ch cá»§a... | 10000, 20000, 100000 |
| first_add_trans_date | DATE | NgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng cÃ³ thÃªm giao dá»ch tayNgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng cÃ³ thÃ... | 2024-11-06, 2024-11-07, 2024-11-20 |
| first_budget_date | DATE | NgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng vÃ o setup ngÃ¢n sÃ¡chNgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng vÃ o setup... | 2025-12-31, 2024-11-06, 2024-11-07 |
| first_classify_date | DATE | NgÃ y Äáº§u tiÃªn ngÆ°á»i dÃ¹ng vÃ o phÃ¢n loáº¡i giao dá»ch thá»§ cÃ´ngNgÃ y Äáº§u tiÃªn ngÆ°á»... | 2024-11-06, 2024-11-07, 2024-09-20 |
| is_pin_home | BOOLEAN | NgÆ°á»i dÃ¹ng nÃ y ÄÃ£ ghim icon Quáº£n lÃ½ chi tiÃªu trÃªn Home MoMo chÆ°a, true: ÄÃ£ ghim, fals... | false, true |
| is_having_upcoming | BOOLEAN | NgÆ°á»i dÃ¹ng nÃ y Äang cÃ³ nhá»¯ng giao dá»ch sáº¯p tá»i khÃ´ng, true: cÃ³ giao dá»ch sáº¯p tá... | false, true |
| num_budget | INTEGER | Sá» lÆ°á»£ng ngÃ¢n sÃ¡ch ngÆ°á»i dÃ¹ng nÃ y Äang tÃ­nh Äáº¿n thÃ¡ngSá» lÆ°á»£ng ngÃ¢n sÃ¡ch ngÆ... | 1, 2, 3 |
| num_manual_classify | INTEGER | Sá» lÆ°á»£ng giao dá»ch ngÆ°á»i dÃ¹ng nÃ y ÄÃ£ phÃ¢n loáº¡i trong thÃ¡ngSá» lÆ°á»£ng giao dá»c... | 0, 1, 2 |
| num_add_trans | INTEGER | Sá» lÆ°á»£ng giao dá»ch ngÆ°á»i dÃ¹ng nÃ y ÄÃ£ thÃªm thá»§ cÃ´ng trong thÃ¡ngSá» lÆ°á»£ng giao ... | 0, 1, 2 |

## Domain Knowledge (from Mimir)

- Khi xử lý sự kiện Click tạo ngân sách, sử dụng SCREEN_NAME = 'expense_budget_category_information' và EVENT_NAME = 'service_button_clicked'
- Khi truy vấn MEU của Moni, cần thêm điều kiện ACTION = 'CHAT'
- Khi chuẩn hóa sang TIMESTAMP, sử dụng timezone GMT+7 (Asia/Ho_Chi_Minh) để tính toán diff
- The column named `USER_TYPE` in the provided schema for `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` should be treated as `USER_TYPE_TFBV` based on successful query executions. The `USER_TYPE` column does not exist in the actual table.
- Khi xử lý vấn đề liên quan tới QLCT, cần đảm bảo rằng cột MONTH trong bảng SEMANTIC_QLCT_VISIT phải khớp với cột DATE_MONTH trong bảng QLCT_L4_TRANSHIS_USER
- Khi xử lý block_event = 'Home Page', cần thêm điều kiện description = 'Hiển thị Home QLCT'
- Khi tính số MEU Moni, loại trừ user_message 'DEFAULT_START_MESSAGE'
- Exclude messages where user_message = 'default_start_message' from all future queries related to conversations or messages.
- Khi sử dụng REGEXP_EXTRACT_ALL, nên dùng r'\p{L}+' để trích xuất từ ngữ thay vì r'\b\w+\b'
- Sử dụng UNION DISTINCT thay vì UNION ALL trong các truy vấn SQL
- Khi tính adoption_rate, chỉ nên tính trên retain_users
- FORMAT_DATE('%Y-%m', MONTH) không nên được sử dụng khi truy vấn
- Khi user hỏi về 'Hiển thị màn hình lịch sử giao dịch ở LSGD', 'Hiển thị màn hình lịch sử giao dịch' là description và 'LSGD' là block_event.
- Nếu hỏi về số visit hoặc số lượng user thì phải count (distinct agent_id)
- Khi tính toán retention từ tháng trước đến ngày 25 của tháng sau, cần sử dụng điều kiện JOIN với T2.MONTH = DATE_ADD(T1.MONTH, INTERVAL 1 MONTH)
- MEU QLCT = user has PRODUCT = 'QLCT' in that month.
- COUNT(distinct t2.screen_name) should be used for screen_visits
- Khi hỏi MEU Moni, chỉ tính những user có tương tác chat với Moni.
- User prefers to be addressed as "Thảo" instead of "Nguyễn Thị Kim Thảo".
- KQGD là viết tắt của 'Kết quả giao dịch'
- Khi xử lý sự kiện click vào icon thuộc block menu, sử dụng lower(DESCRIPTION) LIKE 'Homepage - Click vào icon thuộc block Menu%' thay vì lower(block_name) LIKE '%menu%'
- Khi hỏi về user QLCT hoặc MONI, hãy dùng bảng SEMANTIC_QLCT_VISIT làm gốc và left join với bảng QLCT_L4_TRANSHIS_USER.
- Khi truy vấn dữ liệu cho sản phẩm 'MONI', cần thêm điều kiện 'action = CHAT'
- Khi hỏi thông tin liên quan tới Visitor QLCT từ bảng QLCT_L4_TRANSHIS_USER, cần join với bảng SEMANTIC_QLCT_VISIT và filter PRODUCT = 'QLCT' và key join là AGENT_ID và MONTH (nếu hỏi theo từng tháng).
- Công thức tính retention 3/3 tháng (overall):
- Xác định cohort tháng t = danh sách user có visit QLCT trong tháng t.
- Với mỗi user trong cohort tháng t, kiểm tra xem họ có visit QLCT trong tháng t+1, tháng t+2 và tháng t+3 hay không.
- Nếu user có mặt đầy đủ trong cả 3 tháng tiếp theo → tính là retained 3/3.
- Retain 3/3 của cohort tháng t = số user retained 3/3 chia cho tổng số user trong cohort tháng t.
- Overall retain 3/3 = cộng tất cả số user retained 3/3 của các cohort lại, rồi chia cho tổng số user của tất cả cohort.
- Khi tính toán nhóm retention, cần bao gồm dữ liệu tháng 4
- Để xác định user QLCT, cần join với bảng SEMANTIC_QLCT_VISIT và filter PRODUCT = 'QLCT'

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
