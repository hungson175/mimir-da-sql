# BU Payment: Data (Non Sensitive)

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `be004a0c-5e7c-442d-ab51-a7026eed5433`

## Description
All detailed transaction of service Data since 2021

## Tables

### `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | INTEGER | Mã định danh của giao dịchtransaction id | — |
| `date` | DATE | Ngày thực hiện giao dịchngày thực hiện id | — |
| `datetime` | DATETIME | Thời gian thực hiện giao dịchthời gian thực hiện id | — |
| `hour` | INTEGER | Giờ thực hiện giao dịchgiờ thực hiện id | — |
| `user_payment` | FLOAT | ID người dùng thực hiện giao dịchuser_id thực hiện id | — |
| `amount` | FLOAT | Tổng số tiền của giao dịchtổng số tiền của id | — |
| `mm_amount` | FLOAT | Tổng số tiền dùng trong ngăn ví Momo của giao dịchtổng số tiền dùng trong ngăn ví momo của id | — |
| `vc_amount` | FLOAT | Tổng số tiền khuyến mãi của giao dịchtổng số tiền khuyến mãi của id | — |
| `voucher_or_not` | STRING | Phân loại giao dịch có sử dụng voucher hay không. Voucher: giao dịch có sử dụng voucher, Non voucher: giao dịch không sử dụng voucherphân loại giao dịch có sử dụng voucher hay không, Voucher: id có sử dụng voucher, Non voucher: giao dịch không sử dụng voucher (giao dịch organic) | — |
| `cate` | STRING | Nhà mạng của người được nạpNhà mạng của người được nạp | — |
| `service` | STRING | Dịch vụ sử dụng: TOPUP: topup, MATHE: mã thẻ, COMBO: combo data, SIM: dịch vụ mua SIM, OTHER: Dịch vụ khácDịch vụ sử dụng: TOPUP: topup, MATHE: mã thẻ, COMBO: combo data, SIM: dịch vụ mua sim, OTHER: Dịch vụ khác | — |
| `subcategory` | STRING | Phân loại phụ của dịch vụ | — |
| `group_service` | STRING | Nhóm dịch vụ | — |
| `merchant` | STRING | Tên dịch vụ và nhà mạng của giao dịch, được viết dưới dạng in hoa không dấuTên dịch vụ + nhà mạng của id, được viết dưới dạng in hoa không dấu | — |
| `region` | STRING | Khu vực của merchantKhu vực của merchant | — |
| `supplier` | STRING | Nhà cung cấp của giao dịchNhà cung cấp của id | — |
| `service_code` | STRING | Mã dịch vụ | — |
| `bonus` | FLOAT | Số tiền thưởng thêm cho người dùngsố tiền bonus cho user | — |
| `gender` | STRING | Giới tính của người dùnggiới tính của user | — |
| `group_age` | STRING | Nhóm độ tuổi của người dùnggroup độ tuổi của user | — |
| `age` | NUMERIC | Độ tuổi của người dùngđộ tuổi của user | — |
| `statusid` | INTEGER | Trạng thái giao dịch, 6 = giao dịch thất bại, 2 = giao dịch thành côngtrạng thái giao dịch, 6 = giao dịch thất bại, 2 = giao dịch thành công | — |
| `group_user` | STRING | Nhóm người dùng | — |
| `province` | STRING | Tỉnh thành nơi người dùng đang ởTỉnh thành user đang ở | — |
| `province_group` | STRING | Nhóm tỉnh thành nơi người dùng đang ởgroup tỉnh tính user đang ở | — |
| `Revenue` | FLOAT | Doanh thu của giao dịchDoanh thu của id | — |
| `quantity` | FLOAT | Số lượng sản phẩm người dùng muaSố lượng sản phẩm user mua | — |
| `menh_gia` | FLOAT | Mệnh giá của sản phẩmmệnh giá của sản phẩm | — |
| `goi_cuoc` | STRING | Mã gói cước của sản phẩmmã gói cước của sản phẩm | — |
| `dung_luong` | STRING | Dung lượng data của gói cướcdung lượng data của gói cước | — |
| `expire` | STRING | Thời gian hết hạn của gói cướcThời gian hết hạn của gói cước | — |
| `month_active` | DATE | Tháng người dùng kích hoạtTháng user active | — |
| `user_segment` | STRING | Phân khúc người dùng trong tháng active: retain_user: user đã active ở tháng trước đó và tháng này tiếp tục active, recover_user: user rời dịch vụ hơn 1 tháng và quay lại active dịch vụ tháng này, mew_user: user chưa từng active dịch vụ Data trước đóSegment của user trong tháng active. retain_user: user đã active ở tháng trước đó và tháng này tiếp tục active, recover_user: user churn Airtime hơn 1 tháng và quay lại active dịch vụ tháng này, mew_user: user chưa từng active dịch vụ Data trước đó | — |
| `churn_duration` | INTEGER | Số tháng người dùng rời bỏ dịch vụsố tháng user rời bỏ dịch vụ | — |
| `money_source` | STRING | Nguồn tiền người dùng sử dụng cho giao dịchNguồn tiền user sử dụng cho giao dịch | — |
| `typeid` | STRING | Thẻ quà/mã nhập sử dụng cho khuyến mãiThẻ quà/mã nhập sử dụng cho promotion | — |
| `voucher_cost` | FLOAT | Chi phí voucher | — |
| `telco_source` | STRING | Điểm xuất phát từ miniapp của giao dịchEntry point từ miniapp của giao dịch | — |
| `serviceid` | STRING | Mã dịch vụservice id | — |
| `telco_source_raw` | STRING | Dữ liệu thô điểm xuất phát từ telco | — |
| `suffix` | STRING | Điểm tiếp nhận nội bộ của giao dịch (ví dụ: button screen,...)internal entry point của giao dịch (ex: button screen,...) | — |
| `user_raw` | STRING | Dữ liệu thô người dùng | — |
| `ttt_user_segment` | STRING | Phân đoạn người dùng theo dịch vụ túi thần tài | — |
| `voucher_type_by_gmv` | STRING | Loại voucher theo GMV | — |
| `voucher_type_by_trans` | STRING | Loại voucher theo giao dịch | — |
| `previous_voucher_type_by_trans` | STRING | Loại voucher trước đó theo giao dịch | — |
| `previous_voucher_type_by_gmv` | STRING | Loại voucher trước đó theo GMV | — |
| `acquire_user_channel` | STRING | Kênh thu hút người dùng | — |
| `promotion_cost_type` | STRING | Loại chi phí khuyến mãi | — |
| `partner` | STRING | Đối tác | — |
| `partner_type` | STRING | Loại đối tác | — |
| `partner_momo_user` | STRING | Người dùng MoMo của đối tác | — |

