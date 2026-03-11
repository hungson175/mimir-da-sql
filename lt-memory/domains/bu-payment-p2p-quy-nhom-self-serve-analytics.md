# BU Payment:  P2P QUY NHOM SELF SERVE ANALYTICS

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `58aa0bc4-eda4-4442-9d64-9f67d36a54ca`

## Tables

### `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_PAYMENT_SOF`
> Bảng fact lưu trữ chi tiết giao dịch nguồn tiền (source of fund – SOF) khi người dùng thanh toán trong quỹ nhóm (P2P MONEYPOOL).
- Phân tích dòng tiền vào/ra từng quỹ nhóm theo thời gian thực.
- Theo dõi phí, loại quỹ, vai trò thành viên để tính toán lợi nhuận chia sẻ.
- Cung cấp dữ liệu nguyên gốc cho báo cáo tài chính, phân tích chi tiêu và giám sát rủi ro nội bộ.Bảng fact lưu trữ chi tiết giao dịch nguồn tiền (source of fund – SOF) khi người dùng thanh toán trong quỹ nhóm (P2P MONEYPOOL).
- Phân tích dòng tiền vào/ra từng quỹ nhóm theo thời gian thực.
- Theo dõi phí, loại quỹ, vai trò thành viên để tính toán lợi nhuận chia sẻ.
- Cung cấp dữ liệu nguyên gốc cho báo cáo tài chính, phân tích chi tiêu và giám sát rủi ro nội bộ.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `PAYMENT_TID` | STRING | Mã giao dịch thanh toán trong quỹ nhóm, unique trên toàn hệ thống.Mã giao dịch thanh toán trong quỹ nhóm, unique trên toàn hệ thống.  **Sample value**: 87369760916, 87372126197, 87400536655 | 106992363940, 103850335515, 73301664198 |
| `TID_mp` | STRING | Mã giao dịch của quỹ nhóm (MONEYPOOL transaction ID) để liên kết với các bản ghi quỹ khác.Mã giao dịch của quỹ nhóm (MONEYPOOL transaction ID) để liên kết với các bản ghi quỹ khác.  **Sample value**: 87359344978, 87365849315, 87400095195 | 0, 111502402631, 113118526421 |
| `ACTION` | FLOAT | Loại hành động trên nguồn tiền: -2.0 là rút/tiêu tiền khỏi quỹ.Loại hành động trên nguồn tiền: -2.0 là rút/tiêu tiền khỏi quỹ.  **Sample value**: -2.0 (duy nhất trong mẫu) | -5, -2, -4 |
| `amount` | FLOAT | Số tiền thanh toán trong quỹ (Đồng Việt Nam).Số tiền thanh toán trong quỹ (Đồng Việt Nam).  **Sample value**: 62000.0, 35000.0, 1000000.0 | 50000, 100000, 10000 |
| `date` | DATE | Ngày giao dịch (yyyy-MM-dd).Ngày giao dịch (yyyy-MM-dd).  **Sample value**: 2025-05-14 (duy nhất trong mẫu) | 2026-01-17, 2026-02-02, 2026-02-01 |
| `datetime` | DATETIME | Ngày giờ giao dịch đầy đủ.Ngày giờ giao dịch đầy đủ.  **Sample value**: 2025-05-14 10:14:12, 2025-05-14 16:00:33 | 2026-01-11 19:03:23.917, 2026-01-09 15:43:56.476, 2025-12-06 19:11:58.754 |
| `month` | DATE | Tháng tham chiếu (ngày đầu tháng của date).Tháng tham chiếu (ngày đầu tháng của date).  **Sample value**: 2025-05-01 (duy nhất trong mẫu) | 2026-01-01, 2025-12-01, 2026-02-01 |
| `FUND_ID` | STRING | Định danh duy nhất của quỹ nhóm (kèm user owner).Định danh duy nhất của quỹ nhóm (kèm user owner).  **Sample value**: mp_16922662_2tabog1o012hd40upwqkmn, mp_32268054_6kwachponoix48tf6zdwkn, mp_83851276_1bjutbcutynxr9znypbcmb | mp_62008438_7maztr7yrfqkvs0bj7grch, mp_20490289_6i4rv3nfcgkrnha41v9qbv, mp_82923992_7joeadtajzk0hybq1oobvk |
| `FUND_TYPE` | STRING | Loại quỹ: [1] Individual (cá nhân) hoặc [2] Couple (cặp đôi).Loại quỹ: [1] Individual (cá nhân) hoặc [2] Couple (cặp đôi).  **Sample value**: [1]. Individual, [2]. Couple | [1]. Individual, [2]. 2 People, [3]. 3-4 People |
| `USER_ID` | STRING | Agent ID của người thực hiện thanh toán trong quỹ.Agent ID của người thực hiện thanh toán trong quỹ.  **Sample value**: 16922662, 32268054, 83851276 | 106705567, 6755173, 62008438 |
| `MESSAGE_TRANSFER` | STRING | Nội dung tin nhắn đính kèm giao dịch.Nội dung tin nhắn đính kèm giao dịch (có policy tag 'Họ, chữ đệm và tên gọi khác' – không hiển thị mẫu). | — |
| `SERVICE_CODE` | STRING | Mã dịch vụ hạ tầng thanh toán.Mã dịch vụ hạ tầng thanh toán.  **Sample value**: aha20151225001 (duy nhất trong mẫu) | u2u, cardcashout.mbbank_w2b, cardcashout.0916715134 |
| `SERVICEID` | STRING | Mã dịch vụ nghiệp vụ mapping với service_code.Mã dịch vụ nghiệp vụ mapping với service_code.  **Sample value**: AHAMOVE20151126 (duy nhất trong mẫu) | transfer_p2b_scan_vietqr, transfer_p2b, transfer_p2b_scan_vietqr_upload |
| `specialproject` | STRING | Dự án đặc biệt mà giao dịch thuộc về.Dự án đặc biệt mà giao dịch thuộc về.  **Sample value**: LOGISTICS (duy nhất trong mẫu) | P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET, SME OFFLINE |
| `FEE` | FLOAT | Phí giao dịch (0 nếu miễn phí).Phí giao dịch (0 nếu miễn phí).  **Sample value**: 0.0 (duy nhất trong mẫu) | 0, 2200, 3950 |
| `usecase` | STRING | Kịch bản sử dụng nghiệp vụ.Kịch bản sử dụng nghiệp vụ.  **Sample value**: LOGISTICS (duy nhất trong mẫu) | SCAN VIETQR, P2P - EWALLET TO BANK, P2P - EWALLET TO EWALLET |
| `ROLE` | FLOAT | Mã vai trò (chưa dùng, giá trị toàn NaN).Mã vai trò (chưa dùng, giá trị toàn NaN). | 1, 3, 2 |
| `user_id_owner` | STRING | Agent ID chủ quỹ (null nếu quỹ không có chủ rõ ràng theo kịch bản).Agent ID chủ quỹ (null nếu quỹ không có chủ rõ ràng theo kịch bản). | 106705567, 53443465, 10871014 |
| `ROLE_TYPE` | STRING | Tên vai trò (null nếu quỹ không phân quyền cụ thể).Tên vai trò (null nếu quỹ không phân quyền cụ thể). | [1]. Chủ quỹ, [2]. Phó quỹ |

