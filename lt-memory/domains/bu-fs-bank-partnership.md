# BU FS: Bank Partnership

**Domain ID:** `7102da6a-2fdc-4475-a3bf-b66be5bca419`

## Description
Thông tin dữ liệu về các dịch vụ liên quan tới ngân hàng (nạp/ rút/ liên kết/ direct debit/ w2b/ ...)

## Tables

### `momovn-prod.BU_FI.BANK_W2B_RAW`
> Bảng này chứa thông tin chi tiết về các giao dịch chuyển tiền từ ví MoMo đến ngân hàng (W2B).

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATE` | DATE | **Desc**: Ngày khởi tạo giao dịch chuyển tiền từ ví MoMo đến ngân hàng.  **Sample value**: ['2024-07-10'] | — |
| `PARTNER_CODE` | STRING | **Desc**: Mã lỗi đối tác phản hồi. | — |
| `BANK_CODE` | STRING | **Desc**: Mã ngân hàng dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng.  **Sample value**: ['VTB'] | — |
| `BANK_NAME` | STRING | **Desc**: Tên ngân hàng dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng. | — |
| `BANK_RECEIVED` | STRING | **Desc**: Mã ngân hàng được nhận tiền từ ví MoMo.  **Sample value**: ['ACB', 'DongABank', 'None', 'VIB'] | — |
| `TYPE` | STRING | **Desc**: Luồng chuyển tiền từ ví MoMo tới ngân hàng  **Sample value**:  1. SAME: luồng internal 2. DIFF: luồng external | — |
| `REQUEST_ID` | STRING | **Desc**: Mã định danh duy nhất cho mỗi yêu cầu chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['1ec08f95-691b-4e27-90fd-1cd056fe6445', '220c95cb-3669-4ada-a34f-fdd78376bbd5', '50172894-f3a5-4553-b4d9-2d66e3585f11'] | — |
| `TID` | FLOAT | **Desc**: Mã định danh giao dịch.  **Sample value**: ['62187421058.0', '62199181951.0', '62210667900.0'] | — |
| `USER` | STRING | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['33938882', '4343039', '47197973'] | — |
| `AMOUNT` | FLOAT | **Desc**: Số tiền chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['150000.0', '1500000.0', '200000.0'] | — |
| `AMT_RANGE` | STRING | **Desc**: Khoảng giá trị của số tiền chuyển tiền.  **Sample value**: ['1.1-500K', '2.500001-2M', '3.2000001-300M'] | — |
| `STATUS` | INT | **Desc**: Trạng thái của giao dịch .  **Sample value**: 1. 1: giao dịch treo 2. 2: giao dịch thành công 3. 6: giao dịch thất bại | — |
| `CHANNEL` | STRING | **Desc**: Kênh thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**:  1. VietQR: quét mã VietQR 2. Other: những kênh khác | — |
| `CHANNEL_DETAIL` | STRING | **Desc**: Chi tiết kênh thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: | — |
| `CASHOUT_ACC_TYPE` | STRING | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:  1. UNKNOWN: không xác định được 2. ACCOUNT: giao dịch từ tài khoản 3. CARD: giao dịch từ thẻ 4. CARD_TQT: giao dịch từ thẻ quốc tế | — |
| `TRANSFER_TYPE` | STRING | **Desc**: Loại chuyển tiền được thực hiện.  **Sample value**: ['APP'] | — |
| `ROUTE_TYPE` | STRING | **Desc**: Chi tiết luồng đi của giao dịch chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['external'] | — |
| `DETAIL_FLOW` | STRING | **Desc**: Chi tiết 2 của luồng đi của giao dịch chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['None'] | — |
| `DATETIME` | DATETIME | **Desc**: Ngày và giờ khởi tạo giao dịch chuyển tiền từ ví MoMo đến ngân hàng. | — |
| `RESPONSE_DATETIME` | DATETIME | **Desc**: Thời gian ngân hàng phản hồi lại kết quả chuyển tiền. | — |
| `PARTNER_ID` | STRING | **Desc**: Mã ngân hàng (hiển thị dưới dạng số) dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng. | — |
| `PROCESS_NAME` | STRING | **Desc**: Tên của quy trình xử lý chuyển tiền từ ví MoMo tới ngân hàng. | — |
| `PARTNER_REQUEST_ID` | STRING | **Desc**: Mã định danh từ đối tác để trace log. | — |
| `PARTNER_REF_NUMBER` | STRING | **Desc**: Mã định danh 2 từ đối tác để trace log. | — |
| `STATUS_FINAL` | INT | **Desc**: Trạng thái cuối cùng của giao dịch  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch chưa có trạng thái cuối | — |
| `MS_CODE` | STRING | **Desc**: Mã lỗi của MoMo. | — |
| `PARTNER_MESSAGE` | STRING | **Desc**: Diễn giải ý nghĩa mã lỗi đối tác phản hồi. | — |
| `INQUIRY_STATUS` | FLOAT | **Desc**: Trạng thái của giao dịch sau khi được đối soát  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch không đối soát | — |
| `INQUIRY_FLOW` | STRING | **Desc**: Gọi đối soát giao dịch từ luồng nào.  **Sample value**: 1. momo_inquiry: MoMo chủ động gọi đối soát 2. partner_callback: đối tác gọi trả đối soát | — |
| `INQUIRY_TIME` | INT | **Desc**: Thời gian gọi đối soát lần đầu.  **Sample value**: ['None'] | — |
| `FINAL_DATETIME` | DATETIME | **Desc**: Thời gian thật hoàn tất giao dịch chuyển tiền từ ví MoMo đến ngân hàng (nếu đã có status_final thì = thời gian trong core, còn chưa có status_final thì là response_datetime). | — |

### `momovn-prod.BU_FI.BANK_MAP_ERROR`
> Bảng này chứa thông tin về các lỗi xảy ra trong quá trình liên kết ngân hàng với ví MoMo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `REQUEST_ID` | STRING | **Desc**: Mã định danh duy nhất cho mỗi yêu cầu liên kết ngân hàng.  **Sample value**: ['ABB106987712024-02-28 10:22:25', 'ABB227538812024-02-28 07:55:12', 'ABB457042402024-02-28 16:39:45'] | — |
| `USER` | STRING | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện liên kết ngân hàng.  **Sample value**: ['33938882', '4343039', '47197973'] | — |
| `PROCESS_NAME` | STRING | **Desc**: Tên của quy trình xử lý liên kết ngân hàng.  **Sample value**:  1. click_logo: bước chọn logo ngân hàng cần liên kết 2. verifyMap, verify_map_one_click: thực hiện liên kết 3. map, register, confirm_map_one_click: bước kết quả cuối (liên kết thành công hay thất bại) | — |
| `LINKAGE` | STRING | **Desc**: Nguồn liên kết của nguồn tiền ngân hàng đang thực hiện liên kết.  **Sample value**:  1. NAPAS: là nguồn napas 2. VISA: là nguồn visa 3. NHLK: là nguồn ngân hàng liên kết | — |
| `BANK_CODE` | STRING | **Desc**: Mã ngân hàng liên kết đang thực hiện liên kết.  **Sample value**: ['ABB'] | — |
| `DATE` | DATE | **Desc**: Ngày khởi tạo liên kết ngân hàng.  **Sample value**: ['2024-02-28'] | — |
| `DATE_TIME` | DATETIME | **Desc**: Ngày và giờ khởi tạo liên kết ngân hàng.  **Sample value**: ['2024-02-28 07:55:12', '2024-02-28 10:22:25', '2024-02-28 14:14:59'] | — |
| `HOUR` | INT | **Desc**: Giờ khởi tạo liên kết ngân hàng.  **Sample value**: ['10', '14', '16'] | — |
| `TYPE` | STRING | **Desc**: Loại liên kết.  **Sample value**:   1. UNKNOWN: không xác định được 2. ACCOUNT: tài khoản 3. CARD:  thẻ 4. CARD_TQT: thẻ quốc tế | — |
| `MS_CODE` | STRING | **Desc**: Mã lỗi của MoMo.  **Sample value**: ['1004', '3010', '9000'] | — |
| `PARTNER_CODE` | STRING | **Desc**: Mã lỗi đối tác phản hồi.  **Sample value**: ['-1'] | — |
| `ERROR_CATEGORY` | STRING | **Desc**: Danh mục level 1 lỗi xảy ra trong quá trình liên kết.  **Sample value**: ['SUCCESS'] | — |
| `ERROR_SUB_CATEGORY` | STRING | **Desc**: Danh mục level 2 lỗi xảy ra trong quá trình liên kết.  **Sample value**: ['THÀNH CÔNG'] | — |
| `DESCRIPTION` | STRING | **Desc**: Diễn giải ý nghĩa mã lỗi.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngày'] | — |
| `VI_DESC` | STRING | **Desc**: Diễn giải ý nghĩa mã lỗi để show cho người dùng.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngày'] | — |
| `FLOW` | STRING | **Desc**: Người dùng liên kết từ luồng nào.  **Sample value**:  1. normal: liên kết luồng bình thường 2. one_click: liên kết luồng một chạm 3. counter: liên kết dưới quầy 4. null: không xác định | — |
| `STAGE` | STRING | **Desc**: Xác định dòng record thuộc bước nào.  **Sample value**:  1. 01. select_map: chọn ngân hàng 2. 02. try_map: thực hiện liên kết 3. 03. success_map: kết quả liên kết thành công hay thất bại | — |
| `BANK_ID` | STRING | **Desc**: Mã định danh từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| `PARTNER_TRACE_ID` | STRING | **Desc**: Mã định danh 2 từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| `MOMO_REQUEST_ID` | STRING | **Desc**: Mã định danh từ MoMo để trace log.  **Sample value**: ['None'] | — |
| `FULL_NAME` | STRING | **Desc**: Tên người dùng thực hiện liên kết  **Sample value**: | — |
| `ACCOUNT_NO` | STRING | **Desc**: Tài khoản ngân hàng/ thẻ được dùng để liên kết  **Sample value**: | — |
| `APP_PERSONALID` | STRING | **Desc**: CMND/ CCCD của người dùng thực hiện liên kết  **Sample value**: | — |
| `INQUIRY_FLOW` | STRING | **Desc**: Gọi đối soát từ luồng nào.  **Sample value**: | — |
| `INQUIRY_STATUS` | FLOAT | **Desc**: Trạng thái sau khi được đối soát  **Sample value**: | — |

### `momovn-prod.BU_FI.BANK_CO`
> Bảng này chứa thông tin về các giao dịch rút tiền về ngân hàng từ MoMo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATE` | DATE | **Desc**: Ngày khởi tạo giao dịch rút tiền về ngân hàng.  **Sample value**: ['2022-12-01'] | — |
| `DATE_TIME` | DATETIME | **Desc**: Ngày và giờ khởi tạo giao dịch rút tiền về ngân hàng.  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] | — |
| `LINKAGE` | STRING | **Desc**: Nguồn liên kết của nguồn tiền ngân hàng đang thực hiện giao dịch rút tiền.  **Sample value**:  1. NAPAS: là nguồn napas 2. VISA: là nguồn visa 3. NHLK: là nguồn ngân hàng liên kết | — |
| `BANK_CODE` | STRING | **Desc**: Mã ngân hàng liên kết đang thực hiện giao dịch rút tiền.  **Sample value**: ['ABB'] | — |
| `LINKING_METHOD` | STRING | **Desc**: Phương thức liên kết của nguồn được sử dụng.  **Sample value**:  1. APP: liên kết từ app MoMo 2. IB (internet banking): liên kết từ app/web của ngân hàng đối tác | — |
| `TYPE` | STRING | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:   1. UNKNOWN: không xác định được 2. ACCOUNT: giao dịch từ tài khoản 3. CARD: giao dịch từ thẻ 4. CARD_TQT: giao dịch từ thẻ quốc tế | — |
| `TID` | STRING | **Desc**: Mã định danh giao dịch.  **Sample value**: ['28743491909', '28743513851', '28744374659'] | — |
| `USER` | STRING | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện rút tiền.  **Sample value**: ['33938882', '4343039', '47197973'] | — |
| `AMOUNT` | INT | **Desc**: Số tiền rút tiền.  **Sample value**: ['10000.0', '100000.0', '17000000.0', '500000.0'] | — |
| `MS_CODE` | STRING | **Desc**: Mã lỗi của MoMo.  **Sample value**: ['1004', '3010', '9000'] | — |
| `PARTNER_CODE` | STRING | **Desc**: Mã lỗi đối tác phản hồi.  **Sample value**: ['-1'] | — |
| `DESCRIPTION` | STRING | **Desc**: Diễn giải ý nghĩa mã lỗi.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngày'] | — |
| `STATUS` | INT | **Desc**: Trạng thái của giao dịch .  **Sample value**: 1. 1: giao dịch treo 2. 2: giao dịch thành công 3. 6: giao dịch thất bại | — |
| `STATUS_FINAL` | INT | **Desc**: Trạng thái cuối cùng của giao dịch  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch chưa có trạng thái cuối | — |
| `G_` | STRING | **Desc**: Người dùng thực hiện giao dịch thuộc nhóm nào?  **Sample value**: 1. SIM: người dùng là sim chủ của MoMo 2. AUTO_MERCHANT: người dùng là đối tác 3. MERCHANT: người dùng là đối tác 4. null: là EU (end user: người dùng thật) | — |
| `BANK_TIME` | DATETIME | **Desc**: Thời gian ngân hàng phản hồi lại kết quả rút tiền.  **Sample value**: ['2022-12-01 06:11:10', '2022-12-01 19:40:09', 'NaT'] | — |
| `FINAL_TIME` | DATETIME | **Desc**: Thời gian thật hoàn tất giao dịch rút tiền (nếu đã có status_final thì = thời gian trong core, còn chưa có status_final thì là bank_time).  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10'] | — |
| `LATENCY` | INT | **Desc**: Độ trễ (số giây) trong xử lý giao dịch rút tiền (nếu đã có status_final thì = final_time - date_time, còn chưa có status_final thì là bank_time - date_time).  **Sample value**: ['0'] | — |
| `BANK_ID` | STRING | **Desc**: Mã định danh từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| `PARTNER_TRACE_ID` | STRING | **Desc**: Mã định danh 2 từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| `FLOW` | STRING | **Desc**: Trạng thái của giao dịch sau khi được đối soát  **Sample value**: 1. MANUAL: luồng rút tiền của người dùng bình thường về ngân hàng đang liên kết 2. W2B: luồng đảo từ luồng w2b  3. AUTO_PAYOUT_TRANS: luồng tự động rút tiền của người dùng là đối tác 4. UNKNOWN: không xác định được luồng | — |
| `INQUIRY_STATUS` | INT | **Desc**: Trạng thái của giao dịch sau khi được đối soát  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch không đối soát | — |
| `INQUIRY_FLOW` | STRING | **Desc**: Gọi đối soát giao dịch từ luồng nào.  **Sample value**: 1. momo_inquiry: MoMo chủ động gọi đối soát 2. partner_callback: đối tác gọi trả đối soát | — |
| `INQUIRY_TIME` | DATETIME | **Desc**: Thời gian gọi đối soát lần đầu.  **Sample value**: ['None'] | — |
| `INQUIRY_TRY` | FLOAT | **Desc**: Số lần gọi đối soát giao dịch.  **Sample value**: ['None'] | — |
| `INQUIRY_PARTNER_CODE` | STRING | **Desc**: Mã lỗi đối tác phản hồi sau khi đối soát  **Sample value**: ['None'] | — |
| `INQUIRY_TIME_LATEST` | DATETIME | **Desc**: Thời gian gọi đối soát gần nhất.  **Sample value**: ['None'] | — |

## Memory
*19 entries — user-trained knowledge*

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
