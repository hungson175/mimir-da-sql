# Domain: BU FS: FI Solutions

## Identity
- **Domain ID:** `5cd09ae2-90b8-4102-a717-0ae6f649ff69`
- **Description:** Data về traffic và giải ngân của sản phẩm CLO và giao dịch thanh toán khoản vay, thanh toán thẻ tín dụng
- **Tables:** 3
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW
> <p>Bảng lưu thông tin user truy cập vào sản phẩm CLO theo từng nguồn</p>

| Column | Description | Examples |
|--------|-------------|----------|
| SOURCE | <p>nguồn dẫn user tới truy cập sản phẩm</p> | — |
| VALUE | <p>đối tác của sản phẩm:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>'clo_fecredit' : FE CREDIT</p></li><li class="om-leading-normal"... | — |
| ETL_DATE | <p>ngày người dùng truy cập</p> | — |
| MOMO_SESSION_ID_V2 | <p>định danh cho lượt truy cập của người dùng</p> | — |
| AGENT_ID | <p>định danh mã người dùng</p> | — |

### momovn-prod.BU_FI.FI_TRANS
> <p>Bảng chứa thông tin các giao dịch liên quan tới dịch vụ tài chính: thu chi hộ, thanh toán khoản vay, thanh toán thẻ tín dụng....</p>

| Column | Description | Examples |
|--------|-------------|----------|
| ID | <p>tid / mã định danh của giao dịch</p> | — |
| DATE_PARTITION | <p>Thời điểm update cuối cùng của giao dịch.</p><p>Lưu ý, luôn chuyển về múi giờ UTC +7 khi sử dụng cột này</p> | — |
| _DATE_PARTITION | <p>Thời điểm update cuối cùng của giao dịch.</p><p>Lưu ý, luôn chuyển về múi giờ UTC +7 khi sử dụng cột này</p> | — |
| FUNDID | <p>Nguồn tiền của giao dịch:</p><p>1      Nguồn tiền momo</p><p>2	Nguồn tiền ngân hàng liên kết</p><p>3	Nguồn tiền napas</p><p>4	Nguồn tiền visa debit... | — |
| SERVICE_CODE | <p>Dịch vụ của giao dịch<br></p> | — |
| USER_PAYMENT | <p>Agent_id thực hiện giao dịch	</p> | — |
| DEBITOR | <p>bỏ qua cột này</p> | — |
| CREDITOR | <p>bỏ qua cột này</p> | — |
| INITIATOR | <p>bỏ qua cột này</p> | — |
| TRANS_TYPE | <p>Loại giao dịch</p> | — |
| EWALLET_TYPEID | <p>bỏ qua cột này</p> | — |
| STATUSID | <p>Trạng thái giao dịch (2 là thành công, 6 là thất bại)	</p><p>nếu user không đề cập gì tới trạng thái giao dịch thì luôn mặc định hiểu là giao dịch ... | — |
| AMOUNT | <p>Số tiền của giao dịch</p> | — |
| PARENTID | <p>bỏ qua cột này</p> | — |
| AGENT_CREDIT | <p>Agentid của tài khoản được cộng tiền	</p> | — |
| AGENT_DEBIT | <p>Agentid của tài khoản bị trừ tiền	</p> | — |
| RESULT | <p>Mã lỗi của core	</p> | — |
| TOTAL_AMOUNT | <p>Tổng giá trị bill (không tính chiết khấu)	</p> | — |
| MM_AMOUNT | <p>Số tiền thực trả của user</p> | — |
| VC_AMOUNT | <p>Số tiền được giảm trừ từ voucher	</p> | — |
| FEE | <p>Số tiền thu phí dịch vụ	</p> | — |
| SERVICE_GROUP | <p>ID của nhóm dịch vụ của giao dịch:</p><p>1 : dịch vụ thanh toán</p><p>2: dịch vụ chuyển tiền</p><p>3: nộp tiền từ bank vào ví momo</p><p>4: rút tiề... | — |
| USER_TYPE_NAME | <p>bỏ qua cột này</p> | — |
| DATE_TRANS | <p>ngày thực hiện giao dịch</p> | — |
| BU_GROUP_CODE_L1 | <p>nhóm dịch vụ l1</p><p>luôn where cột này = 'PAYMENT'</p> | — |
| BU_GROUP_CODE_L2 | <p>nhóm dịch vụ level 2:</p><p>hãy where cột này = 'LOAN COLLECTION' với giao dịch thanh toán khoản vay.</p><p>hãy where cột này = 'CREDIT CARD COLLEC... | — |
| BU_GROUP_CODE_L3 | <p>nhóm dịch vụ level 3:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>FM: giao dịch liên quan tới sản phẩm vay nhanh</p></li><li class... | — |
| BU_GROUP_CODE_L4 | <p>nhóm dịch vụ level 4:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>'COLLECTION' : nhóm dịch vụ thu hộ</p></li><li class="om-leading... | — |
| BU_NAME | <p>bỏ qua cột này</p> | — |
| MERCHANT | <p>tên đối tác</p> | — |
| SERVICE_DESCRIPTION | <p>mô tả cụ thể cho dịch vụ</p> | — |
| BILLID | <p>mã hợp đồng liên quan tới dịch vụ thanh toán </p> | — |
| TYPEID |  | — |
| ERROR_NAME | <p>bỏ qua cột này</p> | — |
| ERROR_NAME_DETAIL | <p>bỏ qua cột này</p> | — |
| SERVICEID |  | — |
| TIME_TRANS |  | — |
| MONEY_SOURCE |  | — |
| TYPE |  | — |
| HOUR_TRANS |  | — |
| PAYMENT_CHANNEL |  | — |
| CB_AMOUNT |  | — |
| BILL_AMOUNT |  | — |
| BILL_DUE |  | — |
| D_DIFF |  | — |
| REPAY_TYPE |  | — |

