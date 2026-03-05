# User Trust: Security Product - Report Scam 

**Domain ID:** `8676e18c-ed5e-401e-8e78-fc08b26a69ad`

## Description
This domain stores app-collected user scam reports—incidents in or outside MoMo—with basic context (scenario, channel), loss signals, review status, ... linked to the reporting MoMo user and, when applicable, related MoMo transactions, to support case handling and power Check-Scam features.

## Tables

### `momovn-prod.SHERLOCK.REPORT_SCAM_USER_REPORT_DATA`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `request_id` | STRING | Mã định danh cho mỗi yêu cầu báo cáo lừa đảo. | fd95511b-2b14-4841-8770-1a07b241e469, 6fbf0414-79ec-4131-9e52-6c4da01b82b6, c95b9453-9eef-4367-9683-c0626e212e6e |
| `msg_type` | STRING | Loại tin nhắn liên quan đến báo cáo lừa đảo. | USER_TRUST_APP_SUBMIT_REPORT |
| `user_id` | STRING | Mã định danh người dùng MoMo liên quan đến báo cáo lừa đảo. | 0949093726, 0944047667, 01252659720 |
| `agent_id` | INTEGER | Mã định danh cho mỗi ví MoMo. | 38572968, 82946123, 1658018 |
| `report_id` | STRING | Mã định danh của báo cáo lừa đảo. | REPORT_c6f687f5-562d-4e8d-b52c-52e832798301, REPORT_6e61fe0f-615e-487c-8f5a-895baf4e50a3, REPORT_49a5f4bb-07c8-4e90-9843-e3faa0a49ab7 |
| `scenario_code` | STRING | Mã kịch bản lừa đảo. | S01, S10, S02 |
| `victim_type` | STRING | Loại nạn nhân trong báo cáo lừa đảo. | 1, 7, 3 |
| `loss_amount` | INTEGER | Số tiền bị mất trong vụ lừa đảo. | 0, 500000, 15000 |
| `narrative_text` | STRING | Văn bản mô tả chi tiết về vụ lừa đảo. | QC test, Lừa cọc du lịch, Lừa đảo mua hàng
 |
