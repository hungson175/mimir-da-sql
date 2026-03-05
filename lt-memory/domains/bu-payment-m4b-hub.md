# BU Payment: M4B HUB

**Domain ID:** `5d47c7cc-f998-41c5-ab4c-5caa4b441743`

## Description
Domain này chứa data engagement của merchant vào M4B (Sẽ bao gồm các touch point khác thuộc M4B quản lý)

## Tables

### `project-5400504384186300846.MBI_DA.dim_m4b_merchant_profile`
> Bảng dimension chứa thông tin liên quan đến hồ sơ merchant trên Dịch vụ M4B của MoMo. Bảng này được sử dụng để phân tích các tiêu chí và chỉ số liên quan đến việc sử dụng và tương tác của merchant qua các loại tính năng trên hệ thống.
- Cung cấp thông tin định danh và hồ sơ chi tiết của merchant trên nền tảng.
- Theo dõi quá trình tương tác và sử dụng các tính năng của merchant.
- Phân tích mô hình chấp nhận tính năng và chỉ số tương tác của merchant qua các lần sử dụng đầu tiên.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `merchant_code` | — | Mã định danh duy nhất của merchant trong hệ thống M4B. | — |
| `id` | — | Merchant ID. | — |
| `merchant_size` | — | Kích thước của merchant, có thể là nhỏ, trung bình, hoặc lớn. | — |
| `created_date` | — | Ngày mà merchant được tạo mới trong hệ thống. | — |
| `created_datetime` | — | Ngày và thời gian mà merchant được tạo mới trong hệ thống. | — |
| `agent_id` | — | Mã định danh cho mỗi ví MoMo của merchant. | — |
| `brand_name` | — | Tên thương hiệu của merchant. | — |
| `merchant_name_m4b` | — | Tên merchant trên dịch vụ M4B. | — |
| `merchant_name_sl` | — | Tên merchant trên nền tảng SL. | — |
| `merchant_type_m4b` | — | Loại hình merchant trong hệ thống M4B. | — |
| `merchant_onboarding_type` | — | Loại hình onboarding của merchant. | — |
| `full_address` | — | Địa chỉ đầy đủ của merchant. | — |
| `city_name` | — | Tên thành phố của merchant. | — |
| `district_name` | — | Tên quận của merchant. | — |
| `ward_name` | — | Tên phường của merchant. | — |
| `street_name` | — | Tên đường nơi merchant hoạt động. | — |
| `house_number` | — | Số nhà của merchant. | — |
| `longitude` | — | Tọa độ kinh độ của vị trí merchant. | — |
| `latitude` | — | Tọa độ vĩ độ của vị trí merchant. | — |
| `category_sl_lv1` | — | Danh mục cấp 1 của merchant trên nền tảng SL. | — |
| `category_sl_lv2` | — | Danh mục cấp 2 của merchant trên nền tảng SL. | — |
| `category_sl_lv3` | — | Danh mục cấp 3 của merchant trên nền tảng SL. | — |
| `category_sl_lv4` | — | Danh mục cấp 4 của merchant trên nền tảng SL. | — |
| `payment_age_in_month` | — | Tuổi thọ tính theo tháng của khả năng thanh toán của merchant. | — |
| `first_transaction_date` | — | Ngày diễn ra giao dịch đầu tiên của merchant. | — |
| `first_engage_date` | — | Ngày đầu tiên mà merchant có tương tác với dịch vụ M4B (có thể trước ngày tạo ra nếu merchant đã được liên kết với một agent_id có sẵn). | — |
| `is_merchant_pinned_to_home` | — | True: Merchant đã từng ghim M4B vào trang chủ, False: Merchant chưa từng ghim. | — |
| `is_merchant_pinned_to_home_in_7d` | — | True: Merchant đã ghim M4B vào trang chủ trong 7 ngày đầu tiên, False: không ghim. | — |
| `is_merchant_still_pinned_to_home` | — | True: Merchant vẫn còn ghim M4B vào trang chủ, False: không ghim. | — |
| `is_merchant_turn_on_ttt` | — | True: Merchant đã từng kích hoạt thanh toán TTT, False: chưa kích hoạt. | — |
| `is_merchant_turn_on_ttt_in_7d` | — | True: Merchant kích hoạt thanh toán TTT trong vòng 7 ngày đầu tiên, False: không kích hoạt. | — |
| `first_tran_ttt_date` | — | Ngày diễn ra giao dịch TTT đầu tiên. | — |
| `first_tran_ttt_datetime` | — | Ngày và thời gian diễn ra giao dịch TTT đầu tiên. | — |
| `is_merchant_have_tran_ttt` | — | True: Merchant đã từng thực hiện giao dịch với TTT, False: chưa thực hiện. | — |
| `is_merchant_have_tran_ttt_in_7d` | — | True: Merchant có giao dịch TTT trong vòng 7 ngày đầu tiên, False: không có. | — |
| `is_merchant_have_tran_ttt_bank_cashout` | — | True: Merchant đã từng thực hiện giao dịch rút tiền từ ngân hàng qua TTT, False: chưa thực hiện. | — |
| `is_merchant_have_tran_ttt_bank_cashout_in_7d` | — | True: Merchant thực hiện giao dịch rút tiền từ ngân hàng qua TTT trong 7 ngày đầu tiên, False: không có giao dịch. | — |
| `first_auto_bank_cashout_date` | — | Ngày diễn ra giao dịch tự động rút tiền từ ngân hàng đầu tiên của merchant. | — |
| `first_auto_bank_cashout_datetime` | — | Ngày và thời gian diễn ra giao dịch tự động rút tiền từ ngân hàng đầu tiên của merchant. | — |
| `is_merchant_have_tran_auto_bank_cashout` | — | True: Merchant đã từng thực hiện giao dịch tự động rút tiền từ ngân hàng, False: chưa thực hiện. | — |
| `is_merchant_have_tran_auto_bank_cashout_in_7d` | — | True: Merchant thực hiện giao dịch tự động rút tiền từ ngân hàng trong 7 ngày đầu tiên, False: không có giao dịch. | — |
| `is_merchant_map_soundbox_in_7d` | — | True: Merchant đã liên kết soundbox trong 7 ngày đầu tiên (có thể đã liên kết trước khi có tương tác M4B), False: chưa liên kết. | — |
| `is_soundbox_merchant` | — | True: Merchant đã từng liên kết soundbox, False: chưa liên kết. | — |
| `first_map_soundbox_date` | — | Ngày diễn ra liên kết soundbox lần đầu tiên. | — |
| `is_merchant_have_sb_transaction_in_7d` | — | True: Merchant có giao dịch soundbox trong vòng 7 ngày đầu tiên, False: không có giao dịch. | — |
| `first_sb_transaction_date` | — | Ngày diễn ra giao dịch soundbox đầu tiên. | — |
| `is_merchant_have_sound_noti_in_7d` | — | True: Merchant kích hoạt thông báo âm thanh trong 7 ngày đầu tiên, False: không kích hoạt. | — |
| `first_sound_noti_date` | — | Ngày diễn ra thông báo âm thanh lần đầu tiên. | — |
| `is_merchant_have_staff_accept_in_7d` | — | True: Merchant có nhân viên chấp nhận lời mời trong 7 ngày đầu tiên, False: không có. | — |
| `first_staff_accept_date` | — | Ngày nhân viên chấp nhận lời mời lần đầu tiên. | — |
| `gender` | — | Giới tính của merchant. | — |
| `age` | — | Tuổi của merchant. | — |
| `age_group` | — | Nhóm tuổi của merchant. | — |
| `momo_age_in_month` | — | Tuổi trên MoMo của merchant tính theo tháng. | — |
**Distinct values:**
```
- Distinct value `age_group` là ['7.N/A' '4.28-35' '3.23-27' '5.36-50' '6.>50' '1.<18' '2.18-22']
- Distinct value `gender` là ['female' 'male' 'unknown']
- Distinct value `category_sl_lv4` là ['ACCOMMODATION' 'AUTO MAINTENANCE' 'BAKERY / SWEETS' 'BAR / CLUB'
 'BEVERAGE - OTHER' 'BOOKSTORE / TOYS' 'CINEMA' 'CLEANING SERVICE'
 'CLINIC / SALON' 'COFFEE' 'COMFORT FOOD / STREET FOOD' 'CVS'
 'DENTAL CLINIC' 'DINING' 'EDUCATION - OTHER' 'EVENT / CONFERENCE'
 'EXPERIENCE' 'FASHION / ACCESSORIES' 'FAST FOOD' 'FLIGHTS' 'FOOD COURT'
 'FORMAL SCHOOL / UNIVERSITY' 'GAMING' 'GYM'
 'HEALTH AND BEAUTY / DRUGSTORE' 'HOME LIVING / ELECTRONICS' 'HOSPITAL'
 'HOUSEHOLD MAINTENANCE' 'KARAOKE' 'LANGUAGE CENTER' 'LAUNDRY' 'LOTTERY'
 'MALL / DEPARTMENT STORE' 'MILK TEA' 'MINIMART' 'MOM AND KIDS' 'NAIL'
 'OTT' 'PET SERVICE' 'PHOTOCOPY / PRINTING' 'SPA / MASSAGE'
 'SPORTS / RECREATION / PLAYGROUND' 'SUPERMARKET'
 'TRADITIONAL MARKET / GROCERY STORE / SPECIALTY STORE' 'TRAVEL - OTHER'
 'VENDING MACHINE']
- Distinct value `category_sl_lv1` là ['SME OFFLINE' 'TOPBRAND OFFLINE']
- Distinct value `category_sl_lv2` là ['SERVICE' 'FNB' 'RETAIL']
- Distinct value `category_sl_lv3` là ['SERVICE - OTHER' 'SHOPPING' 'FOOD' 'BEVERAGE' 'HOME & MAINTENANCE'
 'TRAVEL' 'ENTERTAINMENT' 'GROCERY' 'BEAUTY & SPA' 'HEALTH & MEDICAL'
 'EDUCATION' 'GOOGLE']
- Distinct value `merchant_type_m4b` là ['TOP_BRAND' 'BPU' 'MINI_WEB' 'SME' 'PRE_MERCHANT' 'AGENT_NETWORK'
 'DONATION_MERCHANT' 'BUDDHIST_SANGHA' 'P2SU' 'MERCHANT' 'MINI_APP' 'P2M'
 'OTHER']
- Distinct value `merchant_onboarding_type` là ['INDIVIDUAL_NON_VERIFIED_SELF_ONBOARDING' 'INDIVIDUAL_SALE_ONBOARDING'
 'INDIVIDUAL_SELF_ONBOARDING' 'ENTERPRISE_SELF_ONBOARDING']
- Distinct value `brand_name` là ['Công ty TNHH Rechic' 'PHÚC TRÀ' 'HUỲNH HỮU PHÚC' 'PHAM DUC THAO'
 'CÔNG TY TNHH TRUYỀN HÌNH CÁP SAIGONTOURIST-CN CANTHO' 'NGUYỄN MỘNG NHI'
 'CÔNG TY TNHH MTV TM DV SAIGON CREDIT' 'MÙA THỊ NƯƠNG'
 'Điện lực Tân Uyên' 'Công Ty Cổ Phần Thời Trang AAA'
 'CÔNG TY CỔ PHẦN JAPANA VIỆT NAM' 'Điện lực Phong Thổ'
 'CÔNG TY TNHH TRUYỀN HÌNH CÁP SAIGONTOURIST-CNHANOI'
 'Điện lực Thị xã Bỉm Sơn - Công ty điện lực Thanh Hóa'
 'Điện lực Như Thanh' 'Điện lực Như Xuân'
 'CÔNG TY TNHH TRUYỀN HÌNH CÁP SAIGONTOURIST-CN 1' 'BÁNH TRÁNG BÀ POU'
 'CÔNG TY CỔ PHẦN NÔNG SẢN LANGBIANG' 'Điện lực Hà Trung'
 'CÔNG TY TNHH THIẾT BỊ HP VIỆT NAM' 'EMDDI JSC' 'Điện lực Lang Chánh'
 'TRƯỜNG CAO ĐẲNG BÁCH KHOA SÀI GÒN' 'LÊ VĂN CHÍ'
 'CÔNG TY TNHH TRUYỀN HÌNH CÁP SAIGONTOURIST-CN6'
 'CÔNG TY TÀI CHÍNH TNHH MTV HOME CREDIT VIỆT NAM' 'UBND XÃ HÒA TIẾN'
 'TRUNG TÂM Y TẾ QUẬN NGŨ HÀNH SƠN THÀNH PHỐ ĐÀ NẴNG' 'Điện lực Nậm Nhùn'
 'Điện lực Bỉm Sơn' 'Điện lực Thành phố Lai Châu' 'STARLIGHT CINE'
 'CÔNG TY ĐIỆN LỰC BẾN TRE'
 'CÔNG TY TNHH TRUYỀN HÌNH CÁP SAIGONTOURIST-CN4'
 'CÔNG TY TNHH COLLECTIUS AMC (VN)'
 'CÔNG TY TNHH TRUYỀN HÌNH CÁP SAIGONTOURIST-CN5' 'Điện lực Sìn Hồ'
 'CÔNG TY CỔ PHẦN TEKMEDI'
 'Điện lực thành phố Sông Công - Công ty Điện lực Thái Nguyên'
 'CÔNG TY ĐIỆN LỰC NINH THUẬN' 'abc' 'CÔNG TY CỐ PHẦN MIC' 'SUNWON'
 'CÔNG TY TNHH TRUYỀN HÌNH CÁP SAIGONTOURIST-CN2' 'Điện lực Than Uyên'
 'NGUYỄN VĂN TRỌNG' 'Akulaku' 'MeM - MeCorp' 'Fiditour']
- Distinct value `merchant_size` là ['UNDEFINED' 'SME OFFLINE' 'TOPBRAND OFFLINE']
```

