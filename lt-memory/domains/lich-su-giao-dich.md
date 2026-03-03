# Domain: Lịch sử giao dịch

## Identity
- **Domain ID:** `a9b8f0d4-dc8c-428a-ac05-8cbd29fc41e4`
- **Description:** Bảng lưu trữ dữ liệu log sự kiện lọc và gán nhãn của người dùng trên màn hình lịch sử giao dịch (LSGD - Lịch Sử Giao Dịch)
- **Tables:** 1
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.MBI_DA.LSGD_CTGD_FILTER_LABEL_RAW
> Bảng lưu trữ dữ liệu log sự kiện lọc và gán nhãn của người dùng trên màn hình lịch sử giao dịch (LSGD - Lịch Sử Giao Dịch), mục đích:
- Phân tích hành vi người dùng khi tương tác với các filter, component trên màn hình lịch sử giao dịch.
- Đo lường hiệu quả của các CTA (Call To Action) như trò chuyệ...

| Column | Description | Examples |
|--------|-------------|----------|
| event_id | Mã định danh duy nhất cho mỗi sự kiện log trong hệ thống. | j2IcAnz_YFX2JMFrHJRSD, C_CLoEygwFQcN3lXeXHS8, vNS7mS7gduVtrdfm7vX8p |
| user_id | Mã định danh của người dùng trên MoMo, dùng để nhận diện khách hàng. | 38434219, 57621949, 13669408 |
| date | Ngày diễn ra sự kiện, dạng yyyy-MM-dd. | 2025-11-05, 2025-11-10, 2025-11-03 |
| week | Ngày bắt đầu tuần tương ứng với date (thứ Hai), dạng yyyy-MM-dd. | 2025-11-02, 2025-10-05, 2025-11-09 |
| month | Ngày đầu tiên của tháng tương ứng với date, dạng yyyy-MM-dd. | 2025-10-01, 2025-11-01, 2025-09-01 |
| datetime | Thời điểm chính xác đến giây phát sinh sự kiện. | 2025-11-04 17:38:35.060, 2025-11-09 22:01:16.488, 2025-11-05 20:36:36.124 |
| global_trigger_id | Mã trigger toàn cục định danh ngữ cảnh của màn hình lịch sử giao dịch. | transactionhistory1230b445d2419504624e8f6db4640f4ff071, transactionhistory124699f4cb2b411a090d3977ec16b01e8797, transactionhistory1246d0548e9b270475a4e3f12a03df7517e6 |
| action_event | Loại hành động diễn ra với component (Displayed/Clicked/Selected...). | Displayed, Clicked, Swiped, Screenshot |
| block_event | Tên khối giao diện nơi sự kiện phát sinh, ví dụ khối LSGD (Lịch Sử Giao Dịch). | LSGD, CTGD, Top nav, Filter |
| description | Nội dung mô tả chi tiết sự kiện dưới dạng văn bản ngắn. | Hiển thị màn hình lịch sử giao dịch, Hiển thị CTA chia bill, Hiển thị CTA chuyển tiền W2B |
| service_name | Tên dịch vụ ứng dụng đang liên quan đến sự kiện. | tabbar_transaction, transaction_history_detail, transaction_history_filter |
| screen_name | Tên màn hình nơi sự kiện xảy ra. | transaction_history, transaction_detail, transaction_history_filter, download_statement |
| event_name | Tên sự kiện được log, ví dụ service_button_displayed. | service_screen_displayed, service_button_displayed, service_component_displayed, service_block_clicked |
| component_name | Tên component cụ thể nếu có, để trống nếu không áp dụng. | , calendar, soundbox_block |
| component_type | Loại component như Button, Icon, Label... ở đây đang bằng 'None'. | collapse, block, extend, datepicker |
| button_name | Tên nút bấm liên quan đến sự kiện. | , action_button, date_selected, support |
| icon_name | Tên icon nếu có, hiện chưa được ghi nhận. | , expand_calendar, filter |
| block_name | Tên block con trong khối giao diện, nếu có. | , calendar, transaction_list, upcoming |
| status | Trạng thái hiện tại của component hoặc màn hình. | success, fail |
| page | Số hoặc tên page nếu có paging; hiện chưa ghi nhận. | — |
| popup_name | Tên popup khi sự kiện phát sinh trên popup. | — |
| checkbox_name | Tên checkbox nếu sự kiện liên quan checkbox. | — |
| action | Hành động bổ xung đồng thời với action_event; hiện đang None. | on |
| tab_name | Tên tab trong màn hình có nhiều tab. |  |
| type | Loại hình nội dung giao diện hoặc hành động (chat_conversation, transfer_split_bill...). | transfer_split_bill, sacombank_cashout, transfer_p2p, native |
| content_category | Chuyên mục nội dung mà component/sự kiện thuộc về. | — |
| field_name | Tên trường dữ liệu nếu sự kiện gắn với nhập liệu form. | , search |
| filter_name | Tên filter hiện đang None (chưa gán giá trị). | — |
| filter_type | Loại filter (checkbox, radio, text...); đang None. | filter_by_month, filter_by_service, filter_by_account, filter_by_status |
| filter_value | Giá trị lọc được chọn/sử dụng; đang None. | Tất cả, Ví MoMo, Nhận tiền, Tháng 8/2025 |
| source_from | Nguồn module hoặc service tạo ra sự kiện. | home, others, billpaycenter, chat_conversation |
| trans_category | Nhóm transaction liên quan, nếu có. | th_p2p_w2b_cat3, th_electricity_cat2, th_token_cat2, th_transfer_via_link_cat2 |
| trans_status | Trạng thái giao dịch liên quan (Success, Failed...). | success, pending, failed |
| position | Vị trí hiển thị của component trên UI. | 2, 3, 1 |

## Suggested Probe Questions

- Status: **Not yet probed**
