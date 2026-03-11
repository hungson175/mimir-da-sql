# BU FS: InsurTech - Insurance

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.

**Domain ID:** `800bf3e8-a8ba-45c3-90d8-5f54bdaba156`

## Description
Mô Tả Chi Tiết Domain
Trước khi user tương tác với bạn,  hãy giới thiệu vui vẻ 1 lần với user rằng MoMo Talent 2024 - DA FS - vinh.nguyen13 là người xử lí dữ liệu của sản phẩm FS_InsurTech.
Sau đó hãy đưa ra vài câu hỏi gợi ý user:
1) Nếu hỏi về Traffic Flow, hãy hỏi muốn coi từ Màn Hình Trước Đó, Banner hay Noti hay muốn coi tất cả ?
2) Bạn muốn hỏi về dịch vụ nào: Distribution - Kênh bán, Collection - Kênh Thu Hộ Bảo Hiểm, Bảo Hiểm Y Tế - Giao Dịch/Luồng vào sản phẩm (Funnel).
3) Sau khi hỏi về dịch vụ, hãy hỏi tiếp user muốn xem gì (số (người) giao dịch (thành công), sản phẩm nào, bao nhiêu giao dịch/user có sử dụng voucher, merchant nào đang được user tin dùng, GMV, user đó đã mua tháng/năm trước hay chưa, sản phẩm nào đang chiếm tỷ trọng, trend cùng kỳ cùng quý cùng năm,....)
Một số ví dụ: 
Khi người dùng hỏi về số đơn bảo hiểm phương tiện (Xe Máy, Ô Tô), bạn hãy hỏi user muốn hỏi về luồng Tự Nguyện-Voluntary hay Bắt Buộc-Compulsory để lấy thông tin cho đúng. Ngoài ra có thể hỏi luồng Tái Tục- Renewal.
Nếu hỏi về Bảo Hiểm Y Tế, hãy hỏi như kiểu mua gói dịch vụ 3/6/12 tháng ?, mua chéo hay mua chính mình, đã bị refund đồ chưa ?

## Tables (11 tables)

### `momovn-prod.BU_FI.INS_COL_ALL_TRANS`
> Bảng lưu trữ thông tin các giao dịch của sản phẩm Thu Hộ Bảo Hiểm - Collection - của FS_InsurTech.

