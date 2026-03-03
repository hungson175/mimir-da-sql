# Domain: BU Payment: EPS-TOPBRAND

## Identity
- **Domain ID:** `72fbb966-0b9b-4205-a433-b14fca48597d`
- **Description:** Domain này tập trung vào user và merchant thuộc Topband (Phòng ban là EPS: Enterprise project solution).
Momo đóng vai trò là bên cung cấp giải pháp thanh toán cho Topbrand merchant offline, khi user đến thanh toán tại merchant có thể thanh toán đa dạng qua nhiều hình như: scan pos, scan QR, NFC, ....
Topband bao gồm các merchant lớn có doanh thu hàng lớn, có nhiều chi nhánh và cửa hàng. Momo sẽ có thu phí trên từng giao dịch nên sẽ thu được doanh thu trên từng giao dịch đó (revenue).

- **Tables:** 9
- **Metadata fetched:** 2026-02-03

## Tables & Columns

### project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION
> Báº£ng dimension lÆ°u trá»¯ thÃ´ng tin giao dá»ch cá»§a ngÆ°á»i dÃ¹ng EPS. ThÃ´ng tin tá»« báº£ng nÃ y bao gá»m:
- Thá»i gian giao dá»ch vÃ  loáº¡i giao dá»ch
- PhÆ°Æ¡ng thá»©c thanh toÃ¡n vÃ  kÃªnh thanh toÃ¡n
- ThÃ´ng tin chi tiáº¿t vá» dá»ch vá»¥ vÃ  mÃ£ dá»ch vá»¥ sá»­ dá»¥ng

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| date_time | DATETIME | Thá»i Äiá»m diá»n ra giao dá»ch. | 2020-10-30 03:22:51, 2020-10-30 03:33:06, 2021-06-29 01:51:49 |
| month | DATE | ThÃ¡ng diá»n ra giao dá»ch. | 2025-12-01, 2025-11-01, 2025-10-01 |
| trans_type | STRING | Loáº¡i giao dá»ch. | fill from old data, no trans_type, m4bpay, m4bpay_va, billpay, cardpayment |
| agent_id | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | unknown, 41395756, 42625417 |
| service_lv1 | STRING | Cáº¥p Äá» dá»ch vá»¥ 1 liÃªn quan Äáº¿n giao dá»ch. | offline_m2m, offline_b2m, missing_classify |
| service_lv2 | STRING | Cáº¥p Äá» dá»ch vá»¥ 2 liÃªn quan Äáº¿n giao dá»ch. | offline_m2m_eps, offline_b2m_eps, missing_classify |
| service_lv3 | STRING | Cáº¥p Äá» dá»ch vá»¥ 3 liÃªn quan Äáº¿n giao dá»ch. | offline_m2m_eps_retail, offline_m2m_eps_fnb, offline_b2m_eps_medium, offline_b2m... |
| merchant_code | STRING | MÃ£ Äá»nh danh cá»§a Äá»i tÃ¡c cung cáº¥p dá»ch vá»¥. | MOMOAONI20180131, MOMONLXZ20220217, MINISTOPVN |
| store_code | STRING | MÃ£ cá»­a hÃ ng liÃªn quan Äáº¿n giao dá»ch. | , 1001, 11 |
| service_code | STRING | MÃ£ dá»ch vá»¥ liÃªn quan Äáº¿n hÃ³a ÄÆ¡n. | m4bopcbhx_offline, billpaycirclek, billpayministop |
| payment_method | STRING | PhÆ°Æ¡ng thá»©c thanh toÃ¡n mÃ  ngÆ°á»i dÃ¹ng lá»±a chá»n. | captureWallet, pos, payWithStatic, dynamicqr, static |
| payment_channel | STRING | KÃªnh thanh toÃ¡n mÃ  ngÆ°á»i dÃ¹ng sá»­ dá»¥ng. | pos, banktransfer_qr, qr, aio_qr, staticqr |
| payment_type_group | STRING | NhÃ³m loáº¡i thanh toÃ¡n. | momo, bank |
| payment_method_group | STRING | NhÃ³m phÆ°Æ¡ng thá»©c thanh toÃ¡n. | aio_dynamic_qr, pos_scanner, vietqr, dynamic_qr, aio_static_qr |
| service_id | STRING | MÃ£ Äá»nh danh cá»§a dá»ch vá»¥. | momoqr |
| cate | STRING | Danh má»¥c cá»§a giao dá»ch. | retail, fnb, medium, sme |
| is_merchant_acquired_by_third_party_m4b | INTEGER | Giao dá»ch ÄÆ°á»£c thá»±c hiá»n thÃ´ng qua Äá»i tÃ¡c M4B bÃªn thá»© ba (1: ÄÃºng, 0: Sai). | 0, 1 |
| is_master_merchant | INTEGER | XÃ¡c Äá»nh ÄÃ¢y cÃ³ pháº£i lÃ  master merchant hay khÃ´ng (1: ÄÃºng, 0: Sai). | 0, 1 |
| master_merchant_label | STRING | NhÃ£n Äá»nh danh cho master merchant. | not master merchant, ipos, topos, kingcode, not defined label |
| is_dynamic_qr | INTEGER | Sá»­ dá»¥ng mÃ£ QR Äá»ng trong giao dá»ch (1: ÄÃºng, 0: Sai). | 1, 0 |
| first_date_dynamic_qr | DATE | NgÃ y Äáº§u tiÃªn sá»­ dá»¥ng mÃ£ QR Äá»ng. | 2025-01-01, 2025-06-09, 2025-06-19 |
| merchant_size_sl | STRING | Quy mÃ´ cá»§a thÆ°Æ¡ng gia. | topbrand offline, medium offline, sme offline |
| category_sl_lv1 | STRING | Cáº¥p danh má»¥c 1 cá»§a mÃ£ SL. | topbrand offline, sme offline, topbrand online, deal package - topbrand offline,... |
| category_sl_lv2 | STRING | Cáº¥p danh má»¥c 2 cá»§a mÃ£ SL. | retail, fnb, service, digital content |
| category_sl_lv3 | STRING | Cáº¥p danh má»¥c 3 cá»§a mÃ£ SL. | grocery, beverage, food, shopping, entertainment |
| category_sl_lv4 | STRING | Cáº¥p danh má»¥c 4 cá»§a mÃ£ SL. | cvs, coffee, minimart, supermarket, fast food |
| category_sl_lv5 | STRING | Cáº¥p danh má»¥c 5 cá»§a mÃ£ SL. | other, partner-miniapp, deal package, payment, native-app |
| category_sl_lv6 | STRING | Cáº¥p danh má»¥c 6 cá»§a mÃ£ SL. | fixed location, mobile location, online only |
| merchant_name_sl | STRING | TÃªn thÆ°Æ¡ng gia cá»§a mÃ£ SL. |  |
| merchant_name_adjust | STRING | TÃªn Äiá»u chá»nh cá»§a thÆ°Æ¡ng gia. |  |
| gender | STRING | Giá»i tÃ­nh cá»§a ngÆ°á»i dÃ¹ng. | female, male, unknown |
| age | INTEGER | Tuá»i cá»§a ngÆ°á»i dÃ¹ng. | 22, 23, 24 |
| age_group | STRING | NhÃ³m tuá»i cá»§a ngÆ°á»i dÃ¹ng. | [3]. 23 - 26 y/o, [2]. 18 - 22 y/o, unknown, [4]. 27 - 30 y/o, [5]. 31 - 35 y/o |
| city | STRING | ThÃ nh phá» nÆ¡i diá»n ra giao dá»ch. | Hồ Chí Minh, Hà Nội, Bình Dương |
| industrial_park | STRING | Khu cÃ´ng nghiá»p liÃªn quan Äáº¿n giao dá»ch. | Hồ Chí Minh, Unknown, Hà Nội |
| city_group_focus | STRING | NhÃ³m thÃ nh phá» ÄÆ°á»£c táº­p trung. | Hồ Chí Minh, UNKNOWN, Hà Nội |
| region | STRING | VÃ¹ng miá»n liÃªn quan Äáº¿n giao dá»ch. |  |
| bank_code | STRING | MÃ£ ngÃ¢n hÃ ng liÃªn quan Äáº¿n giao dá»ch. | not defined or m2m, MBB, VCB |
| bank_name | STRING | TÃªn ngÃ¢n hÃ ng liÃªn quan Äáº¿n giao dá»ch. | not defined or m2m, MBBank, TMCP Ngoại Thương Việt Nam, Techcombank, VietinBank |
| agent_id_mapped | STRING | MÃ£ Äá»nh danh vÃ­ MoMo ÄÃ£ ÄÆ°á»£c Ã¡nh xáº¡. | not defined or m2m, 80713715, 34608078 |
| bank_mapped_momo_status | INTEGER | Tráº¡ng thÃ¡i ngÃ¢n hÃ ng ÄÃ£ liÃªn káº¿t qua MoMo (1: ÄÃºng, 0: Sai). | -1, 0, 1 |
| user_type_department_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng theo phÃ²ng ban hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_service_lv1_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng dá»ch vá»¥ cáº¥p 1 hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_service_lv2_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng dá»ch vá»¥ cáº¥p 2 hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_service_lv3_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng dá»ch vá»¥ cáº¥p 3 hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_momoqr_cate_lv3_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng MoMo QR danh má»¥c cáº¥p 3 hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_sof_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng nguá»n tiá»n hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_merchant_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng thÆ°Æ¡ng gia hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_momoqr_cate_lv3_department_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng MoMo QR cáº¥p 3 theo phÃ²ng ban hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_sof_department_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng nguá»n tiá»n theo phÃ²ng ban hÃ ng thÃ¡ng. | retained, reactivated, new |
| user_type_overlap_service_lv1_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng dá»ch vá»¥ cÃ³ sá»± chá»ng chÃ©o cáº¥p 1 hÃ ng thÃ¡ng. | overlap_m2m_m2b, only_m2m, only_m2b |
| user_type_overlap_service_lv1_department_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng dá»ch vá»¥ cÃ³ sá»± chá»ng chÃ©o cáº¥p 1 theo phÃ²ng ban hÃ ng thÃ¡ng. | only_m2m |
| is_paid_transaction | INTEGER | Giao dá»ch ÄÃ£ ÄÆ°á»£c thanh toÃ¡n (1: ÄÃºng, 0: Sai). | 0, 1 |
| is_paid_user | INTEGER | NgÆ°á»i dÃ¹ng ÄÃ£ thanh toÃ¡n (1: ÄÃºng, 0: Sai). | 0, 1 |
| is_paid_user_department | INTEGER | NgÆ°á»i dÃ¹ng ÄÃ£ thanh toÃ¡n theo phÃ²ng ban (1: ÄÃºng, 0: Sai). | 0, 1 |
| bank_account_no | STRING | Sá» tÃ i khoáº£n ngÃ¢n hÃ ng. |  |
| user_type_bank_register | STRING | Loáº¡i ngÆ°á»i dÃ¹ng ÄÄng kÃ½ ngÃ¢n hÃ ng. | single_bank, multi_bank |
| date | DATE | NgÃ y diá»n ra giao dá»ch. | 2026-01-11, 2026-01-18, 2025-12-07 |
| tid | STRING | MÃ£ giao dá»ch. | -1, 96343090547, 92128872238 |
| money_source | STRING | Nguá»n tiá»n sá»­ dá»¥ng trong giao dá»ch. | 1, 2, 7 |
| pic | STRING | NgÆ°á»i phá»¥ trÃ¡ch giao dá»ch. |  |
| usecase | STRING | TÃ¬nh huá»ng sá»­ dá»¥ng. | cvs, coffee, minimart, supermarket, fast food |
| is_new_momo | INTEGER | NgÆ°á»i dÃ¹ng má»i cá»§a MoMo (1: ÄÃºng, 0: Sai). | 0, 1 |
| is_1st_trans_in_month | INTEGER | Giao dá»ch Äáº§u tiÃªn trong thÃ¡ng (1: ÄÃºng, 0: Sai). | 0, 1 |
| gam | STRING | Ghi chÃº giao dá»ch GAM. | quyen.nguyen13, nhu.tran, trang.le1 |
| store_name | STRING | TÃªn cá»­a hÃ ng liÃªn quan Äáº¿n giao dá»ch. |  |
| amount | FLOAT | Sá» tiá»n trong giao dá»ch. | 25000, 20000, 15000 |
| revenue | FLOAT | Doanh thu tá»« giao dá»ch. | 0, 150, 180 |
| promo_amount | FLOAT | Sá» tiá»n khuyáº¿n mÃ£i trong giao dá»ch. | 20000, 10000, 1000 |
| gift_id | STRING | MÃ£ quÃ  táº·ng liÃªn quan Äáº¿n giao dá»ch. | 0NMW1ZT32XDBF, 0KQ019VK6DYY0, 0N7XS7MZAXEE0 |
| gift_type_id | STRING | Loáº¡i mÃ£ quÃ  táº·ng. | mds_ps_fuze_250513_giam_100pt12k_7hli1, mds_ps_hlcmini_250210_giam_20pt20k_q9tbk... |
| campaign_id | STRING | MÃ£ chiáº¿n dá»ch quáº£ng cÃ¡o. | 250519_budget_clvc_sljvuwgaa, 250211_budget_clvc_0wow5i065, viper |
| gift_amount | FLOAT | Sá» tiá»n cá»§a quÃ  táº·ng. | 20000, 10000, 1000 |
| promo_agent | STRING | Äáº¡i lÃ½ thá»±c hiá»n chÆ°Æ¡ng trÃ¬nh khuyáº¿n mÃ£i. | kgs_mds302_rewards_25q01, kgs_dls306_mcinv_b2b_20250519_0005, kgs_dls306_mcinv_b... |
| is_eps_paid_transaction | INTEGER | Giao dá»ch EPS ÄÃ£ thanh toÃ¡n (1: ÄÃºng, 0: Sai). | 0, 1 |
| is_eps_paid_user | STRING | NgÆ°á»i dÃ¹ng EPS ÄÃ£ thanh toÃ¡n. | ORGANIC, PAID |
| user_type_overlap_cate_monthly | STRING | Loáº¡i ngÆ°á»i dÃ¹ng cÃ³ danh má»¥c chá»ng láº¥n hÃ ng thÃ¡ng. | retail, fnb, retail, fnb, retail, medium, retail, medium, fnb |

