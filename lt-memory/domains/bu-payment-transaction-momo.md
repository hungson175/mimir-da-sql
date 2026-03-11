# BU Payment: Transaction MoMo

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `e5beb7b6-4273-47ff-9755-a5bcf8d51b97`

## Description
Lưu trữ thông tin cơ bản các giao dịch của ví điện tử MoMo

## Tables

### `project-5400504384186300846.REPORT.DAILY_PAID_USER_TRANS_VER2`
> Bảng báo cáo hằng ngày thống kê giao dịch đã thanh toán của người dùng MoMo trong thời gian thực, bao gồm thông tin mã dịch vụ, mã merchant, phân nhóm dịch vụ và các chỉ số doanh thu theo từng ngày. 

Dữ liệu có thể được dùng để:
- Phân tích xu hướng tiêu dùng và đánh giá doanh thu theo nhóm dịch vụ (GAME, RETAIL, FNB...) và kênh phân phối (ONLINE/OFFLINE)
- Giám sát hiệu quả của các dự án đặc biệt (SPECIALPROJECT) và chiến dịch quảng cáo ADS PAYMENT
- Tính toán KPI định kỳ (theo ngày/tháng) cho từng loại hình USER_TYPE, BUSINESS UNIT, hoặc mức độ merchant (KEY_MERCHANT)Bảng báo cáo hằng ngày thống kê giao dịch đã thanh toán của người dùng MoMo trong thời gian thực, bao gồm thông tin mã dịch vụ, mã merchant, phân nhóm dịch vụ và các chỉ số doanh thu theo từng ngày. 

