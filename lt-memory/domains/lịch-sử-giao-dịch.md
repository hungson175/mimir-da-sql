# Lịch sử giao dịch

**Domain ID:** `a9b8f0d4-dc8c-428a-ac05-8cbd29fc41e4`

## Description
Bảng lưu trữ dữ liệu log sự kiện lọc và gán nhãn của người dùng trên màn hình lịch sử giao dịch (LSGD - Lịch Sử Giao Dịch)

## Tables

### `momovn-prod.MBI_DA.LSGD_CTGD_FILTER_LABEL_RAW`
> Bảng lưu trữ dữ liệu log sự kiện lọc và gán nhãn của người dùng trên màn hình lịch sử giao dịch (LSGD - Lịch Sử Giao Dịch), mục đích:
- Phân tích hành vi người dùng khi tương tác với các filter, component trên màn hình lịch sử giao dịch.
- Đo lường hiệu quả của các CTA (Call To Action) như trò chuyện, chia bill.
- Cung cấp dữ liệu raw để training model recommendation hoặc phân loại nhóm người dùng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `event_id` | STRING | Mã định danh duy nhất cho mỗi sự kiện log trong hệ thống. | j2IcAnz_YFX2JMFrHJRSD, C_CLoEygwFQcN3lXeXHS8, vNS7mS7gduVtrdfm7vX8p |
| `user_id` | STRING | Mã định danh của người dùng trên MoMo, dùng để nhận diện khách hàng. | 38434219, 57621949, 13669408 |
| `date` | DATE | Ngày diễn ra sự kiện, dạng yyyy-MM-dd. | 2025-11-05, 2025-11-10, 2025-11-03 |
| `week` | DATE | Ngày bắt đầu tuần tương ứng với date (thứ Hai), dạng yyyy-MM-dd. | 2025-11-02, 2025-10-05, 2025-11-09 |
| `month` | DATE | Ngày đầu tiên của tháng tương ứng với date, dạng yyyy-MM-dd. | 2025-10-01, 2025-11-01, 2025-09-01 |
| `datetime` | DATETIME | Thời điểm chính xác đến giây phát sinh sự kiện. | 2025-11-04 17:38:35.060, 2025-11-09 22:01:16.488, 2025-11-05 20:36:36.124 |
| `global_trigger_id` | STRING | Mã trigger toàn cục định danh ngữ cảnh của màn hình lịch sử giao dịch. | transactionhistory1230b445d2419504624e8f6db4640f4ff071, transactionhistory124699f4cb2b411a090d3977ec16b01e8797, transactionhistory1246d0548e9b270475a4e3f12a03df7517e6 |
| `action_event` | STRING | Loại hành động diễn ra với component (Displayed/Clicked/Selected...). | Displayed, Clicked, Swiped |
| `block_event` | STRING | Tên khối giao diện nơi sự kiện phát sinh, ví dụ khối LSGD (Lịch Sử Giao Dịch). | LSGD, CTGD, Top nav |
| `description` | STRING | Nội dung mô tả chi tiết sự kiện dưới dạng văn bản ngắn. | Hiển thị màn hình lịch sử giao dịch, Hiển thị CTA chia bill, Hiển thị CTA chuyển tiền W2B |
| `service_name` | STRING | Tên dịch vụ ứng dụng đang liên quan đến sự kiện. | tabbar_transaction, transaction_history_detail, transaction_history_filter |
| `screen_name` | STRING | Tên màn hình nơi sự kiện xảy ra. | transaction_history, transaction_detail, transaction_history_filter |
| `event_name` | STRING | Tên sự kiện được log, ví dụ service_button_displayed. | service_screen_displayed, service_button_displayed, service_component_displayed |
| `component_name` | STRING | Tên component cụ thể nếu có, để trống nếu không áp dụng. | , calendar, soundbox_block |
| `component_type` | STRING | Loại component như Button, Icon, Label... ở đây đang bằng 'None'. | collapse, block, extend |
| `button_name` | STRING | Tên nút bấm liên quan đến sự kiện. | , action_button, date_selected |
| `icon_name` | STRING | Tên icon nếu có, hiện chưa được ghi nhận. | , expand_calendar, filter |
| `block_name` | STRING | Tên block con trong khối giao diện, nếu có. | , calendar, transaction_list |
| `status` | STRING | Trạng thái hiện tại của component hoặc màn hình. | success, fail |
| `page` | STRING | Số hoặc tên page nếu có paging; hiện chưa ghi nhận. | — |
| `popup_name` | STRING | Tên popup khi sự kiện phát sinh trên popup. | — |
| `checkbox_name` | STRING | Tên checkbox nếu sự kiện liên quan checkbox. | — |
| `action` | STRING | Hành động bổ xung đồng thời với action_event; hiện đang None. | on |
| `tab_name` | STRING | Tên tab trong màn hình có nhiều tab. |  |
| `type` | STRING | Loại hình nội dung giao diện hoặc hành động (chat_conversation, transfer_split_bill...). | transfer_split_bill, sacombank_cashout, transfer_p2p |
| `content_category` | STRING | Chuyên mục nội dung mà component/sự kiện thuộc về. | — |
| `field_name` | STRING | Tên trường dữ liệu nếu sự kiện gắn với nhập liệu form. | , search |
| `filter_name` | STRING | Tên filter hiện đang None (chưa gán giá trị). | — |
| `filter_type` | STRING | Loại filter (checkbox, radio, text...); đang None. | filter_by_month, filter_by_service, filter_by_account |
| `filter_value` | STRING | Giá trị lọc được chọn/sử dụng; đang None. | Tất cả, Ví MoMo, Nhận tiền |
| `source_from` | STRING | Nguồn module hoặc service tạo ra sự kiện. | home, others, billpaycenter |
| `trans_category` | STRING | Nhóm transaction liên quan, nếu có. | th_p2p_w2b_cat3, th_electricity_cat2, th_token_cat2 |
| `trans_status` | STRING | Trạng thái giao dịch liên quan (Success, Failed...). | success, pending, failed |
| `position` | STRING | Vị trí hiển thị của component trên UI. | 2, 3, 1 |