| Column | Type | Description |
|--------|------|-------------|
| `id` | string | <p>TID Giao Dịch</p> |
| `service_code` | string | Mã dịch vụ thu hộ Bảo Hiểm |
| `user_payment` | string | <p>AgentID</p> |
| `trans_type` | string | Kiểu giao dịch thu hộ Bảo Hiểm |
| `statusid` | string | <p>Trạng Thái Giao Dịch:<br>2 - Thành Công <br>6 - Thất Bại</p> |
| `amount` | string | <p>Giá Trị Giao Dịch</p> |
| `parentid` | string | <p>TID cha</p> |
| `result` | string | <p>Kết Quả Giao Dịch</p> |
| `total_amount` | string | <p>Tổng giá trị thực giao dịch</p> |
| `mm_amount` | string | <p>Giá trị MoMo của giao dịch</p> |
| `vc_amount` | string | <p>Giá trị voucher của giao dịch</p> |
| `fee` | string | <p>Phí</p> |
| `service_group` | string | <p>Nhóm dịch vụ trên MoMo</p> |
| `user_type_name` | string | Tên loại người dùng thực hiện giao dịch thu hộ Bảo Hiểm. |
| `trans_date` | date | Ngày thực hiện giao dịch thu hộ Bảo Hiểm |
| `bu_group_code_l3` | string | Phân loại nhóm thu hộ Bảo Hiểm: LIFE = NHÂN THỌ NON-LIFE = PHI NHÂN THỌ AGENCY |
| `merchant` | string | Tên của merchant thu hộ Bảo Hiểm (các partner bán bảo hiểm), ví dụ: Liberty, Bảo Việt, PTI,... |
| `service_description` | string | Mô tả dịch vụ. Ví Dụ: Thanh Toán phí bảo hiểm của merchant nào đó.... |
| `billid` | string | Mã Hợp Đồng Bảo Hiểm được Thu Hộ |
| `typeid` | string | <p>Voucher được sử dụng</p> |
| `error_name` | string | Định nghĩa các mã lỗi giao dịch thu hộ Bảo Hiểm |
| `error_name_detail` | string | Chi tiết lỗi của giao dịch thu hộ Bảo Hiểm (nếu có). |
| `serviceid` | string | ID dịch vụ của giao dịch thu hộ Bảo Hiểm. |
| `money_source` | string | Định nghĩa các nguồn tiền sử dụng khi thanh toán thu hộ Bảo Hiểm |
| `type` | string | <p>Kênh thanh toán: App MoMo/App đối tác dẫn về</p> |
| `payment_channel` | string | Kênh user sử dụng để thanh toán dịch vụ  thu hộ Bảo Hiểm (ví dụ: webapp/QR/app MoMo, ...) |
| `cb_amount` | string | <p>Tổng số tiền được hoàn</p> |
| `bill_amount` | string | <p>Giá trị bill</p> |
| `bill_due` | date | Ngày tới hạn thanh toán trên Hợp đồng dịch vụ thu hộ Bảo Hiểm |
| `d_diff` | string | <p>d_diff := Ngày thanh toán - ngày hết hạn của bill</p> |
| `repay_type` | string | Overdue : Qúa Hạn Pre_due: Trước Hạn |
| `final_rev` | string | <p>Doanh thu</p> |
| `cc_status` | string | Định nghĩa status của giao dịch thu hộ Bảo Hiểm: thành công/thất bại |
| `trans_month` | date | Tháng thực hiện thanh toán thu hộ Bảo Hiểm |
| `bill_type` | string | <p>Loại bill bảo hiểm</p> |
| `trans_datetime` | datetime | <p>Ngày + Giờ thực hiện giao dịch</p> |
| `proxy_purchase` | string | <p>Flag thanh toán hộ:<br>1: Hộ<br>0: Tự Thanh Toán</p> |
| `is_refund` | string | <p>Trạng thái refund: <br>1 - Có<br>2 - Không</p> |

### `momovn-prod.BU_FI.INS_DIS_ALL_TRANS_REVENUE`
> <p>Bảng lưu trữ thông tin giao dịch + doanh thu kênh DISTRIBUTION - BÁN SẢN PHẨM - của FS_InsurTech</p>

| Column | Type | Description |
|--------|------|-------------|
| `trans_date` | date | <p>Ngày thực hiện giao dịch</p> |
| `trans_datetime` | datetime | <p>Ngày + Giờ Thực Hiện Giao Dịch</p> |
| `user_payment` | string | <p>AgentID</p> |
| `parentid` | string | <p>TID cha</p> |
| `id` | string | <p>TID Giao Dịch</p> |
| `payment_channel` | string | <p>Kênh Thanh Toán: Thanh Toán Trên APP/WEB/Giao Dịch Auto Debit</p> |
| `is_refund` | string | <p>Trạng Thái Refund: 1: Đã - 0: Chưa</p> |
| `service_code` | string | <p>service_code của dịch vụ</p> |
| `serviceid` | string | <p>serviceid của dịch vụ</p> |
| `sp` | string | <p>Phân loại sản phẩm theo cate lớn.</p> |
| `sp_detail` | string | <p>Phân loại sản phẩm thêm chi tiết: Tái Tục/Mua Mới - Bundle/SA</p> |
| `merchant` | string | <p>Merchant hợp tác</p> |
| `money_source` | string | <p>Nguồn tiền thanh toán</p> |
| `amount` | string | <p>Giá trị giao dịch</p> |
| `vc_amount` | string | <p>Giá trị voucher được sử dụng trong giao dịch</p> |
| `cb_amount` | string | <p>Giá trị hoàn tiền - luồn cashback - của giao dịch</p> |
| `dd_amount` | string | <p>Giảm giá trực tiếp - áp dụng cho dịch vụ Bảo Hiểm Vật Chất Xe - trên 1 giao dịch</p> |
| `typeid` | string | <p>voucher được sử dụng trong giao dịch</p> |
| `final_rev` | string | <p>Doanh Thu Có Được Từ Giao Dịch</p> |
| `rev_after_sharing` | string | <p>Doanh Thu Có Được Từ Giao Dịch Sau Khi Chia Hoa Hồng (Áp dụng với 1 vài sản phẩm)</p> |

