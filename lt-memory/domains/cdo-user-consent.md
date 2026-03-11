# CDO: User Consent

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `350f9466-757c-4292-af88-5e7e16e65d6a`

## Description
Dữ liệu user đồng ý chia sẻ dữ liệu cá nhân với MoMo

## Tables

### `momovn-prod.MBI_DA.BEHALF_USERS_CONSENT_HISTORY`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `CHANGE_ID` | STRING | ID thay đổi, định danh duy nhất cho mỗi lần chấp thuận hoặc thay đổi quyền. | 1756409280640-ea5bb11c-7916-422c, 1750051649664-95e11118-2416-4b57, 490efb11-f0ca-418c-bfe9-56b2509efe27 |
| `PERMISSION_ID` | STRING | ID quyền, định danh duy nhất cho mỗi loại quyền được cấp cho người dùng. | 81, 80, 75 |
| `ACTION` | INTEGER | Hành động thực hiện, loại hành động liên quan đến việc chấp thuận quyền. | 1, 0 |
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo của người đại diện. | 77471588, 96586354, 51839407 |
| `ATTRIBUTE` | STRING | Thuộc tính của quyền hay hành động chấp thuận. | privacy_ttat_optional_v1, privacy_ttat_require_v1, policy_1.0_0623 |
| `MINI_APP_ID` | STRING | ID của mini app liên quan đến hành động chấp thuận. | internal.mservice.onboarding_paylater, vn.momo.appx, internal.mservice.service-bank-v2 |
| `MINI_APP_USER_ID` | STRING | ID người dùng trong mini app. | — |
| `PARTNER_CODE` | STRING | Mã đối tác, xác định đối tác liên kết với hành động chấp thuận. | onboarding_paylater, , service-bank-v2 |
| `PARTNER_USER_ID` | STRING | ID người dùng bên đối tác. | — |
| `UPDATE_AT` | DATETIME | Thời điểm cập nhật hành động chấp thuận. | 2025-06-25 08:54:55, 2025-05-16 05:57:12, 2025-05-05 06:56:53 |
| `USER_ID` | STRING | ID người dùng MoMo có hành động chấp thuận. | — |
| `DT` | DATE | Ngày thực hiện hành động chấp thuận. | 2025-10-09 |

### `momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_TRANS`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo. | 26290715, 43774219, 70357099 |
| `IS_A30_USER` | STRING | Trạng thái người dùng hoạt động trong vòng 30 ngày trước ngày hiện tại. | A30 |
| `IS_A60_USER` | STRING | Trạng thái người dùng hoạt động trong vòng 60 ngày trước ngày hiện tại. | A60 |
| `IS_A90_USER` | STRING | Trạng thái người dùng hoạt động trong vòng 90 ngày trước ngày hiện tại. | A90 |
| `HAVE_TRANS` | STRING | Trạng thái cho biết người dùng có thực hiện giao dịch nào không. | Have at least 1 trans |
| `LAST_TRANS` | DATETIME | Thời gian thực hiện giao dịch cuối cùng của người dùng. | 2025-10-10 20:29:29, 2025-10-10 21:28:49, 2025-10-10 21:00:12 |
| `TTAT_REQUIRE` | BOOLEAN | Trạng thái cho biết các điều khoản và chính sách cần thiết mà người dùng phải đồng ý (true: cần thiết, false: không cần thiết). | false, true |
| `TTAT_OPTIONAL` | BOOLEAN | Trạng thái cho biết các điều khoản và chính sách tùy chọn mà người dùng có thể đồng ý (true: tùy chọn, false: không tùy chọn). | true, false |
| `OLD_POLICY` | BOOLEAN | Trạng thái cho biết người dùng có đồng ý với chính sách cũ không (true: có đồng ý, false: không đồng ý). | false, true |
| `CONSENT_TYPE` | STRING | Loại hình đồng ý của người dùng đối với các điều khoản và chính sách. | [4]. Chưa consent, N/A, [1]. Consent cho cả Platform và 3rd Party |

