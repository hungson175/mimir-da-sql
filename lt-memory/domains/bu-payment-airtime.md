# BU Payment: Airtime

**Domain ID:** `3165cb58-8f0a-4c7d-96e6-ae0b189ff572`

## Description
records all transaction (exclude blacklist user), demographic, user segment of Airtime Service since 2021

## Tables

### `project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_SEGMENT_USER`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month_active` | DATE | Tháng mà người dùng hoạt động. | — |
| `reference` | STRING | Tham chiếu hoặc mã định danh liên quan đến thông tin người dùng. | — |
| `month_lead` | DATE | Tháng dẫn đầu của người dùng trong hoạt động viễn thông tiện ích. | — |
| `retain` | DATE | Thời gian giữ chân người dùng trước khi rời đi. | — |
| `month_churn` | DATE | Tháng mà người dùng khả năng rời đi (churn). | — |
| `user_segment` | STRING | Phân loại người dùng theo nhóm giá trị hoặc hành vi. | — |
| `churn_user` | STRING | Thông tin về người dùng có khả năng rời đi. | — |
| `churn_duration` | INTEGER | Thời gian dự kiến trước khi người dùng rời đi, tính bằng số ngày. | — |
| `FIRST_DATE` | DATE | Ngày đầu tiên ghi nhận dữ liệu hoặc giao dịch của người dùng. | — |
| `LAST_DATE` | DATE | Ngày cuối cùng ghi nhận dữ liệu hoặc giao dịch của người dùng. | — |
| `CHURN_DURATION_DAY` | INTEGER | Số ngày dự kiến trước khi người dùng rời đi. | — |
| `TRANS` | INTEGER | Số lượng giao dịch của người dùng. | — |
| `PREVIOUS_TRANS` | INTEGER | Số lượng giao dịch trong giai đoạn trước của người dùng. | — |
| `GMV` | FLOAT | Tổng giá trị giao hàng (GMV) từ các giao dịch của người dùng. | — |
| `PREVIOUS_GMV` | FLOAT | Tổng giá trị giao hàng (GMV) từ các giao dịch trước của người dùng. | — |
| `PROMOTION_COST` | FLOAT | Chi phí khuyến mãi liên quan đến người dùng. | — |
| `PREVIOUS_VC_AMOUNT` | FLOAT | Số lượng voucher đã sử dụng trong giai đoạn trước. | — |
| `VOUCHER_TYPE_BY_GMV` | STRING | Loại voucher phân loại dựa trên tổng giá trị giao hàng (GMV). | — |
| `PREVIOUS_VOUCHER_TYPE_BY_GMV` | STRING | Loại voucher trước phân loại dựa trên tổng giá trị giao hàng (GMV). | — |
| `VOUCHER_TYPE_BY_TRANS` | STRING | Loại voucher phân loại dựa trên số lượng giao dịch. | — |
| `PREVIOUS_VOUCHER_TYPE_BY_TRANS` | STRING | Loại voucher trước phân loại dựa trên số lượng giao dịch. | — |
| `GMV_TYPE` | STRING | Loại tổng giá trị giao hàng (GMV) được phân loại. | — |
| `PREVIOUS_GMV_TYPE` | STRING | Loại tổng giá trị giao hàng (GMV) trước được phân loại. | — |
| `partner_type` | STRING | Loại đối tác liên quan đến giao dịch của người dùng. | — |
| `num_service` | INTEGER | Số lượng dịch vụ mà người dùng đã sử dụng. | — |
| `first_tid` | INTEGER | Mã định danh đầu tiên của giao dịch của người dùng. | — |

