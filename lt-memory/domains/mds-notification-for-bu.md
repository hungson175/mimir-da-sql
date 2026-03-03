# Domain: BU MDS: Notification for BU

## Identity
- **Domain ID:** `bcae6a77-3995-49e5-85ca-36b1ed664c13`
- **Description:** Bảng Notification chỉ tổng hợp số lượng notiid giống dạng event, không theo user do bảng user quá nặng không load nổi nên tất cả câu hỏi có chữ "user", "người dùng" đều trả kết quả null
Metric chính sẽ là  delivery outapp, Impression inapp, Click inapp, click outapp, CTR inapp, CTR outapp
Phải input đúng tên campaign name, templateid mới trả ra kết quả
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-mds-dc.dwh.daily_notification_metrics
> Báº£ng nÃ y thu tháº­p cÃ¡c chá» sá» thÃ´ng bÃ¡o hÃ ng ngÃ y trÃªn há» thá»ng cá»§a MoMo. 
- Sá»­ dá»¥ng Äá» theo dÃµi vÃ  phÃ¢n tÃ­ch cÃ¡c nguá»n thÃ´ng bÃ¡o (e.g., nguá»n, tÃªn chiáº¿n dá»ch, ID máº«u). 
- GiÃºp ÄÃ¡nh giÃ¡ hiá»u quáº£ thÃ´ng bÃ¡o vá»i cÃ¡c chá» sá» nhÆ° sá» láº§n Ä...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_date | DATE | NgÃ y diá»n ra sá»± kiá»n thÃ´ng bÃ¡o. | 2025-11-03, 2025-11-02, 2025-11-05 |
| noti_source | STRING | Nguá»n cá»§a thÃ´ng bÃ¡o. | CAMPAIGN, TEMPLATE, JOURNEY, , null |
| campaign_name | STRING | TÃªn chiáº¿n dá»ch liÃªn quan Äáº¿n thÃ´ng bÃ¡o. | null, JOURNEY_8ky1EXUs7URXBxuFYwMC_86170265388, JOURNEY_wBHUPDd7cBUwd9CIIjFP_879... |
| template_id | STRING | ID cá»§a máº«u thÃ´ng bÃ¡o ÄÆ°á»£c sá»­ dá»¥ng. | null, INVESTMENT_GOLDENPOCKET_QQVHOC, PAYMENT_SOLUTIONS_TRLDUP |
| condition_name | STRING | TÃªn Äiá»u kiá»n Äá» kÃ­ch hoáº¡t thÃ´ng bÃ¡o. | , null, templateStatus, status, language |
| condition_value | STRING | GiÃ¡ trá» Äiá»u kiá»n Äá» kÃ­ch hoáº¡t thÃ´ng bÃ¡o. | , null, vie, success, true |
| os | STRING | Há» Äiá»u hÃ nh cá»§a thiáº¿t bá» nháº­n thÃ´ng bÃ¡o. | IOS, ANDROID, null, ios, android |
| touchpoint | STRING | Äiá»m cháº¡m nÆ¡i thÃ´ng bÃ¡o ÄÆ°á»£c tÆ°Æ¡ng tÃ¡c. | null, inapp_message, outapp_message, header_banner, voucher_card |
| organic_user | BOOLEAN | NgÆ°á»i dÃ¹ng organic (true: cÃ³, false: khÃ´ng). | false, true |
| a30_user | BOOLEAN | NgÆ°á»i dÃ¹ng A30 (true: cÃ³, false: khÃ´ng). | true, false |
| mau_user | BOOLEAN | NgÆ°á»i dÃ¹ng MAU (true: cÃ³, false: khÃ´ng). | false, true |
| BE_request | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u tá»« BE (Backend) Äá» gá»­i thÃ´ng bÃ¡o. | 0, 1, 2 |
| BE_accepted | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u tá»« BE ÄÃ£ ÄÆ°á»£c cháº¥p nháº­n Äá» gá»­i thÃ´ng bÃ¡o. | 0, 1, 2 |
| BE_sent_outapp | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÆ°á»£c gá»­i ra khá»i á»©ng dá»¥ng qua BE. | 0, 1, 2 |
| BE_sent_mqtt | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÆ°á»£c gá»­i qua MQTT tá»« BE. | 0, 1, 2 |
| BE_delivery_outapp | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÆ°á»£c chuyá»n ra ngoÃ i á»©ng dá»¥ng tá»« BE. | 0, 1, 2 |
| BE_sent | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÃ£ ÄÆ°á»£c gá»­i qua BE. | 0, 1, 2 |
| BE_delivery | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÃ£ ÄÆ°á»£c chuyá»n giao thÃ nh cÃ´ng qua BE. | 0, 1, 2 |
| BE_read | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÃ£ ÄÆ°á»£c Äá»c tá»« BE. | 0, 1, 2 |
| BE_delete | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÃ£ bá» xÃ³a qua BE. | 0, 1, 2 |
| BE_delivery_mqtt_inapp | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÆ°á»£c chuyá»n qua MQTT trong á»©ng dá»¥ng. | 0 |
| BE_out_of_quota | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u khÃ´ng ÄÆ°á»£c xá»­ lÃ½ do vÆ°á»£t quÃ¡ háº¡n má»©c quota. | 0, 1, 2 |
| BE_request_duplicated | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u bá» trÃ¹ng láº·p tá»« BE. | 0, 1, 2 |
| BE_ML_rejected | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o bá» tá»« chá»i qua ML (Machine Learning). | 0, 1, 2 |
| BE_sent_outapp_unallow_noti_setting | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o tá»« BE khÃ´ng ÄÆ°á»£c gá»­i do cÃ i Äáº·t thÃ´ng bÃ¡o khÃ´ng cho phÃ©p. | 0, 1, 2 |
| BE_sent_outapp_preload_sucess | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o tá»« BE ÄÆ°á»£c táº£i trÆ°á»c thÃ nh cÃ´ng. | 0, 1, 2 |
| BE_auto_scheduled_success | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÆ°á»£c tá»± Äá»ng láº­p lá»ch thÃ nh cÃ´ng qua BE. | 0, 1, 2 |
| BE_auto_scheduled_push_success | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o ÄÆ°á»£c Äáº©y tá»± Äá»ng láº­p lá»ch thÃ nh cÃ´ng qua BE. | 0, 1, 2 |
| BE_risk_user_blacklist | INTEGER | Sá» lÆ°á»£ng ngÆ°á»i dÃ¹ng rá»§i ro trong danh sÃ¡ch Äen khÃ´ng nháº­n ÄÆ°á»£c thÃ´ng bÃ¡o. | 0 |
| BE_unknow_error | INTEGER | Sá» lÆ°á»£ng lá»i khÃ´ng xÃ¡c Äá»nh xáº£y ra khi gá»­i thÃ´ng bÃ¡o qua BE. | 0 |
| BE_sent_outapp_fcm_token_empty | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do khÃ´ng cÃ³ mÃ£ token FCM. | 0, 1, 2 |
| BE_sent_outapp_fcm_token_invalid | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do mÃ£ token FCM khÃ´ng há»£p lá». | 0, 1, 2 |
| BE_mismatch_userID | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do ID ngÆ°á»i dÃ¹ng khÃ´ng khá»p. | 0 |
| BE_sent_outapp_fcm_service_unavailable | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do dá»ch vá»¥ FCM khÃ´ng kháº£ dá»¥ng. | 0, 1, 2 |
| BE_template_error | INTEGER | Sá» lÆ°á»£ng lá»i liÃªn quan Äáº¿n máº«u thÃ´ng bÃ¡o. | 0, 1, 2 |
| BE_invalid_content | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o chá»©a ná»i dung khÃ´ng há»£p lá». | 0, 5, 2 |
| BE_sent_outapp_fcm_token_unregistered | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do mÃ£ token FCM chÆ°a ÄÄng kÃ½. | 0, 1, 2 |
| BE_sent_outapp_fcm_invalid_json | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do mÃ£ FCM chá»©a Äá»nh dáº¡ng JSON khÃ´ng há»£p l... | 0 |
| BE_sent_outapp_fcm_bad_registration | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do lá»i ÄÄng kÃ½ mÃ£ token FCM. | 0 |
| BE_sent_outapp_apn_exception | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do lá»i ngoáº¡i lá» APN. | 0 |
| BE_sent_mqtt_build_topic_failed | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do lá»i táº¡o topic MQTT. | 0, 1, 2 |
| BE_sent_outapp_apn_token_unregistered | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do mÃ£ token APN chÆ°a ÄÄng kÃ½. | 0 |
| BE_sent_outapp_apn_token_bad | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do mÃ£ token APN bá» lá»i. | 0 |
| BE_sent_outapp_apn_token_device | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do lá»i mÃ£ token thiáº¿t bá» APN. | 0 |
| BE_sent_mqtt_push_failed | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng Äáº©y ÄÆ°á»£c qua MQTT. | 0, 1, 17 |
| BE_auto_scheduled_failed | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o tá»± Äá»ng láº­p lá»ch bá» lá»i. | 0 |
| BE_request_retry_max | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u retry tá»i Äa tá»« BE. | 0, 1, 2 |
| BE_sent_outapp_retry_max | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o gá»­i ra ngoÃ i retry tá»i Äa tá»« BE. | 0 |
| BE_sent_mqtt_conflig_version | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o khÃ´ng gá»­i ÄÆ°á»£c do xung Äá»t phiÃªn báº£n MQTT. | 0, 1, 2 |
| BE_auto_scheduled_invalid | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o láº­p lá»ch tá»± Äá»ng khÃ´ng há»£p lá». | 0 |
| BE_out_of_survey_quota | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u khÃ´ng xá»­ lÃ½ ÄÆ°á»£c do vÆ°á»£t háº¡n má»©c kháº£o sÃ¡t. | 0, 1, 2 |
| BE_store_center | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o xá»­ lÃ½ qua trung tÃ¢m lÆ°u trá»¯. | 0, 1, 2 |
| BE_store_center_rejected | INTEGER | Sá» lÆ°á»£ng thÃ´ng bÃ¡o bá» tá»« chá»i bá»i trung tÃ¢m lÆ°u trá»¯. | 0, 1, 2 |
| FB2_impression | INTEGER | Sá» lÆ°á»£ng lÆ°á»£t hiá»n thá» thÃ´ng bÃ¡o qua FB2. | 1, 0, 2 |
| FB2_click_read | INTEGER | Sá» lÆ°á»£ng láº§n nháº¥n Äá»c thÃ´ng bÃ¡o qua FB2. | 0, 1, 2 |
| FB2_click_more | INTEGER | Sá» lÆ°á»£ng láº§n nháº¥n thÃªm thÃ´ng tin thÃ´ng bÃ¡o qua FB2. | 0, 1, 2 |
| FB2_click_delete | INTEGER | Sá» lÆ°á»£ng láº§n nháº¥n xÃ³a thÃ´ng bÃ¡o qua FB2. | 0, 1, 2 |
| FB2_click_unread | INTEGER | Sá» lÆ°á»£ng láº§n nháº¥n ÄÃ¡nh dáº¥u chÆ°a Äá»c thÃ´ng bÃ¡o qua FB2. | 0, 1, 2 |
| FB2_click_back | INTEGER | Sá» lÆ°á»£ng láº§n nháº¥n quay láº¡i thÃ´ng bÃ¡o qua FB2. | 0 |
| FB2_click_close | INTEGER | Sá» lÆ°á»£ng láº§n nháº¥n ÄÃ³ng thÃ´ng bÃ¡o qua FB2. | 0, 1, 2 |
| FB2_click_small | INTEGER | Sá» lÆ°á»£ng láº§n nháº¥n thu nhá» thÃ´ng bÃ¡o qua FB2. | 0 |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
