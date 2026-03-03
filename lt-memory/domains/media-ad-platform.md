# Domain: MEDIA - AD Platform

## Identity
- **Domain ID:** `bf6c7cb8-75d4-493a-894c-ffd71d729cb1`
- **Description:** Domain này phục vụ cho việc quản lý, tổng hợp và phân tích dữ liệu Media Marketing, bao gồm dữ liệu hiệu suất quảng cáo từ các kênh như Facebook, Google, TikTok, Apple Search Ads, Moloco,…
- **Tables:** 1
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### momovn-growth-analytics.REPORT_MEDIA.MEDIA_FACT_AD_AGG
> Báº£ng fact chá»©a dá»¯ liá»u thá»ng kÃª quáº£ng cÃ¡o tÃ­ch lÅ©y, dÃ¹ng Äá» theo dÃµi vÃ  phÃ¢n tÃ­ch hiá»u suáº¥t cá»§a cÃ¡c chiáº¿n dá»ch quáº£ng cÃ¡o trÃªn nhiá»u kÃªnh khÃ¡c nhau.
- Theo dÃµi chi phÃ­, lÆ°á»£ng hiá»n thá» vÃ  sá» láº§n nháº¥p chuá»t cá»§a quáº£ng cÃ¡o theo tá»«ng ngÃ ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| date | DATE | NgÃ y thá»±c hiá»n chiáº¿n dá»ch quáº£ng cÃ¡o. | 2026-01-21, 2026-01-23, 2026-01-22 |
| month | DATE | ThÃ¡ng thá»±c hiá»n chiáº¿n dá»ch quáº£ng cÃ¡o. | 2026-01-01, 2025-12-01, 2025-11-01 |
| adset_id | STRING | MÃ£ Äá»nh danh cá»§a nhÃ³m quáº£ng cÃ¡o. | tEGbKbf3NZho4TIC, O0A2uRUi7AfQz2nU, zVsNVk2RQtM8Q6V8 |
| adset_name | STRING | TÃªn cá»§a nhÃ³m quáº£ng cÃ¡o. | adgroup_default_ios, adgroup_default_android, mix |
| ad_id | STRING | MÃ£ Äá»nh danh cá»§a quáº£ng cÃ¡o. | tEGbKbf3NZho4TIC, O0A2uRUi7AfQz2nU, zVsNVk2RQtM8Q6V8 |
| ad_name | STRING | TÃªn quáº£ng cÃ¡o. | adgroup_default_ios, adgroup_default_android, unknown |
| campaign_id | STRING | MÃ£ Äá»nh danh cá»§a chiáº¿n dá»ch. | UClCYV2NYQsVFcbN, xzRJ2xa13UjskPHh, dZajtQQ8qNcYxRsq |
| campaign_name | STRING | TÃªn chiáº¿n dá»ch. | Momo Android CPA campaign targeting Registration_PR.41855, Moloco_All_INS_GMC301... |
| account_id | STRING | MÃ£ Äá»nh danh cá»§a tÃ i khoáº£n. | FQznmNyWDWz60jLL, 7052226950055723010, 489990065003734 |
| account_name | STRING | TÃªn cá»§a tÃ i khoáº£n. | Momo, momo marketing, momo daily life service bc |
| campaign | STRING | Chiáº¿n dá»ch liÃªn quan. | Ntmm-Hellomomo, Ntmm-Mega25, Lottery, Googleplay, Data-Awo |
| cam | STRING | ThÃ´ng tin cá»§a chiáº¿n dá»ch (rÃºt gá»n). | Ntmm, Lottery, Data, Trust, Googleplay |
| segment | STRING | PhÃ¢n khÃºc Äá»i tÆ°á»£ng. | non-mass, momouser, momouser-whitelistuser, non-new, momouser-a90 |
| ad_code | STRING | MÃ£ code cá»§a quáº£ng cÃ¡o. | ad01, ad02, ad03 |
| ad_format | STRING | Äá»nh dáº¡ng cá»§a quáº£ng cÃ¡o. | null, Video, Image, Mix, Carousel |
| campaign_type | STRING | Loáº¡i chiáº¿n dá»ch. | S, XL, M, S5, L |
| channel | STRING | KÃªnh truyá»n thÃ´ng ÄÆ°á»£c sá»­ dá»¥ng. | Moloco, Facebook, Tiktok, Google, ASA |
| objective | STRING | Má»¥c tiÃªu cá»§a chiáº¿n dá»ch quáº£ng cÃ¡o. | Install, Others, Awareness, Traffic, Conversion |
| bu | STRING | ÄÆ¡n vá» kinh doanh liÃªn quan Äáº¿n chiáº¿n dá»ch. | Gmc, Dls, Bmc, Uti, P2p |
| usecase | STRING | TrÆ°á»ng há»£p sá»­ dá»¥ng chiáº¿n dá»ch. | Growth - Gtbb/Hlmm, Gmc - Crm, Uti - Data, Bmc - Overall, Dls - Digital Entertai... |
| vertical | STRING | NgÃ nh dá»c liÃªn quan Äáº¿n chiáº¿n dá»ch. | Platform, Payment, Financial Services, Mds |
| cost | FLOAT | Chi phÃ­ cá»§a chiáº¿n dá»ch quáº£ng cÃ¡o. | 0, 0.42352199999999995, 0.475605 |
| impression | FLOAT | LÆ°á»£ng hiá»n thá» cá»§a quáº£ng cÃ¡o. | 1, 2, 3 |
| click | FLOAT | Sá» láº§n nháº¥p vÃ o quáº£ng cÃ¡o. | 1, 0, 2 |
| outbound_click | FLOAT | Sá» láº§n nháº¥p ra ngoÃ i trang web. | 1, 0, 2 |
| view | INTEGER | Sá» láº§n xem quáº£ng cÃ¡o. | 0, 1, 2 |
| view_2s | INTEGER | Sá» láº§n xem quáº£ng cÃ¡o trong 2 giÃ¢y. | 0, 1, 3 |
| view_6s | INTEGER | Sá» láº§n xem quáº£ng cÃ¡o trong 6 giÃ¢y. | 0, 1, 2 |
| focus_view_15s | INTEGER | Sá» lÆ°á»£t xem táº­p trung vÃ o quáº£ng cÃ¡o trong 15 giÃ¢y. | 0, 336, 3915 |
| trueview | INTEGER | Sá» lÆ°á»£t xem thá»±c sá»± cá»§a quáº£ng cÃ¡o. | 0, 253, 4812 |
| thruplays | INTEGER | Sá» láº§n xem trá»n váº¹n cá»§a video quáº£ng cÃ¡o. | 0 |
| video_views_p25 | INTEGER | Sá» lÆ°á»£t xem Äáº¡t 25% video quáº£ng cÃ¡o. | 0, 1, 2 |
| video_views_p50 | INTEGER | Sá» lÆ°á»£t xem Äáº¡t 50% video quáº£ng cÃ¡o. | 0, 1, 2 |
| video_views_p75 | INTEGER | Sá» lÆ°á»£t xem Äáº¡t 75% video quáº£ng cÃ¡o. | 0, 1, 2 |
| video_views_p100 | INTEGER | Sá» lÆ°á»£t xem Äáº¡t 100% video quáº£ng cÃ¡o. | 0, 1, 2 |
| conversion | INTEGER | Sá» lÆ°á»£ng chuyá»n Äá»i tá»« quáº£ng cÃ¡o. | 0, 1, 2 |
| app_install | FLOAT | Sá» lÆ°á»£t cÃ i Äáº·t á»©ng dá»¥ng tá»« quáº£ng cÃ¡o. | 0, 1, 2 |
| engagement | INTEGER | Má»©c Äá» tÆ°Æ¡ng tÃ¡c vá»i quáº£ng cÃ¡o. | 0, 1, 2 |