### `project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_DETAILS`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | INTEGER | ID giao dịch.Transaction id | 22857325793, 22873421530, 22873909899 |
| `date` | DATE | Ngày của ID giao dịch.Date of Transaction id | 2021-12-31, 2024-10-10, 2025-09-02 |
| `datetime` | DATETIME | Thời gian của ID giao dịch.datetime of Transaction id | 2023-06-16 10:00:57, 2023-06-16 10:00:56, 2023-06-16 10:01:15 |
| `amount` | FLOAT | Số tiền của ID giao dịch.amount of Transaction id | 10000, 20000, 50000 |
| `mm_amount` | FLOAT | Số tiền Momo trong ID giao dịch (nếu người dùng sử dụng ví Momo để thanh toán).momo amount of Transaction id (if user use momo wallet for payment method) | 10000, 20000, 50000 |
| `cate` | STRING | Mạng di động của ID giao dịch.mobile network of transaction id | Viettel, Mobifone, Vinaphone |
| `service` | STRING | Dịch vụ của ID giao dịch (TOPUP: dịch vụ Topup, MATHE: dịch vụ mua mã thẻ, OTHER: Dịch vụ khác).service of transaction id (TOPUP: dịch vụ Topup, MATHE: dịch vụ mua mã thẻ, OTHER: Dịch vụ khác) | TOPUP, MATHE, OTHERS |
| `subcategory` | STRING | Phân loại phụ của dịch vụ giao dịch. | WHYPAY, Mobifone, OCTA/LOGICH |
| `group_service` | STRING | Nhóm dịch vụ của giao dịch. | Topup&Mathe |
| `merchant` | STRING | Tên nhà cung cấp của ID giao dịch.merchant name of transaction id | TOPUP VIETTEL, TOPUP MOBIFONE, TOPUP VINAPHONE |
| `region` | STRING | Khu vực của nhà cung cấp.region of merchant | Mien Bac |
| `supplier` | STRING | Nhà cung cấp của ID giao dịch.supplier of transaction id | WHYPAY, Mobifone, OCTA/LOGICH |
| `service_code` | STRING | Mã dịch vụ của ID giao dịch.service code of transaction id | vms2.airtime, vttiwhypay_vt.airtime, vttiocta_vt.airtime |
| `bonus` | FLOAT | Thưởng cho người dùng khi thực hiện ID giao dịch.bonus for user when user make transation id | 0, 1500, 750 |
| `gender` | STRING | Giới tính của người thanh toán.gender of user_payment | male, female, MALE |
| `group_age` | STRING | Nhóm tuổi của người thanh toán.group age of user_payment | [2]. 18 - 22 y/o, 23_to_27, [3]. 23 - 26 y/o |
| `age` | NUMERIC | Tuổi của người thanh toán.age of user_payment | 22, 23, 21 |
| `statusid` | INTEGER | Trạng thái của ID giao dịch, 6 = thất bại, 2 = thành công.status of transaction id, 6 = fail, 2 = success | 2, 6 |
| `province` | STRING | Tỉnh của người thanh toán.province of user_payment | Hồ Chí Minh, Hà Nội, Bình Dương |
| `province_group` | STRING | Nhóm tỉnh của người thanh toán.province group of user_payment | Hồ Chí Minh, Others, KCN Miền Nam |
| `user_payment` | STRING | Người dùng thực hiện ID giao dịch (dạng mã hóa).user make transaction id in hashed format | 53401441, 61629589, 47499914 |
| `money_source` | STRING | Nguồn tiền của ID giao dịch khi thanh toán.money source of transaction id when user payment. | momo, bank_link, pay_later |
| `serviceid` | STRING | ID dịch vụ của ID giao dịch.service id of transaction id | topup_Viettel, topup_Mobifone, topup_Vinaphone |
| `partner` | STRING | Số điện thoại được nạp của ID giao dịch (nếu dịch vụ = MATHE, thì không có dữ liệu; nếu dịch vụ = TOPUP, nhưng số điện thoại không phải người dùng Momo thì không có dữ liệu).số điện thoại được nạp của transaction id (if service = MATHE, then no data; if service = TOPUP, but phone number is not momo user then no data) | no data, mathe, 11065161 |
| `telcosource` | STRING | Điểm đầu vào của ID giao dịch.entry point of transaction id | tabbar_home, transaction_result, vouchers_folder_service |
| `revenue` | FLOAT | Doanh thu của ID giao dịch.revenue of transaction id | 310, 950, 170 |
| `month_active` | DATE | Tháng hoạt động của ID giao dịch.month of transaction id | 2025-01-01, 2025-11-01, 2024-09-01 |
| `retain` | DATE | Giá trị giữ lại. | 2024-12-01, 2024-11-01, 2024-09-01 |
| `user_segment` | STRING | Phân khúc người dùng của người thanh toán trong tháng.user segment of user_Payment in month | retain_user, recover_user, new_user |
| `churn_duration` | INTEGER | Thời gian khách hàng không hoạt động = tháng hoạt động - tháng cuối cùng khách hàng hoạt động. Nếu người dùng mới thì thời gian không hoạt động = 0.churn duration of user_payment =month_active - last month user active. if user_segment = new_user then churn_duration = 0 | 1, 2, 3 |
| `quantity` | FLOAT | Số lượng sản phẩm khi người dùng thực hiện giao dịch.quantity of product id when user make transaction | 1, 2, 5 |
| `menh_gia` | FLOAT | Mệnh giá của sản phẩm.mệnh giá của sản phẩm | 10000, 20000, 50000 |
| `goi_cuoc` | STRING | ID sản phẩm của ID giao dịch.product id of transaction id | TUVTT10, TUMBF10, TUVTT20 |
| `dung_luong` | STRING | Dung lượng sản phẩm. | — |
| `expire` | STRING | Ngày hết hạn sản phẩm. | — |
| `partner_type` | STRING | Loại đối tác trong tháng của người thanh toán. Owner: chỉ nạp cho bản thân, Mathe: mua mã thẻ, Partner: nạp cho người khác.partner type in month of user_payment. Owner: chỉ nạp cho bản thân, Mathe: mua mã thẻ, Partner: nạp cho người khác | owner_partner, only_owner, only_partner |
| `typeid` | STRING | ID quà hoặc mã nhập (với chương trình giảm giá trực tiếp) của ID giao dịch, nếu không có dữ liệu thì đây không phải giao dịch khuyến mãi.giftid or entercode (with discount direct scheme) of transaction id, if typeid is no data then this is a no promotion transaction | crm1908_mathe_10_napdt, crm1908_mathe_10_napdt_2312, crm1908_mathe_5_napdt |
| `vc_amount` | FLOAT | Số lượng voucher.voucher amount | 0, 10000, 5000 |
| `voucher_or_not` | STRING | Loại khuyến mãi của ID giao dịch. Voucher: giao dịch có khuyến mãi, Non_voucher: giao dịch không có khuyến mãi.promotion type of transaction id. Voucher: transaction have promotion, Non_voucher: transaction with no promotion | Non voucher, Voucher |
| `promotion_type` | STRING | Loại khuyến mãi. | organic, voucher, cashback |
| `partner_momo_user` | STRING | Loại người dùng được nạp. momo user: người được nạp có sử dụng app Momo, owner: người đi nạp tự nạp cho bản thân, non momo user: người được nạp không sử dụng Momo, mathe: user mua mã thẻ.Loại user được nạp. momo user: người được nạp có sử dụng app Momo,  owner: người đi nạp tự nạp cho bản thân, non momo user: người được nạp không sử dụng Momo, mathe: user mua mã thẻ | owner, momo user, mathe |
| `voucher_type_by_gmv` | STRING | Hành vi sử dụng khuyến mãi GMV của người dùng trong tháng. ONLY ORGANIC: Không sử dụng bất kỳ khuyến mãi nào, GMV MORE ORGANIC: Có sử dụng khuyến mãi, nhưng phần lớn là không sử dụng khuyến mãi, GMV MORE VOUCHER: Chủ yếu sử dụng khuyến mãi, ONLY VOUCHER: Chỉ sử dụng khuyến mãi.behavior of promotion gmv of user in month. ONLY ORGANIC: Không sử dụng bất kỳ promotion nào, GMV MORE ORGANIC: Có sử dụng promotion, nhưng phần lớn là không sử dụng promotion, GMV MORE VOUCHER: Chủ yếu sử dụng promotion, ONLY VOUCHER: Chỉ sử dụng promotion | ONLY ORGANIC, ONLY VOUCHER, GMV MORE ORGANIC |
| `previous_voucher_type_by_gmv` | STRING | Hành vi sử dụng khuyến mãi GMV của người dùng trong tháng trước khi sử dụng dịch vụ nạp tiền điện thoại. ONLY ORGANIC: Không sử dụng bất kỳ khuyến mãi nào, GMV MORE ORGANIC: Có sử dụng khuyến mãi, nhưng phần lớn là không sử dụng khuyến mãi, GMV MORE VOUCHER: Chủ yếu sử dụng khuyến mãi, ONLY VOUCHER: Chỉ sử dụng khuyến mãi.behavior of promotion gmv of user in last month user active Airtime service. ONLY ORGANIC: Không sử dụng bất kỳ promotion nào, GMV MORE ORGANIC: Có sử dụng promotion, nhưng phần lớn là không sử dụng promotion, GMV MORE VOUCHER: Chủ yếu sử dụng promotion, ONLY VOUCHER: Chỉ sử dụng promotion | ONLY ORGANIC, ONLY VOUCHER, GMV MORE ORGANIC |
| `voucher_type_by_trans` | STRING | Hành vi sử dụng khuyến mãi trong các giao dịch của người dùng trong tháng. ONLY ORGANIC: Không sử dụng bất kỳ khuyến mãi nào, GMV MORE ORGANIC: Có sử dụng khuyến mãi, nhưng phần lớn là không sử dụng khuyến mãi, GMV MORE VOUCHER: Chủ yếu sử dụng khuyến mãi, ONLY VOUCHER: Chỉ sử dụng khuyến mãi.behavior of promotion in trans of user in month. ONLY ORGANIC: Không sử dụng bất kỳ promotion nào, GMV MORE ORGANIC: Có sử dụng promotion, nhưng phần lớn là không sử dụng promotion, GMV MORE VOUCHER: Chủ yếu sử dụng promotion, ONLY VOUCHER: Chỉ sử dụng promotion | ONLY ORGANIC, ONLY VOUCHER, TRANS MORE ORGANIC |
| `previous_voucher_type_by_trans` | STRING | Hành vi sử dụng khuyến mãi trong các giao dịch của người dùng trong tháng trước khi sử dụng dịch vụ nạp tiền điện thoại. ONLY ORGANIC: Không sử dụng bất kỳ khuyến mãi nào, TRANS MORE ORGANIC: Có sử dụng khuyến mãi, nhưng phần lớn là không sử dụng khuyến mãi, TRANS MORE VOUCHER: Chủ yếu sử dụng khuyến mãi, ONLY VOUCHER: Chỉ sử dụng khuyến mãi.behavior of promotion in trans of user in last month user active Airtime service. ONLY ORGANIC: Không sử dụng bất kỳ promotion nào, TRANS MORE ORGANIC: Có sử dụng promotion, nhưng phần lớn là không sử dụng promotion, TRANS MORE VOUCHER: Chủ yếu sử dụng promotion, ONLY VOUCHER: Chỉ sử dụng promotion | ONLY ORGANIC, ONLY VOUCHER, GMV MORE ORGANIC |
| `prev_aov` | FLOAT | Giá trị đơn hàng trung bình của người dùng trong tháng trước khi hoạt động.AOV of user in last month active | 10000, 20000, 100000 |
| `telco_source_raw` | STRING | Nguồn gốc thô của telco. | tabbar_home_revamp_payX, tabbar_home_payX, tabbar_home |
| `suffix` | STRING | Nơi chi tiết của nguồn telco.details place of telco_source | button_vts, button_ttt, cross_sale_both |
| `user_raw` | STRING | Dữ liệu thô của người dùng. | 53401441, 47499914, 21654350 |
| `promotion_cost_type` | STRING | Loại chi phí khuyến mãi của giao dịch. BU: ngân sách của đội ngũ chúng tôi, organic: không khuyến mãi, other teams: đội ngũ khác trong Momo.promotion cost type of transaction. BU: budget of our team, organic: no promotion, other teams: other teams in Momo | organic, other teams, BU |
| `rfm_type` | STRING | Xếp hạng lòng trung thành của người dùng trong tháng.loyalty rank of user in month | Champions, Potential Loyalist, Loyal Customers |
| `last_3_month_rfm_type` | STRING | Xếp hạng lòng trung thành của người dùng trong 3 tháng trước.loyalty rank of user in last 3 month | Champions, Potential Loyalist, Loyal Customers |
| `acquire_user_channel` | STRING | Loại chi phí khuyến mãi của giao dịch đầu tiên của người dùng. BU: ngân sách của đội ngũ chúng tôi, organic: không khuyến mãi, other teams: đội ngũ khác trong Momo.promotion cost type of first transaction id of user. BU: budget of our team, organic: no promotion, other teams: other teams in Momo | organic, other teams, BU |
| `movement_status` | STRING | Trạng thái trung thành của người dùng trong 3 tháng trước.loyalty status of user in last 3 month | maintain customer type, educate success, on educate process |
| `ttt_segment` | STRING | Phân khúc TTT. | churn_TTT, non_TTT, 2.Retain |

