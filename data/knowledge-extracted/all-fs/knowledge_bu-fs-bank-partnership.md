# Bank Partnership — DA Knowledge (Mimir Corrections)

**Source:** `lt-memory/domains/bu-fs-bank-partnership.md` → `## Memory`
**Entries:** 19
**Domain ID:** `7102da6a-2fdc-4475-a3bf-b66be5bca419`

---

1. Để tìm số lượng giao dịch loại C D, sử dụng điều kiện regexp_contains(bank_auth_code,'C|D|CD') _FS BANK · 2025-07-15_
2. Dùng câu lệnh SQL: REGEXP_CONTAINS(bank_auth_code, 'C|D|CD') để phân biệt loại CD trong bank_auth_code _BU FS: Bank Partnership · 2025-07-31_
3. Khi truy vấn số lượng khách hàng liên kết ví thành công, sử dụng mã ngân hàng 'mbb' cho cột BANK_CODE _BU FS: Bank Partnership · 2025-08-13_
4. Mã ngân hàng Sacombank là 'SACOM' _FS BANK · 2025-07-15_
5. Tỉ lệ liên kết ngân hàng thành công của HDB trong tháng 8/2025 là 21.65% _2025-10-02_
6. Tỉ lệ cashin thành công dưới 90% là đúng do dữ liệu báo cáo có loại giao dịch dính lỗi số dư _FS BANK · 2025-07-17_
7. Tỷ lệ liên kết ví thành công được tính bằng: safe_divide(count(distinct case when stage = '03. success_map' then user end), count(distinct case when process_name not in ('click_logo') then user end)) _FS BANK · 2025-07-30_
8. Cần chuyển đổi DATE_TIME sang kiểu TIMESTAMP để tính toán _BU FS: Bank Partnership · 2025-08-12_
9. Khi lấy số lượt liên kết ví ngân hàng BIDV theo ngày, sử dụng COUNT(DISTINCT request_id) thay vì COUNT(DISTINCT USER) _2025-09-09_
10. Khi người dùng hỏi về loại giao dịch CD thì có nghĩa là đang đề cập tới cột bank_auth_code trong bảng BANK_CI _BU FS: Bank Partnership · 2025-07-31_
11. Khi tính tỉ lệ nạp tiền thành công, thêm điều kiện ci.LINKAGE = 'NHLK' _BU FS: Bank Partnership · 2025-08-12_
12. Bank code EXIM _BU FS: Bank Partnership · 2025-08-13_
13. Để lấy số tiền giao dịch loại CD của ngân hàng MBB, sử dụng mã REGEXP_CONTAINS(BANK_AUTH_CODE, 'C|D|CD') _FS BANK · 2025-07-24_
14. Mã ngân hàng Vietinbank là 'VTB' _FS BANK · 2025-07-21_
15. Khi tính tỉ lệ nạp tiền thành công, sử dụng cột STATUS_FINAL thay vì STATUS _BU FS: Bank Partnership · 2025-08-12_
16. Khi tính tỉ lệ nạp tiền thành công, sử dụng cột BANK_CODE thay vì BANK_NAME _BU FS: Bank Partnership · 2025-08-12_
17. Cột thời gian trong bảng BANK_CO là DATE_TIME, không phải DATETIME _BU FS: Bank Partnership · 2025-08-12_
18. Loại bỏ lỗi có partner_error_sub_category/ms_sub_status = 'FAIL - SỐ DƯ' khi tính tỷ lệ giao dịch nạp tiền ngân hàng liên kết thành công _BU FS: Bank Partnership · 2025-08-13_
19. Trong tháng 7 năm 2025, có 32 ngân hàng liên kết hoạt động _FS BANK · 2025-07-15_

