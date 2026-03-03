# Domain: BU Growth Platform: Expense Management (Moni/QLCT)

## Identity
- **Domain ID:** `af241589-f5be-4b97-8928-fe0823c8dc75`
- **Official Name:** BU Growth Platform: Expense Management
- **Description:** Phân tích về sản phẩm Quản Lý Chi tiêu bao gồm:
- Các thông tin về người dùng
- Các thông tin về event của sản phẩm
- Các thông tin về các tính năng của sản phẩm
- **Metadata fetched:** 2026-02-25 (from API)

## Tables & Columns

### momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT
> Bảng chứa thông tin về lượt truy cập của người dùng vào dịch vụ quản lý chi tiêu (QLCT) trên MoMo. 
Đây là bảng giúp theo dõi và phân tích hành vi người dùng qua các chỉ số: 
- Số lượt truy cập và thờ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| AGENT_ID | STRING | ID của UserID của User | 38502644, 35831203, 25103427 |
| MONTH | DATE | Tháng có visit TFBVTháng có visit TFBV | 2025-12-01, 2025-09-01, 2025-10-01 |
| DATE_WEEK | DATE | Tuần có visit TFBVTuần có visit TFBV | 2025-08-31, 2025-09-28, 2025-12-28 |
| DAY | INTEGER | Thứ tự ngày trong tháng có visit TFBV | 3, 1, 5 |
| PRODUCT | STRING | Sản phẩm user dùng. Bao gồm: QLCT | MONI | QLCT, MONI |
| ACTION | STRING | Hành động của user. Bao gồm: VISIT | CHATHành đông của user. Bao gồm: VISIT | CHAT | VISIT, CHAT |
| FIRST_MONTH_TFBV | DATE | Tháng đầu tiên user visit TFBV | 2024-09-01, 2024-10-01, 2024-11-01 |
| FIRST_MONTH_QLCT | DATE | Tháng đầu tiên user visit QLCT | 2024-09-01, 2024-10-01, 2024-11-01 |
| FIRST_MONTH_MONI | DATE | Tháng đầu tiên user visit MONI | 2025-10-01, 2025-09-01, 2025-11-01 |
| USER_TYPE_TFBV | STRING | Loại người dùng của TFBV theo tháng. Bao gồm: NEW | RETAIN | REACTIVEUser type của TFBV theo tháng. ... | RETAIN, REACTIVE, NEW |
| USER_TYPE_QLCT | STRING | Loại người dùng của QLCT theo tháng. Bao gồm: NEW | RETAIN | REACTIVEUser type của QLCT theo tháng. ... | RETAIN, REACTIVE, NEW |
| USER_TYPE_MONI | STRING | Loại người dùng của MONI theo tháng. Bao gồm: NEW | RETAIN | REACTIVEUser type của MONI theo tháng. ... | NEW, RETAIN, REACTIVE |
| MONTHLY_RETAIN_TFBV | STRING | User TFBV có quay lại vào tháng tiếp theo | 47712132, 15910557, 49573892 |
| MONTHLY_RETAIN_QLCT | STRING | User QLCT có quay lại vào tháng tiếp theo | 55215552, 44632204, 46031922 |
| MONTHLY_RETAIN_MONI | STRING | User MONI có quay lại vào tháng tiếp theo | 47712132, 35831203, 25103427 |
| WEEKLY_RETAIN_TFBV | STRING | User TFBV có quay lại vào tuần tiếp theo | 25103427, 39231774, 47712132 |
| WEEKLY_RETAIN_QLCT | STRING | User QLCT có quay lại vào tuần tiếp theo | 67475245, 65459914, 57299017 |
| WEEKLY_RETAIN_MONI | STRING | User MONI có quay lại vào tuần tiếp theo | 25103427, 38502644, 105023160 |
| MIN_DATE_TFBV | DATE | Ngày đầu tiên trong tháng user có visit TFBVNgày đầu tiên trong tháng user có visit TFBV  | 2025-12-01, 2025-09-01, 2025-08-01 |
| MIN_DATE_QLCT | DATE | Ngày đầu tiên trong tháng user có visit QLCT | 2025-12-01, 2025-09-01, 2025-08-01 |
| MIN_DATE_MONI | DATE | Ngày đầu tiên trong tháng user có visit MONI | 2025-08-01, 2025-12-01, 2025-11-01 |
| NEW_TO_MONTH_TFBV | STRING | User lần đầu visit TFBV trong tháng | 78008382, 52169180, 4564847 |
| NEW_TO_MONTH_QLCT | STRING | User lần đầu visit QLCT trong tháng | 42799274, 19171743, 48632377 |
| NEW_TO_MONTH_MONI | STRING | User lần đầu visit MONI trong tháng | 55405613, 57236966, 50753157 |
| DATE | DATE | Ngày có visit TFBVNgày có visit TFBV | 2026-01-05, 2025-10-03, 2024-12-30 |
| count_week | INTEGER | Số tuần có active TFBV trong tháng | 1 |
| GENDER | STRING | Giới tínhGiới tính | male, female, unknown |
| AGE | INTEGER | TuổiTuổi | 19, 21, 20 |
| AGE_GROUP | STRING | Nhóm tuổiNhóm tuổi | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [5]. 31 - 35 y/o |
| IS_A30_USER | BOOLEAN | User có giao dịch trong 30 ngày gần đây: true | false | true, false |
| CITY | STRING | TỉnhTỉnh | Hồ Chí Minh, Hà Nội, Bình Dương |
| REGION | STRING | Khu vựcKhu vực | Đông Nam Bộ, Đồng bằng sông Hồng, Đồng bằng sông Cửu Long |
| VIETQR_TRANS | INTEGER | Tổng số giao dịch VIETQR trong tháng | 1, 2, 3 |
| P2P_TRANS | INTEGER | Tổng số giao dịch P2P trong tháng | 1, 2, 3 |
| PAYMENT_TRANS | INTEGER | Tổng số giao dịch Payment trong tháng | 1, 2, 3 |
| VIETQR_AMOUNTz | FLOAT | Tổng giá trị giao dịch VIETQR trong tháng | 100000, 50000, 20000 |
| P2P_AMOUNT | FLOAT | Tổng giá trị giao dịch P2P trong tháng | 111, 100000, 50000 |
| PAYMENT_AMOUNT | FLOAT | Tổng giá trị giao dịch Payment trong tháng | 10000, 20000, 100000 |
| TOTAL_AMOUNT | FLOAT | Tổng giá trị giao dịch trong tháng | 10000, 20000, 100000 |
| TOTAL_TRANS | INTEGER | Tổng số giao dịch trong tháng | 1, 2, 3 |
| SEGMENT | STRING | Phân nhóm dựa theo số lượng giao dịch trong tháng, bao gồm VIETQR + P2P + Payment. Light: < 3, Mediu... | 3. HARDCORE, 2. MEDIUM, 1. LIGHT |
| BUDGET | INTEGER | User có tạo Budget trong tháng 0: No 1: Yes | 0, 1 |
| INPUT_TRANSACTION | INTEGER | User có tạo Thêm giao dịch trong tháng 0: No 1: Yes | 0, 1 |
| CLASSIFY | INTEGER | User có tạo Phân loại giao dịch trong tháng 0: No 1: Yes | 0, 1 |
| USECASE | INTEGER | Số dịch vụ User sử dụng trong tháng | 6, 7, 5 |

