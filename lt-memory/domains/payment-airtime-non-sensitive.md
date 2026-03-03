# Domain: BU Payment: Airtime (Non Sensitive)

## Identity
- **Domain ID:** `63e7a2bc-2f9d-4b8f-9a1d-03c5ea7e16e8`
- **Description:** records all transaction (exclude blacklist user), demographic, user segment of Airtime Service since 2021
- **Tables:** 0
- **Metadata fetched:** 2026-02-03

## Domain Knowledge (from Mimir)

- Khi lấy thông tin về user và TID gần nhất, cần sử dụng hàm MAX cho id để lấy latest_TID
- TTT: Túi Thần Tài
- Khi lọc dữ liệu theo tháng, sử dụng điều kiện HAVING latest_month_active = '2025-07-01' thay vì BETWEEN '2025-07-01' AND '2025-07-31'
- giao dịch thành công: statusid = 2
- Khi truy vấn số lượng giao dịch active, cần kiểm tra user_raw không null
- giftid: typeid 
- MAU: phải thêm điều kiện statusid = 2
- Khi xử lý yêu cầu lấy 10 user có số transaction active nhiều nhất, cần sử dụng khoảng thời gian từ '2022-07-01' đến '2025-07-31' cho cột date

## Suggested Probe Questions

- Status: **Not yet probed**
