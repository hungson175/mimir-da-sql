# Chatbot Moni

**Domain ID:** `9066c2ad-5109-4fa9-abc0-06d85c6eed7e`

## Description
Chatbot trả lời các câu hỏi liên quan đến sản phẩm Moni bao gồm user, hội thoại và event tracking

## Tables

### `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
> Bảng ghi lại các nhật ký của các cuộc hội thoại giữa người dùng và chatbot Moni của dịch vụ quản lý chi tiêu QLCT. Thông tin trong bảng này có thể được sử dụng để theo dõi và phân tích các tương tác của người dùng với Moni, đánh giá hiệu quả của các kịch bản giao tiếp và hiểu hành vi người dùng. Các mục đích và ứng dụng tiềm năng của bảng này bao gồm:
 - Phân tích thời gian và nội dung cuộc hội thoại của người dùng
 - Đánh giá tình trạng và hiệu suất của từng cuộc trò chuyện
 - Tìm hiểu xu hướng và phân loại người dùng theo nhóm tuổi, giới tính, và khu vực.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `user_id` | STRING | ID của userID của user | 49573892, 39231774, 98614847 |
| `conversation_id` | STRING | ID đoạn hội thoạiID đoạn hội thoại | botQlct.31784490.8327c2956de949aca9a18d27d687189e, c8d3c82f-0ec1-479b-88af-4042febde75f, 246872b8-f0c8-4eae-aa79-fbf995b668a0 |
| `event_id` | STRING | ID eventID event | 03e68174-032d-404c-ad9a-ca23ca03ad96, 544cefa7-ccff-46e8-b2b1-ce3a7ecaf3fe, d55b7733-8967-46be-9f4e-33a2fd591f49 |
| `user_message` | STRING | Tin nhắn của usertin nhắn của user | DEFAULT_START_MESSAGE, Moni, vào vai một chuyên gia tài chính cá nhân và nói cho mình: Nếu có 10.000.000đ nhàn rỗi thì mình nên làm gì?, AI Moni có thể giúp tôi tiết kiệm tiền một tháng bằng cách nào? |
| `response_message` | STRING | Tin nhắn Moni trả lờitin nhắn Moni trả lời | — |
| `state` | STRING | Trạng thái hội thoại tại thời điểm | , Answering_Machine, About_Moni |
| `state2` | STRING | Trạng thái thứ hai của hội thoại | , skill_add_transaction_2, skill_optimize_food_expense |
| `start_time` | TIMESTAMP | Thời gian bắt đầu chatthời gian bắt đầu chat | 2025-06-16 18:24:25+00, 2024-08-22 00:57:59+00, 2025-07-31 12:42:24+00 |
| `end_time` | TIMESTAMP | Thời gian kết thúc chatthời gian kết thúc chat | 2025-06-16 18:26:55+00, 2025-08-05 20:48:31+00, 2025-08-05 20:14:06+00 |
| `event_date` | DATE | Ngày vào Moni chatngày vào Moni chat | 2025-09-20, 2025-09-21, 2025-09-22 |
| `request_flow` | STRING | Luồng yêu cầu trong hội thoại | GUIDELINE, FREE TEXT,  |
| `response_flow` | STRING | Luồng phản hồi trong hội thoại | GREETING CARD  |
| `duration` | FLOAT | Khoảng thời gian chatkhoảng thời gian chat | 3.786, 4.992, 4.199 |
| `topic` | STRING | Chủ đề đoạn chattopic đoạn chat | Khác, Quản lý ngân sách, Theo dõi & phân tích chi tiêu |
| `monthly_user_type` | STRING | User type của MONI theo tháng. Bao gồm: NEW \| RETAIN \| ACTIVEUser type của MONI theo tháng. Bao gồm: NEW \| RETAIN \| ACTIVE | new, retain, reactivate |
| `gender` | STRING | Giới tính của người dùnggiới tính | male, female, unknown |
| `age` | INTEGER | Tuổi của người dùngtuổi | 19, 20, 21 |
| `age_group` | STRING | Nhóm tuổi của người dùngnhóm tuổi | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [5]. 31 - 35 y/o |
| `region` | STRING | Khu vực nơi người dùng sinh sốngkhu vực | Đông Nam Bộ, Đồng bằng sông Hồng, Đồng bằng sông Cửu Long |
| `city` | STRING | Tỉnh nơi người dùng sinh sốngtỉnh | Hồ Chí Minh, Hà Nội, Bình Dương |
| `is_a30_user` | BOOLEAN | User có giao dịch trong 30 ngày gần đây: true - Có, false - KhôngUser có giao dịch trong 30 ngày gần đây: true \| false | true, false |
| `source` | STRING | Nguồn traffic. Người dùng đến Moni từ nguồn nàoSource traffic. User đến Moni từ source nào | home_momo_v2, look_back_month, wheel_100 |
| `sub_bot_id` | STRING | Sub bot id của Monisub bot id của Moni | , 853724f3-1adc-449d-aeac-de6cc5ba3ea2, ccefae21-ee1d-4fbf-8b84-363e609e87e8 |

