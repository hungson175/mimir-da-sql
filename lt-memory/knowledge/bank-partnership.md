# Knowledge: Bank Partnership
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-11

## DA Review Knowledge (2026-03-11)
> From domain review xlsx — DA-written gotchas and rules.

- Giao dịch CD: dùng REGEXP_CONTAINS(bank_auth_code, 'C|D|CD') trên bảng BANK_CI
- Bank codes: MBB = 'mbb', Sacombank = 'SACOM', Vietinbank = 'VTB', EXIM = 'EXIM'
- Tỷ lệ liên kết ví thành công: safe_divide(count(distinct case when stage = '03. success_map' then user end), count(distinct case when process_name not in ('click_logo') then user end))
- DATE_TIME cần chuyển sang TIMESTAMP để tính toán
- Liên kết ví theo ngày: COUNT(DISTINCT request_id) (không dùng COUNT(DISTINCT USER))
- Tỉ lệ nạp tiền thành công: filter LINKAGE = 'NHLK', dùng STATUS_FINAL (không phải STATUS), dùng BANK_CODE (không phải BANK_NAME)
- Loại bỏ lỗi số dư: exclude partner_error_sub_category/ms_sub_status = 'FAIL - SỐ DƯ'
- Cashin thành công < 90% là đúng (do lỗi số dư trong báo cáo)
- BANK_CO: cột thời gian là DATE_TIME, không phải DATETIME
- Tháng 7/2025: 32 ngân hàng liên kết hoạt động

