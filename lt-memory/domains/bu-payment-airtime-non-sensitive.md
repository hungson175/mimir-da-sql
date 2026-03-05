# BU Payment: Airtime (Non Sensitive)

**Domain ID:** `63e7a2bc-2f9d-4b8f-9a1d-03c5ea7e16e8`

## Description
records all transaction (exclude blacklist user), demographic, user segment of Airtime Service since 2021

## Schema DDL (raw)
```
###Dataset name: BU Payment: Airtime (Non Sensitive)
```

## Memory
*8 entries — user-trained knowledge*

1. Khi lấy thông tin về user và TID gần nhất, cần sử dụng hàm MAX cho id để lấy latest_TID _Airtime (Non Sensitive) · 2025-07-31_
2. TTT: Túi Thần Tài _Airtime (Non Sensitive) · 2025-05-13_
3. Khi lọc dữ liệu theo tháng, sử dụng điều kiện HAVING latest_month_active = '2025-07-01' thay vì BETWEEN '2025-07-01' AND '2025-07-31' _Airtime (Non Sensitive) · 2025-07-31_
4. giao dịch thành công: statusid = 2 _Airtime (Non Sensitive) · 2025-05-13_
5. Khi truy vấn số lượng giao dịch active, cần kiểm tra user_raw không null _Airtime (Non Sensitive) · 2025-07-31_
6. giftid: typeid _Airtime (Non Sensitive) · 2025-05-13_
7. MAU: phải thêm điều kiện statusid = 2 _Airtime (Non Sensitive) · 2025-05-13_
8. Khi xử lý yêu cầu lấy 10 user có số transaction active nhiều nhất, cần sử dụng khoảng thời gian từ '2022-07-01' đến '2025-07-31' cho cột date _Airtime (Non Sensitive) · 2025-07-31_
