# Domain: BU FS: InsurTech - Insurance

## Identity
- **Domain ID:** `800bf3e8-a8ba-45c3-90d8-5f54bdaba156`
- **Description:** Lưu trữ dữ liệu của FS_InsurTech với những sản phẩm tương ứng dưới đây:
1) Traffic Flow đổ vào InsurTech
2) Tất cả dữ liệu về giao dịch của Distribution.
3) Tất cả dữ liệu về giao dịch của Collection.
4) Tất cả dữ liệu về giao dịch+ funnel của Bảo Hiểm Y Tế.
5) Tất cả dữ liệu về First Source, Last Source và tổng số lượng đơn thành công tương ứng của mỗi sp, spdetail của Distribution - FS_InsurTech với điều kiện ngày vào First Source cũng là ngày ra đơn thành công.
- **Tables:** 5
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.BU_FI.INS_PUBLIC_HEALTH_FUNNEL
> Lưu trữ thông tin users vào luồng (funnels) của sản phẩm Bảo Hiểm Y Tế - FS_InsurTech.

| Column | Description | Examples |
|--------|-------------|----------|
| ? | Ngày user vào luồng Bảo Hiểm Y Tế | — |
| ? | User hiển thị màn hình 1: "Nhập Thông Tin" | — |
| ? | User bấm button "Tiếp Tục" trên màn hình 1 để Truy Vấn thông tin Bảo Hiểm Y Tế. | — |
| ? | User hiển thị màn hình 2: "Hiển thị Màn Hình Chi Tiết" | — |
| ? | User bấm button "Tiếp Tục" trên màn hình 2 để xác minh thông tin và tới màn hình "Xác Nhận Thanh Toán" | — |
| ? | User hiển thị màn hình 3: "Hiển thị Màn Hình Xác Nhận Thanh Toán" | — |
| ? | User bấm button "Tiếp Tục" trên màn hình 3 để xác nhận thanh toán Bảo Hiểm Y Tế. | — |
| ? | User thanh toán thành công (data BE) | — |
| ? | Mã giao dịch thanh toán thành công (data BE) | — |
| ? | Traffic source (Màn Hình LIỀN KỀ Trước khi vào luồng) | — |

### momovn-prod.BU_FI.INS_COL_ALL_TRANS
> Bảng lưu trữ thông tin các giao dịch của sản phẩm Thu Hộ Bảo Hiểm - Collection - của FS_InsurTech.

