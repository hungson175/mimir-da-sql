# [PAYMENT PLATFORM] Electronic Data Capture

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `fa727a68-0970-4e47-b52b-ed5b5cb7451d`

## Description
Bảng fact lưu trữ toàn bộ giao dịch thanh toán qua thiết bị EDC (Electronic Data Capture) tại các merchant.
- Phân tích hiệu suất hoạt động của EDC theo merchant, store, partner_code.
- Tính toán GMV, tỷ lệ giao dịch thành công, lý do lỗi theo từng ngân hàng, loại thẻ.

## Tables

### `momovn-prod.MBI_DA.THAI_CDO_EDC_PAYMENT`
> Bảng fact lưu trữ toàn bộ giao dịch thanh toán qua thiết bị EDC (máy quẹt thẻ) tại điểm bán lẻ, bao gồm cả giao dịch gốc và hoàn tiền.
- Phân tích hiệu suất hoạt động của EDC theo merchant, store, partner_code.
- Tính toán GMV, tỷ lệ giao dịch thành công, lý do lỗi theo từng ngân hàng, loại thẻ.
- Hỗ trợ kiểm soát rủi ro: theo dõi reference number, approve code, các chuỗi giao dịch hoàn tiền.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `note` | STRING | Kênh phát sinh giao dịch: 'pay_v2' (giao dịch gốc), 'sdk' (giao dịch qua SDK).Kênh phát sinh giao dịch: 'pay_v2' (giao dịch gốc), 'sdk' (giao dịch qua SDK). | sdk, pay_v2 |
| `trans_date` | DATE | Ngày giao dịch theo múi giờ VN.Ngày giao dịch theo múi giờ VN. | 2025-10-19, 2025-11-23, 2025-11-02 |
| `trans_datetime` | DATETIME | Thời điểm giao dịch đầy đủ giờ-phút-giây.Thời điểm giao dịch đầy đủ giờ-phút-giây. | 2025-10-17 11:51:53, 2025-10-08 08:26:21, 2025-11-19 15:12:42 |
| `req_type` | STRING | Loại yêu cầu API: 'payWithEdc' – thanh toán bằng EDC.Loại yêu cầu API: 'payWithEdc' – thanh toán bằng EDC. | payWithEdcStatic, payWithEdc |
| `pay_type` | STRING | Kiểu giao dịch: 'edcDevice' – thanh toán thẻ quẹt, 'refund' – hoàn tiền.Kiểu giao dịch: 'edcDevice' – thanh toán thẻ quẹt, 'refund' – hoàn tiền. | edcDevice, refund |
| `partner_code` | STRING | Mã đối tác triển khai EDC.Mã đối tác triển khai EDC.  **Sample value**: MOMO2TLF20230322, MOMOARJJ20250408 | MOMO2TLF20230322, MOMO41BH20240226, MOMOSHYZ20240507 |
| `merchant_name` | STRING | Tên merchant sở hữu thiết bị EDC.Tên merchant sở hữu thiết bị EDC.  **Sample value**: EVERY HALF COFFEE ROASTERS, BONCHON | EVERY HALF COFFEE ROASTERS, KOHNAN, REVI COFFEE |
| `store_id` | STRING | Mã định danh cửa hàng (store) của merchant.Mã định danh cửa hàng (store) của merchant (policy tag: Store Id). | VmERDYIRYl4ICqQG, 1011Pos1, 1018Pos2 |
| `store_name` | STRING | Tên cửa hàng EDC.Tên cửa hàng EDC.  **Sample value**: BCNVC | — |
| `request_id` | STRING | Mã request duy nhất do hệ thống phát sinh cho mỗi giao dịch.Mã request duy nhất do hệ thống phát sinh cho mỗi giao dịch. | MOMOOZW520250903_MOMOOZW520250903_532301489720, MOMO41BH20240226_MOMO41BH20240226_529001036444, MOMOSHYZ20240507_MOMOSHYZ20240507_528101983707 |
| `bill_id` | STRING | Mã hóa đơn đối tác (bill_id) theo policy tag 'Bill Id'.Mã hóa đơn đối tác (bill_id) theo policy tag 'Bill Id'. | — |
| `core_tran_id` | STRING | Mã giao dịch cốt lõi dạng số nguyên.Mã giao dịch cốt lõi dạng số nguyên.  **Sample value**: 105310408932 | 109044297940, 107877777671, 107884518637 |
| `core_tran_id_new` | STRING | Mã giao dịch mở rộng, bao gồm cả suffix từ đối tác hoặc EDC.Mã giao dịch mở rộng, bao gồm cả suffix từ đối tác hoặc EDC. | 104269062732-MOMOSHYZ20240507_529001115192, 109046770905-MOMOSHYZ20240507_533301105192, 102747658563-L4GBCOVB4G5QEUAL017O |
| `agent_id` | STRING | agent_id định danh ví MoMo (đã ẩn theo policy).agent_id định danh ví MoMo (đã ẩn theo policy). | — |
| `money_source_id` | STRING | ID nguồn tiền: '0'=unidentified, '1'=Ví MoMo, ...ID nguồn tiền: '0'=unidentified, '1'=Ví MoMo, ... | 0, 1 |
| `money_source` | STRING | Tên hiển thị của nguồn tiền.Tên hiển thị của nguồn tiền.  **Sample value**: MoMo Wallet, Unidentified | Unidentified, MoMo Wallet |
| `GMV` | FLOAT | Tổng Giá trị đơn hàng (VNĐ) không bao gồm giảm giá.Tổng Giá trị đơn hàng (VNĐ) không bao gồm giảm giá. | 60000, 55000, 75000 |
| `paymnet_status` | STRING | Trạng thái cuối của giao dịch: 'success'/'failed'.Trạng thái cuối của giao dịch: 'success'/'failed'. | success |
| `result_code` | FLOAT | Mã kết quả nội bộ từ middleware EDC.Mã kết quả nội bộ từ middleware EDC.  **Sample value**: 0.0, 5.0 | 0, 1001 |
| `result_description` | STRING | Mô tả bằng tiếng Việt kết quả giao dịch.Mô tả bằng tiếng Việt kết quả giao dịch.  **Sample value**: Thành công, Thẻ đã khóa | Thành công, Tài khoản không đủ tiền, Successful. |
| `core_result_code` | FLOAT | Mã trả về từ hệ thống Core.Mã trả về từ hệ thống Core.  **Sample value**: 0.0 | 0, 1001 |
| `core_result_description` | STRING | Mô tả kết quả theo Core.Mô tả kết quả theo Core.  **Sample value**: Thành công | Thành công, Tài khoản không đủ tiền, Bạn không được hỗ trợ thực hiện thao tác này. Vui lòng chọn cách khác! |
| `extra_data` | STRING | JSON chứa chi tiết mã trả về từ đối tác EDC (approveCode, batchNumber, invoiceNo, cardNumber masked, ...).JSON chứa chi tiết mã trả về từ đối tác EDC (approveCode, batchNumber, invoiceNo, cardNumber masked, ...). | {"edcExtraTrans":{"partnerTransactionId":"20251119085557","serialNumber":"1495218815","cardScheme":"VISA","cardNumber":"454081******9342","approveCode":"339080","referenceNumber":"532301374826","batchNumber":"000059","cardPaymentMethod":"CLS","invoiceNo":"000681"}}, {"edcExtraTrans":{"partnerTransactionId":"20251109113259","serialNumber":null,"cardScheme":"VISA","cardNumber":"483931******4405","approveCode":"310596","referenceNumber":"531301538080","batchNumber":"000047","cardPaymentMethod":"CLS","invoiceNo":"003418"}}, {"edcExtraTrans":{"partnerTransactionId":"20251003094351","serialNumber":null,"cardScheme":"VISA","cardNumber":"454081******9616","approveCode":"733420","referenceNumber":"527601684690","batchNumber":"000013","cardPaymentMethod":"CLS","invoiceNo":"000604"}} |
| `cate` | STRING | Nhóm ngành hàng: 'FNB' (food-&-beverage), 'RT' (retail), ...Nhóm ngành hàng: 'FNB' (food-&-beverage), 'RT' (retail), ...  **Sample value**: FNB | FNB, RETAIL |
| `bu_name` | STRING | Tên business unit liên quan: 'BU_DLS' (đối tác nhỏ/lẻ).Tên business unit liên quan: 'BU_DLS' (đối tác nhỏ/lẻ).  **Sample value**: BU_DLS | BU_DLS |
| `service_code` | STRING | Mã service mapping dành cho EDC.Mã service mapping dành cho EDC.  **Sample value**: m4btopbrandopc_20621, m4bopceveryhalfcoffee, disburse_offlinecardpayment_bidv | m4bopceveryhalfcoffee, m4btopbrandopc_12045, m4btopbrandopc_10061 |
| `service_id` | STRING | ID service mapping (thường giống partner_code).ID service mapping (thường giống partner_code).  **Sample value**: MOMO2TLF20230322, MOMOARJJ20250408 | MOMO2TLF20230322, MOMO41BH20240226, MOMOSHYZ20240507 |
| `partner_tran_id` | STRING | Mã giao dịch do đối tác EDC phát sinh.Mã giao dịch do đối tác EDC phát sinh.  **Sample value**: 106975BONCHON2392729 | MOMOOZW520250903_529001040249, MOMOSHYZ20240507_528501306839, MOMOSHYZ20240507_528501296759 |
| `partner_trans_result` | STRING | Mã kết quả giao dịch từ phía đối tác (nếu có).Mã kết quả giao dịch từ phía đối tác (nếu có). | — |
| `bank_name` | STRING | Tên ngân hàng phát hành thẻ (nếu xác định được).Tên ngân hàng phát hành thẻ (nếu xác định được).  **Sample value**: Techcombank, Unknown, VIBank | Unknown, Techcombank, Vietcombank |
| `card_type` | STRING | Loại thẻ: VISA, MASTER, NAPAS, ...Loại thẻ: VISA, MASTER, NAPAS, ...  **Sample value**: MASTER, VISA, NAPAS, Unidentified | VISA, MASTER, NAPAS |
| `card_number` | STRING | Thẻ full đã ẩn (policy tag 'Card number' – sensitive).Thẻ full đã ẩn (policy tag 'Card number' – sensitive). | — |
| `card_payment_method` | STRING | Cách nhập thẻ: 'CLS' – Contactless.Cách nhập thẻ: 'CLS' – Contactless.  **Sample value**: CLS | CLS, C, Unidentified |
| `card_payment_method_desc` | STRING | Miêu tả phương thức thanh toán thẻ.Miêu tả phương thức thanh toán thẻ.  **Sample value**: Contactless | Contactless, Chip (Contact), Unidentified |
| `first_6_number` | STRING | 6 chữ số BIN đầu thẻ.6 chữ số BIN đầu thẻ.  **Sample value**: 531828, 452298, 970436 | 454083, 454081, 483931 |
| `last_4_number` | STRING | 4 chữ số cuối thẻ.4 chữ số cuối thẻ.  **Sample value**: 3523, 7203, 5013 | 3220, 1650, 7953 |
| `payment_card` | STRING | Thẻ quốc gia: 'VN' – thẻ nội địa, 'ABROAD' – thẻ quốc tế.Thẻ quốc gia: 'VN' – thẻ nội địa, 'ABROAD' – thẻ quốc tế.  **Sample value**: VN, ABROAD | ABROAD, VN |
| `data_37` | STRING | Trace number chuẩn ISO 8583 dùng cho đối soát.Trace number chuẩn ISO 8583 dùng cho đối soát.  **Sample value**: 000000797487615 | 000000797487615, 000000789547362, 000000882154418 |
| `data_38` | STRING | Authorization identification code – approve code.Authorization identification code – approve code.  **Sample value**: 02216218 | 08512098, 00748940, 03099867 |
| `data_40` | STRING | Reference number giao dịch tại switch EDC.Reference number giao dịch tại switch EDC.  **Sample value**: 530001727950 | 529001048266, 529601408150, 532401006805 |
| `data_41` | STRING | Flag đối soát EDC: 'Y'=đã đối soát, 'N'=chưa.Flag đối soát EDC: 'Y'=đã đối soát, 'N'=chưa.  **Sample value**: Y, N | Y, N |