### `momovn-prod.BU_FI.INS_TRAFFIC_FLOW`
> <p>Bảng chứa thông tin traffic flow đổ vào các sản phẩm của InsurTech</p>

| Column | Type | Description |
|--------|------|-------------|
| `date_event` | date | <p>Date vào luồng</p> |
| `datetime_event` | datetime | <p>Datetime vào luồng</p> |
| `user` | string | <p>ID của user</p> |
| `name` | string | <p>Name ở đây là tên của Banner/Noti tương ứng. Nếu là Previous Screen: màn hình trước đó thì null.</p> |
| `momo_session_id_v2` | string | <p>ID của lượt traffic</p> |
| `event_id` | string | <p>ID của event.</p> |
| `source` | string | <p>Định nghĩa là traffic flow - nơi trước đó để đến luồng sản phẩm sản phẩm service</p> |
| `service` | string | <p>Là nơi đến - tên dịch vụ được đổ từ các source trước đó</p> |
| `service_name` | string | <p>serviceid của các dịch vụ</p> |
| `merchant` | string | <p>merchant các dịch vụ tương ứng</p> |
| `traffic` | string | <p>Phương Thức bắt Traffic:<br>1) Previous Screen<br>2) Banner<br>3) Notification</p> |
| `age_group` | string | <p>Nhóm tuổi của user vào luồng</p> |
| `gender` | string | <p>Giới tính</p> |

### `momovn-prod.BU_FI.INS_PUBLIC_HEALTH`
> Bảng lưu trữ thông tin các giao dịch của sản phẩm BẢO HIỂM Y TẾ của FS_InsurTech.

