# Domain: BU Payment: Data

## Identity
- **Domain ID:** `c210420f-d014-4463-bcb9-c9e4a38c0963`
- **Description:** All detailed transaction of service Data since 2021
- **Tables:** 0
- **Metadata fetched:** 2026-02-03

## Domain Knowledge (from Mimir)

- giao dịch thành công: statusid = 2
- TTT: Túi Thần Tài
- Khi xử lý vấn đề liên quan tới MAU, dùng COUNT(DISTINCT user_payment) thay vì COUNT(DISTINCT user_raw)
- Cột `source_of_fund` không tồn tại trong bảng `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS`, sử dụng `money_source` thay thế
- Khi xử lý yêu cầu MAU theo nhóm tuổi của dịch vụ Data 4G/5G, không sử dụng điều kiện service = 'COMBO'
- Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1. Tỷ lệ giữ chân xác định theo từng tháng.
- MAU: phải thêm điều kiện statusid = 2
- cùng kỳ: extract(day from date) of month_active = extract(day from date) of last month
- Khi xử lý MAU từ tháng 07/2024 đến tháng 12/2024, cần sử dụng date_trunc(date, month) cho cột month_active và count(distinct user_payment) cho cột user
- Doanh thu trung bình trên mỗi người dùng chỉ tính những người sử dụng đồng thời gói 30 ngày và ngắn ngày trong cùng một tháng
- Nếu user hỏi về gói 5G thì hỏi thêm về nhà mạng. List gói cước 5G đã cung cấp chỉ áp dụng cho nhà mạng Viettel.
- Khi tính MAU cho user Data 4G/5G nhóm 18-22, cần sử dụng khoảng thời gian từ 01-01-2024 đến 28-08-2025 thay vì chỉ từ 01-08-2024 đến 28-08-2024
- Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1
- VTS = ví trả sau = pay_later
- Khi xử lý cột 'expire', sử dụng safe_cast(t1.expire as float64) để tránh lỗi kiểu dữ liệu
- Gói 30 ngày: expire = 30
- Khi user sử dụng agent, thì thay bằng cột service_code
- Các gói cước 5G bao gồm: 5G135, 5G150, 5G160B, 5G180B, 5G230B, 5G280B, 5G330B, 5G380B, 5G480B, 5GLQ190, 5GLQ210, TET5G, 5GMXH200, 5GMXH230, 3T5G135, 3T5G150, 3T5G160B, 3T5G180B, 3T5G480B, 3T5GLQ190, 3T5GLQ210, 5G135N, 3T5G135N, 5G150N, 3T5G150N, 5G13KS, 5G36KS, 5G85KS, 5GMAX
- Khi tính MAU cho nhóm tuổi 18-22, cần sử dụng điều kiện group_age = '[2]. 18 - 22 y/o'
- Tất cả các truy vấn từ bảng `project-5400504384186300846.BU_UTILITIES_TELCO.DATA_DETAILS` phải luôn có điều kiện statusid = 2 (giao dịch thành công) trừ khi được yêu cầu khác.
- Nếu user không đề cập gì hết, thì có nghĩa là chỉ cần phát sinh giao dịch thành công ở group_service Data.
- user: user_payment or reference
- giftid: typeid
- Khi tính MAU, sử dụng COUNT(DISTINCT user_payment) thay vì COUNT(DISTINCT id)
- statusid không cần dấu ngoặc đơn khi giá trị là số
- SIM số đẹp MobiFone tương ứng với SIM SO DEP MOBIFONE trong cột merchant
- Khi lấy MAU của dịch vụ Data 4G/5G, cần sử dụng COUNT(DISTINCT user_payment) để tính MAU
- Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1. Tỷ lệ giữ chân xác định theo từng tháng.
- Khi user hỏi về 'gói cước', ưu tiên sử dụng cột `goi_cuoc` thay vì `service_code`.
- Khi user hỏi về 'gói cước', ưu tiên sử dụng cột `goi_cuoc` thay vì `service_code`.
- Cột `statusid` là một số nguyên, không phải chuỗi
- Khi tính doanh thu trung bình trên mỗi người dùng cho từng loại gói (30 ngày và ngắn ngày), chỉ tính những người sử dụng đồng thời cả hai loại gói trong cùng một tháng, cần sử dụng cột month_active và đảm bảo rằng num_package_type = 2
- Cần đảm bảo rằng expire và user_payment không null khi tính toán
- Gói ngắn ngày: expire < 30
- Tỷ lệ giữ chân xác định theo từng tháng
- Khi truy vấn dữ liệu cho gói cước, sử dụng cột goi_cuoc thay vì service_code
- Tỷ lệ giữ chân của gói cước A = số user mua gói cước A tháng T và tháng T-1/MAU gói cước A tháng T-1. Tỷ lệ giữ chân xác định theo từng tháng.
- Đối với retention cohort của nhóm new user, cần lọc theo user_segment = 'new_user'
- new user là new_user trong cột user_segment

## Suggested Probe Questions

- Status: **Not yet probed**
