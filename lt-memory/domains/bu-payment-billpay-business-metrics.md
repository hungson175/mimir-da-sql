# BU Payment: Billpay - Business metrics

**Domain ID:** `28214cde-da94-48ef-9039-00fa6f448da7`

## Description
Records all business information of Billpay services (including mau, transaction details, user demographics, etc.)

## Tables

### `project-5400504384186300846.BU_UTILITIES_TELCO.MIMIR_BILLPAY_DETAILS`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month_active` | DATE | Tháng mà người dùng thực hiện thanh toán hóa đơnThe month that the user has payment | 2025-11-01, 2025-10-01, 2025-08-01 |
| `date` | DATE | Ngày diễn ra giao dịch thanh toán hóa đơnDate of the transaction | 2025-11-03, 2025-09-03, 2025-07-03 |
| `user_id` | STRING | ID định danh duy nhất của người dùngUnique ID of a user | 85111949, 22879770, 47220537 |
| `subcategory` | STRING | Danh mục dịch vụ liên quan đến thanh toán hóa đơn. "DIEN": Điện, "NUOC": Nước, "INTERNET": Internet, "TRUONG HOC": Trường họcThe category of the service. "DIEN" means Electricity, "NUOC" means Water, "INTERNET" means Internet, "TRUONG HOC" means trường học | DIEN, NUOC, INTERNET |
| `merchant` | STRING | Tên nhà cung cấp dịch vụ hóa đơn được thanh toánName of the supplier | EVN HO CHI MINH, ADSL FPT, EVN HA NOI |
| `transaction_count` | INTEGER | Số lượng giao dịch đã thực hiệnThe number of transaction made | 1, 2, 3 |
| `amount` | FLOAT | Số tiền của các giao dịch (đơn vị: VND)The amount of the transactions (currency: VND) | 600000, 1200000, 1800000 |
| `voucher_amount` | FLOAT | Số tiền được giảm giá từ voucherThe discounted amount | 0, 60000, 20000 |
| `voucher_or_not` | STRING | Cho biết người dùng có sử dụng voucher hay không. "Voucher": Người dùng đã sử dụng voucher, "Non voucher" hoặc "Non_voucher": Người dùng không sử dụng voucher cho giao dịch đóThis shows if the user used voucher or not. "Voucher" means the user used voucher, "Non voucher" or "Non_voucher" means the user did not use voucher for that specific transaction | Non_voucher, Voucher |
| `revenue` | FLOAT | Lợi nhuận công ty từ các giao dịchRevenue our company gets from the transactions | 0, 23999.999999999996, 11999.999999999998 |
| `user_type` | STRING | Phân loại người dùng theo hóa đơn. "retain_user": Người dùng thanh toán hóa đơn hai tháng liên tiếp, "new_user": Người dùng lần đầu tiên thanh toán hóa đơn trong tháng chỉ định, "churn_user": Người dùng không thanh toán tháng trước nhưng quay lại và thanh toán trong tháng chỉ địnhSegment of the user (considered across our domain billpay). "retain_user" means the user pay in 2 consecutive months. "new_user" means the user pay the first time in the stated month. "churn_user" means the user did not pay in the month before but come back and pay in the stated month | retain_user, recover_user, new_user |
| `user_type_sub` | STRING | Phân loại người dùng theo danh mục dịch vụ liên quan đến hóa đơnSegment of the user (by subcategory) | retain_user, recover_user, new_user |
| `user_type_mer` | STRING | Phân loại người dùng theo nhà cung cấp dịch vụ hóa đơnSegment of the user (by merchant) | retain_user, recover_user, new_user |
| `region` | STRING | Khu vực địa lý nơi người dùng cư trúRegion of user's location | Đông Nam Bộ, Đồng bằng sông Hồng, Nam Trung Bộ |
| `city_group` | STRING | Nhóm thành phố nơi người dùng cư trúGroup of city of user's location | Thành Phố Hồ Chí Minh, Tỉnh khác, Hà Nội |
| `city` | STRING | Tên thành phố nơi người dùng cư trúThe city name of user's location | Hồ Chí Minh, Hà Nội, Bình Dương |
| `age` | NUMERIC | Tuổi của người dùng (null có nghĩa là không biết)User's age (null means unknown) | 31, 29, 30 |
| `age_group` | STRING | Nhóm tuổi của người dùngUser's age group | [4].28-35, [5].36-50, [3].23-27 |
| `gender` | STRING | Giới tính của người dùngUser's gender | male, female, unknown |
| `login_app_count` | INTEGER | Số lần người dùng đăng nhập ứng dụng di động của chúng tôiThe number of session that the user login our mobile application | 0, 4, 12 |
| `login_billpay_center_count` | INTEGER | Số lần người dùng đăng nhập trung tâm dịch vụ hóa đơn trong ứng dụng di động của chúng tôiThe number of session that the user login our service center inside our mobile application | 0, 12, 24 |
| `display_xbanner_count` | INTEGER | Số lần người dùng nhìn thấy xbanner (banner nhắc nợ) trong ứng dụng của chúng tôi khi đến hạnThe number of session that the user saw our xbanner (or x-banner). Xbanner is debt remind banner that we show the user inside our app when it comes to the due date | 0, 12, 6 |
| `click_xbanner_count` | INTEGER | Số lần người dùng nhấn chuột vào xbanner của chúng tôiThe number of clicks that the user clicked on our xbanner | 0, 12, 6 |