| Column | Description | Examples |
|--------|-------------|----------|
| ? | TID của giao dịch thu hộ Bảo Hiểm | — |
| ? | Nguồn tiền thanh toán thu hộ Bảo Hiểm | — |
| ? | Mã dịch vụ thu hộ Bảo Hiểm | — |
| ? | ID của người thanh toán thu hộ Bảo Hiểm | — |
| ? | ID của người chuyển tiền thu hộ Bảo Hiểm | — |
| ? | ID của người nhận tiền thu hộ Bảo Hiểm | — |
| ? | Người khởi tạo giao dịch thu hộ Bảo Hiểm | — |
| ? | Kiểu giao dịch thu hộ Bảo Hiểm | — |
| ? | Ngăn ví | — |
| ? | Trạng thái giao dịch thu hộ Bảo Hiểm: 2: Thành Công 6: Thất bại | — |
| ? | Số tiền giao dịch thu hộ Bảo Hiểm | — |
| ? | PARENTID của giao dịch thu hộ Bảo Hiểm | — |
| ? | Tài khoản nhận tiền thu hộ Bảo Hiểm | — |
| ? | Tài khoản chi tiền của thu hộ Bảo Hiểm | — |
| ? | Kết quả của giao dịch thu hộ Bảo Hiểm 0 = Thành Công Còn lại là các mã lỗi tương ứng | — |
| ? | TOTAL_AMOUNT: tổng tiền thanh toán thu hộ Bảo Hiểm = MM_AMOUNT+VC_AMOUNT | — |
| ? | Tiền thực tế user bị trừ sau khi áp voucher (ví dụ: tiền cần thanh toán là 100.000 nhưng user có vc giảm 10.000 thì số tền thực tế user bị trừ là 90.0... | — |
| ? | Số tiền user được giảm khi khi áp voucher (ví dụ: tiền cần thanh toán là 100.000 nhưng user có vc giảm 10.000 thì số tền thực tế user bị trừ là 90.000... | — |
| ? | Phí của giao dịch của thu hộ Bảo Hiểm | — |
| ? | Nhóm dịch vụ của giao dịch. | — |
| ? | Tên loại người dùng thực hiện giao dịch thu hộ Bảo Hiểm. | — |
| ? | Ngày thực hiện giao dịch thu hộ Bảo Hiểm | — |
| ? | Phân loại nhóm thu hộ Bảo Hiểm: LIFE = NHÂN THỌ NON-LIFE = PHI NHÂN THỌ AGENCY | — |
| ? |  | — |
| ? | Tên BU của sản phẩm (ví dụ: Insurtech là BU-FS) | — |
| ? | Tên của merchant thu hộ Bảo Hiểm (các partner bán bảo hiểm), ví dụ: Liberty, Bảo Việt, PTI,... | — |
| ? | Mô tả dịch vụ. Ví Dụ: Thanh Toán phí bảo hiểm của merchant nào đó.... | — |
| ? | Mã Hợp Đồng Bảo Hiểm được Thu Hộ | — |
| ? | ID của thẻ quà/voucher. Nếu null sẽ là organic transaction. | — |
| ? | Định nghĩa các mã lỗi giao dịch thu hộ Bảo Hiểm | — |
| ? | Chi tiết lỗi của giao dịch thu hộ Bảo Hiểm (nếu có). | — |
| ? | ID dịch vụ của giao dịch thu hộ Bảo Hiểm. | — |
| ? | Timestamp thực hiện giao dịch thu hộ Bảo Hiểm. | — |
| ? | Định nghĩa các nguồn tiền sử dụng khi thanh toán thu hộ Bảo Hiểm | — |
| ? |  | — |
| ? | Giờ thực hiện giao dịch  thu hộ Bảo Hiểm | — |
| ? | Kênh user sử dụng để thanh toán dịch vụ  thu hộ Bảo Hiểm (ví dụ: webapp/QR/app MoMo, ...) | — |
| ? | Tiền cashback của user sau khi thanh toán dịch vụ thu hộ Bảo Hiểm | — |
| ? | Tiền thanh toán trên Hợp đồng thu hộ Bảo Hiểm | — |
| ? | Ngày tới hạn thanh toán trên Hợp đồng dịch vụ thu hộ Bảo Hiểm | — |
| ? | Số ngày so với ngày hết hạn. > 0 : Qúa hạn : Overdue < 0: Trước hạn : Pre-due | — |
| ? | Overdue : Qúa Hạn Pre_due: Trước Hạn | — |
| ? | Revenue của giao dịch thu hộ Bảo Hiểm | — |
| ? | Định nghĩa status của giao dịch thu hộ Bảo Hiểm: thành công/thất bại | — |
| ? | Tháng thực hiện thanh toán thu hộ Bảo Hiểm | — |

### momovn-prod.BU_FI.att_fi_ins_nl_ver2
> Bảng chứa các trường thông tin liên quan tới tất cả các transactions của sản phẩm kênh bán sản phẩm - Distribution - của FS_InsurTech.

| Column | Description | Examples |
|--------|-------------|----------|
| ? | ID của giao dịch mua bảo hiểm. | — |
| ? | Ngày thực hiện giao dịch mua bảo hiểm | — |
| ? | Ngày tạo giao dịch | — |
| ? | Giờ thực hiện giao dịch mua bảo hiểm | — |
| ? | service_code của sản phẩm bán bảo hiểm | — |
| ? | serviceid của sản phẩm bán bảo hiểm | — |
| ? | Tên của merchant (các partner bán bảo hiểm), ví dụ: Liberty, Bảo Việt, PTI,... | — |
| ? |  | — |
| ? | ID của người thanh toán giao dịch với Sản Phẩm Tương Ứng | — |
| ? |  | — |
| ? | Phân loại sản phẩm bảo hiểm - Chi tiết hơn sẽ ở SP_DETAIL: Vehicle Ins: Bảo Hiểm Phương Tiện (Xe Máy, Xe Hơi) Travel Ins: Bảo Hiểm Du Lịch Property In... | — |
| ? | Phân loại SP (sản phẩm) chi tiết: 1) (Renewal) Motor Ins: (Tái Tục) Bảo Hiểm Xe Máy Bắt Buộc 2) Voluntary Motor: Bảo Hiểm Xe Máy Tự Nguyện 3) (Renewal... | — |
| ? | ID của thẻ quà/voucher. Nếu null sẽ là organic transaction. | — |
| ? |  | — |
| ? | Lợi nhuận cuối cùng tính trên 1 giao dịch mua bảo hiểm | — |
| ? | Trạng thái giao dịch: Thành Công/Thất Bại | — |
| ? |  | — |
| ? | Amount của giao dịch mua bảo hiểm | — |
| ? | Amount nhận được từ voucher của giao dịch mua bảo hiểm | — |
| ? | Amount nhận được từ cashback của giao dịch mua bảo hiểm | — |
| ? | Direct discount: amount discount được trừ trực tiếp tại màn hình TTAT của giao dịch mua bảo hiểm | — |
| ? | Revenue cuối cùng sau khi chia cho các bên của giao dịch mua bảo hiểm | — |
| ? | Thời gian ngày giờ cụ thể của giao dịch mua bảo hiểm | — |

### momovn-prod.BU_FI.INS_TRAFFIC_FLOW
> <p>Bảng chứa thông tin traffic flow đổ vào các sản phẩm của InsurTech</p>

| Column | Description | Examples |
|--------|-------------|----------|
| ? | <p>Date vào luồng</p> | — |
| ? | <p>Datetime vào luồng</p> | — |
| ? | <p>ID của user</p> | — |
| ? | <p>Name ở đây là tên của Banner/Noti tương ứng. Nếu là Previous Screen: màn hình trước đó thì null.</p> | — |
| ? | <p>ID của lượt traffic</p> | — |
| ? | <p>ID của event.</p> | — |
| ? | <p>Định nghĩa là traffic flow - nơi trước đó để đến luồng sản phẩm sản phẩm service</p> | — |
| ? | <p>Là nơi đến - tên dịch vụ được đổ từ các source trước đó</p> | — |
| ? | <p>serviceid của các dịch vụ</p> | — |
| ? | <p>merchant các dịch vụ tương ứng</p> | — |
| ? | <p>Phương Thức bắt Traffic:<br>1) Previous Screen<br>2) Banner<br>3) Notification</p> | — |