### `project-5400504384186300846.MBI_DA.fact_quy_owner_monthly`
> Bảng fact thống kê hàng tháng của chủ sở hữu quỹ. Có thể sử dụng bảng này để theo dõi các hoạt động hàng tháng của chủ sở hữu quỹ, phân tích các loại hành động được thực hiện cho quỹ, và xác định chiến dịch và chiến thuật liên quan đến quỹ.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng diễn ra hoạt động. | 2026-01-01, 2025-12-01, 2026-02-01 |
| `owner_aid` | STRING | Mã định danh của chủ sở hữu quỹ. | 766789, 57851509, 88304958 |
| `monthly_active_type` | STRING | Loại hoạt động hàng tháng của chủ sở hữu quỹ. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `action_type` | STRING | Loại hành động thực hiện trên quỹ. | final_action |
| `fund_id` | STRING | Mã định danh của quỹ. | mp_27631844_1fnkioe1tuuaxcvhpk30xr, mp_41632364_2db5mdiwsy11rjqybpsuxs, mp_69858098_6yplcsjrtfoz5sdrc8elnd |
| `fund_type` | STRING | Loại quỹ. | [1]. Individual, [2]. 2 People, [3]. 3-4 People |
| `tid` | FLOAT | ID giao dịch liên quan đến quỹ. | 0, 40730481342, 41044422794 |
| `date` | DATE | Ngày diễn ra giao dịch. | 2026-03-01, 2026-02-01, 2025-12-01 |
| `datetime` | DATETIME | Thời gian cụ thể diễn ra giao dịch. | 2026-02-01 23:20:27.772, 2025-07-03 18:31:29.490, 2025-06-02 09:50:09.523 |
| `milisecond_diff` | INTEGER | Sự khác biệt tính bằng miligiây so với một mốc thời gian. | 0, 393, 347 |
| `detail_id` | STRING | Mã chi tiết liên quan đến giao dịch quỹ. | , 0P62QFB26DW9C, 120143966262 |
| `tactic` | STRING | Chiến thuật áp dụng trong quản lý quỹ. | Organic, voucher, gamification |
| `kpi_type` | STRING | Loại chỉ số KPI liên quan đến quỹ. | Organic, growth, engage |
| `sub_tactics` | STRING | Chiến thuật con áp dụng trong quản lý quỹ. | Organic, tran_game, redeem_voucher_collect |
| `campaign_name_lv1` | STRING | Tên chiến dịch cấp độ 1 liên quan đến quỹ. | Organic, , SC25 |
| `campaign_name_lv2` | STRING | Tên chiến dịch cấp độ 2 liên quan đến quỹ. | Organic, , qn_w2b_251204_cbttt_100pt3k_hje7k |
| `priority_rank_lv1` | INTEGER | Xếp hạng ưu tiên cấp 1 của chiến dịch. | 0, 2, 3 |
| `priority_rank_lv3` | INTEGER | Xếp hạng ưu tiên cấp 3 của chiến dịch. | 0, 3, 2 |
| `attribution_rank` | INTEGER | Xếp hạng attribution trong phân tích chiến dịch. | 1 |