### `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_SEGMENT_USER`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month_active` | DATE | Tháng người dùng đang hoạt động | — |
| `reference` | STRING | Tham chiếu số liệu người dùng | — |
| `month_lead` | DATE | Tháng người dùng tiềm năng | — |
| `retain` | DATE | Ngày người dùng được giữ lại | — |
| `month_churn` | DATE | Tháng người dùng rời bỏ | — |
| `user_segment` | STRING | Phân đoạn người dùng | — |
| `churn_user` | STRING | Thông tin người dùng đã rời bỏ | — |
| `churn_duration` | INTEGER | Thời gian rời bỏ của người dùng (tính bằng ngày) | — |
| `FIRST_DATE` | DATE | Ngày đầu tiên của hoạt động người dùng | — |
| `LAST_DATE` | DATE | Ngày gần nhất có hoạt động của người dùng | — |
| `CHURN_DURATION_DAY` | INTEGER | Thời gian rời bỏ của người dùng (tính bằng ngày) | — |
| `TRANS` | INTEGER | Số lượng giao dịch của người dùng | — |
| `PREVIOUS_TRANS` | INTEGER | Số lượng giao dịch trước đó của người dùng | — |
| `GMV` | FLOAT | Giá trị giao dịch tổng của người dùng | — |
| `PREVIOUS_GMV` | FLOAT | Giá trị giao dịch tổng trước đó của người dùng | — |
| `PROMOTION_COST` | FLOAT | Chi phí khuyến mại cho người dùng | — |
| `PREVIOUS_VC_AMOUNT` | FLOAT | Số lượng voucher trước đó của người dùng | — |
| `VOUCHER_TYPE_BY_GMV` | STRING | Loại voucher dựa trên giá trị giao dịch tổng | — |
| `PREVIOUS_VOUCHER_TYPE_BY_GMV` | STRING | Loại voucher trước đó dựa trên giá trị giao dịch tổng | — |
| `VOUCHER_TYPE_BY_TRANS` | STRING | Loại voucher dựa trên số lượng giao dịch | — |
| `PREVIOUS_VOUCHER_TYPE_BY_TRANS` | STRING | Loại voucher trước đó dựa trên số lượng giao dịch | — |
| `GMV_TYPE` | STRING | Loại giá trị giao dịch tổng | — |
| `PREVIOUS_GMV_TYPE` | STRING | Loại giá trị giao dịch tổng trước đó | — |
| `first_tid` | INTEGER | ID giao dịch đầu tiên của người dùng | — |

## Memory
*5 entries — user-trained knowledge*

1. giao dịch thành công: statusid = 2 _Data (Non Sensitive) · 2025-05-13_
2. giao dịch thành công: statusid = 2 _Data (Non Sensitive) · 2025-05-13_
3. TTT: Túi Thần Tài _Data (Non Sensitive) · 2025-05-13_
4. MAU: phải thêm điều kiện statusid = 2 _Data (Non Sensitive) · 2025-05-13_
5. giftid: typeid _Data (Non Sensitive) · 2025-05-13_
