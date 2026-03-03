# Domain: BU Payment: VTTI Overview

## Identity
- **Domain ID:** `1d4022aa-85c0-47d9-8f53-e346a8e74437`
- **Description:** Tất cả giao dịch của VTTI (không có revenue): Airtime, Data, Billpay, Dịch vụ Công từ 2017 đến hiện tại
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.BU_UTILITIES_TELCO.VTTI_TRANID_ALL
> Báº£ng nÃ y chá»©a thÃ´ng tin giao dá»ch viá»n thÃ´ng tiá»n Ã­ch trÃªn MoMo. Dá»¯ liá»u tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» tÃ­nh toÃ¡n tá»ng giÃ¡ trá» giao dá»ch (GMV), phÃ¢n tÃ­ch hÃ nh vi ngÆ°á»i dÃ¹ng theo vÃ¹ng vÃ  tuá»i, vÃ  quáº£n lÃ½ cÃ¡c merchant trong dá»ch vá»¥...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| id | INTEGER | Transaction ID - uniquetransaction id - unique | 1538827724, 1538371678, 1539119864 |
| date | DATE | NgÃ y phÃ¡t sinh giao dá»chngÃ y phÃ¡t sinh giao dá»ch | 2025-12-03, 2025-11-03, 2025-09-03 |
| datetime | DATETIME | Thá»i gian phÃ¡t sinh giao dá»chThá»i gian phÃ¡t sinh giao dá»ch | 2023-06-16 10:01:16, 2022-01-11 04:10:24, 2023-06-16 10:01:05 |
| hour | INTEGER | Giá» phÃ¡t sinh giao dá»chgiá» phÃ¡t sinh giao dá»ch | 9, 10, 8 |
| amount | FLOAT | Sá» tiá»n cá»§a transaction id. | 10000, 20000, 50000 |
| MM_AMOUNT | FLOAT | Sá» tiá»n user thanh toÃ¡n báº±ng MoMosá» tiá»n user thanh toÃ¡n báº±ng momo | 10000, 20000, 0 |
| VC_AMOUNT | FLOAT | Sá» tiá»n khuyáº¿n mÃ£i dÃ¹ng trong giao dá»chsá» tiá»n khuyáº¿n mÃ£i dÃ¹ng trong giao dá»ch | 0, 10000, 5000 |
| voucher_or_not | STRING | Loáº¡i khuyáº¿n mÃ£i cá»§a giao dá»ch. | Non_voucher, Voucher |
| CATE | STRING | Group_service = 3G/4G, Topup&Mathe thÃ¬ cá»t nÃ y lÃ  nhÃ  máº¡ng khi phÃ¡t sinh giao dá»ch. | Viettel, Mobifone, OTHER |
| SERVICE | STRING | Dá»ch vá»¥ cá»§a group_service 3G/4G, Topup&Mathe. | TOPUP, OTHERS, MATHE, COMBO, SIM |
| SUBCATEGORY | STRING | Náº¿u lÃ  group_service 3G/4G thÃ¬ cá»t nÃ y lÃ  nhÃ  cung cáº¥p, cÃ¡c group_service cÃ²n láº¡i sáº... | WHYPAY, Mobifone, OCTA/LOGICH |
| GROUP_SERVICE | STRING | Topup&Mathe: nhÃ³m dá»ch vá»¥ Airtime, 3G/4G: nhÃ³m dá»ch vá»¥ Data, Billpay: dá»ch vá»¥ Thanh to... | Topup&Mathe, Billpay, 3G/4G, HCC |
| CEE_GROUP_SERVICE | STRING | N/A | AIRTIME, BILLPAY, TELECOM, PUBLIC_SERVICE, PUBLIC SERVICE |
| merchant | STRING | TÃªn merchanttÃªn merchant | TOPUP VIETTEL, TOPUP MOBIFONE, MA THE VIETTEL |
| REGION | STRING | VÃ¹ng quáº£n lÃ½ cá»§a KAvÃ¹ng quáº£n lÃ½ cá»§a KA | Mien Bac, Mien Nam, Mien Trung, Mien Trung  |
| MANAGER | STRING | Manager cá»§a KA quáº£n lÃ½ merchantmanager cá»§a KA quáº£n lÃ½ merchant | my.lam, khanh.nguyen1, tho.ho |
| KA | STRING | KA quáº£n lÃ½ merchantKA quáº£n lÃ½ merchant | my.lam, thao.tran7, tho.ho |
| PM | STRING | BO quáº£n lÃ½ merchantBO quáº£n lÃ½ merchant | xuyen.le1, ngoc.phung, thao.tran6 |
| Supplier | STRING | NhÃ  cung cáº¥pnhÃ  cung cáº¥p | WHYPAY, Mobifone, OCTA/LOGICH |
| service_code | STRING | Service_code cá»§a giao dá»ch, gá»i lÃ  agentservice_code cá»§a giao dá»ch, gá»i lÃ  agent | vms2.airtime, vttiocta_vt.airtime, vttiwhypay_vt.airtime |
| BONUS | FLOAT | Sá» tiá»n chiáº¿t kháº¥u cho ngÆ°á»i dÃ¹ngsá» tiá»n chiáº¿t kháº¥u cho ngÆ°á»i dÃ¹ng | 0, 1500, 750 |
| GENDER | STRING | Giá»i tÃ­nh cá»§a usergiá»i tÃ­nh cá»§a user | male, UNKNOWN, female, MALE, FEMALE |
| group_age | STRING | NhÃ³m tuá»i cá»§a usernhÃ³m tuá»i cá»§a user | [2]. 18 - 22 y/o, 23_to_27, UNKNOWN, [3]. 23 - 26 y/o, 28_to_32 |
| age | NUMERIC | N/A | 22, 23, 21 |
| statusid | INTEGER | Tráº¡ng thÃ¡i giao dá»ch. | 2, 6 |
| GROUP_User | STRING | N/A | other, Current, New User |
| province | STRING | Tá»nh thÃ nh cá»§a usertá»nh thÃ nh cá»§a user | Hồ Chí Minh, Hà Nội, Bình Dương |
| province_group | STRING | NhÃ³m tá»nh thÃ nhnhÃ³m tá»nh thÃ nh | Hồ Chí Minh, Others, KCN Miền Nam, Hà Nội, KCN Miền Bắc |
| user_payment | STRING | Äá»nh danh user, náº¿u lÃ  cheating user lÃ  null value. | 39394543, 21200557, 31934318 |
| MONEY_SOURCE | STRING | Loáº¡i nguá»n tiá»n user sá»­ dá»¥ng Äá» thanh toÃ¡n. | momo, bank_link, pay_later, TTT, napas |
| serviceid | STRING | Service ID cá»§a dá»ch vá»¥service id cá»§a dá»ch vá»¥ | topup_Viettel, topup_Mobifone, topup_data_viettel |
| user_raw | STRING | Äá»nh danh user, include cheating userÄá»nh danh user, include cheating user | 53401441, 39394543, 47499914 |

## Domain Knowledge (from Mimir)

- Số user active dịch vụ VTTI, không phải MoMo
- Khi người dùng yêu cầu lọc dữ liệu, chỉ tự động thêm các bộ lọc cho GROUP_SERVICE và CATE khi người dùng yêu cầu rõ ràng các thông tin này. Nếu không, chỉ sử dụng các bộ lọc chính được cung cấp, chẳng hạn như service_code. Ví dụ: service_code = 'vttivienphuongnam_tv360' đã ngụ ý là dịch vụ data, không cần thêm GROUP_SERVICE = '3G/4G' và CATE = 'TV360' trừ khi được yêu cầu cụ thể.

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
