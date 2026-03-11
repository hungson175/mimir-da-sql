# BU FS: FI Solutions (CLO)

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections.

**Domain ID:** `5cd09ae2-90b8-4102-a717-0ae6f649ff69`

## Description
Mô Tả Chi Tiết Domain
Data về traffic và giải ngân của sản phẩm CLO và giao dịch thanh toán khoản vay, thanh toán thẻ tín dụng

## Tables (3 tables)

### `momovn-prod.BU_FI.FIS_TCST`
> <p>Đây là bảng chứa dữ liệu của sản phẩm CLO. Trong bảng này chứa thông tin về trạng thái của ticket, số tiền giải ngân và doanh thu.</p>

| Column | Type | Description |
|--------|------|-------------|
| `ticket_id` | string | Desc: Mã định danh cho mỗi yêu cầu hoặc giao dịch. Sample value: ['116472', '116487', '116520'] |
| `user` | string | Desc: Người dùng thực hiện yêu cầu hoặc giao dịch. Sample value: ['25136673', '36677566', '36940788'] |
| `partner_id` | string | <p>Desc: Mã định danh của đối tác liên quan đến yêu cầu hoặc giao dịch.<br>Sample value: ['lending_mp_homecredit']</p><p>định nghĩa :<br>lending_mp_homecredit : Home Credit<br>cro_vib : VIB<br>clo_fecredit: FE CREDIT</p><p>clo_mcredit: MCREDIT</p> |
| `failed_times` | string | — |
| `status_code` | string | Desc: Mã trạng thái của yêu cầu hoặc giao dịch. Sample value: ['PRE_CHECK'] |
| `date_requested` | date | Desc: Ngày yêu cầu được thực hiện. Sample value: ['2022-11-24'] |
| `datetime_requested` | datetime | Desc: Thời điểm yêu cầu được thực hiện. Sample value: ['2022-11-24 00:30:11', '2022-11-24 00:47:15', '2022-11-24 01:39:53'] |
| `date_modified` | date | Ngày cập nhật trạng thái mới nhất của ticket. Nếu lấy theo trạng thái giải ngân thì dùng cột này |
| `datetime_modified` | datetime | Ngày giờ trạng thái mới nhất của ticket |
| `datetime_expired` | datetime | **Desc**: Thời điểm yêu cầu hoặc giao dịch được đẩy đi. |
| `datetime_pushed` | datetime | Desc: Thời điểm yêu cầu hoặc giao dịch được đẩy đi. |
| `scoring_code` | string | Desc: Mã điểm số liên quan đến yêu cầu hoặc giao dịch. |
| `core_id` | string | Desc: Mã định danh của giao dịch, tương ứng với mã định danh của table core_trans |
| `offer_id` | string | Desc: Mã định danh của đề nghị liên quan đến yêu cầu hoặc giao dịch. |
| `onboarding_application_id` | string | Desc: Mã định danh của ứng dụng onboarding liên quan đến yêu cầu hoặc giao dịch. |
| `onboarding_application_status` | string | Desc: Trạng thái của ứng dụng onboarding liên quan đến yêu cầu hoặc giao dịch. |
| `contract_id` | string | Desc: Mã định danh của hợp đồng liên quan đến yêu cầu hoặc giao dịch. |
| `contract_name` | string | Desc: Tên của hợp đồng liên quan đến yêu cầu hoặc giao dịch. |
| `contract_amount` | string | — |
| `minimal_credit_amount` | string | — |
| `maximal_credit_amount` | string | — |
| `requested_credit_amount` | string | — |
| `approved_credit_amount` | string | — |
| `disbursed_credit_amount` | string | — |
| `revenue_temp` | string | — |
| `revenue` | string | — |
| `offer_type` | string | Để phân biệt user được giải ngân thuộc ACL hay CLX, chỉ áp dụng cho lending_mp_homecredit |
| `service_type` | string | <p>Để phân biệt dịch vụ CRO hoặc CLO</p><p>luôn có thêm điều kiện cột này = 'CLO' </p> |
| `product_offer` | string | — |

### `momovn-prod.BU_FI.FIS_CLO_CHANGE_STATUS`
> Schema from BQ INFORMATION_SCHEMA (2026-03-11)

