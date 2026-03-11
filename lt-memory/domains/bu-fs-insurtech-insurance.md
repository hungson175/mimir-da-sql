# BU FS: InsurTech - Insurance

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `800bf3e8-a8ba-45c3-90d8-5f54bdaba156`

## Description
Lưu trữ dữ liệu của FS_InsurTech với những sản phẩm tương ứng dưới đây:
1) Traffic Flow đổ vào InsurTech
2) Tất cả dữ liệu về giao dịch của Distribution.
3) Tất cả dữ liệu về giao dịch của Collection.
4) Tất cả dữ liệu về giao dịch+ funnel của Bảo Hiểm Y Tế.
5) Tất cả dữ liệu về First Source, Last Source và tổng số lượng đơn thành công tương ứng của mỗi sp, spdetail của Distribution - FS_InsurTech với điều kiện ngày vào First Source cũng là ngày ra đơn thành công.

## Tables

### `momovn-prod.BU_FI.INS_PUBLIC_HEALTH_FUNNEL`
> Lưu trữ thông tin users vào luồng (funnels) của sản phẩm Bảo Hiểm Y Tế - FS_InsurTech.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATE` | DATE | Ngày user vào luồng Bảo Hiểm Y Tế | — |
| `LOAD_INPUT` | STRING | User hiển thị màn hình 1: "Nhập Thông Tin" | — |
| `CLICK_CONTINUE_INPUT` | STRING | User bấm button "Tiếp Tục" trên màn hình 1 để Truy Vấn thông tin Bảo Hiểm Y Tế. | — |
| `LOAD_DETAIL` | STRING | User hiển thị màn hình 2: "Hiển thị Màn Hình Chi Tiết" | — |
| `CLICK_COUNTINUE_DETAIL` | STRING | User bấm button "Tiếp Tục" trên màn hình 2 để xác minh thông tin và tới màn hình "Xác Nhận Thanh Toán" | — |
| `LOAD_CONFIRM` | STRING | User hiển thị màn hình 3: "Hiển thị Màn Hình Xác Nhận Thanh Toán" | — |
| `CLICK_CONFIRM` | STRING | User bấm button "Tiếp Tục" trên màn hình 3 để xác nhận thanh toán Bảo Hiểm Y Tế. | — |
| `TRANSACTION_USERS` | FLOAT | User thanh toán thành công (data BE) | — |
| `ID` | INT | Mã giao dịch thanh toán thành công (data BE) | — |
| `SOURCE` | STRING | Traffic source (Màn Hình LIỀN KỀ Trước khi vào luồng) | — |

### `momovn-prod.BU_FI.INS_COL_ALL_TRANS`
> Bảng lưu trữ thông tin các giao dịch của sản phẩm Thu Hộ Bảo Hiểm - Collection - của FS_InsurTech.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ID` | INT | TID của giao dịch thu hộ Bảo Hiểm | — |
| `FUNDID` | FLOAT | Nguồn tiền thanh toán thu hộ Bảo Hiểm | — |
| `SERVICE_CODE` | STRING | Mã dịch vụ thu hộ Bảo Hiểm | — |
| `USER_PAYMENT` | FLOAT | ID của người thanh toán thu hộ Bảo Hiểm | — |
| `DEBITOR` | STRING | ID của người chuyển tiền thu hộ Bảo Hiểm | — |
| `CREDITOR` | STRING | ID của người nhận tiền thu hộ Bảo Hiểm | — |
| `INITIATOR` | STRING | Người khởi tạo giao dịch thu hộ Bảo Hiểm | — |
| `TRANS_TYPE` | STRING | Kiểu giao dịch thu hộ Bảo Hiểm | — |
| `EWALLET_TYPEID` | INT | Ngăn ví | — |
| `STATUSID` | INT | Trạng thái giao dịch thu hộ Bảo Hiểm: 2: Thành Công 6: Thất bại | — |
| `AMOUNT` | FLOAT | Số tiền giao dịch thu hộ Bảo Hiểm | — |
| `PARENTID` | FLOAT | PARENTID của giao dịch thu hộ Bảo Hiểm | — |
| `AGENT_CREDIT` | FLOAT | Tài khoản nhận tiền thu hộ Bảo Hiểm | — |
| `AGENT_DEBIT` | FLOAT | Tài khoản chi tiền của thu hộ Bảo Hiểm | — |
| `RESULT` | FLOAT | Kết quả của giao dịch thu hộ Bảo Hiểm 0 = Thành Công Còn lại là các mã lỗi tương ứng | — |
| `TOTAL_AMOUNT` | FLOAT | TOTAL_AMOUNT: tổng tiền thanh toán thu hộ Bảo Hiểm = MM_AMOUNT+VC_AMOUNT | — |
| `MM_AMOUNT` | FLOAT | Tiền thực tế user bị trừ sau khi áp voucher (ví dụ: tiền cần thanh toán là 100.000 nhưng user có vc giảm 10.000 thì số tền thực tế user bị trừ là 90.000 và đây chính là MM_AMOUNT của thu hộ Bảo Hiểm | — |
| `VC_AMOUNT` | FLOAT | Số tiền user được giảm khi khi áp voucher (ví dụ: tiền cần thanh toán là 100.000 nhưng user có vc giảm 10.000 thì số tền thực tế user bị trừ là 90.000, vậy 10.000 chính là VC_AMOUNT của thu hộ Bảo Hiểm | — |
| `FEE` | FLOAT | Phí của giao dịch của thu hộ Bảo Hiểm | — |
| `SERVICE_GROUP` | FLOAT | Nhóm dịch vụ của giao dịch. | — |
| `USER_TYPE_NAME` | STRING | Tên loại người dùng thực hiện giao dịch thu hộ Bảo Hiểm. | — |
| `TRANS_DATE` | DATE | Ngày thực hiện giao dịch thu hộ Bảo Hiểm | — |
| `BU_GROUP_CODE_L3` | STRING | Phân loại nhóm thu hộ Bảo Hiểm: LIFE = NHÂN THỌ NON-LIFE = PHI NHÂN THỌ AGENCY | — |
| `BU_GROUP_CODE_L4` | STRING | — | — |
| `BU_NAME` | STRING | Tên BU của sản phẩm (ví dụ: Insurtech là BU-FS) | — |
| `MERCHANT` | STRING | Tên của merchant thu hộ Bảo Hiểm (các partner bán bảo hiểm), ví dụ: Liberty, Bảo Việt, PTI,... | — |
| `SERVICE_DESCRIPTION` | STRING | Mô tả dịch vụ. Ví Dụ: Thanh Toán phí bảo hiểm của merchant nào đó.... | — |
| `BILLID` | STRING | Mã Hợp Đồng Bảo Hiểm được Thu Hộ | — |
| `TYPEID` | ARRAY | ID của thẻ quà/voucher. Nếu null sẽ là organic transaction. | — |
| `ERROR_NAME` | STRING | Định nghĩa các mã lỗi giao dịch thu hộ Bảo Hiểm | — |
| `ERROR_NAME_DETAIL` | STRING | Chi tiết lỗi của giao dịch thu hộ Bảo Hiểm (nếu có). | — |
| `SERVICEID` | STRING | ID dịch vụ của giao dịch thu hộ Bảo Hiểm. | — |
| `TRANS_TIME` | TIME | Timestamp thực hiện giao dịch thu hộ Bảo Hiểm. | — |
| `MONEY_SOURCE` | STRING | Định nghĩa các nguồn tiền sử dụng khi thanh toán thu hộ Bảo Hiểm | — |
| `TYPE` | STRING | — | — |
| `TRANS_HOUR` | INT | Giờ thực hiện giao dịch  thu hộ Bảo Hiểm | — |
| `PAYMENT_CHANNEL` | STRING | Kênh user sử dụng để thanh toán dịch vụ  thu hộ Bảo Hiểm (ví dụ: webapp/QR/app MoMo, ...) | — |
| `CB_AMOUNT` | FLOAT | Tiền cashback của user sau khi thanh toán dịch vụ thu hộ Bảo Hiểm | — |
| `BILL_AMOUNT` | FLOAT | Tiền thanh toán trên Hợp đồng thu hộ Bảo Hiểm | — |
| `BILL_DUE` | DATE | Ngày tới hạn thanh toán trên Hợp đồng dịch vụ thu hộ Bảo Hiểm | — |
| `D_DIFF` | INT | Số ngày so với ngày hết hạn. > 0 : Qúa hạn : Overdue < 0: Trước hạn : Pre-due | — |
| `REPAY_TYPE` | STRING | Overdue : Qúa Hạn Pre_due: Trước Hạn | — |
| `FINAL_REV` | FLOAT | Revenue của giao dịch thu hộ Bảo Hiểm | — |
| `CC_STATUS` | STRING | Định nghĩa status của giao dịch thu hộ Bảo Hiểm: thành công/thất bại | — |
| `TRANS_MONTH` | DATE | Tháng thực hiện thanh toán thu hộ Bảo Hiểm | — |

### `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
> Bảng chứa các trường thông tin liên quan tới tất cả các transactions của sản phẩm kênh bán sản phẩm - Distribution - của FS_InsurTech.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ID` | INT | ID của giao dịch mua bảo hiểm. | — |
| `TRANS_DATE` | DATE | Ngày thực hiện giao dịch mua bảo hiểm | — |
| `CREATE_DATE` | DATE | Ngày tạo giao dịch | — |
| `TRANS_TIME` | INT | Giờ thực hiện giao dịch mua bảo hiểm | — |
| `SERVICE_CODE` | STRING | service_code của sản phẩm bán bảo hiểm | — |
| `SERVICEID` | STRING | serviceid của sản phẩm bán bảo hiểm | — |
| `MERCHANT` | STRING | Tên của merchant (các partner bán bảo hiểm), ví dụ: Liberty, Bảo Việt, PTI,... | — |
| `DEBITOR` | STRING | — | — |
| `USER_PAYMENT` | FLOAT | ID của người thanh toán giao dịch với Sản Phẩm Tương Ứng | — |
| `TRANS_TYPE` | STRING | — | — |
| `SP` | STRING | Phân loại sản phẩm bảo hiểm - Chi tiết hơn sẽ ở SP_DETAIL: Vehicle Ins: Bảo Hiểm Phương Tiện (Xe Máy, Xe Hơi) Travel Ins: Bảo Hiểm Du Lịch Property Ins: Bảo Hiểm Tài Sản (Nhà Tư Nhân) Health Ins: Bảo Hiểm Sức Khỏe (Bảo Hiểm Tai Nạn Cá Nhân) Cyber Ins: Bảo Hiểm An Toàn Ví | — |
| `SP_DETAIL` | STRING | Phân loại SP (sản phẩm) chi tiết: 1) (Renewal) Motor Ins: (Tái Tục) Bảo Hiểm Xe Máy Bắt Buộc 2) Voluntary Motor: Bảo Hiểm Xe Máy Tự Nguyện 3) (Renewal) Voluntary Car:  (Tái Tục) Bảo Hiểm Vật Chất Xe Ô Tô = (Tái Tục) Bảo Hiểm Thân Vỏ Ô Tô 4) (Renewal) Compulsory Car: (Tái Tục) Bảo Hiểm Ô Tô Trách Nhiệm Dân Sự = Tái Tục) Bảo Hiểm Ô Tô Bắt Buộc 5) (Renewal) Cyber Ins: (Tái Tục) Bảo Hiểm An Toàn Ví 6) (Renewal) Cyber Plus: (Tái Tục) Bảo Hiểm An Toàn Ví Cộng dành cho tệp Túi Thần Tài + trên MoMo 7) Personal Accident Ins: Bảo Hiểm Tai Nạn Cá Nhân 8) Travel Easy (Standalone/Bundle): Bảo Hiểm Du Lịch (Mua rời = Standalone/Bán đính kèm = Bundle) 9) Flight Easy (Standalone/Bundle): Bảo Hiểm Trễ Chuyến Bay (Mua rời = Standalone/Bán đính kèm = Bundle) 10) Flight Easy_Claim: Thu/Chi Hộ cho Bảo Hiểm Trễ Chuyến Bay 11) International Travel Ins: Bảo Hiểm Du Lịch Toàn Diện 12) Passenger Insurance:  Bảo Hiểm Hành Khách - khi di chuyển/du lịch bằng xe khách 13) Homecare Ins: Bảo Hiểm Nhà Tư Nhân 14) Payment Gateway: Cổng Thanh Toán Payment Gateway | — |
| `TYPEID` | STRING | ID của thẻ quà/voucher. Nếu null sẽ là organic transaction. | — |
| `CAMPAIGN` | STRING | — | — |
| `FINAL_REV` | FLOAT | Lợi nhuận cuối cùng tính trên 1 giao dịch mua bảo hiểm | — |
| `CC_STATUS` | STRING | Trạng thái giao dịch: Thành Công/Thất Bại | — |
| `STATUS` | STRING | — | — |
| `AMOUNT` | FLOAT | Amount của giao dịch mua bảo hiểm | — |
| `VC_AMOUNT` | FLOAT | Amount nhận được từ voucher của giao dịch mua bảo hiểm | — |
| `CB_AMOUNT` | FLOAT | Amount nhận được từ cashback của giao dịch mua bảo hiểm | — |
| `DD_AMOUNT` | FLOAT | Direct discount: amount discount được trừ trực tiếp tại màn hình TTAT của giao dịch mua bảo hiểm | — |
| `REV_AFTER_SHARING` | FLOAT | Revenue cuối cùng sau khi chia cho các bên của giao dịch mua bảo hiểm | — |
| `TRANS_DATETIME` | DATETIME | Thời gian ngày giờ cụ thể của giao dịch mua bảo hiểm | — |

### `momovn-prod.BU_FI.INS_TRAFFIC_FLOW`
> <p>Bảng chứa thông tin traffic flow đổ vào các sản phẩm của InsurTech</p>

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date_event` | DATE | <p>Date vào luồng</p> | — |
| `datetime_event` | DATETIME | <p>Datetime vào luồng</p> | — |
| `user` | STRING | <p>ID của user</p> | — |
| `name` | STRING | <p>Name ở đây là tên của Banner/Noti tương ứng. Nếu là Previous Screen: màn hình trước đó thì null.</p> | — |
| `momo_session_id_v2` | STRING | <p>ID của lượt traffic</p> | — |
| `event_id` | STRING | <p>ID của event.</p> | — |
| `source` | STRING | <p>Định nghĩa là traffic flow - nơi trước đó để đến luồng sản phẩm sản phẩm service</p> | — |
| `service` | STRING | <p>Là nơi đến - tên dịch vụ được đổ từ các source trước đó</p> | — |
| `service_name` | STRING | <p>serviceid của các dịch vụ</p> | — |
| `merchant` | STRING | <p>merchant các dịch vụ tương ứng</p> | — |
| `traffic` | STRING | <p>Phương Thức bắt Traffic:<br>1) Previous Screen<br>2) Banner<br>3) Notification</p> | — |