### momovn-prod.BU_FI.FIS_TCST
> <p>Đây là bảng chứa dữ liệu của sản phẩm CLO. Trong bảng này chứa thông tin về trạng thái của ticket, số tiền giải ngân và doanh thu.</p>

| Column | Description | Examples |
|--------|-------------|----------|
| TICKET_ID | Desc: Mã định danh cho mỗi yêu cầu hoặc giao dịch. Sample value: ['116472', '116487', '116520'] | — |
| USER | Desc: Người dùng thực hiện yêu cầu hoặc giao dịch. Sample value: ['25136673', '36677566', '36940788'] | — |
| PARTNER_ID | <p>Desc: Mã định danh của đối tác liên quan đến yêu cầu hoặc giao dịch.<br>Sample value: ['lending_mp_homecredit']</p><p>định nghĩa :<br>lending_mp_ho... | — |
| FAILED_TIMES | Desc: Số lần yêu cầu hoặc giao dịch thất bại. Sample value: ['nan'] | — |
| STATUS_CODE | Desc: Mã trạng thái của yêu cầu hoặc giao dịch. Sample value: ['PRE_CHECK'] | — |
| DATE_REQUESTED | Desc: Ngày yêu cầu được thực hiện. Sample value: ['2022-11-24'] | — |
| DATETIME_REQUESTED | Desc: Thời điểm yêu cầu được thực hiện. Sample value: ['2022-11-24 00:30:11', '2022-11-24 00:47:15', '2022-11-24 01:39:53'] | — |
| DATE_MODIFIED | Ngày cập nhật trạng thái mới nhất của ticket. Nếu lấy theo trạng thái giải ngân thì dùng cột này | — |
| DATETIME_MODIFIED | Ngày giờ trạng thái mới nhất của ticket | — |
| DATETIME_EXPIRED | **Desc**: Thời điểm yêu cầu hoặc giao dịch được đẩy đi. | — |
| DATETIME_PUSHED | Desc: Thời điểm yêu cầu hoặc giao dịch được đẩy đi. | — |
| SCORING_CODE | Desc: Mã điểm số liên quan đến yêu cầu hoặc giao dịch. | — |
| CORE_ID | Desc: Mã định danh của giao dịch, tương ứng với mã định danh của table core_trans | — |
| OFFER_ID | Desc: Mã định danh của đề nghị liên quan đến yêu cầu hoặc giao dịch. | — |
| ONBOARDING_APPLICATION_ID | Desc: Mã định danh của ứng dụng onboarding liên quan đến yêu cầu hoặc giao dịch. | — |
| ONBOARDING_APPLICATION_STATUS | Desc: Trạng thái của ứng dụng onboarding liên quan đến yêu cầu hoặc giao dịch. | — |
| CONTRACT_ID | Desc: Mã định danh của hợp đồng liên quan đến yêu cầu hoặc giao dịch. | — |
| CONTRACT_NAME | Desc: Tên của hợp đồng liên quan đến yêu cầu hoặc giao dịch. | — |
| CONTRACT_AMOUNT | <p>Desc: Số tiền của hợp đồng liên quan đến yêu cầu hoặc giao dịch.<br>hãy dùng cột này để tính số giải ngân/disbursed</p> | — |
| MINIMAL_CREDIT_AMOUNT | Desc: Số tiền tín dụng tối thiểu liên quan đến yêu cầu hoặc giao dịch. | — |
| MAXIMAL_CREDIT_AMOUNT | Desc: Số tiền tín dụng tối đa liên quan đến yêu cầu hoặc giao dịch. | — |
| REQUESTED_CREDIT_AMOUNT | Desc: Số tiền tín dụng được yêu cầu trong giao dịch. | — |
| APPROVED_CREDIT_AMOUNT | Desc: Số tiền tín dụng được phê duyệt trong giao dịch. | — |
| DISBURSED_CREDIT_AMOUNT | Desc: Số tiền tín dụng đã được giải ngân trong giao dịch. | — |
| REVENUE_TEMP | Desc: Doanh thu tạm thời liên quan đến yêu cầu hoặc giao dịch. | — |
| REVENUE | Desc: Doanh thu thực tế liên quan đến yêu cầu hoặc giao dịch. | — |
| OFFER_TYPE | Để phân biệt user được giải ngân thuộc ACL hay CLX, chỉ áp dụng cho lending_mp_homecredit | — |
| SERVICE_TYPE | <p>Để phân biệt dịch vụ CRO hoặc CLO</p><p>luôn có thêm điều kiện cột này = 'CLO' </p> | — |