### momovn-prod.MBI_DA.QLCT_EVENT_TRACKING_VER2
> Bảng này chứa thông tin về theo dõi sự kiện trong dịch vụ quản lý chi tiêu (QLCT). Dữ liệu trong bảng có thể được sử dụng cho các mục đích sau: 
- Theo dõi chi tiết các sự kiện mà người dùng thực hiện...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_id | STRING | ID của sự kiện trong dịch vụ quản lý chi tiêu. | , kcpm-awBZVa-dZ7Yu2eCn, ZWB9EGFNAo9-03XTVk7xs |
| user_id | STRING | ID người dùng tham gia vào sự kiện. | 5092751, 45712094, 21896549 |
| date | DATE | Ngày diễn ra sự kiện. | 2025-12-31, 2025-12-30, 2026-01-01 |
| week | DATE | Tuần diễn ra sự kiện. | 2025-12-28, 2026-01-04, 2025-11-30 |
| month | DATE | Tháng diễn ra sự kiện. | 2025-12-01, 2025-11-01, 2025-09-01 |
| datetime | DATETIME | Thời gian cụ thể diễn ra sự kiện. | 2026-01-20 20:53:01.904, 2025-10-11 22:23:22.975, 2025-10-29 22:30:44.300 |
| trigger_id | STRING | ID của trigger kích hoạt sự kiện. | — |
| action_event | STRING | Hành động của người dùng trong sự kiện. | Displayed, Clicked, Inputed |
| block_event | STRING | Sự kiện được trả về từ block cụ thể. | Home Page, Thêm giao dịch, Chi tiết cate |
| description | STRING | Mô tả chi tiết về sự kiện. | Hiển thị function trên thanh menu tại MH Home Expense , User điền thông tin nhập giao dịch chi tiêu / thu nhập, User điền thông tin giao dịch chi |
| screen_name | STRING | Tên màn hình nơi diễn ra sự kiện. | expense_home, expense_add_transaction, expense_category_detail |
| event_name | STRING | Tên của sự kiện. | service_component_displayed, service_icon_displayed, service_field_inputed |
| component_name | STRING | Tên thành phần tham gia sự kiện. | , block_home, pie_chart |
| component_type | STRING | Loại thành phần tham gia sự kiện. | list, block, chart |
| button_name | STRING | Tên nút bấm liên quan đến sự kiện. | , add_trans, date_selected |
| icon_name | STRING | Tên biểu tượng liên quan đến sự kiện. | , 3, change_chart |
| block_name | STRING | Tên block trong giao diện liên quan đến sự kiện. | , total_transaction, monthly_limit |
| status | STRING | Trạng thái của sự kiện hoặc hành động. | on_report, up_normal, down_abnormal |
| page | STRING | Tên trang chứa sự kiện. | overall, pie_chart, wrap_up |
| popup_name | STRING | Tên popup liên quan đến sự kiện. | — |
| checkbox_name | STRING | Tên ô checkbox tham gia sự kiện. | count_expense_to_report |
| action | STRING | Hành động cụ thể trong sự kiện. | click, header, cta |
| tab_name | STRING | Tên tab liên quan đến sự kiện. | , Tổng quan, analysis |
| type | STRING | Loại của sự kiện. | expense, entry_point, income |
| content_category | STRING | Danh mục nội dung của sự kiện. | 3, null, 1 |

