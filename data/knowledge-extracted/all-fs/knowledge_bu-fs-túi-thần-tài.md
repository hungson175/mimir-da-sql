# Túi Thần Tài — DA Knowledge (Mimir Corrections)

**Source:** `lt-memory/domains/bu-fs-túi-thần-tài.md` → `## Memory`
**Entries:** 14
**Domain ID:** `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11`

---

1. Khi xử lý dữ liệu Túi Thần Tài, không cần điều kiện IS_MP = 'Individual' cho cột MFU_TYPE _2025-08-25_
2. PLUS_TYPE không được bao gồm ('0.Churn', 'None') trong điều kiện WHERE _2025-10-08_
3. AUM của Túi Thần Tài bao gồm cả tài khoản cá nhân và tài khoản quỹ nhóm _Túi Thần Tài · 2025-07-29_
4. Khi xử lý tổng mức GMV rút tiền, sử dụng công thức SUM(coalesce(cashout_napas_gmv,0) + coalesce(cashout_payment_gmv,0) + coalesce(cashout_gmv,0) + coalesce(cashout_stock_gmv,0)) _2025-10-08_
5. Khi xử lý GRASS_MONTH, sử dụng DATE_TRUNC(GRASS_DATE, MONTH) thay vì GRASS_MONTH _Túi Thần Tài · 2025-07-14_
6. Tổng tiền lãi (Interest) không cần điều kiện IS_MP = 'Individual' _2025-08-25_
7. Người dùng là Túi+ tháng 7 nhưng không là Túi+ tháng 8: 165,056,722,906 VND nạp VA trong tháng 8. Người dùng là Túi+ tháng 8 nhưng không là Túi+ tháng 9: 72,367,111,233 VND nạp VA trong tháng 9. _2025-09-22_
8. Không có dữ liệu để phân loại ngày user có sở hữu Túi+ _BU-FS: Túi Thần Tài · 2025-08-06_
9. Khi xử lý dữ liệu với option_value, không nên sử dụng điều kiện IS NULL _2025-09-08_
10. Khi tính tổng số lượng người dùng rút tiền, chỉ tính những người dùng có GMV rút tiền lớn hơn 0 _2025-10-08_
11. Khi tính số lượng user MAU SOF Túi Thần Tài, cần sử dụng AVG(balance) > 100000 và SUM(CASHOUT_P2P_TRANS) = 0 thay vì AVG_BAL_GROUP và CASHOUT_P2P_TRANS = 0 _BU-FS: Túi Thần Tài · 2025-08-03_
12. Traffic màn hình home tháng 6 bao gồm cả user chưa đăng ký Túi Thần Tài _Túi Thần Tài · 2025-07-15_
13. Khi xử lý dữ liệu Túi+ cho tháng 10, sử dụng GRASS_DATE từ '2025-10-01' đến '2025-10-05' _2025-10-06_
14. Khi xử lý vấn đề liên quan tới USER_ID, dùng REGEXP_EXTRACT(USER_ID, r'\d+') cho cột USER_ID _2025-12-18_

