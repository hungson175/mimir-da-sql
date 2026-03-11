# BU FS: Bank Partnership

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.

## Description
Mô Tả Chi Tiết Domain
DA viết mô tả chi tiết về domain ở đây.

Nội dung cần bao gồm:
- Domain này phục vụ mục đích gì?
- Các bảng quan trọng nhất và dùng để làm gì?
- Metric chính (MAU, GMV, Revenue...) và cách tính chính xác (SQL)?
- Mối liên hệ giữa các bảng (join key, lookup)?
- Gotchas: những điều dễ nhầm, cột tên khác nghĩa, filter bắt buộc?
- Tần suất cập nhật dữ liệu?
- Bất kỳ thông tin nào giúp người mới hiểu domain nhanh nhất?

→ Viết càng chi tiết càng tốt. Có thể dài nhiều trang.
Thông tin dữ liệu về các dịch vụ liên quan tới ngân hàng (nạp/ rút/ liên kết/ direct debit/ w2b/ ...)
Luôn kiểm tra các câu hỏi phải có thông tin về thời gian rõ ràng.

Nếu người dùng hỏi chung chung không rõ dịch vụ thì nhớ hỏi người dùng là cần thông tin về dịch vụ nào của ngân hàng (nạp/ rút/ liên kết/ nạp tiền hạn mức cao/ w2b/ ...).
   . Nạp: BANK_CI
   . Rút: BANK_CO
   . Liên kết: BANK_MAP_ERROR
   . Nạp tiền hạn mức cao: BANK_CI_DIRECT_DEBIT
   . W2B: BANK_W2B_RAW

Đối với những bảng có cột Linkage thì mặc định query luôn có điều kiện Linkage = 'NHLK'. Những giá trị khác chỉ query khi người dùng hỏi.

Một số lưu ý:
   . BANK_MAP_ERROR: không tiết lộ thông tin trong cột full_name, account_no, app_personalid

Người dùng hỏi thông tin về tỉ lệ liên kết ngân hàng thành công thì dùng công thức: safe_divide(count(distinct case when stage = '03. success_map' then user end),count(distinct case when process_name not in ('click_logo') then user end)) để query dữ liệu trong bảng BANK_MAP_ERROR.

Khi người dùng hỏi về nhóm lỗi hoặc loại 1 nhóm lỗi nào đó thì nối bảng BANK_CI/ BANK_CO/ BANK_W2B_RAW/ BANK_CI_DIRECT_DEBIT với bảng D_BANK_ERROR theo thứ tự sau:
   . Thứ 1: 
      - BANK_CI & BANK_CI_DIRECT_DEBIT as ci left join D_BANK_ERROR as defn on defn.function = 'CI' and ci.bank_code = defn.bank_code and ci.ms_code = defn.ms_code and ci.partner_code = right(defn.partner_code,length(defn.partner_code)-1) and ci.date between defn.s_date and defn.e_date
      - BANK_CO & BANK_W2B_RAW as ci left join D_BANK_ERROR as defn on defn.function = 'CO' and ci.bank_code = defn.bank_code and ci.ms_code = defn.ms_code and ci.partner_code = right(defn.partner_code,length(defn.partner_code)-1) and ci.date between defn.s_date and defn.e_date
   . Thứ 2:
      - BANK_CI & BANK_CI_DIRECT_DEBIT & BANK_CO & BANK_W2B_RAW as t left join D_BANK_ERROR as den on den.function is null and t.bank_code = den.bank_code and t.ms_code = den.ms_code and t.partner_code = right(den.partner_code,length(den.partner_code)-1) and t.date between den.s_date and den.e_date
   . Thứ 3:
      - BANK_CI & BANK_CI_DIRECT_DEBIT & BANK_CO & BANK_W2B_RAW as t left join D_BANK_ERROR as dme on dme.bank_code = 'MOMO' and t.ms_code = dme.ms_code and t.date between dme.s_date and dme.e_date
sau đó lấy nhóm lỗi bằng công thức coalesce(defn.partner_error_sub_category,den.partner_error_sub_category,dme.ms_sub_status)

## Tables (14 tables)

