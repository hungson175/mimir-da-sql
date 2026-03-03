# Domain: BU Payment: Transaction MoMo

## Identity
- **Domain ID:** `e5beb7b6-4273-47ff-9755-a5bcf8d51b97`
- **Description:** Lưu trữ thông tin cơ bản các giao dịch của ví điện tử MoMo 
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.REPORT.DAILY_PAID_USER_TRANS_VER2
> Báº£ng bÃ¡o cÃ¡o háº±ng ngÃ y thá»ng kÃª giao dá»ch ÄÃ£ thanh toÃ¡n cá»§a ngÆ°á»i dÃ¹ng MoMo trong thá»i gian thá»±c, bao gá»m thÃ´ng tin mÃ£ dá»ch vá»¥, mÃ£ merchant, phÃ¢n nhÃ³m dá»ch vá»¥ vÃ  cÃ¡c chá» sá» doanh thu theo tá»«ng ngÃ y.

Dá»¯ liá»u cÃ³ thá» ÄÆ°á»£c dÃ¹ng Äá»:
- PhÃ¢n...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| REFERENCE | FLOAT | Sá» tham chiáº¿u giao dá»ch, giÃ¡ trá» tÆ°Æ¡ng á»©ng vá»i má»i giao dá»ch cá»§a ngÆ°á»i dÃ¹ng... | 58549008, 68338427, 68338219 |
| user_payment | FLOAT | MÃ£ Äá»nh danh ngÆ°á»i dÃ¹ng. | 58944053, 50036002, 14649916 |
| TRANS_DATE | DATE | NgÃ y giao dá»ch ÄÆ°á»£c ghi nháº­n dáº¡ng DATE, tá»i Äa háº±ng ngÃ y theo mÃºi giá» Viá»t Nam... | 2025-12-01, 2025-12-29, 2025-08-26 |
| SERVICE_CODE | STRING | MÃ£ ká»¹ thuáº­t Äá»nh danh dá»ch vá»¥/merchant lÃºc giao dá»ch (vÃ­ dá»¥ mÃ£ náº¡p tiá»n game,... | u2u, cardcashout.balvccb_cashout, vms2.airtime |
| USER_TYPE | STRING | Loáº¡i vÃ­ tham gia giao dá»ch. | EWALLET BANK, OTHERS, EWALLET NON-BANK, OTC |
| SERVICEID | STRING | MÃ£ phiÃªn báº£n/ID cá»¥ thá» cá»§a dá»ch vá»¥ trong há» thá»ng (phiÃªn báº£n KABP, Momo Game, M... | banklink_cashin, transfer_p2b_scan_vietqr, transfer_p2b |
| VALUE_TRANS | FLOAT | Tá»ng giÃ¡ trá» tiá»n giao dá»ch (VNÄ) Äá»i vá»i nhÃ³m giao dá»ch Äang Äá»nh danh ngÃ y ... | 100000, 50000, 10000 |
| NUMBER_TRANS | INTEGER | Sá» lÆ°á»£ng giao dá»ch ÄÆ°á»£c nhÃ³m theo ngÃ y, service, merchant. | 1, 2, 3 |
| MONTH_ACTIVE | DATE | NgÃ y Äáº§u thÃ¡ng mÃ  giao dá»ch náº±m trong ká»³ thá»ng kÃª (MM-01)NgÃ y Äáº§u thÃ¡ng mÃ  giao... | 2025-12-01, 2025-11-01, 2025-10-01 |
| GROUP_CODE_L1 | STRING | NhÃ³m cáº¥p 1 cá»§a dá»ch vá»¥, xÃ¡c Äá»nh nghiá»p vá»¥ chÃ­nh vÃ­ tiá»n (PAYMENT, P2P. | CASHIN, PAYMENT, TRANSFER, CASHOUT, MONEY DISBURSEMENT |
| SERVICE_DESCRIPTION | STRING | MÃ´ táº£ giao dá»ch báº±ng chá»¯ hÆ°á»ng dáº«n ngÆ°á»i Äá»c hiá»u merchant/dá»ch vá»¥ nÃ o Ä... | CHUYỂN TIỀN U2U, BANK CASH IN VIETCOMBANK, CASHIN TỪ MB BANK, BANK CASH IN BIDV,... |
| BU_NAME | STRING | TÃªn Business Unit quáº£n lÃ½ dá»ch vá»¥ (BU_DLS, BU_SDK. | BU_BANK, BU_P2P, BU_DLS, BU_VTTI, BU_FS |
| MERCHANT | STRING | TÃªn thÆ°Æ¡ng hiá»u/hoáº·c merchant tháº­t sá»± dá»ch vá»¥ Äang truy váº¥nTÃªn thÆ°Æ¡ng hiá»u/ho... | P2P, VIETCOMBANK, MB BANK, VIETTEL, BIDV |
| KEY_MERCHANT_2 | STRING | PhÃ¢n nhÃ³m merchant cáº¥p 2 Äá» bÃ¡o cÃ¡o chiáº¿n lÆ°á»£c (ECOMMERCE, RETAIL. | ECOMMERCE, TELECOM_ULTILITIES, MAPS, COLLECTION, MAPSPS |
| KEY_MERCHANT_3 | STRING | Chi tiáº¿t key merchant má»©c 3 (FACEBOOK. | U2U, TOPUP TELECOM, APPLE, BE, CIRCLE K |
| BU_GROUP_CODE_L1 | STRING | NhÃ³m cáº¥p 1 cá»§a ÄÆ¡n vá» kinh doanh (TOPBRAND ONLINE, SME OFFLINE, TOPBRAND OFFLINE) phá»¥c vá... | P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET, TELECOM, END USER, CREDITTECH L... |
| BU_GROUP_CODE_L2 | STRING | NhÃ³m cáº¥p 2 cá»§a ÄÆ¡n vá» kinh doanh chia nhÃ³m ngÃ nh nghá» (GAME, RETAIL, FNB, OTA, ADS)NhÃ³... | PAYLATER, TTT, APPLICATION STORE, RETAIL, TRANSPORT |
| BU_GROUP_CODE_L3 | STRING | NhÃ³m cáº¥p 3 cá»§a ÄÆ¡n vá» kinh doanh chia nhá» ngÃ nh há» Äá» dashboard bÃ¡o cÃ¡o hoáº·c ch... | BANK, LOGISTICS, MOBIFONE, WHYPAY, GROCERY |
| NEWVERTICAL | STRING | Danh má»¥c vertical má»i cáº¥p 1 (GAME, SUPERMARKET, OTA, . | CASHIN BANK, P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET, AIRTIME, CASHOUT B... |
| NEWVERTICAL_Merchant | STRING | Danh má»¥c vertical má»i cá»§a nhÃ³m merchant (GAME - API, LOGISTICS, MASS MERCHANT) cáº­p nháº­t c... | CASHIN BANK, P2P, P2P - EWALLET - TO - BANK, AIRTIME, CASHOUT BANK |
| SPECIALPROJECT | STRING | Thuá»c vá» dá»± Ã¡n Äáº·c biá»t (GAME, RETAIL, OTA, ADS PAYMENT. | CASHIN BANK, P2P - EWALLET TO EWALLET, AIRTIME, P2P - EWALLET TO BANK, VIETQR OF... |

## Domain Knowledge (from Mimir)

- Dữ liệu nhân khẩu học trong bảng iDeA_TRANS_DEMOGRAPHIC không chứa thông tin giới tính, chỉ có: user_id, city, city_group, age, age_group
- Tên thành phố 'dongnai' tương ứng với LOWER(t2.city) = 'đồng nai'
- MoMo nay đã là trợ thủ tài chính với AI, không còn là ví điện tử
- MAU (Monthly Active Users) = số người dùng hoạt động hàng tháng, tính bằng số lượng người dùng duy nhất thực hiện ít nhất một giao dịch trong tháng đó
- Giao dịch P2P (Peer-to-Peer) là giao dịch chuyển tiền trực tiếp giữa hai người dùng cá nhân với nhau, không thông qua một bên trung gian truyền thống như ngân hàng. Các loại giao dịch khác thường liên quan đến việc thanh toán cho hàng hóa, dịch vụ, hoặc các giao dịch với doanh nghiệp/tổ chức.
- A30 active user: người dùng thực hiện ít nhất một giao dịch trong vòng 30 ngày gần nhất.
- Khi đếm số lượng giao dịch, sử dụng count(distinct t1.tranid)

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