| Column | Type | Description |
|--------|------|-------------|
| `trans_date` | date | Ngày giao dịch Bảo Hiểm Y Tế |
| `trans_datetime` | timestamp | Ngày giờ giao dịch Bảo Hiểm Y Tế |
| `id` | string | <p>TID</p> |
| `parentid` | string | <p>TID cha</p> |
| `user_payment` | string | <p>AgentID</p> |
| `amount` | string | <p>Tổng giá trị giao dịch</p> |
| `total_amount` | string | <p>Tổng giá trị thực giao dịch</p> |
| `mm_amount` | string | <p>Tổng giá trị MoMo giao dịch</p> |
| `vc_amount` | string | <p>Tổng giá trị voucher của giao dịch</p> |
| `cb_amount` | string | <p>Tổng hoàn tiền của giao dịch</p> |
| `trans_type` | string | Hình thức giao dịch Bảo Hiểm Y Tế |
| `money_source` | string | Nguồn tiền thanh toán Bảo Hiểm Y Tế :=   1 = Ví MoMo  2 = Ngân Hàng Liên Kết  3 = Thẻ Napas  4 = Thẻ Visa Debit  5 = Thẻ Visa Credit  6 = Túi Thần Tài  7 = Ví Trả Sau  8 = Cashback  9 = CCM 10 = BNPL  11 = Newton  12 = Direct Debit  13 = Qũy Nhóm  14 = Virtual Account Collection |
| `typeid` | string | <p>Voucher có trong giao dịch</p> |
| `statusid` | string | <p>Trạng thái giao dịch:<br>2 - Thành Công<br>6 - Thất Bại</p> |
| `user_payment_name` | string | Tên người thực hiện giao dịch Bảo Hiểm Y Tế |
| `policy_owner_name` | string | Tên của người thừa hưởng bảo hiểm / người đứng tên mã bảo hiểm |
| `result` | string | Mã Lỗi Bảo Hiểm Y Tế trên bảng V5 |
| `reference_1` | string | Mã Bảo Hiểm Y Tế / Bảo Hiểm Xã Hội (V5) |
| `old_end_date` | date | <p>Ngày hết hạn cũ của thẻ </p> |
| `d_diff` | string | <p>d_diff := ngày thanh toán - ngày hết hạn cũ của thẻ</p> |
| `expired_date` | string | <p>ngày hết hạn mới</p> |
| `product_name` | string | Loại(Term) Bảo Hiểm Y Tế :=  BHYTHGD_3M : Bảo Hiểm Y Tế Hộ Gia Đình (3 Tháng) BHYTHGD_6M : Bảo Hiểm Y Tế Hộ Gia Đình (6 Tháng) BHYTHGD_12M := Bảo Hiểm Y Tế Hộ Gia Đình (12 Tháng) |
| `policy_dynamic_pricing` | string | Phương Thức Mua Bảo Hiểm Y Tế: Tái Tục Mua Mới |
| `policy_total_discount` | string | <p>Mặc định 100%</p> |
| `policy_owner_address` | string | Vùng - Thành Phố theo Người thừa hưởng Bảo Hiểm Y Tế / chủ mã Bảo Hiểm Y Tế |
| `status` | string | <p>Trạng thái thẻ bảo hiểm y tế</p> |
| `proxy_purchase` | string | <p>Flag thanh toán hộ:<br>1 - Có<br>0 - Tự thanh toán</p> |
| `is_renewal` | string | <p>Flag tái tục:<br>1: Có<br>0: Chưa</p> |
| `renewal_status` | string | Trạng thái tái tục Bảo Hiểm Y Tế (nếu có) :  1) Tái tục đúng hạn 2) Tái tục quá 90 ngày 3) Rớt dữ liệu |
| `revenue` | string | <p>Doanh thu có được từ giao dịch</p> |
| `is_refund` | string | <p>Trạng thái refund:<br>1: Có<br>0: Không</p> |
| `refund_id` | string | <p>TID refund</p> |
| `refund_datetime` | datetime | Ngày giờ refund(hoàn trả) Bảo Hiểm Y Tế |
| `payment_channel` | string | <p>Kênh/Hình thức thanh toán: Thanh Toán trên App/ Luồng Web</p> |
| `channel_gate` | string | <p>Nếu thanh toán web thì thanh toán trên APP/QR-bank out app</p> |
| `flag_repayment` | string | <p>Map theo billid:<br>Giao dịch đầu tiên = PAYMENT</p><p>Giao dịch thứ 2+ = REPAYMENT</p> |

### `momovn-prod.BU_FI.INS_VEHICLE_RENEWAL_V3`
> <p>Bảng chứa tất cả thông tin về dữ liệu tái tục của các sản phẩm bảo hiểm phương tiện xe máy/xe hơi trên MoMo - đã mapping theo biển số xe của FS_InsurTech.</p>

