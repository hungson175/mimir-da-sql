# BU Payment: Data

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `c210420f-d014-4463-bcb9-c9e4a38c0963`

## Description
All detailed transaction of service Data since 2021

## Tables

### `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS`
> Bảng này lưu trữ chi tiết dữ liệu giao dịch liên quan đến dịch vụ viễn thông tiện ích. Dữ liệu có thể được sử dụng để phân tích thông tin giao dịch, xu hướng sử dụng dịch vụ viễn thông và phân tích hành vi người dùng. Các mục đích cụ thể bao gồm: 
 - Xác định loại dịch vụ và nhà mạng liên quan đến từng giao dịch 
 - Phân tích số lượng tiền giao dịch và mức độ khuyến mãi đã sử dụng 
 - Theo dõi trạng thái và chi tiết người dùng liên quan đến giao dịch viễn thông.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | INTEGER | ID giao dịchtransaction id | 26566879862, 25791968392, 27203900506 |
| `date` | DATE | Ngày thực hiện giao dịchngày thực hiện id | 2025-11-06, 2025-11-14, 2025-11-10 |
| `datetime` | DATETIME | Thời gian thực hiện giao dịchthời gian thực hiện id | 2024-04-22 06:26:42, 2024-11-05 19:30:42, 2024-10-27 10:02:57 |
| `hour` | INTEGER | Giờ thực hiện giao dịchgiờ thực hiện id | 19, 7, 8 |
| `user_payment` | FLOAT | ID người dùng thực hiện giao dịchuser_id thực hiện id | 43803706, 86561789, 86365594 |
| `amount` | FLOAT | Tổng số tiền của giao dịchtổng số tiền của id | 10000, 15000, 8000 |
| `mm_amount` | FLOAT | Tổng số tiền dùng trong ngăn ví MoMo của giao dịchtổng số tiền dùng trong ngăn ví momo của id | 10000, 0, 15000 |
| `vc_amount` | FLOAT | Tổng số tiền khuyến mãi của giao dịchtổng số tiền khuyến mãi của id | 0, 10000, 15000 |
| `voucher_or_not` | STRING | Phân loại giao dịch có sử dụng voucher hay không, Voucher: giao dịch có sử dụng voucher, Non voucher: giao dịch không sử dụng voucher (giao dịch organic)phân loại giao dịch có sử dụng voucher hay không, Voucher: id có sử dụng voucher, Non voucher: giao dịch không sử dụng voucher (giao dịch organic) | Non voucher, Voucher, Non_voucher |
| `cate` | STRING | Nhà mạng của người được nạpNhà mạng của người được nạp | Viettel, Mobifone, Vinaphone |
| `service` | STRING | Dịch vụ sử dụng: TOPUP: nạp tiền điện thoại, MATHE: mã thẻ, COMBO: combo data, SIM: mua sim, OTHER: dịch vụ khácDịch vụ sử dụng: TOPUP: topup, MATHE: mã thẻ, COMBO: combo data, SIM: dịch vụ mua sim, OTHER: Dịch vụ khác | TOPUP, COMBO, MATHE |
| `subcategory` | STRING | Danh mục con của dịch vụ | VIETTEL, PHUONG QUAN, VMG/IMEDIA |
| `group_service` | STRING | Nhóm dịch vụ của giao dịch | 3G/4G |
| `merchant` | STRING | Tên dịch vụ + nhà mạng của giao dịch, được viết dưới dạng in hoa không dấuTên dịch vụ + nhà mạng của id, được viết dưới dạng in hoa không dấu | TOPUP DATA VIETTEL, TOPUP DATA MOBIFONE, COMBO DATA VIETTEL |
| `region` | STRING | Khu vực của merchantKhu vực của merchant | Mien Bac |
| `supplier` | STRING | Nhà cung cấp của giao dịchNhà cung cấp của id | VIETTEL, PHUONG QUAN, VMG/IMEDIA |
| `service_code` | STRING | Mã dịch vụ liên quan đến giao dịch | vttivt_topupdata_vt, vttiphuongquan_topup, vttiviettel_mathe_vt |
| `bonus` | FLOAT | Số tiền bonus cho người dùngsố tiền bonus cho user | 0, 1200, 2400 |
| `gender` | STRING | Giới tính của người dùnggiới tính của user | male, female, MALE |
| `group_age` | STRING | Nhóm độ tuổi của người dùnggroup độ tuổi của user | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, 18_to_22 |
| `age` | NUMERIC | Độ tuổi của người dùngđộ tuổi của user | 20, 21, 22 |
| `statusid` | INTEGER | Trạng thái giao dịch, 6 = giao dịch thất bại, 2 = giao dịch thành côngtrạng thái giao dịch, 6 = giao dịch thất bại, 2 = giao dịch thành công | 2, 6 |
| `group_user` | STRING | Nhóm người dùng | other, Current, New User |
| `province` | STRING | Tỉnh thành người dùng đang ởTỉnh thành user đang ở | Hồ Chí Minh, Hà Nội, Bình Dương |
| `province_group` | STRING | Nhóm tỉnh thành người dùng đang ởgroup tỉnh tính user đang ở | Hồ Chí Minh, Others, KCN Miền Nam |
| `Revenue` | FLOAT | Doanh thu của giao dịchDoanh thu của id | 1272.7272727272727, 2727.272727272727, 1018.1818181818181 |
| `quantity` | FLOAT | Số lượng sản phẩm người dùng muaSố lượng sản phẩm user mua | 1, 2, 3 |
| `menh_gia` | FLOAT | Mệnh giá của sản phẩmmệnh giá của sản phẩm | 10000, 15000, 8000 |
| `goi_cuoc` | STRING | Mã gói cước của sản phẩmmã gói cước của sản phẩm | KS8, 1N_TMDT, ST15KDS |
| `dung_luong` | STRING | Dung lượng data của gói cướcdung lượng data của gói cước | 3 GB, 5, 2 GB |
| `expire` | STRING | Thời gian hết hạn của gói cướcThời gian hết hạn của gói cước | 1, 3, 7 |
| `month_active` | DATE | Tháng người dùng activeTháng user active | 2025-11-01, 2025-10-01, 2025-08-01 |
| `user_segment` | STRING | Segment của người dùng trong tháng active. retain_user: người dùng đã active ở tháng trước đó và tháng này tiếp tục active, recover_user: người dùng churn Airtime hơn 1 tháng và quay lại active dịch vụ tháng này, new_user: người dùng chưa từng active dịch vụ Data trước đóSegment của user trong tháng active. retain_user: user đã active ở tháng trước đó và tháng này tiếp tục active, recover_user: user churn Airtime hơn 1 tháng và quay lại active dịch vụ tháng này, mew_user: user chưa từng active dịch vụ Data trước đó | retain_user, recover_user, new_user |
| `churn_duration` | INTEGER | Số tháng người dùng rời bỏ dịch vụsố tháng user rời bỏ dịch vụ | 1, 2, 3 |
| `money_source` | STRING | Nguồn tiền người dùng sử dụng cho giao dịchNguồn tiền user sử dụng cho giao dịch | momo, bank_link, TTT |
| `typeid` | STRING | Thẻ quà/mã nhập sử dụng cho khuyến mãiThẻ quà/mã nhập sử dụng cho promotion | cashback, 220428_data_new_10k, 2201_data_new_10k |
| `voucher_cost` | FLOAT | Chi phí của voucher | 0, 10000, 3000 |
| `telco_source` | STRING | Entry point từ miniapp của giao dịchEntry point từ miniapp của giao dịch | tabbar_home, tabbar_home_byphone, transaction_result |
| `serviceid` | STRING | ID dịch vụservice id | topup_data_viettel, topup_data_mobi, topup_combo_viettel |
| `telco_source_raw` | STRING | Nguồn viễn thông gốc của giao dịch | tabbar_home_revamp_payX, tabbar_home, tabbar_home_revamp |
| `suffix` | STRING | Entry point nội bộ của giao dịch (ex: button screen,...)internal entry point của giao dịch (ex: button screen,...) | block_recomend_ai, block_recommend, block_recommend_both |
| `user_raw` | STRING | Người dùng gốc | 43803706, 86561789, 86365594 |
| `ttt_user_segment` | STRING | Segment người dùng TTT | churn_TTT, non_TTT, 2.Retain |
| `voucher_type_by_gmv` | STRING | Loại voucher theo GMV | ONLY ORGANIC, GMV MORE ORGANIC, ONLY VOUCHER |
| `voucher_type_by_trans` | STRING | Loại voucher theo giao dịch | ONLY ORGANIC, TRANS MORE ORGANIC, ONLY VOUCHER |
| `previous_voucher_type_by_trans` | STRING | Loại voucher theo giao dịch trước đó | ONLY ORGANIC, GMV MORE ORGANIC, ONLY VOUCHER |
| `previous_voucher_type_by_gmv` | STRING | Loại voucher theo GMV trước đó | ONLY ORGANIC, GMV MORE ORGANIC, ONLY VOUCHER |
| `acquire_user_channel` | STRING | Kênh thu hút người dùng | organic, BU, other teams |
| `promotion_cost_type` | STRING | Loại chi phí khuyến mãi | organic, BU, other teams |
| `partner` | STRING | Đối tác liên quan đến giao dịch | no data, mathe, sim |
| `partner_type` | STRING | Loại đối tác | only_owner, owner_partner, only_partner |
| `partner_momo_user` | STRING | Người dùng MoMo của đối tác | owner, partner, momo user |