### momovn-prod.MBI_DA.F_OFFLINE_GIFT_REDEEM
> This is a fact table for offline gift redemption transactions. It contains information about gift redemption activities, details of the gift such as type and ID, associated campaign, payment and amounts related to vouchers and cashbacks, along with timestamps for redemption and modifications. Potent...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| gift_id | STRING | MÃ£ Äá»nh danh cá»§a mÃ³n quÃ  ÄÆ°á»£c Äá»i. | 0NJVZSDHEXDAB, 0NKRB94YYDYZJ, 0NKM15ZZAXCV6 |
| gift_type_id | STRING | MÃ£ Äá»nh danh loáº¡i cá»§a mÃ³n quÃ  ÄÆ°á»£c Äá»i. | rw_bau_251001_giam_100pt1k_219a7, rw_bau_251029_giam_100pt1k_9278s, rw_bau_25112... |
| campaign_id | STRING | MÃ£ Äá»nh danh cá»§a chiáº¿n dá»ch liÃªn quan Äáº¿n viá»c Äá»i quÃ . | rewards_budget_coin_reward_251001_mrqakq729, rewards_budget_coin_reward_251029_l... |
| agent_id | STRING | MÃ£ Äá»nh danh cá»§a má»i vÃ­ MoMo thá»±c hiá»n giao dá»ch Äá»i quÃ . | 38505493, 53908432, 55833731 |
| deliver_time | DATETIME | Thá»i gian giao mÃ³n quÃ  cho ngÆ°á»i nháº­n. | 2025-12-31 12:50:00, 2025-11-24 20:00:03, 2025-11-11 20:00:02 |
| agent | STRING | ThÃ´ng tin vá» Äáº¡i lÃ½ thá»±c hiá»n Äá»i quÃ . | kgs_mds302_251001_0021_reward, kgs_mds302_251029_0099_reward, kgs_mds302_251127_... |
| tid | STRING | MÃ£ Äá»nh danh cho giao dá»ch Äá»i quÃ . | 103353465312, 100329839507, 103452451967 |
| gift_tid | STRING | MÃ£ Äá»nh danh cá»§a giao dá»ch  liÃªn quan Äáº¿n mÃ³n quÃ . | 107896652269, 107962896119, 107893411160 |
| payment_amount | FLOAT | Sá» tiá»n thanh toÃ¡n trong giao dá»ch Äá»i quÃ . | 10000, 20000, 50000 |
| vc_amount | FLOAT | Sá» tiá»n tá»« voucher sá»­ dá»¥ng trong giao dá»ch Äá»i quÃ . | 1000, 0, 2000 |
| cb_amount | FLOAT | Sá» tiá»n cashback ÄÆ°á»£c nháº­n trong giao dá»ch Äá»i quÃ . | 0, 3000, 5000 |
| bnvc_amount | FLOAT | Sá» tiá»n cá»§a voucher BNVC ÄÆ°á»£c sá»­ dá»¥ng trong giao dá»ch Äá»i quÃ . | 0 |
| redeem_time | DATETIME | Thá»i gian thá»±c hiá»n Äá»i quÃ . | 2025-10-26 16:07:55.873, 2026-01-04 12:48:24.515, 2025-11-09 19:37:00.188 |
| redeem_date | DATE | NgÃ y thá»±c hiá»n Äá»i quÃ . | 2025-12-03, 2025-12-10, 2025-12-09 |
| modify_time | DATETIME | Thá»i gian sá»­a Äá»i thÃ´ng tin giao dá»ch Äá»i quÃ . | 2025-11-18 11:19:58.060, 2025-06-14 10:45:54.357, 2025-09-03 10:23:56.450 |