| Column | Type | Description |
|--------|------|-------------|
| `bsx` | string | <p>Biển số xe</p> |
| `user` | string | <p>AgentID</p> |
| `id` | string | <p>TID giao dịch</p> |
| `old_policy_id` | string | <p>TID của giao dịch cũ (nếu đây là giao dịch Tái Tục)</p> |
| `root_policy_id` | string | <p>TID giao dịch đầu tiên của bảng số xe = TID của giao dịch Mua Mới map theo bảng số xe để đảm bảo chính xác.</p> |
| `payment_order` | string | <p>Giao dịch thứ mấy của bảng số xe tương ứng,<br><br><strong>payment_order = 1 -&gt; Mua Mới </strong><br><strong>payment_order = n -&gt; Bảng Số Xe/Chiếc Xe đã được Tái Tục n-1 lần</strong></p> |
| `is_renewal` | string | <p>Flag tái tục:<br>1: đã<br>0: chưa</p> |
| `prev_expired_date` | date | <p>Ngày hết hạn cũ - chỉ có khi không phải là giao dịch Mua Mới</p> |
| `trans_date` | date | <p>Ngày thực hiện giao dịch ID</p> |
| `day_diff` | string | <p>day_diff := khoảng cách giữa ngày hết hạn cũ và ngày thanh toán <br></p><p>day_diff  &lt; 0 -&gt; Tái Tục Trước Due Date</p><p></p><p>day_diff  = 0 -&gt; Tái Tục Ngay Due Date</p><p></p><p>day_diff  &gt; 0 -&gt; Tái Tục Sau Due Date</p><p></p> |
| `expired_date` | date | <p>Ngày hết hạn của giao dịch TID</p> |
| `renewal_date` | date | <p>Ngày tái tục của TID đó, chỉ có khi được tái tục</p> |
| `dpd` | string | <p>Day past due - dpd = khoảng cách giữa ngày thanh toán và ngày hết hạn cũ </p> |
| `purchase_type` | string | <p>Hình thức mua - đã mapping bảng số xe - Mua Mới/Tái Tục</p> |
| `flow` | string | — |
| `renew_type` | string | <p>Hình Thức Tái Tục: <br></p><ul class="om-list-disc"><li class="om-leading-normal"><p>Sau Khoảng Tái Tục &gt; 1 tháng và chưa tái tục</p></li><li class="om-leading-normal"><p>Sau Khoảng Tái Tục &lt; 1 Tháng và chưa tái tục</p></li><li class="om-leading-normal"><p>Chưa hết hạn và chưa tái tục</p... |
| `renew_target` | string | <p>Nếu là tái tục thì tái tục tho due date - tháng hết hạn nào</p> |
| `merchant` | string | <p>Merchant phân phối sản phẩm</p> |
| `prev_merchant` | string | <p>Merchant phân phối sản phẩm trước đó - có khi đã tái tục</p> |
| `merchant_renew` | string | <p>Merchant khi hợp đồng được tái tục - có khi không phải Mua Mới</p> |
| `year_group` | string | <p>Thời hạn mua: 1/2/3 năm</p> |
| `prev_year_group` | string | <p>Thời hạn mua trước đó - chỉ có khi không phải Mua Mới</p> |
| `year_group_convert` | string | <p>year_group_convert := Year Group Cũ -&gt; Year Group Mới -&gt; xem behavior mua hàng của user</p> |
| `segment` | string | <p>Segment của user khi thực hiện giao dịch TID:<br></p><ul class="om-list-disc"><li class="om-leading-normal"><p>Promotion: User được cashback luồng hoàn tiền - cb_amount &gt; 0.</p></li><li class="om-leading-normal"><p>Organic: User KHÔNG được cashback luồng hoàn tiền.</p></li></ul><p></p> |
| `prev_segment` | string | <p>Segment của user khi thực hiện giao dịch PARENT-ID, chỉ có khí là giao dịch Tái Tục</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Promotion: User được cashback luồng hoàn tiền - cb_amount &gt; 0.</p></li><li class="om-leading-normal"><p>Organic: User KHÔNG được cashback luồng ho... |
| `sp` | string | <p>3 cate sản phẩm lớn: Motor Ins/Compulsory Car/Voluntary Car</p> |
| `sp_detail` | string | <p>Break thêm 3 luồng:</p><p></p><ul class="om-list-disc"><li class="om-leading-normal"><p>Compulsory Car</p></li><li class="om-leading-normal"><p>Renewal Compulsory Car</p></li><li class="om-leading-normal"><p>Motor Ins</p></li><li class="om-leading-normal"><p>Renewal Motor Ins</p></li><li class... |
| `proxy_purchase` | string | <p>Flag mua hộ:</p><p><br>1: Có<br>0: Không</p> |
| `is_autodebit_payment` | string | <p>Flag Auto Debit:<br>1: Có<br>0: Không</p> |
| `age_group` | string | <p>Nhóm tuổi của user thanh toán</p><p></p> |
| `flag` | string | <p> </p> |
| `status` | string | <p>Trạng Thái Hợp Đồng:<br>ACTIVE: Hiệu Lực<br>ISSUED: Đã Ban Hành <br>CANCELED: Huỷ<br>EXPIRED: Hết Hạn</p> |