### momovn-prod.MBI_DA.LSGD_CTGD_FILTER_LABEL_RAW
> Bảng lưu trữ dữ liệu log sự kiện lọc và gán nhãn của người dùng trên màn hình lịch sử giao dịch (LSGD - Lịch Sử Giao Dịch), mục đích:
- Phân tích hành vi người dùng khi tương tác với các filter, compo...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_id | STRING | Mã định danh duy nhất cho mỗi sự kiện log trong hệ thống.Mã định danh duy nhất cho mỗi sự kiện log t... | -AqwqhzGo26UmcOiJ_LfD, 2aIlQyYBvkvExYg2CUmJG, nO-CdBpJURJeo-hyAm9bH |
| user_id | STRING | Mã định danh của người dùng trên MoMo, dùng để nhận diện khách hàng.Mã định danh của người dùng trên... | 57621949, 67859651, 44717405 |
| date | DATE | Ngày diễn ra sự kiện, dạng yyyy-MM-dd.Ngày diễn ra sự kiện, dạng yyyy-MM-dd.

**Sample value**: 2025... | 2025-11-05, 2026-01-05, 2025-11-10 |
| week | DATE | Ngày bắt đầu tuần tương ứng với date (thứ Hai), dạng yyyy-MM-dd.Ngày bắt đầu tuần tương ứng với date... | 2025-11-02, 2026-01-04, 2025-11-30 |
| month | DATE | Ngày đầu tiên của tháng tương ứng với date, dạng yyyy-MM-dd.Ngày đầu tiên của tháng tương ứng với da... | 2025-12-01, 2025-10-01, 2025-11-01 |
| datetime | DATETIME | Thời điểm chính xác đến giây phát sinh sự kiện.Thời điểm chính xác đến giây phát sinh sự kiện.

