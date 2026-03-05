# BU Payment: VTTI Overview

**Domain ID:** `1d4022aa-85c0-47d9-8f53-e346a8e74437`

## Description
Tất cả giao dịch của VTTI (không có revenue): Airtime, Data, Billpay, Dịch vụ Công từ 2017 đến hiện tại

## Tables

### `project-5400504384186300846.BU_UTILITIES_TELCO.VTTI_TRANID_ALL`
> Bảng này chứa thông tin giao dịch viễn thông tiện ích trên MoMo. Dữ liệu từ bảng này có thể được sử dụng để tính toán tổng giá trị giao dịch (GMV), phân tích hành vi người dùng theo vùng và tuổi, và quản lý các merchant trong dịch vụ viễn thông tiện ích.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | INTEGER | Transaction ID - uniquetransaction id - unique | 1538827724, 1538371678, 1539119864 |
| `date` | DATE | Ngày phát sinh giao dịchngày phát sinh giao dịch | 2025-12-03, 2025-11-03, 2025-09-03 |
| `datetime` | DATETIME | Thời gian phát sinh giao dịchThời gian phát sinh giao dịch | 2023-06-16 10:01:16, 2022-01-11 04:10:24, 2023-06-16 10:01:05 |
| `hour` | INTEGER | Giờ phát sinh giao dịchgiờ phát sinh giao dịch | 9, 10, 8 |
| `amount` | FLOAT | Số tiền của transaction id. sum(amount) được gọi là GMVsố tiền của transaction id. sum(amount) được gọi là gmv | 10000, 20000, 50000 |
| `MM_AMOUNT` | FLOAT | Số tiền user thanh toán bằng MoMosố tiền user thanh toán bằng momo | 10000, 20000, 0 |
| `VC_AMOUNT` | FLOAT | Số tiền khuyến mãi dùng trong giao dịchsố tiền khuyến mãi dùng trong giao dịch | 0, 10000, 5000 |
| `voucher_or_not` | STRING | Loại khuyến mãi của giao dịch. Non_voucher: giao dịch không có khuyến mãi, Voucher: giao dịch có sử dụng khuyến mãiloại khuyến mãi của giao dịch. Non_voucher: giao dịch không có khuyến mãi, Voucher: giao dịch có sử dụng khuyến mãi | Non_voucher, Voucher |
| `CATE` | STRING | Group_service = 3G/4G, Topup&Mathe thì cột này là nhà mạng khi phát sinh giao dịch. Với group_service còn lại, cột này sẽ là dịch vụ như: INTERNET: Thanh toán bill Internet; CHUNG CU: Chung Cư; DIEN: Thanh toán điện; DIEN THOAI TRA SAU: Thanh toán Điện Thoại Trả Sau; HCC: Hành Chính Công; TRUONG HOC: Giáo dục; TRUYEN HINH: Truyền Hình; Y TE: Y tế; XANG DAU: Xăng Dầu; VAN TAI: Giao Thông Vận Tảigroup_service = 3G/4G, Topup&Mathe thì cột này là nhà mạng khi phát sinh giao dịch. Với group_service còn lại, cột này sẽ là dịch vụ. INTERNET: Thanh toán bill Internet; CHUNG CU: Chung Cư; DIEN: Thanh toán điện. DIEN THOAI TRA SAU: Thanh toán Điện Thoại Trả Sau. HCC:Hành Chính Công. TRUONG HOC:Giáo dục. TRUYEN HINH: Truyền Hình. Y TE: Y tế. XANG DAU: Xăng Dầu. VAN TAI: Giao Thông Vận Tải | Viettel, Mobifone, OTHER |
| `SERVICE` | STRING | Dịch vụ của group_service 3G/4G, Topup&Mathe. TOPUP: dịch vụ topup, MATHE: dịch vụ mã tthẻ, COMBO: dịch vụ combo, SIM: dịch vụ SIM, OTHERS: dịch vụ khác/cổng thanh toándịch vụ của group_service 3G/4G, Topup&Mathe. TOPUP: dịch vụ topup. MATHE: dịch vụ mã tthẻ. COMBO: dịch vụ combo. SIM: dịch vụ SIM. OTHERS: dịch vụ khác/cổng thanh toán | TOPUP, OTHERS, MATHE |
| `SUBCATEGORY` | STRING | Nếu là group_service 3G/4G thì cột này là nhà cung cấp, các group_service còn lại sẽ bằng cột CATENếu là group_service 3G/4G thì cột này là nhà cung cấp, các group_service còn lại sẽ bằng cột cate | WHYPAY, Mobifone, OCTA/LOGICH |
| `GROUP_SERVICE` | STRING | Topup&Mathe: nhóm dịch vụ Airtime, 3G/4G: nhóm dịch vụ Data, Billpay: dịch vụ Thanh toán hóa đơn/billpay, HCC: public service/nhóm dịch vụ côngTopup&Mathe: nhóm dịch vụ Airtime. 3G/4G: nhóm dịch vụ Data. Billpay:dịch vụ Thanh toán hóa đơn/billpay. HCC: public service/ nhóm dịch vụ công | Topup&Mathe, Billpay, 3G/4G |
| `CEE_GROUP_SERVICE` | STRING | N/A | AIRTIME, BILLPAY, TELECOM |
| `merchant` | STRING | Tên merchanttên merchant | TOPUP VIETTEL, TOPUP MOBIFONE, MA THE VIETTEL |
| `REGION` | STRING | Vùng quản lý của KAvùng quản lý của KA | Mien Bac, Mien Nam, Mien Trung |
| `MANAGER` | STRING | Manager của KA quản lý merchantmanager của KA quản lý merchant | my.lam, khanh.nguyen1, tho.ho |
| `KA` | STRING | KA quản lý merchantKA quản lý merchant | my.lam, thao.tran7, tho.ho |
| `PM` | STRING | BO quản lý merchantBO quản lý merchant | xuyen.le1, ngoc.phung, thao.tran6 |
| `Supplier` | STRING | Nhà cung cấpnhà cung cấp | WHYPAY, Mobifone, OCTA/LOGICH |
| `service_code` | STRING | Service_code của giao dịch, gọi là agentservice_code của giao dịch, gọi là agent | vms2.airtime, vttiocta_vt.airtime, vttiwhypay_vt.airtime |
| `BONUS` | FLOAT | Số tiền chiết khấu cho người dùngsố tiền chiết khấu cho người dùng | 0, 1500, 750 |
| `GENDER` | STRING | Giới tính của usergiới tính của user | male, UNKNOWN, female |
| `group_age` | STRING | Nhóm tuổi của usernhóm tuổi của user | [2]. 18 - 22 y/o, 23_to_27, UNKNOWN |
| `age` | NUMERIC | N/A | 22, 23, 21 |
| `statusid` | INTEGER | Trạng thái giao dịch. 2 = thành công, 6 = thất bại. Khi tính MAU, GMV thì mặc định statusid = 2trạng thái giao dịch. 2 = thành công. 6 = thất bại. Khi tính MAU, gmv thì mặc định statusid = 2 | 2, 6 |
| `GROUP_User` | STRING | N/A | other, Current, New User |
| `province` | STRING | Tỉnh thành của usertỉnh thành của user | Hồ Chí Minh, Hà Nội, Bình Dương |
| `province_group` | STRING | Nhóm tỉnh thànhnhóm tỉnh thành | Hồ Chí Minh, Others, KCN Miền Nam |
| `user_payment` | STRING | Định danh user, nếu là cheating user là null value. Dùng để tính MAUđịnh danh user, nếu là cheating user là null value. Dùng để tính MAU | 39394543, 21200557, 31934318 |
| `MONEY_SOURCE` | STRING | Loại nguồn tiền user sử dụng để thanh toán. momo: ví momo, bank_link:ngân hàng, TTT:Túi thần tài, group fund: quỹ nhóm, transfer: chuyển tiền, pay_later: ví trả sauloại nguồn tiền user sử dụng để thanh toán. momo: ví momo. bank_link:ngân hàng. TTT:Túi thần tài. group fund: quỹ nhóm. transfer: chuyển tiền. pay_later:ví trả sau. | momo, bank_link, pay_later |
| `serviceid` | STRING | Service ID của dịch vụservice id của dịch vụ | topup_Viettel, topup_Mobifone, topup_data_viettel |
| `user_raw` | STRING | Định danh user, include cheating userđịnh danh user, include cheating user | 53401441, 39394543, 47499914 |