### `momovn-prod.BU_FI.BANK_B2W_RAW`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `request_id` | STRING | — |
| `source_request_id` | STRING | — |
| `process_name` | STRING | — |
| `bank_code_received` | STRING | — |
| `bank_received` | STRING | — |
| `merchant_id` | STRING | — |
| `brand_id` | STRING | — |
| `user_received` | STRING | — |
| `account_received` | STRING | — |
| `name_received` | STRING | — |
| `trans_type` | STRING | — |
| `payment_type` | STRING | — |
| `date` | DATE | — |
| `datetime` | DATETIME | — |
| `update_datetime` | DATETIME | — |
| `ms_code` | STRING | — |
| `partner_code` | STRING | — |
| `amount` | FLOAT64 | — |
| `tid` | STRING | — |
| `bank_transaction_id` | STRING | — |
| `bank_transaction_time` | DATETIME | — |
| `bank_code_source` | STRING | — |
| `bank_source` | STRING | — |
| `account_source` | STRING | — |
| `name_source` | STRING | — |
| `bank_code_send` | STRING | — |
| `bank_send` | STRING | — |
| `is_bilateral` | FLOAT64 | — |
| `process_latency` | FLOAT64 | — |
| `status` | INT64 | — |
| `status_final` | INT64 | — |
| `final_time` | DATETIME | — |
| `latency` | INT64 | — |
| `owner` | BOOL | — |

### `momovn-prod.BU_FI.BANK_CI`
> Bảng này chứa thông tin về các giao dịch nạp tiền từ nguồn ngân hàng tại MoMo.

| Column | Type | Description |
|--------|------|-------------|
| `date` | date | **Desc**: Ngày khởi tạo giao dịch nạp tiền từ nguồn ngân hàng.  **Sample value**: ['2022-12-01'] |
| `date_time` | datetime | **Desc**: Ngày và giờ khởi tạo giao dịch nạp tiền từ nguồn ngân hàng.  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] |
| `linkage` | string | **Desc**: Nguồn liên kết của nguồn tiền ngân hàng đang thực hiện giao dịch nạp tiền.  **Sample value**:  1. NAPAS: là nguồn napas 2. VISA: là nguồn visa 3. NHLK: là nguồn ngân hàng liên kết |
| `bank_code` | string | **Desc**: Mã ngân hàng liên kết đang thực hiện giao dịch nạp tiền.  **Sample value**: ['ABB'] |
| `linking_method` | string | **Desc**: Phương thức liên kết của nguồn được sử dụng.  **Sample value**:  1. APP: liên kết từ app MoMo 2. IB (internet banking): liên kết từ app/web của ngân hàng đối tác |
| `type` | string | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:  1. IN-APP: giao dịch trên app MoMo 2. GATEWAY: giao dịch từ app/web đối tác 3. UNKNOWN: không xác định được 4. ACCOUNT: giao dịch từ tài khoản 5. CARD: giao dịch từ thẻ 6. IB: giao dịch từ app đối tác 7. CARD_TQT: giao dịch từ thẻ quốc tế 8... |
| `tid` | string | **Desc**: Mã định danh giao dịch.  **Sample value**: ['32668346071', '32668496078', '32669714366'] |
| `bank_id` | string | **Desc**: Mã định danh từ ngân hàng để trace log.  **Sample value**: ['None'] |
| `partner_trace_id` | string | **Desc**: Mã định danh 2 từ ngân hàng để trace log.  **Sample value**: ['None'] |
| `user` | string | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện nạp tiền.  **Sample value**: ['33938882', '4343039', '47197973'] |
| `amount` | string | — |
| `ms_code` | string | **Desc**: Mã lỗi của MoMo.  **Sample value**: ['1004', '3010', '9000'] |
| `partner_code` | string | **Desc**: Mã lỗi đối tác phản hồi.  **Sample value**: ['-1'] |
| `description` | string | **Desc**: Diễn giải ý nghĩa mã lỗi.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngày'] |
| `status` | string | — |
| `status_final` | string | — |
| `ispayment` | string | **Desc**: Mục đích giao dịch nạp tiền dùng để làm gì?  **Sample value**: 1. ONLY CI: giao dịch thuần nạp tiền 2. CI FOR PAYMENT: giao dịch nạp tiền để thanh toán dịch vụ 3. CI FOR TTT: giao dịch nạp tiền để nạp tiền vào TTT (Túi Thần Tài) 4. CI FOR TRANSFER: giao dịch nạp tiền để chuyển tiền cho ... |
| `g_` | string | **Desc**: Người dùng thực hiện giao dịch thuộc nhóm nào?  **Sample value**: 1. SIM: người dùng là sim chủ của MoMo 2. AUTO_MERCHANT: người dùng là đối tác 3. null: là EU (end user: người dùng thật) |
| `excl` | string | — |
| `is_otp` | string | — |
| `is_auto_topup` | string | — |
| `bank_auth_code` | string | **Desc**: Phân loại loại phương thức xác thực   **Sample value**: ['None'] |
| `serviceid` | string | **Desc**: Mã dịch vụ liên quan đến giao dịch nạp tiền, để xác định nạp tiền để dùng vào việc gì?  **Sample value**: ['9704', 'N/A', 'banklink_cashin', 'napas_cashin'] |
| `bank_time` | datetime | **Desc**: Thời gian ngân hàng phản hồi lại kết quả nạp tiền.  **Sample value**: ['2022-12-01 06:11:10', '2022-12-01 19:40:09', 'NaT'] |
| `final_time` | datetime | **Desc**: Thời gian thật hoàn tất giao dịch nạp tiền (nếu đã có status_final thì = thời gian trong core, còn chưa có status_final thì là bank_time).  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] |
| `latency` | string | — |
| `inquiry_status` | string | — |
| `inquiry_flow` | string | **Desc**: Gọi đối soát giao dịch từ luồng nào.  **Sample value**: 1. momo_inquiry: MoMo chủ động gọi đối soát 2. partner_callback: đối tác gọi trả đối soát |
| `inquiry_time` | datetime | **Desc**: Thời gian gọi đối soát lần đầu.  **Sample value**: ['None'] |
| `inquiry_try` | string | — |
| `inquiry_partner_code` | string | **Desc**: Mã lỗi đối tác phản hồi sau khi đối soát  **Sample value**: ['None'] |
| `inquiry_time_latest` | datetime | **Desc**: Thời gian gọi đối soát gần nhất.  **Sample value**: ['None'] |
| `target_id` | string | — |
| `target_status` | string | — |
| `target_datetime` | datetime | — |
| `map_flow` | string | — |
| `ab` | boolean | — |

