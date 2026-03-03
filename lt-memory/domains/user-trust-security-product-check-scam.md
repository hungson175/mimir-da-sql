# Domain: User Trust: Security Product - Check Scam

## Identity
- **Domain ID:** `4f353121-0b27-437a-9746-e4b8897ad03b`
- **Description:** Consolidates scam report data from multiple sources (both inside and outside MoMo), including MoMo users, social media, government agencies, and more. 
Provides information on various types of scam-related entities such as MoMo wallet accounts, bank accounts, websites, and others.
- **Tables:** 2
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.SHERLOCK.CHECK_SCAM_IDENTIFIER_SEARCH_YYYYMMDD
> Báº£ng chá»©a thÃ´ng tin kiá»m tra cÃ¡c danh tÃ­nh bá» cÃ¡o buá»c lá»«a Äáº£o, phá»¥c vá»¥ cho viá»c theo dÃµi vÃ  quáº£n lÃ½ cÃ¡c hoáº¡t Äá»ng gian láº­n.
- XÃ¡c Äá»nh danh tÃ­nh cá»§a cÃ¡c thá»±c thá» cÃ³ liÃªn quan Äáº¿n lá»«a Äáº£o.
- Theo dÃµi sá» lÆ°á»£ng bÃ¡o cÃ¡o liÃªn quan Äáº...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| identifier_id | STRING | ID Äá»nh danh cá»§a danh tÃ­nh bá» cÃ¡o buá»c lá»«a Äáº£o. |  |
| identifier_type | STRING | Loáº¡i danh tÃ­nh liÃªn quan. | bank, momo, phone, zalopay, url |
| identifier_value | STRING | GiÃ¡ trá» Äá»nh danh liÃªn quan, vÃ­ dá»¥ nhÆ° sá» Äiá»n thoáº¡i hoáº·c sá» tÃ i khoáº£n ngÃ¢... |  |
| identifier_name | STRING | TÃªn cá»§a danh tÃ­nh liÃªn quan. |  |
| identifier_bank_name | STRING | TÃªn ngÃ¢n hÃ ng liÃªn quan Äáº¿n danh tÃ­nh liÃªn quan. | MBB, VCB, TCB, BIDV, VTB |
| identifier_napas_bank_code | STRING | MÃ£ ngÃ¢n hÃ ng NAPAS liÃªn quan Äáº¿n danh tÃ­nh liÃªn quan. | 970422, 970436, 970416 |
| report_count | INTEGER | Sá» lÆ°á»£ng bÃ¡o cÃ¡o liÃªn quan Äáº¿n danh tÃ­nh bá» cÃ¡o buá»c. | 1, 2, 3 |
| source_groups | STRING | CÃ¡c nhÃ³m nguá»n cá»§a bÃ¡o cÃ¡o liÃªn quan Äáº¿n danh tÃ­nh bá» cÃ¡o buá»c. | Báo cáo từ cộng đồng, Cơ quan chức năng |
| amount_loss_range | STRING | Pháº¡m vi thiá»t háº¡i tÃ i chÃ­nh tiá»m nÄng liÃªn quan Äáº¿n danh tÃ­nh bá» cÃ¡o buá»c. | Dưới 5 triệu, Dưới 50 triệu, Dưới 100 triệu, Trên 100 triệu |
| related_identifiers | RECORD | CÃ¡c danh tÃ­nh liÃªn quan Äáº¿n danh tÃ­nh bá» cÃ¡o buá»c. |  |
| report_ids | STRING | Danh sÃ¡ch cÃ¡c ID bÃ¡o cÃ¡o cÃ³ liÃªn quan. | REPORT_2bb58b82-9031-447f-b3e2-96878aad7302, REPORT_465f849b-8a93-4ea5-a386-87e9... |

### project-5400504384186300846.SHERLOCK.CHECK_SCAM_IDENTIFIER_SEARCH_CHANGE_YYYYMMDD
> Báº£ng theo dÃµi thay Äá»i thÃ´ng tin vá» cÃ¡c Äá»nh danh nghi ngá» liÃªn quan Äáº¿n lá»«a Äáº£o qua cÃ¡c láº§n tÃ¬m kiáº¿m. Má»¥c tiÃªu vÃ  sá»­ dá»¥ng chÃ­nh cá»§a báº£ng nÃ y cÃ³ thá» bao gá»m: 
 - Theo dÃµi vÃ  phÃ¢n tÃ­ch sá» lÆ°á»£ng bÃ¡o cÃ¡o liÃªn quan Äáº¿n cÃ¡c Äá»nh danh ngh...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| identifier_id | STRING | MÃ£ Äá»nh danh duy nháº¥t cá»§a Äá»nh danh nghi ngá». |  |
| identifier_type | STRING | Loáº¡i Äá»nh danh nghi ngá», vÃ­ dá»¥: email, sá» Äiá»n thoáº¡i. |  |
| identifier_value | STRING | GiÃ¡ trá» cá»§a Äá»nh danh nghi ngá», vÃ­ dá»¥: Äá»a chá» email hay sá» Äiá»n thoáº¡i cá»¥... |  |
| identifier_name | STRING | TÃªn cá»§a Äá»nh danh nghi ngá» ÄÆ°á»£c liá»t kÃª. |  |
| identifier_bank_name | STRING | TÃªn ngÃ¢n hÃ ng liÃªn káº¿t vá»i Äá»nh danh nghi ngá». |  |
| identifier_napas_bank_code | STRING | MÃ£ ngÃ¢n hÃ ng NAPAS cá»§a Äá»nh danh nghi ngá». |  |
| report_count | INTEGER | Tá»ng sá» láº§n Äá»nh danh nghi ngá» nÃ y bá» bÃ¡o cÃ¡o. |  |
| source_groups | STRING | NhÃ³m nguá»n cung cáº¥p thÃ´ng tin cho Äá»nh danh nghi ngá». |  |
| amount_loss_range | STRING | Khoáº£ng giÃ¡ trá» thiá»t háº¡i tÃ i chÃ­nh liÃªn quan Äáº¿n Äá»nh danh nghi ngá». |  |
| related_identifiers | RECORD | ThÃ´ng tin vá» cÃ¡c Äá»nh danh liÃªn quan Äáº¿n Äá»nh danh nghi ngá» nÃ y. |  |
| report_ids | STRING | Danh sÃ¡ch mÃ£ cá»§a cÃ¡c bÃ¡o cÃ¡o liÃªn quan Äáº¿n Äá»nh danh nghi ngá». |  |
| change_type | STRING | Loáº¡i thay Äá»i thÃ´ng tin vá» Äá»nh danh nghi ngá». |  |

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Status: **Not yet probed**