## Memory
*39 entries — user-trained knowledge*

1. giao dịch thành công: statusid = 2 _Data · 2025-05-13_
2. TTT: Túi Thần Tài _Data · 2025-05-13_
3. Khi xử lý vấn đề liên quan tới MAU, dùng COUNT(DISTINCT user_payment) thay vì COUNT(DISTINCT user_raw) _Data · 2025-07-30_
4. Cột `source_of_fund` không tồn tại trong bảng `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS`, sử dụng `money_source` thay thế _2026-01-06_
5. Khi xử lý yêu cầu MAU theo nhóm tuổi của dịch vụ Data 4G/5G, không sử dụng điều kiện service = 'COMBO' _2025-12-22_
6. Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1. Tỷ lệ giữ chân xác định theo từng tháng. _2026-01-15_
7. MAU: phải thêm điều kiện statusid = 2 _Data · 2025-05-13_
8. cùng kỳ: extract(day from date) of month_active = extract(day from date) of last month _Data · 2025-05-13_
9. Khi xử lý MAU từ tháng 07/2024 đến tháng 12/2024, cần sử dụng date_trunc(date, month) cho cột month_active và count(distinct user_payment) cho cột user _Data · 2025-07-30_
10. Doanh thu trung bình trên mỗi người dùng chỉ tính những người sử dụng đồng thời gói 30 ngày và ngắn ngày trong cùng một tháng _Data · 2025-08-12_
11. Nếu user hỏi về gói 5G thì hỏi thêm về nhà mạng. List gói cước 5G đã cung cấp chỉ áp dụng cho nhà mạng Viettel. _2025-09-11_
12. Khi tính MAU cho user Data 4G/5G nhóm 18-22, cần sử dụng khoảng thời gian từ 01-01-2024 đến 28-08-2025 thay vì chỉ từ 01-08-2024 đến 28-08-2024 _2025-09-29_
13. Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1 _2025-10-28_
14. VTS = ví trả sau = pay_later _2026-01-06_
15. Khi xử lý cột 'expire', sử dụng safe_cast(t1.expire as float64) để tránh lỗi kiểu dữ liệu _Data · 2025-07-28_
16. Gói 30 ngày: expire = 30 _Data · 2025-08-12_
17. Khi user sử dụng agent, thì thay bằng cột service_code _2025-09-11_
18. Các gói cước 5G bao gồm: 5G135, 5G150, 5G160B, 5G180B, 5G230B, 5G280B, 5G330B, 5G380B, 5G480B, 5GLQ190, 5GLQ210, TET5G, 5GMXH200, 5GMXH230, 3T5G135, 3T5G150, 3T5G160B, 3T5G180B, 3T5G480B, 3T5GLQ190, 3T5GLQ210, 5G135N, 3T5G135N, 5G150N, 3T5G150N, 5G13KS, 5G36KS, 5G85KS, 5GMAX _2025-09-11_
19. Khi tính MAU cho nhóm tuổi 18-22, cần sử dụng điều kiện group_age = '[2]. 18 - 22 y/o' _2025-09-29_
20. Tất cả các truy vấn từ bảng `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS` phải luôn có điều kiện statusid = 2 (giao dịch thành công) trừ khi được yêu cầu khác. _2025-12-26_
21. Nếu user không đề cập gì hết, thì có nghĩa là chỉ cần phát sinh giao dịch thành công ở group_service Data. _2026-02-03_
22. user: user_payment or reference _Data · 2025-05-13_
23. giftid: typeid _Data · 2025-05-13_
24. Khi tính MAU, sử dụng COUNT(DISTINCT user_payment) thay vì COUNT(DISTINCT id) _Data · 2025-07-30_
25. statusid không cần dấu ngoặc đơn khi giá trị là số _Data · 2025-07-31_
26. SIM số đẹp MobiFone tương ứng với SIM SO DEP MOBIFONE trong cột merchant _2025-09-11_
27. Khi lấy MAU của dịch vụ Data 4G/5G, cần sử dụng COUNT(DISTINCT user_payment) để tính MAU _2025-12-22_
28. Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1. Tỷ lệ giữ chân xác định theo từng tháng. _2026-01-15_
29. Khi user hỏi về 'gói cước', ưu tiên sử dụng cột `goi_cuoc` thay vì `service_code`. _2025-12-30_
30. retention cohort month on month là việc user active lần đầu tiên vào tháng đó (nên dựa vào giá trị new_user trong cột user_segment vì data quá khứ không đủ). Sau đó kiểm tra tỷ lệ active ở các tháng tiếp theo cho tới thời điểm hiện tại _2025-12-30_
31. Cột `statusid` là một số nguyên, không phải chuỗi _Data · 2025-07-30_
32. Khi tính doanh thu trung bình trên mỗi người dùng cho từng loại gói (30 ngày và ngắn ngày), chỉ tính những người sử dụng đồng thời cả hai loại gói trong cùng một tháng, cần sử dụng cột month_active và đảm bảo rằng num_package_type = 2 _Data · 2025-08-12_
33. Cần đảm bảo rằng expire và user_payment không null khi tính toán _Data · 2025-08-12_
34. Gói ngắn ngày: expire < 30 _Data · 2025-08-12_
35. Tỷ lệ giữ chân xác định theo từng tháng _2025-10-28_
36. Khi truy vấn dữ liệu cho gói cước, sử dụng cột goi_cuoc thay vì service_code _2025-12-29_
37. Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1. Tỷ lệ giữ chân xác định theo từng tháng. _2026-01-15_
38. để lấy được new user cần lấy giao dịch tại thời điểm đầu tiên, như vậy đừng ràng thời gian trong quá trình xác định new user. Nhưng vì bảng data không có đủ các giao dịch trong quá khứ, nên có thể dựa vào ew_user trong cột user_segment để xác định chính xác các user nào là new user _2026-02-02_
39. Khi user yêu cầu retention cohort:
- Active user được định nghĩa là user có phát sinh giao dịch thành công (statusid = 2).
- Nếu không đề cập tháng bắt đầu, mặc định là tháng 1/2025.
- Nếu không đề cập tháng kết thúc, mặc định là tháng hiện tại.
- Nếu không đề cập dịch vụ/sản phẩm cụ thể, cần hỏi lại user muốn tính cho dịch vụ/sản phẩm nào. _2026-02-03_