### `momovn-prod.BU_FI.BANK_CI_DIRECT_DEBIT`
> Bảng này chứa thông tin về các giao dịch nạp tiền hạn mức cao (direct debit) từ nguồn ngân hàng tại MoMo.

| Column | Type | Description |
|--------|------|-------------|
| `date` | date | **Desc**: Ngày khởi tạo giao dịch nạp tiền hạn mức cao từ nguồn ngân hàng.  **Sample value**: ['2022-12-01'] |
| `date_time` | datetime | **Desc**: Ngày và giờ khởi tạo giao dịch nạp tiền hạn mức cao từ nguồn ngân hàng.  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] |
| `bank_code` | string | **Desc**: Mã ngân hàng liên kết đang thực hiện giao dịch nạp tiền hạn mức cao.  **Sample value**: ['ABB'] |
| `type` | string | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:   1. UNKNOWN: không xác định được 2. ACCOUNT: giao dịch từ tài khoản 3. CARD: giao dịch từ thẻ 4. CARD_TQT: giao dịch từ thẻ quốc tế |
| `tid` | string | **Desc**: Mã định danh giao dịch.  **Sample value**: ['32668346071', '32668496078', '32669714366'] |
| `user` | string | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện nạp tiền hạn mức cao.  **Sample value**: ['33938882', '4343039', '47197973'] |
| `amount` | string | — |
| `ms_code` | string | **Desc**: Mã lỗi của MoMo.  **Sample value**: ['1004', '3010', '9000'] |
| `partner_code` | string | **Desc**: Mã lỗi đối tác phản hồi.  **Sample value**: ['-1'] |
| `bank_desc` | string | **Desc**: Diễn giải ý nghĩa mã lỗi.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngày'] |
| `status` | string | — |
| `status_final` | string | — |
| `is_otp` | string | — |
| `is_auto_topup` | string | — |
| `payment_service_id` | string | **Desc**: Mã dịch vụ liên quan đến giao dịch nạp tiền, để xác định nạp tiền để dùng vào việc gì?  **Sample value**: ['EVN_HANOI', 'hdss_v2', 'investment_mutualfund'] |
| `bank_auth_code` | string | **Desc**: Phân loại loại phương thức xác thực   **Sample value**: ['None'] |
| `bank_time` | datetime | **Desc**: Thời gian ngân hàng phản hồi lại kết quả nạp tiền hạn mức cao.  **Sample value**: ['2022-12-01 06:11:10', '2022-12-01 19:40:09', 'NaT'] |
| `final_time` | datetime | **Desc**: Thời gian thật hoàn tất giao dịch nạp tiền (nếu đã có status_final thì = thời gian trong core, còn chưa có status_final thì là bank_time).  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] |