### `project-5400504384186300846.MBI_DA.fact_m4b_event`
> Fact table chứa dữ liệu event của Momo for Business (M4B). Dùng để theo dõi và phân tích các sự kiện của merchant trong hệ thống M4B.
 Các thông tin có thể được lấy từ bảng này bao gồm:
 - Phân tích dữ liệu sự kiện của merchant trong M4B
 - Xác định các màn hình và trigger liên quan đến từng sự kiện
 - Kiểm tra và tối ưu phiên bản và hệ điều hành của ứng dụng M4B

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date` | — | Ngày diễn ra event | — |
| `datetime` | — | Thời điểm của sự kiện | — |
| `event_id` | — | Mã định danh duy nhất của sự kiện | — |
| `momo_session_id_v2` | — | ID session của MoMo v2 | — |
| `agent_id` | — | Mã định danh của agent. Join với bảng dim_m4b_user để lấy merchant_code | — |
| `m4b_screen_id` | — | Mã màn hình M4B nơi xảy ra sự kiện. Map với bảng dm_m4b_screen để lấy mô tả | — |
| `non_defined_screen_name` | — | Tên màn hình chưa được xác định trong dim_m4b_screen | — |
| `global_trigger_id` | — | Global trigger_id. Dùng để xác định sự kiện. Mapping với bảng dim_m4b_global_trigger để lấy thông tin | — |
| `device_os` | — | Hệ điều hành của thiết bị | — |
| `app_version` | — | Phiên bản ứng dụng của M4B | — |
| `service_name` | — | Tên dịch vụ | — |
| `screen_name` | — | Tên màn hình | — |
| `event_name` | — | Tên sự kiện | — |
| `block_name` | — | Tên block | — |
| `button_name` | — | Tên nút | — |
| `component_name` | — | Tên thành phần | — |
| `tab_name` | — | Tên tab | — |
| `icon_name` | — | Tên icon | — |
| `api` | — | API | — |
| `status` | — | Trạng thái | — |
| `error_code` | — | Mã lỗi | — |
| `error_reason` | — | Lý do lỗi | — |
| `login_account` | — | Tài khoản đăng nhập | — |
| `raw_merchant_code` | — | Raw merchant_code được truyền từ hệ thống M4B. Chưa được xác minh | — |
**Distinct values:**
```
- Distinct value `status` là ['on' 'FAIL' 'success' 'failed' 'SUCCESS' 'fail' 'deactive' 'off' 'active']
- Distinct value `device_os` là ['Android' 'iOS' 'ANDROID' 'IOS']
```

### `project-5400504384186300846.MBI_DA.dim_m4b_trigger`
> Bảng dimension này lưu trữ thông tin về các trigger trong hệ thống M4B của MoMo. Những thông tin này bao gồm mã định danh toàn cầu của trigger, tên và chức năng của màn hình, và các mô tả liên quan đến trigger. Bảng này có thể được sử dụng để quản lý và theo dõi các trigger trong ứng dụng M4B, hỗ trợ trong việc kiểm tra và điều chỉnh các hành động tự động trong hệ thống, và phục vụ việc phân tích các sự kiện đã xảy ra trong ứng dụng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `Stt` | — | Số thứ tự của trigger trong danh sách. | — |
| `global_trigger_id` | — | Mã định danh toàn cầu cho trigger. | — |
| `function` | — | Chức năng của trigger. | — |
| `screen_name` | — | Tên của màn hình liên quan đến trigger. | — |
| `description` | — | Mô tả về trigger. | — |
| `old_description` | — | Mô tả cũ về trigger. | — |
| `description_trackify` | — | Mô tả sử dụng để trackify trigger. | — |
| `link` | — | Link liên kết với thông tin chi tiết của trigger. | — |
| `po_pic` | — | Hình ảnh liên quan đến Product Owner của trigger. | — |
| `note` | — | Ghi chú thêm về trigger. | — |
**Distinct values:**
```
- Distinct value `function` là ['5. Sự cố và hỗ trợ' '1. Vận hành căn bản' '3. Trợ thủ tài chính'
 '7. Khám phá' '6. Soundbox và cross sale ipos'
 '4. Dòng tiền và tác vụ liên quan ']
