# CreditTech Paylater — DA Knowledge (Mimir Corrections)

**Source:** `lt-memory/domains/bu-fs-credittech-paylater.md` → `## Memory`
**Entries:** 15
**Domain ID:** `7e23d41a-0baf-4b36-84c3-07fb850bdb6e`

---

1. MAU_SEGMENT = '1.New' là new mau (first time active PayLater), không phải New register _2025-08-25_
2. MAU = monthly active user, là user có hành vi thanh toán với Paylater trong tháng, tính tới ngày t-1 so với ngày lấy data _FS CREDITTECH PAYLATER · 2025-07-13_
3. Active user bao gồm 3 trans_type: pay_pl, pay_ins, send_pl _FS CREDITTECH PAYLATER · 2025-07-11_
4. Khi được hỏi tới một tên merchant hay dùng giá trị của cột service_name trong bảng PAYLATER_ALL_TRANS, dưới đây là top các giá trị trong cột service_name, nếu bị hỏi tên merchant lạ quá hay hỏi cụ thể service_name của merchant là gì:
   - VIETTEL, TIKTOK, MOBIFONE, APPLE, GRAB-ENDUSER, VINAPHONE, TOPUP VIETTEL, GOOGLE
   - MWG - BACH HOA XANH, BE GROUP, GSM, CIRCLE K, EVN HO CHI MINH, ADSL FPT, CGV, P2P
   - GS25, EVN HA NOI, MINISTOP, HIGHLANDS COFFEE, LAZADA, FAMILYMART, NETFLIX, VIETLOTT SMS
   - FUNTEK, SPOTIFY, VIETNAMOBILE, INTERNET TRA SAU VIETTEL, PHARMACITY, GALAXY CINEMA
   - PETROLIMEX, JOLLIBEE, LOTTE CINEMA, BETA CINEMA, MBB 247, VNPT TOAN QUOC
   - CO.OPMART, BIG C - GO - TOPS MARKET, NHA THUOC LONG CHAU, 7-ELEVEN, VÉ XE RẺ
   - PHƯƠNG TRANG, EVN BEN TRE, EVN DONG NAI, DI DONG VIETTEL TRA SAU, SIEU THI AEON
   - CINESTAR, VINAPHONE - TRA SAU, TIKTOK LIVE, PHUC LONG, KATINAT
   - MOBIFONE - TRA SAU, COOP FOOD, BHD STAR, METRO HCM, VIETJET AIR
   - HỒNG TRÀ NGÔ GIA, EVN CA MAU, KINGFOOD, TIKI, TTT+, BIDV 247
   - EVN LONG AN, LOTTE MART, EVN HUNG YEN, COMBO DATA VIETTEL, LOTTERIA
   - VNPT HCM, FACEBOOK, NUOC CHO LON, EVN BINH DUONG, BUS OTA (VXR, FUTA)
   - CON CUNG, PHE LA, EVN BAC GIANG, THE COFFEE HOUSE, NUOC SACH HA NOI
   - EVN HAI DUONG, EVN QUANG NAM, VE TAU - DUONG SAT VIET NAM (THU HO)
   - GUARDIAN, MM MEGA MARKET, COMECO, EVN DAK LAK, EVN DONG THAP
   - COOP SMILE, NUOC TRUNG AN, EVN DA NANG, ADSL FPT TRA TRUOC, VETC
   - CANVA PTY LTD, NUOC THU DUC, EVN QUANG BINH, GOLDENGATE
   - EVN TIEN GIANG, EVN BINH DINH, VDTC, VIETINBANK, EVN CAN THO, EVN BAC NINH
   _FS CreditTech Paylater · 2025-07-18_
5. GMV chỉ tính cho giao dịch thành công (result_code = 0) _FS CREDITTECH PAYLATER · 2025-07-11_
6. contract_type = Card -> hợp đồng Card _2025-09-17_
7. GMV = amount của các trans_type = pay_ins, pay_pl, send_pl _FS CREDITTECH PAYLATER · 2025-07-11_
8. User thanh toán VTS là user có transaction_type = pay_pl, pay_ins, send_pl _FS CREDITTECH PAYLATER · 2025-07-13_
9. Khi truy vấn trường service_name, sử dụng tìm kiếm theo mẫu thay vì khớp chính xác, dùng chữ thường và hàm like _FS CreditTech Paylater · 2025-07-18_
10. contract_type = Loan -> hợp đồng Loan _2025-09-17_
11. VTS là ví trả sau - paylater _FS CREDITTECH PAYLATER · 2025-07-11_
12. Luôn lấy data đến ngày hôm qua, không lấy data hôm nay vì không đủ _FS CREDITTECH PAYLATER · 2025-07-14_
13. lastest_status NOT IN ('DEACTIVED') hoặc lastest_status is null để thống kê hợp đồng _2025-09-17_
14. contract_type = null -> không có thông tin _2025-09-17_
15. Filter thêm partner_name để chi tiết theo partner _2025-09-17_

