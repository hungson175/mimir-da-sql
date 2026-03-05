# BU MDS: Notification for Platform

**Domain ID:** `750780b7-b20f-46b6-ab05-2a4241b591c6`

## Description
BU MDS: Notification for Platform - Chỉ dành cho core team noti platform! A/c BU hay PO cell team vui lòng request ở BU MDS: Notification for BU!

Bảng Notification chỉ tổng hợp số lượng notiid giống dạng event, không theo user do bảng user quá nặng không load nổi nên tất cả câu hỏi có chữ "user", "người dùng" đều trả kết quả null
Metric chính sẽ là  delivery outapp, Impression inapp, Click inapp, click outapp, CTR inapp, CTR outapp

## Tables

### `momovn-mds-dc.dwh.daily_notification_metrics`
> Bảng daily_notification_metrics chứa các dữ liệu thống kê hàng ngày liên quan đến quá trình gửi notification trong hệ thống MoMo. Bảng này có thể được sử dụng để phân tích hiệu suất của các chiến dịch notification, theo dõi các lỗi phát sinh trong quá trình gửi, và tối ưu hóa các chiến dịch quảng cáo và truyền thông.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `event_date` | DATE | Ngày diễn ra sự kiện. | 2025-11-02, 2025-11-03, 2025-11-04 |
| `noti_source` | STRING | Nguồn gốc của notification. | CAMPAIGN, TEMPLATE, JOURNEY |
| `campaign_name` | STRING | Tên của chiến dịch notification. | null, JOURNEY_8ky1EXUs7URXBxuFYwMC_86170265388, JOURNEY_uSqWJTgoVzxv5GPb4WeX_87285782513 |
| `template_id` | STRING | Mã định danh của mẫu template được sử dụng cho notification. | null, INVESTMENT_GOLDENPOCKET_QQVHOC, PAYMENT_SOLUTIONS_TRLDUP |
| `condition_name` | STRING | Tên điều kiện áp dụng cho notification. | , null, templateStatus |
| `condition_value` | STRING | Giá trị của điều kiện ứng dụng cho notification. | , null, vie |
| `os` | STRING | Hệ điều hành của thiết bị nhận notification. | IOS, ANDROID, null |
| `touchpoint` | STRING | Điểm chạm (touchpoint) nơi notification được gửi tới. | null, inapp_message, outapp_message |
| `organic_user` | BOOLEAN | Người dùng hữu cơ, true: là người dùng hữu cơ, false: không phải người dùng hữu cơ. | false, true |
| `a30_user` | BOOLEAN | Người dùng hoạt động trong 30 ngày, true: là người dùng A30, false: không phải người dùng A30. | true, false |
| `mau_user` | BOOLEAN | Người dùng hoạt động hàng tháng, true: là người dùng MAU, false: không phải người dùng MAU. | false, true |
| `BE_request` | INTEGER | Số lượng yêu cầu đến backend. | 0, 1, 2 |
| `BE_accepted` | INTEGER | Số lượng yêu cầu được chấp nhận bởi backend. | 0, 1, 2 |
| `BE_sent_outapp` | INTEGER | Số lượng notification được gửi ra ngoài ứng dụng. | 0, 1, 2 |
| `BE_sent_mqtt` | INTEGER | Số lượng notification được gửi qua MQTT. | 0, 1, 2 |
| `BE_delivery_outapp` | INTEGER | Số lượng notification được giao thành công ra ngoài ứng dụng. | 0, 1, 2 |
| `BE_sent` | INTEGER | Tổng số lượng notification đã gửi. | 0, 1, 2 |
| `BE_delivery` | INTEGER | Số lượng notification được giao thành công. | 0, 1, 2 |
| `BE_read` | INTEGER | Số lượng notification được đọc. | 0, 1, 2 |
| `BE_delete` | INTEGER | Số lượng notification bị xóa. | 0, 1, 2 |
| `BE_delivery_mqtt_inapp` | INTEGER | Số lượng notification được giao thành công qua MQTT trong ứng dụng. | 0 |
| `BE_out_of_quota` | INTEGER | Số lượng yêu cầu không thể thực hiện do vượt quá quota. | 0, 1, 2 |
| `BE_request_duplicated` | INTEGER | Số lượng yêu cầu bị trùng lặp. | 0, 1, 2 |
| `BE_ML_rejected` | INTEGER | Số lượng yêu cầu bị từ chối bởi hệ thống Machine Learning. | 0, 1, 4 |
| `BE_sent_outapp_unallow_noti_setting` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do cấu hình không cho phép. | 0, 1, 2 |
| `BE_sent_outapp_preload_sucess` | INTEGER | Số lượng notification được gửi ra ngoài ứng dụng thành công sau khi preload. | 0, 1, 2 |
| `BE_auto_scheduled_success` | INTEGER | Số lượng notification tự động lên lịch gửi thành công. | 0, 1, 2 |
| `BE_auto_scheduled_push_success` | INTEGER | Số lượng notification tự động lên lịch được đẩy thành công. | 0, 1, 3 |
| `BE_risk_user_blacklist` | INTEGER | Số lượng yêu cầu bị từ chối bởi user nằm trong danh sách đen. | 0 |
| `BE_unknow_error` | INTEGER | Số lượng lỗi không biết xảy ra. | 0 |
| `BE_sent_outapp_fcm_token_empty` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do token FCM trống. | 0, 1, 2 |
| `BE_sent_outapp_fcm_token_invalid` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do token FCM không hợp lệ. | 0, 1, 2 |
| `BE_mismatch_userID` | INTEGER | Số lượng yêu cầu không khớp user ID. | 0 |
| `BE_sent_outapp_fcm_service_unavailable` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do dịch vụ FCM không khả dụng. | 0, 1, 2 |
| `BE_template_error` | INTEGER | Số lượng lỗi template xảy ra. | 0, 1, 2 |
| `BE_invalid_content` | INTEGER | Số lượng nội dung không hợp lệ. | 0, 5 |
| `BE_sent_outapp_fcm_token_unregistered` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do token FCM chưa đăng ký. | 0, 1, 2 |
| `BE_sent_outapp_fcm_invalid_json` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do JSON không hợp lệ. | 0 |
| `BE_sent_outapp_fcm_bad_registration` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do lỗi đăng ký FCM. | 0 |
| `BE_sent_outapp_apn_exception` | INTEGER | Số lượng lỗi ngoại lệ xảy ra khi gửi notification qua APN. | 0 |
| `BE_sent_mqtt_build_topic_failed` | INTEGER | Số lượng yêu cầu MQTT thất bại do không thể xây dựng chủ đề. | 0, 1, 2 |
| `BE_sent_outapp_apn_token_unregistered` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do token APN chưa đăng ký. | 0 |
| `BE_sent_outapp_apn_token_bad` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do token APN không hợp lệ. | 0 |
| `BE_sent_outapp_apn_token_device` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do token APN không tương thích với thiết bị. | 0 |
| `BE_sent_mqtt_push_failed` | INTEGER | Số lượng yêu cầu đẩy MQTT thất bại. | 0, 1, 2 |
| `BE_auto_scheduled_failed` | INTEGER | Số lượng notification tự động lên lịch gửi thất bại. | 0 |
| `BE_request_retry_max` | INTEGER | Số lượng yêu cầu không thể thực hiện do vượt quá số lần thử lại tối đa. | 0, 1, 2 |
| `BE_sent_outapp_retry_max` | INTEGER | Số lượng notification không thể gửi ra ngoài ứng dụng do vượt quá số lần thử lại tối đa. | 0 |
| `BE_sent_mqtt_conflig_version` | INTEGER | Số lượng yêu cầu MQTT thất bại do xung đột phiên bản. | 0, 1, 2 |
| `BE_auto_scheduled_invalid` | INTEGER | Số lượng notification tự động lên lịch không hợp lệ. | 0 |
| `BE_out_of_survey_quota` | INTEGER | Số lượng yêu cầu không thể thực hiện do vượt quá quota khảo sát. | 0, 1, 5 |
| `BE_store_center` | INTEGER | Số lượng yêu cầu được xử lý thông qua trung tâm lưu trữ. | 0, 1, 2 |
| `BE_store_center_rejected` | INTEGER | Số lượng yêu cầu bị từ chối bởi trung tâm lưu trữ. | 0, 1, 2 |
| `FB2_impression` | INTEGER | Số lượng hiển thị của thông báo trên Firebase phiên bản 2. | 1, 0, 2 |
| `FB2_click_read` | INTEGER | Số lượng nhấn để đọc thông báo trên Firebase phiên bản 2. | 0, 1, 2 |
| `FB2_click_more` | INTEGER | Số lượt nhấn vào nút để biết thêm thông tin trên Firebase phiên bản 2. | 0, 1, 2 |
| `FB2_click_delete` | INTEGER | Số lượt nhấn để xóa thông báo trên Firebase phiên bản 2. | 0, 1, 2 |
| `FB2_click_unread` | INTEGER | Số lượt nhấn để đánh dấu là chưa đọc trên Firebase phiên bản 2. | 0, 1, 2 |
| `FB2_click_back` | INTEGER | Số lượt nhấn để quay lại trên Firebase phiên bản 2. | 0 |
| `FB2_click_close` | INTEGER | Số lượt nhấn để đóng thông báo trên Firebase phiên bản 2. | 0, 1, 2 |
| `FB2_click_small` | INTEGER | Số lượt nhấn để thu nhỏ thông báo trên Firebase phiên bản 2. | 0 |