### `momovn-prod.BU_FI.BANK_CO`
> Bảng này chứa thông tin về các giao dịch rút tiền về ngân hàng từ MoMo.

| Column | Type | Description |
|--------|------|-------------|
| `date` | date | **Desc**: Ngày khởi tạo giao dịch rút tiền về ngân hàng.  **Sample value**: ['2022-12-01'] |
| `date_time` | datetime | **Desc**: Ngày và giờ khởi tạo giao dịch rút tiền về ngân hàng.  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] |
| `linkage` | string | **Desc**: Nguồn liên kết của nguồn tiền ngân hàng đang thực hiện giao dịch rút tiền.  **Sample value**:  1. NAPAS: là nguồn napas 2. VISA: là nguồn visa 3. NHLK: là nguồn ngân hàng liên kết |
| `bank_code` | string | **Desc**: Mã ngân hàng liên kết đang thực hiện giao dịch rút tiền.  **Sample value**: ['ABB'] |
| `linking_method` | string | **Desc**: Phương thức liên kết của nguồn được sử dụng.  **Sample value**:  1. APP: liên kết từ app MoMo 2. IB (internet banking): liên kết từ app/web của ngân hàng đối tác |
| `type` | string | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:   1. UNKNOWN: không xác định được 2. ACCOUNT: giao dịch từ tài khoản 3. CARD: giao dịch từ thẻ 4. CARD_TQT: giao dịch từ thẻ quốc tế |
| `flow` | string | **Desc**: Trạng thái của giao dịch sau khi được đối soát  **Sample value**: 1. MANUAL: luồng rút tiền của người dùng bình thường về ngân hàng đang liên kết 2. W2B: luồng đảo từ luồng w2b  3. AUTO_PAYOUT_TRANS: luồng tự động rút tiền của người dùng là đối tác 4. UNKNOWN: không xác định được luồng |
| `tid` | string | **Desc**: Mã định danh giao dịch.  **Sample value**: ['28743491909', '28743513851', '28744374659'] |
| `bank_id` | string | **Desc**: Mã định danh từ ngân hàng để trace log.  **Sample value**: ['None'] |
| `partner_trace_id` | string | **Desc**: Mã định danh 2 từ ngân hàng để trace log.  **Sample value**: ['None'] |
| `user` | string | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện rút tiền.  **Sample value**: ['33938882', '4343039', '47197973'] |
| `amount` | string | — |
| `ms_code` | string | **Desc**: Mã lỗi của MoMo.  **Sample value**: ['1004', '3010', '9000'] |
| `partner_code` | string | **Desc**: Mã lỗi đối tác phản hồi.  **Sample value**: ['-1'] |
| `description` | string | **Desc**: Diễn giải ý nghĩa mã lỗi.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngày'] |
| `status` | string | — |
| `status_final` | string | — |
| `g_` | string | **Desc**: Người dùng thực hiện giao dịch thuộc nhóm nào?  **Sample value**: 1. SIM: người dùng là sim chủ của MoMo 2. AUTO_MERCHANT: người dùng là đối tác 3. MERCHANT: người dùng là đối tác 4. null: là EU (end user: người dùng thật) |
| `bank_time` | datetime | **Desc**: Thời gian ngân hàng phản hồi lại kết quả rút tiền.  **Sample value**: ['2022-12-01 06:11:10', '2022-12-01 19:40:09', 'NaT'] |
| `final_time` | datetime | **Desc**: Thời gian thật hoàn tất giao dịch rút tiền (nếu đã có status_final thì = thời gian trong core, còn chưa có status_final thì là bank_time).  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] |
| `latency` | string | — |
| `inquiry_status` | string | — |
| `inquiry_flow` | string | **Desc**: Gọi đối soát giao dịch từ luồng nào.  **Sample value**: 1. momo_inquiry: MoMo chủ động gọi đối soát 2. partner_callback: đối tác gọi trả đối soát |
| `inquiry_time` | datetime | **Desc**: Thời gian gọi đối soát lần đầu.  **Sample value**: ['None'] |
| `inquiry_try` | string | — |
| `inquiry_partner_code` | string | **Desc**: Mã lỗi đối tác phản hồi sau khi đối soát  **Sample value**: ['None'] |
| `inquiry_time_latest` | datetime | **Desc**: Thời gian gọi đối soát gần nhất.  **Sample value**: ['None'] |
| `co_fee` | string | — |
| `ttt_tid` | string | — |