### `momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_LOGIN`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo. | 77124227, 47055898, 55584489 |
| `IS_A30_LOGIN` | STRING | Xác định người dùng có thực hiện đăng nhập không. Giá trị có thể là A30 (30 ngày trước ngày hiện tại). | A30 |
| `IS_A60_LOGIN` | STRING | Xác định người dùng có thực hiện đăng nhập không. Giá trị có thể là A60 (60 ngày trước ngày hiện tại). | A60 |
| `IS_A90_LOGIN` | STRING | Xác định người dùng có thực hiện đăng nhập không. Giá trị có thể là A90 (90 ngày trước ngày hiện tại). | A90 |
| `LOGIN_SINCE_2022` | STRING | Xác định nếu người dùng đã thực hiện đăng nhập từ năm 2022. | Login at least 1 time since 2022-01-01 |
| `LAST_LOGIN` | DATE | Ngày người dùng thực hiện đăng nhập lần cuối. | 2025-10-10, 2025-10-09, 2025-10-08 |
| `TTAT_REQUIRE` | BOOLEAN | Xác định yêu cầu tính năng túi thần tài trong quá trình đồng ý. (true: có yêu cầu, false: không yêu cầu) | true, false |
| `TTAT_OPTIONAL` | BOOLEAN | Xác định tùy chọn tính năng túi thần tài trong quá trình đồng ý. (true: tùy chọn, false: không tùy chọn) | true, false |
| `OLD_POLICY` | BOOLEAN | Xác định nếu sự đồng ý theo chính sách cũ. (true: chính sách cũ, false: không phải chính sách cũ) | false, true |
| `CONSENT_TYPE` | STRING | Loại sự đồng ý của người dùng. | [4]. Chưa consent, [1]. Consent cho cả Platform và 3rd Party, N/A |

### `momovn-prod.MBI_DA.USER_CONSENT_BREAKDOWN_BY_MINIAPP`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `AGENT_ID` | STRING | Mã định danh cho mỗi ví MoMo. | 100824124, 43575064, 50694790 |
| `MINIAPP_NAME` | STRING | Tên của ứng dụng miniapp. | Highlands Coffee, The Coffee House, Jollibee |
| `MINI_APP_ID` | STRING | Mã định danh của ứng dụng miniapp. | miniapp.R18Dwd2LljOg00Wbt2Cm.highlandscoffee, miniapp.my5lEou2y4J26uNfUDfw.jollibee, miniapp.DpKLL2veAT3U05kBMTIM.kfc |
| `MINIAPP_LOGIN_NO` | INTEGER | Số lần người dùng đã đăng nhập vào ứng dụng miniapp. | 1, 2, 3 |
| `IS_CONSENT` | BOOLEAN | Là giá trị boolean xác định người dùng có đồng ý điều khoản của miniapp hay không. true: đồng ý, false: không đồng ý. | false, true |
| `MINIAPP_WITH_TRANS_NO` | INTEGER | Số lượng giao dịch được thực hiện qua miniapp. | 0, 1, 2 |

### `momovn-prod.MBI_DA.USER_CONSENT_DAILY`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `CONSENT_DAY` | DATE | Ngày mà người dùng đã đồng ý với các yêu cầu hoặc tùy chọn trên nền tảng. | 2025-04-17, 2025-07-28, 2025-05-09 |
| `TOTAL_USER_CONSENT` | INTEGER | Tổng số người dùng đã đồng ý với các yêu cầu hoặc tùy chọn trong ngày đó. | 39769, 47005, 43512 |
| `TOTAL_CONSENT_REQUIRE_POPUP` | INTEGER | Tổng số người dùng đã đồng ý sau khi xem popup bắt buộc. | 22709, 23130, 22208 |
| `TOTAL_CONSENT_OPTIONAL_POPUP` | INTEGER | Tổng số người dùng đã đồng ý sau khi xem popup tùy chọn. | 24696, 26484, 20876 |
| `TOTAL_CONSENT_OLD_POPUP` | INTEGER | Tổng số người dùng đã đồng ý sau khi xem popup cũ. | 12630, 11669, 12062 |
| `TOTAL_CONSENT_MINIAPP` | INTEGER | Tổng số người dùng đã đồng ý thông qua miniapp. | 46, 22925, 21227 |