### `momovn-prod.MBI_DA.MONI_L3_LABEL_EVENT`
> Bảng này lưu trữ các sự kiện (events) trong MoMo. Thông tin trong bảng này bao gồm ID của sự kiện, thông tin người dùng, thời gian diễn ra sự kiện, nguồn và hành động liên quan đến sự kiện. 
Các thông tin có thể được lấy từ bảng này bao gồm: 
- Lịch sử sự kiện của người dùng 
- Phân tích hành vi người dùng trên ứng dụng MoMo 
- Sự tương tác của người dùng với các thành phần ứng dụng (screen, tab, button, icon, etc.)

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `event_id` | STRING | ID định danh của EventID định danh của Event | , 3Ti5qKeOok0rV5hK9RFhh, hcXO1W1qulrt2LKa4LEoz |
| `agent_id` | STRING | ID định danh của UserID định danh của User | 35197292, 39231774, 98614847 |
| `datetime` | DATETIME | Thời gian thực hiện event dạng datetimeThời gian thực hiện event dạng datetime | 2026-01-19 12:23:32.559, 2025-11-04 00:19:09.543, 2025-11-01 20:32:09.769 |
| `date` | DATE | Ngày thực hiện eventNgày thực hiện event | 2025-10-10, 2025-10-15, 2026-02-02 |
| `month` | DATE | Tháng thực hiện eventTháng thực hiện event | 2025-10-01, 2026-01-01, 2025-11-01 |
| `etl_date` | DATE | Ngày upload datasetNgày upload dataset | 2025-10-10, 2025-10-15, 2026-02-02 |
| `service_name` | STRING | Tên serviceTên service | vn.momo.moni_ai_assistant, chatbot_botQlct |
| `event_name` | STRING | Tên eventTên event | service_component_displayed, service_icon_displayed, service_screen_displayed |
| `screen_name` | STRING | Tên màn hìnhTên màn hình | moni_extension, HomeScreen, moni_chat_window |
| `component_name` | STRING | Tên componentTên component | , moni_home_momo, list_suggestion |
| `component_type` | STRING | Loại componentLoại component | widget, chat_window, block |
| `block_name` | STRING | Tên blockTên block |  |
| `tab_name` | STRING | Tên tabTên tab |  |
| `icon_name` | STRING | Tên iconTên icon | , Moni_floating, close |
| `button_name` | STRING | Tên buttonTên button |  |
| `global_trigger_id` | STRING | ID định danh cho descriptionID định danh cho description | chatbot1007e292f4a4c6a26f795f3713e9d334a5e0, mobilecenter1231bcbc8e145039cca1602d05cd28413c97, groupfund1231bcbc8e145039cca1602d05cd28413c97 |
| `field_name` | STRING | Tên fieldTên field |  |
| `position` | STRING | Vị trí eventVị trí event | MONI_DATA, FUND_DETAIL, HOME_EXPENSE_V2 |
| `appId` | STRING | ID của app v1ID của app v1 | vn.momo.mobilecenter, vn.momo.groupfund, vn.momo.expense |
| `app_id` | STRING | ID của app v2ID của app v2 | vn.momo.chatbot, vn.momo.moni_ai_assistant |
| `source` | STRING | Nguồn của eventNguồn của event | tabbar_transaction, wheel_100, service_widget |
| `source_from` | STRING | Nguồn bắt đầu eventNguồn bắt đầu event | home_momo_v2, wheel_100, social_chat |
| `status` | STRING | Trạng thái của eventTrạng thái của event | — |
| `action` | STRING | Hành động của eventHành động của event | — |
| `content_category` | STRING | Nội dung của categoryNội dung của category | — |
| `active` | STRING | Trạng thái hoạt động của eventTrạng thái hoạt động của event | — |
| `time_load` | STRING | Thời gian user load sử dụng eventThời gian user load sử dụng event | 7512, 7519, 6767 |
| `model` | STRING | Số hiệu của mô hình AI sử dụngSố hiệu của mô hình AI sử dụng | gpt-4.1, gpt-4.o mini, gpt-4o-mini |
| `lable_name` | STRING | Tên nhãn eventTên nhãn event | — |
| `error_desc` | STRING | Mã lỗi của eventMã lỗi của event | 5042, 5040 |
| `id` | INTEGER | ID định danh mô tả của eventID định danh mô tả của event | 32, 29, 41 |
| `block` | STRING | Nhóm eventNhóm event | Widget, Moni Miniapp |
| `description` | STRING | Tên mô tả được đặt của eventTên mô tả được đặt của event | [Floating] Impress (hien thi) Icon/Banner Moni, [Home QLCT] Hiển thị thành công Widget Moni, [List suggestion] Hiển thị Widget list suggestion |

### `momovn-prod.MBI_DA.TFBV_DAILY_ACTIVE_USER`
> Bảng này chứa thông tin về người dùng hoạt động hàng ngày trên MoMo. Dữ liệu trong bảng này cung cấp chi tiết về các tương tác hàng ngày của người dùng với sản phẩm MoMo. 

Thông tin có thể lấy từ bảng này bao gồm: 
- Lịch sử hoạt động hàng ngày theo mã định danh (AGENT_ID) của mỗi người dùng 
- Ngày chạy ETL và cập nhật thông tin 
- Các loại sản phẩm mà người dùng tương tác và hành động của họ 
- Nguồn dữ liệu của hành động và tương tác.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo, đại diện cho một người dùng duy nhất. | 35831203, 15910557, 38502644 |
| `ETL_DATE` | DATE | Ngày chạy ETL và cập nhật thông tin. | 2026-02-02, 2026-02-03, 2026-02-01 |
| `PRODUCT` | STRING | Tên sản phẩm mà người dùng tương tác trong ngày. | QLCT, MONI |
| `DATA_SOURCE` | STRING | Nguồn dữ liệu của các hành động và tương tác của người dùng. | EVENT, BE |
| `ACTION` | STRING | Hành động mà người dùng thực hiện đối với sản phẩm. | VISIT, CHAT |

## Memory
*2 entries — user-trained knowledge*

1. Khi xử lý số lượng tin nhắn, loại trừ user_message là NULL và 'DEFAULT_START_MESSAGE' _2026-02-04_
2. Khi xử lý số lượng tin nhắn, loại trừ user_message là NULL và 'DEFAULT_START_MESSAGE' _2025-11-18_
