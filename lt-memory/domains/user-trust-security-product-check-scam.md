# User Trust: Security Product - Check Scam

**Domain ID:** `4f353121-0b27-437a-9746-e4b8897ad03b`

## Description
Consolidates scam report data from multiple sources (both inside and outside MoMo), including MoMo users, social media, government agencies, and more. 
Provides information on various types of scam-related entities such as MoMo wallet accounts, bank accounts, websites, and others.

## Tables

### `project-5400504384186300846.SHERLOCK.CHECK_SCAM_IDENTIFIER_SEARCH_YYYYMMDD`
> Bảng chứa thông tin kiểm tra các danh tính bị cáo buộc lừa đảo, phục vụ cho việc theo dõi và quản lý các hoạt động gian lận.
- Xác định danh tính của các thực thể có liên quan đến lừa đảo.
- Theo dõi số lượng báo cáo liên quan đến từng danh tính đáng ngờ.
- Quản lý và phân loại nguồn gốc báo cáo cũng như thiệt hại tài chính tiềm năng của từng trường hợp bị cáo buộc lừa đảo.
Table có cấu tạo dạng sharding. Sử dụng _TABLE_SUFFIX để tiến hành truy vấn theo ngày

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `identifier_id` | STRING | ID định danh của danh tính bị cáo buộc lừa đảo. | — |
| `identifier_type` | STRING | Loại danh tính liên quan. | bank, momo, phone |
| `identifier_value` | STRING | Giá trị định danh liên quan, ví dụ như số điện thoại hoặc số tài khoản ngân hàng. | — |
| `identifier_name` | STRING | Tên của danh tính liên quan. | — |
| `identifier_bank_name` | STRING | Tên ngân hàng liên quan đến danh tính liên quan. | MBB, VCB, TCB |
| `identifier_napas_bank_code` | STRING | Mã ngân hàng NAPAS liên quan đến danh tính liên quan. | 970422, 970436, 970416 |
| `report_count` | INTEGER | Số lượng báo cáo liên quan đến danh tính bị cáo buộc. | 1, 2, 3 |
| `source_groups` | STRING | Các nhóm nguồn của báo cáo liên quan đến danh tính bị cáo buộc. | Báo cáo từ cộng đồng, Cơ quan chức năng |
| `amount_loss_range` | STRING | Phạm vi thiệt hại tài chính tiềm năng liên quan đến danh tính bị cáo buộc. | Dưới 5 triệu, Dưới 50 triệu, Dưới 100 triệu |
| `related_identifiers` | RECORD | Các danh tính liên quan đến danh tính bị cáo buộc. | — |
| &nbsp;&nbsp;↳ `identifier_type` | STRING |  | — |
| &nbsp;&nbsp;↳ `identifier_value` | STRING |  | — |
| &nbsp;&nbsp;↳ `identifier_name` | STRING |  | — |
| &nbsp;&nbsp;↳ `identifier_bank_name` | STRING |  | — |
| &nbsp;&nbsp;↳ `identifier_napas_bank_code` | STRING |  | — |
| `report_ids` | STRING | Danh sách các ID báo cáo có liên quan. | REPORT_2bb58b82-9031-447f-b3e2-96878aad7302, REPORT_465f849b-8a93-4ea5-a386-87e993eb0f0f, REPORT_39fdae7c-231d-488d-9f5b-7992478e0f4f |

### `project-5400504384186300846.SHERLOCK.CHECK_SCAM_IDENTIFIER_SEARCH_CHANGE_YYYYMMDD`
> Bảng theo dõi thay đổi thông tin về các định danh nghi ngờ liên quan đến lừa đảo qua các lần tìm kiếm. Mục tiêu và sử dụng chính của bảng này có thể bao gồm: 
 - Theo dõi và phân tích số lượng báo cáo liên quan đến các định danh nghi ngờ để phát hiện hành vi lừa đảo. 
 - Xác định các nhóm nguồn thông tin để cải thiện độ chính xác của việc phát hiện lừa đảo. 
 - Đánh giá và theo dõi các thay đổi về định danh nghi ngờ theo thời gian để tăng cường cảnh báo sớm.
Table có cấu tạo dạng sharding. Sử dụng _TABLE_SUFFIX để tiến hành truy vấn theo ngày

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `identifier_id` | STRING | Mã định danh duy nhất của định danh nghi ngờ. | — |
| `identifier_type` | STRING | Loại định danh nghi ngờ, ví dụ: email, số điện thoại. | — |
| `identifier_value` | STRING | Giá trị của định danh nghi ngờ, ví dụ: địa chỉ email hay số điện thoại cụ thể. | — |
| `identifier_name` | STRING | Tên của định danh nghi ngờ được liệt kê. | — |
| `identifier_bank_name` | STRING | Tên ngân hàng liên kết với định danh nghi ngờ. | — |
| `identifier_napas_bank_code` | STRING | Mã ngân hàng NAPAS của định danh nghi ngờ. | — |
| `report_count` | INTEGER | Tổng số lần định danh nghi ngờ này bị báo cáo. | — |
| `source_groups` | STRING | Nhóm nguồn cung cấp thông tin cho định danh nghi ngờ. | — |
| `amount_loss_range` | STRING | Khoảng giá trị thiệt hại tài chính liên quan đến định danh nghi ngờ. | — |
| `related_identifiers` | RECORD | Thông tin về các định danh liên quan đến định danh nghi ngờ này. | — |
| &nbsp;&nbsp;↳ `identifier_type` | STRING | Loại định danh liên quan đến định danh nghi ngờ. | — |
| &nbsp;&nbsp;↳ `identifier_value` | STRING | Giá trị của định danh liên quan. | — |
| &nbsp;&nbsp;↳ `identifier_name` | STRING | Tên định danh liên quan. | — |
| &nbsp;&nbsp;↳ `identifier_bank_name` | STRING | Tên ngân hàng liên quan đến định danh liên quan. | — |
| &nbsp;&nbsp;↳ `identifier_napas_bank_code` | STRING | Mã ngân hàng NAPAS liên quan đến định danh liên quan. | — |
| `report_ids` | STRING | Danh sách mã của các báo cáo liên quan đến định danh nghi ngờ. | — |
| `change_type` | STRING | Loại thay đổi thông tin về định danh nghi ngờ. | — |