### momovn-prod.MBI_DA.F_OFFLINE_GIFT_APPLICABLE
> Báº£ng fact momovn-prod.MBI_DA.F_OFFLINE_GIFT_APPLICABLE lÆ°u trá»¯ thÃ´ng tin vá» cÃ¡c mÃ³n quÃ  offline cÃ³ thá» Ã¡p dá»¥ng. Sá»­ dá»¥ng báº£ng nÃ y Äá» xÃ¡c Äá»nh thÃ´ng tin mÃ³n quÃ , loáº¡i mÃ³n quÃ  vÃ  chiáº¿n dá»ch liÃªn quan. BÃªn cáº¡nh ÄÃ³, báº£ng cÃ²n cung cáº¥p dá»¯ liá»u vá» ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| gift_id | STRING | MÃ£ Äá»nh danh cá»§a mÃ³n quÃ . | 0KH41M8G0DTC0, 0K3MKHX49BH20, 0JQ5NCEN7H8EC |
| gift_type_id | STRING | MÃ£ loáº¡i cá»§a mÃ³n quÃ . | fs_vts_new_250528_cbttt_100pt30k_s6sil, fs_vts_new_250619_cbttt_100pt30k_665je, ... |
| campaign_id | STRING | MÃ£ Äá»nh danh cá»§a chiáº¿n dá»ch mÃ  mÃ³n quÃ  ÄÆ°á»£c Ã¡p dá»¥ng. | viper, qn_10k_new_t7__budget_open_app_250704_omt0od7s6, 250806_sme_budget_open_a... |
| amount | FLOAT | Sá» tiá»n hoáº·c giÃ¡ trá» cá»§a mÃ³n quÃ . | 10000, 30000, 5000 |
| agent_id | STRING | MÃ£ Äá»nh danh cá»§a má»i vÃ­ MoMo, nÆ¡i mÃ³n quÃ  ÄÆ°á»£c gá»­i. | 81591973, 40914192, 50397870 |
| agent | STRING | TÃªn hoáº·c thÃ´ng tin cá»§a Äáº¡i lÃ½ liÃªn quan Äáº¿n viá»c gá»­i mÃ³n quÃ . | kgs_sp301_20250704_0015, kgs_dls301_20250806_0031, kgs_dls301_20250721_0126 |
| deliver_time | DATETIME | Thá»i Äiá»m giao mÃ³n quÃ . | 2025-08-15 17:23:37, 2025-08-15 13:25:59, 2025-08-15 13:24:37 |
| deliver_date | DATE | NgÃ y giao mÃ³n quÃ . | 2025-06-18, 2025-06-12, 2025-06-06 |
| start_time | DATETIME | Thá»i Äiá»m báº¯t Äáº§u Ã¡p dá»¥ng mÃ³n quÃ . | 2025-05-19 19:00:00, 2025-08-26 20:00:00, 2025-12-01 00:00:00 |
| end_time | DATETIME | Thá»i Äiá»m káº¿t thÃºc Ã¡p dá»¥ng mÃ³n quÃ . | 2025-07-31 23:59:59, 2025-06-30 23:59:00, 2025-03-31 23:59:59 |
| modify_time | DATETIME | Thá»i Äiá»m chá»nh sá»­a thÃ´ng tin mÃ³n quÃ . | 2025-12-26 20:00:00, 2025-12-26 21:00:00, 2026-01-07 17:45:33.933 |