### `momovn-prod.BU_UTILITIES_TELCO.USER_JOURNEY_BILLPAY_PIVOT`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `dt` | DATE | Ngày phát sinh dữ liệu.date | 2023-03-10, 2023-03-15, 2023-03-14 |
| `user_id` | STRING | Mã định danh duy nhất cho mỗi người dùng.Unique ID of each user | 8169410, 13016619, 31968159 |
| `bill_detail_screen` | INTEGER | Số lượng sự kiện khi người dùng nhìn hoặc hiển thị màn hình chi tiết hóa đơn.Number of events of viewing or displaying bill detail screen | 2, 4, 1 |
| `billpay_center_screen` | INTEGER | Số lượng sự kiện khi người dùng nhìn hoặc hiển thị màn hình dịch vụ trung tâm billpay. Billpay là một dịch vụ của Momo.Number of events of viewing or displaying billpay center service home screen. Billpay is our domain | 2, 1, 4 |
| `Button_save_bill` | INTEGER | Số lượng sự kiện khi người dùng kiểm tra thông tin hóa đơn thành công và lưu hóa đơn.Number of event that user check bill information successfully, and that bill is saved | 1, 2, 3 |
| `button_trans_result` | INTEGER | Số lượng sự kiện kết quả của giao dịch thông qua nút bấm. | 1, 2, 4 |
| `click_noti` | INTEGER | Số lượng sự kiện khi người dùng nhấp vào thông báo về dịch vụ Billpay.Number of event that user click a notification about billpay service | 1, 2, 3 |
| `click_xbanner` | INTEGER | Số lượng sự kiện khi người dùng nhấp vào X-banner. X-banner là một thông báo đặc biệt trong lĩnh vực của chúng tôi.Number of event that user click X-banner (or xbanner). X-banner (or Xbanner) is a special notification of our domain. | 1, 2, 3 |
| `close_xbanner` | INTEGER | Số lượng sự kiện khi người dùng đóng X-banner. X-banner là một thông báo đặc biệt trong lĩnh vực của chúng tôi.Number of event that user close X-banner (or xbanner). X-banner (or Xbanner) is a special notification of our domain. | 1, 2, 0 |
| `displayed_xbanner` | INTEGER | Số lượng sự kiện khi X-banner được hiển thị cho người dùng.Number of event that X-banner is displayed to user | 1, 2, 3 |
| `MHTTAT` | INTEGER | Số lượng sự kiện khi màn hình thanh toán an toàn (MHTTAT) được hiển thị cho người dùng.Number of event that secured payment screen (MHTTAT means màn hình thanh toán an toàn or secured payment screen) is displayed to user | 1, 2, 3 |
| `my_wallet` | INTEGER | Số lượng sự kiện liên quan đến tính năng ví của tôi trong ứng dụng. | 1, 2, 3 |
| `search` | INTEGER | Số lượng sự kiện khi người dùng thực hiện thao tác tìm kiếm. | 1, 2, 3 |
| `trans_confirmation` | INTEGER | Số lượng sự kiện xác nhận giao dịch. | 1, 2, 3 |
| `icon_click` | INTEGER | Số lượng sự kiện khi người dùng nhấp vào biểu tượng trên màn hình Home của Momo để truy cập vào màn hình trung tâm billpay.Number of event that user click the icon in Momo Home screen to visit Billpay center screen. (Momo is our mobile application, Billpay is our domain or a service inside Momo) | 1, 2, 3 |

### `momovn-prod.BU_UTILITIES_TELCO.BILLPAY_ADD_BILLS`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `user_id` | STRING | ID duy nhất của người dùng.Unique ID of the user | 41202429, 41625780, 19006549 |
| `bill_id` | STRING | ID duy nhất của hóa đơn.Unique ID of the bill | — |
| `category` | STRING | Dịch vụ mà hóa đơn thuộc về. Danh mục 'Điện' tương ứng với dịch vụ Điện. Danh mục 'Nước' tương ứng với dịch vụ Nước.Service that the bill belongs to. Category "Điện" = service Điện. Category "Nước" = service Nước | Điện, Finance Collection Inapp, Nước |
| `add_bill_date` | DATE | Ngày mà người dùng kiểm tra và thêm hóa đơn thành công vào ví điện tử của họ.The date that user check and add the bill successfully to user's digital wallet | 2022-06-23, 2024-09-10, 2021-03-10 |
| `age_group` | STRING | Nhóm tuổi của người dùng.User's age group | [5]. 31 - 35 Y/O, [4]. 27 - 30 Y/O, [7]. >40 Y/O |
| `most_city_a60` | STRING | Tên thành phố mà người dùng đã sinh sống trong 60 ngày gần nhất.Name of the city of user's location over the last 60 days | UNKNOWN, HỒ CHÍ MINH, HÀ NỘI |
| `most_district_a60` | STRING | Tên quận mà người dùng đã sinh sống trong 60 ngày gần nhất.Name of the district of user's location over the last 60 days | UNKNOWN, BÌNH THẠNH, GÒ VẤP |
| `most_ward_a60` | STRING | Tên phường mà người dùng đã sinh sống trong 60 ngày gần nhất.Name of the ward of user's location over the last 60 days | — |
| `most_region` | STRING | Tên khu vực mà người dùng đã sinh sống trong 60 ngày gần nhất.Name of the region of user's location over the last 60 days | ĐÔNG NAM BỘ, UNKNOWN, ĐỒNG BẰNG SÔNG HỒNG |

## Memory
*2 entries — user-trained knowledge*

1. Tháng này: tháng này là date_trunc(date(current_date('+7')), month ) _BILLPAY - Business metrics · 2025-05-13_
2. Số người truy cập billpay: Số người truy cập billpay = count(distinct case when billpay_center_screen > 0 then user_id end) _BILLPAY - Business metrics · 2025-05-13_
