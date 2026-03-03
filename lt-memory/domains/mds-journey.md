# Domain: BU MDS: Journey

## Identity
- **Domain ID:** `6471b001-623f-4ce2-a6a5-5bf63b2cf928`
- **Description:** Thông tin về journey camp chạy, gồm CVR enter, goal, ctr noti, ctr adv
Cách tạo journey ở đây https://docs.google.com/presentation/d/17Ql0pm8iCq9zsmCTsyaMLMpms7G_fTdIsal2-VOTkVc/edit?slide=id.g2e2e0b1a5bb_0_1563#slide=id.g2e2e0b1a5bb_0_1563
- **Tables:** 2
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.MBI_DA.journey_track_node_agg_v2
> Báº£ng nÃ y tá»ng há»£p vÃ  theo dÃµi cÃ¡c node trong hÃ nh trÃ¬nh khÃ¡ch hÃ ng, dá»±a trÃªn cÃ¡c dá»¯ liá»u tá»« cÃ¡c hoáº¡t Äá»ng quáº£ng cÃ¡o vÃ  thÃ´ng bÃ¡o. Má»¥c ÄÃ­ch cá»§a báº£ng nÃ y gá»m cÃ³: 
- Theo dÃµi vÃ  phÃ¢n tÃ­ch hiá»u suáº¥t cá»§a tá»«ng chiáº¿n dá»ch quáº£ng cÃ¡o thÃ´ng q...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| node_date | DATE | NgÃ y node thá»±c hiá»nngÃ y node thá»±c hiá»n | 2025-12-07, 2025-11-18, 2025-11-01 |
| campaign_id | STRING | MÃ£ Äá»nh danh campaign namemÃ£ Äá»nh danh campaign name | LI4b1JG4ayQBv8nZhXLG, SL5yGM0YkjjqlEJe877D, TXyZENDYECH3v5ghcepa |
| campaign_name | STRING | TÃªn campaign mÃ  BU tá»± Äáº·t tÃªntÃªn campaign mÃ  BU tá»± Äáº·t tÃªn | 240403_JN_VTS_Clone_2TR7_A7_Segment1_Official_16, 240403_JN_VTS_Clone_2TR3_A60_S... |
| is_test | BOOLEAN | Camp dÃ¹ng Äá» test hay cháº¡y thá»±c. | false, true |
| account_id | STRING | MÃ£ Äá»nh danh BUmÃ£ Äá»nh danh BU | GMC Cross-sell, null, Social Payment, DLS - Offline, retail & FnB, GMC - CRM |
| goal_type | STRING | Loáº¡i goal BU tá»± chá»n, vÃ­ dá»¥: CONSIDERATION_CONVERSIONloáº¡i goal BU tá»± chá»n vd CONSIDER... | CONSIDERATION_CONVERSION, ENGAGEMENT_CROSS_SELLING, null, ENGAGEMENT_UPSELLING, ... |
| node_id | STRING | MÃ£ Äá»nh danh tá»«ng node cháº¡y, lÃ  node action cá»§a noti, adv, widget, . | 53605162507, 62146981952, 62146981955 |
| node_type | STRING | Dáº¡ng node action, vÃ­ dá»¥: noti vÃ  nhá»¯ng cÃ¡i cÃ²n láº¡idáº¡ng node action vd noti vÃ  nhá»¯ng... | NOTIFICATION, CUSTOM_ACTION, THIN_BANNER, WAIT, CAROUSEL_BANNER |
| action_type_lv1 | STRING | Level nhá» hÆ¡n cá»§a node typelevel nhá» hÆ¡n cá»§a node type | ADS_V2, null, CHAT_TEMPLATE, SURVEY, PROMOTION_WIDGET |
| caption | STRING | TÃªn caption cá»§a notitÃªn caption cá»§a noti | Thông báo quan trọng 🚨, Thông báo quan trọng, Kiểm tra doanh thu hôm nay |
| body | STRING | Ná»i dung cá»§a notiná»i dá»¥ng cá»§a noti | Bạn sẽ bị gián đoạn giao dịch thanh toán, chuyển tiền nếu chưa xác thực sinh trắ... |
| refid | STRING | ID tham chiáº¿u cá»§a noti | voucher_detail, credit_paylater_new, my_vouchers |
| image | STRING | ÄÆ°á»ng dáº«n hÃ¬nh áº£nh cá»§a noti | https://static.momocdn.net/app/img/XSell/900x507.jpg, https://attachment.momocdn... |
| preview_0 | STRING | HÃ¬nh áº£nh xem trÆ°á»c Äáº§u tiÃªn | null, gmc_xsell_1sv_JN_banner_cornerstone, 1111_GMCxsell_1 |
| preview_1 | STRING | HÃ¬nh áº£nh xem trÆ°á»c thá»© hai | null, CAROUSEL_BANNER, DYNAMIC_WIDGET, HALF_BANNER, BP_MerchantProduct |
| preview_2 | STRING | HÃ¬nh áº£nh xem trÆ°á»c thá»© ba | null, ENGAGEMENT_CARD, 31-03-2025 15:21:44 - 30-04-2025 23:59:59 |
| preview_3 | STRING | HÃ¬nh áº£nh xem trÆ°á»c thá»© tÆ° | null, 12 impression/user/day & 90 impression/user/all time, Mass |
| pre_condition_inf | STRING | ThÃ´ng tin Äiá»u kiá»n tiÃªn quyáº¿t cá»§a node | , _, AND_User login (case 104)_1_DAY_ACTION_FREQUENCY_OPERATOR_GREATER_THAN_OR_E... |
| non_organic_goal_user | INTEGER | Sá» lÆ°á»£ng user Äáº¡t goal nhá» vÃ o Journey, lÃ  user Äáº¡t goal sau khi ÄÆ°á»£c Journey req... | 0, 1, 2 |
| action_request_cnt | INTEGER | Sá» lÆ°á»£ng action ÄÆ°á»£c request tá»« Journey Äáº¿n cÃ¡c bÃªn nhÆ° noti, adv, . | 1, 2, 3 |
| noti_request_cnt | INTEGER | Sá» lÆ°á»£ng noti ÄÆ°á»£c request gá»­isá» lÆ°á»£ng noti ÄÆ°á»£c request gá»­i  | 0, 1, 2 |
| noti_sent_cnt | INTEGER | BU khÃ´ng dÃ¹ng cá»t nÃ yBU khÃ´ng dÃ¹ng cá»t nÃ y | 0, 1, 2 |
| noti_sent_outapp_cnt | INTEGER | BU khÃ´ng dÃ¹ng cá»t nÃ yBU khÃ´ng dÃ¹ng cá»t nÃ y | 0, 1, 2 |
| noti_sent_mqtt_cnt | INTEGER | Sá» lÆ°á»£ng noti ÄÆ°á»£c sent qua MQTTsá» lÆ°á»£ng noti ÄÆ°á»£c sent mqtt | 0, 1, 2 |
| noti_delivery_outapp_cnt | INTEGER | Sá» láº§n noti ÄÆ°á»£c gá»­i outappsá» láº§n noti ÄÆ°á»£c gá»­i outapp | 0, 1, 2 |
| noti_impression_inapp_cnt | INTEGER | Sá» láº§n noti ÄÆ°á»£c impression trong á»©ng dá»¥ngsá» láº§n noti ÄÆ°á»£c impression inapp | 1, 0, 2 |
| noti_click_read_inapp_cnt | INTEGER | Sá» láº§n noti ÄÆ°á»£c click trong á»©ng dá»¥ngsá» láº§n noti ÄÆ°á»£c click inapp | 0, 1, 2 |
| noti_click_read_outapp_cnt | INTEGER | Sá» láº§n noti ÄÆ°á»£c click ngoÃ i á»©ng dá»¥ngsá» láº§n noti ÄÆ°á»£c click outapp | 0, 1, 2 |
| noti_click_read_cnt | INTEGER | Sá» láº§n noti ÄÆ°á»£c clicksá» láº§n noti ÄÆ°á»£c click | 0, 1, 2 |
| ad_impresion_cnt | INTEGER | Sá» láº§n quáº£ng cÃ¡o ÄÆ°á»£c hiá»n thá»sá» láº§n adv impress | 1, 2, 3 |
| ad_click_cnt | INTEGER | Sá» láº§n quáº£ng cÃ¡o ÄÆ°á»£c clicksá» láº§n adv ÄÆ°á»£c click | 0, 1, 2 |
| Click | INTEGER | Tá»ng sá» láº§n click tá»« notification vÃ  advertisingtá»ng click tá»« notification vÃ  advertis... | 0, 1, 2 |
| Traffic | INTEGER | Tá»ng sá» lÆ°á»£ng noti gá»­i outapp + sá» láº§n impression inapp cá»§a noti vÃ  quáº£ng cÃ¡otá»... | 0, 1, 2 |
| goal_classification | STRING | PhÃ¢n loáº¡i má»¥c tiÃªu gá»m 3 loáº¡i: trans, non trans, mix3 loáº¡i gá»m trans, non trans, mix | trans, non_trans, unknown, mix |