### `momovn-prod.MBI_DA.USER_CONSENT_MONTHLY`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `CONSENT_MONTH` | DATE | Tháng mà dữ liệu sự đồng ý của người dùng được ghi nhận. | — |
| `TOTAL_USER_CONSENT` | INTEGER | Tổng số lượng người dùng đã đồng ý cho phép sử dụng dịch vụ trong tháng. | — |
| `TOTAL_CONSENT_REQUIRE_POPUP` | INTEGER | Tổng số lượng người dùng yêu cầu sự đồng ý qua giao diện pop-up bắt buộc. | — |
| `TOTAL_CONSENT_OPTIONAL_POPUP` | INTEGER | Tổng số lượng người dùng đồng ý thông qua giao diện pop-up tùy chọn. | — |
| `TOTAL_CONSENT_OLD_POPUP` | INTEGER | Tổng số lượng người dùng đồng ý thông qua giao diện pop-up cũ. | — |
| `TOTAL_CONSENT_MINIAPP` | INTEGER | Tổng số lượng người dùng đồng ý thông qua mini app. | — |

### `project-5400504384186300846.MBI_DA.D_OP_USER_PROFILE`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | INTEGER | Mã định danh cho mỗi ví MoMo. | — |
| `phone_new` | STRING | Số điện thoại mới của người dùng. | — |
| `phone_old` | STRING | Số điện thoại cũ của người dùng. | — |
| `is_end_user` | BOOLEAN | Điều kiện xác định người dùng cuối. True: là người dùng cuối, False: không phải người dùng cuối. | — |
| `is_deleted` | BOOLEAN | Điều kiện xác định nếu tài khoản người dùng đã bị xóa. True: tài khoản bị xóa, False: tài khoản không bị xóa. | — |
| `is_active` | BOOLEAN | Trạng thái hoạt động của tài khoản người dùng. True: tài khoản hoạt động, False: tài khoản không hoạt động. | — |
| `register_datetime` | DATETIME | Ngày và giờ đăng ký tài khoản của người dùng. | — |
| `deletion_datetime` | DATETIME | Ngày và giờ tài khoản người dùng bị xóa. | — |
| `email` | STRING | Email liên kết với tài khoản người dùng. | — |
| `phone_carrier` | STRING | Nhà mạng của số điện thoại người dùng. | — |
| `device_os` | STRING | Hệ điều hành của thiết bị người dùng đang sử dụng. | — |
| `capset` | STRING | Thông tin về thiết bị và cài đặt của người dùng. | — |
| `last_login` | DATE | Ngày cuối cùng người dùng đăng nhập. | — |
| `is_momo_employee` | BOOLEAN | Điều kiện xác định nhân viên MoMo. True: là MoMoer, False: không phải MoMoer. | — |
| `user_name` | STRING | Tên người dùng trên tài khoản MoMo. | — |
| `gender` | STRING | Giới tính của người dùng. | — |
| `gender_source` | STRING | Nguồn xác định thông tin giới tính của người dùng. | — |
| `age` | INTEGER | Tuổi của người dùng. | — |
| `yob` | INTEGER | Năm sinh của người dùng. | — |
| `dob` | DATE | Ngày sinh của người dùng. | — |
| `age_group` | STRING | Nhóm tuổi của người dùng. | — |
| `age_source` | STRING | Nguồn xác định thông tin tuổi của người dùng. | — |
| `is_face_matching` | BOOLEAN | Điều kiện xác nhận nếu đã đối chiếu khuôn mặt người dùng. True: khuôn mặt hợp lệ, False: khuôn mặt không hợp lệ. | — |
| `is_kyc` | BOOLEAN | Điều kiện xác nhận KYC của người dùng. True: đã xác minh KYC, False: chưa xác minh KYC. | — |
| `verify_info` | STRING | Thông tin xác thực của người dùng. | — |
| `kyc_confirm` | STRING | Xác nhận thông tin KYC của người dùng. | — |
| `kyc_id_card_type` | STRING | Loại thẻ ID sử dụng để xác minh KYC của người dùng. | — |
| `kyc_id_card_type_detail` | STRING | Chi tiết loại thẻ ID của người dùng. | — |
| `kyc_issue_place` | STRING | Nơi phát hành thẻ ID của người dùng. | — |
| `kyc_level` | STRING | Cấp độ xác minh KYC của người dùng. | — |
| `kyc_nationality` | STRING | Quốc gia đã xác minh trong KYC của người dùng. | — |
| `kyc_name` | STRING | Tên đã xác minh trong KYC của người dùng. | — |
| `kyc_address` | STRING | Địa chỉ đã xác minh trong KYC của người dùng. | — |
| `kyc_dob` | DATE | Ngày sinh xác minh trong KYC của người dùng. | — |
| `kyc_issue_date` | DATE | Ngày phát hành thẻ ID xác minh KYC của người dùng. | — |
| `kyc_expired_date` | DATE | Ngày hết hạn thẻ ID xác minh KYC của người dùng. | — |
| `kyc_gender` | STRING | Giới tính xác minh trong KYC của người dùng. | — |
| `kyc_expiration_type` | STRING | Kiểu hết hạn của thẻ ID trong KYC. | — |
| `bank_code` | STRING | Mã ngân hàng của người dùng. | — |
| `bank_name` | STRING | Tên ngân hàng của người dùng. | — |
| `bank_verify_name` | STRING | Tên xác minh từ ngân hàng của người dùng. | — |
| `bank_verify_personalid` | STRING | ID cá nhân đã xác minh từ ngân hàng của người dùng. | — |
| `bank_acc_no` | STRING | Số tài khoản ngân hàng của người dùng. | — |
| `bank_verify_dob` | DATE | Ngày sinh đã xác minh từ ngân hàng của người dùng. | — |
| `email_bank` | STRING | Email liên kết với tài khoản ngân hàng của người dùng. | — |
| `map_visa` | BOOLEAN | Điều kiện kết nối với thẻ Visa. True: đã kết nối, False: chưa kết nối. | — |
| `first_map_visa` | DATETIME | Ngày và giờ đầu tiên kết nối với Visa. | — |
| `map_bank` | BOOLEAN | Điều kiện kết nối với ngân hàng của người dùng. True: đã kết nối, False: chưa kết nối. | — |
| `first_map_bank` | DATE | Ngày đầu tiên kết nối với ngân hàng. | — |
| `mapbank_last_status` | STRING | Trạng thái cuối cùng của kết nối với ngân hàng. | — |
| `mapbank_last_date` | DATETIME | Ngày cuối cùng kết nối với ngân hàng. | — |
| `name_first_bank_cashin` | STRING | Tên ngân hàng đầu tiên người dùng nạp tiền vào. | — |
| `first_date_bank_cashin` | DATETIME | Ngày đầu tiên người dùng nạp tiền vào ngân hàng. | — |
| `name_last_bank_cashin` | STRING | Tên ngân hàng cuối cùng người dùng nạp tiền vào. | — |
| `last_date_bank_cashin` | DATETIME | Ngày cuối cùng người dùng nạp tiền vào ngân hàng. | — |
| `n_time_map_bank` | INTEGER | Số lần người dùng kết nối với ngân hàng. | — |
| `n_time_unmap_bank` | INTEGER | Số lần người dùng huỷ kết nối ngân hàng. | — |
| `last_date_unmap_bank` | DATETIME | Ngày cuối cùng người dùng huỷ kết nối ngân hàng. | — |
| `map_napas` | BOOLEAN | Điều kiện kết nối với Napas. True: đã kết nối, False: chưa kết nối. | — |
| `first_map_napas` | DATE | Ngày đầu tiên kết nối với Napas. | — |
| `n_time_map_napas` | INTEGER | Số lần kết nối với Napas. | — |
| `n_time_unmap_napas` | INTEGER | Số lần huỷ kết nối với Napas. | — |
| `last_date_unmap_napas` | DATETIME | Ngày cuối cùng huỷ kết nối với Napas. | — |
| `name_last_bank_napas` | STRING | Tên ngân hàng cuối cùng người dùng kết nối với Napas. | — |
| `map_sacom_card` | BOOLEAN | Điều kiện kết nối với thẻ Sacom. True: đã kết nối, False: chưa kết nối. | — |
| `first_map_sacom_card` | DATE | Ngày đầu tiên kết nối với thẻ Sacom. | — |
| `first_a30_trans` | DATETIME | Ngày và giờ thực hiện giao dịch A30 đầu tiên. | — |
| `is_a30_user` | BOOLEAN | Điều kiện xác định người dùng A30. True: là người dùng A30, False: không phải người dùng A30. | — |
| `last_trans` | DATETIME | Ngày và giờ thực hiện giao dịch cuối cùng. | — |
| `first_service_code` | STRING | Mã dịch vụ đầu tiên người dùng sử dụng. | — |
| `first_group_code_l1` | STRING | Mã nhóm L1 đầu tiên người dùng sử dụng. | — |
| `first_newvertical_merchant` | STRING | Người bán mới thuộc ngành dọc đầu tiên kết nối. | — |
| `first_service_description` | STRING | Mô tả dịch vụ đầu tiên người dùng sử dụng. | — |
| `first_specialproject` | STRING | Dự án đặc biệt đầu tiên người dùng tham gia. | — |
| `second_service_code` | STRING | Mã dịch vụ thứ hai người dùng sử dụng. | — |
| `second_group_code_l1` | STRING | Mã nhóm L1 thứ hai người dùng sử dụng. | — |
| `second_newvertical_merchant` | STRING | Người bán mới thuộc ngành dọc thứ hai kết nối. | — |
| `second_service_description` | STRING | Mô tả dịch vụ thứ hai người dùng sử dụng. | — |
| `second_specialproject` | STRING | Dự án đặc biệt thứ hai người dùng tham gia. | — |
| `third_service_code` | STRING | Mã dịch vụ thứ ba người dùng sử dụng. | — |
| `third_group_code_l1` | STRING | Mã nhóm L1 thứ ba người dùng sử dụng. | — |
| `third_newvertical_merchant` | STRING | Người bán mới thuộc ngành dọc thứ ba kết nối. | — |
| `third_service_description` | STRING | Mô tả dịch vụ thứ ba người dùng sử dụng. | — |
| `third_specialproject` | STRING | Dự án đặc biệt thứ ba người dùng tham gia. | — |
| `most_service_code` | STRING | Mã dịch vụ người dùng sử dụng nhiều nhất. | — |
| `most_newvertical_merchant` | STRING | Người bán mới thuộc ngành dọc người dùng kết nối nhiều nhất. | — |
| `most_service_description` | STRING | Mô tả dịch vụ người dùng sử dụng nhiều nhất. | — |
| `most_specialproject` | STRING | Dự án đặc biệt người dùng tham gia nhiều nhất. | — |
| `is_cheat_user` | BOOLEAN | Điều kiện xác định người dùng gian lận. True: là người dùng gian lận, False: không phải người dùng gian lận. | — |
| `cheat_source` | STRING | Nguồn phát hiện hành vi gian lận của người dùng. | — |
| `location_month` | DATE | Tháng và năm của vị trí người dùng. | — |
| `most_city_a60` | STRING | Thành phố người dùng hoạt động nhiều nhất trong 60 ngày qua. | — |
| `most_district_a60` | STRING | Quận người dùng hoạt động nhiều nhất trong 60 ngày qua. | — |
| `most_ward_a60` | STRING | Phường người dùng hoạt động nhiều nhất trong 60 ngày qua. | — |
| `location_method` | STRING | Phương pháp xác định vị trí người dùng. | — |
| `most_region` | STRING | Vùng người dùng hoạt động nhiều nhất. | — |
| `most_group_region_vn` | STRING | Nhóm vùng người dùng Việt Nam hoạt động nhiều nhất. | — |
| `is_consent` | BOOLEAN | Điều kiện xác nhận đồng ý của người dùng. True: đã đồng ý, False: chưa đồng ý. | — |
| `creation_date` | DATE | Ngày tạo tài khoản của người dùng. | — |