### `momovn-prod.BU_FI.EVENT_INSURTECH`
> <p>Bảng chứa dữ liệu EVENT + PARAMS kéo từ <code>APP_EVENT.EVENTS</code>  và <code>APP_EVENT.PARAMS theo các service_name của sản phẩm bảo hiểm FS_InsurTech.</code></p>

| Column | Type | Description |
|--------|------|-------------|
| `event_name` | string | <p>Tên của event theo bảng EVENTS + PARAMS</p> |
| `service_name` | string | <p>Tất cả service_name của nhà Bảo Hiểm (Distribution + Collection)</p> |
| `event_id` | string | <p>Mã định danh của event</p> |
| `date` | date | <p>Ngày ghi nhận event</p> |
| `datetime` | datetime | <p>Ngày giờ ghi nhận event</p> |
| `momo_session_id_v2` | string | <p>momo_session_id_v2<strong> </strong>theo bảng EVENTS + PARAMS</p> |
| `trail_id` | string | <p>traid_id theo bảng EVENTS + PARAMS</p> |
| `user` | string | <p>AgentID</p> |
| `screen_name` | string | <p> </p> |
| `button_name` | string | <p> </p> |
| `icon_name` | string | <p> </p> |
| `component_name` | string | <p> </p> |
| `block_name` | string | <p> </p> |
| `tab_name` | string | <p> </p> |
| `key` | string | <p> </p> |
| `value` | string | <p> </p> |
| `field_name` | string | <p> </p> |
| `app_version` | string | <p> </p> |

### `momovn-prod.BU_FI.FI_PI_BUNDLE_INS`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `vexe_id` | INT64 | — |
| `trans_date` | DATE | — |
| `vexe_merchant` | STRING | — |
| `user_id` | FLOAT64 | — |
| `gmv_group` | STRING | — |
| `vexe_gmv` | FLOAT64 | — |
| `ins_id` | INT64 | — |
| `final_rev` | FLOAT64 | — |
| `cc_status` | STRING | — |
| `amount` | FLOAT64 | — |
| `vc_amount` | FLOAT64 | — |
| `cb_amount` | FLOAT64 | — |
| `dd_amount` | FLOAT64 | — |
| `MERCHANT_NAME` | STRING | — |
| `DEPARTURE_TIME` | DATETIME | — |
| `ARRIVAL_TIME` | DATETIME | — |
| `DEPARTURE_NAME` | STRING | — |
| `ARRIVAL_NAME` | STRING | — |
| `TOTAL_TICKET` | INT64 | — |
| `departure_datetime` | DATETIME | — |
| `arrival_datetime` | DATETIME | — |
| `days_to_go` | INT64 | — |

### `momovn-prod.BU_FI.INS_ACTIVE_POLICIES`
> <p>Bảng lưu trữ thông tin về user đang có hợp đồng bảo hiểm đang có HIỆU LỰC = ACTIVE.</p>

| Column | Type | Description |
|--------|------|-------------|
| `sp_detail` | string | <p>Phân Loại Sản Phẩm</p> |
| `user` | string | <p>AgentID của user</p> |
| `momo_id` | string | <p>TID giao dịch</p> |
| `created_date` | date | <p>Thời gian khởi tạo hợp đồng</p> |
| `EXPIRED_DATE` | date | <p>Ngày hết hạn của hợp đồng</p> |
| `IS_RENEWAL` | string | <p>Flag tái tục:<br>1: Đã tái tục<br>0: Chưa</p> |

### `momovn-prod.BU_FI.INS_CRITICAL_ILLNESS_V2`
> <p>Bảng lưu trữ thông tin giao dịch sản phẩm BẢO HIỂM BỆNH HIỂM NGHÈO của FS_InsurTech</p>