### project-5400504384186300846.MBI_DA.D_EPS_USER_TYPE_SOF_MONTHLY
> Báº£ng dimension chá»©a thÃ´ng tin chi tiáº¿t hÃ ng thÃ¡ng vá» loáº¡i ngÆ°á»i dÃ¹ng liÃªn quan Äáº¿n nguá»n tiá»n (SOF) vÃ  cÃ¡c hoáº¡t Äá»ng khÃ¡c. Dá»¯ liá»u tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá»:
- Theo dÃµi cÃ¡c nguá»n tiá»n ÄÆ°á»£c sá»­ dá»¥ng bá»i cÃ¡c loáº¡i ngÆ°á»...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| agent_id | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo | 35044131, 45520457, 34973635 |
| month | DATE | ThÃ¡ng liÃªn káº¿t vá»i cÃ¡c hoáº¡t Äá»ng cá»§a ngÆ°á»i dÃ¹ng | 2024-01-01, 2023-12-01, 2024-06-01 |
| money_source | STRING | Nguá»n tiá»n ÄÆ°á»£c sá»­ dá»¥ng bá»i ngÆ°á»i dÃ¹ng trong thÃ¡ng | 1, 2, 6 |
| promo_type | STRING | Loáº¡i khuyáº¿n mÃ£i Ã¡p dá»¥ng cho nguá»n tiá»n vÃ  ngÆ°á»i dÃ¹ng | ORGANIC, PAID |
| merchant | STRING | ThÃ´ng tin vá» merchant liÃªn quan Äáº¿n giao dá»ch |  |
| current_active_type | STRING | Loáº¡i hoáº¡t Äá»ng hiá»n táº¡i cá»§a ngÆ°á»i dÃ¹ng | active, soft churn, hard churn |
| tid | STRING | ID giao dá»ch | 898882963, 897458959, 895359724 |
| last_active_month | DATE | ThÃ¡ng gáº§n nháº¥t mÃ  ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng | 2023-12-01, 2024-05-01, 2023-11-01 |
| next_active_month | DATE | ThÃ¡ng tiáº¿p theo ngÆ°á»i dÃ¹ng dá»± kiáº¿n hoáº¡t Äá»ng | 2023-12-01, 2024-03-01, 2024-05-01 |
| month_diff_from_last_active | INTEGER | Sá»± khÃ¡c biá»t vá» sá» thÃ¡ng tá»« thá»i Äiá»m ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng gáº§n nháº¥t | 2, 3, 4 |
| month_diff_to_next_active | INTEGER | Sá»± khÃ¡c biá»t vá» sá» thÃ¡ng Äáº¿n thá»i Äiá»m ngÆ°á»i dÃ¹ng dá»± kiáº¿n sáº½ hoáº¡t Äá»... | 0, 1, 2 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng dá»±a trÃªn hoáº¡t Äá»ng vÃ  nguá»n tiá»n | retained, churn, reactivated, new |

