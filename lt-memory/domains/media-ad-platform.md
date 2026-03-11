# MEDIA - AD Platform

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `bf6c7cb8-75d4-493a-894c-ffd71d729cb1`

## Description
Domain này phục vụ cho việc quản lý, tổng hợp và phân tích dữ liệu Media Marketing, bao gồm dữ liệu hiệu suất quảng cáo từ các kênh như Facebook, Google, TikTok, Apple Search Ads, Moloco,…

## Tables

### `momovn-growth-analytics.REPORT_MEDIA.MEDIA_FACT_AD_AGG`
> Bảng fact chứa dữ liệu thống kê quảng cáo tích lũy, dùng để theo dõi và phân tích hiệu suất của các chiến dịch quảng cáo trên nhiều kênh khác nhau.
- Theo dõi chi phí, lượng hiển thị và số lần nhấp chuột của quảng cáo theo từng ngày.
- Phân tích chi tiết các định dạng quảng cáo, kênh và mục tiêu của chiến dịch.
- Đánh giá các mức độ xem video và các chỉ số chuyển đổi của quảng cáo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date` | DATE | Ngày thực hiện chiến dịch quảng cáo. | 2026-01-21, 2026-01-23, 2026-01-22 |
| `month` | DATE | Tháng thực hiện chiến dịch quảng cáo. | 2026-01-01, 2025-12-01, 2025-11-01 |
| `adset_id` | STRING | Mã định danh của nhóm quảng cáo. | tEGbKbf3NZho4TIC, O0A2uRUi7AfQz2nU, zVsNVk2RQtM8Q6V8 |
| `adset_name` | STRING | Tên của nhóm quảng cáo. | adgroup_default_ios, adgroup_default_android, mix |
| `ad_id` | STRING | Mã định danh của quảng cáo. | tEGbKbf3NZho4TIC, O0A2uRUi7AfQz2nU, zVsNVk2RQtM8Q6V8 |
| `ad_name` | STRING | Tên quảng cáo. | adgroup_default_ios, adgroup_default_android, unknown |
| `campaign_id` | STRING | Mã định danh của chiến dịch. | UClCYV2NYQsVFcbN, xzRJ2xa13UjskPHh, dZajtQQ8qNcYxRsq |
| `campaign_name` | STRING | Tên chiến dịch. | Momo Android CPA campaign targeting Registration_PR.41855, Moloco_All_INS_GMC301_NON-mass_N.NTMM-Hellomomo_T.S_C.20250903_PR., Momo Android CPA campaign targeting Registration |
| `account_id` | STRING | Mã định danh của tài khoản. | FQznmNyWDWz60jLL, 7052226950055723010, 489990065003734 |
| `account_name` | STRING | Tên của tài khoản. | Momo, momo marketing, momo daily life service bc |
| `campaign` | STRING | Chiến dịch liên quan. | Ntmm-Hellomomo, Ntmm-Mega25, Lottery |
| `cam` | STRING | Thông tin của chiến dịch (rút gọn). | Ntmm, Lottery, Data |
| `segment` | STRING | Phân khúc đối tượng. | non-mass, momouser, momouser-whitelistuser |
| `ad_code` | STRING | Mã code của quảng cáo. | ad01, ad02, ad03 |
| `ad_format` | STRING | Định dạng của quảng cáo. | null, Video, Image |
| `campaign_type` | STRING | Loại chiến dịch. | S, XL, M |
| `channel` | STRING | Kênh truyền thông được sử dụng. | Moloco, Facebook, Tiktok |
| `objective` | STRING | Mục tiêu của chiến dịch quảng cáo. | Install, Others, Awareness |
| `bu` | STRING | Đơn vị kinh doanh liên quan đến chiến dịch. | Gmc, Dls, Bmc |
| `usecase` | STRING | Trường hợp sử dụng chiến dịch. | Growth - Gtbb/Hlmm, Gmc - Crm, Uti - Data |
| `vertical` | STRING | Ngành dọc liên quan đến chiến dịch. | Platform, Payment, Financial Services |
| `cost` | FLOAT | Chi phí của chiến dịch quảng cáo. | 0, 0.42352199999999995, 0.475605 |
| `impression` | FLOAT | Lượng hiển thị của quảng cáo. | 1, 2, 3 |
| `click` | FLOAT | Số lần nhấp vào quảng cáo. | 1, 0, 2 |
| `outbound_click` | FLOAT | Số lần nhấp ra ngoài trang web. | 1, 0, 2 |
| `view` | INTEGER | Số lần xem quảng cáo. | 0, 1, 2 |
| `view_2s` | INTEGER | Số lần xem quảng cáo trong 2 giây. | 0, 1, 3 |
| `view_6s` | INTEGER | Số lần xem quảng cáo trong 6 giây. | 0, 1, 2 |
| `focus_view_15s` | INTEGER | Số lượt xem tập trung vào quảng cáo trong 15 giây. | 0, 336, 3915 |
| `trueview` | INTEGER | Số lượt xem thực sự của quảng cáo. | 0, 253, 4812 |
| `thruplays` | INTEGER | Số lần xem trọn vẹn của video quảng cáo. | 0 |
| `video_views_p25` | INTEGER | Số lượt xem đạt 25% video quảng cáo. | 0, 1, 2 |
| `video_views_p50` | INTEGER | Số lượt xem đạt 50% video quảng cáo. | 0, 1, 2 |
| `video_views_p75` | INTEGER | Số lượt xem đạt 75% video quảng cáo. | 0, 1, 2 |
| `video_views_p100` | INTEGER | Số lượt xem đạt 100% video quảng cáo. | 0, 1, 2 |
| `conversion` | INTEGER | Số lượng chuyển đổi từ quảng cáo. | 0, 1, 2 |
| `app_install` | FLOAT | Số lượt cài đặt ứng dụng từ quảng cáo. | 0, 1, 2 |
| `engagement` | INTEGER | Mức độ tương tác với quảng cáo. | 0, 1, 2 |

## Memory
*4 entries — user-trained knowledge*

1. Khi tính các chỉ số hiệu suất quảng cáo (CPM, CPC, CPI, CPV, CPA,…), bắt buộc phải xác định đúng Objective của chiến dịch trước khi tính.
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
CPA = cost/ conversion _2026-01-27_
2. Khi phân tích một chiến dịch, hãy bắt đầu phân tích theo cấu trúc phân cấp từ trên xuống dưới: channel -> segment -> ad_format -> ad_code -> objective -> các chỉ số hiệu suất (CPM, CPC, CPI, CPV, CPA, CPE). _2026-01-27_
3. Khi tính các chỉ số hiệu suất quảng cáo (CPM, CPC, CPI, CPV, CPA, CPE), bắt buộc phải xác định đúng Objective của chiến dịch trước khi tính. Mỗi Objective sẽ có metric chính (primary metric) khác nhau, do đó công thức cost metric phải được tính dựa trên metric tương ứng, không được dùng chung một mẫu cho tất cả chiến dịch.
- Objective = Awareness: CPM = cost / impression × 1000
- Objective = Traffic: CPC = cost / outbound_click
- Objective = View: CPV = cost / view
- Objective = Install: CPI = cost / app_install
- Objective = Engagement: CPE = cost / engagement
- Objective = Conversion: CPA = cost / conversion _2026-01-27_
4. view_2s: Số lượt xem quảng cáo trong 2 giây (chỉ có ở facebook và tiktok)
view_6s: Số lượt xem quảng cáo trong 6 giây (chỉ có ở tiktok)
thruplays: Số lượt phát qua của video quảng cáo (chỉ có ở Facebook)
trueview: Số lượt xem thực tế của quảng cáo (chỉ có ở Google)
focus_view_15s: Số lượt xem tập trung vào quảng cáo trong 15 giây (chỉ có ở Tiktok) _2026-01-27_