### `project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_MAU_BY_1ST_TRAN_ALL`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `USER_PAYMENT` | STRING | Phương thức thanh toán của người dùng. | 40051189, 63887607, 63118040 |
| `USER_SEGMENT` | STRING | Phân khúc người dùng. | retain_user, recover_user, new_user |
| `VOUCHER_OR_NOT` | STRING | Trạng thái sử dụng voucher hay không. 'Yes' nếu có sử dụng, 'No' nếu không sử dụng. | Non voucher, Voucher |
| `DATE` | DATE | Ngày giao dịch đầu tiên trong tháng. | 2025-09-02, 2025-12-01, 2024-07-01 |
| `DATETIME` | DATETIME | Ngày và giờ cụ thể của giao dịch. | 2025-06-02 10:30:42, 2025-09-09 15:37:06, 2022-03-13 16:34:46 |
| `MONTH_ACTIVE` | DATE | Tháng hoạt động của người dùng. | 2025-11-01, 2024-09-01, 2025-10-01 |
| `CATE` | STRING | Danh mục dịch vụ được sử dụng. | Viettel, Mobifone, Vinaphone |
| `SERVICE` | STRING | Tên dịch vụ được sử dụng. | TOPUP, MATHE, OTHERS |
| `AMOUNT` | FLOAT | Số tiền giao dịch airtime. | 10000, 100000, 50000 |
| `ID` | INTEGER | ID định danh cho giao dịch. | 69045401858, 69024132187, 69005214187 |
| `REVENUE` | FLOAT | Doanh thu từ giao dịch airtime. | 170, 180, 310 |
| `VC_AMOUNT` | FLOAT | Giá trị voucher được sử dụng trong giao dịch. | 10000, 5000, 7000 |
| `typeid` | STRING | Loại giao dịch được thực hiện. | crm1908_mathe_10_napdt_2312, crm1908_mathe_10_napdt, crm1908_mathe_5_napdt_vcn_ea60_20231106 |
| `MENH_GIA` | FLOAT | Mệnh giá giao dịch airtime. | 10000, 100000, 50000 |
| `CHURN_DURATION` | INTEGER | Thời gian người dùng ngừng hoạt động trước đó. | 1, 2, 3 |
| `PROVINCE_GROUP` | STRING | Nhóm tỉnh thành của người dùng. | Hồ Chí Minh, Others, KCN Miền Nam |
| `GROUP_AGE` | STRING | Nhóm độ tuổi của người dùng. | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [4]. 27 - 30 y/o |
| `GENDER` | STRING | Giới tính của người dùng. | male, female, unknown |
| `PARTNER_TYPE` | STRING | Loại đối tác cung cấp dịch vụ. | only_owner, only_partner, owner_partner |
| `promotion_cost_type` | STRING | Loại chi phí khuyến mãi áp dụng cho giao dịch. | organic, other teams, BU |
| `money_source` | STRING | Nguồn tiền sử dụng trong giao dịch. | momo, bank_link, TTT |
| `RANK_USER` | INTEGER | Xếp hạng người dùng dựa trên mức độ hoạt động. | 1 |