- Distinct value `screen_name` là ['account_info' 'add_revenue' 'financial_assistant' 'home' 'login'
 'notification_setting' 'order_soundbox_detail' 'payout_history'
 'qr_detail' 'soundbox_home' 'staff_account_management' 'staff_invite'
 'staff_invite_detail' 'start_app' 'store_management' 'tabbar'
 'trans_detail' 'trans_history' 'transaction_detail'
 'trending_aggregation' 'trending_detail']
```

### `project-5400504384186300846.MBI_DA.dim_m4b_screen`
> Bảng dimension chứa thông tin chi tiết về các màn hình trong hệ thống M4B (Momo for Business). Thông tin từ bảng này có thể được sử dụng để:
 - Theo dõi và quản lý các màn hình trong hệ thống M4B.
 - Kiểm tra và cải thiện tính năng engagement của các màn hình.
 - Phân tích mối liên hệ giữa màn hình và chức năng của chúng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | — | Mã định danh duy nhất cho mỗi màn hình trong hệ thống M4B. | — |
| `screen_name` | — | Tên của màn hình trong hệ thống M4B. | — |
| `function` | — | Chức năng của màn hình trong hệ thống M4B. | — |
| `description` | — | Mô tả chi tiết về màn hình trong hệ thống M4B. | — |
| `old_description` | — | Mô tả cũ của màn hình, trước khi được cập nhật trong hệ thống M4B. | — |
| `is_engagement` | — | Giá trị boolean cho biết liệu màn hình có thuộc dạng engagement hay không (true: là màn hình engagement, false: không phải). | — |
| `link` | — | Đường dẫn liên kết tới nội dung hoặc tài liệu liên quan đến màn hình. | — |
| `po_pic` | — | Thông tin về người sở hữu hoặc chịu trách nhiệm về màn hình trong hệ thống M4B. | — |
| `note` | — | Ghi chú phụ thêm liên quan đến màn hình. | — |
**Distinct values:**
```
- Distinct value `function` là ['3. Trợ thủ tài chính']
- Distinct value `screen_name` là ['(Không điền screen name vào đây)' 'home' 'trans_history' 'tabbar'
 'start_app' 'login' 'store_management' 'account_info'
 'order_soundbox_detail' 'payout_history' 'staff_account_management'
 'qr_detail' 'notification_setting' 'staff_invite' 'financial_assistant'
 'staff_invite_detail' 'soundbox_home' 'add_revenue'
 'trans_reconcile_detail' 'trending_aggregation' 'nfc_owner'
 'trending_detail' 'nfc_staff' 'intro' 'news_feed' 'trans_detail'
 'receiving_money_config' 'soundbox_management' 'mapping_soundbox'
 'soundbox_order_confirm' 'ec_benefit' 'paylater_setting'
 'scan_qr_payment' 'scan_qr_soundbox' 'sb_address_book' 'ec_detail'
 'staff_info' 'welcome_new_ec' 'unregistered_nike' 'soundbox_order_detail'
 'registered_nike' 'Đối tác MoMo' 'orders_history']