| Column | Type | Description |
|--------|------|-------------|
| `trans_date` | date | <p>Ngày thực hiện giao dịch</p> |
| `trans_datetime` | datetime | <p>Ngày + Giờ Thực Hiện Giao Dịch</p> |
| `user_payment` | string | <p>AgentID</p> |
| `parentid` | string | <p>TID cha</p> |
| `id` | string | <p>TID Giao Dịch</p> |
| `flag_repayment` | string | <p>Map theo billid:<br>Giao dịch đầu tiên = PAYMENT</p><p>Giao dịch thứ 2+ = REPAYMENT</p> |
| `is_refund` | string | <p>Trạng thái refund:<br>1: Có<br>0: Chưa</p> |
| `statusid` | string | <p>Trạng thái giao dịch:<br>2 - Thành Công<br>6 - Thất Bại</p> |
| `payment_channel` | string | <p>Phương thức thanh toán: Giao Dịch Bình Thường/AUTO_DEBIT</p><p><br></p> |
| `MONEY_SOURCE` | string | <p>Nguồn tiền thanh toán</p> |
| `amount` | string | <p>Giá Trị Giao Dịch</p> |
| `vc_amount` | string | <p>Tổng giá trị voucher của giao dịch</p> |
| `CB_AMOUNT` | string | <p>Tổng giá trị hoàn tiền của giao dịch</p> |
| `revenue` | string | <p>Doanh thu có được từ giao dịch</p> |
| `billid` | string | <p>Billid của hợp đồng bảo hiểm</p> |
| `policy_status` | string | <p>Trạng Thái Hợp Đồng Bảo Hiểm</p> |
| `payment_option` | string | <p>Phân Loại Sản Phẩm: Monthly/Annual - With/Without Early Bird</p> |
| `is_pay_now` | string | <p>Thanh Toán Ngay: <br>1: Có</p><p>0: Không</p> |
| `tenors` | string | <p>Năm thứ n của billid. Max = 3 năm</p> |
| `remaining_terms` | string | <p>Số term còn lại của hợp đồng.</p> |
| `effective_date` | date | <p>Ngày hợp đồng bắt đầu có hiệu lực</p> |
| `next_payment_date` | date | <p>Ngày thanh toán tiếp theo</p> |
| `expired_date` | date | <p>Ngày hết hạn của hợp đồng</p> |
| `customer_name` | string | <p>Thông tin tên khách hàng</p> |
| `age` | string | <p>Tuổi </p> |
| `gender` | string | <p>Giới tính </p> |

### `momovn-prod.BU_FI.INS_OTA_AIRLINE_BUNDLE`
> <p>Bảng lưu trữ thông tin giao dịch sản phẩm BẢO HIỂM TRỄ CHUYẾN BAY - mapping với dữ liệu chuyến bay của OTA - của FS_InsurTech</p>

