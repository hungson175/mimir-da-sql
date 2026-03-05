# BU MDS: Notification for BU

**Domain ID:** `bcae6a77-3995-49e5-85ca-36b1ed664c13`

## Description
Bảng Notification chỉ tổng hợp số lượng notiid giống dạng event, không theo user do bảng user quá nặng không load nổi nên tất cả câu hỏi có chữ "user", "người dùng" đều trả kết quả null
Metric chính sẽ là  delivery outapp, Impression inapp, Click inapp, click outapp, CTR inapp, CTR outapp
Phải input đúng tên campaign name, templateid mới trả ra kết quả

## Tables

### `momovn-mds-dc.dwh.daily_notification_metrics`
> Bảng này thu thập các chỉ số thông báo hàng ngày trên hệ thống của MoMo. 
- Sử dụng để theo dõi và phân tích các nguồn thông báo (e.g., nguồn, tên chiến dịch, ID mẫu). 
- Giúp đánh giá hiệu quả thông báo với các chỉ số như số lần đọc, số lần gửi thành công và các lỗi gặp phải trong quá trình gửi thông báo. 
- Cung cấp thông tin liên quan đến người dùng như tỷ lệ người dùng organic, A30, MAU.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `event_date` | DATE | Ngày diễn ra sự kiện thông báo. | 2025-11-03, 2025-11-02, 2025-11-05 |
| `noti_source` | STRING | Nguồn của thông báo. | CAMPAIGN, TEMPLATE, JOURNEY |
| `campaign_name` | STRING | Tên chiến dịch liên quan đến thông báo. | null, JOURNEY_8ky1EXUs7URXBxuFYwMC_86170265388, JOURNEY_wBHUPDd7cBUwd9CIIjFP_87968145442 |
| `template_id` | STRING | ID của mẫu thông báo được sử dụng. | null, INVESTMENT_GOLDENPOCKET_QQVHOC, PAYMENT_SOLUTIONS_TRLDUP |
| `condition_name` | STRING | Tên điều kiện để kích hoạt thông báo. | , null, templateStatus |
| `condition_value` | STRING | Giá trị điều kiện để kích hoạt thông báo. | , null, vie |
| `os` | STRING | Hệ điều hành của thiết bị nhận thông báo. | IOS, ANDROID, null |
| `touchpoint` | STRING | Điểm chạm nơi thông báo được tương tác. | null, inapp_message, outapp_message |
| `organic_user` | BOOLEAN | Người dùng organic (true: có, false: không). | false, true |
| `a30_user` | BOOLEAN | Người dùng A30 (true: có, false: không). | true, false |
| `mau_user` | BOOLEAN | Người dùng MAU (true: có, false: không). | false, true |
| `BE_request` | INTEGER | Số lượng yêu cầu từ BE (Backend) để gửi thông báo. | 0, 1, 2 |
| `BE_accepted` | INTEGER | Số lượng yêu cầu từ BE đã được chấp nhận để gửi thông báo. | 0, 1, 2 |
| `BE_sent_outapp` | INTEGER | Số lượng thông báo được gửi ra khỏi ứng dụng qua BE. | 0, 1, 2 |
| `BE_sent_mqtt` | INTEGER | Số lượng thông báo được gửi qua MQTT từ BE. | 0, 1, 2 |
| `BE_delivery_outapp` | INTEGER | Số lượng thông báo được chuyển ra ngoài ứng dụng từ BE. | 0, 1, 2 |
| `BE_sent` | INTEGER | Số lượng thông báo đã được gửi qua BE. | 0, 1, 2 |
| `BE_delivery` | INTEGER | Số lượng thông báo đã được chuyển giao thành công qua BE. | 0, 1, 2 |
| `BE_read` | INTEGER | Số lượng thông báo đã được đọc từ BE. | 0, 1, 2 |
| `BE_delete` | INTEGER | Số lượng thông báo đã bị xóa qua BE. | 0, 1, 2 |
| `BE_delivery_mqtt_inapp` | INTEGER | Số lượng thông báo được chuyển qua MQTT trong ứng dụng. | 0 |
| `BE_out_of_quota` | INTEGER | Số lượng yêu cầu không được xử lý do vượt quá hạn mức quota. | 0, 1, 2 |
| `BE_request_duplicated` | INTEGER | Số lượng yêu cầu bị trùng lặp từ BE. | 0, 1, 2 |
| `BE_ML_rejected` | INTEGER | Số lượng thông báo bị từ chối qua ML (Machine Learning). | 0, 1, 2 |
| `BE_sent_outapp_unallow_noti_setting` | INTEGER | Số lượng thông báo từ BE không được gửi do cài đặt thông báo không cho phép. | 0, 1, 2 |
| `BE_sent_outapp_preload_sucess` | INTEGER | Số lượng thông báo từ BE được tải trước thành công. | 0, 1, 2 |
| `BE_auto_scheduled_success` | INTEGER | Số lượng thông báo được tự động lập lịch thành công qua BE. | 0, 1, 2 |
| `BE_auto_scheduled_push_success` | INTEGER | Số lượng thông báo được đẩy tự động lập lịch thành công qua BE. | 0, 1, 2 |
| `BE_risk_user_blacklist` | INTEGER | Số lượng người dùng rủi ro trong danh sách đen không nhận được thông báo. | 0 |
| `BE_unknow_error` | INTEGER | Số lượng lỗi không xác định xảy ra khi gửi thông báo qua BE. | 0 |
| `BE_sent_outapp_fcm_token_empty` | INTEGER | Số lượng thông báo không gửi được do không có mã token FCM. | 0, 1, 2 |
| `BE_sent_outapp_fcm_token_invalid` | INTEGER | Số lượng thông báo không gửi được do mã token FCM không hợp lệ. | 0, 1, 2 |
| `BE_mismatch_userID` | INTEGER | Số lượng thông báo không gửi được do ID người dùng không khớp. | 0 |
| `BE_sent_outapp_fcm_service_unavailable` | INTEGER | Số lượng thông báo không gửi được do dịch vụ FCM không khả dụng. | 0, 1, 2 |
| `BE_template_error` | INTEGER | Số lượng lỗi liên quan đến mẫu thông báo. | 0, 1, 2 |
| `BE_invalid_content` | INTEGER | Số lượng thông báo chứa nội dung không hợp lệ. | 0, 5, 2 |
| `BE_sent_outapp_fcm_token_unregistered` | INTEGER | Số lượng thông báo không gửi được do mã token FCM chưa đăng ký. | 0, 1, 2 |
| `BE_sent_outapp_fcm_invalid_json` | INTEGER | Số lượng thông báo không gửi được do mã FCM chứa định dạng JSON không hợp lệ. | 0 |
| `BE_sent_outapp_fcm_bad_registration` | INTEGER | Số lượng thông báo không gửi được do lỗi đăng ký mã token FCM. | 0 |
| `BE_sent_outapp_apn_exception` | INTEGER | Số lượng thông báo không gửi được do lỗi ngoại lệ APN. | 0 |
| `BE_sent_mqtt_build_topic_failed` | INTEGER | Số lượng thông báo không gửi được do lỗi tạo topic MQTT. | 0, 1, 2 |
| `BE_sent_outapp_apn_token_unregistered` | INTEGER | Số lượng thông báo không gửi được do mã token APN chưa đăng ký. | 0 |
| `BE_sent_outapp_apn_token_bad` | INTEGER | Số lượng thông báo không gửi được do mã token APN bị lỗi. | 0 |
| `BE_sent_outapp_apn_token_device` | INTEGER | Số lượng thông báo không gửi được do lỗi mã token thiết bị APN. | 0 |
| `BE_sent_mqtt_push_failed` | INTEGER | Số lượng thông báo không đẩy được qua MQTT. | 0, 1, 17 |
| `BE_auto_scheduled_failed` | INTEGER | Số lượng thông báo tự động lập lịch bị lỗi. | 0 |
| `BE_request_retry_max` | INTEGER | Số lượng yêu cầu retry tối đa từ BE. | 0, 1, 2 |
| `BE_sent_outapp_retry_max` | INTEGER | Số lượng thông báo gửi ra ngoài retry tối đa từ BE. | 0 |
| `BE_sent_mqtt_conflig_version` | INTEGER | Số lượng thông báo không gửi được do xung đột phiên bản MQTT. | 0, 1, 2 |
| `BE_auto_scheduled_invalid` | INTEGER | Số lượng thông báo lập lịch tự động không hợp lệ. | 0 |
| `BE_out_of_survey_quota` | INTEGER | Số lượng yêu cầu không xử lý được do vượt hạn mức khảo sát. | 0, 1, 2 |
| `BE_store_center` | INTEGER | Số lượng thông báo xử lý qua trung tâm lưu trữ. | 0, 1, 2 |
| `BE_store_center_rejected` | INTEGER | Số lượng thông báo bị từ chối bởi trung tâm lưu trữ. | 0, 1, 2 |
| `FB2_impression` | INTEGER | Số lượng lượt hiển thị thông báo qua FB2. | 1, 0, 2 |
| `FB2_click_read` | INTEGER | Số lượng lần nhấn đọc thông báo qua FB2. | 0, 1, 2 |
| `FB2_click_more` | INTEGER | Số lượng lần nhấn thêm thông tin thông báo qua FB2. | 0, 1, 2 |
| `FB2_click_delete` | INTEGER | Số lượng lần nhấn xóa thông báo qua FB2. | 0, 1, 2 |
| `FB2_click_unread` | INTEGER | Số lượng lần nhấn đánh dấu chưa đọc thông báo qua FB2. | 0, 1, 2 |
| `FB2_click_back` | INTEGER | Số lượng lần nhấn quay lại thông báo qua FB2. | 0 |
| `FB2_click_close` | INTEGER | Số lượng lần nhấn đóng thông báo qua FB2. | 0, 1, 2 |
| `FB2_click_small` | INTEGER | Số lượng lần nhấn thu nhỏ thông báo qua FB2. | 0 |