| Column | Type | Description |
|--------|------|-------------|
| `partner_id` | STRING | — |
| `ticket_id` | STRING | — |
| `user` | STRING | — |
| `status_code` | STRING | — |
| `date` | DATE | — |
| `init_date` | DATE | — |
| `offer_approved` | INT64 | — |
| `application_rejected` | INT64 | — |
| `disbursed` | INT64 | — |

### `momovn-prod.BU_FI.FI_TRANS`
> <p>Bảng chứa thông tin các giao dịch liên quan tới dịch vụ tài chính: thu chi hộ, thanh toán khoản vay, thanh toán thẻ tín dụng....</p>

| Column | Type | Description |
|--------|------|-------------|
| `ID` | string | <p>tid / mã định danh của giao dịch</p> |
| `DATE_PARTITION` | string | <p>Thời điểm update cuối cùng của giao dịch.</p><p>Lưu ý, luôn chuyển về múi giờ UTC +7 khi sử dụng cột này</p> |
| `_DATE_PARTITION` | timestamp | <p>Thời điểm update cuối cùng của giao dịch.</p><p>Lưu ý, luôn chuyển về múi giờ UTC +7 khi sử dụng cột này</p> |
| `FUNDID` | string | <p>Nguồn tiền của giao dịch:</p><p>1      Nguồn tiền momo</p><p>2	Nguồn tiền ngân hàng liên kết</p><p>3	Nguồn tiền napas</p><p>4	Nguồn tiền visa debit</p><p>5	Nguồn tiền visa credit</p><p>6	Túi thần tài</p><p>7	Paylater</p><p>8	Cashback</p><p>9	Nguồn tiền thẻ visa ảo ccm </p><p>10	BNPL</p><p>11	N... |
| `SERVICE_CODE` | string | <p>Dịch vụ của giao dịch<br></p> |
| `USER_PAYMENT` | string | <p>Agent_id thực hiện giao dịch	</p> |
| `DEBITOR` | string | <p>bỏ qua cột này</p> |
| `CREDITOR` | string | <p>bỏ qua cột này</p> |
| `INITIATOR` | string | <p>bỏ qua cột này</p> |
| `TRANS_TYPE` | string | <p>Loại giao dịch</p> |
| `EWALLET_TYPEID` | string | <p>bỏ qua cột này</p> |
| `STATUSID` | string | <p>Trạng thái giao dịch (2 là thành công, 6 là thất bại)	</p><p>nếu user không đề cập gì tới trạng thái giao dịch thì luôn mặc định hiểu là giao dịch thành công </p> |
| `AMOUNT` | string | <p>Số tiền của giao dịch</p> |
| `PARENTID` | string | <p>bỏ qua cột này</p> |
| `AGENT_CREDIT` | string | <p>Agentid của tài khoản được cộng tiền	</p> |
| `AGENT_DEBIT` | string | <p>Agentid của tài khoản bị trừ tiền	</p> |
| `RESULT` | string | <p>Mã lỗi của core	</p> |
| `TOTAL_AMOUNT` | string | <p>Tổng giá trị bill (không tính chiết khấu)	</p> |
| `MM_AMOUNT` | string | <p>Số tiền thực trả của user</p> |
| `VC_AMOUNT` | string | <p>Số tiền được giảm trừ từ voucher	</p> |
| `FEE` | string | <p>Số tiền thu phí dịch vụ	</p> |
| `SERVICE_GROUP` | string | <p>ID của nhóm dịch vụ của giao dịch:</p><p>1 : dịch vụ thanh toán</p><p>2: dịch vụ chuyển tiền</p><p>3: nộp tiền từ bank vào ví momo</p><p>4: rút tiền từ momo về bank</p><p>10: dịch vụ giải ngân<br></p> |
| `USER_TYPE_NAME` | string | <p>bỏ qua cột này</p> |
| `DATE_TRANS` | date | <p>ngày thực hiện giao dịch</p> |
| `BU_GROUP_CODE_L1` | string | <p>nhóm dịch vụ l1</p><p>luôn where cột này = 'PAYMENT'</p> |
| `BU_GROUP_CODE_L2` | string | <p>nhóm dịch vụ level 2:</p><p>hãy where cột này = 'LOAN COLLECTION' với giao dịch thanh toán khoản vay.</p><p>hãy where cột này = 'CREDIT CARD COLLECTION' với giao dịch thanh toán thẻ tín dụng.</p><p>hãy where cột này = 'PAYOUT' với giao dịch chi hộ.</p> |
| `BU_GROUP_CODE_L3` | string | <p>nhóm dịch vụ level 3:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>FM: giao dịch liên quan tới sản phẩm vay nhanh</p></li><li class="om-leading-normal"><p>BANK: giao dịch liên quan tới các ngân hàng</p></li><li class="om-leading-normal"><p>FINCOS: giao dịch liên quan tới các tổ... |
| `BU_GROUP_CODE_L4` | string | <p>nhóm dịch vụ level 4:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>'COLLECTION' : nhóm dịch vụ thu hộ</p></li><li class="om-leading-normal"><p>'DISBURSEMENT': nhóm dịch vụ chi hộ</p></li></ul><p></p> |
| `BU_NAME` | string | <p>bỏ qua cột này</p> |
| `MERCHANT` | string | <p>tên đối tác</p> |
| `SERVICE_DESCRIPTION` | string | <p>mô tả cụ thể cho dịch vụ</p> |
| `BILLID` | string | <p>mã hợp đồng liên quan tới dịch vụ thanh toán </p> |
| `TYPEID` | string | — |
| `ERROR_NAME` | string | <p>bỏ qua cột này</p> |
| `ERROR_NAME_DETAIL` | string | <p>bỏ qua cột này</p> |
| `SERVICEID` | string | — |
| `MONEY_SOURCE` | string | — |
| `TYPE` | string | — |
| `HOUR_TRANS` | string | — |
| `payment_channel` | string | — |
| `CB_AMOUNT` | string | — |
| `bill_amount` | string | — |
| `bill_due` | date | — |
| `d_diff` | string | — |
| `repay_type` | string | — |
| `create_datetime` | datetime | — |
| `fis_dash` | string | — |