### `momovn-prod.BU_FI.BANK_CS_TICKET_CSAT`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `ticket_id` | STRING | — |
| `status` | STRING | — |
| `ticket_type` | STRING | — |
| `l0` | STRING | — |
| `l1` | STRING | — |
| `l2` | STRING | — |
| `l3` | STRING | — |
| `l4` | STRING | — |
| `created_date` | DATE | — |
| `created_time` | DATETIME | — |
| `process_date` | DATE | — |
| `process_note` | STRING | — |
| `close_by` | STRING | — |
| `close_date` | DATE | — |
| `close_time` | DATETIME | — |
| `last_reply_date` | DATETIME | — |
| `all_sla_time` | FLOAT64 | — |
| `contents` | STRING | — |
| `source_request` | STRING | — |
| `source` | STRING | — |
| `channel` | STRING | — |
| `momo_wallet` | STRING | — |
| `tid` | STRING | — |
| `trans_name` | STRING | — |
| `trans_tag` | STRING | — |
| `is_auto` | STRING | — |
| `is_last_ticket` | BOOL | — |
| `rating` | FLOAT64 | — |
| `rating_feedback` | STRING | — |
| `rating_date` | DATE | — |
| `rating_time` | DATETIME | — |
| `is_rating_week_same` | BOOL | — |
| `is_rating_month_same` | BOOL | — |
| `sla_hour_total` | INT64 | — |
| `sla_day` | INT64 | — |
| `sla_hour` | INT64 | — |
| `error_code` | STRING | — |
| `serviceid` | STRING | — |
| `trans_status_init` | INT64 | — |
| `trans_status` | STRING | — |
| `trans_datetime` | DATETIME | — |
| `trans_final_datetime` | DATETIME | — |
| `hfu` | STRING | — |
| `rcr` | STRING | — |

### `momovn-prod.BU_FI.BANK_CUSTOMER_SUMMARY`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `period` | STRING | — |
| `date` | DATE | — |
| `bank_code` | STRING | — |
| `map` | INT64 | — |
| `map_cur` | INT64 | — |
| `map_cur_single` | INT64 | — |
| `map_cur_multi` | INT64 | — |
| `map_one_touch` | INT64 | — |
| `map_one_touch_cur` | INT64 | — |
| `map_type_account` | INT64 | — |
| `map_type_card` | INT64 | — |
| `map_type_card_tqt` | INT64 | — |
| `map_type_unknown` | INT64 | — |
| `ab_register` | INT64 | — |
| `ab_active` | INT64 | — |
| `ab_off` | INT64 | — |
| `dd_register` | INT64 | — |
| `dd_active` | INT64 | — |
| `dd_u18_active` | INT64 | — |
| `non_otp_register` | INT64 | — |

### `momovn-prod.BU_FI.BANK_DD_REGISTER_CALLBANK_ERROR`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `try_register` | STRING | — |
| `success_register` | STRING | — |
| `bank_code` | STRING | — |
| `date` | DATE | — |
| `try_process_name` | STRING | — |
| `try_datetime` | DATETIME | — |
| `try_hour` | INT64 | — |
| `try_ms_code` | STRING | — |
| `try_partner_code` | STRING | — |
| `try_request_id` | STRING | — |
| `success_process_name` | STRING | — |
| `success_datetime` | DATETIME | — |
| `success_ms_code` | STRING | — |
| `success_partner_code` | STRING | — |
| `success_request_id` | STRING | — |
| `final_ms_code` | STRING | — |
| `final_partner_code` | STRING | — |
| `error_category` | STRING | — |
| `error_sub_category` | STRING | — |
| `description` | STRING | — |
| `vi_desc` | STRING | — |
| `filter_stt` | STRING | — |

### `momovn-prod.BU_FI.BANK_FIRSTCI_BY_BANK`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `user` | STRING | — |
| `bank_code` | STRING | — |
| `f_date` | DATE | — |
| `f_date_time` | DATETIME | — |
| `tid` | FLOAT64 | — |
| `fail_f_date` | DATE | — |
| `fail_f_datetime` | DATETIME | — |
| `fail_f_tid` | FLOAT64 | — |

### `momovn-prod.BU_FI.BANK_FIRSTMAP_BY_BANK`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `user` | STRING | — |
| `bank_code` | STRING | — |
| `f_date` | DATE | — |
| `f_date_time` | DATETIME | — |

