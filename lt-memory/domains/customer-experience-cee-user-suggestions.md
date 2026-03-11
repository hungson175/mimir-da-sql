# Customer Experience: CEE USER SUGGESTIONS

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `20e405eb-5b2b-4a23-bacc-35196c4e707d`

## Description
The dataset records information about user suggestions received through Feedback Feature in all CS channel

## Tables

### `momovn-cee-shared.CEE_MAIL.FF_CONTENTS_V2`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `created_date` | DATE | Ngày ghi nhận ticket được tạo | — |
| `bu` | STRING | Business Unit được phân cho ticket | — |
| `service_plus` | STRING | Phân loại dịch vụ góp ý | — |
| `ticket_id` | STRING | mã phản ánh / ID của ticket | — |
| `source` | STRING | Nguồn gửi góp ý | — |
| `level2` | STRING | Level 2 của ticket góp ý | — |
| `level3` | STRING | Level 3 của ticket góp ý | — |
| `category` | STRING | Phân loại category góp ý | — |
| `contents` | STRING | Nội dung góp ý của khách hàng kèm Ticket ID | — |

## Memory
*6 entries — user-trained knowledge*

1. Khi được yêu cầu tóm tắt nội dung, hay lấy ngẫu nhiên các contents khoảng 50 dòng, NO LIMIT 10. Rồi đọc các contents sau đó mới tóm tắt _CEE USER SUGGESTIONS · 2025-06-24_
2. Khi được hỏi về tổng quát, nhận định. Thì hãy lấy toàn bộ thông tin trong cột contents của bu đó. Sao đó đọc và đưa ra tổng quát, nhận định _CEE USER SUGGESTIONS · 2025-05-21_
3. Không có thông tin về agent_id và request_id trong bảng ghi nhận góp ý của người dùng _CEE USER SUGGESTIONS · 2025-05-21_
4. Dữ liệu chỉ chứa thông tin về góp ý của người dùng, không có thông tin về ticket và CSAT của dịch vụ _CEE USER SUGGESTIONS · 2025-05-21_
5. Khi user hỏi data từ nguồn ứng dụng thì lấy source = 'FAQs', không phải 'Feedback Feature' _CEE USER SUGGESTIONS · 2025-05-30_
6. Dữ liệu có trong cột `bu`:
Cinema
MoMo Reward + Student Pass
SOF
VTTI Billpay - VTTI Public service
Chi hộ vay tiêu dùng
Thu hộ vay tiêu dùng
Donation
Quỹ nhóm
Túi Thần Tài
QR nhận tiền
Quản lý tài khoản
Bank Partnership
Online Payments
Quản lý chi tiêu
Chuyển tiền đến Ngân hàng
Xác thực ví
Chuyển/nhận tiền Ví - Ví và các dịch vụ khác
Quản lý Ví & Phản ánh lừa đảo
Marketing Platform
OTA
Promotion
Mua Bảo hiểm & Thanh toán Bảo hiểm
VTTI Data - VTTI Airtime
Hạn mức ví
Hủy Ví
Lịch sử/ chi tiết giao dịch
EPS
Chứng khoán
SPS
Điểm tin cậy MoMo
CCM
Tiết kiệm online
App performance
---
Dữ liệu có trong cột `level2`:
Du Lịch - Đi Lại
Tính Năng
VTTI
Tài Chính - Bảo Hiểm
Chuyển Nhận Tiền
Tài Khoản
Liên Kết/ Nạp Rút Ngân Hàng
Payment Online - Digital Platform
Quản lý chi tiêu
Chương Trình Khuyến Mãi
Payment Offline - Miniapp MoMo
Merchant Care
----
Lưu ý: Nếu bị hỏi thông tin bên ngoài các giá trị này thì phải confirm lại với user, và suggest user các dịch vụ liên quan. _CEE USER SUGGESTIONS · 2025-05-21_