```

### `project-5400504384186300846.MBI_DA.dim_m4b_user`
> Bảng dimension lưu thông tin tất cả các agent_id được định nghĩa là merchant owner trên hệ thống phân quyền. Mỗi agent_id có thể liên kết với một hoặc nhiều mã merchant. Thông tin có thể được lấy từ bảng này bao gồm: 
 - Mã định danh duy nhất của agent_id 
 - Số điện thoại liên quan đến agent_id 
 - Mã merchant và số lượng mã merchant liên kết với agent_id

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | — | Mã định danh duy nhất của tất cả agent_id được định nghĩa là merchant owner. | — |
| `phone` | — | Số điện thoại liên quan đến agent_id. | — |
| `merchant_code` | — | Mã định danh merchant của agent. Hiện tại chỉ lấy merchant code cho những agent có 1 merchant code duy nhất. | — |
| `merchant_code_count` | — | Số lượng mã merchant liên kết với agent. | — |
| `secondary_merchant_code` | — | Mã định danh merchant của agent có nhiều hơn 1 merchant. Lấy tạm merchant tạo gần nhất. | — |
| `merchant_owner` | — | Hiện tại chỉ có giá trị 'YES', xác nhận có phải merchant_owner hay không. | — |
| `is_merchant_owner` | — | Hiện tại chỉ có giá trị 'YES', xác nhận có phải merchant_owner hay không. | — |

### `project-5400504384186300846.MBI_DA.fact_m4b_engage_merchant_weekly`
> Bảng fact theo dõi hoạt động hàng tuần của đối tác MoMo. Mục tiêu của bảng này gồm:
 - Theo dõi số ngày engage và số session engage trong tuần của merchant.
 - Xác định trạng thái của merchant trong tuần với các loại engage: new_engage, retain_merchant, reactivate_merchant.
 - Phân tích khả năng quay lại và hoạt động tiếp theo của merchant dựa trên tuần trước và tuần tiếp theo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `merchant_code` | — | Mã định danh của đối tác MoMo. | — |
| `days_engaged` | — | Số ngày đối tác MoMo engage trong tuần. | — |
| `sessions` | — | Tổng số phiên engage của đối tác MoMo trong tuần. | — |
| `merchant_size` | — | Quy mô của đối tác MoMo. | — |
| `is_soundbox_merchant` | — | Đối tác MoMo có đang được map với Soundbox trong tuần engagement. | — |
| `engage_week` | — | Tuần bắt đầu engage của đối tác MoMo, bắt đầu từ thứ 2. | — |
| `retain_week` | — | Tuần nếu đối tác MoMo quay lại, NULL nếu không quay lại. | — |
| `next_week` | — | Tuần tiếp theo sau tuần engage. | — |
| `retain_merchant_code` | — | Mã đối tác MoMo nếu quay lại trong tuần tiếp theo, NULL nếu không quay lại. | — |
| `retain_merchant_code_wtd` | — | (Chỉ tính tới D-1 của mỗi tuần) Mã đối tác MoMo nếu quay lại trong tuần tiếp theo, NULL nếu không quay lại. | — |
| `engaged_week_type` | — | Phân loại hoạt động của đối tác MoMo trong tuần: 1. new_engage, 2. retain_merchant, 3. reactivate_merchant, 4. Error. | — |
| `previous_engage_week` | — | Tuần engage trước đó của đối tác MoMo, NULL cho merchant mới. | — |
| `onboarding_week` | — | Tuần đầu tiên đối tác MoMo bắt đầu hoạt động. | — |
| `is_merchant_pinned_to_home` | — | True: Đối tác MoMo được pin vào HOME trong tuần engagement, False: không được pin vào home. | — |
| `last_event_time` | — | Thời gian cuối cùng có event của đối tác MoMo trong tuần engagement. | — |
**Distinct values:**
```
- Distinct value `engaged_week_type` là ['1.new_engage' '2.retain_merchant' '3.reactivate_merchant']
- Distinct value `days_engaged` là ['1' '2' '3' '7' '4' '6' '5']
- Distinct value `is_soundbox_merchant` là ['NO' 'YES']
- Distinct value `merchant_size` là ['SME OFFLINE' 'UNDEFINED' 'TOPBRAND OFFLINE']
```

### `project-5400504384186300846.MBI_DA.fact_m4b_session`
> Bảng fact thông tin sessions của merchant vào m4B. 
Thông tin thu thập bao gồm: 
- ID session engage của MoMo 
- Thông tin agent thực hiện session 
- Ngày thực hiện session 
- Thời gian bắt đầu và kết thúc của session 
- Thời gian hoạt động của session 
- Kiểm tra trạng thái thanh toán hoạt động trong 30 ngày 
- Điểm entry và thời gian vào của session 
- Kích thước và mã merchant

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `momo_session_id_v2` | — | ID session engage của MoMo | — |
| `agent_id` | — | Mã định danh cho mỗi ví MoMo | — |
| `date` | — | Ngày thực hiện session | — |
| `min_time` | — | Thời gian đầu tiên record được của session | — |
| `max_time` | — | Thời gian cuối cùng record được của session | — |
| `seconds` | — | Thời gian hoạt động của session | — |
| `is_a30_active_payment` | — | Có phải thanh toán hoạt động trong 30 ngày gần nhất không (true: có, false: không) | — |
| `entry_point` | — | Nguồn entry của session | — |
| `entry_date_time` | — | Thời gian vào của entry | — |
| `is_tran_checking_session` | — | Có phải session được kiểm tra ngay sau giao dịch không (trong 5 phút) (true: có, false: không) | — |
| `merchant_size` | — | Kích thước merchant | — |
| `merchant_code` | — | Mã định danh duy nhất của merchant trong hệ thống | — |
| `is_engagement` | — | Có phải là session engage không (true: có, false: không) | — |
**Distinct values:**
```
- Distinct value `merchant_size` là ['TOPBRAND OFFLINE' 'SME OFFLINE' 'UNDEFINED']
- Distinct value `entry_point` là ['Unidentified' 'noti' 'MMDX' 'click_search' 'click_pin_to_home']
```

### `project-5400504384186300846.MBI_DA.fact_m4b_active_merchant_monthly`
> Đây là bảng fact để tính toán các đặc điểm sử dụng của merchant trong một tháng, tập trung vào merchant đang hoạt động.
Thông tin có thể lấy từ bảng này bao gồm:
 - Tháng hoạt động của từng merchant.
 - Mã định danh và kích thước của merchant.
 - Loại cashflow và chi tiết giao dịch cuối cùng trong tháng.
 - Trạng thái template của merchant được ghim lên trang chủ.
 - Trạng thái soundbox cho merchant.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | — | Tháng active của merchant. | — |
| `merchant_code` | — | Mã định danh của merchant. | — |
| `merchant_size` | — | Merchant size của merchant. | — |
| `cashflow_type_id` | — | Loại cashflow của transaction cuối cùng trong tháng của merchant. 1: 'TTT payout', 2: 'Auto bank cashout', 3: Other (Ví thường), 0: error. | — |
| `last_tran_date_time` | — | Thời gian của transaction cuối cùng của merchant. | — |
| `pin_to_home_type_id` | — | 1: merchant template được pin vào home, 0: không pin vào home. | — |
| `is_soundbox_merchant` | — | Status được tính từ bảng D_OFF_STORE_DEVICE_SNAPSHOT, 1 lần có soundbox thì tính là soundbox merchant. | — |
**Distinct values:**
```
- Distinct value `merchant_size` là ['SME OFFLINE' 'UNDEFINED' 'TOPBRAND OFFLINE']
```

### `project-5400504384186300846.MBI_DA.natra_m4b_metric_weekly`
> Bảng lưu weekly metric của M4B SME OFFLINE merchants, base là merchant active payment. Bảng cung cấp thông tin về tính trạng hoạt động của các merchant theo tuần, bao gồm:
 - Tổng số merchant hoạt động.
 - Số lượng merchant engage và dtmm trong tuần.
 - Số lượng merchant engage và dtmm trong vòng 7 ngày từ lúc có payment.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `week` | — | Tuần. | — |
| `is_soundbox_merchant` | — | YES/NO: Tuần đó có ngày nào map với soundbox không. | — |
| `merchant_size` | — | Kích thước của merchant. | — |
| `active_merchants` | — | Số lượng merchant thực hiện thanh toán active. | — |
| `active_merchants_wtd` | — | Số lượng merchant thực hiện thanh toán active trong tuần. | — |
| `engage_merchants` | — | Số lượng merchant engage cả dtmm và lsgd. | — |
| `dtmm_merchants` | — | Số lượng merchant dtmm. | — |
| `dtmm_merchants_wtd` | — | Số lượng merchant dtmm trong tuần. | — |
| `lsgd_merchants` | — | Số lượng merchant lsgd. | — |
| `lsgd_only_merchants` | — | Số lượng merchant chỉ có lsgd. | — |
| `dtmm_only_merchants` | — | Số lượng merchant chỉ có dtmm. | — |
| `engage_merchants_on_payment` | — | Số lượng merchant engage trong vòng 7 ngày từ lúc có payment. | — |
| `dtmm_merchants_on_payment` | — | Số lượng merchant dtmm trong vòng 7 ngày từ lúc có payment. | — |
| `lsgd_merchants_on_payment` | — | Số lượng merchant lsgd trong vòng 7 ngày từ lúc có payment. | — |
| `dtmm_only_merchants_on_payment` | — | Số lượng merchant chỉ có dtmm trong vòng 7 ngày từ lúc có payment. | — |
| `lsgd_only_merchants_on_payment` | — | Số lượng merchant chỉ có lsgd trong vòng 7 ngày từ lúc có payment. | — |
**Distinct values:**
```
- Distinct value `is_soundbox_merchant` là ['YES' 'NO']
- Distinct value `merchant_size` là ['TOPBRAND OFFLINE' 'UNDEFINED' 'SME OFFLINE']
```

### `project-5400504384186300846.MBI_DA.fact_m4b_lsgd_event`
> Bảng này lưu event trong màn hình lịch sử giao dịch của những user được define là merchant. Thông tin trong bảng có thể được dùng để phân tích hành vi của người dùng đối với dịch vụ M4B, đánh giá hiệu quả của các phiên bản ứng dụng, và cung cấp dữ liệu cho việc cải thiện trải nghiệm người dùng trên MoMo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `event_timestamp` | — | Thời gian ghi nhận event. | — |
| `datetime` | — | Thời gian ghi nhận event. | — |
| `date` | — | Thời gian ghi nhận event. | — |
| `event_id` | — | ID của event, thay thế cho gen_id trong bảng EVENT_BY_SERVICE_NAME. | — |
| `agent_id` | — | Mã định danh của người dùng. | — |
| `event_name` | — | Tên của event. | — |
| `device_os` | — | Hệ điều hành của thiết bị người dùng. | — |
| `app_version` | — | Phiên bản ứng dụng MoMo được cài đặt. | — |
| `service_name` | — | Tên dịch vụ trong sự kiện. | — |
| `momo_session_id_v2` | — | Phiên làm việc của người dùng trên MoMo. | — |
| `screen_name` | — | Tên màn hình hiển thị sự kiện. | — |
| `button_name` | — | Tên nút bấm trong sự kiện. | — |
| `component_name` | — | Tên thành phần trong sự kiện. | — |
| `tab_name` | — | Tên tab liên quan đến sự kiện. | — |
| `block_name` | — | Tên block trong sự kiện. | — |
| `icon_name` | — | Tên biểu tượng trong sự kiện. | — |
| `global_trigger_id` | — | ID kích hoạt toàn cầu của sự kiện. | — |
| `selected_value` | — | Giá trị được người dùng lựa chọn. | — |
**Distinct values:**
```
- Distinct value `icon_name` là ['' 'balance' 'filter' 'expand_calendar']
- Distinct value `selected_value` là ['Chuyển tiền' 'Rút tiền' 'Nạp tiền tự động' 'Du lịch - Đi lại'
 'Thẻ trả trước' 'Từ thiện' 'Thu nhập khác' 'Finance - Insurance' 'Xuan'
 'Commission' 'no' 'Chua phan l' 'Tiền mới' 'Game' 'rút tiền về ví mô mô'
 'Đệ tửvon' '9979337799' 'Chuyển nhầm mong được trả lại' 'Minh' '10000k'
 'pepsi230523@gmail.com' 'phongtro' 'Ok' 'Vietcombank' 'okokomok' 'Thao1'
 'Trần Đến' 'Lời' 'Nguyen dc Duy' 'Ck' 'Hoá đơn' 'Nhận tiền' 'Lợi nhuận'
 'Revenue' 'Auto Topup' 'Bill Pay' 'Nguyễn Tiến đệ tử' 'Ví trả sa'
 'Nguyenquangminh' 'Ma điện thoại' 'Khám bệnh' 'Đệ tử' 'Ngô hoài hận'
 'Khoản chi khác' 'HÀNG HOÁ' 'chuyen tien' 'T' 'HUYNH NGOC QUI'
 'Huỳnh Văn Phong' 'Hoàn tiền']