### `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND_TRANSFER`
> Bảng này chứa thông tin chi tiết về các giao dịch trong quỹ nhóm P2P trên MoMo. Bảng này giúp theo dõi và phân tích các hoạt động giao dịch trong quỹ nhóm.

Thông tin tìm kiếm từ bảng này:
- Theo dõi các giao dịch góp quỹ, rút quỹ, và nhận tiền lời trong quỹ nhóm.
- Phân tích trạng thái và loại quỹ, bao gồm loại hình đầu tư và mục đích quỹ.
- Đánh giá thông tin người dùng thực hiện giao dịch, bao gồm mã định danh người dùng, nhóm tuổi, và giới tính của người dùng thực hiện giao dịch.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng diễn ra giao dịch | 2026-01-01, 2026-02-01, 2025-12-01 |
| `date` | DATE | Ngày diễn ra giao dịch trong quỹ nhómNgày diễn ra giao dịch trong quỹ nhóm  **Sample value**: 2023-06-20 | 2026-02-05, 2026-02-04, 2026-02-03 |
| `datetime` | DATETIME | Thời điểm chính xác giao dịch được tạo (bao gồm cả giờ, phút, giây)Thời điểm chính xác giao dịch được tạo (bao gồm cả giờ, phút, giây)  **Sample value**: 2023-06-20 14:06:23.043 | 2026-01-24 06:08:53.909, 2026-02-16 06:24:29.847, 2025-11-15 22:31:41.074 |
| `FUND_ID` | STRING | Mã định danh duy nhất của quỹ (mp_<owner_id>_<hash>)Mã định danh duy nhất của quỹ (mp_<owner_id>_<hash>) | mp_27868432_4xuiy6loipo2vdoa0nlvmh, mp_11050877_lpkwst8a5oq4xghrzx1bf, mp_39057855_1cdbspd58as28wruj1ajl7 |
| `USER_ID` | STRING | Mã định danh người thực hiện giao dịch trong quỹMã định danh người thực hiện giao dịch trong quỹ | 106705567, 71351460, 53443465 |
| `ACTION` | FLOAT | Loại giao dịch thực hiện trong quỹ nhóm -- DEPOSIT (1): Góp quỹ -- REFUND_FAILED_PAYMENT (2): Refund giao dịch thanh toán SOF bị failed -- REFUND_CANCELLED_PAYMENT (3): Refund giao dịch thanh toán SOF bị cancelled -- REFUND_FAILED_W2W_TRANSFER (4): Refund giao dịch chuyển tiền W2W SOF bị failed -- REFUND_FAILED_W2B_TRANSFER (5): Refund giao dịch chuyển tiền W2B SOF bị failed -- DEPOSIT_WITH_AIO_QR_B2W (6): Góp quỹ qua QR bằng tài khoản ngân hàng B2W -- CLAIM_INTEREST (7): Manual Nhận tiền lời (trước tháng 4/2025) -- CASHBACK_SCHEME_NTMM (8): Scheme cashback cho thành viên New to MoMo -- AUTO_CLAIM_INTEREST (9): Tự động claim tiền lời mỗi ngày (sau tháng 4/2025) -- SC25_PROMOTION (10): Giao dịch cashback từ Summer Campaign 2025 -- CASHBACK (11): Giao dịch nhận tiền cashback vào quỹ cashback của owner. -- WITHDRAW (-1): Rút quỹ -- WITHDRAW_FOR_PAYMENT (-2): Thanh toán SOF -- REGISTER_GOLDEN_POCKET (-3): GD Kích hoạt sinh lời -- WITHDRAW_FOR_W2W_TRANSFER (-4): Chuyển tiền W2W SOF -- WITHDRAW_FOR_W2B_TRANSFER (-5): Chuyển tiền W2B SOF -- WITHDRAW_FOR_W2W_TRANSFER_AS_REQUESTED (-6): Rút quỹ chuyển tiền W2W cho thành viên theo yêu cầu -- (-7): giao dịch off sinh lời sẽ là -- (-8): các gd rút tiền từ quỹ về ví để thanh toán, type mp_cashin, investcashin_pay_mp -- DEPOSIT (1): Góp quỹ  -- REFUND_FAILED_PAYMENT (2): Refund giao dịch thanh toán SOF bị failed  -- REFUND_CANCELLED_PAYMENT (3): Refund giao dịch thanh toán SOF bị cancelled  -- REFUND_FAILED_W2W_TRANSFER (4): Refund giao dịch chuyển tiền W2W SOF bị failed  -- REFUND_FAILED_W2B_TRANSFER (5): Refund giao dịch chuyển tiền W2B SOF bị failed  -- DEPOSIT_WITH_AIO_QR_B2W (6): Góp quỹ qua QR bằng tài khoản ngân hàng B2W  -- CLAIM_INTEREST (7): Manual Nhận tiền lời (trước tháng 4/2025)  -- CASHBACK_SCHEME_NTMM (8): Scheme cashback cho thành viên New to MoMo  -- AUTO_CLAIM_INTEREST (9): Tự động claim tiền lời mỗi ngày (sau tháng 4/2025)  -- SC25_PROMOTION (10): Giao dịch cashback từ Summer Campaign 2025  -- CASHBACK (11): Giao dịch nhận tiền cashback vào quỹ cashback của owner.     -- WITHDRAW (-1): Rút quỹ  -- WITHDRAW_FOR_PAYMENT (-2): Thanh toán SOF  -- REGISTER_GOLDEN_POCKET (-3): GD Kích hoạt sinh lời  -- WITHDRAW_FOR_W2W_TRANSFER (-4): Chuyển tiền W2W SOF  -- WITHDRAW_FOR_W2B_TRANSFER (-5): Chuyển tiền W2B SOF  -- WITHDRAW_FOR_W2W_TRANSFER_AS_REQUESTED (-6): Rút quỹ chuyển tiền W2W cho thành viên theo yêu cầu  -- ( -7): giao dịch off sinh lời sẽ là   -- (-8) là các gd rút tiền từ quỹ về ví để thanh toán, type mp_cashin, investcashin_pay_mp   Link: https://atlassiantool.mservice.com.vn:9443/pages/editpage.action?pageId=202217754" | 9, 1, -5 |
| `ACTION_NAME` | STRING | Tên hành động dựa trên loại giao dịch WHEN ACTION IN (-1) THEN 'Withdraw' WHEN ACTION = 1 AND PAYMENT_CHANNEL IS NULL THEN 'Cash In' WHEN ACTION IN (-2, -4, -5, -6) THEN 'Payment SOF' WHEN ACTION IN (2, 3, 4, 5) THEN 'Refund' WHEN ACTION = -3 THEN 'Register Golden Pocket (Valid)' WHEN ACTION IN (7, 9) THEN 'Claim Interest' WHEN ACTION = 6 THEN 'CashIn AIOQR (bank-ví)' WHEN ACTION = 1 AND (PAYMENT_CHANNEL = 'scan_qr' OR PAYMENT_CHANNEL IS NOT NULL) THEN 'Cash In AIOQR (ví-ví)' WHEN ACTION = -6 THEN 'Withdraw as requested' WHEN ACTION = 8 AND a.AMOUNT = 10000 THEN 'Cashback scheme NTMM - 10k' WHEN ACTION = 10 THEN 'SC25 Promotion' WHEN ACTION = -7 THEN 'Deregister Golden Pocket' WHEN ACTION = -8 THEN 'Withdraw to Wallet for Payment' ELSE 'Others'    WHEN ACTION IN (-1) THEN 'Withdraw'     WHEN ACTION = 1 AND PAYMENT_CHANNEL IS NULL THEN 'Cash In'     WHEN ACTION IN (-2, -4, -5, -6) THEN 'Payment SOF'     WHEN ACTION IN (2, 3, 4, 5) THEN 'Refund'     WHEN ACTION = -3 THEN 'Register Golden Pocket (Valid)'     WHEN ACTION IN (7, 9) THEN 'Claim Interest'     WHEN ACTION = 6 THEN 'CashIn AIOQR (bank-ví)'     WHEN ACTION = 1 AND (PAYMENT_CHANNEL = 'scan_qr' OR PAYMENT_CHANNEL IS NOT NULL) THEN 'Cash In AIOQR (ví-ví)'     WHEN ACTION = -6 THEN 'Withdraw as requested'     WHEN ACTION = 8 AND a.AMOUNT = 10000 THEN 'Cashback scheme NTMM - 10k'     WHEN ACTION = 8 AND a.AMOUNT = 20000 THEN 'Cashback scheme NTMM - 20k'     WHEN ACTION = 10 THEN 'SC25 Promotion'      WHEN ACTION = -7 THEN 'Deregister Golden Pocket'     WHEN ACTION = -8 THEN 'Withdraw to Wallet for Payment'     ELSE 'Others' | Claim Interest, Cash In, Payment SOF |
| `ROLE` | FLOAT | Vai trò của người thực hiện giao dịch trong quỹ nhóm | 1, 2, 3 |
| `FUND_TYPE` | STRING | Dạng quỹ theo số ngườiDạng quỹ theo số người | [1]. Individual, [2]. 2 People, [3]. 3-4 People |
| `FUND_TYPE_include_B2W` | STRING | Dạng quỹ theo số người bao gồm cả bank account B2 quỹDạng quỹ theo số người bao gồm cả bank account B2 quỹ | [1]. Individual, [2]. Couple, [3]. Family & Friends |
| `USER_ID_OWNER` | STRING | Mã định danh chủ quỹMã định danh chủ quỹ | 27868432, 11050877, 39057855 |
| `STATUS_FUND` | FLOAT | Trạng thái quỹ -- Khóa quỹ (0) -- Còn mở quỹ (1) -- Pause Deposit (2): Out-of-date -- PENDING_ACTIVATION(3): Status của các quỹ cashback chưa được owner vào bấm claimTrạng thái đã Khóa quỹ, Còn mở quỹ:  -- Khóa quỹ (0)  -- Còn mở quỹ (1)  -- Pause Deposit (2): Out-of-date  -- PENDING_ACTIVATION(3): Status của các quỹ cashback chưa được owner vào bấm claim. | 1, 0, 3 |
| `FUND_SIZE` | INTEGER | Số lượng thành viên trong quỹ tại thời điểm chạy pipelineSố lượng thành viên trong quỹ tại thời điểm chạy pipeline | 1, 2, 3 |
| `STATUS_FUND_final` | FLOAT | Trạng thái cuối cùng của quỹ tại thời điểm chạy pipelineTrạng thái cuối cùng của quỹ tại thời điểm chạy pipeline | 1, 0, 3 |
| `OWNER_AGE` | STRING | Nhóm tuổi chủ quỹ tại thời điểm chạy pipelineNhóm tuổi chủ quỹ tại thời điểm chạy pipeline | [2].Owner >18, [1].Owner Under 18 |
| `old_user_type_to_service` | STRING | Phân loại user theo '[01]. New to service', '[02]. Retention', '[03]. Reactivation', exclude map bankPhân loại user theo  '[01]. New to service', '[02]. Retention', '[03]. Reactivation' , exclude map bank | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `user_type_to_service` | STRING | Phân loại user theo '[01]. New to service', '[02]. Retention', '[03]. Reactivation'Phân loại user theo  '[01]. New to service', '[02]. Retention', '[03]. Reactivation' | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `old_FUND_TYPE_active` | STRING | Phân loại quỹ theo '[01]. New to service', '[02]. Retention', '[03]. Reactivation'Phân loại quỹ theo  '[01]. New to service', '[02]. Retention', '[03]. Reactivation' | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `FUND_TYPE_active` | STRING | Phân loại quỹ theo '[01]. New to service', '[02]. Retention', '[03]. Reactivation'Phân loại quỹ theo  '[01]. New to service', '[02]. Retention', '[03]. Reactivation' | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `Old_uniqueowner_to_service` | STRING | Phân loại owner theo '[01]. New to service', '[02]. Retention', '[03]. Reactivation'Phân loại owner theo  '[01]. New to service', '[02]. Retention', '[03]. Reactivation' | [02]. Retention, [03]. Reactivation, [01]. New to service |
| `Uniqueowner_to_service` | STRING | Phân loại owner theo '[01]. New to service', '[02]. Retention', '[03]. Reactivation'Phân loại owner theo  '[01]. New to service', '[02]. Retention', '[03]. Reactivation' | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `TID` | FLOAT | Mã giao dịch Quỹ, một số case là chính mã giao dịch ở coreMã giao dịch Quỹ, một số case là chính mã giao dịch ở core | 0, 105695562357, 105974477965 |
| `PAYMENT_TID` | FLOAT | Mã giao dịch thanh toán liên quanMã giao dịch thanh toán liên quan | 113514451449, 96333076311, 85560146861 |
| `PARENT_TID` | FLOAT | Mã giao dịch chaMã giao dịch cha | 116247994371, 104933703750, 89873476067 |
| `STATUS` | STRING | Trạng thái lệnh quỹTrạng thái lệnh quỹ, update vụ success nữa | success, refunded, refunding |
| `ERROR_CODE` | FLOAT | Mã lỗi giao dịchMã lỗi giao dịch | 0, 1219101, 1219100 |
| `PAYMENT_CHANNEL` | STRING | Kênh thanh toánKênh thanh toán | detail_home, scan_qr, link_private |
| `MESSAGE_TRANSFER` | STRING | Nội dung tin nhắn giao dịchNội dung tin nhắn giao dịch | Góp vào quỹ chung, Quà từ Đấu Trường Tri Thức, Nhận tiền hoàn từ MoMo |
| `AMOUNT` | FLOAT | Số tiền giao dịch (VND)Số tiền giao dịch (VND) | 1, 20000, 10000 |
| `B2W_user_id` | STRING | User Back2Wallet mappingUser Back2Wallet mapping | 0d28c2db9efb5c2c6ed787d3fa5d58656a01bc244a94cd2334d2424055497926, 49305308e5c3bd38203bf9df59d7eb6a028645ede7cd29aa56a5a96fe37a59fd, f043dd0cff47201ac9d2ba9f6ed34a7fb6adbe1d7ccbf3a59410c5dc9eedffc5 |
| `tknh_momo_type` | STRING | Loại tài khoản MoMoLoại tài khoản MoMo | [2]. not overlap, [1]. overlap |
| `tknh_tknh_type` | STRING | Loại tài khoản ngân hàngLoại tài khoản ngân hàng | [2]. not overlap, [1]. overlap |
| `SOURCE_ACCOUNT_MOMO_USER_TYPE` | STRING | Loại tài khoản nguồnLoại tài khoản nguồn | [1]. Đã map, [2]. Chưa map -> Đã map |
| `SOURCE_ACCOUNT_MOMO_USER_ID` | STRING | Mã user nguồnMã user nguồn | 72559601, 30885744, 35001870 |
| `FUND_INVESTMENT_STATUS` | FLOAT | Trạng thái đầu tư vào quỹTrạng thái đầu tư vào quỹ | 1, 0, 2 |
| `REGISTER_INVESTMENT_TIME` | DATETIME | Thời điểm đăng ký đầu tưThời điểm đăng ký đầu tư | 2025-02-15 17:55:17.331, 2026-02-02 11:45:21.187, 2025-11-20 18:18:36.908 |
| `fund_type_by_purpose` | STRING | Mục đích quỹMục đích quỹ | [2]. Saving, [1]. Spending |
| `FUND_INVESTMENT_TYPE` | STRING | Loại hình đầu tưLoại hình đầu tư | [1]. TTT, [2]. Non-TTT |
| `FIRST_INVESTMENT_TID_TYPE` | STRING | Loại giao dịch đầu tư đầu tiênLoại giao dịch đầu tư đầu tiên | [1]. ACTION (1) đi kèm ACTION (-3) |
| `age_group` | STRING | Nhóm tuổi người thực hiện giao dịchNhóm tuổi người thực hiện giao dịch | others, [2].18-22, [3].23-27 |
| `citygroup` | STRING | Nhóm thành phốNhóm thành phố | UNKNOWN, Thành Phố Hồ Chí Minh, Hà Nội |
| `gender` | STRING | Giới tínhGiới tính | FEMALE, MALE |
| `avail_balance` | FLOAT | Số dư khả dụng của quỹSố dư khả dụng của quỹ | 1953905397603, 2182321427056, 1807525297643 |

