# BU Payment: EPS-TOPBRAND

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `72fbb966-0b9b-4205-a433-b14fca48597d`

## Description
Domain này tập trung vào user và merchant thuộc Topband (Phòng ban là EPS: Enterprise project solution).
Momo đóng vai trò là bên cung cấp giải pháp thanh toán cho Topbrand merchant offline, khi user đến thanh toán tại merchant có thể thanh toán đa dạng qua nhiều hình như: scan pos, scan QR, NFC, ....
Topband bao gồm các merchant lớn có doanh thu hàng lớn, có nhiều chi nhánh và cửa hàng. Momo sẽ có thu phí trên từng giao dịch nên sẽ thu được doanh thu trên từng giao dịch đó (revenue).

## Tables

### `project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION`
> Bảng dimension lưu trữ thông tin giao dịch của người dùng EPS. Thông tin từ bảng này bao gồm:
- Thời gian giao dịch và loại giao dịch
- Phương thức thanh toán và kênh thanh toán
- Thông tin chi tiết về dịch vụ và mã dịch vụ sử dụng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date_time` | DATETIME | Thời điểm diễn ra giao dịch. | 2020-10-30 03:22:51, 2020-10-30 03:33:06, 2021-06-29 01:51:49 |
| `month` | DATE | Tháng diễn ra giao dịch. | 2025-12-01, 2025-11-01, 2025-10-01 |
| `trans_type` | STRING | Loại giao dịch. | fill from old data, no trans_type, m4bpay, m4bpay_va |
| `agent_id` | STRING | Mã định danh cho mỗi ví MoMo. | unknown, 41395756, 42625417 |
| `service_lv1` | STRING | Cấp độ dịch vụ 1 liên quan đến giao dịch. | offline_m2m, offline_b2m, missing_classify |
| `service_lv2` | STRING | Cấp độ dịch vụ 2 liên quan đến giao dịch. | offline_m2m_eps, offline_b2m_eps, missing_classify |
| `service_lv3` | STRING | Cấp độ dịch vụ 3 liên quan đến giao dịch. | offline_m2m_eps_retail, offline_m2m_eps_fnb, offline_b2m_eps_medium |
| `merchant_code` | STRING | Mã định danh của đối tác cung cấp dịch vụ. | MOMOAONI20180131, MOMONLXZ20220217, MINISTOPVN |
| `store_code` | STRING | Mã cửa hàng liên quan đến giao dịch. | , 1001, 11 |
| `service_code` | STRING | Mã dịch vụ liên quan đến hóa đơn. | m4bopcbhx_offline, billpaycirclek, billpayministop |
| `payment_method` | STRING | Phương thức thanh toán mà người dùng lựa chọn. | captureWallet, pos, payWithStatic |
| `payment_channel` | STRING | Kênh thanh toán mà người dùng sử dụng. | pos, banktransfer_qr, qr |
| `payment_type_group` | STRING | Nhóm loại thanh toán. | momo, bank |
| `payment_method_group` | STRING | Nhóm phương thức thanh toán. | aio_dynamic_qr, pos_scanner, vietqr |
| `service_id` | STRING | Mã định danh của dịch vụ. | momoqr |
| `cate` | STRING | Danh mục của giao dịch. | retail, fnb, medium |
| `is_merchant_acquired_by_third_party_m4b` | INTEGER | Giao dịch được thực hiện thông qua đối tác M4B bên thứ ba (1: Đúng, 0: Sai). | 0, 1 |
| `is_master_merchant` | INTEGER | Xác định đây có phải là master merchant hay không (1: Đúng, 0: Sai). | 0, 1 |
| `master_merchant_label` | STRING | Nhãn định danh cho master merchant. | not master merchant, ipos, topos |
| `is_dynamic_qr` | INTEGER | Sử dụng mã QR động trong giao dịch (1: Đúng, 0: Sai). | 1, 0 |
| `first_date_dynamic_qr` | DATE | Ngày đầu tiên sử dụng mã QR động. | 2025-01-01, 2025-06-09, 2025-06-19 |
| `merchant_size_sl` | STRING | Quy mô của thương gia. | topbrand offline, medium offline, sme offline |
| `category_sl_lv1` | STRING | Cấp danh mục 1 của mã SL. | topbrand offline, sme offline, topbrand online |
| `category_sl_lv2` | STRING | Cấp danh mục 2 của mã SL. | retail, fnb, service |
| `category_sl_lv3` | STRING | Cấp danh mục 3 của mã SL. | grocery, beverage, food |
| `category_sl_lv4` | STRING | Cấp danh mục 4 của mã SL. | cvs, coffee, minimart |
| `category_sl_lv5` | STRING | Cấp danh mục 5 của mã SL. | other, partner-miniapp, deal package |
| `category_sl_lv6` | STRING | Cấp danh mục 6 của mã SL. | fixed location, mobile location, online only |
| `merchant_name_sl` | STRING | Tên thương gia của mã SL. | — |
| `merchant_name_adjust` | STRING | Tên điều chỉnh của thương gia. | — |
| `gender` | STRING | Giới tính của người dùng. | female, male, unknown |
| `age` | INTEGER | Tuổi của người dùng. | 22, 23, 24 |
| `age_group` | STRING | Nhóm tuổi của người dùng. | [3]. 23 - 26 y/o, [2]. 18 - 22 y/o, unknown |
| `city` | STRING | Thành phố nơi diễn ra giao dịch. | Hồ Chí Minh, Hà Nội, Bình Dương |
| `industrial_park` | STRING | Khu công nghiệp liên quan đến giao dịch. | Hồ Chí Minh, Unknown, Hà Nội |
| `city_group_focus` | STRING | Nhóm thành phố được tập trung. | Hồ Chí Minh, UNKNOWN, Hà Nội |
| `region` | STRING | Vùng miền liên quan đến giao dịch. | — |
| `bank_code` | STRING | Mã ngân hàng liên quan đến giao dịch. | not defined or m2m, MBB, VCB |
| `bank_name` | STRING | Tên ngân hàng liên quan đến giao dịch. | not defined or m2m, MBBank, TMCP Ngoại Thương Việt Nam |
| `agent_id_mapped` | STRING | Mã định danh ví MoMo đã được ánh xạ. | not defined or m2m, 80713715, 34608078 |
| `bank_mapped_momo_status` | INTEGER | Trạng thái ngân hàng đã liên kết qua MoMo (1: Đúng, 0: Sai). | -1, 0, 1 |
| `user_type_department_monthly` | STRING | Loại người dùng theo phòng ban hàng tháng. | retained, reactivated, new |
| `user_type_service_lv1_monthly` | STRING | Loại người dùng dịch vụ cấp 1 hàng tháng. | retained, reactivated, new |
| `user_type_service_lv2_monthly` | STRING | Loại người dùng dịch vụ cấp 2 hàng tháng. | retained, reactivated, new |
| `user_type_service_lv3_monthly` | STRING | Loại người dùng dịch vụ cấp 3 hàng tháng. | retained, reactivated, new |
| `user_type_momoqr_cate_lv3_monthly` | STRING | Loại người dùng MoMo QR danh mục cấp 3 hàng tháng. | retained, reactivated, new |
| `user_type_sof_monthly` | STRING | Loại người dùng nguồn tiền hàng tháng. | retained, reactivated, new |
| `user_type_merchant_monthly` | STRING | Loại người dùng thương gia hàng tháng. | retained, reactivated, new |
| `user_type_momoqr_cate_lv3_department_monthly` | STRING | Loại người dùng MoMo QR cấp 3 theo phòng ban hàng tháng. | retained, reactivated, new |
| `user_type_sof_department_monthly` | STRING | Loại người dùng nguồn tiền theo phòng ban hàng tháng. | retained, reactivated, new |
| `user_type_overlap_service_lv1_monthly` | STRING | Loại người dùng dịch vụ có sự chồng chéo cấp 1 hàng tháng. | overlap_m2m_m2b, only_m2m, only_m2b |
| `user_type_overlap_service_lv1_department_monthly` | STRING | Loại người dùng dịch vụ có sự chồng chéo cấp 1 theo phòng ban hàng tháng. | only_m2m |
| `is_paid_transaction` | INTEGER | Giao dịch đã được thanh toán (1: Đúng, 0: Sai). | 0, 1 |
| `is_paid_user` | INTEGER | Người dùng đã thanh toán (1: Đúng, 0: Sai). | 0, 1 |
| `is_paid_user_department` | INTEGER | Người dùng đã thanh toán theo phòng ban (1: Đúng, 0: Sai). | 0, 1 |
| `bank_account_no` | STRING | Số tài khoản ngân hàng. | — |
| `user_type_bank_register` | STRING | Loại người dùng đăng ký ngân hàng. | single_bank, multi_bank |
| `date` | DATE | Ngày diễn ra giao dịch. | 2026-01-11, 2026-01-18, 2025-12-07 |
| `tid` | STRING | Mã giao dịch. | -1, 96343090547, 92128872238 |
| `money_source` | STRING | Nguồn tiền sử dụng trong giao dịch. | 1, 2, 7 |
| `pic` | STRING | Người phụ trách giao dịch. | — |
| `usecase` | STRING | Tình huống sử dụng. | cvs, coffee, minimart |
| `is_new_momo` | INTEGER | Người dùng mới của MoMo (1: Đúng, 0: Sai). | 0, 1 |
| `is_1st_trans_in_month` | INTEGER | Giao dịch đầu tiên trong tháng (1: Đúng, 0: Sai). | 0, 1 |
| `gam` | STRING | Ghi chú giao dịch GAM. | quyen.nguyen13, nhu.tran, trang.le1 |
| `store_name` | STRING | Tên cửa hàng liên quan đến giao dịch. | — |
| `amount` | FLOAT | Số tiền trong giao dịch. | 25000, 20000, 15000 |
| `revenue` | FLOAT | Doanh thu từ giao dịch. | 0, 150, 180 |
| `promo_amount` | FLOAT | Số tiền khuyến mãi trong giao dịch. | 20000, 10000, 1000 |
| `gift_id` | STRING | Mã quà tặng liên quan đến giao dịch. | 0NMW1ZT32XDBF, 0KQ019VK6DYY0, 0N7XS7MZAXEE0 |
| `gift_type_id` | STRING | Loại mã quà tặng. | mds_ps_fuze_250513_giam_100pt12k_7hli1, mds_ps_hlcmini_250210_giam_20pt20k_q9tbk, mds_ps_thumsup_250326_giam_100pt13k_0lyzj |
| `campaign_id` | STRING | Mã chiến dịch quảng cáo. | 250519_budget_clvc_sljvuwgaa, 250211_budget_clvc_0wow5i065, viper |
| `gift_amount` | FLOAT | Số tiền của quà tặng. | 20000, 10000, 1000 |
| `promo_agent` | STRING | Đại lý thực hiện chương trình khuyến mãi. | kgs_mds302_rewards_25q01, kgs_dls306_mcinv_b2b_20250519_0005, kgs_dls306_mcinv_b2b_20250326_0052 |
| `is_eps_paid_transaction` | INTEGER | Giao dịch EPS đã thanh toán (1: Đúng, 0: Sai). | 0, 1 |
| `is_eps_paid_user` | STRING | Người dùng EPS đã thanh toán. | ORGANIC, PAID |
| `user_type_overlap_cate_monthly` | STRING | Loại người dùng có danh mục chồng lấn hàng tháng. | retail, fnb, retail, fnb, retail, medium |

### `momovn-prod.MBI_DA.F_OFFLINE_GIFT_REDEEM`
> This is a fact table for offline gift redemption transactions. It contains information about gift redemption activities, details of the gift such as type and ID, associated campaign, payment and amounts related to vouchers and cashbacks, along with timestamps for redemption and modifications. Potential use cases include: 
Tracking gift redemption trends and patterns 
Analyzing the effectiveness of gift-based marketing campaigns 
Understanding voucher and cashback implications in gift redemption

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `gift_id` | STRING | Mã định danh của món quà được đổi. | 0NJVZSDHEXDAB, 0NKRB94YYDYZJ, 0NKM15ZZAXCV6 |
| `gift_type_id` | STRING | Mã định danh loại của món quà được đổi. | rw_bau_251001_giam_100pt1k_219a7, rw_bau_251029_giam_100pt1k_9278s, rw_bau_251127_giam_100pt1k_cgbyy |
| `campaign_id` | STRING | Mã định danh của chiến dịch liên quan đến việc đổi quà. | rewards_budget_coin_reward_251001_mrqakq729, rewards_budget_coin_reward_251029_lf1z3omjb, rewards_budget_coin_reward_251127_o6965qyp5 |
| `agent_id` | STRING | Mã định danh của mỗi ví MoMo thực hiện giao dịch đổi quà. | 38505493, 53908432, 55833731 |
| `deliver_time` | DATETIME | Thời gian giao món quà cho người nhận. | 2025-12-31 12:50:00, 2025-11-24 20:00:03, 2025-11-11 20:00:02 |
| `agent` | STRING | Thông tin về đại lý thực hiện đổi quà. | kgs_mds302_251001_0021_reward, kgs_mds302_251029_0099_reward, kgs_mds302_251127_0031_reward |
| `tid` | STRING | Mã định danh cho giao dịch đổi quà. | 103353465312, 100329839507, 103452451967 |
| `gift_tid` | STRING | Mã định danh của giao dịch  liên quan đến món quà. | 107896652269, 107962896119, 107893411160 |
| `payment_amount` | FLOAT | Số tiền thanh toán trong giao dịch đổi quà. | 10000, 20000, 50000 |
| `vc_amount` | FLOAT | Số tiền từ voucher sử dụng trong giao dịch đổi quà. | 1000, 0, 2000 |
| `cb_amount` | FLOAT | Số tiền cashback được nhận trong giao dịch đổi quà. | 0, 3000, 5000 |
| `bnvc_amount` | FLOAT | Số tiền của voucher BNVC được sử dụng trong giao dịch đổi quà. | 0 |
| `redeem_time` | DATETIME | Thời gian thực hiện đổi quà. | 2025-10-26 16:07:55.873, 2026-01-04 12:48:24.515, 2025-11-09 19:37:00.188 |
| `redeem_date` | DATE | Ngày thực hiện đổi quà. | 2025-12-03, 2025-12-10, 2025-12-09 |
| `modify_time` | DATETIME | Thời gian sửa đổi thông tin giao dịch đổi quà. | 2025-11-18 11:19:58.060, 2025-06-14 10:45:54.357, 2025-09-03 10:23:56.450 |

### `momovn-prod.MBI_DA.F_OFFLINE_GIFT_APPLICABLE`
> Bảng fact momovn-prod.MBI_DA.F_OFFLINE_GIFT_APPLICABLE lưu trữ thông tin về các món quà offline có thể áp dụng. Sử dụng bảng này để xác định thông tin món quà, loại món quà và chiến dịch liên quan. Bên cạnh đó, bảng còn cung cấp dữ liệu về thời gian giao món quà và thời gian áp dụng món quà.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `gift_id` | STRING | Mã định danh của món quà. | 0KH41M8G0DTC0, 0K3MKHX49BH20, 0JQ5NCEN7H8EC |
| `gift_type_id` | STRING | Mã loại của món quà. | fs_vts_new_250528_cbttt_100pt30k_s6sil, fs_vts_new_250619_cbttt_100pt30k_665je, fs_vts_new_250515_cbttt_100pt30k_4z0m8 |
| `campaign_id` | STRING | Mã định danh của chiến dịch mà món quà được áp dụng. | viper, qn_10k_new_t7__budget_open_app_250704_omt0od7s6, 250806_sme_budget_open_app_250806_w8ssjetu8 |
| `amount` | FLOAT | Số tiền hoặc giá trị của món quà. | 10000, 30000, 5000 |
| `agent_id` | STRING | Mã định danh của mỗi ví MoMo, nơi món quà được gửi. | 81591973, 40914192, 50397870 |
| `agent` | STRING | Tên hoặc thông tin của đại lý liên quan đến việc gửi món quà. | kgs_sp301_20250704_0015, kgs_dls301_20250806_0031, kgs_dls301_20250721_0126 |
| `deliver_time` | DATETIME | Thời điểm giao món quà. | 2025-08-15 17:23:37, 2025-08-15 13:25:59, 2025-08-15 13:24:37 |
| `deliver_date` | DATE | Ngày giao món quà. | 2025-06-18, 2025-06-12, 2025-06-06 |
| `start_time` | DATETIME | Thời điểm bắt đầu áp dụng món quà. | 2025-05-19 19:00:00, 2025-08-26 20:00:00, 2025-12-01 00:00:00 |
| `end_time` | DATETIME | Thời điểm kết thúc áp dụng món quà. | 2025-07-31 23:59:59, 2025-06-30 23:59:00, 2025-03-31 23:59:59 |
| `modify_time` | DATETIME | Thời điểm chỉnh sửa thông tin món quà. | 2025-12-26 20:00:00, 2025-12-26 21:00:00, 2026-01-07 17:45:33.933 |

### `project-5400504384186300846.MBI_DA.D_EPS_USER_TYPE_SOF_MONTHLY`
> Bảng dimension chứa thông tin chi tiết hàng tháng về loại người dùng liên quan đến nguồn tiền (SOF) và các hoạt động khác. Dữ liệu từ bảng này có thể được sử dụng để:
- Theo dõi các nguồn tiền được sử dụng bởi các loại người dùng khác nhau vào mỗi tháng
- Phân tích sự thay đổi trong hoạt động của người dùng qua các tháng và xác định xu hướng sử dụng
- Đánh giá hiệu quả của các loại khuyến mãi liên kết với nguồn tiền và loại người dùng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | STRING | Mã định danh cho mỗi ví MoMo | 35044131, 45520457, 34973635 |
| `month` | DATE | Tháng liên kết với các hoạt động của người dùng | 2024-01-01, 2023-12-01, 2024-06-01 |
| `money_source` | STRING | Nguồn tiền được sử dụng bởi người dùng trong tháng | 1, 2, 6 |
| `promo_type` | STRING | Loại khuyến mãi áp dụng cho nguồn tiền và người dùng | ORGANIC, PAID |
| `merchant` | STRING | Thông tin về merchant liên quan đến giao dịch | — |
| `current_active_type` | STRING | Loại hoạt động hiện tại của người dùng | active, soft churn, hard churn |
| `tid` | STRING | ID giao dịch | 898882963, 897458959, 895359724 |
| `last_active_month` | DATE | Tháng gần nhất mà người dùng hoạt động | 2023-12-01, 2024-05-01, 2023-11-01 |
| `next_active_month` | DATE | Tháng tiếp theo người dùng dự kiến hoạt động | 2023-12-01, 2024-03-01, 2024-05-01 |
| `month_diff_from_last_active` | INTEGER | Sự khác biệt về số tháng từ thời điểm người dùng hoạt động gần nhất | 2, 3, 4 |
| `month_diff_to_next_active` | INTEGER | Sự khác biệt về số tháng đến thời điểm người dùng dự kiến sẽ hoạt động tiếp theo | 0, 1, 2 |
| `user_type` | STRING | Loại người dùng dựa trên hoạt động và nguồn tiền | retained, churn, reactivated |

### `project-5400504384186300846.MBI_DA.DM_EPS_USER_TYPE_MONTHLY`
> Bảng dimension chứa thông tin hàng tháng về loại người dùng EPS và hoạt động của họ. Thông tin được trích xuất từ bảng này bao gồm: 
- Mã định danh của từng ví MoMo và hoạt động người dùng theo tháng 
- Thông tin khuyến mại áp dụng cho người dùng 
- Loại người dùng hiện tại và các hoạt động liên quan đến merchant

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | STRING | Mã định danh cho mỗi ví MoMo. | 45678601, 15464699, 32828118 |
| `month` | DATE | Tháng mà thông tin người dùng được ghi nhận. | 2024-01-01, 2023-12-01, 2025-12-01 |
| `promo_type` | STRING | Loại chương trình khuyến mại áp dụng cho người dùng trong tháng. | ORGANIC, PAID |
| `merchant` | STRING | Nhà bán hàng hoặc merchant liên quan đến giao dịch của người dùng. | — |
| `current_active_type` | STRING | Loại hoạt động hiện tại của người dùng. | active, soft churn, hard churn |
| `tid` | STRING | Mã giao dịch (Transaction ID) dùng để xác định giao dịch cụ thể. | 65989624044, 65842587786, 66427919858 |
| `last_active_month` | DATE | Tháng cuối cùng mà người dùng có hoạt động. | 2023-12-01, 2023-11-01, 2024-05-01 |
| `next_active_month` | DATE | Tháng tiếp theo dự kiến người dùng sẽ hoạt động. | 2025-12-01, 2023-12-01, 2024-03-01 |
| `month_diff_from_last_active` | INTEGER | Số tháng kể từ tháng cuối cùng người dùng hoạt động. | 2, 3, 4 |
| `month_diff_to_next_active` | INTEGER | Số tháng dự kiến cho đến khi người dùng hoạt động tiếp theo. | 0, 1, 2 |
| `user_type` | STRING | Loại người dùng EPS xác định trong tháng. | retained, churn, reactivated |

### `project-5400504384186300846.MBI_DA.DM_EPS_SKU_BY_BRAND`
> Bảng chứa thông tin user mua hàng tại các nhãn hàng (Nestle) qua Momo tại các partner merchant: Coop mart, bách hóa xanh,....
Chi tiết theo các sản phẩm (SKU) trong mỗi 1 đơn hàng, vì vậy TID có thể lặp lại do trong 1 bill user thanh toán nhiều sản phẩm.

Thông tin có thể thu thập từ bảng này:
- Theo dõi các giao dịch của user tại các nhãn hàng và merchant 
- Xem chi tiết về các sản phẩm (SKU) được mua trong từng giao dịch 
- Phân tích tổng tiền, nguồn tiền và phương thức thanh toán cho từng giao dịch.Bảng chứa thông tin user mua hàng tại các nhãn hàng (Nestle) qua Momo tại các partner merchant: Coop mart, bách hóa xanh,....
Chi tiết theo các sản phẩm (SKU) trong mỗi 1 đơn hàng, vì vậy TID có thể lặp lại do trong 1 bill user thanh toán nhiều sản phẩm.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `CORE_TRAN_ID` | FLOAT | Mã giao dịchMã giao dịch | 106507674136, 107699425046, 106445586662 |
| `PARTNER_CODE` | STRING | MID, merchant codeMID, merchant code | MOMONLXZ20220217, MOMORPJA20191030, MOMOWSFF20191212 |
| `date` | DATE | Ngày diễn ra giao dịchNgày diễn ra giao dịch | 2025-10-29, 2025-10-21, 2025-10-31 |
| `skuid` | STRING | Mã SKU, mã sản phẩmMã SKU, mã sản phẩm | NESTLEMM6, NESTLEMM4, NESTLEMM85 |
| `TOTAL_AMOUNT` | FLOAT | Tổng tiền của giao dịch đóTổng tiền của giao dịch đó | 375200, 84800, 86200 |
| `table_suffix` | STRING | Hậu tố của bảng | 251029, 251021, 251031 |
| `date_time` | DATETIME | Thời gian diễn ra giao dịchThời gian diễn ra giao dịch | 2025-11-07 15:05:19.216, 2025-10-26 21:36:11.851, 2025-11-07 13:28:02.444 |
| `merchant_name_sl` | STRING | Tên của nhãn hàngTên của nhãn hàng | CO.OPMART, MWG - BACH HOA XANH, COOP FOOD |
| `money_source` | STRING | Nguồn tiền thanh toánNguồn tiền thanh toán | 1, 6, 7 |
| `AGENT_ID` | STRING | Mã định danh userMã định danh user | 74212572, 62225036, 65097417 |
| `SKU_name` | STRING | Tên sản phẩmTên sản phẩm | Milo uống liền ít đường lốc 4 hộp x 180ml, MILO uống liền lốc 8 hộp x 180ml, MILO thùng 48x180ml |
| `brand` | STRING | Tên nhãn hàng, khác merchant, nhãn hàng là các nhãn hàng cung cấp sản phẩm bán cho merchantTên nhãn hàng, khác merchant, nhẫn hàng là các nhãn hàng cung cấp sản phẩm bán cho merchant | Nestle |
| `par_value` | INTEGER | Mệnh giá của sản phẩmMệnh giá của sản phẩm | 32000, 60800, 330000 |
| `store_code` | STRING | Mã cửa hàngMã cửa hàng | 553, 565, 537 |
| `age_group` | STRING | Nhóm tuổi của userNhóm tuổi của user | [7]. >40 y/o, [3]. 23 - 26 y/o, [2]. 18 - 22 y/o |
| `city` | STRING | Thành phố của userThành phố của user | Hồ Chí Minh, Hà Nội, Phú Thọ |
| `gender` | STRING | Giới tính của userGiới tính của user | female, male, unknown |
| `payment_method_group` | STRING | Nhóm phương thức thanh toánNhóm phương thức thanh toán | pos_scanner, dynamic_qr |
| `payment_method` | STRING | Phương thức thanh toánPhương thức thanh toán | pos, captureWallet |
| `payment_channel` | STRING | Kênh thanh toánKênh thanh toán | pos, qr, app |
| `gift_id` | STRING | Mã định danh giftMã định danh gift | 0NG8B9NM9BGKE, 0NFD0KH7GDS4D, 0NE3V4S5HBGMP |
| `gift_type_id` | STRING | Loại gift, hay còn gọi là gift agentLoại gift, hay còn gọi là gift agent | eps_bs_ads_nes_251021_giam_100pt25k_t3zeh, rw_bau_m_251229_giam_100pt15k_h1c6n, mega25_types_251111_cbttt_50pt50k_sej4n |
| `campaign_id` | STRING | Mã định danh chiến dịchMã định danh chiến dịch | bs_ads_budget_kindle_251022_w8oh4l515, rewards_budget_coin_reward_251231_s1w3r7s75, mega25_1213_budget_clvc_251111_w0yjemae5 |
| `membership_flag` | INTEGER | Flag user đó đã đăng ký membership trên momo hay chưaFlag user đó đã đăng ký membership trên momo hay chưa | 1, 0 |
| `REGISTER_DATE` | DATE | Ngày đăng ký membershipNgày đăng ký membership | 2025-10-29, 2023-12-20, 2025-10-30 |
| `PARTNER_ACCOUNT_IDENTITY` | STRING | Mã loyalty_id để map sang partner định danh userMã loyalty_id để map sang partner định danh user | b188a628-13af-4fe6-a655-247f24e796b3, 3f5c6f88-f5de-4011-bf63-4a8b20f17db5, 814b4ab9-6337-40fc-9734-b0f544675986 |

### `momovn-prod.MBI_DA.DM_EPS_VIETQR_IMPACT_SIZE`
> Bảng lưu số liệu gián tiếp đo mức độ phụ thuộc của người dùng MoMo vào tính năng quét mã VietQR tại các đối tác merchant. Dữ liệu được mapping merchant VietQR với merchant đã có trên nền tảng MoMo và chia theo tháng. Từ bảng này có thể: (1) ước tính tỷ lệ user có nguy cơ rời MoMo nếu chặn quét VietQR,
(2) phân tích hành vi scan mã của user (scan duy nhất một merchant hay scan nhiều merchant),
(3) đánh giá mức độ trung thành theo từng đối tác merchant VietQR,
(4) hỗ trợ ra quyết định policy về giới hạn/quản lý VietQR bank.Bảng lưu số liệu gián tiếp đo mức độ phụ thuộc của người dùng MoMo vào tính năng quét mã VietQR tại các đối tác merchant. Dữ liệu được mapping merchant VietQR với merchant đã có trên nền tảng MoMo và chia theo tháng. Từ bảng này có thể: (1) ước tính tỷ lệ user có nguy cơ rời MoMo nếu chặn quét VietQR, (2) phân tích hành vi scan mã của user (scan duy nhất một merchant hay scan nhiều merchant), (3) đánh giá mức độ trung thành theo từng đối tác merchant VietQR, (4) hỗ trợ ra quyết định policy về giới hạn/quản lý VietQR bank.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `acc_name` | STRING | Tên chủ tài khoản VietQR được quét (họ tên đầy đủ hoặc tên gọi khác đã đăng ký).Tên chủ tài khoản VietQR được quét (họ tên đầy đủ hoặc tên gọi khác đã đăng ký).\n\nSample value: (Không hiển thị do chứa thông tin cá nhân nhạy cảm) | — |
| `merchant_mapping` | STRING | Tên merchant MoMo đã mapping với merchant VietQR được user quét.Tên merchant MoMo đã mapping với merchant VietQR được user quét.\n\nSample value: GUARDIAN, KFC, DOOKKI, AEON SPM | HIGHLANDS COFFEE, GUTA CAFE, DOOKKI |
| `bank_code` | STRING | Mã ngân hàng phát hành mã VietQR (mã gồm 3 ký tự).Mã ngân hàng phát hành mã VietQR (mã gồm 3 ký tự).\n\nSample value: ACB, VTB | VCCB, not defined or m2m, VTB |
| `month` | DATE | Tháng báo cáo (luôn là mùng 1 của tháng).Tháng báo cáo (luôn là mùng 1 của tháng).\n\nSample value: 2024-05-01 | 2025-09-01, 2025-07-01, 2025-11-01 |
| `user_type_overlap_monthly` | STRING | Phân loại user theo mức độ overlap trong tháng, hiện giá trị duy nhất là 'all', overlap_m2m_m2b, only_m2b: chỉ dùng momo quét bank trong tháng (chưa phân nhóm cụ thể).Phân loại user theo mức độ overlap trong tháng, hiện giá trị duy nhất là 'all', overlap_m2m_m2b, only_m2b: chỉ dùng momo quét bank trong tháng (chưa phân nhóm cụ thể).\n\nSample value: all | all, overlap_m2m_m2b, only_m2b |
| `value` | INTEGER | Số lượng user thỏa mãn metric trong tháng.Số lượng user thỏa mãn metric trong tháng.\n\nSample value: 1, 3, 4, 8, 9, 15, 16 | 1, 2, 3 |
| `metric` | STRING | Loại chỉ số đang đo lường: - user_scan_only_1_merchant: user chỉ scan đúng 1 VietQR tại merchant này trong tháng - user_scan_vietQR: tổng user scan VietQR tại merchant - user_scan_other_vietqr: user scan VietQR tại merchant và thêm VietQR khác - user_scan_other_vietqr_likelyMC: user scan VietQR tại merchant và thêm VietQR khác trùng nhóm merchantLoại chỉ số đang đo lường:\n- user_scan_only_1_merchant: user chỉ scan đúng 1 VietQR tại merchant này trong tháng\n- user_scan_vietQR: tổng user scan VietQR tại merchant\n- user_scan_other_vietqr: user scan VietQR tại merchant và thêm VietQR khác\n- user_scan_other_vietqr_likelyMC: user scan VietQR tại merchant và thêm VietQR khác trùng nhóm merchant\n\nSample value: user_scan_only_1_merchant | user_scan_vietQR, user_scan_other_vietQR_likely_merchant, user_scan_other_vietQR |

### `project-5400504384186300846.MBI_DA.NHI_CDO_EPS_RECEIVER_UPLIFT`
> Bảng này ghi nhận thông tin về sự gia tăng của người nhận EPS, bao gồm loại người dùng merchant, tên tài khoản, ngân hàng và loại khuyến mãi. Dữ liệu từ bảng này có thể được sử dụng để nghiên cứu:
- Phân loại người dùng merchant và ảnh hưởng của việc thay đổi chiến lược
- Phân tích tác động của các loại khuyến mãi khác nhau
- Theo dõi sự thay đổi theo thời gian (ngày, tháng, năm) trong việc nâng cao hiệu suất người nhận EPS

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `merchant_user_type` | STRING | Loại người dùng merchant trong hệ thống. | bank_uplift_daily, acc_name_daily, acc_bank_daily |
| `acc_name` | STRING | Tên tài khoản nhận EPS. | — |
| `merchant_mapping` | STRING | Thông tin liên kết merchant. | MAYCHA, GUTA CAFE, DOOKKI |
| `bank_name` | STRING | Tên ngân hàng liên quan đến giao dịch. | ALL, BVBank, not defined or m2m |
| `promo_type` | STRING | Loại khuyến mãi áp dụng. | ALL |
| `date` | DATE | Ngày diễn ra sự kiện. | 2025-11-20, 2025-11-29, 2026-01-18 |
| `month` | DATE | Tháng diễn ra sự kiện. | 2026-01-01, 2025-09-01, 2025-12-01 |
| `year` | INTEGER | Năm diễn ra sự kiện. | 2025, 2024, 2026 |
| `uplift_type` | STRING | Loại sự gia tăng của người nhận EPS. | uplift, ALL, non-uplift |
| `mau` | INTEGER | Số lượng người hoạt động hàng tháng. | 1, 2, 3 |

### `project-5400504384186300846.MBI_DA.ORDER_MINIAPP`
> Bảng lưu trữ toàn bộ đơn hàng được đặt trên các mini-app của MoMo tại các merchant F&B như Highland, Phúc Long, v.v. với các trạng thái giao dịch khác nhau (INIT, COMPLETED...). Từ bảng này có thể:
- Giám sát doanh thu và số lượng đơn theo merchant và theo ngày/tháng.
- Phân tích hiệu quả khuyến mãi qua DISCOUNT_AMOUNT và ORIGINAL_AMOUNT.
- Theo dõi tỷ lệ hoàn tất đơn hàng qua trường status và SERVING_TYPE.Bảng lưu trữ toàn bộ đơn hàng được đặt trên các mini-app của MoMo tại các merchant F&B như Highland, Phúc Long, v.v. với các trạng thái giao dịch khác nhau (INIT, COMPLETED...). Từ bảng này có thể:
- Giám sát doanh thu và số lượng đơn theo merchant và theo ngày/tháng.
- Phân tích hiệu quả khuyến mãi qua DISCOUNT_AMOUNT và ORIGINAL_AMOUNT.
- Theo dõi tỷ lệ hoàn tất đơn hàng qua trường status và SERVING_TYPE.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `order_month` | DATE | Tháng phát sinh đơn hàng, dùng để phân vùng dữ liệu theo tháng.Tháng phát sinh đơn hàng, dùng để phân vùng dữ liệu theo tháng.  **Sample value**: 2025-07-01 | 2025-12-01, 2025-11-01, 2025-10-01 |
| `SERVING_TYPE` | STRING | Hình thức phục vụ: PICK_UP là mang đi, DINE_IN là tại chỗ, DELIVERY là giao hàng.Hình thức phục vụ: PICK_UP là mang đi, DINE_IN là tại chỗ, DELIVERY là giao hàng.  **Sample value**: PICK_UP | PICK_UP, DELIVERY, TABLE_ORDERING |
| `ID` | FLOAT | Mã định danh duy nhất của một đơn hàng trong hệ thống.Mã định danh duy nhất của một đơn hàng trong hệ thống.  **Sample value**: 3381800.0 | 4252040, 4322691, 4320861 |
| `MERCHANT_CODE` | STRING | Mã merchant MoMo, dùng để nhận diện thương hiệu (HIGHLAND, PHUC_LONG...).Mã merchant MoMo, dùng để nhận diện thương hiệu (HIGHLAND, PHUC_LONG...).  **Sample value**: MOMOXPWU20200407 | MOMOXPWU20200407, MOMORMQ120230111, MOMOZYZA20241021 |
| `PHONE_NUMBER` | STRING | Số điện thoại khách hàng đặt hàng.Số điện thoại khách hàng đặt hàng (cột nhạy cấp, không ghi sample). | — |
| `ORIGINAL_AMOUNT` | FLOAT | Tổng tiền trên bill trước khi áp voucher hay phí giao hàng.Tổng tiền trên bill trước khi áp voucher hay phí giao hàng.  **Sample value**: 19000.0 | 55000, 45000, 29000 |
| `PAY_AMOUNT` | FLOAT | Số tiền thực tế khách phải thanh toán sau giảm giá và cộng phí.Số tiền thực tế khách phải thanh toán sau giảm giá và cộng phí.  **Sample value**: 19000.0 | 55000, 45000, 29000 |
| `DISCOUNT_AMOUNT` | FLOAT | Tổng giá trị giảm giá được áp dụng trên đơn (voucher, chương trình KM...).Tổng giá trị giảm giá được áp dụng trên đơn (voucher, chương trình KM...).  **Sample value**: 0.0 | 0, 300000, 58000 |
| `SERVICE_TEMPLATE` | STRING | Loại hình dịch vụ: FNB (ăn uống), RETAIL, SHIP, v.v.Loại hình dịch vụ: FNB (ăn uống), RETAIL, SHIP, v.v.  **Sample value**: FNB | FNB |
| `DELIVERY_FEE` | FLOAT | Phí giao hàng (nếu có), chỉ hiện khi SERVING_TYPE là DELIVERY.Phí giao hàng (nếu có), chỉ hiện khi SERVING_TYPE là DELIVERY.  **Sample value**: NaN | 18000, 10000, 0 |
| `PARTNER` | STRING | Tên ngắn của đối tác (HIGHLAND, PHUC_LONG...).Tên ngắn của đối tác (HIGHLAND, PHUC_LONG...).  **Sample value**: HIGHLAND | HIGHLAND, JOLLIBEE, SOUNDBOX |
| `TOTAL_AMOUNT` | FLOAT | Tổng giá trị đơn hàng sau khi cộng phí và trừ giảm giá.Tổng giá trị đơn hàng sau khi cộng phí và trừ giảm giá.  **Sample value**: 19000.0 | 55000, 45000, 29000 |
| `status` | STRING | Trạng thái hiện tại của đơn: INIT (khởi tạo), COMPLETED (thành công), CANCELLED (hủy).Trạng thái hiện tại của đơn: INIT (khởi tạo), COMPLETED (thành công), CANCELLED (hủy).  **Sample value**: INIT, COMPLETED | INIT, COMPLETED, ORDER_FAILED |
| `order_date` | DATE | Ngày khách thực hiện đơn hàng, dùng để lọc theo ngày.Ngày khách thực hiện đơn hàng, dùng để lọc theo ngày.  **Sample value**: 2025-07-15 | 2025-09-10, 2025-12-04, 2025-02-14 |

## Memory
*31 entries — user-trained knowledge*

1. Khi người dùng hỏi về 'promo/organic user', hãy sử dụng: CASE WHEN is_paid_user=1 THEN 'paid' ELSE 'organic' END _2025-10-29_
2. User_type theo 1 dimension nào đó là trạng thái user tại tháng T đối với dimension đó: - New: trước đó chưa từng có giao dịch - Retain: tháng trước có giao dịch, tháng này vẫn tiếp tục có giao dịch - Reactive: đã từng có giao dịch trước đó, nhưng tháng T-1 không có giao dịch và tháng T có giao dịch trở lại _2025-10-30_
3. Chỉ nói về người dùng mới nếu user_type = new thôi, còn active user gọi là user thôi. Ví dụ khi user_type_department_monthly = "new" tức là user(agent_id) đó lần đầu có giao dịch tại EPS user_type_merchant_monthly = "new" tức là user(agent_id) đó lần đầu có giao dịch tại merchant tương ứng. _2025-10-30_
4. Mapping for money_source column: CASE WHEN money_source = '1' THEN 'MoMo' WHEN money_source = '2' THEN 'Linked Bank' WHEN money_source = '3' THEN 'Napas' WHEN money_source = '4' THEN 'Visa Debit' WHEN money_source = '5' THEN 'Visa Credit' WHEN money_source = '6' THEN 'TTT' WHEN money_source = '7' THEN 'Paylater' WHEN money_source = '8' THEN 'Cashback' WHEN money_source = '9' THEN 'Virtual Account Card' WHEN money_source = '10' THEN 'BNPL' WHEN money_source = '11' THEN 'Newton' WHEN money_source = '12' THEN 'Direct Debit' WHEN money_source = '13' THEN 'Money Pool' ELSE 'Other' END _2025-10-17_
5. Khi người dùng hỏi về 'usecase', hãy sử dụng cột 'usecase'. _2025-10-23_
6. MAU (Monthly Active User) của Coopmart = user sử dụng dịch vụ của Coopmart _2026-01-09_
7. EPS bao gồm các danh mục (cate) là Retail, FnB và Medium. _2025-12-26_
8. Nếu người dùng hỏi thông tin mà không chỉ định ngày/tháng, luôn hỏi lại để tránh query nặng. _2025-10-17_
9. For the table `project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION`, the date column is named `date`, not `trans_date`. _2025-10-23_
10. Nhận gift = gift đã được giao đến người dùng (deliver_time/deliver_date trong F_OFFLINE_GIFT_APPLICABLE), không phải là đã đổi thưởng (redeem_time/redeem_date trong F_OFFLINE_GIFT_REDEEM). _2026-01-08_
11. AOV = Tổng giá trị giao dịch / Tổng số giao dịch. _2026-01-28_
12. Khi user hỏi về "break thêm by user type to cate" cần lấy theo cột này mới đúng: user_type_service_lv3_monthly _2026-02-09_
13. Gift ở đây là gift_type_id, không phải gift_id. _2026-02-24_
14. Khi hỏi về GMV của merchant, hãy sử dụng bảng `project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION` và cột `amount` để tính toán. _2026-03-04_
15. Khi user hỏi có bao nhiêu user momo quét mã VietQR tại Long Châu theo bank_name, account_name theo tháng thì filter merchant_user_type = 'acc_bank_monthly' _2025-12-15_
16. service_lv1 = 'offline_m2b' tượng trưng cho viet QR. Khi người dùng hỏi về merchant, hãy sử dụng cột 'merchant_name_sl'. _2025-10-27_
17. The user wants to use the table `project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION` for user-related queries. _2025-10-22_
18. payment_type = 7 tương ứng với Paylater trong hệ thống EPS _2026-01-05_
19. Khi truy vấn GMV và số lượng giao dịch từ bảng `project-5400504384186300846.MBI_DA.ORDER_MINIAPP` cho các đơn hàng trên miniapp, ngoài trạng thái `COMPLETED`, tôi cũng sẽ bao gồm các đơn hàng có trạng thái `ORDER_SUCCESS`. _2026-01-20_
20. GMV = transaction * AOV _2026-02-02_
21. Paid user: is_eps_paid_user = 'PAID'. Organic user: is_eps_paid_user = 'ORGANIC' _2026-02-24_
22. Khi user hỏi break user type to cate thì dùng cột dimension: user_type_service_lv3 thôi _2026-03-02_
23. Khi user hỏi break user type to cate thì dùng cột dimension: user_type_service_lv3 thôi _2026-03-03_
24. Khi người dùng hỏi về 'doanh thu', hãy sử dụng cột 'revenue'. Khi người dùng hỏi về 'gmv', hãy sử dụng cột 'amount'. _2025-10-22_
25. RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này. REACTIVATED USER = người dùng đã từng dùng dịch vụ trong quá khứ, không dùng vào tháng trước, nhưng dùng lại vào tháng này. NEW USER = người dùng lần đầu tiên dùng dịch vụ vào tháng này. _2025-10-16_
26. Khi người dùng hỏi về 'master merchant', hãy hiểu rằng họ đang đề cập đến các giao dịch có cột 'cate' = 'medium'. _2025-10-15_
27. Khi user hỏi về thông tin của 1 merchant cụ thể, lúc query hãy upper(merchant_name_adjust) để đảm bảo khớp tên merchant. _2025-12-05_
28. Khi người dùng hỏi về 'user type', hãy sử dụng cột 'user_type_department_monthly'. _2025-10-23_
29. Ví trả sau = payment_method = 'payLater' _2025-10-29_
30. RETAINED USER (Retention Rate Calculation) = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này / tổng số người dùng của tháng trước đó. _2026-02-28_
31. Khi người dùng hỏi về "người dùng MoMo quét MoMoQR", hãy sử dụng bộ lọc service_lv1 = 'offline_m2m' _2026-01-22_
