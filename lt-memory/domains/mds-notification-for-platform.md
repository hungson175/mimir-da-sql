# Domain: BU MDS: Notification for Platform

## Identity
- **Domain ID:** `750780b7-b20f-46b6-ab05-2a4241b591c6`
- **Description:** BU MDS: Notification for Platform - Chỉ dành cho core team noti platform! A/c BU hay PO cell team vui lòng request ở BU MDS: Notification for BU!

Bảng Notification chỉ tổng hợp số lượng notiid giống dạng event, không theo user do bảng user quá nặng không load nổi nên tất cả câu hỏi có chữ "user", "người dùng" đều trả kết quả null
Metric chính sẽ là  delivery outapp, Impression inapp, Click inapp, click outapp, CTR inapp, CTR outapp
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-mds-dc.dwh.daily_notification_metrics
> Báº£ng daily_notification_metrics chá»©a cÃ¡c dá»¯ liá»u thá»ng kÃª hÃ ng ngÃ y liÃªn quan Äáº¿n quÃ¡ trÃ¬nh gá»­i notification trong há» thá»ng MoMo. Báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» phÃ¢n tÃ­ch hiá»u suáº¥t cá»§a cÃ¡c chiáº¿n dá»ch notification, theo dÃµi cÃ¡c lá»i phÃ¡t si...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_date | DATE | NgÃ y diá»n ra sá»± kiá»n. | 2025-11-02, 2025-11-03, 2025-11-04 |
| noti_source | STRING | Nguá»n gá»c cá»§a notification. | CAMPAIGN, TEMPLATE, JOURNEY, , null |
| campaign_name | STRING | TÃªn cá»§a chiáº¿n dá»ch notification. | null, JOURNEY_8ky1EXUs7URXBxuFYwMC_86170265388, JOURNEY_uSqWJTgoVzxv5GPb4WeX_872... |
| template_id | STRING | MÃ£ Äá»nh danh cá»§a máº«u template ÄÆ°á»£c sá»­ dá»¥ng cho notification. | null, INVESTMENT_GOLDENPOCKET_QQVHOC, PAYMENT_SOLUTIONS_TRLDUP |
| condition_name | STRING | TÃªn Äiá»u kiá»n Ã¡p dá»¥ng cho notification. | , null, templateStatus, status, language |
| condition_value | STRING | GiÃ¡ trá» cá»§a Äiá»u kiá»n á»©ng dá»¥ng cho notification. | , null, vie, success, true |
| os | STRING | Há» Äiá»u hÃ nh cá»§a thiáº¿t bá» nháº­n notification. | IOS, ANDROID, null, ios, android |
| touchpoint | STRING | Äiá»m cháº¡m (touchpoint) nÆ¡i notification ÄÆ°á»£c gá»­i tá»i. | null, inapp_message, outapp_message, header_banner, voucher_card |
| organic_user | BOOLEAN | NgÆ°á»i dÃ¹ng há»¯u cÆ¡, true: lÃ  ngÆ°á»i dÃ¹ng há»¯u cÆ¡, false: khÃ´ng pháº£i ngÆ°á»i dÃ¹ng há... | false, true |
| a30_user | BOOLEAN | NgÆ°á»i dÃ¹ng hoáº¡t Äá»ng trong 30 ngÃ y, true: lÃ  ngÆ°á»i dÃ¹ng A30, false: khÃ´ng pháº£i ngÆ... | true, false |
| mau_user | BOOLEAN | NgÆ°á»i dÃ¹ng hoáº¡t Äá»ng hÃ ng thÃ¡ng, true: lÃ  ngÆ°á»i dÃ¹ng MAU, false: khÃ´ng pháº£i ngÆ°á... | false, true |
| BE_request | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u Äáº¿n backend. | 0, 1, 2 |
| BE_accepted | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u ÄÆ°á»£c cháº¥p nháº­n bá»i backend. | 0, 1, 2 |
| BE_sent_outapp | INTEGER | Sá» lÆ°á»£ng notification ÄÆ°á»£c gá»­i ra ngoÃ i á»©ng dá»¥ng. | 0, 1, 2 |
| BE_sent_mqtt | INTEGER | Sá» lÆ°á»£ng notification ÄÆ°á»£c gá»­i qua MQTT. | 0, 1, 2 |
| BE_delivery_outapp | INTEGER | Sá» lÆ°á»£ng notification ÄÆ°á»£c giao thÃ nh cÃ´ng ra ngoÃ i á»©ng dá»¥ng. | 0, 1, 2 |
| BE_sent | INTEGER | Tá»ng sá» lÆ°á»£ng notification ÄÃ£ gá»­i. | 0, 1, 2 |
| BE_delivery | INTEGER | Sá» lÆ°á»£ng notification ÄÆ°á»£c giao thÃ nh cÃ´ng. | 0, 1, 2 |
| BE_read | INTEGER | Sá» lÆ°á»£ng notification ÄÆ°á»£c Äá»c. | 0, 1, 2 |
| BE_delete | INTEGER | Sá» lÆ°á»£ng notification bá» xÃ³a. | 0, 1, 2 |
| BE_delivery_mqtt_inapp | INTEGER | Sá» lÆ°á»£ng notification ÄÆ°á»£c giao thÃ nh cÃ´ng qua MQTT trong á»©ng dá»¥ng. | 0 |
| BE_out_of_quota | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u khÃ´ng thá» thá»±c hiá»n do vÆ°á»£t quÃ¡ quota. | 0, 1, 2 |
| BE_request_duplicated | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u bá» trÃ¹ng láº·p. | 0, 1, 2 |
| BE_ML_rejected | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u bá» tá»« chá»i bá»i há» thá»ng Machine Learning. | 0, 1, 4 |
| BE_sent_outapp_unallow_noti_setting | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do cáº¥u hÃ¬nh khÃ´ng cho phÃ©p... | 0, 1, 2 |
| BE_sent_outapp_preload_sucess | INTEGER | Sá» lÆ°á»£ng notification ÄÆ°á»£c gá»­i ra ngoÃ i á»©ng dá»¥ng thÃ nh cÃ´ng sau khi preload. | 0, 1, 2 |
| BE_auto_scheduled_success | INTEGER | Sá» lÆ°á»£ng notification tá»± Äá»ng lÃªn lá»ch gá»­i thÃ nh cÃ´ng. | 0, 1, 2 |
| BE_auto_scheduled_push_success | INTEGER | Sá» lÆ°á»£ng notification tá»± Äá»ng lÃªn lá»ch ÄÆ°á»£c Äáº©y thÃ nh cÃ´ng. | 0, 1, 3 |
| BE_risk_user_blacklist | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u bá» tá»« chá»i bá»i user náº±m trong danh sÃ¡ch Äen. | 0 |
| BE_unknow_error | INTEGER | Sá» lÆ°á»£ng lá»i khÃ´ng biáº¿t xáº£y ra. | 0 |
| BE_sent_outapp_fcm_token_empty | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do token FCM trá»ng. | 0, 1, 2 |
| BE_sent_outapp_fcm_token_invalid | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do token FCM khÃ´ng há»£p lá». | 0, 1, 2 |
| BE_mismatch_userID | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u khÃ´ng khá»p user ID. | 0 |
| BE_sent_outapp_fcm_service_unavailable | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do dá»ch vá»¥ FCM khÃ´ng kháº£... | 0, 1, 2 |
| BE_template_error | INTEGER | Sá» lÆ°á»£ng lá»i template xáº£y ra. | 0, 1, 2 |
| BE_invalid_content | INTEGER | Sá» lÆ°á»£ng ná»i dung khÃ´ng há»£p lá». | 0, 5 |
| BE_sent_outapp_fcm_token_unregistered | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do token FCM chÆ°a ÄÄng kÃ½. | 0, 1, 2 |
| BE_sent_outapp_fcm_invalid_json | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do JSON khÃ´ng há»£p lá». | 0 |
| BE_sent_outapp_fcm_bad_registration | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do lá»i ÄÄng kÃ½ FCM. | 0 |
| BE_sent_outapp_apn_exception | INTEGER | Sá» lÆ°á»£ng lá»i ngoáº¡i lá» xáº£y ra khi gá»­i notification qua APN. | 0 |
| BE_sent_mqtt_build_topic_failed | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u MQTT tháº¥t báº¡i do khÃ´ng thá» xÃ¢y dá»±ng chá»§ Äá». | 0, 1, 2 |
| BE_sent_outapp_apn_token_unregistered | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do token APN chÆ°a ÄÄng kÃ½. | 0 |
| BE_sent_outapp_apn_token_bad | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do token APN khÃ´ng há»£p lá». | 0 |
| BE_sent_outapp_apn_token_device | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do token APN khÃ´ng tÆ°Æ¡ng thÃ... | 0 |
| BE_sent_mqtt_push_failed | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u Äáº©y MQTT tháº¥t báº¡i. | 0, 1, 2 |
| BE_auto_scheduled_failed | INTEGER | Sá» lÆ°á»£ng notification tá»± Äá»ng lÃªn lá»ch gá»­i tháº¥t báº¡i. | 0 |
| BE_request_retry_max | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u khÃ´ng thá» thá»±c hiá»n do vÆ°á»£t quÃ¡ sá» láº§n thá»­ láº¡i tá»i Äa... | 0, 1, 2 |
| BE_sent_outapp_retry_max | INTEGER | Sá» lÆ°á»£ng notification khÃ´ng thá» gá»­i ra ngoÃ i á»©ng dá»¥ng do vÆ°á»£t quÃ¡ sá» láº§n thá»... | 0 |
| BE_sent_mqtt_conflig_version | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u MQTT tháº¥t báº¡i do xung Äá»t phiÃªn báº£n. | 0, 1, 2 |
| BE_auto_scheduled_invalid | INTEGER | Sá» lÆ°á»£ng notification tá»± Äá»ng lÃªn lá»ch khÃ´ng há»£p lá». | 0 |
| BE_out_of_survey_quota | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u khÃ´ng thá» thá»±c hiá»n do vÆ°á»£t quÃ¡ quota kháº£o sÃ¡t. | 0, 1, 5 |
| BE_store_center | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u ÄÆ°á»£c xá»­ lÃ½ thÃ´ng qua trung tÃ¢m lÆ°u trá»¯. | 0, 1, 2 |
| BE_store_center_rejected | INTEGER | Sá» lÆ°á»£ng yÃªu cáº§u bá» tá»« chá»i bá»i trung tÃ¢m lÆ°u trá»¯. | 0, 1, 2 |
| FB2_impression | INTEGER | Sá» lÆ°á»£ng hiá»n thá» cá»§a thÃ´ng bÃ¡o trÃªn Firebase phiÃªn báº£n 2. | 1, 0, 2 |
| FB2_click_read | INTEGER | Sá» lÆ°á»£ng nháº¥n Äá» Äá»c thÃ´ng bÃ¡o trÃªn Firebase phiÃªn báº£n 2. | 0, 1, 2 |
| FB2_click_more | INTEGER | Sá» lÆ°á»£t nháº¥n vÃ o nÃºt Äá» biáº¿t thÃªm thÃ´ng tin trÃªn Firebase phiÃªn báº£n 2. | 0, 1, 2 |
| FB2_click_delete | INTEGER | Sá» lÆ°á»£t nháº¥n Äá» xÃ³a thÃ´ng bÃ¡o trÃªn Firebase phiÃªn báº£n 2. | 0, 1, 2 |
| FB2_click_unread | INTEGER | Sá» lÆ°á»£t nháº¥n Äá» ÄÃ¡nh dáº¥u lÃ  chÆ°a Äá»c trÃªn Firebase phiÃªn báº£n 2. | 0, 1, 2 |
| FB2_click_back | INTEGER | Sá» lÆ°á»£t nháº¥n Äá» quay láº¡i trÃªn Firebase phiÃªn báº£n 2. | 0 |
| FB2_click_close | INTEGER | Sá» lÆ°á»£t nháº¥n Äá» ÄÃ³ng thÃ´ng bÃ¡o trÃªn Firebase phiÃªn báº£n 2. | 0, 1, 2 |
| FB2_click_small | INTEGER | Sá» lÆ°á»£t nháº¥n Äá» thu nhá» thÃ´ng bÃ¡o trÃªn Firebase phiÃªn báº£n 2. | 0 |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
