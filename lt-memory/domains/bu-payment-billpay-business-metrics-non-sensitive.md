# BU Payment: Billpay - Business metrics (Non Sensitive)

**Domain ID:** `f9ccec9b-d24b-47b8-9e81-1805aa865726`

## Description
Records all business information of Billpay services (including mau, transaction details, user demographics, etc.)

## Tables

### `project-5400504384186300846.BU_UTILITIES_TELCO.MIMIR_BILLPAY_DETAILS`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month_active` | DATE | Tháng mà người dùng thực hiện thanh toánThe month that the user has payment | 2025-11-01, 2025-10-01, 2025-09-01 |
| `date` | DATE | Ngày diễn ra giao dịchDate of the transaction | 2025-11-03, 2025-09-03, 2025-07-03 |
| `user_id` | STRING | ID duy nhất của người dùngUnique ID of a user | 85111949, 43416840, 22879770 |
| `subcategory` | STRING | Danh mục của dịch vụ: "DIEN" là Điện, "NUOC" là Nước, "INTERNET" là Internet, "TRUONG HOC" là Trường họcThe category of the service. "DIEN" means Electricity, "NUOC" means Water, "INTERNET" means Internet, "TRUONG HOC" means trường học | DIEN, NUOC, INTERNET |
| `merchant` | STRING | Tên của nhà cung cấp dịch vụName of the supplier | EVN HO CHI MINH, ADSL FPT, EVN HA NOI |
| `transaction_count` | INTEGER | Số lượng giao dịch đã thực hiệnThe number of transaction made | 1, 2, 3 |
| `amount` | FLOAT | Số tiền của các giao dịch (đơn vị: VNĐ)The amount of the transactions (currency: VND) | 600000, 1200000, 1800000 |
| `voucher_amount` | FLOAT | Số tiền được giảm giáThe discounted amount | 0, 60000, 20000 |
| `voucher_or_not` | STRING | Chỉ ra người dùng có sử dụng voucher hay không: "Voucher" nghĩa là người dùng đã sử dụng voucher, "Non voucher" hoặc "Non_voucher" nghĩa là người dùng không sử dụng voucher trong giao dịch cụ thể đóThis shows if the user used voucher or not. "Voucher" means the user used voucher, "Non voucher" or "Non_voucher" means the user did not use voucher for that specific transaction | Non_voucher, Voucher |
| `revenue` | FLOAT | Doanh thu công ty nhận được từ các giao dịchRevenue our company gets from the transactions | 0, 23999.999999999996, 11999.999999999998 |
| `user_type` | STRING | Phân loại người dùng (theo tiêu chí hóa đơn): "retain_user" nghĩa là người dùng thanh toán trong 2 tháng liên tiếp, "new_user" nghĩa là người dùng thanh toán lần đầu trong tháng đã cho biết, "churn_user" nghĩa là người dùng không thanh toán trong tháng trước nhưng quay lại và thanh toán trong tháng đã cho biếtSegment of the user (considered across our domain billpay). "retain_user" means the user pay in 2 consecutive months. "new_user" means the user pay the first time in the stated month. "churn_user" means the user did not pay in the month before but come back and pay in the stated month | retain_user, recover_user, new_user |
| `user_type_sub` | STRING | Phân loại người dùng theo danh mục phụSegment of the user (by subcategory) | retain_user, recover_user, new_user |
| `user_type_mer` | STRING | Phân loại người dùng theo nhà cung cấpSegment of the user (by merchant) | retain_user, recover_user, new_user |
| `region` | STRING | Vùng của vị trí người dùngRegion of user's location | Đông Nam Bộ, Đồng bằng sông Hồng, Nam Trung Bộ |
| `city_group` | STRING | Nhóm thành phố của vị trí người dùngGroup of city of user's location | Thành Phố Hồ Chí Minh, Tỉnh khác, Hà Nội |
| `city` | STRING | Tên thành phố của vị trí người dùngThe city name of user's location | Hồ Chí Minh, Hà Nội, Bình Dương |
| `age` | NUMERIC | Tuổi của người dùng (null nghĩa là không rõ)User's age (null means unknown) | 31, 29, 30 |
| `age_group` | STRING | Nhóm tuổi của người dùngUser's age group | [4].28-35, [5].36-50, [3].23-27 |
| `gender` | STRING | Giới tính của người dùngUser's gender | male, female, unknown |
| `login_app_count` | INTEGER | Số phiên mà người dùng đăng nhập vào ứng dụng di động của chúng tôiThe number of session that the user login our mobile application | 0, 4, 12 |
| `login_billpay_center_count` | INTEGER | Số phiên mà người dùng đăng nhập vào trung tâm dịch vụ hóa đơn bên trong ứng dụng di động của chúng tôiThe number of session that the user login our service center inside our mobile application | 0, 12, 24 |
| `display_xbanner_count` | INTEGER | Số phiên mà người dùng đã thấy xbanner (banners nhắc nợ) trong ứng dụng khi đến hạnThe number of session that the user saw our xbanner (or x-banner). Xbanner is debt remind banner that we show the user inside our app when it comes to the due date | 0, 12, 6 |
| `click_xbanner_count` | INTEGER | Số lần người dùng nhấp vào xbannerThe number of clicks that the user clicked on our xbanner | 0, 12, 6 |