### `momovn-prod.BU_FI.BANK_MAP_ERROR_V2`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `select_map` | STRING | — |
| `try_map` | STRING | — |
| `success_map` | STRING | — |
| `phone` | STRING | — |
| `full_name` | STRING | — |
| `account_no` | STRING | — |
| `app_personalid` | STRING | — |
| `linkage` | STRING | — |
| `bank_code` | STRING | — |
| `flow` | STRING | — |
| `type` | STRING | — |
| `date` | DATE | — |
| `select_process_name` | STRING | — |
| `select_datetime` | DATETIME | — |
| `select_session_id` | STRING | — |
| `try_process_name` | STRING | — |
| `try_datetime` | DATETIME | — |
| `try_hour` | INT64 | — |
| `try_ms_code` | STRING | — |
| `try_partner_code` | STRING | — |
| `try_bank_id` | STRING | — |
| `try_partner_trace_id` | STRING | — |
| `try_momo_request_id` | STRING | — |
| `success_process_name` | STRING | — |
| `success_datetime` | DATETIME | — |
| `success_ms_code` | STRING | — |
| `success_partner_code` | STRING | — |
| `success_bank_id` | STRING | — |
| `success_partner_trace_id` | STRING | — |
| `success_momo_request_id` | STRING | — |
| `inquiry_flow` | STRING | — |
| `inquiry_status` | FLOAT64 | — |
| `final_ms_code` | STRING | — |
| `final_partner_code` | STRING | — |
| `no_confirm_map` | INT64 | — |
| `error_category` | STRING | — |
| `error_sub_category` | STRING | — |
| `description` | STRING | — |
| `vi_desc` | STRING | — |
| `filter_stt` | STRING | — |
| `filter_number_confirm` | INT64 | — |
| `user_type` | STRING | — |
| `user_type_bank` | STRING | — |

### `momovn-prod.BU_FI.BANK_VA_RAW`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `request_id` | STRING | — |
| `source_request_id` | STRING | — |
| `process_name` | STRING | — |
| `bank_code_received` | STRING | — |
| `bank_received` | STRING | — |
| `account_no` | STRING | — |
| `account_name` | STRING | — |
| `merchant_id` | STRING | — |
| `brand_name` | STRING | — |
| `trans_type` | STRING | — |
| `payment_type` | STRING | — |
| `date` | DATE | — |
| `datetime` | DATETIME | — |
| `update_datetime` | DATETIME | — |
| `ms_code` | STRING | — |
| `partner_code` | STRING | — |
| `amount` | FLOAT64 | — |
| `tid` | STRING | — |
| `bank_transaction_id` | STRING | — |
| `bank_transaction_time` | DATETIME | — |
| `bank_code_source` | STRING | — |
| `bank_source` | STRING | — |
| `transfer_comment` | STRING | — |
| `process_latency` | FLOAT64 | — |
| `status` | INT64 | — |
| `status_final` | INT64 | — |
| `final_time` | DATETIME | — |
| `latency` | INT64 | — |

### `momovn-prod.BU_FI.BANK_W2B_RAW`
> Bảng này chứa thông tin chi tiết về các giao dịch chuyển tiền từ ví MoMo đến ngân hàng (W2B).

