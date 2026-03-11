# ITC MLBIZ: CREDITTECH

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `cf246f90-8aba-44e5-be6e-d02ddb22b9c1`

## Description
Data các sản phẩm Lending

## Tables

### `momovn-prod.ALEXIS.ALEXIS_LOAN_PAYMENT_PROCESSOR_V2_LOG_SNAPSHOT_20250101_20251013`
> Bảng này lưu trữ thông tin về các giao dịch thanh toán khoản vay qua MoMo từ năm 2025 đến 2027. Dữ liệu này có thể được sử dụng để theo dõi thông tin yêu cầu thanh toán, xác định loại hình sản phẩm vay, và tìm hiểu hành vi người dùng thông qua các giao dịch thanh toán khoản vay.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `event_timestamp` | — | Thời điểm xảy ra sự kiện liên quan đến quá trình xử lý thanh toán khoản vay. | 2025-07-18 08:18:45.247494+00, 2025-04-22 08:15:12.787994+00, 2025-10-04 10:55:10.893095+00 |
| `request_id` | — | ID của yêu cầu xử lý thanh toán khoản vay cụ thể. | 7b138434-6519-44b5-84ed-bdcb6b426eed, f5859f55-7b24-4099-b77f-9c43e1f9d1bd, 72748207304486247_804848 |
| `agent_id` | — | Mã định danh của ví MoMo thực hiện giao dịch thanh toán. | 40469993, 70880646, 38666541 |
| `loan_product_code` | — | Mã của sản phẩm vay được sử dụng trong giao dịch thanh toán. | paylater_lending, finance_lending_evnfc, paylater_credit_card |
| `momo_loan_app_id` | — | ID ứng dụng vay MoMo liên quan đến giao dịch thanh toán. | SL00000121749000, SL00000117088930, SL00000104821609 |
| `product_group` | — | Nhóm sản phẩm của khoản vay liên quan đến giao dịch thanh toán. | PAYLATER, CASH_LOAN |
| `product_id` | — | ID của sản phẩm vay được sử dụng cho giao dịch thanh toán. | paylater_lending, cashloan_fastmoney_evnfc, paylater_credit_card_market |
| `merchant_id` | — | ID của merchant liên quan đến giao dịch thanh toán khoản vay. | amber |
| `timestamp` | — | Thời gian (dạng UNIX) của giao dịch thanh toán khoản vay. | 1747394628742, 1748958531673, 1746032506585 |
| `message_type` | — | Loại thông điệp trong xử lý giao dịch thanh toán. | LOAN_DISBURSEMENT_LOG |
| `message_data` | — | Dữ liệu thông điệp liên quan đến giao dịch thanh toán. | {
  "loanProductCode": "paylater_lending",
  "productId": "paylater_lending",
  "agentId": "19412961",
  "disbursedTime": "1747015778168",
  "loanAmount": 64000.0,
  "totalLoanAmount": 64000.0,
  "coreTransId": "87161088471",
  "paymentStatus": "LOAN_SUCCESS",
  "billId": "26933081_202505",
  "businessPaymentType": "PAYMENT_TYPE_PAYMENT_OR_CAPTURE"
}, {
  "loanProductCode": "paylater_lending",
  "productId": "paylater_lending",
  "agentId": "29607359",
  "disbursedTime": "1747296652041",
  "loanAmount": 7260462.0,
  "totalLoanAmount": 7260462.0,
  "coreTransId": "87506870010",
  "paymentStatus": "LOAN_SUCCESS",
  "billId": "24560552_202505",
  "businessPaymentType": "PAYMENT_TYPE_PAYMENT_OR_CAPTURE"
}, {
  "loanProductCode": "paylater_lending",
  "productId": "paylater_lending",
  "agentId": "57674462",
  "disbursedTime": "1749745407317",
  "loanTenor": 1,
  "loanAmount": 110000.0,
  "totalLoanAmount": 216000.0,
  "coreTransId": "90629897493",
  "paymentStatus": "LOAN_SUCCESS",
  "billId": "57513282_202506",
  "businessPaymentType": "PAYMENT_TYPE_PAYMENT_OR_CAPTURE",
  "accountType": 21
} |
| `screen_order` | — | Thứ tự của màn hình hiển thị trong quá trình giao dịch thanh toán. | 9 |
| `lender_id` | — | ID của người cho vay liên quan đến giao dịch thanh toán khoản vay. | TP_BANK, MBV, VIET_CREDIT |
