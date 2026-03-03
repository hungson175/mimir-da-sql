# Domain: BU FS: Bank Partnership

## Identity
- **Domain ID:** `7102da6a-2fdc-4475-a3bf-b66be5bca419`
- **Description:** Thông tin dữ liệu về các dịch vụ liên quan tới ngân hàng (nạp/ rút/ liên kết/ direct debit/ w2b/ ...)
- **Tables:** 3
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.BU_FI.BANK_W2B_RAW
> Bảng này chứa thông tin chi tiết về các giao dịch chuyển tiền từ ví MoMo đến ngân hàng (W2B).

| Column | Description | Examples |
|--------|-------------|----------|
| DATE | **Desc**: Ngày khởi tạo giao dịch chuyển tiền từ ví MoMo đến ngân hàng.  **Sample value**: ['2024-07-10'] | — |
| PARTNER_CODE | **Desc**: Mã lỗi đối tác phản hồi. | — |
| BANK_CODE | **Desc**: Mã ngân hàng dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng.  **Sample value**: ['VTB'] | — |
| BANK_NAME | **Desc**: Tên ngân hàng dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng. | — |
| BANK_RECEIVED | **Desc**: Mã ngân hàng được nhận tiền từ ví MoMo.  **Sample value**: ['ACB', 'DongABank', 'None', 'VIB'] | — |
| TYPE | **Desc**: Luồng chuyển tiền từ ví MoMo tới ngân hàng  **Sample value**:  1. SAME: luồng internal 2. DIFF: luồng external | — |
| REQUEST_ID | **Desc**: Mã định danh duy nhất cho mỗi yêu cầu chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['1ec08f95-691b-4e27-90fd-1cd056fe6445', '220... | — |
| TID | **Desc**: Mã định danh giao dịch.  **Sample value**: ['62187421058.0', '62199181951.0', '62210667900.0'] | — |
| USER | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['33938882', '4343039... | — |
| AMOUNT | **Desc**: Số tiền chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['150000.0', '1500000.0', '200000.0'] | — |
| AMT_RANGE | **Desc**: Khoảng giá trị của số tiền chuyển tiền.  **Sample value**: ['1.1-500K', '2.500001-2M', '3.2000001-300M'] | — |
| STATUS | **Desc**: Trạng thái của giao dịch .  **Sample value**: 1. 1: giao dịch treo 2. 2: giao dịch thành công 3. 6: giao dịch thất bại | — |
| CHANNEL | **Desc**: Kênh thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**:  1. VietQR: quét mã VietQR 2. Other: những kênh khác | — |
| CHANNEL_DETAIL | **Desc**: Chi tiết kênh thực hiện chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: | — |
| CASHOUT_ACC_TYPE | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:  1. UNKNOWN: không xác định được 2. ACCOUNT: giao dịch từ tài khoản 3. CARD: giao dịch từ thẻ ... | — |
| TRANSFER_TYPE | **Desc**: Loại chuyển tiền được thực hiện.  **Sample value**: ['APP'] | — |
| ROUTE_TYPE | **Desc**: Chi tiết luồng đi của giao dịch chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['external'] | — |
| DETAIL_FLOW | **Desc**: Chi tiết 2 của luồng đi của giao dịch chuyển tiền từ ví MoMo tới ngân hàng.  **Sample value**: ['None'] | — |
| DATETIME | **Desc**: Ngày và giờ khởi tạo giao dịch chuyển tiền từ ví MoMo đến ngân hàng. | — |
| RESPONSE_DATETIME | **Desc**: Thời gian ngân hàng phản hồi lại kết quả chuyển tiền. | — |
| PARTNER_ID | **Desc**: Mã ngân hàng (hiển thị dưới dạng số) dùng để thực hiện chuyển tiền từ ví MoMo đến ngân hàng. | — |
| PROCESS_NAME | **Desc**: Tên của quy trình xử lý chuyển tiền từ ví MoMo tới ngân hàng. | — |
| PARTNER_REQUEST_ID | **Desc**: Mã định danh từ đối tác để trace log. | — |
| PARTNER_REF_NUMBER | **Desc**: Mã định danh 2 từ đối tác để trace log. | — |
| STATUS_FINAL | **Desc**: Trạng thái cuối cùng của giao dịch  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch chưa có trạng t... | — |
| MS_CODE | **Desc**: Mã lỗi của MoMo. | — |
| PARTNER_MESSAGE | **Desc**: Diễn giải ý nghĩa mã lỗi đối tác phản hồi. | — |
| INQUIRY_STATUS | **Desc**: Trạng thái của giao dịch sau khi được đối soát  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch khô... | — |
| INQUIRY_FLOW | **Desc**: Gọi đối soát giao dịch từ luồng nào.  **Sample value**: 1. momo_inquiry: MoMo chủ động gọi đối soát 2. partner_callback: đối tác gọi trả đối... | — |
| INQUIRY_TIME | **Desc**: Thời gian gọi đối soát lần đầu.  **Sample value**: ['None'] | — |
| FINAL_DATETIME | **Desc**: Thời gian thật hoàn tất giao dịch chuyển tiền từ ví MoMo đến ngân hàng (nếu đã có status_final thì = thời gian trong core, còn chưa có statu... | — |

### momovn-prod.BU_FI.BANK_MAP_ERROR
> Bảng này chứa thông tin về các lỗi xảy ra trong quá trình liên kết ngân hàng với ví MoMo.

| Column | Description | Examples |
|--------|-------------|----------|
| REQUEST_ID | **Desc**: Mã định danh duy nhất cho mỗi yêu cầu liên kết ngân hàng.  **Sample value**: ['ABB106987712024-02-28 10:22:25', 'ABB227538812024-02-28 07:55... | — |
| USER | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện liên kết ngân hàng.  **Sample value**: ['33938882', '4343039', '47197973'] | — |
| PROCESS_NAME | **Desc**: Tên của quy trình xử lý liên kết ngân hàng.  **Sample value**:  1. click_logo: bước chọn logo ngân hàng cần liên kết 2. verifyMap, verify_ma... | — |
| LINKAGE | **Desc**: Nguồn liên kết của nguồn tiền ngân hàng đang thực hiện liên kết.  **Sample value**:  1. NAPAS: là nguồn napas 2. VISA: là nguồn visa 3. NHLK... | — |
| BANK_CODE | **Desc**: Mã ngân hàng liên kết đang thực hiện liên kết.  **Sample value**: ['ABB'] | — |
| DATE | **Desc**: Ngày khởi tạo liên kết ngân hàng.  **Sample value**: ['2024-02-28'] | — |
| DATE_TIME | **Desc**: Ngày và giờ khởi tạo liên kết ngân hàng.  **Sample value**: ['2024-02-28 07:55:12', '2024-02-28 10:22:25', '2024-02-28 14:14:59'] | — |
| HOUR | **Desc**: Giờ khởi tạo liên kết ngân hàng.  **Sample value**: ['10', '14', '16'] | — |
| TYPE | **Desc**: Loại liên kết.  **Sample value**:   1. UNKNOWN: không xác định được 2. ACCOUNT: tài khoản 3. CARD:  thẻ 4. CARD_TQT: thẻ quốc tế | — |
| MS_CODE | **Desc**: Mã lỗi của MoMo.  **Sample value**: ['1004', '3010', '9000'] | — |
| PARTNER_CODE | **Desc**: Mã lỗi đối tác phản hồi.  **Sample value**: ['-1'] | — |
| ERROR_CATEGORY | **Desc**: Danh mục level 1 lỗi xảy ra trong quá trình liên kết.  **Sample value**: ['SUCCESS'] | — |
| ERROR_SUB_CATEGORY | **Desc**: Danh mục level 2 lỗi xảy ra trong quá trình liên kết.  **Sample value**: ['THÀNH CÔNG'] | — |
| DESCRIPTION | **Desc**: Diễn giải ý nghĩa mã lỗi.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngà... | — |
| VI_DESC | **Desc**: Diễn giải ý nghĩa mã lỗi để show cho người dùng.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn ... | — |
| FLOW | **Desc**: Người dùng liên kết từ luồng nào.  **Sample value**:  1. normal: liên kết luồng bình thường 2. one_click: liên kết luồng một chạm 3. counter... | — |
| STAGE | **Desc**: Xác định dòng record thuộc bước nào.  **Sample value**:  1. 01. select_map: chọn ngân hàng 2. 02. try_map: thực hiện liên kết 3. 03. success... | — |
| BANK_ID | **Desc**: Mã định danh từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| PARTNER_TRACE_ID | **Desc**: Mã định danh 2 từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| MOMO_REQUEST_ID | **Desc**: Mã định danh từ MoMo để trace log.  **Sample value**: ['None'] | — |
| FULL_NAME | **Desc**: Tên người dùng thực hiện liên kết  **Sample value**: | — |
| ACCOUNT_NO | **Desc**: Tài khoản ngân hàng/ thẻ được dùng để liên kết  **Sample value**: | — |
| APP_PERSONALID | **Desc**: CMND/ CCCD của người dùng thực hiện liên kết  **Sample value**: | — |
| INQUIRY_FLOW | **Desc**: Gọi đối soát từ luồng nào.  **Sample value**: | — |
| INQUIRY_STATUS | **Desc**: Trạng thái sau khi được đối soát  **Sample value**: | — |

### momovn-prod.BU_FI.BANK_CO
> Bảng này chứa thông tin về các giao dịch rút tiền về ngân hàng từ MoMo.

| Column | Description | Examples |
|--------|-------------|----------|
| DATE | **Desc**: Ngày khởi tạo giao dịch rút tiền về ngân hàng.  **Sample value**: ['2022-12-01'] | — |
| DATE_TIME | **Desc**: Ngày và giờ khởi tạo giao dịch rút tiền về ngân hàng.  **Sample value**: ['2022-12-01 04:12:21', '2022-12-01 04:19:31', '2022-12-01 06:11:10... | — |
| LINKAGE | **Desc**: Nguồn liên kết của nguồn tiền ngân hàng đang thực hiện giao dịch rút tiền.  **Sample value**:  1. NAPAS: là nguồn napas 2. VISA: là nguồn vi... | — |
| BANK_CODE | **Desc**: Mã ngân hàng liên kết đang thực hiện giao dịch rút tiền.  **Sample value**: ['ABB'] | — |
| LINKING_METHOD | **Desc**: Phương thức liên kết của nguồn được sử dụng.  **Sample value**:  1. APP: liên kết từ app MoMo 2. IB (internet banking): liên kết từ app/web ... | — |
| TYPE | **Desc**: Giao dịch từ tài khoản gì?  **Sample value**:   1. UNKNOWN: không xác định được 2. ACCOUNT: giao dịch từ tài khoản 3. CARD: giao dịch từ thẻ... | — |
| TID | **Desc**: Mã định danh giao dịch.  **Sample value**: ['28743491909', '28743513851', '28744374659'] | — |
| USER | **Desc**: Mã định danh người dùng (còn có thể gọi là agentid) thực hiện rút tiền.  **Sample value**: ['33938882', '4343039', '47197973'] | — |
| AMOUNT | **Desc**: Số tiền rút tiền.  **Sample value**: ['10000.0', '100000.0', '17000000.0', '500000.0'] | — |
| MS_CODE | **Desc**: Mã lỗi của MoMo.  **Sample value**: ['1004', '3010', '9000'] | — |
| PARTNER_CODE | **Desc**: Mã lỗi đối tác phản hồi.  **Sample value**: ['-1'] | — |
| DESCRIPTION | **Desc**: Diễn giải ý nghĩa mã lỗi.  **Sample value**: ['Chặn tổng hạn mức tối đa / ngày', 'Transaction is pending', 'Vượt hạn mức giao dịch trong ngà... | — |
| STATUS | **Desc**: Trạng thái của giao dịch .  **Sample value**: 1. 1: giao dịch treo 2. 2: giao dịch thành công 3. 6: giao dịch thất bại | — |
| STATUS_FINAL | **Desc**: Trạng thái cuối cùng của giao dịch  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch chưa có trạng t... | — |
| G_ | **Desc**: Người dùng thực hiện giao dịch thuộc nhóm nào?  **Sample value**: 1. SIM: người dùng là sim chủ của MoMo 2. AUTO_MERCHANT: người dùng là đối... | — |
| BANK_TIME | **Desc**: Thời gian ngân hàng phản hồi lại kết quả rút tiền.  **Sample value**: ['2022-12-01 06:11:10', '2022-12-01 19:40:09', 'NaT'] | — |
| FINAL_TIME | **Desc**: Thời gian thật hoàn tất giao dịch rút tiền (nếu đã có status_final thì = thời gian trong core, còn chưa có status_final thì là bank_time).  ... | — |
| LATENCY | **Desc**: Độ trễ (số giây) trong xử lý giao dịch rút tiền (nếu đã có status_final thì = final_time - date_time, còn chưa có status_final thì là bank_t... | — |
| BANK_ID | **Desc**: Mã định danh từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| PARTNER_TRACE_ID | **Desc**: Mã định danh 2 từ ngân hàng để trace log.  **Sample value**: ['None'] | — |
| FLOW | **Desc**: Trạng thái của giao dịch sau khi được đối soát  **Sample value**: 1. MANUAL: luồng rút tiền của người dùng bình thường về ngân hàng đang liê... | — |
| INQUIRY_STATUS | **Desc**: Trạng thái của giao dịch sau khi được đối soát  **Sample value**: 1. 2: giao dịch thành công 2. 6: giao dịch thất bại 3. null: giao dịch khô... | — |
| INQUIRY_FLOW | **Desc**: Gọi đối soát giao dịch từ luồng nào.  **Sample value**: 1. momo_inquiry: MoMo chủ động gọi đối soát 2. partner_callback: đối tác gọi trả đối... | — |
| INQUIRY_TIME | **Desc**: Thời gian gọi đối soát lần đầu.  **Sample value**: ['None'] | — |
| INQUIRY_TRY | **Desc**: Số lần gọi đối soát giao dịch.  **Sample value**: ['None'] | — |
| INQUIRY_PARTNER_CODE | **Desc**: Mã lỗi đối tác phản hồi sau khi đối soát  **Sample value**: ['None'] | — |
| INQUIRY_TIME_LATEST | **Desc**: Thời gian gọi đối soát gần nhất.  **Sample value**: ['None'] | — |

## Domain Knowledge (from Mimir)

- Để tìm số lượng giao dịch loại C D, sử dụng điều kiện regexp_contains(bank_auth_code,'C|D|CD')
- Tỉ lệ cashin thành công dưới 90% là đúng do dữ liệu báo cáo có loại giao dịch dính lỗi số dư
- Tỷ lệ liên kết ví thành công được tính bằng: safe_divide(count(distinct case when stage = '03. success_map' then user end), count(distinct case when process_name not in ('click_logo') then user end))
- Cần chuyển đổi DATE_TIME sang kiểu TIMESTAMP để tính toán
- Khi lấy số lượt liên kết ví ngân hàng BIDV theo ngày, sử dụng COUNT(DISTINCT request_id) thay vì COUNT(DISTINCT USER)
- Dùng câu lệnh SQL: REGEXP_CONTAINS(bank_auth_code, 'C|D|CD') để phân biệt loại CD trong bank_auth_code
- Khi truy vấn số lượng khách hàng liên kết ví thành công, sử dụng mã ngân hàng 'mbb' cho cột BANK_CODE
- Mã ngân hàng Sacombank là 'SACOM'
- Tỉ lệ liên kết ngân hàng thành công của HDB trong tháng 8/2025 là 21.65%
- Khi người dùng hỏi về loại giao dịch CD thì có nghĩa là đang đề cập tới cột bank_auth_code trong bảng BANK_CI
- Khi tính tỉ lệ nạp tiền thành công, thêm điều kiện ci.LINKAGE = 'NHLK'
- Bank code EXIM
- Để lấy số tiền giao dịch loại CD của ngân hàng MBB, sử dụng mã REGEXP_CONTAINS(BANK_AUTH_CODE, 'C|D|CD')
- Mã ngân hàng Vietinbank là 'VTB'
- Khi tính tỉ lệ nạp tiền thành công, sử dụng cột STATUS_FINAL thay vì STATUS
- Khi tính tỉ lệ nạp tiền thành công, sử dụng cột BANK_CODE thay vì BANK_NAME
- Cột thời gian trong bảng BANK_CO là DATE_TIME, không phải DATETIME
- Loại bỏ lỗi có partner_error_sub_category/ms_sub_status = 'FAIL - SỐ DƯ' khi tính tỷ lệ giao dịch nạp tiền ngân hàng liên kết thành công
- Trong tháng 7 năm 2025, có 32 ngân hàng liên kết hoạt động

## Suggested Probe Questions

- Status: **Not yet probed**