### `project-5400504384186300846.MBI_DA.adhoc_momo_coin_balance_yester_day`
> Bảng ghi lại số dư MoMo Coin của người dùng tại ngày hôm trước. 
Thông tin có thể được lấy từ bảng này: 
- Xem số dư MoMo Coin của người dùng vào ngày hôm trước 
- Phân tích biến động số dư MoMo Coin giữa các ngày 
- Hỗ trợ báo cáo và phân tích giao dịch MoMo Coin hàng ngày

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | INTEGER | Mã định danh cho mỗi ví MoMo. | 35505888, 46034332, 36734064 |
| `balance` | FLOAT | Số dư MoMo Coin của người dùng vào ngày hôm trước. | 5, 10, 15 |

### `project-5400504384186300846.MBI_DA.adhoc_hang_truong_survey_adopt_20260305`
> Bảng chứa dữ liệu từ cuộc khảo sát "hang truong". Bảng bao gồm các thông tin liên quan đến Agent ID, thời điểm bắt đầu và nộp khảo sát. Ngoài ra, bảng cũng ghi lại các câu trả lời chi tiết cho từng phần của cuộc khảo sát.
- Xác định và phân tích các nhu cầu và xu hướng của khách hàng thông qua Agent ID.
- Đánh giá thời gian bắt đầu và hoàn thành khảo sát để xác định mức độ hoặc cách thức người dùng tương tác.
- Tổng hợp câu trả lời cho các câu hỏi A1 và A2 để phân tích kết quả khảo sát.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | STRING | Mã định danh cho mỗi ví MoMo của người dùng tham gia khảo sát. | 69845131, 38462097, 89907359 |
| `status` | STRING | Trạng thái của khảo sát, ví dụ như chưa hoàn thành hoặc đã hoàn thành. | COMPLETED |
| `time_start` | DATETIME | Thời điểm bắt đầu thực hiện khảo sát. | 2026-03-03 23:47:24, 2026-03-04 11:06:07, 2026-03-01 17:44:57 |
| `time_submit` | DATETIME | Thời điểm nộp khảo sát. | 2026-02-28 03:34:53, 2026-02-28 06:57:49, 2026-02-27 08:42:18 |
| `A1_1` | STRING | Câu trả lời cho câu hỏi A1_1 trong khảo sát. | Tôi muốn chắc chắn thanh toán từ đúng quỹ |
| `A1_2` | STRING | Câu trả lời cho câu hỏi A1_2 trong khảo sát. | Tôi muốn kiểm tra số dư trước khi thanh toán |
| `A1_3` | STRING | Câu trả lời cho câu hỏi A1_3 trong khảo sát. | Tôi quen thao tác như vậy |
| `A1_4` | STRING | Câu trả lời cho câu hỏi A1_4 trong khảo sát. | Tôi thấy phiền khi luôn phải chọn lại quỹ ở màn hình thanh toán |
| `A1_5` | STRING | Câu trả lời cho câu hỏi A1_5 trong khảo sát. | Muốn làm gì kệ ta, hỏi chi vậy tr, ko rõ |
| `A2_1` | STRING | Câu trả lời cho câu hỏi A2_1 trong khảo sát. | Tôi từng gặp trường hợp thanh toán không đúng nguồn mong muốn |
| `A2_2` | STRING | Câu trả lời cho câu hỏi A2_2 trong khảo sát. | Tôi đang quản lý chi tiêu theo từng quỹ cụ thể |
| `A2_3` | STRING | Câu trả lời cho câu hỏi A2_3 trong khảo sát. | Tôi sợ hệ thống chọn nhầm sang nguồn tiền khác |
| `A2_4` | STRING | Câu trả lời cho câu hỏi A2_4 trong khảo sát. | Tôi muốn tự quyết định rõ ràng trước khi thanh toán |
| `A2_5` | STRING | Câu trả lời cho câu hỏi A2_5 trong khảo sát. | Tôi chỉ thấy yên tâm hơn khi thao tác như vậy |
| `A2_6` | STRING | Câu trả lời cho câu hỏi A2_6 trong khảo sát. | In |