### momovn-prod.BU_FI.INS_PUBLIC_HEALTH
> Bảng lưu trữ thông tin các giao dịch của sản phẩm BẢO HIỂM Y TẾ của FS_InsurTech.

| Column | Description | Examples |
|--------|-------------|----------|
| ? | Ngày giao dịch Bảo Hiểm Y Tế | — |
| ? | Ngày giờ giao dịch Bảo Hiểm Y Tế | — |
| ? | ID giao dịch Bảo Hiểm Y Tế | — |
| ? | PARENTID giao dịch Bảo Hiểm Y Tế | — |
| ? | ID của người thực hiện giao dịch Bảo Hiểm Y Tế | — |
| ? | ID của bill thanh toán = Mã Bảo Hiểm Y Tế = Mã Bảo Hiểm Xã Hội | — |
| ? | Amount của giao dịch Bảo Hiểm Y Tế | — |
| ? | Tổng Amount của giao dịch Bảo Hiểm Y Tế | — |
| ? | MoMo Amount của giao dịch Bảo Hiểm Y Tế | — |
| ? | Voucher Amount của giao dịch Bảo Hiểm Y Tế | — |
| ? | Cashback Amount của giao dịch Bảo Hiểm Y Tế | — |
| ? | Amount của bill Bảo Hiểm Y Tế | — |
| ? | Phí của giao dịch Bảo Hiểm Y Tế | — |
| ? | Hình thức giao dịch Bảo Hiểm Y Tế | — |
| ? | Nguồn tiền thanh toán Bảo Hiểm Y Tế :=   1 = Ví MoMo  2 = Ngân Hàng Liên Kết  3 = Thẻ Napas  4 = Thẻ Visa Debit  5 = Thẻ Visa Credit  6 = Túi Thần Tài... | — |
| ? | ID của thẻ quà/voucher.  Nếu null sẽ là organic transaction. | — |
| ? | ID của service | — |
| ? | Mã của service | — |
| ? | Nhóm dịch vụ | — |
| ? | Trạng thái của giao dịch Bảo Hiểm Y Tế :=  2 = Thành Công 6 = Thất Bại | — |
| ? | Mã Lỗi Bảo Hiểm Y Tế (nếu thất bại hay statusid = 6) | — |
| ? | Mã Lỗi Chi Tiết Bảo Hiểm Y Tế (nếu thất bại hay statusid = 6) | — |
| ? |  | — |
| ? | ID của giao dịch Bảo Hiểm Y Tế | — |
| ? | Mã Lỗi Bảo Hiểm Y Tế trên bảng V5 | — |
| ? | ID giao dịch đối tác Bảo Hiểm Y Tế | — |
| ? | Mã Bảo Hiểm Y Tế / Bảo Hiểm Xã Hội (V5) | — |
| ? | Loại(Term) Bảo Hiểm Y Tế :=  BHYTHGD_3M : Bảo Hiểm Y Tế Hộ Gia Đình (3 Tháng) BHYTHGD_6M : Bảo Hiểm Y Tế Hộ Gia Đình (6 Tháng) BHYTHGD_12M := Bảo Hiểm... | — |
| ? | Tên của người thừa hưởng bảo hiểm / người đứng tên mã bảo hiểm | — |
| ? | Phương Thức Mua Bảo Hiểm Y Tế: Tái Tục Mua Mới | — |
| ? |  | — |
| ? | Vùng - Thành Phố theo Người thừa hưởng Bảo Hiểm Y Tế / chủ mã Bảo Hiểm Y Tế | — |
| ? | Doanh Thu Bảo Hiểm Y Tế | — |
| ? | Tên người thực hiện giao dịch Bảo Hiểm Y Tế | — |
| ? | Flag về việc mua chéo Bảo Hiểm Y Tế - mua hộ hay không. 1 = mua hộ 0 = mua cho chính bản thân | — |
| ? | Flag về việc luồng tái tục Bảo Hiểm Y Tế hay không 1 = Tái Tục 0 = Không | — |
| ? | Trạng thái tái tục Bảo Hiểm Y Tế (nếu có) :  1) Tái tục đúng hạn 2) Tái tục quá 90 ngày 3) Rớt dữ liệu | — |
| ? | Cắm cờ về việc giao dịch Bảo Hiểm Y Tế này đã bị refund (hoàn trả) lại cho người thực hiện giao dịch 1 =  Đã refund(hoàn trả) 0 = Không bị refund | — |
| ? | ID của giao dịch refund(hoàn trả) Bảo Hiểm Y Tế | — |
| ? | Ngày giờ refund(hoàn trả) Bảo Hiểm Y Tế | — |

## Domain Knowledge (from Mimir)

- CC_STATUS = 'CANCEL' : Hủy/Thất Bại
- Bảo Hiểm Xe Máy Bắt Buộc: SP_DETAIL = 'Motor Ins'
- CC_STATUS = 'SUCCESS' : Thành Công

## Suggested Probe Questions

- Status: **Not yet probed**