## Memory
*4 entries — user-trained knowledge*

1. Metric: Retention Rate (Telco)
Definition: Retention rate tháng T = (số user sử dụng dịch vụ cùng lúc vào tháng T và tháng T-1) / (số user sử dụng dịch vụ tháng T-1).
Calculation Logic:
- raw: Distinct month_active and user_payment for Telco services (group_service in ('Topup&Mathe', '3G/4G')) within the specified date range.
- mau: Monthly Active Users (count of distinct user_payment) from raw.
- retain_at_month_T: Users who were active in month T and also in month T-1. This is calculated by joining raw with itself where user_payment matches and date_diff between month_active is 1 month.
- Final Calculation: retain_user from retain_at_month_T divided by mau from the previous month (mau_month_T_1).
- Note: Retention rate phải làm tròn 2 chữ số thập phân. _2026-02-04_
2. Số user active dịch vụ VTTI, không phải MoMo _2026-01-27_
3. Khi xử lý dữ liệu cho năm 2025, sử dụng điều kiện date > '2024-12-31' thay vì EXTRACT(YEAR FROM date) = 2025 _2026-02-03_
4. Khi người dùng yêu cầu lọc dữ liệu, chỉ tự động thêm các bộ lọc cho GROUP_SERVICE và CATE khi người dùng yêu cầu rõ ràng các thông tin này. Nếu không, chỉ sử dụng các bộ lọc chính được cung cấp, chẳng hạn như service_code. Ví dụ: service_code = 'vttivienphuongnam_tv360' đã ngụ ý là dịch vụ data, không cần thêm GROUP_SERVICE = '3G/4G' và CATE = 'TV360' trừ khi được yêu cầu cụ thể. _2025-12-26_