### `momovn-prod.BU_FI.INS_PUBLIC_HEALTH`
> Bảng lưu trữ thông tin các giao dịch của sản phẩm BẢO HIỂM Y TẾ của FS_InsurTech.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `TRANS_DATE` | DATE | Ngày giao dịch Bảo Hiểm Y Tế | — |
| `TRANS_DATETIME` | TIMESTAMP | Ngày giờ giao dịch Bảo Hiểm Y Tế | — |
| `ID` | INT | ID giao dịch Bảo Hiểm Y Tế | — |
| `PARENTID` | FLOAT | PARENTID giao dịch Bảo Hiểm Y Tế | — |
| `USER_PAYMENT` | FLOAT | ID của người thực hiện giao dịch Bảo Hiểm Y Tế | — |
| `BILLID` | STRING | ID của bill thanh toán = Mã Bảo Hiểm Y Tế = Mã Bảo Hiểm Xã Hội | — |
| `AMOUNT` | FLOAT | Amount của giao dịch Bảo Hiểm Y Tế | — |
| `TOTAL_AMOUNT` | FLOAT | Tổng Amount của giao dịch Bảo Hiểm Y Tế | — |
| `MM_AMOUNT` | FLOAT | MoMo Amount của giao dịch Bảo Hiểm Y Tế | — |
| `VC_AMOUNT` | FLOAT | Voucher Amount của giao dịch Bảo Hiểm Y Tế | — |
| `CB_AMOUNT` | FLOAT | Cashback Amount của giao dịch Bảo Hiểm Y Tế | — |
| `BILL_AMOUNT` | FLOAT | Amount của bill Bảo Hiểm Y Tế | — |
| `FEE` | FLOAT | Phí của giao dịch Bảo Hiểm Y Tế | — |
| `TRANS_TYPE` | STRING | Hình thức giao dịch Bảo Hiểm Y Tế | — |
| `MONEY_SOURCE` | STRING | Nguồn tiền thanh toán Bảo Hiểm Y Tế :=   1 = Ví MoMo  2 = Ngân Hàng Liên Kết  3 = Thẻ Napas  4 = Thẻ Visa Debit  5 = Thẻ Visa Credit  6 = Túi Thần Tài  7 = Ví Trả Sau  8 = Cashback  9 = CCM 10 = BNPL  11 = Newton  12 = Direct Debit  13 = Qũy Nhóm  14 = Virtual Account Collection | — |
| `TYPEID` | ARRAY | ID của thẻ quà/voucher.  Nếu null sẽ là organic transaction. | — |
| `SERVICEID` | STRING | ID của service | — |
| `SERVICE_CODE` | STRING | Mã của service | — |
| `SERVICE_GROUP` | FLOAT | Nhóm dịch vụ | — |
| `STATUSID` | INT | Trạng thái của giao dịch Bảo Hiểm Y Tế :=  2 = Thành Công 6 = Thất Bại | — |
| `ERROR_NAME` | STRING | Mã Lỗi Bảo Hiểm Y Tế (nếu thất bại hay statusid = 6) | — |
| `ERROR_NAME_DETAIL` | STRING | Mã Lỗi Chi Tiết Bảo Hiểm Y Tế (nếu thất bại hay statusid = 6) | — |
| `REPAY_TYPE` | STRING | — | — |
| `TID` | FLOAT | ID của giao dịch Bảo Hiểm Y Tế | — |
| `RESULT` | STRING | Mã Lỗi Bảo Hiểm Y Tế trên bảng V5 | — |
| `PARTNER_TRAN_ID` | STRING | ID giao dịch đối tác Bảo Hiểm Y Tế | — |
| `REFERENCE_1` | STRING | Mã Bảo Hiểm Y Tế / Bảo Hiểm Xã Hội (V5) | — |
| `PRODUCT_NAME` | STRING | Loại(Term) Bảo Hiểm Y Tế :=  BHYTHGD_3M : Bảo Hiểm Y Tế Hộ Gia Đình (3 Tháng) BHYTHGD_6M : Bảo Hiểm Y Tế Hộ Gia Đình (6 Tháng) BHYTHGD_12M := Bảo Hiểm Y Tế Hộ Gia Đình (12 Tháng) | — |
| `POLICY_OWNER_NAME` | STRING | Tên của người thừa hưởng bảo hiểm / người đứng tên mã bảo hiểm | — |
| `POLICY_DYNAMIC_PRICING` | STRING | Phương Thức Mua Bảo Hiểm Y Tế: Tái Tục Mua Mới | — |
| `POLICY_TOTAL_DISCOUNT` | STRING | — | — |
| `POLICY_OWNER_ADDRESS` | STRING | Vùng - Thành Phố theo Người thừa hưởng Bảo Hiểm Y Tế / chủ mã Bảo Hiểm Y Tế | — |
| `REVENUE` | FLOAT | Doanh Thu Bảo Hiểm Y Tế | — |
| `USER_PAYMENT_NAME` | STRING | Tên người thực hiện giao dịch Bảo Hiểm Y Tế | — |
| `PROXY_PURCHASE` | INT | Flag về việc mua chéo Bảo Hiểm Y Tế - mua hộ hay không. 1 = mua hộ 0 = mua cho chính bản thân | — |
| `IS_RENEWAL` | INT | Flag về việc luồng tái tục Bảo Hiểm Y Tế hay không 1 = Tái Tục 0 = Không | — |
| `RENEWAL_STATUS` | STRING | Trạng thái tái tục Bảo Hiểm Y Tế (nếu có) :  1) Tái tục đúng hạn 2) Tái tục quá 90 ngày 3) Rớt dữ liệu | — |
| `IS_REFUND` | INT | Cắm cờ về việc giao dịch Bảo Hiểm Y Tế này đã bị refund (hoàn trả) lại cho người thực hiện giao dịch 1 =  Đã refund(hoàn trả) 0 = Không bị refund | — |
| `REFUND_ID` | FLOAT | ID của giao dịch refund(hoàn trả) Bảo Hiểm Y Tế | — |
| `REFUND_DATETIME` | DATETIME | Ngày giờ refund(hoàn trả) Bảo Hiểm Y Tế | — |

## Memory
*3 entries — user-trained knowledge*

1. CC_STATUS = 'CANCEL' : Hủy/Thất Bại _FS InsurTech · 2025-07-25_
2. Bảo Hiểm Xe Máy Bắt Buộc: SP_DETAIL = 'Motor Ins' _FS InsurTech · 2025-07-25_
3. CC_STATUS = 'SUCCESS' : Thành Công _FS InsurTech · 2025-07-25_