### momovn-prod.MBI_DA.journey_track_camp_agg_v2
> Báº£ng nÃ y lÃ  má»t báº£ng dá»¯ liá»u vá» chiáº¿n dá»ch tiáº¿p thá» ÄÆ°á»£c táº¡o ra Äá» theo dÃµi vÃ  phÃ¢n tÃ­ch hiá»u suáº¥t cá»§a cÃ¡c chiáº¿n dá»ch marketing trÃªn MoMo. Báº£ng nÃ y chá»©a thÃ´ng tin chi tiáº¿t vá» cÃ¡c chiáº¿n dá»ch nhÆ° ngÃ y báº¯t Äáº§u vÃ  káº¿t thÃºc, loáº¡i ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| node_date | DATE | NgÃ y cá»§a node cháº¡yngÃ y cá»§a node cháº¡y | 2026-01-19, 2025-11-24, 2025-11-17 |
| campaign_id | STRING | ID Äá»nh danh campaign nameid Äá»nh dáº¡nh campaign name | MiYA6V9dEvUUoU0Q1nSI, 8u8HGfFua0N1DoyFkDbS, Y8djwAwQcYIhWJHQWbJY |
| campaign_name | STRING | TÃªn campaign mÃ  BU tá»± Äáº·t tÃªntÃªn campaign name mÃ  BU tá»± Äáº·t tÃªn | 240912_GSM_DEFAULT_1543, 241220_NEWTON_RETARGET_PAYMENT_CLICK_TIEP_TUC_CART_1372... |
| description | STRING | MÃ´ táº£ chiáº¿n dá»ch | , https://www.figma.com/board/X18PFAb5UVtwPml5x3ecSs/Cross-sell-Journey?node-id=... |
| created_by | STRING | NgÆ°á»i táº¡o campaignngÆ°á»i táº¡o campaign |  |
| camp_startdate | DATE | NgÃ y campaign ÄÆ°á»£c BU chá»n báº¯t Äáº§u cháº¡yngÃ y campaign ÄÆ°á»£c BU chá»n báº¯t Äáº§u ... | 2025-09-23, 2025-09-01, 2025-08-01 |
| camp_enddate | DATE | NgÃ y campaign ÄÆ°á»£c BU chá»n dá»«ng cháº¡yngÃ y campaign ÄÆ°á»£c BU chá»n dá»«ng cháº¡y | 2025-12-31, 2025-09-30, 2026-12-31 |
| segment_type | STRING | Loáº¡i phÃ¢n Äoáº¡n cá»§a chiáº¿n dá»ch | NOW, EVERY_DAY, EVERY_WEEK, EVERY_MONTH, CUSTOM_CRON |
| is_test | BOOLEAN | LÃ  campaign cháº¡y test hay khÃ´ng? true: lÃ  test, false: lÃ  tháº­tlÃ  campaign cháº¡y test hay k... | false, true |
| account_id | STRING | MÃ£ Äá»nh danh tá»«ng BUmÃ£ Äá»nh danh tá»«ng BU | Social Payment, GMC Cross-sell, FS - CreditTech, MDS- MoMo OA, DLS - Offline, re... |
| goal_type | STRING | Má»¥c ÄÃ­ch tá»«ng loáº¡i goal BU tá»± config trong journey, vÃ­ dá»¥: CONSIDERATION_CONVERSIONmá»¥... | CONSIDERATION_CONVERSION, ENGAGEMENT_CROSS_SELLING, null, ENGAGEMENT_UPSELLING, ... |
| link_flow | STRING | Luá»ng liÃªn káº¿t trong chiáº¿n dá»ch | https://www.figma.com/file/ElDRnRVxai0Z2kMsrXsGbt/Journey, https://docs.google.c... |
| target_cvr | STRING | Tá»· lá» chuyá»n Äá»i má»¥c tiÃªu cá»§a chiáº¿n dá»ch | null |
| baseline_cvr | STRING | Tá»· lá» chuyá»n Äá»i cÆ¡ báº£n cá»§a chiáº¿n dá»ch | null |
| goal_desc | STRING | MÃ´ táº£ má»¥c tiÃªu cá»§a chiáº¿n dá»ch | null, AND_OR_[BP] User click CTA Follow ở màn hình page detail_final_[BP] User c... |
| time_enter_user | INTEGER | Thá»i gian ngÆ°á»i dÃ¹ng tham gia | 0, 1, 2 |
| enter_user_by_camp | INTEGER | Unique user enter theo tá»«ng camp journeyunique user enter theo tá»«ng camp journey | 1, 2, 7290516 |
| enter_user_by_datecamp | INTEGER | Sá» láº§n user tham gia journeysá» láº§n user enter journey  | 1, 2, 3 |
| goal_user | INTEGER | Sá» lÆ°á»£ng user Äáº¡t goal gá»m nhá» vÃ o Journey, vÃ  khÃ´ng nhá» vÃ o journey. | 0, 1, 2 |
| non_organic_goal_user | INTEGER | Sá» lÆ°á»£ng user Äáº¡t goal nhá» vÃ o Journey, lÃ  goal sau khi ÄÆ°á»£c request gá»­i 1 actions... | 0, 1, 2 |
| exit_user | INTEGER | Láº§n user out khá»i journeyláº§n user out khá»i journey | 0, 1, 8 |
| goal_classification | STRING | PhÃ¢n loáº¡i goal gá»m trans, nontrans, mix (lÃ  trans hoáº·c non trans)phÃ¢n loáº¡i goal gá»m tra... | non_trans, trans, unknown, mix |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