## Memory (from DA review)

- Số giải ngân (disbursed amount) được tính bằng cột CONTRACT_AMOUNT (không phải DISBURSED_CREDIT_AMOUNT) trong bảng momovn-prod.BU_FI.FIS_TCST.
- Khi người dùng hỏi về 'home', 'FE', 'CRO', hoặc 'VIB', hãy sử dụng PARTNER_ID tương ứng: 'home' -> 'lending_mp_homecredit', 'FE' -> 'clo_fecredit', 'CRO' -> 'cro_vib', 'VIB' -> 'cro_vib'
- Khi xử lý vấn đề liên quan tới việc loại trừ user_id, sử dụng điều kiện 'where not exists' thay vì 'user_id NOT IN'
- Khi so sánh lượng application submitted, cần sử dụng status_code bao gồm: 'APPLICATION_CANCELED', 'APPLICATION_REJECTED', 'APPLICATION_APPROVED', 'APPLICATION_RESUBMIT', 'APPLICATION_SUBMITTED', 'DISBURSED', 'CONTRACT_SIGNED', 'RESET'
- New user = Người dùng mới phát sinh giao dịch lần đầu. Retention user = Người dùng đã từng dùng dịch vụ trước đó và tiếp tục dùng trong tháng này. Reactive user = Người dùng từng dùng trước đây, rớt trong các tháng gần đây, nay quay lại dùng. Churn user = Người dùng ngưng sử dụng trong tháng.
- Trong bảng momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW, sử dụng cột VALUE để lọc theo đối tác thay vì PARTNER_ID
- Khi truy vấn số liệu giải ngân, luôn thêm điều kiện service_type = 'CLO'
- Khi tính trung bình CONTRACT_AMOUNT, sử dụng sum(CONTRACT_AMOUNT)/count(distinct ticket_id) thay vì AVG(CONTRACT_AMOUNT)
- Table momovn-prod.BU_FI.FI_TRANS chứa tất cả thông tin transaction của dịch vụ thu chi hộ :
BU_GROUP_CODE_L1 = 'PAYMENT' - lấy tất cả các trans thuộc dịch vụ thu hộ