### project-5400504384186300846.MBI_DA.DM_EPS_USER_TYPE_MONTHLY
> Báº£ng dimension chá»©a thÃ´ng tin hÃ ng thÃ¡ng vá» loáº¡i ngÆ°á»i dÃ¹ng EPS vÃ  hoáº¡t Äá»ng cá»§a há». ThÃ´ng tin ÄÆ°á»£c trÃ­ch xuáº¥t tá»« báº£ng nÃ y bao gá»m: 
- MÃ£ Äá»nh danh cá»§a tá»«ng vÃ­ MoMo vÃ  hoáº¡t Äá»ng ngÆ°á»i dÃ¹ng theo thÃ¡ng 
- ThÃ´ng tin khuyáº¿n máº¡i Ã¡p dá»¥ng ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| agent_id | STRING | MÃ£ Äá»nh danh cho má»i vÃ­ MoMo. | 45678601, 15464699, 32828118 |
| month | DATE | ThÃ¡ng mÃ  thÃ´ng tin ngÆ°á»i dÃ¹ng ÄÆ°á»£c ghi nháº­n. | 2024-01-01, 2023-12-01, 2025-12-01 |
| promo_type | STRING | Loáº¡i chÆ°Æ¡ng trÃ¬nh khuyáº¿n máº¡i Ã¡p dá»¥ng cho ngÆ°á»i dÃ¹ng trong thÃ¡ng. | ORGANIC, PAID |
| merchant | STRING | NhÃ  bÃ¡n hÃ ng hoáº·c merchant liÃªn quan Äáº¿n giao dá»ch cá»§a ngÆ°á»i dÃ¹ng. |  |
| current_active_type | STRING | Loáº¡i hoáº¡t Äá»ng hiá»n táº¡i cá»§a ngÆ°á»i dÃ¹ng. | active, soft churn, hard churn |
| tid | STRING | MÃ£ giao dá»ch (Transaction ID) dÃ¹ng Äá» xÃ¡c Äá»nh giao dá»ch cá»¥ thá». | 65989624044, 65842587786, 66427919858 |
| last_active_month | DATE | ThÃ¡ng cuá»i cÃ¹ng mÃ  ngÆ°á»i dÃ¹ng cÃ³ hoáº¡t Äá»ng. | 2023-12-01, 2023-11-01, 2024-05-01 |
| next_active_month | DATE | ThÃ¡ng tiáº¿p theo dá»± kiáº¿n ngÆ°á»i dÃ¹ng sáº½ hoáº¡t Äá»ng. | 2025-12-01, 2023-12-01, 2024-03-01 |
| month_diff_from_last_active | INTEGER | Sá» thÃ¡ng ká» tá»« thÃ¡ng cuá»i cÃ¹ng ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng. | 2, 3, 4 |
| month_diff_to_next_active | INTEGER | Sá» thÃ¡ng dá»± kiáº¿n cho Äáº¿n khi ngÆ°á»i dÃ¹ng hoáº¡t Äá»ng tiáº¿p theo. | 0, 1, 2 |
| user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng EPS xÃ¡c Äá»nh trong thÃ¡ng. | retained, churn, reactivated, new |