| Column | Type | Description |
|--------|------|-------------|
| `date` | date | **Desc**: Ngày khởi tạo giao dịch chuyển tiền từ ví MoMo đến ngân hàng.  **Sample value**: ['2024-07-10'] |
| `datetime` | datetime | **Desc**: Ngày và giờ khởi tạo giao dịch chuyển tiền từ ví MoMo đến ngân hàng. |
| `response_datetime` | datetime | **Desc**: Thời gian ngân hàng phản hồi lại kết quả chuyển tiền. |
| `final_datetime` | datetime | **Desc**: Thời gian thật hoàn tất giao dịch chuyển tiền từ ví MoMo đến ngân hàng (nếu đã có status_final thì = thời gian trong core, còn chưa có status_final thì là response_datetime). |
| `partner_id` | string | **Desc**: Mã ngân hàng (hiển thị dưới dạng số) dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng. |
| `process_name` | string | **Desc**: Tên của quy trình xử lý chuyển tiền từ ví MoMo tới ngân hàng. |
| `bank_code` | string | **Desc**: Mã ngân hàng dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng.  **Sample value**: ['VTB'] |
| `bank_name` | string | **Desc**: Tên ngân hàng dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng. |
| `bank_received` | string | **Desc**: Mã ngân hàng được nhận tiền từ ví MoMo.  **Sample value**: ['ACB', 'DongABank', 'None', 'VIB'] |
| `type` | string | **Desc**: Luồng chuyển tiền từ ví MoMo tới ngân hàng  **Sample value**:  1. SAME: luồng internal 2. DIFF: luồng external |
| `request_id` | string | **Desc**: Mã định danh duy nhất cho mỗi yêu cầu chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['1ec08f95-691b-4e27-90fd-1cd056fe6445', '220c95cb-3669-4ada-a34f-fdd78376bbd5', '50172894-f3a5-4553-b4d9-2d66e3585f11'] |
| `tid` | string | — |
| `partner_request_id` | string | **Desc**: Mã định danh từ đối tác để trace log. |
| `partner_ref_number` | string | **Desc**: Mã định danh 2 từ đối tác để trace log. |
| `user` | string | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['33938882', '4343039', '47197973'] |
| `cashout_acc_type` | string | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:  1. UNKNOWN: không xác định được 2. ACCOUNT: giao dịch từ tài khoản 3. CARD: giao dịch từ thẻ 4. CARD_TQT: giao dịch từ thẻ quốc tế |
| `transfer_type` | string | **Desc**: Loại chuyển tiền được thực hiện.  **Sample value**: ['APP'] |
| `route_type` | string | **Desc**: Chi tiết luồng đi của giao dịch chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['external'] |
| `detail_flow` | string | **Desc**: Chi tiết 2 của luồng đi của giao dịch chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['None'] |
| `amount` | string | — |
| `amt_range` | string | **Desc**: Khoảng giá trị của số tiền chuyển tiền.  **Sample value**: ['1.1-500K', '2.500001-2M', '3.2000001-300M'] |
| `status` | string | — |
| `status_final` | string | — |
| `ms_code` | string | **Desc**: Mã lỗi của MoMo. |
| `partner_code` | string | **Desc**: Mã lỗi đối tác phản hồi. |
| `partner_message` | string | **Desc**: Diễn giải ý nghĩa mã lỗi đối tác phản hồi. |
| `channel` | string | **Desc**: Kênh thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**:  1. VietQR: quét mã VietQR 2. Other: những kênh khác |
| `channel_detail` | string | **Desc**: Chi tiết kênh thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: |
| `inquiry_status` | string | — |
| `inquiry_flow` | string | **Desc**: Gọi đối soát giao dịch từ luồng nào.  **Sample value**: 1. momo_inquiry: MoMo chủ động gọi đối soát 2. partner_callback: đối tác gọi trả đối soát |
| `inquiry_time` | string | — |
| `moneysource` | string | — |

### `momovn-prod.BU_FI.BANK_ACCOUNT_BALANCE_REGISTER`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `try_register` | STRING | — |
| `success_register` | STRING | — |
| `phone` | STRING | — |
| `full_name` | STRING | — |
| `account_no` | STRING | — |
| `bank_code` | STRING | — |
| `date` | DATE | — |
| `try_process_name` | STRING | — |
| `try_datetime` | DATETIME | — |
| `try_hour` | INT64 | — |
| `try_ms_code` | STRING | — |
| `try_partner_code` | STRING | — |
| `try_request_id` | FLOAT64 | — |
| `success_process_name` | STRING | — |
| `success_datetime` | DATETIME | — |
| `success_ms_code` | STRING | — |
| `success_partner_code` | STRING | — |
| `success_request_id` | FLOAT64 | — |
| `final_ms_code` | STRING | — |
| `final_partner_code` | STRING | — |
| `no_confirm_register` | INT64 | — |
| `error_category` | STRING | — |
| `error_sub_category` | STRING | — |
| `description` | STRING | — |
| `vi_desc` | STRING | — |
| `filter_stt` | STRING | — |
| `filter_number_confirm` | INT64 | — |

### `momovn-bu-fi-shared.GOOGLE_SHEETS_IMPORT.D_BANK_ERROR`
> <p>Bảng dim để nối với các bảng BANK_CI, BANK_CO, BANK_W2B_RAW, BANK_CI_DIRECT_DEBIT để xác định category của mã lỗi &amp; nội dung của lỗi.</p>