## Domain Knowledge (from Mimir)

- Khi tính các chỉ số hiệu suất quảng cáo (CPM, CPC, CPI, CPV, CPA,…), bắt buộc phải xác định đúng Objective của chiến dịch trước khi tính.
Mỗi Objective sẽ có metric chính (primary metric) khác nhau, do đó công thức cost metric phải được tính dựa trên metric tương ứng, không được dùng chung một mẫu cho tất cả chiến dịch.
Objective = Awareness:
CPM = cost / impression × 1000
Objective = Traffic:
CPC = cost/ outbound_click
Objective = View:
CPV = cost/ view
Objective = Install:
CPI = cost/ app_install
Objective = Engagement:
CPE = cost/ engagement
Objective = Conversion:
CPA = cost/ conversion
- Khi phân tích một chiến dịch, hãy bắt đầu phân tích theo cấu trúc phân cấp từ trên xuống dưới: channel -> segment -> ad_format -> ad_code -> objective -> các chỉ số hiệu suất (CPM, CPC, CPI, CPV, CPA, CPE).
- Khi tính các chỉ số hiệu suất quảng cáo (CPM, CPC, CPI, CPV, CPA, CPE), bắt buộc phải xác định đúng Objective của chiến dịch trước khi tính. Mỗi Objective sẽ có metric chính (primary metric) khác nhau, do đó công thức cost metric phải được tính dựa trên metric tương ứng, không được dùng chung một mẫu cho tất cả chiến dịch.
- Objective = Awareness: CPM = cost / impression × 1000
- Objective = Traffic: CPC = cost / outbound_click
- Objective = View: CPV = cost / view
- Objective = Install: CPI = cost / app_install
- Objective = Engagement: CPE = cost / engagement
- Objective = Conversion: CPA = cost / conversion
- view_2s: Số lượt xem quảng cáo trong 2 giây (chỉ có ở facebook và tiktok)
view_6s: Số lượt xem quảng cáo trong 6 giây (chỉ có ở tiktok)
thruplays: Số lượt phát qua của video quảng cáo (chỉ có ở Facebook)
trueview: Số lượt xem thực tế của quảng cáo (chỉ có ở Google)
focus_view_15s: Số lượt xem tập trung vào quảng cáo trong 15 giây (chỉ có ở Tiktok)

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