### project-5400504384186300846.MBI_DA.DM_EPS_SKU_BY_BRAND
> Báº£ng chá»©a thÃ´ng tin user mua hÃ ng táº¡i cÃ¡c nhÃ£n hÃ ng (Nestle) qua Momo táº¡i cÃ¡c partner merchant: Coop mart, bÃ¡ch hÃ³a xanh,....
Chi tiáº¿t theo cÃ¡c sáº£n pháº©m (SKU) trong má»i 1 ÄÆ¡n hÃ ng, vÃ¬ váº­y TID cÃ³ thá» láº·p láº¡i do trong 1 bill user thanh toÃ¡n nhiá»u sáº£n pháº©m.
...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| CORE_TRAN_ID | FLOAT | MÃ£ giao dá»chMÃ£ giao dá»ch  | 106507674136, 107699425046, 106445586662 |
| PARTNER_CODE | STRING | MID, merchant codeMID, merchant code | MOMONLXZ20220217, MOMORPJA20191030, MOMOWSFF20191212 |
| date | DATE | NgÃ y diá»n ra giao dá»chNgÃ y diá»n ra giao dá»ch | 2025-10-29, 2025-10-21, 2025-10-31 |
| skuid | STRING | MÃ£ SKU, mÃ£ sáº£n pháº©mMÃ£ SKU, mÃ£ sáº£n pháº©m | NESTLEMM6, NESTLEMM4, NESTLEMM85 |
| TOTAL_AMOUNT | FLOAT | Tá»ng tiá»n cá»§a giao dá»ch ÄÃ³Tá»ng tiá»n cá»§a giao dá»ch ÄÃ³ | 375200, 84800, 86200 |
| table_suffix | STRING | Háº­u tá» cá»§a báº£ng | 251029, 251021, 251031 |
| date_time | DATETIME | Thá»i gian diá»n ra giao dá»chThá»i gian diá»n ra giao dá»ch | 2025-11-07 15:05:19.216, 2025-10-26 21:36:11.851, 2025-11-07 13:28:02.444 |
| merchant_name_sl | STRING | TÃªn cá»§a nhÃ£n hÃ ngTÃªn cá»§a nhÃ£n hÃ ng | CO.OPMART, MWG - BACH HOA XANH, COOP FOOD, COOP SMILE, CO.OPXTRA |
| money_source | STRING | Nguá»n tiá»n thanh toÃ¡nNguá»n tiá»n thanh toÃ¡n | 1, 6, 7 |
| AGENT_ID | STRING | MÃ£ Äá»nh danh userMÃ£ Äá»nh danh user | 74212572, 62225036, 65097417 |
| SKU_name | STRING | TÃªn sáº£n pháº©mTÃªn sáº£n pháº©m | Milo uống liền ít đường lốc 4 hộp x 180ml, MILO uống liền lốc 8 hộp x 180ml, MIL... |
| brand | STRING | TÃªn nhÃ£n hÃ ng, khÃ¡c merchant, nhÃ£n hÃ ng lÃ  cÃ¡c nhÃ£n hÃ ng cung cáº¥p sáº£n pháº©m bÃ¡n cho ... | Nestle |
| par_value | INTEGER | Má»nh giÃ¡ cá»§a sáº£n pháº©mMá»nh giÃ¡ cá»§a sáº£n pháº©m | 32000, 60800, 330000 |
| store_code | STRING | MÃ£ cá»­a hÃ ngMÃ£ cá»­a hÃ ng | 553, 565, 537 |
| age_group | STRING | NhÃ³m tuá»i cá»§a userNhÃ³m tuá»i cá»§a user | [7]. >40 y/o, [3]. 23 - 26 y/o, [2]. 18 - 22 y/o, [5]. 31 - 35 y/o, [6]. 36 - 40... |
| city | STRING | ThÃ nh phá» cá»§a userThÃ nh phá» cá»§a user | Hồ Chí Minh, Hà Nội, Phú Thọ |
| gender | STRING | Giá»i tÃ­nh cá»§a userGiá»i tÃ­nh cá»§a user | female, male, unknown |
| payment_method_group | STRING | NhÃ³m phÆ°Æ¡ng thá»©c thanh toÃ¡nNhÃ³m phÆ°Æ¡ng thá»©c thanh toÃ¡n | pos_scanner, dynamic_qr |
| payment_method | STRING | PhÆ°Æ¡ng thá»©c thanh toÃ¡nPhÆ°Æ¡ng thá»©c thanh toÃ¡n | pos, captureWallet |
| payment_channel | STRING | KÃªnh thanh toÃ¡nKÃªnh thanh toÃ¡n | pos, qr, app, wearable |
| gift_id | STRING | MÃ£ Äá»nh danh giftMÃ£ Äá»nh danh gift | 0NG8B9NM9BGKE, 0NFD0KH7GDS4D, 0NE3V4S5HBGMP |
| gift_type_id | STRING | Loáº¡i gift, hay cÃ²n gá»i lÃ  gift agentLoáº¡i gift, hay cÃ²n gá»i lÃ  gift agent | eps_bs_ads_nes_251021_giam_100pt25k_t3zeh, rw_bau_m_251229_giam_100pt15k_h1c6n, ... |
| campaign_id | STRING | MÃ£ Äá»nh danh chiáº¿n dá»chMÃ£ Äá»nh danh chiáº¿n dá»ch | bs_ads_budget_kindle_251022_w8oh4l515, rewards_budget_coin_reward_251231_s1w3r7s... |
| membership_flag | INTEGER | Flag user ÄÃ³ ÄÃ£ ÄÄng kÃ½ membership trÃªn momo hay chÆ°aFlag user ÄÃ³ ÄÃ£ ÄÄng kÃ½ members... | 1, 0 |
| REGISTER_DATE | DATE | NgÃ y ÄÄng kÃ½ membershipNgÃ y ÄÄng kÃ½ membership | 2025-10-29, 2023-12-20, 2025-10-30 |
| PARTNER_ACCOUNT_IDENTITY | STRING | MÃ£ loyalty_id Äá» map sang partner Äá»nh danh userMÃ£ loyalty_id Äá» map sang partner Äá»nh... | b188a628-13af-4fe6-a655-247f24e796b3, 3f5c6f88-f5de-4011-bf63-4a8b20f17db5, 814b... |