| Column | Type | Description |
|--------|------|-------------|
| `error_code` | string | <p><strong>Desc:</strong> Mã lỗi unique được kết hợp từ bank_code,ms_code,partner_code,function</p> |
| `s_date` | date | <p><strong>Desc:</strong> Thời gian bắt đầu có hiệu lực của bộ mã lỗi</p> |
| `e_date` | date | <p><strong>Desc:</strong> Thời gian kết thúc hiệu lực của bộ mã lỗi</p> |
| `stt` | string | <p><strong>Desc:</strong> Số thứ tự để đối chiếu với data khác, không cần quan tâm</p> |
| `bank_id` | string | <p><strong>Desc:</strong> Mã ngân hàng dạng số</p> |
| `bank_code` | string | <p><strong>Desc:</strong> Mã ngân hàng dạng chữ</p> |
| `ms_code_old` | string | <p><strong>Desc:</strong> Mã lỗi cũ của MoMo, không cần quan tâm</p> |
| `ms_code` | string | <p><strong>Desc:</strong> Mã lỗi của MoMo</p> |
| `ms_status` | string | <p><strong>Desc</strong>: Ý nghĩa mã lỗi của MoMo chia theo category</p><p><strong>Sample value</strong>:</p><ol class="om-list-decimal"><li class="om-leading-normal"><p>SUCCESS: thành công</p></li><li class="om-leading-normal"><p>FAIL: thất bại</p></li><li class="om-leading-normal"><p>PENDING: t... |
| `ms_sub_status` | string | <p><strong>Desc</strong>: Ý nghĩa mã lỗi của MoMo chia theo sub-category</p><p></p> |
| `partner_code` | string | <p><strong>Desc:</strong> Mã lỗi của đối tác</p> |
| `function` | string | <p><strong>Desc: </strong>Dịch vụ mà bộ mã lỗi áp dụng</p><p><strong>Sample value:</strong></p><ol class="om-list-decimal"><li class="om-leading-normal"><p>CI: nạp tiền</p></li><li class="om-leading-normal"><p>CO: rút tiền</p></li><li class="om-leading-normal"><p>MAP: liên kết ngân hàng</p></li><... |
| `partner_error_category` | string | <p><strong>Desc: </strong>Ý nghĩa mã lỗi của đối tác chia theo category</p> |
| `partner_error_sub_category` | string | <p><strong>Desc: </strong>Ý nghĩa mã lỗi của đối tác chia theo sub-category</p> |
| `partner_error_category_old` | string | <p><strong>Desc: </strong>Ý nghĩa mã lỗi cũ của đối tác chia theo category, không cần quan tâm</p> |
| `partner_error_sub_category_old` | string | <p><strong>Desc: </strong>Ý nghĩa mã lỗi cũ của đối tác chia theo sub-category, không cần quan tâm</p> |
| `description` | string | <p><strong>Desc: </strong>mô tả ý nghĩa bộ mã lỗi là gì</p> |
| `vi_desc` | string | <p><strong>Desc: </strong>nội dung hiển thị trên app cho người dùng nhìn thấy khi gặp bộ mã lỗi.</p> |
| `status` | string | <p><strong>Desc: </strong>tình trạng của lỗi này là gì.</p> |
| `reason` | string | <p><strong>Desc: </strong>lý do tại sao người dùng lại găp lỗi này</p> |

## Memory (from DA review)

- Giao dịch loại CD: dùng REGEXP_CONTAINS(bank_auth_code, 'C|D|CD') trên bảng BANK_CI
- Khi người dùng hỏi về loại giao dịch CD → đề cập tới cột bank_auth_code trong bảng BANK_CI
- Bank codes: MBB = 'mbb', Sacombank = 'SACOM', Vietinbank = 'VTB', EXIM = 'EXIM'
- Tỉ lệ liên kết ngân hàng thành công của HDB trong tháng 8/2025 là 21.65%
- Tỉ lệ cashin thành công dưới 90% là đúng do dữ liệu báo cáo có loại giao dịch dính lỗi số dư
- Tỷ lệ liên kết ví thành công: safe_divide(count(distinct case when stage = '03. success_map' then user end), count(distinct case when process_name not in ('click_logo') then user end))
- Cần chuyển đổi DATE_TIME sang kiểu TIMESTAMP để tính toán
- Liên kết ví theo ngày: sử dụng COUNT(DISTINCT request_id) thay vì COUNT(DISTINCT USER)
- Khi tính tỉ lệ nạp tiền thành công: thêm điều kiện LINKAGE = 'NHLK', dùng cột STATUS_FINAL (không phải STATUS), dùng cột BANK_CODE (không phải BANK_NAME)
- Loại bỏ lỗi có partner_error_sub_category/ms_sub_status = 'FAIL - SỐ DƯ' khi tính tỷ lệ nạp tiền thành công
- Cột thời gian trong bảng BANK_CO là DATE_TIME, không phải DATETIME
- Trong tháng 7 năm 2025, có 32 ngân hàng liên kết hoạt động
