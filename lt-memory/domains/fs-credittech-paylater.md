# Domain: BU FS: CreditTech Paylater

## Identity
- **Domain ID:** `7e23d41a-0baf-4b36-84c3-07fb850bdb6e`
- **Description:** Data của sản phẩm Ví Trả Sau/Paylater. 
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| agent_id | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo | 9088454, 4530253, 3292468 |
| month_trans | DATE | ThÃ¡ng cá»§a giao dá»ch | 2025-11-01, 2025-10-01, 2025-09-01 |
| MAU_segment | STRING | PhÃ¢n Äoáº¡n cá»§a ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng hÃ ng thÃ¡ng | 2.Retain, 3.Reactive, 1.New |
| date_trans | DATE | NgÃ y thá»±c hiá»n giao dá»ch | 2025-12-01, 2025-11-01, 2025-10-01 |
| first_trans_id | STRING | ID giao dá»ch Äáº§u tiÃªn |  |
| retain | STRING | Tráº¡ng thÃ¡i giá»¯ chÃ¢n ngÆ°á»i dÃ¹ng | 39529428, 30030663, 47287393 |
| usecase | STRING | TrÆ°á»ng há»£p sá»­ dá»¥ng cá»§a giao dá»ch | AIRTIME, UTILITIES, APPLICATION STORE, LOGISTICS, MARKETPLACE |
| trans_type | STRING | Loáº¡i giao dá»ch | pay_pl, pay_ins |
| gift_segment | STRING | PhÃ¢n Äoáº¡n quÃ  táº·ng | 4.organic, 1.VTS gift, 2.BU gift, 3.ShopXu |
| fs_vts_gift | STRING | QuÃ  táº·ng tá»« dá»ch vá»¥ VÃ­ Tráº£ sau | md1_vcvts_vcttt_danang_progressbar_beta_50k, 240201_fs_vts_danang_100pt_35k, 230... |
| gift_list | STRING | Danh sÃ¡ch quÃ  táº·ng | md1_vcvts_vcttt_danang_progressbar_beta_50k, 240201_fs_vts_danang_100pt_35k, 230... |
| transaction_age | INTEGER | Äá» tuá»i giao dá»ch (sá» thÃ¡ng ká» tá»« khi báº¯t Äáº§u sá»­ dá»¥ng) | 22, 21, 23 |
| WL_SEGMENT | STRING | PhÃ¢n Äoáº¡n danh sÃ¡ch tráº¯ng (whitelist) | NEW_TO_MOMO, SOUNDBOX |
| trans_time | DATETIME | Thá»i gian thá»±c hiá»n giao dá»ch | 2025-12-01 19:34:11, 2025-08-01 08:45:51, 2025-10-01 18:30:30 |

## Domain Knowledge (from Mimir)

- MAU_SEGMENT = '1.New' là new mau (first time active PayLater), không phải New register
- MAU = monthly active user, là user có hành vi thanh toán với Paylater trong tháng, tính tới ngày t-1 so với ngày lấy data
- Active user bao gồm 3 trans_type: pay_pl, pay_ins, send_pl
- Khi được hỏi tới một tên merchant hay dùng giá trị của cột service_name trong bảng PAYLATER_ALL_TRANS, dưới đây là top các giá trị trong cột service_name, nếu bị hỏi tên merchant lạ quá hay hỏi cụ thể service_name của merchant là gì:
service_name
VIETTEL
TIKTOK
MOBIFONE
APPLE
GRAB-ENDUSER
VINAPHONE
TOPUP VIETTEL
GOOGLE
MWG - BACH HOA XANH
BE GROUP
GSM
CIRCLE K
EVN HO CHI MINH
ADSL FPT
CGV
P2P
GS25
EVN HA NOI
MINISTOP
HIGHLANDS COFFEE
LAZADA
FAMILYMART
NETFLIX
VIETLOTT SMS
FUNTEK
SPOTIFY
VIETNAMOBILE
INTERNET TRA SAU VIETTEL
PHARMACITY
GALAXY CINEMA
PETROLIMEX
JOLLIBEE
LOTTE CINEMA
BETA CINEMA
MBB 247
VNPT TOAN QUOC
CO.OPMART
BIG C - GO - TOPS MARKET
NHA THUOC LONG CHAU
7-ELEVEN
VÉ XE RẺ
PHƯƠNG TRANG
EVN BEN TRE
EVN DONG NAI
DI DONG VIETTEL TRA SAU
SIEU THI AEON
CINESTAR
VINAPHONE - TRA SAU
TIKTOK LIVE
PHUC LONG
KATINAT
MOBIFONE - TRA SAU
COOP FOOD
BHD STAR
METRO HCM
VIETJET AIR
HỒNG TRÀ NGÔ GIA
EVN CA MAU
KINGFOOD
TIKI
TTT+
BIDV 247
EVN LONG AN
LOTTE MART
EVN HUNG YEN
COMBO DATA VIETTEL
LOTTERIA
VNPT HCM
FACEBOOK
NUOC CHO LON
EVN BINH DUONG
BUS OTA (VXR, FUTA)
CON CUNG
PHE LA
EVN BAC GIANG
THE COFFEE HOUSE
NUOC SACH HA NOI
EVN HAI DUONG
EVN QUANG NAM
VE TAU - DUONG SAT VIET NAM (THU HO)
GUARDIAN
MM MEGA MARKET
COMECO
EVN DAK LAK
EVN DONG THAP
COOP SMILE
NUOC TRUNG AN
EVN DA NANG
ADSL FPT TRA TRUOC
VETC
 CANVA PTY LTD
NUOC THU DUC
EVN QUANG BINH
GOLDENGATE
EVN TIEN GIANG
EVN BINH DINH
VDTC
VIETINBANK
EVN CAN THO
EVN BAC NINH
service_name
VIETTEL
TIKTOK
MOBIFONE
- GMV chỉ tính cho giao dịch thành công (result_code = 0)
- contract_type = Card -> hợp đồng Card
- GMV = amount của các trans_type = pay_ins, pay_pl, send_pl
- User thanh toán VTS là user có transaction_type = pay_pl, pay_ins, send_pl
- Khi truy vấn trường service_name, sử dụng tìm kiếm theo mẫu thay vì khớp chính xác, dùng chữ thường và hàm like
- contract_type = Loan -> hợp đồng Loan
- VTS là ví trả sau - paylater
- Luôn lấy data đến ngày hôm qua, không lấy data hôm nay vì không đủ
- lastest_status NOT IN ('DEACTIVED') hoặc lastest_status is null để thống kê hợp đồng
- contract_type = null -> không có thông tin
- Filter thêm partner_name để chi tiết theo partner

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