### momovn-prod.MBI_DA.DM_EPS_VIETQR_IMPACT_SIZE
> Báº£ng lÆ°u sá» liá»u giÃ¡n tiáº¿p Äo má»©c Äá» phá»¥ thuá»c cá»§a ngÆ°á»i dÃ¹ng MoMo vÃ o tÃ­nh nÄng quÃ©t mÃ£ VietQR táº¡i cÃ¡c Äá»i tÃ¡c merchant. Dá»¯ liá»u ÄÆ°á»£c mapping merchant VietQR vá»i merchant ÄÃ£ cÃ³ trÃªn ná»n táº£ng MoMo vÃ  chia theo thÃ¡ng. Tá»« báº£ng nÃ y cÃ³ thá»...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| acc_name | STRING | TÃªn chá»§ tÃ i khoáº£n VietQR ÄÆ°á»£c quÃ©t (há» tÃªn Äáº§y Äá»§ hoáº·c tÃªn gá»i khÃ¡c ÄÃ£ Ä... |  |
| merchant_mapping | STRING | TÃªn merchant MoMo ÄÃ£ mapping vá»i merchant VietQR ÄÆ°á»£c user quÃ©t. | HIGHLANDS COFFEE, GUTA CAFE, DOOKKI, MAYCHA, KATINAT |
| bank_code | STRING | MÃ£ ngÃ¢n hÃ ng phÃ¡t hÃ nh mÃ£ VietQR (mÃ£ gá»m 3 kÃ½ tá»±). | VCCB, not defined or m2m, VTB |
| month | DATE | ThÃ¡ng bÃ¡o cÃ¡o (luÃ´n lÃ  mÃ¹ng 1 cá»§a thÃ¡ng). | 2025-09-01, 2025-07-01, 2025-11-01 |
| user_type_overlap_monthly | STRING | PhÃ¢n loáº¡i user theo má»©c Äá» overlap trong thÃ¡ng, hiá»n giÃ¡ trá» duy nháº¥t lÃ  'all', ove... | all, overlap_m2m_m2b, only_m2b |
| value | INTEGER | Sá» lÆ°á»£ng user thá»a mÃ£n metric trong thÃ¡ng. | 1, 2, 3 |
| metric | STRING | Loáº¡i chá» sá» Äang Äo lÆ°á»ng:
- user_scan_only_1_merchant: user chá» scan ÄÃºng 1 VietQR t... | user_scan_vietQR, user_scan_other_vietQR_likely_merchant, user_scan_other_vietQR... |

### project-5400504384186300846.MBI_DA.NHI_CDO_EPS_RECEIVER_UPLIFT
> Báº£ng nÃ y ghi nháº­n thÃ´ng tin vá» sá»± gia tÄng cá»§a ngÆ°á»i nháº­n EPS, bao gá»m loáº¡i ngÆ°á»i dÃ¹ng merchant, tÃªn tÃ i khoáº£n, ngÃ¢n hÃ ng vÃ  loáº¡i khuyáº¿n mÃ£i. Dá»¯ liá»u tá»« báº£ng nÃ y cÃ³ thá» ÄÆ°á»£c sá»­ dá»¥ng Äá» nghiÃªn cá»©u:
- PhÃ¢n loáº¡i ngÆ°á»i dÃ¹ng merchant ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| merchant_user_type | STRING | Loáº¡i ngÆ°á»i dÃ¹ng merchant trong há» thá»ng. | bank_uplift_daily, acc_name_daily, acc_bank_daily, uplift_daily, all |
| acc_name | STRING | TÃªn tÃ i khoáº£n nháº­n EPS. |  |
| merchant_mapping | STRING | ThÃ´ng tin liÃªn káº¿t merchant. | MAYCHA, GUTA CAFE, DOOKKI, KATINAT, HIGHLANDS COFFEE |
| bank_name | STRING | TÃªn ngÃ¢n hÃ ng liÃªn quan Äáº¿n giao dá»ch. | ALL, BVBank, not defined or m2m, VietinBank, NH TMCP A CHAU |
| promo_type | STRING | Loáº¡i khuyáº¿n mÃ£i Ã¡p dá»¥ng. | ALL |
| date | DATE | NgÃ y diá»n ra sá»± kiá»n. | 2025-11-20, 2025-11-29, 2026-01-18 |
| month | DATE | ThÃ¡ng diá»n ra sá»± kiá»n. | 2026-01-01, 2025-09-01, 2025-12-01 |
| year | INTEGER | NÄm diá»n ra sá»± kiá»n. | 2025, 2024, 2026 |
| uplift_type | STRING | Loáº¡i sá»± gia tÄng cá»§a ngÆ°á»i nháº­n EPS. | uplift, ALL, non-uplift |
| mau | INTEGER | Sá» lÆ°á»£ng ngÆ°á»i hoáº¡t Äá»ng hÃ ng thÃ¡ng. | 1, 2, 3 |

### project-5400504384186300846.MBI_DA.ORDER_MINIAPP
> Báº£ng lÆ°u trá»¯ toÃ n bá» ÄÆ¡n hÃ ng ÄÆ°á»£c Äáº·t trÃªn cÃ¡c mini-app cá»§a MoMo táº¡i cÃ¡c merchant F&B nhÆ° Highland, PhÃºc Long, v.v. vá»i cÃ¡c tráº¡ng thÃ¡i giao dá»ch khÃ¡c nhau (INIT, COMPLETED...). Tá»« báº£ng nÃ y cÃ³ thá»:
- GiÃ¡m sÃ¡t doanh thu vÃ  sá» lÆ°á»£ng ÄÆ¡n theo mercha...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| order_month | DATE | ThÃ¡ng phÃ¡t sinh ÄÆ¡n hÃ ng, dÃ¹ng Äá» phÃ¢n vÃ¹ng dá»¯ liá»u theo thÃ¡ng. | 2025-12-01, 2025-11-01, 2025-10-01 |
| SERVING_TYPE | STRING | HÃ¬nh thá»©c phá»¥c vá»¥: PICK_UP lÃ  mang Äi, DINE_IN lÃ  táº¡i chá», DELIVERY lÃ  giao hÃ ng. | PICK_UP, DELIVERY, TABLE_ORDERING |
| ID | FLOAT | MÃ£ Äá»nh danh duy nháº¥t cá»§a má»t ÄÆ¡n hÃ ng trong há» thá»ng. | 4252040, 4322691, 4320861 |
| MERCHANT_CODE | STRING | MÃ£ merchant MoMo, dÃ¹ng Äá» nháº­n diá»n thÆ°Æ¡ng hiá»u (HIGHLAND, PHUC_LONG. | MOMOXPWU20200407, MOMORMQ120230111, MOMOZYZA20241021 |
| PHONE_NUMBER | STRING | Sá» Äiá»n thoáº¡i khÃ¡ch hÃ ng Äáº·t hÃ ng. |  |
| ORIGINAL_AMOUNT | FLOAT | Tá»ng tiá»n trÃªn bill trÆ°á»c khi Ã¡p voucher hay phÃ­ giao hÃ ng. | 55000, 45000, 29000 |
| PAY_AMOUNT | FLOAT | Sá» tiá»n thá»±c táº¿ khÃ¡ch pháº£i thanh toÃ¡n sau giáº£m giÃ¡ vÃ  cá»ng phÃ­. | 55000, 45000, 29000 |
| DISCOUNT_AMOUNT | FLOAT | Tá»ng giÃ¡ trá» giáº£m giÃ¡ ÄÆ°á»£c Ã¡p dá»¥ng trÃªn ÄÆ¡n (voucher, chÆ°Æ¡ng trÃ¬nh KM. | 0, 300000, 58000 |
| SERVICE_TEMPLATE | STRING | Loáº¡i hÃ¬nh dá»ch vá»¥: FNB (Än uá»ng), RETAIL, SHIP, v. | FNB |
| DELIVERY_FEE | FLOAT | PhÃ­ giao hÃ ng (náº¿u cÃ³), chá» hiá»n khi SERVING_TYPE lÃ  DELIVERY. | 18000, 10000, 0 |
| PARTNER | STRING | TÃªn ngáº¯n cá»§a Äá»i tÃ¡c (HIGHLAND, PHUC_LONG. | HIGHLAND, JOLLIBEE, SOUNDBOX, THE_COFFEE_HOUSE, IPOS_DELIVERY |
| TOTAL_AMOUNT | FLOAT | Tá»ng giÃ¡ trá» ÄÆ¡n hÃ ng sau khi cá»ng phÃ­ vÃ  trá»« giáº£m giÃ¡. | 55000, 45000, 29000 |
| status | STRING | Tráº¡ng thÃ¡i hiá»n táº¡i cá»§a ÄÆ¡n: INIT (khá»i táº¡o), COMPLETED (thÃ nh cÃ´ng), CANCELLED (há... | INIT, COMPLETED, ORDER_FAILED, CANCELED, PREPARING |
| order_date | DATE | NgÃ y khÃ¡ch thá»±c hiá»n ÄÆ¡n hÃ ng, dÃ¹ng Äá» lá»c theo ngÃ y. | 2025-09-10, 2025-12-04, 2025-02-14 |

## Domain Knowledge (from Mimir)

- Khi người dùng hỏi về 'promo/organic user', hãy sử dụng: CASE WHEN is_paid_user=1 THEN 'paid' ELSE 'organic' END
- User_type theo 1 dimension nào đó là trạng thái user tại tháng T đối với dimension đó: - New: trước đó chưa từng có giao dịch - Retain: tháng trước có giao dịch, tháng này vẫn tiếp tục có giao dịch - Reactive: đã từng có giao dịch trước đó, nhưng tháng T-1 không có giao dịch và tháng T có giao dịch trở lại
- Chỉ nói về người dùng mới nếu user_type = new thôi, còn active user gọi là user thôi. Ví dụ khi user_type_department_monthly = "new" tức là user(agent_id) đó lần đầu có giao dịch tại EPS user_type_merchant_monthly = "new" tức là user(agent_id) đó lần đầu có giao dịch tại merchant tương ứng.
- Mapping for money_source column: CASE WHEN money_source = '1' THEN 'MoMo' WHEN money_source = '2' THEN 'Linked Bank' WHEN money_source = '3' THEN 'Napas' WHEN money_source = '4' THEN 'Visa Debit' WHEN money_source = '5' THEN 'Visa Credit' WHEN money_source = '6' THEN 'TTT' WHEN money_source = '7' THEN 'Paylater' WHEN money_source = '8' THEN 'Cashback' WHEN money_source = '9' THEN 'Virtual Account Card' WHEN money_source = '10' THEN 'BNPL' WHEN money_source = '11' THEN 'Newton' WHEN money_source = '12' THEN 'Direct Debit' WHEN money_source = '13' THEN 'Money Pool' ELSE 'Other' END
- Khi người dùng hỏi về 'usecase', hãy sử dụng cột 'usecase'.
- MAU (Monthly Active User) của Coopmart = user sử dụng dịch vụ của Coopmart
- EPS bao gồm các danh mục (cate) là Retail, FnB và Medium.
- Nếu người dùng hỏi thông tin mà không chỉ định ngày/tháng, luôn hỏi lại để tránh query nặng.
- For the table `project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION`, the date column is named `date`, not `trans_date`.
- Nhận gift = gift đã được giao đến người dùng (deliver_time/deliver_date trong F_OFFLINE_GIFT_APPLICABLE), không phải là đã đổi thưởng (redeem_time/redeem_date trong F_OFFLINE_GIFT_REDEEM).
- AOV = Tổng giá trị giao dịch / Tổng số giao dịch.
- Khi user hỏi có bao nhiêu user momo quét mã VietQR tại Long Châu theo bank_name, account_name theo tháng thì filter merchant_user_type = 'acc_bank_monthly'
- service_lv1 = 'offline_m2b' tượng trưng cho viet QR. Khi người dùng hỏi về merchant, hãy sử dụng cột 'merchant_name_sl'.
- The user wants to use the table `project-5400504384186300846.MBI_DA.DM_EPS_USER_TRANSACTION` for user-related queries.
- payment_type = 7 tương ứng với Paylater trong hệ thống EPS
- Khi truy vấn GMV và số lượng giao dịch từ bảng `project-5400504384186300846.MBI_DA.ORDER_MINIAPP` cho các đơn hàng trên miniapp, ngoài trạng thái `COMPLETED`, tôi cũng sẽ bao gồm các đơn hàng có trạng thái `ORDER_SUCCESS`.
- GMV = transaction * AOV
- Khi người dùng hỏi về 'doanh thu', hãy sử dụng cột 'revenue'. Khi người dùng hỏi về 'gmv', hãy sử dụng cột 'amount'.
- RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này. REACTIVATED USER = người dùng đã từng dùng dịch vụ trong quá khứ, không dùng vào tháng trước, nhưng dùng lại vào tháng này. NEW USER = người dùng lần đầu tiên dùng dịch vụ vào tháng này.
- Khi người dùng hỏi về 'master merchant', hãy hiểu rằng họ đang đề cập đến các giao dịch có cột 'cate' = 'medium'.
- Khi user hỏi về thông tin của 1 merchant cụ thể, lúc query hãy upper(merchant_name_adjust) để đảm bảo khớp tên merchant.
- Khi người dùng hỏi về 'user type', hãy sử dụng cột 'user_type_department_monthly'.
- Ví trả sau = payment_method = 'payLater'
- Khi người dùng hỏi về "người dùng MoMo quét MoMoQR", hãy sử dụng bộ lọc service_lv1 = 'offline_m2m'

## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