BU_GROUP_CODE_L2 = 'LOAN COLLECTION' - transaction thuộc dịch vụ thu hộ khoản vay
BU_GROUP_CODE_L2 = 'CREDIT CARD COLLECTION' - transaction thuộc dịch vụ thu hộ thẻ tín dụng
BU_GROUP_CODE_L2 = 'PAYOUT' - transaction thuộc dịch vụ chi hộ

BU_GROUP_CODE_L3 = 'FINCOS' - transaction thuộc dịch vụ thu hộ của các công ty tài chính
BU_GROUP_CODE_L3 = 'BANK' - transaction thuộc dịch vụ thu hộ ngân hàng 
BU_GROUP_CODE_L3 = 'OTHERS' - transaction thuộc dịch vụ thu hộ giấy phép cầm đồ
BU_GROUP_CODE_L3 = 'FM' - transaction thuộc dịch vụ thu hộ Vay Nhanh

BU_GROUP_CODE_L4 = 'DISBURSEMENT' - transaction thuộc dịch vụ chi hộ
BU_GROUP_CODE_L4 = 'COLLECTION' - trasaction thuộc dịch vụ thu hộ 
BU_GROUP_CODE_L4 in ('DISBURSEMENT_VAY+','DISBURSEMENT_BANK) dịch vụ này không còn nữa

statusid = 2 thành công
statusid =6 thất bại

service_group = 1 - transaction thuộc dịch vụ thu hộ
service_group in (10,'null') - transaction thuộc dịch vụ chi hộ
service_group = 5 - transaction thu phí

type = 'App MoMo' - user thanh toán dịch vụ trên app MoMo
type = 'Paygate' - user thanh toán dịch vụ trên app nhà đối tác nhưng chọn kênh thanh toán là MoMo

note : khi lấy những case chi hộ, nên filter thêm trans_type in ('transfer','cardcashout_fi','disburse','billpay','m4bpay','cardcashout_disburse')

Thông tin về merchant nằm trong sheet này : https://docs.google.com/spreadsheets/d/1QI6YIIRT4fttWW5IHCP6XISLmGa3MFEmxSVe1CMziq8/edit?gid=0#gid=0
=> lấy data về ttkv ttttd
AND BU_GROUP_CODE_L2 in ('LOAN COLLECTION', 'CREDIT CARD COLLECTION')
AND STATUSID = 2
AND SERVICE_GROUP = 1
=> lấy nhanh về data loại trừ vay nhanh + ccm: fis_dash in ('loan', 'card')
- Bảng momovn-prod.BU_FI.FIS_TCST lưu tất cả thông tin khoản vay của user khi vào luồng và có submit để check offer:

Các column hay cần thiết:
ticket_id: mã định danh của khoản vay   
partner_id: định danh đối tác   
status_code: status cuối cùng của khoản vay tính tại thời điểm T-1  (quan trọng) 
date_requested: thời gian submit offer      
date_modified: thời gian update cuối cùng của ticket               
core_id: tid giao dịch ghi nhận rev               
contract_id: mã hợp đồng khi được giải ngân
contract_amount: số tiền giải ngân     
revenue: doanh thu (CRO không dùng cột này)
offer_type: phân biệt loại user (new/reloan)    

Lưu ý: 
- user vào luồng + out WL không thuộc bảng này      
- mỗi khi lên luồng mới, sẽ có tình trạng thay đổi status_code và có khả năng cùng tên status nhưng khác ý nghĩa => contact chị ngoc.nguyen18 để hỏi
- đối với Home, lấy user đã giải ngân gồm CONTRACT_SIGNED, DISBURSED. Còn lại lấy mỗi DISBURSED.
- Bảng momovn-prod.BU_FI.FIS_CLO_CHANGE_STATUS dùng:
- xem offer_approved, offer_reject, app_approved, app_reject tại đúng thời điểm của ticket (khác với bảng momovn-prod.BU_FI.FIS_TCST chỉ lấy xem được status cuối)
- mục đích: tính offer rate và approval rate, cách tính hiện tại:
+ offer_rate = OFFER_APPROVED / (OFFER_APPROVED + OFFER_REJJECT)
+ approval rate = APPLICATION_APPROVED / (APPLICATION_APPROVED +APPLICATION_REJJECT)
=> Đây là cách tính tối ưu nhất dựa vào data hiện tại có, sau này cần tính lại theo công thức APPROVED/ SUBMITTED (data này đang request kéo lên BQ)