## Domain Knowledge (from Mimir)

- Số giải ngân (disbursed amount) được tính bằng cột CONTRACT_AMOUNT trong bảng momovn-prod.BU_FI.FIS_TCST.
- Khi người dùng hỏi về 'home', 'FE', 'CRO', hoặc 'VIB', hãy sử dụng PARTNER_ID tương ứng: 'home' -> 'lending_mp_homecredit', 'FE' -> 'clo_fecredit', 'CRO' -> 'cro_vib', 'VIB' -> 'cro_vib'
- Khi xử lý vấn đề liên quan tới việc loại trừ user_id, sử dụng điều kiện 'where not exists' thay vì 'user_id NOT IN'
- Khi truy vấn số liệu giải ngân, luôn thêm điều kiện service_type = 'CLO'
- Khi tính trung bình CONTRACT_AMOUNT, sử dụng sum(CONTRACT_AMOUNT)/count(distinct ticket_id) thay vì AVG(CONTRACT_AMOUNT)
- Để tính tổng số tiền giải ngân cho dịch vụ CLO, sử dụng CONTRACT_AMOUNT thay vì DISBURSED_CREDIT_AMOUNT
- Trong bảng momovn-prod.BU_FI.FIS_CLO_TRAFFIC_FLOW, sử dụng cột VALUE để lọc theo đối tác thay vì PARTNER_ID
- Khi so sánh lượng application submitted, cần sử dụng status_code bao gồm: 'APPLICATION_CANCELED', 'APPLICATION_REJECTED', 'APPLICATION_APPROVED', 'APPLICATION_RESUBMIT', 'APPLICATION_SUBMITTED', 'DISBURSED', 'CONTRACT_SIGNED', 'RESET'
- New user = Người dùng mới phát sinh giao dịch lần đầu. Retention user = Người dùng đã từng dùng dịch vụ trước đó và tiếp tục dùng trong tháng này. Reactive user = Người dùng từng dùng trước đây, rớt trong các tháng gần đây, nay quay lại dùng. Churn user = Người dùng ngưng sử dụng trong tháng.

## Suggested Probe Questions

- Status: **Not yet probed**
