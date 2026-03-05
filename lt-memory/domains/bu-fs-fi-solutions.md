# BU FS: FI Solutions

**Domain ID:** `5cd09ae2-90b8-4102-a717-0ae6f649ff69`

## Description
Data về traffic và giải ngân của sản phẩm CLO và giao dịch thanh toán khoản vay, thanh toán thẻ tín dụng

## Tables

### `momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW`
> <p>Bảng lưu thông tin user truy cập vào sản phẩm CLO theo từng nguồn</p>

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `SOURCE` | STRING | <p>nguồn dẫn user tới truy cập sản phẩm</p> | — |
| `VALUE` | STRING | <p>đối tác của sản phẩm:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>'clo_fecredit' : FE CREDIT</p></li><li class="om-leading-normal"><p>'lending_mp_homecredit': HOME CREDIT</p></li><li class="om-leading-normal"><p>'cro_vib': VIB</p><p><br></p><p><br></p></li></ul><p></p> | — |
| `ETL_DATE` | DATE | <p>ngày người dùng truy cập</p> | — |
| `MOMO_SESSION_ID_V2` | STRING | <p>định danh cho lượt truy cập của người dùng</p> | — |
| `AGENT_ID` | STRING | <p>định danh mã người dùng</p> | — |

### `momovn-prod.BU_FI.FI_TRANS`
> <p>Bảng chứa thông tin các giao dịch liên quan tới dịch vụ tài chính: thu chi hộ, thanh toán khoản vay, thanh toán thẻ tín dụng....</p>

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ID` | INT | <p>tid / mã định danh của giao dịch</p> | — |
| `DATE_PARTITION` | INT | <p>Thời điểm update cuối cùng của giao dịch.</p><p>Lưu ý, luôn chuyển về múi giờ UTC +7 khi sử dụng cột này</p> | — |
| `_DATE_PARTITION` | TIMESTAMP | <p>Thời điểm update cuối cùng của giao dịch.</p><p>Lưu ý, luôn chuyển về múi giờ UTC +7 khi sử dụng cột này</p> | — |
| `FUNDID` | FLOAT | <p>Nguồn tiền của giao dịch:</p><p>1      Nguồn tiền momo</p><p>2	Nguồn tiền ngân hàng liên kết</p><p>3	Nguồn tiền napas</p><p>4	Nguồn tiền visa debit</p><p>5	Nguồn tiền visa credit</p><p>6	Túi thần tài</p><p>7	Paylater</p><p>8	Cashback</p><p>9	Nguồn tiền thẻ visa ảo ccm </p><p>10	BNPL</p><p>11	Newton</p><p>12	Direct Debit</p><p>13	Money pool</p><p>14	Virtual Account </p> | — |
| `SERVICE_CODE` | STRING | <p>Dịch vụ của giao dịch<br></p> | — |
| `USER_PAYMENT` | FLOAT | <p>Agent_id thực hiện giao dịch	</p> | — |
| `DEBITOR` | STRING | <p>bỏ qua cột này</p> | — |
| `CREDITOR` | STRING | <p>bỏ qua cột này</p> | — |
| `INITIATOR` | STRING | <p>bỏ qua cột này</p> | — |
| `TRANS_TYPE` | STRING | <p>Loại giao dịch</p> | — |
| `EWALLET_TYPEID` | INT | <p>bỏ qua cột này</p> | — |
| `STATUSID` | INT | <p>Trạng thái giao dịch (2 là thành công, 6 là thất bại)	</p><p>nếu user không đề cập gì tới trạng thái giao dịch thì luôn mặc định hiểu là giao dịch thành công </p> | — |
| `AMOUNT` | FLOAT | <p>Số tiền của giao dịch</p> | — |
| `PARENTID` | FLOAT | <p>bỏ qua cột này</p> | — |
| `AGENT_CREDIT` | FLOAT | <p>Agentid của tài khoản được cộng tiền	</p> | — |
| `AGENT_DEBIT` | FLOAT | <p>Agentid của tài khoản bị trừ tiền	</p> | — |
| `RESULT` | FLOAT | <p>Mã lỗi của core	</p> | — |
| `TOTAL_AMOUNT` | FLOAT | <p>Tổng giá trị bill (không tính chiết khấu)	</p> | — |
| `MM_AMOUNT` | FLOAT | <p>Số tiền thực trả của user</p> | — |
| `VC_AMOUNT` | FLOAT | <p>Số tiền được giảm trừ từ voucher	</p> | — |
| `FEE` | FLOAT | <p>Số tiền thu phí dịch vụ	</p> | — |
| `SERVICE_GROUP` | FLOAT | <p>ID của nhóm dịch vụ của giao dịch:</p><p>1 : dịch vụ thanh toán</p><p>2: dịch vụ chuyển tiền</p><p>3: nộp tiền từ bank vào ví momo</p><p>4: rút tiền từ momo về bank</p><p>10: dịch vụ giải ngân<br></p> | — |
| `USER_TYPE_NAME` | STRING | <p>bỏ qua cột này</p> | — |
| `DATE_TRANS` | DATE | <p>ngày thực hiện giao dịch</p> | — |
| `BU_GROUP_CODE_L1` | STRING | <p>nhóm dịch vụ l1</p><p>luôn where cột này = 'PAYMENT'</p> | — |
| `BU_GROUP_CODE_L2` | STRING | <p>nhóm dịch vụ level 2:</p><p>hãy where cột này = 'LOAN COLLECTION' với giao dịch thanh toán khoản vay.</p><p>hãy where cột này = 'CREDIT CARD COLLECTION' với giao dịch thanh toán thẻ tín dụng.</p><p>hãy where cột này = 'PAYOUT' với giao dịch chi hộ.</p> | — |
| `BU_GROUP_CODE_L3` | STRING | <p>nhóm dịch vụ level 3:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>FM: giao dịch liên quan tới sản phẩm vay nhanh</p></li><li class="om-leading-normal"><p>BANK: giao dịch liên quan tới các ngân hàng</p></li><li class="om-leading-normal"><p>FINCOS: giao dịch liên quan tới các tổ chức tài chính</p></li><li class="om-leading-normal"><p>OTHERS: giao dịch liên quan tới giấy phép cầm đồ</p><p></p><p><br></p></li></ul><p></p> | — |
| `BU_GROUP_CODE_L4` | STRING | <p>nhóm dịch vụ level 4:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>'COLLECTION' : nhóm dịch vụ thu hộ</p></li><li class="om-leading-normal"><p>'DISBURSEMENT': nhóm dịch vụ chi hộ</p></li></ul><p></p> | — |
| `BU_NAME` | STRING | <p>bỏ qua cột này</p> | — |
| `MERCHANT` | STRING | <p>tên đối tác</p> | — |
| `SERVICE_DESCRIPTION` | STRING | <p>mô tả cụ thể cho dịch vụ</p> | — |
| `BILLID` | STRING | <p>mã hợp đồng liên quan tới dịch vụ thanh toán </p> | — |
| `TYPEID` | ARRAY | — | — |
| `ERROR_NAME` | STRING | <p>bỏ qua cột này</p> | — |
| `ERROR_NAME_DETAIL` | STRING | <p>bỏ qua cột này</p> | — |
| `SERVICEID` | STRING | — | — |
| `TIME_TRANS` | TIME | — | — |
| `MONEY_SOURCE` | STRING | — | — |
| `TYPE` | STRING | — | — |
| `HOUR_TRANS` | INT | — | — |
| `PAYMENT_CHANNEL` | STRING | — | — |
| `CB_AMOUNT` | FLOAT | — | — |
| `BILL_AMOUNT` | FLOAT | — | — |
| `BILL_DUE` | DATE | — | — |
| `D_DIFF` | INT | — | — |
| `REPAY_TYPE` | STRING | — | — |

### `momovn-prod.BU_FI.FIS_TCST`
> <p>Đây là bảng chứa dữ liệu của sản phẩm CLO. Trong bảng này chứa thông tin về trạng thái của ticket, số tiền giải ngân và doanh thu.</p>

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `TICKET_ID` | STRING | Desc: Mã định danh cho mỗi yêu cầu hoặc giao dịch. Sample value: ['116472', '116487', '116520'] | — |
| `USER` | STRING | Desc: Người dùng thực hiện yêu cầu hoặc giao dịch. Sample value: ['25136673', '36677566', '36940788'] | — |
| `PARTNER_ID` | STRING | <p>Desc: Mã định danh của đối tác liên quan đến yêu cầu hoặc giao dịch.<br>Sample value: ['lending_mp_homecredit']</p><p>định nghĩa :<br>lending_mp_homecredit : Home Credit<br>cro_vib : VIB<br>clo_fecredit: FE CREDIT</p><p>clo_mcredit: MCREDIT</p> | — |
| `FAILED_TIMES` | FLOAT | Desc: Số lần yêu cầu hoặc giao dịch thất bại. Sample value: ['nan'] | — |
| `STATUS_CODE` | STRING | Desc: Mã trạng thái của yêu cầu hoặc giao dịch. Sample value: ['PRE_CHECK'] | — |
| `DATE_REQUESTED` | DATE | Desc: Ngày yêu cầu được thực hiện. Sample value: ['2022-11-24'] | — |
| `DATETIME_REQUESTED` | DATETIME | Desc: Thời điểm yêu cầu được thực hiện. Sample value: ['2022-11-24 00:30:11', '2022-11-24 00:47:15', '2022-11-24 01:39:53'] | — |
| `DATE_MODIFIED` | DATE | Ngày cập nhật trạng thái mới nhất của ticket. Nếu lấy theo trạng thái giải ngân thì dùng cột này | — |
| `DATETIME_MODIFIED` | DATETIME | Ngày giờ trạng thái mới nhất của ticket | — |
| `DATETIME_EXPIRED` | DATETIME | **Desc**: Thời điểm yêu cầu hoặc giao dịch được đẩy đi. | — |
| `DATETIME_PUSHED` | DATETIME | Desc: Thời điểm yêu cầu hoặc giao dịch được đẩy đi. | — |
| `SCORING_CODE` | STRING | Desc: Mã điểm số liên quan đến yêu cầu hoặc giao dịch. | — |
| `CORE_ID` | STRING | Desc: Mã định danh của giao dịch, tương ứng với mã định danh của table core_trans | — |
| `OFFER_ID` | STRING | Desc: Mã định danh của đề nghị liên quan đến yêu cầu hoặc giao dịch. | — |
| `ONBOARDING_APPLICATION_ID` | STRING | Desc: Mã định danh của ứng dụng onboarding liên quan đến yêu cầu hoặc giao dịch. | — |
| `ONBOARDING_APPLICATION_STATUS` | STRING | Desc: Trạng thái của ứng dụng onboarding liên quan đến yêu cầu hoặc giao dịch. | — |
| `CONTRACT_ID` | STRING | Desc: Mã định danh của hợp đồng liên quan đến yêu cầu hoặc giao dịch. | — |
| `CONTRACT_NAME` | STRING | Desc: Tên của hợp đồng liên quan đến yêu cầu hoặc giao dịch. | — |
| `CONTRACT_AMOUNT` | FLOAT | <p>Desc: Số tiền của hợp đồng liên quan đến yêu cầu hoặc giao dịch.<br>hãy dùng cột này để tính số giải ngân/disbursed</p> | — |
| `MINIMAL_CREDIT_AMOUNT` | FLOAT | Desc: Số tiền tín dụng tối thiểu liên quan đến yêu cầu hoặc giao dịch. | — |
| `MAXIMAL_CREDIT_AMOUNT` | FLOAT | Desc: Số tiền tín dụng tối đa liên quan đến yêu cầu hoặc giao dịch. | — |
| `REQUESTED_CREDIT_AMOUNT` | FLOAT | Desc: Số tiền tín dụng được yêu cầu trong giao dịch. | — |
| `APPROVED_CREDIT_AMOUNT` | FLOAT | Desc: Số tiền tín dụng được phê duyệt trong giao dịch. | — |
| `DISBURSED_CREDIT_AMOUNT` | FLOAT | Desc: Số tiền tín dụng đã được giải ngân trong giao dịch. | — |
| `REVENUE_TEMP` | FLOAT | Desc: Doanh thu tạm thời liên quan đến yêu cầu hoặc giao dịch. | — |
| `REVENUE` | FLOAT | Desc: Doanh thu thực tế liên quan đến yêu cầu hoặc giao dịch. | — |
| `OFFER_TYPE` | STRING | Để phân biệt user được giải ngân thuộc ACL hay CLX, chỉ áp dụng cho lending_mp_homecredit | — |
| `SERVICE_TYPE` | STRING | <p>Để phân biệt dịch vụ CRO hoặc CLO</p><p>luôn có thêm điều kiện cột này = 'CLO' </p> | — |

## Memory
*9 entries — user-trained knowledge*

1. Số giải ngân (disbursed amount) được tính bằng cột CONTRACT_AMOUNT trong bảng momovn-prod.BU_FI.FIS_TCST. _BU-FS: FI Solutions · 2025-08-13_
2. Khi người dùng hỏi về 'home', 'FE', 'CRO', hoặc 'VIB', hãy sử dụng PARTNER_ID tương ứng: 'home' -> 'lending_mp_homecredit', 'FE' -> 'clo_fecredit', 'CRO' -> 'cro_vib', 'VIB' -> 'cro_vib' _FS - FI Solutions · 2025-08-13_
3. Khi xử lý vấn đề liên quan tới việc loại trừ user_id, sử dụng điều kiện 'where not exists' thay vì 'user_id NOT IN' _2025-09-24_
4. Khi so sánh lượng application submitted, cần sử dụng status_code bao gồm: 'APPLICATION_CANCELED', 'APPLICATION_REJECTED', 'APPLICATION_APPROVED', 'APPLICATION_RESUBMIT', 'APPLICATION_SUBMITTED', 'DISBURSED', 'CONTRACT_SIGNED', 'RESET' _2025-08-20_
5. New user = Người dùng mới phát sinh giao dịch lần đầu. Retention user = Người dùng đã từng dùng dịch vụ trước đó và tiếp tục dùng trong tháng này. Reactive user = Người dùng từng dùng trước đây, rớt trong các tháng gần đây, nay quay lại dùng. Churn user = Người dùng ngưng sử dụng trong tháng. _2025-10-13_
6. Để tính tổng số tiền giải ngân cho dịch vụ CLO, sử dụng CONTRACT_AMOUNT thay vì DISBURSED_CREDIT_AMOUNT _FS - FI Solutions · 2025-07-17_
7. Trong bảng momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW, sử dụng cột VALUE để lọc theo đối tác thay vì PARTNER_ID _2025-11-25_
8. Khi truy vấn số liệu giải ngân, luôn thêm điều kiện service_type = 'CLO' _FS - FI Solutions · 2025-08-13_
9. Khi tính trung bình CONTRACT_AMOUNT, sử dụng sum(CONTRACT_AMOUNT)/count(distinct ticket_id) thay vì AVG(CONTRACT_AMOUNT) _2025-09-23_