- Distinct value `block_name` là ['transaction_list' '' 'upcoming' 'quick_filter_by_service' 'open_expense']
- Distinct value `device_os` là ['ANDROID' 'Android' 'iOS' 'IOS']
- Distinct value `event_name` là ['service_button_clicked' 'service_component_displayed'
 'service_component_clicked' 'service_screenshot' 'service_search_clicked'
 'service_block_displayed' 'service_search_inputed'
 'service_screen_displayed' 'service_screen_viewed'
 'service_block_clicked' 'service_icon_clicked']
- Distinct value `component_name` là ['' 'soundbox_block' 'financial_assistant' 'warning' 'calendar'
 'category_list']
- Distinct value `button_name` là ['statistic' 'date_selected' '' 'to_add_transaction' 'action_button'
 'to_trending_aggregation' 'banklink' 'soundbox' 'change_mode']
```

### `project-5400504384186300846.MBI_DA.dim_m4b_all_trigger`
> Bảng dimension lưu toàn bộ global_trigger_id hiện tại từ ứng dụng M4B. Data có thể khá raw, nên lưu ý khi sử dụng. MiMir chỉ sử dụng bảng này khi có yêu cầu trực tiếp.

Thông tin có thể được lấy từ bảng này bao gồm:
- Danh sách toàn bộ global_trigger_id từ các ứng dụng M4B.
- Thông tin chi tiết về các trigger đang hoạt động.
- Mapping với global_trigger_id để phân tích hành vi ứng dụng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `global_trigger_id` | — | Global_trigger_id, dùng để mapping với global_trigger_id trong các ứng dụng M4B. | — |
| `description` | — | Description của trigger trong ứng dụng M4B. | — |
| `app_id` | — | ID của ứng dụng M4B liên quan đến trigger. | — |
| `service_name` | — | Tên dịch vụ của ứng dụng M4B liên quan đến trigger. | — |
**Distinct values:**
```
- Distinct value `app_id` là ['airline' 'airline_change_flight_myb' 'booking_bus_new' 'bot_momo_qlct'
 'choose_promotion' 'choose_promotion_v2' 'create_promotion'
 'decentralize' 'event-trail' 'fund_home' 'ins_auto_asset'
 'ins_cyber_wallet_renewal' 'ins_gic_moto' 'ins_marketplace'
 'ins_partners_accident' 'ins_partners_car' 'ins_partners_car_renewal'
 'ins_partners_motorcycle' 'ins_partners_motorcycle_renewal'
 'instant_voucher_detail' 'kit-tracking' 'landing_page_ota' 'miniapp-load'
 'miniapp_load' 'momo.web.giatlixi' 'my_insurance_policy' 'my_vouchers'
 'pocket' 'select_promotion' 'swipe_vouchers' 'vn.momo.airline'
 'vn.momo.appx' 'vn.momo.ar' 'vn.momo.authentication' 'vn.momo.bank'
 'vn.momo.billpay' 'vn.momo.bnpl' 'vn.momo.chat' 'vn.momo.chatbot'
 'vn.momo.cinema' 'vn.momo.coinhoarding' 'vn.momo.collaborators'
 'vn.momo.cornerstone' 'vn.momo.credit_newton'
 'vn.momo.creditcardmarketplace' 'vn.momo.edu' 'vn.momo.ekyc'
 'vn.momo.expense' 'vn.momo.experiences' 'vn.momo.finance']
