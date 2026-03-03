# Domain: GMC: Manual Account Termination

## Identity
- **Domain ID:** `f1f9aae9-0343-40c9-8e1b-db35889ac849`
- **Description:** Domain chuyên về performance của luồng Hủy ví thủ công ("Đây không phải là tôi") 
- **Tables:** 3
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### project-5400504384186300846.REPORT.GMC_RETENTION_TERMINATE_ACCOUNT_PERFORMANCE
> Bảng dữ liệu trình bày thông tin về hiệu suất của việc giữ chân người dùng khi kết thúc tài khoản ví cũ và chuyển sang ví mới. Đây là một bảng thường được sử dụng để phân tích hành vi người dùng trong quá trình hủy và đăng ký ví mới. Dữ liệu có thể được sử dụng để: 
- Xác định số lượng người dùng đã...

| Column | Description | Examples |
|--------|-------------|----------|
| month | Ngày đầu tiên của tháng quan sát. | 2025-09-01, 2025-08-01, 2025-10-01 |
| week | Ngày đầu tiên của tuần quan sát (tuần bắt đầu từ Thứ hai). | 2025-09-29, 2025-10-13, 2025-10-06 |
| date | Ngày quan sát. | 2025-10-01, 2025-10-03, 2025-09-28 |
| onboarding_screen | ID của user nhìn thấy onboarding screen của luồng hủy ví cũ. | 77096091, 51245074, 67412474 |
| start_terminate | ID của user bắt đầu hủy ví cũ (bấm confirm hủy ví cũ). | 94048819, 108458268, 106413758 |
| authen_init | ID của user bắt xác thực (authenticate) để được hủy ví cũ. | 102064343, 76118558, 69324772 |
| authen_success | ID của user xác thực thành công (authen successfully), đủ điều kiện để hủy ví cũ. | 79191290, 106530748, 104499186 |
| terminate_success | ID của user hủy ví cũ thành công. | 107636719, 108095759, 106183368 |
| register_success | ID của user đăng ký ví mới thành công, sau khi hủy ví cũ. | 106218991, 106215119, 109153944 |
| active_sameday | ID của user giao dịch thành công (make transactions) sau khi đăng ký ví mới thành công, cùng ngày với ngày đăng ký ví mới. | 107067200, 108496849, 107656019 |
| active | ID của user giao dịch thành công (make transactions) sau khi đăng ký ví mới thành công, cùng tháng với tháng đăng ký ví mới. | 109156913, 101819990, 104988079 |

### project-5400504384186300846.REPORT.GMC_RETENTION_TERMINATE_ACCOUNT_ERROR_CHECK_CONDITION
> Bảng chứa thông tin về lỗi trong quá trình hệ thống kiểm tra thông tin user, từ đó xác định xem user có đủ điều kiện để hoàn tất việc hủy ví cũ không. Thông qua bảng này, người dùng có thể: 
- Xác định lý do lỗi liên quan đến ngân hàng liên kết hoặc hệ thống bên trong của MoMo. 
- Theo dõi và phân t...

| Column | Description | Examples |
|--------|-------------|----------|
| date | Ngày phát sinh lỗi. | 2025-09-30, 2025-09-28, 2025-10-09 |
| bank_result | Mã lỗi liên quan đến dữ liệu ngân hàng liên kết (bank) của user. | 0, -1006, 9031 |
| core_result | Mã lỗi liên quan đến hệ thống core của MoMo. | 0_1, 0, 0_0 |
| score_result | Mã lỗi liên quan đến hệ thống backend của MoMo. | 0, 1006 |
| agentid | ID của user. | 103425130, 101721827, 105050461 |

### project-5400504384186300846.REPORT.GMC_RETENTION_TERMINATE_ACCOUNT_ERROR_AUTHEN
> Bảng chứa thông tin về lỗi mà người dùng gặp phải khi thực hiện xác thực (authenticate) trước khi đủ điều kiện để hủy ví cũ. Thông tin từ bảng này có thể sử dụng để: 
- Theo dõi và phân tích các lỗi xác thực phổ biến mà người dùng gặp phải.
- Đánh giá và cải thiện quy trình xác thực người dùng.
- Xá...

| Column | Description | Examples |
|--------|-------------|----------|
| date | Ngày quan sát. | 2025-04-07, 2025-10-12, 2025-09-28 |
| action | Hành động mà người dùng đã thực hiện khi xác thực (authenticate). | OCR_FRONT, OCR_ONE_SIDE, EKYC_CONFIRM, ADD_COMPARE_FACE |
| ms_code | Mã lỗi xảy ra khi người dùng thực hiện một hành động xác thực (authenticate), 0 là không có lỗi. | 635, 819, 619 |
| agentid | ID của người dùng. | 77096091, 53645360, 53662190 |

## Suggested Probe Questions

- Status: **Not yet probed**