**Sa... | 2025-11-22 11:43:54.445, 2025-10-13 14:53:40.094, 2025-10-09 22:18:06.891 |
| global_trigger_id | STRING | Mã trigger toàn cục định danh ngữ cảnh của màn hình lịch sử giao dịch.Mã trigger toàn cục định danh ... | transactionhistory1230b445d2419504624e8f6db4640f4ff071, transactionhistory124699f4cb2b411a090d3977ec16b01e8797, transactionhistory1246d0548e9b270475a4e3f12a03df7517e6 |
| action_event | STRING | Loại hành động diễn ra với component (Displayed/Clicked/Selected...).Loại hành động diễn ra với comp... | Displayed, Clicked, Swiped |
| block_event | STRING | Tên khối giao diện nơi sự kiện phát sinh, ví dụ khối LSGD (Lịch Sử Giao Dịch).Tên khối giao diện nơi... | LSGD, CTGD, Top nav |
| description | STRING | Nội dung mô tả chi tiết sự kiện dưới dạng văn bản ngắn.Nội dung mô tả chi tiết sự kiện dưới dạng văn... | Hiển thị CTA chia bill, Hiển thị màn hình lịch sử giao dịch, Hiển thị CTA chuyển tiền W2B |
| service_name | STRING | Tên dịch vụ ứng dụng đang liên quan đến sự kiện.Tên dịch vụ ứng dụng đang liên quan đến sự kiện.

**... | tabbar_transaction, transaction_history_detail, transaction_history_filter |
| screen_name | STRING | Tên màn hình nơi sự kiện xảy ra.Tên màn hình nơi sự kiện xảy ra.

**Sample value**: transaction_hist... | transaction_history, transaction_detail, transaction_history_filter |
| event_name | STRING | Tên sự kiện được log, ví dụ service_button_displayed.Tên sự kiện được log, ví dụ service_button_disp... | service_button_displayed, service_screen_displayed, service_block_clicked |
| component_name | STRING | Tên component cụ thể nếu có, để trống nếu không áp dụng.Tên component cụ thể nếu có, để trống nếu kh... | , calendar, warning |
| component_type | STRING | Loại component như Button, Icon, Label... ở đây đang bằng 'None'.Loại component như Button, Icon, La... | collapse, block, datepicker |
| button_name | STRING | Tên nút bấm liên quan đến sự kiện.Tên nút bấm liên quan đến sự kiện.

**Sample value**: action_butto... | action_button, , date_selected |
| icon_name | STRING | Tên icon nếu có, hiện chưa được ghi nhận.Tên icon nếu có, hiện chưa được ghi nhận.

**Sample value**... | , filter, expand_calendar |
| block_name | STRING | Tên block con trong khối giao diện, nếu có.Tên block con trong khối giao diện, nếu có.

**Sample val... | , transaction_list, calendar |
| status | STRING | Trạng thái hiện tại của component hoặc màn hình.Trạng thái hiện tại của component hoặc màn hình.

**... | success, fail |
| page | STRING | Số hoặc tên page nếu có paging; hiện chưa ghi nhận.Số hoặc tên page nếu có paging; hiện chưa ghi nhậ... | — |
| popup_name | STRING | Tên popup khi sự kiện phát sinh trên popup.Tên popup khi sự kiện phát sinh trên popup.

**Sample val... | — |
| checkbox_name | STRING | Tên checkbox nếu sự kiện liên quan checkbox.Tên checkbox nếu sự kiện liên quan checkbox.

**Sample v... | — |
| action | STRING | Hành động bổ xung đồng thời với action_event; hiện đang None.Hành động bổ xung đồng thời với action_... | on |
| tab_name | STRING | Tên tab trong màn hình có nhiều tab.Tên tab trong màn hình có nhiều tab.