### `project-5400504384186300846.MBI_DA.adhoc_hang_truong_survey_drop_20260305`
> Bảng adhoc_hang_truong_survey_drop chứa các thông tin liên quan đến khảo sát đặc biệt từ trưởng nhóm. 
Thông tin có thể được lấy từ bảng này bao gồm: 
- Mã định danh của ví MoMo 
- Trạng thái của khảo sát 
- Thời gian bắt đầu và nộp khảo sát 
- Thông tin trả lời khảo sát từ các câu hỏi A1 và A2

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | STRING | Mã định danh cho mỗi ví MoMo. | 66742895, 46932999, 89248154 |
| `status` | STRING | Trạng thái của khảo sát, ví dụ như 'đã hoàn thành', 'đang chờ', etc. | COMPLETED |
| `time_start` | DATETIME | Thời gian bắt đầu khảo sát. | 2026-03-01 06:23:54, 2026-03-02 02:17:35, 2026-03-02 17:37:26 |
| `time_submit` | DATETIME | Thời gian nộp khảo sát. | 2026-03-04 13:53:21, 2026-02-27 08:43:38, 2026-02-28 01:16:49 |
| `A1_1` | STRING | Phản hồi cho câu hỏi A1_1 trong khảo sát. | Tôi chỉ vào xem thông tin quỹ |
| `A1_2` | STRING | Phản hồi cho câu hỏi A1_2 trong khảo sát. | Số dư không đủ |
| `A1_3` | STRING | Phản hồi cho câu hỏi A1_3 trong khảo sát. | Tôi đổi ý, chưa muốn thanh toán |
| `A1_4` | STRING | Phản hồi cho câu hỏi A1_4 trong khảo sát. | Tôi không rõ bước tiếp theo |
| `A1_5` | STRING | Phản hồi cho câu hỏi A1_5 trong khảo sát. | Tôi gặp lỗi / thao tác khó hiểu |
| `A1_6` | STRING | Phản hồi cho câu hỏi A1_6 trong khảo sát. | Tôi muốn thanh toán theo cách khác |
| `A1_7` | STRING | Phản hồi cho câu hỏi A1_7 trong khảo sát. | Nhận tiền hoàn |
| `A2_1` | STRING | Phản hồi cho câu hỏi A2_1 trong khảo sát. | — |
| `A2_2` | STRING | Phản hồi cho câu hỏi A2_2 trong khảo sát. | — |
| `A2_3` | STRING | Phản hồi cho câu hỏi A2_3 trong khảo sát. | — |
| `A2_4` | STRING | Phản hồi cho câu hỏi A2_4 trong khảo sát. | — |
| `A2_5` | STRING | Phản hồi cho câu hỏi A2_5 trong khảo sát. | — |