| Column | Type | Description |
|--------|------|-------------|
| `trans_date` | date | <p>Ngày thực hiện giao dịch</p> |
| `ota_id` | string | <p>TID của giao dịch vé máy bay</p> |
| `merchant_code` | string | <p>Mã code merchant hàng không của nhà OTA</p> |
| `merchant_ota` | string | <p>Merchant hàng không</p> |
| `pnr` | string | <p>Mã đặt chỗ chuyến bay</p> |
| `is_round_trip` | string | <p>Flag khứ hồi:<br>1: 2 Chiều - Khứ Hồi<br>0: 1 Chiều</p> |
| `ota_amount` | string | <p>Gía trị giao dịch vé máy bay</p> |
| `total_ticket` | string | <p>Số vé máy bay trong 1 giao dịch</p> |
| `departure_code` | string | <p>Mã IATA nơi khởi hành</p> |
| `arrival_code` | string | <p>Mã IATA nơi đến</p> |
| `departure_date` | date | <p>Ngày khởi hành</p> |
| `arrival_date` | date | <p>Ngày đến</p> |
| `route_type` | string | <p>Flag Quốc Tế/ Nội Địa</p> |
| `user` | string | <p>AgentID</p> |
| `bundle_id` | string | <p>TID giao dịch bảo hiểm</p> |
| `ins_services` | string | <p>Dịch Vụ Bảo Hiểm </p> |
| `amount` | string | <p>Gía trị giao dịch bảo hiểm</p> |
| `final_rev` | string | <p>Doanh thu có được từ giao dịch bảo hiểm đính kèm</p> |
| `user_ota` | string | <p>AgentID</p> |
| `departure_date_return` | date | <p>Ngày khởi hành vòng/chiều về - có nếu là giao dịch khứ hồi</p> |
| `arrival_date_return` | date | <p>Ngày đến vòng/chiều về - có nếu là giao dịch khứ hồi </p> |
| `region` | string | <p>Vùng đến - định nghĩa liên hệ BUs để có lastest update</p> |
| `days_to_fly` | string | <p>days_to_fly : = ngày khởi hành chiều đi - ngày mua vé</p> |
| `duration_round_trip` | string | <p>duration_round_trip := ngày đến của chiều/vòng về - ngày khởi hành của chiều/vòng đi - xác định số ngày của 1 trip nếu khứ hồi</p> |
| `trans_datetime` | datetime | <p>Ngày giờ thực hiện giao dịch</p> |
| `departure_datetime` | datetime | <p>Ngày giờ khởi hành</p> |
| `arrival_datetime` | datetime | <p>Ngày giờ đến</p> |
| `departure_datetime_return` | datetime | <p>Ngày giờ khởi hành của chiều/vòng về - nếu là chuyến bay khứ hồi </p> |
| `arrival_datetime_return` | datetime | <p>Ngày giờ đến của chiều/vòng về - nếu là chuyến bay khứ hồi </p> |
| `min_trans_to_depart` | string | <p>Số phút từ lúc giao dịch -&gt; khởi hành</p> |

### `momovn-prod.BU_FI.INS_PUBLIC_HEALTH_RAW`

| Column | Type | Description |
|--------|------|-------------|
| `created_date` | date | <p>Ngày truy vấn</p> |
| `created_datetime` | datetime | <p>Ngày giờ truy vấn</p> |
| `request` | string | <p>Mã định danh truy vấn</p> |
| `user` | string | <p>AgentID</p> |
| `typeCheck` | string | <p>Phương thức truy vấn:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>MEDICAL_NUMBER: Mã Bảo Hiểm</p></li><li class="om-leading-normal"><p>PERSONAL_ID: CCCD</p><p><br></p></li></ul><p></p> |
| `PROCESS_TYPE` | string | <p>PROCESS_TYPE = check-info-policy<br></p> |
| `RESULT_CODE` | string | <p>Kết quả Truy Vấn: </p><p>0: Thành Công</p> |
| `wallet_name` | string | <p>Tên chủ ví MoMo = AgentID's name</p> |
| `proxy_check` | string | <p>Flag truy vấn hộ:<br>1: Có<br>0: Tự Truy Vấn cho bản thân</p> |
| `fullName` | string | <p>Họ Và Tên chủ thẻ BHYT</p> |
| `gender` | string | <p>Giới Tính</p> |
| `medicalId` | string | <p>Mã Thẻ BHYT</p> |
| `flag_same_address` | string | <p>Flag địa chỉ hiện tại có giống với địa chỉ khai sinh không <br>1: Có<br>2: Không</p> |
| `healthInsuranceCardNumber` | string | <p>Full mã bảo hiểm</p> |
| `insur_type` | string | <p>2 chữ cái đầu mã bảo hiểm để phân khúc</p> |
| `insur_type_detail` | string | <p>Ý nghĩa của 2 chữ cái đầu của mã bảo hiểm</p> |
| `oldCardEndDate` | string | <p>Ngày hết hạn cũ</p> |

## Memory (from DA review)

- CC_STATUS = 'CANCEL' : Hủy/Thất Bại
- Bảo Hiểm Xe Máy Bắt Buộc: SP_DETAIL = 'Motor Ins'
- CC_STATUS = 'SUCCESS' : Thành Công