## Memory
*29 entries — user-trained knowledge*

1. cùng kỳ: extract(day from date) of month_active = extract(day from date) of last month _Airtime · 2025-05-13_
2. Doanh thu cần được chia cho 1.1 khi tính toán _Airtime · 2025-07-30_
3. Khi xử lý dữ liệu người dùng duy nhất hàng ngày của voucher team khác, sử dụng bảng `BU_UTILITIES_TELCO.AIRTIME_MAU_BY_1ST_TRAN_ALL` thay vì `BU_UTILITIES_TELCO.AIRTIME_DETAILS` _Airtime · 2025-08-07_
4. user: user_payment or reference _Airtime · 2025-05-13_
5. giftid: typeid _Airtime · 2025-05-13_
6. Truy vấn MAU nạp điện thoại topup tháng 9 không cần lọc theo trạng thái giao dịch _2025-09-07_
7. Unique user sử dụng bảng project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_MAU_BY_1ST_TRAN_ALL _Airtime · 2025-08-05_
8. MAU: phải thêm điều kiện statusid = 2 _Airtime · 2025-05-13_
9. Để lấy số lượng transaction, sử dụng count(distinct id) _Airtime · 2025-07-31_
10. Dữ liệu trong bảng AIRTIME_SEGMENT_USER tự động loại trừ các người dùng trong danh sách đen (blacklist) _Airtime · 2025-08-04_
11. Khi user hỏi nhà mạng, hỏi user lấy nhà mạng chính hay lấy nhà mạng ảo (mnvo) _Airtime · 2025-08-04_
12. Bảng AIRTIME_MAU_BY_1ST_TRAN_ALL không chứa thông tin về trạng thái giao dịch _2025-09-07_
13. DAU sử dụng bảng project-5400504384186300846.BU_UTILITIES_TELCO.AIRTIME_DETAILS _2025-10-02_
14. giao dịch thành công: statusid = 2 _Airtime · 2025-05-13_
15. TTT: Túi Thần Tài _Airtime · 2025-05-13_
16. Khi xử lý dữ liệu nhóm tuổi, sử dụng giá trị group_age = '[2]. 18 - 22 y/o' hoặc group_age = '18_to_22' _Airtime · 2025-07-31_
17. Khi xử lý vấn đề liên quan tới MAU, không cần lọc theo lower(cate) _Airtime · 2025-08-04_
18. Logic unique user: số user ngày sau không bao gồm user đã active ngày trước đó _2025-10-16_
19. Tỷ lệ giữ chân hàng tháng (retention rate tháng T) = số lượng retain user tháng T / MAU tháng T-1 _2025-10-27_
20. Mặc định các giao dịch thành công có statusid = 2. Chỉ khi nào được hỏi về giao dịch thất bại thì mới đổi thành statusid = 6. _2026-01-06_
21. MAU có thể được tính từ ngày 1/11/2025 đến 5/11/2025 bằng cách sử dụng cột date thay vì MONTH_ACTIVE _2025-12-08_
22. Túi thần tài: money_source = TTT _Airtime · 2025-05-13_
23. Để lấy số lượng user active, sử dụng count(distinct user_payment) _Airtime · 2025-07-31_
24. Nếu user muốn lấy nhà mạng ảo thì dùng câu query với case statement cho các serviceid tương ứng
case
  when serviceid in ('EPAY_VIETTEL', 'topup_Viettel') then 'Viettel'
  when serviceid in ('topup_Vinaphone', 'EPAY_VINAFONE') then 'Vinaphone'
  when serviceid = 'topup_Itel' then 'iTel'
  when serviceid in ('EPAY_VIETNAMOBILE', 'topup_Vietnamobile') then 'Vietnamobile'
  when serviceid = 'topup_Local' then 'Local'
  when serviceid in ('buycard_Reddi', 'topup_Reddi') then 'Wintel'
  when serviceid = 'topup_Saymee' then 'Saymee'
  when serviceid in ('topup_Mobifone', 'EPAY_MOBIFONE') then 'Mobifone'
  else 'OUTAPP PAYMENT'
end as mvno _Airtime · 2025-08-04_
25. Nếu user muốn lấy nhà mạng chính thì dùng cột cate _Airtime · 2025-08-04_
26. Khi truy vấn số lượng người dùng theo từng nhóm, cần sử dụng count(distinct user_payment) _Airtime · 2025-07-31_
27. Số user sử dụng voucher: dùng cột voucher_or_not = 'Voucher' _Airtime · 2025-08-05_
28. Số user theo loại promotion: cột promotion_cost_type, trong đó: BU = voucher từ budget của Airtime, organic: user không dùng voucher, other teams: voucher từ budget của team khác _Airtime · 2025-08-05_
29. Khi truy vấn MAU nhà mạng MobiFone từ ngày 1/11/2025 - 2/11/2025, sử dụng cột date thay vì month_active _2026-03-03_