Dữ liệu có thể được dùng để:
- Phân tích xu hướng tiêu dùng và đánh giá doanh thu theo nhóm dịch vụ (GAME, RETAIL, FNB...) và kênh phân phối (ONLINE/OFFLINE)
- Giám sát hiệu quả của các dự án đặc biệt (SPECIALPROJECT) và chiến dịch quảng cáo ADS PAYMENT
- Tính toán KPI định kỳ (theo ngày/tháng) cho từng loại hình USER_TYPE, BUSINESS UNIT, hoặc mức độ merchant (KEY_MERCHANT)

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `REFERENCE` | FLOAT | Số tham chiếu giao dịch, giá trị tương ứng với mỗi giao dịch của người dùng trong ngàySố tham chiếu giao dịch, giá trị tương ứng với mỗi giao dịch của người dùng trong ngày | 58549008, 68338427, 68338219 |
| `user_payment` | FLOAT | Mã định danh người dùng. Các tên khác như user_id, agent_idMã định danh người dùng. Các tên khác như user_id, agent_id | 58944053, 50036002, 14649916 |
| `TRANS_DATE` | DATE | Ngày giao dịch được ghi nhận dạng DATE, tối đa hằng ngày theo múi giờ Việt NamNgày giao dịch được ghi nhận dạng DATE, tối đa hằng ngày theo múi giờ Việt Nam | 2026-01-20, 2025-12-01, 2026-01-19 |
| `SERVICE_CODE` | STRING | Mã kỹ thuật định danh dịch vụ/merchant lúc giao dịchMã kỹ thuật định danh dịch vụ/merchant lúc giao dịch (ví dụ mã nạp tiền game, mã thanh toán trực tuyến) | u2u, cardcashout.balvccb_cashout, vms2.airtime |
| `USER_TYPE` | STRING | Loại ví tham gia giao dịch, ví dụ EWALLET BANK: ví kết nối ngân hàngLoại ví tham gia giao dịch. EWALLET BANK: ví kết nối ngân hàng; nhận giá trị cố định này trong bản sample | EWALLET BANK, OTHERS, EWALLET NON-BANK |
| `SERVICEID` | STRING | Mã phiên bản/ID cụ thể của dịch vụ trong hệ thốngMã phiên bản/ID cụ thể của dịch vụ trong hệ thống (phiên bản KABP, Momo Game, M2M...) | banklink_cashin, transfer_p2b_scan_vietqr, transfer_p2b |
| `VALUE_TRANS` | FLOAT | Tổng giá trị tiền giao dịch (VNĐ) đối với nhóm giao dịch đang định danh ngày hôm đóTổng giá trị tiền giao dịch (VNĐ) đối với nhóm giao dịch đang định danh ngày hôm đó  **Sample value**:200000.0, 19500.0, 97400.0 | 100000, 50000, 10000 |
| `NUMBER_TRANS` | INTEGER | Số lượng giao dịch được nhóm theo ngày, service, merchant... trong cùng 1 cellSố lượng giao dịch được nhóm theo ngày, service, merchant... trong cùng 1 cell  **Sample value**:2, 1 | 1, 2, 3 |
| `MONTH_ACTIVE` | DATE | Ngày đầu tháng mà giao dịch nằm trong kỳ thống kê (MM-01)Ngày đầu tháng mà giao dịch nằm trong kỳ thống kê (MM-01)  **Sample value**:2023-02-01 | 2026-01-01, 2025-12-01, 2025-11-01 |
| `GROUP_CODE_L1` | STRING | Nhóm cấp 1 của dịch vụ, xác định nghiệp vụ chính ví tiềnNhóm cấp 1 của dịch vụ, xác định nghiệp vụ chính ví tiền | CASHIN, PAYMENT, TRANSFER |
| `SERVICE_DESCRIPTION` | STRING | Mô tả giao dịch bằng chữ hướng dẫn người đọc hiểu merchant/dịch vụ nào được sử dụngMô tả giao dịch bẳng chữ hướng dẫn người đọc hiểu merchant/dịch vụ nào được sử dụng  **Sample value**:THU HỘ WEB HTTPS://PAY.VMGE.VN/, LOTTE - LOTTE MART, FACEBOOK | CHUYỂN TIỀN U2U, BANK CASH IN VIETCOMBANK, CASHIN TỪ MB BANK |
| `BU_NAME` | STRING | Tên Business Unit quản lý dịch vụ theo sự giám sát của công tyTên Business Unit quản lý dịch vụ (BU_DLS, BU_SDK...) theo sự giám sát của công ty  **Sample value**:BU_DLS | BU_BANK, BU_P2P, BU_DLS |
| `MERCHANT` | STRING | Tên thương hiệu/hoặc merchant thật sự dịch vụ đang truy vấnTên thương hiệu/hoặc merchant thật sự dịch vụ đang truy vấn  **Sample value**:VMGE, LOTTE MART, FACEBOOK | P2P, VIETCOMBANK, MB BANK |
| `KEY_MERCHANT_2` | STRING | Phân nhóm merchant cấp 2 để báo cáo chiến lượcPhân nhóm merchant cấp 2 để báo cáo chiến lược (ECOMMERCE, RETAIL...); những giá trị để null ở sample này tương ứng khi không nằm trong nhóm trọng yếu  **Sample value**:ECOMMERCE | ECOMMERCE, TELECOM_ULTILITIES, MAPS |
| `KEY_MERCHANT_3` | STRING | Chi tiết key merchant mức 3 phân tích hiệu quả định kỳChi tiết key merchant mức 3 (FACEBOOK...) phân tích hiệu quả định kỳ  **Sample value**:FACEBOOK | U2U, TOPUP TELECOM, APPLE |
| `BU_GROUP_CODE_L1` | STRING | Nhóm cấp 1 của đơn vị kinh doanh phục vụ phân tích định kỳ KPI và doanh thuNhóm cấp 1 của đơn vị kinh doanh (TOPBRAND ONLINE, SME OFFLINE, TOPBRAND OFFLINE) phục vụ phân tích định kỳ KPI và doanh thu | P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET, TELECOM |
| `BU_GROUP_CODE_L2` | STRING | Nhóm cấp 2 của đơn vị kinh doanh chia nhóm ngành nghềNhóm cấp 2 của đơn vị kinh doanh chia nhóm ngành nghề | PAYLATER, TTT, APPLICATION STORE |
| `BU_GROUP_CODE_L3` | STRING | Nhóm cấp 3 của đơn vị kinh doanh chia nhỏ ngành hộ để dashboard báo cáo hoặc chiến lượcNhóm cấp 3 của đơn vị kinh doanh chia nhỏ ngành hộ để dashboard báo cáo hoặc chiến lược | BANK, LOGISTICS, MOBIFONE |
| `NEWVERTICAL` | STRING | Danh mục vertical mới cấp 1 dùng phân loại nghiệp vụ hiện đại hóaDanh mục vertical mới cấp 1 (GAME, SUPERMARKET, OTA, ...) dùng phân loại nghiệp vụ hiện đại hóa | CASHIN BANK, P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET |
| `NEWVERTICAL_Merchant` | STRING | Danh mục vertical mới của nhóm merchant cập nhật chiến lược marketingDanh mục vertical mới của nhóm merchant (GAME - API, LOGISTICS, MASS MERCHANT) cập nhật chiến lược marketing | CASHIN BANK, P2P, P2P - EWALLET - TO - BANK |
| `SPECIALPROJECT` | STRING | Thuộc về dự án đặc biệt dùng góc nhìn riêng vào chiến lược phát triểnThuộc về dự án đặc biệt (GAME, RETAIL, OTA, ADS PAYMENT...) dùng góc nhìn riêng vào chiến lược phát triển | CASHIN BANK, P2P - EWALLET TO EWALLET, AIRTIME |

## Memory
*8 entries — user-trained knowledge*

1. Dữ liệu nhân khẩu học trong bảng iDeA_TRANS_DEMOGRAPHIC không chứa thông tin giới tính, chỉ có: user_id, city, city_group, age, age_group _2025-12-31_
2. Tên thành phố 'dongnai' tương ứng với LOWER(t2.city) = 'đồng nai' _2025-08-26_
3. MoMo nay đã là trợ thủ tài chính với AI, không còn là ví điện tử _2025-08-26_
4. MAU (Monthly Active Users) = số người dùng hoạt động hàng tháng, tính bằng số lượng người dùng duy nhất thực hiện ít nhất một giao dịch trong tháng đó _2025-12-11_
5. A30 active user: người dùng thực hiện ít nhất một giao dịch trong vòng 30 ngày gần nhất. _Transaction MoMo · 2025-08-18_
6. Khi đếm số lượng giao dịch, sử dụng count(distinct t1.tranid) _2025-08-26_
7. Khi hỏi P2P, W2W và W2B thì nên dùng cột SPECIALPROJECT để filter sẽ chính xác hơn _2026-02-05_
8. Giao dịch P2P (Peer-to-Peer) là giao dịch chuyển tiền trực tiếp giữa hai người dùng cá nhân với nhau. Thông thường trong Data sẽ là từ transfer. Có 2 loại giao dịch trong đó là W2W và W2B đều thuộc P2P _Transaction MoMo · 2025-08-11_