- Distinct value `service_name` là ['Vé máy bay' 'Chatbot Quản lý chi tiêu' 'Chọn Ưu đãi ở TTAT'
 'Chọn Ưu đãi ở POS' 'create_promotion' 'Bảo hiểm Vật chất xe ô tô'
 'Bảo hiểm Xe máy tự nguyện GIC' 'GiatLixi' 'select_promotion'
 'Ve may bay' 'vn.momo.appx' 'Mini app Bank' 'vn.momo.chat' 'Chat Bot'
 'progression' 'vn.momo.collaborators' 'Cornerstone' 'credit_card_home'
 'mini app ekyc' 'expense' 'Thanh toán khoản vay/thẻ tín dụng'
 'Remittance' 'vn.momo.flight' 'Group Fund' 'Hotel' 'ins_public_health'
 'Túi Thần Tài' 'investment_marketplace' 'Bàn tròn khảo sát' 'loan_offers'
 'vn.momo.loan_fastmoney' 'wheel' 'vn.momo.merchanttemplate'
 'vn.momo.mobilecenter' 'vn.momo.momoreward' 'Trợ thủ AI - Moni'
 'My Pocket' 'vn.momo.oa' 'local_discovery' 'Quản lý đơn hàng'
 'credit_paylater_verse_v1' 'vn.momo.payment' 'request_payment'
 'vn.momo.profile' 'vn.momo.promotion' 'vn.momo.promotionhub'
 'vn.momo.receivemoney' 'vn.momo.referral' 'vn.momo.requestmoney'
 'vn.momo.securitycenter']
```

## Memory
*2 entries — user-trained knowledge*

1. Merchant = New MC onboarding + MC soundbox + MC non-soundbox + MC active DTMM _2025-11-17_
2. Trong ngữ cảnh của MoMo M4B, một merchant là một đối tác kinh doanh có hồ sơ và thông tin định danh chi tiết trên nền tảng dịch vụ M4B của MoMo. Mỗi merchant được liên kết với một hoặc nhiều agent_id (ví MoMo) và có thể là chủ sở hữu (merchant_owner) của các agent_id này trong hệ thống phân quyền. _2025-11-17_