**Sample value**: (thường ... |  |
| type | STRING | Loại hình nội dung giao diện hoặc hành động (chat_conversation, transfer_split_bill...).Loại hình nộ... | transfer_split_bill, sacombank_cashout, transfer_p2p |
| content_category | STRING | Chuyên mục nội dung mà component/sự kiện thuộc về.Chuyên mục nội dung mà component/sự kiện thuộc về.... | — |
| field_name | STRING | Tên trường dữ liệu nếu sự kiện gắn với nhập liệu form.Tên trường dữ liệu nếu sự kiện gắn với nhập li... | , search |
| filter_name | STRING | Tên filter hiện đang None (chưa gán giá trị).Tên filter hiện đang None (chưa gán giá trị).

**Sample... | — |
| filter_type | STRING | Loại filter (checkbox, radio, text...); đang None.Loại filter (checkbox, radio, text...); đang None.... | filter_by_month, filter_by_service, filter_by_account |
| filter_value | STRING | Giá trị lọc được chọn/sử dụng; đang None.Giá trị lọc được chọn/sử dụng; đang None.

**Sample value**... | Tất cả, Ví MoMo, Nhận tiền |
| source_from | STRING | Nguồn module hoặc service tạo ra sự kiện.Nguồn module hoặc service tạo ra sự kiện.

**Sample value**... | home, others, billpaycenter |
| trans_category | STRING | Nhóm transaction liên quan, nếu có.Nhóm transaction liên quan, nếu có.

**Sample value**: None | th_p2p_w2b_cat3, th_token_cat2, th_electricity_cat2 |
| trans_status | STRING | Trạng thái giao dịch liên quan (Success, Failed...).Trạng thái giao dịch liên quan (Success, Failed.... | success, pending, failed |
| position | STRING | Vị trí hiển thị của component trên UI.Vị trí hiển thị của component trên UI.

**Sample value**: None | 2, 3, 1 |

### momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER
> Bảng momovn-prod.MBI_DA.QLCT_L4_TRANSHIS_USER lưu trữ thông tin lịch sử giao dịch người dùng phục vụ cho dịch vụ quản lý chi tiêu. 
Thông tin có thể được lấy từ bảng này gồm có: 
- Tháng thực hiện phâ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| DATE_MONTH | DATE | Tháng thực hiện phân loại giao dịch | 2025-12-01, 2025-09-01, 2025-11-01 |
| AGENT_ID | STRING | Mã định danh cho mỗi ví MoMoUser ID | 76040441, 42011742, 47113325 |
| CATEGORY | STRING | Danh mục phân loại giao dịchDanh mục phân loại | Hóa đơn, Giải trí, Ăn uống |
| TRANS | INTEGER | Số lượng giao dịchSố lượng giao dịch | 1, 2, 3 |
| AMOUNT | FLOAT | Giá trị giao dịchGiá trị giao dịch | 100000, 50000, 10000 |

### momovn-prod.MBI_DA.HAI_QLCT_FEATURE_BUDGET_RAW
> Bảng này chứa thông tin chi tiết về ngân sách QLCT của từng user. Mỗi bản ghi đại diện cho ngân sách liên quan đến một danh mục hoặc tổng ngân sách, với các tham chiếu đến thời gian tạo lập và cập nhậ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| autoid | FLOAT | Mã budget_id cũ không còn sử dụng | 2045130, 2389904, 1782958 |
| agent_id | STRING | Mã định danh từng userMã định danh từng user | 86605749, 51350302, 21896549 |
| dt | DATE | Ngày ETL bảngNgày ETL bảng | 2025-08-01, 2025-10-01, 2025-09-01 |
| create_date | DATE | Ngày tạo budgetNgày tạo budget | 2024-11-06, 2024-11-07, 2024-11-05 |
| create_month | DATE | Tháng tạo budgetTháng tạo budget | 2024-11-01, 2024-12-01, 2024-10-01 |
| last_update | DATE | Ngày cập nhật thông tin về số tiền đặt cho budget | 2025-08-01, 2025-09-01, 2025-07-01 |
| update_month | DATE | Tháng cập nhật thông tin về số tiền đặt cho budget | 2025-10-01, 2025-09-01, 2025-08-01 |
| time_stamp_create | TIMESTAMP | Thời gian tạo budget theo timestamp | 2024-12-15 05:16:11+00, 2024-11-26 12:11:13+00, 2024-11-09 09:11:15+00 |
| year_budget | FLOAT | Năm cập nhật của budget đi theo năm của last_update | 2025, 2024, 2026 |
| TYPE_BUDGET | FLOAT | Loại budget, với {'1': Total budget, '2': Category budget} | 2, 1 |
| MASTER_ID | STRING | Mã định danh của budget, đếm master_id để biết 1 user có bao nhiêu budget | — |
| CATEGORY_ID | FLOAT | Category của budgetCategory của budget | 86, 105, 87 |
| JANUARY | FLOAT | Số tiền budget được user đặt ở tháng 1 | 1000000, 500000, 1000 |
| FEBRUARY | FLOAT | Số tiền budget được user đặt ở tháng 2 | 1000000, 500000, 1000 |
| MARCH | FLOAT | Số tiền budget được user đặt ở tháng 3 | 1000000, 500000, 1000 |
| APRIL | FLOAT | Số tiền budget được user đặt ở tháng 4 | 1000000, 500000, 1000 |
| MAY | FLOAT | Số tiền budget được user đặt ở tháng 5 | 1000000, 500000, 1000 |
| JUNE | FLOAT | Số tiền budget được user đặt ở tháng 6 | 1000000, 500000, 2000000 |
| JULY | FLOAT | Số tiền budget được user đặt ở tháng 7 | 1000000, 500000, 2000000 |
| AUGUST | FLOAT | Số tiền budget được user đặt ở tháng 8 | 1000000, 500000, 2000000 |
| SEPTEMBER | FLOAT | Số tiền budget được user đặt ở tháng 9 | 1000000, 500000, 2000000 |
| OCTOBER | FLOAT | Số tiền budget được user đặt ở tháng 10 | 1000000, 500000, 2000000 |
| NOVEMBER | FLOAT | Số tiền budget được user đặt ở tháng 11 | 1000000, 1000, 500000 |
| DECEMBER | FLOAT | Số tiền budget được user đặt ở tháng 12 | 1000000, 1000, 500000 |

### momovn-prod.MBI_DA.QLCT_L3_LABEL_WIDGET
> Bảng fact lưu trữ sự kiện hiển thị và tương tác của người dùng với các widget thuộc dịch vụ Quản lí chi tiêu (QLCT) cấp độ 3 trong ứng dụng MoMo. 
- Phân tích hành vi người dùng khi tương tác với widg...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| event_id | STRING | ID duy nhất của sự kiện log, dùng để trace theo chuỗi hành động trong cùng một session | , apenpup-api-prod-6cc77b6448-s5vjr_532197206_532197210_1767629348536, apenpup-api-prod-6cc77b6448-g7867_385458075_385458144_1766670089136 |
| user_id | STRING | Mã định danh người dùng trong hệ thống MoMo | 33940422, 38666541, 47205998 |
| datetime | DATETIME | Thời điểm ghi nhận sự kiện theo giờ phút giây (UTC+7 đã chuyển đổi) | 2025-12-29 20:41:50.286, 2026-01-05 10:05:15.171, 2025-12-01 16:51:50.993 |
| date | DATE | Ngày ghi nhận sự kiệnNgày ghi nhận sự kiện | 2026-01-05, 2025-10-10, 2025-12-31 |
| month | DATE | Ngày đầu tiên của tháng để phân vùng dữ liệu theo tháng | 2025-10-01, 2025-11-01, 2025-12-01 |
| widget_action | STRING | Hành động người dùng đối với widget: ‘Displayed’ – thấy widget trên màn hình, ‘Clicked’, ‘Swiped’ | Displayed, Clicked |
| widget_type | STRING | Loại hiển thị của widget: ‘native’ – widget code sẵn trong app, ‘web-view’, ‘banner’ | widget, native, mini app |
| widget_identify | STRING | Mã widget duy nhất theo design system của QLCT; ví dụ: QLCT_1 – widget tổng quan chi tiêu cấp độ 3 | 3, , QLCT_1 |
| description | STRING | Ghi chú ngắn của sự kiện được backend đẩy vào log, ở đây chỉ ghi nhận kiểu ‘Widget native level item... | Widget QLCT / KQGD - Insight , Widget native level item -, Widget native level widget |
| service_name | STRING | Tên dịch vụ trong ứng dụng, cố định là ‘expense’ – trang Quản lí chi tiêu | expense, vn.momo.financial_hub |
| event_name | STRING | Loại sự kiện phát sinh; ở table này là ‘service_component_displayed’ – component được hiển thị | service_component_displayed, service_component_clicked, service_button_clicked |
| screen_name | STRING | Màn hình nơi widget được render | transaction_result, HomeScreen, TabMeInfo |
| component_name | STRING | Tên component tương ứng với widget log; thường là ‘widget_native’ | widget_native, insight, expense_widget |
| component_type | STRING | Loại cấu thành parent UI; ở đây là ‘widget’ | widget, insight_widget |
| button_name | STRING | Tên button nếu hành động là click | , arrow, cta |
| icon_name | STRING | Tên icon được click hoặc hiển thị |  |
| block_name | STRING | Tên block thuộc tính chứa widget trong layout – chỉ định vùng trên UI. Giá trị QLCT_1 ứng với khối Q... | , QLCT_1, QLCT_9 |
| status | STRING | Trạng thái kỹ thuật của widget/component khi log | classified, on_report, detail_on_report |
| page | STRING | Chỉ số thứ tự page nếu widget được phân trang | 1, 2, 4 |
| popup_name | STRING | Tên popup khi log mở/đóng popup | — |
| checkbox_name | STRING | Tên checkbox khi log check/uncheck | — |
| source_from | STRING | Nguồn gốc widget để thiết lập tracking | expense, income |
| list_name | STRING | Tên list nếu widget thuộc một listview | — |
| action | STRING | Tên action phụ, dùng cho bản tin rộng | not_edited, edited, header |
| tab_name | STRING | Tên tab phụ nếu widget nằm trong đa tab | , month_sum, demo_month_sum |
| type | STRING | Loại phân loại bổ sung cho sự kiện | Ăn uống, Hóa đơn, Chợ, siêu thị |
| content_category | STRING | Danh mục nội dung nếu có áp dụng phân loại | 3, 11, null |
| card_name | STRING | Tên card hoặc block card nếu widget nằm trong một thẻ | , insight_widget_QLCT_default, insight_widget_QLCT_1trieuxu |

### momovn-prod.TEAM_PRODUCT_OPTS.QLCT_L4_USER_PROFILE_MONTHLY
> projectid.dataset_name.QLCT_L4_USER_PROFILE_MONTHLY là bảng lưu trữ thông tin hàng tháng về người dùng Quản lý chi tiêu trên ứng dụng MoMo. 
Bảng này dùng để phân tích các hành vi của người dùng, gồm ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| agent_id | STRING | Mã định danh của người dùng Quản lý chi tiêu | 89978527, 23042880, 54988751 |
| etl_month | DATE | Tháng visit Quản lý chi tiêu | 2025-12-01, 2025-09-01, 2025-08-01 |
| month_of_year | STRING | Tên của thángTên của tháng | December, November, October |
| year | INTEGER | Năm visit Quản lý chi tiêu | 2025, 2024, 2026 |
| n2qlct_date | DATE | Ngày lần đầu tiên người dùng đến với Quản lý chi tiêu | 2024-09-30, 2024-09-20, 2024-06-10 |
| n2month_date | DATE | Ngày lần đầu trong tháng người dùng đến với Quản lý chi tiêu | 2025-10-03, 2025-09-01, 2025-12-01 |
| monthly_user_type | STRING | Loại người dùng Quản lý chi tiêu theo tháng | 2. Retain, 3. Reactive, 1. New |
| is_n2qlct | BOOLEAN | Tháng này có phải tháng đầu tiên user đến với Quản lý chi tiêu không, true: là tháng đầu tiên, false... | false, true |
| numday_visit | INTEGER | Số ngày mà người dùng vào Quản lý chi tiêu trong tháng này | 1, 2, 3 |
| qlct_segment | STRING | Người dùng thuộc segment nào trong Quản lý chi tiêu được chia theo số ngày visit trong tháng | Light QLCT, Medium QLCT, Hardcore QLCT |
| gender | STRING | Giới tính của người dùngGiới tính của người dùng | male, female, unknown |
| age | INTEGER | Tuổi cụ thể của người dùng | 22, 23, 21 |
| age_group | STRING | Nhóm tuổi của người dùngNhóm tuổi của người dùng | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [5]. 31 - 35 y/o |
| most_city_a60 | STRING | Thành phố mà người dùng đang sống | Hồ Chí Minh, Hà Nội, Bình Dương |
| is_momo_employee | BOOLEAN | Người dùng này có phải nhân viên MoMo không, true: là nhân viên MoMo, false: không phải nhân viên Mo... | false, true |
| no_usecase | INTEGER | Số lượng dịch vụ người dùng đã sử dụng trong tháng | 4, 5, 3 |
| platform_segment | STRING | Người dùng thuộc segment nào ở Platform trong tháng | Hardcore >=4 usecase, Medium 3 usecase, Light 1-2 usecase |
| user_type_lifecycle | STRING | Loại người dùng lifetime theo Platform | 2. Retain, 3. Reactive, 1. New |
| total_trans | INTEGER | Tổng số lượng giao dịch của người dùng trong tháng | 1, 2, 3 |
| total_gmv | FLOAT | Tổng số tiền giao dịch của người dùng trong tháng | 10000, 20000, 100000 |
| first_add_trans_date | DATE | Ngày đầu tiên người dùng có thêm giao dịch tay | 2024-11-06, 2024-11-07, 2024-11-20 |
| first_budget_date | DATE | Ngày đầu tiên người dùng vào setup ngân sách | 2025-12-31, 2024-11-06, 2024-11-07 |
| first_classify_date | DATE | Ngày đầu tiên người dùng vào phân loại giao dịch thủ công | 2024-11-06, 2024-11-07, 2024-09-20 |
| is_pin_home | BOOLEAN | Người dùng này đã ghim icon Quản lý chi tiêu trên Home MoMo chưa, true: đã ghim, false: chưa ghimNgư... | false, true |
| is_having_upcoming | BOOLEAN | Người dùng này đang có những giao dịch sắp tới không, true: có giao dịch sắp tới, false: không có gi... | false, true |
| num_budget | INTEGER | Số lượng ngân sách người dùng này đang tính đến tháng | 1, 2, 3 |
| num_manual_classify | INTEGER | Số lượng giao dịch người dùng này đã phân loại trong tháng | 0, 1, 2 |
| num_add_trans | INTEGER | Số lượng giao dịch người dùng này đã thêm thủ công trong tháng | 0, 1, 2 |

## Domain Knowledge (from Mimir)

- Khi xử lý sự kiện Click tạo ngân sách, sử dụng SCREEN_NAME = 'expense_budget_category_information' và EVENT_NAME = 'service_button_clicked'
- Khi truy vấn MEU của Moni, cần thêm điều kiện ACTION = 'CHAT'
- Khi chuẩn hóa sang TIMESTAMP, sử dụng timezone GMT+7 (Asia/Ho_Chi_Minh) để tính toán diff
- The column named `USER_TYPE` in the provided schema for `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` should be treated as `USER_TYPE_TFBV` based on successful query executions. The `USER_TYPE` column does not exist in the actual table.
- Khi xử lý vấn đề liên quan tới QLCT, cần đảm bảo rằng cột MONTH trong bảng SEMANTIC_QLCT_VISIT phải khớp với cột DATE_MONTH trong bảng QLCT_L4_TRANSHIS_USER
- Khi xử lý block_event = 'Home Page', cần thêm điều kiện description = 'Hiển thị Home QLCT'
- Khi tính số MEU Moni, loại trừ user_message 'DEFAULT_START_MESSAGE'
- Mimir chưa mở cập nhật dữ liệu mới nên số liệu có thể sai lệch mapping giữa các bảng
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

## Known Metrics

### MAU (Monthly Active Users)
- **How Mimir counts it:** `COUNT(DISTINCT AGENT_ID)` where `ACTION = 'CHAT'`
- **Table:** `SEMANTIC_QLCT_VISIT`
- **Filters:** `PRODUCT = 'MONI'`, `MONTH = 'YYYY-MM-01'`
- **Example result:** 308,931 MAU in 12/2025; 290,471 MAU in 1/2026
- **Verified:** 2026-02-03

## Open Questions
- What other ACTIONs exist besides 'CHAT'?
- What other PRODUCTs are in this domain?
- Does this domain support GMV metrics or only user activity?

## Suggested Probe Questions
- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**