| `image_url` | STRING | URL của các hình ảnh minh chứng cho báo cáo lừa đảo. | https://attachment.momocdn.net/social/64134398_1763358341_3dabce5552e04363a7099741c4a4621e.jpg, https://attachment.momocdn.net/social/48206338_1764285661_cfebf2a9bfb54c6a9d4cf6b7582b0c6a.jpg, https://attachment.momocdn.net/social/81592789_1762323298_d3a20c16a1264422a9876473da53d08e.jpg |
| `cs_support` | INTEGER | Mã định danh của nhân viên hỗ trợ khách hàng liên quan đến báo cáo. | 1, 0 |
| `reason` | STRING | Lý do của báo cáo lừa đảo. |  |
| `update_by` | STRING | Người dùng cập nhật thông tin báo cáo lừa đảo. |  |
| `status` | STRING | Trạng thái của báo cáo lừa đảo. | process |
| `create_time` | INTEGER | Thời gian tạo báo cáo lừa đảo. | 1764442241579, 1763215584852, 1763208772571 |
| `update_time` | INTEGER | Thời gian cập nhật báo cáo lừa đảo. | 0 |
| `identifier_info` | RECORD | Thông tin định danh liên quan đến giao dịch lừa đảo. | — |
| &nbsp;&nbsp;↳ `tids` | INTEGER | ID của giao dịch bất thường liên quan đến vụ lừa đảo. | 107588065195, 107479625879, 107451184578 |
| &nbsp;&nbsp;↳ `account` | RECORD | Thông tin tài khoản liên quan đến giao dịch lừa đảo. | — |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_id` | STRING | Mã định danh của tài khoản. |  |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_type` | STRING | Loại định danh của tài khoản. | bank |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_value` | STRING | Giá trị định danh của tài khoản. | 050134608681, 0559986105, 0249126489725 |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_name` | STRING | Tên định danh của tài khoản. | 0941807020, NGUYEN HUU THUONG, 811090254589583 |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `bank_code` | STRING | Mã ngân hàng của tài khoản. | 970422, 970416, 970415 |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `bank_name` | STRING | Tên ngân hàng của tài khoản. |  |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `bank_code_napas` | STRING | Mã NAPAS của ngân hàng. |  |
| `identifier_detail` | RECORD | Chi tiết định danh liên quan đến kênh giao dịch lừa đảo. | — |
| &nbsp;&nbsp;↳ `channel` | STRING | Kênh xảy ra giao dịch lừa đảo. | , facebook, điện thoại |
| &nbsp;&nbsp;↳ `occurred_at` | INTEGER | Thời gian xảy ra giao dịch lừa đảo. | 0, 1762275600000, 1763658000000 |
| &nbsp;&nbsp;↳ `account` | RECORD | Thông tin tài khoản liên quan đến kênh giao dịch lừa đảo. | — |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_id` | STRING | Mã định danh của tài khoản trong kênh giao dịch. |  |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_type` | STRING | Loại định danh của tài khoản trong kênh giao dịch. | phone, url |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_value` | STRING | Giá trị định danh của tài khoản trong kênh giao dịch. | 78winc8.mobi, https://www.facebook.com/hotrokhachhang.vnpot, https://linkbio.co/NhanUuDaiViMomo |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `identifier_name` | STRING | Tên định danh của tài khoản trong kênh giao dịch. |  |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `bank_code` | STRING | Mã ngân hàng của tài khoản trong kênh giao dịch. |  |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `bank_name` | STRING | Tên ngân hàng của tài khoản trong kênh giao dịch. |  |
| &nbsp;&nbsp;&nbsp;&nbsp;↳ `bank_code_napas` | STRING | Mã NAPAS của ngân hàng trong kênh giao dịch. |  |
| `app_ver` | INTEGER | Phiên bản ứng dụng MoMo của người dùng báo cáo. | 50003, 42271, 50103 |
| `device_os` | STRING | Hệ điều hành của thiết bị mà người dùng báo cáo sử dụng. | ios, android |
| `device_name` | STRING | Tên thiết bị mà người dùng báo cáo sử dụng. |  |
| `source` | STRING | Nguồn thông tin liên quan đến vụ lừa đảo. | Người dùng Momo, enduser |
| `scenario_name` | STRING | Tên kịch bản lừa đảo. | , tôi mua cây qua bài đăng trên fb và nó kêu tôi cọc cả tiền cây và ship, tôi chỉ cọc 50 và bị nó chăn, 8/100. |
| `accounts` | RECORD | Thông tin tài khoản liên quan đến báo cáo lừa đảo. | — |
| &nbsp;&nbsp;↳ `identifier_id` | STRING | Mã định danh của tài khoản liên quan đến báo cáo. | — |
| &nbsp;&nbsp;↳ `identifier_type` | STRING | Loại định danh của tài khoản liên quan đến báo cáo. | — |
| &nbsp;&nbsp;↳ `identifier_value` | STRING | Giá trị định danh của tài khoản liên quan đến báo cáo. | — |
| &nbsp;&nbsp;↳ `identifier_name` | STRING | Tên định danh của tài khoản liên quan đến báo cáo. | — |
| &nbsp;&nbsp;↳ `bank_code` | STRING | Mã ngân hàng của tài khoản liên quan đến báo cáo. | — |
| &nbsp;&nbsp;↳ `bank_name` | STRING | Tên ngân hàng của tài khoản liên quan đến báo cáo. | — |
| &nbsp;&nbsp;↳ `bank_code_napas` | STRING | Mã NAPAS của ngân hàng liên quan đến báo cáo. | — |
| `lang` | STRING | Ngôn ngữ được sử dụng trong báo cáo lừa đảo. | vi, en |
| `ticket_id` | STRING | Mã định danh của ticket xử lý báo cáo lừa đảo. | , 251119.0005079, 251127.0007297 |
| `user_name` | STRING | Tên người dùng MoMo liên quan đến báo cáo lừa đảo. | Nguyễn Hà My, Lại Đào Hiếu Thảo, Nguyễn Văn Sang |
| `path_CRM` | STRING | Đường dẫn CRM liên quan đến báo cáo lừa đảo. | crm_app/2025/11/25/01697565642_1764069813367.jpg, crm_app/2025/11/14/0979975240_1763116043077.jpg, crm_app/2025/11/19/0368382593_1763556515744.jpg |
