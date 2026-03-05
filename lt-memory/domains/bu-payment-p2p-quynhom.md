# BU Payment: P2P QUYNHOM

**Domain ID:** `3a52651b-b3a6-4865-8a11-7b06ea99be24`

## Description
Domain này bao gồm những thông tin sau của sản phẩm QUỸ (NHÓM)
(1) transaction details: Lịch sử giao dịch trong quỹ
(2) fund creation information: Thông tin quỹ được tạo
(3) ending balance: Số dư quỹ
(4) active users MoMo: User có ít nhất 1 giao dịch trong bảng iDeA_TRANS_CORE
(4) event tracking: Product event thao tác trên miniapp quỹ nhóm
(5) promotion gift: Số user được nhận gift, redeem gift

## Tables

### `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND_TRANSFER`
> Bảng này ghi lại các thông tin liên quan đến việc chuyển quỹ trong dịch vụ P2P MONEYPOOL. Bảng có thể được sử dụng để: 
- Theo dõi trạng thái và chi tiết của các hoạt động chuyển quỹ giữa các người dùng trong dịch vụ P2P MONEYPOOL. 
- Phân tích loại quỹ và mục đích sử dụng quỹ liên quan đến hoạt động đầu tư của người dùng. 
- Đánh giá và phân tích thông tin tài chính và nhân khẩu học của chủ quỹ và người dùng tham gia dịch vụ.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng diễn ra hoạt động chuyển quỹ. | 2025-12-01, 2025-11-01, 2025-10-01 |
| `date` | DATE | Ngày diễn ra hoạt động chuyển quỹ. | 2025-12-05, 2025-12-12, 2025-12-10 |
| `datetime` | DATETIME | Ngày giờ cụ thể của hoạt động chuyển quỹ. | 2025-11-25 05:07:14.852, 2025-11-05 22:53:38.440, 2025-12-13 07:56:14.848 |
| `FUND_ID` | STRING | Mã định danh cho quỹ được chuyển. | mp_11050877_lpkwst8a5oq4xghrzx1bf, mp_59832398_4s0zxg5ejhovhmm51rkbvo, mp_26142871_7rybkulv09gvwu4wcuif64 |
| `USER_ID` | STRING | Mã định danh của người dùng tham gia chuyển quỹ. | 71351460, 95936547, 27345607 |
| `ACTION` | FLOAT | Hành động liên quan đến chuyển quỹ. | 9, 1, -1 |
| `ACTION_NAME` | STRING | Tên của hành động liên quan đến chuyển quỹ. | Claim Interest, Cash In, Payment SOF |
| `ROLE` | FLOAT | Vai trò của người dùng trong hoạt động chuyển quỹ. | 1, 2, 3 |
| `FUND_TYPE` | STRING | Loại quỹ được sử dụng trong quá trình chuyển quỹ. | [1]. Individual, [2]. 2 People, [3]. 3-4 People |
| `FUND_TYPE_include_B2W` | STRING | Loại quỹ bao gồm cả giao dịch B2W. | [1]. Individual, [2]. Couple, [3]. Family & Friends |
| `USER_ID_OWNER` | STRING | Mã định danh của chủ sở hữu quỹ. | 11050877, 36964031, 59832398 |
| `STATUS_FUND` | FLOAT | Trạng thái của quỹ tại từng bước trong quá trình chuyển quỹ. | 1, 0, 3 |
| `FUND_SIZE` | INTEGER | Kích thước hoặc số lượng của quỹ. | 1, 2, 3 |
| `STATUS_FUND_final` | FLOAT | Trạng thái cuối cùng của quỹ sau khi hoạt động chuyển quỹ hoàn tất. | 1, 0 |
| `OWNER_AGE` | STRING | Độ tuổi của chủ sở hữu quỹ. | [2].Owner >18, [1].Owner Under 18 |
| `USER_TYPE_to_service` | STRING | Loại người dùng tham gia dịch vụ. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `new_user_type_to_service` | STRING | Loại người dùng mới tham gia dịch vụ. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `FUND_TYPE_active` | STRING | Loại quỹ đang hoạt động trong quá trình chuyển quỹ. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `UniqueOwner_to_service` | STRING | Chỉ số định danh duy nhất của chủ sở hữu trong dịch vụ. | [02]. Retention, [01]. New to service, [03]. Reactivation |
| `CORE_MONEY_SOURCE` | STRING | Nguồn tiền cốt lõi được sử dụng trong giao dịch. | Khác, MoMo wallet, Banklink |
| `TID` | FLOAT | Mã giao dịch liên quan đến chuyển quỹ. | 0, 108879701119, 104078432272 |
| `PAYMENT_TID` | FLOAT | Mã giao dịch của thanh toán liên quan đến chuyển quỹ. | 87290368707, 89407319324, 100649064228 |
| `PARENT_TID` | FLOAT | Mã giao dịch gốc liên quan đến các giao dịch con. | 86593114534, 107408070067, 93905637910 |
| `STATUS` | STRING | Trạng thái của giao dịch chuyển quỹ. | success, refunded, refunding |
| `ERROR_CODE` | FLOAT | Mã lỗi nếu có trong quá trình chuyển quỹ. | 0, 1219101, 1219100 |
| `PAYMENT_CHANNEL` | STRING | Kênh thanh toán được sử dụng trong chuyển quỹ. | scan_qr, detail_home, link_private |
| `MESSAGE_TRANSFER` | STRING | Thông điệp kèm theo trong quá trình chuyển quỹ. | Pfj8Zi1Tc63jgxBMFAGTQV1udyRpAmKhgtcs/YoqPjQ=, eNIXuGs0S21+UG/qiQDHo09Olh06DsYuTVoxFZo13Qk=, bjCi3/bIT8/jpE94BwGukWywmzmR+HL7fZf2+Ojwo+E= |
| `AMOUNT` | FLOAT | Giá trị của số tiền được chuyển trong giao dịch. | 1, 20000, 10000 |
| `B2W_user_id` | STRING | Mã định danh người dùng trong giao dịch B2W. | 49305308e5c3bd38203bf9df59d7eb6a028645ede7cd29aa56a5a96fe37a59fd, f043dd0cff47201ac9d2ba9f6ed34a7fb6adbe1d7ccbf3a59410c5dc9eedffc5, d43b26b62a2a746ec68b8fe617366b121b6c4ad485c23842e7f2b156d08a3f06 |
| `tknh_momo_type` | STRING | Loại tài khoản MoMo liên quan đến giao dịch. | [2]. not overlap, [1]. overlap |
| `tknh_tknh_type` | STRING | Loại tài khoản ngân hàng liên quan đến giao dịch. | [2]. not overlap, [1]. overlap |
| `SOURCE_ACCOUNT_MOMO_USER_TYPE` | STRING | Loại người dùng MoMo của tài khoản nguồn trong giao dịch. | [1]. Đã map, [2]. Chưa map -> Đã map |
| `SOURCE_ACCOUNT_MOMO_USER_ID` | STRING | Mã định danh của người dùng MoMo từ tài khoản nguồn trong giao dịch. | 72559601, 30885744, 48864194 |
| `FUND_INVESTMENT_STATUS` | FLOAT | Trạng thái đầu tư quỹ trong quá trình giao dịch. | 1, 0, 2 |
| `REGISTER_INVESTMENT_TIME` | DATETIME | Thời gian đăng ký đầu tư quỹ. | 2025-02-15 17:55:17.331, 2024-12-10 09:51:43.465, 2025-05-13 13:55:53.349 |
| `fund_type_by_purpose` | STRING | Loại quỹ theo mục đích sử dụng. | [2]. Saving, [1]. Spending |
| `FUND_INVESTMENT_TYPE` | STRING | Loại đầu tư quỹ. | [1]. TTT, [2]. Non-TTT |
| `FIRST_INVESTMENT_TID_TYPE` | STRING | Loại mã giao dịch của lần đầu tư đầu tiên. | [1]. ACTION (1) đi kèm ACTION (-3) |
| `age_group` | STRING | Nhóm tuổi của người dùng tham gia. | others, [2].18-22, [3].23-27 |
| `citygroup` | STRING | Nhóm thành phố của người dùng. | UNKNOWN, Thành Phố Hồ Chí Minh, Hà Nội |
| `gender` | STRING | Giới tính của người dùng. | FEMALE, MALE |
| `avail_balance` | FLOAT | Số dư khả dụng trong tài khoản. | 1807525297643, 1680149887402, 1584838726227 |

### `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_ENDING_BALANCE_BY_FUNDID_FULL_daily`
> Bảng chứa thông tin số dư cuối kỳ của dịch vụ P2P MONEYPOOL theo từng fund_id hàng ngày, bao gồm số dư khả dụng cho các loại tiền khác nhau và trạng thái của quỹ. Mục đích của bảng này bao gồm:
- Theo dõi số dư khả dụng cho mỗi quỹ (fund_id) hàng ngày.
- Phân tích tình hình tài chính của dịch vụ P2P MONEYPOOL.
- Theo dõi trạng thái và loại hình của các quỹ.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng của dữ liệu số dư. | 2025-12-01, 2025-11-01, 2025-10-01 |
| `date` | DATE | Ngày của dữ liệu số dư. | 2026-01-04, 2026-01-03, 2026-01-02 |
| `fund_id` | STRING | Mã định danh của quỹ trong dịch vụ P2P MONEYPOOL. | mp_45528504_5bvnpotmbhqdvs5iqnz6bz, mp_5776589_2xzbs2avr0ogxb1hspqi0b, mp_30734363_6whzyko6m5xrtf4wztfqsy |
| `avail_balance_non_ttt` | FLOAT | Số dư khả dụng không bao gồm túi thần tài (TTT). | 0, 1000, 2000 |
| `avail_balance_ttt` | FLOAT | Số dư khả dụng bao gồm túi thần tài (TTT). | 0, 352, 1000 |
| `avail_balance` | FLOAT | Số dư khả dụng tổng cộng. | 0, 1000, 352 |
| `STATUS_FUND_final` | FLOAT | Trạng thái cuối cùng của quỹ. | 1, 0, 2 |
| `FUND_TYPE_include_B2W` | STRING | Loại hình của quỹ, bao gồm cả loại B2W. | , [1]. Individual, [2]. Couple |
| `avail_balance_group` | STRING | Nhóm số dư khả dụng. | [0]. 0, [0].(0;10K), [4].[100K;500K) |

### `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_EVENT_ALL_STEP_BY_TYPE`
> Bảng này chứa dữ liệu chi tiết về sự kiện của P2P Moneypool trên MoMo. Bảng cung cấp thông tin về: 
- Loại sự kiện và năm tổ chức.
- Thông tin về người dùng tham gia và loại quỹ liên quan đến B2W.
- Vai trò và loại chủ sở hữu theo tháng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `type` | STRING | Loại sự kiện của P2P Moneypool trên MoMo | [Fund Home]. H.thị home tính năng quỹ nhóm (đã có quỹ), [Fund Home]. Total User Hiển thị màn hình Home của 1 quỹ, [Fund Home]. Owner Hiển thị màn hình Home của 1 quỹ |
| `user_id` | STRING | ID người dùng tham gia sự kiện P2P Moneypool | 35908390, 17286936, 58589410 |
| `date` | DATE | Ngày diễn ra sự kiện P2P Moneypool | 2025-01-29, 2025-01-28, 2025-01-30 |
| `month` | DATE | Tháng diễn ra sự kiện P2P Moneypool | 2025-03-01, 2025-01-01, 2025-05-01 |
| `FUND_TYPE_include_B2W` | STRING | Loại quỹ liên quan tham gia sự kiện, bao gồm B2W | [2]. Couple, [1]. Individual, [3]. Family & Friends |
| `ROLE` | FLOAT | Vai trò của người dùng trong sự kiện | 1, 2, 3 |
| `OWNER_TYPE_bymonth` | STRING | Loại chủ sở hữu sự kiện tính theo tháng | [2]. Existing (Member/Owner), [1]. New User |

### `momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND`
> Bảng fact này chứa thông tin liên quan đến các Quỹ nhóm P2P MONEYPOOL, phục vụ cho việc phân tích và quản lý sự tham gia và hoạt động của người dùng trong các quỹ nhóm. 
Các thông tin có thể khai thác từ bảng này bao gồm: 
- Theo dõi thời gian và tình trạng đầu tư vào quỹ nhóm 
- Quản lý danh tính và vai trò của các thành viên 
- Phân loại và đánh giá hiệu quả của quỹ nhóm theo các tiêu chí khác nhau.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `create_month` | DATE | Tháng tạo ra quỹ | 2025-05-01, 2025-07-01, 2025-08-01 |
| `create_date` | DATE | Ngày tạo ra quỹ | 2025-05-11, 2025-05-15, 2025-05-10 |
| `create_datetime` | DATETIME | Ngày và giờ tạo ra quỹ | 2025-05-15 15:50:01.227, 2025-05-15 15:50:25.898, 2025-05-15 15:49:50.725 |
| `update_time_fund` | DATE | Thời gian cập nhật quỹ | 2025-11-23, 2025-05-20, 2025-05-15 |
| `end_date` | DATE | Ngày kết thúc quỹ | 1970-01-01, 2025-12-31, 2026-01-01 |
| `FUND_ID` | STRING | Mã định danh của quỹ | mp_93332841_25rbdf4nio6xnzdf5nctog, mp_94337171_ojp82c2c3hkymwhjovknz, mp_63770174_38vvzcx4o1evo4tucxrc82 |
| `TARGET` | FLOAT | Mục tiêu của quỹ | 0, 10000000, 5000000 |
| `USER_ID_OWNER` | STRING | ID người sở hữu quỹ | 94328737, 94195778, 94337412 |
| `USER_ID_MEMBER` | STRING | ID thành viên của quỹ | 17286936, 93676868, 58589410 |
| `ROLE` | FLOAT | Vai trò trong quỹ | 1, 2, 3 |
| `STATUS_FUND` | FLOAT | Trạng thái hoạt động của quỹ | 1, 0, 3 |
| `STATUS_MEMBER` | FLOAT | Trạng thái của thành viên trong quỹ | 1, 0, 3 |
| `NAME` | STRING | Tên quỹ | ATM99 Nạp 100k nhận 888k https://biitly.site/xMuB, 🍀 Tích lũy cho tương lai, Ae mình cứ thế thôi hẹ |
| `DESC_FUND` | STRING | Mô tả quỹ | ATM99 Nạp 100k nhận 888k https://biitly.site/xMuB, Cùng nhau tích lũy, cùng vun đắp cho tương lai., Tạo quỹ cho những khoản chi tiêu và tiết kiệm của riêng bạn. |
| `CATEGORY` | STRING | Danh mục của quỹ | other_fund, couple_fund, personal_fund |
| `INVESTMENT_STATUS` | FLOAT | Trạng thái đầu tư | 1, 0, 2 |
| `REGISTER_INVESTMENT_TIME` | DATETIME | Thời gian đăng ký đầu tư | 2025-04-17 19:44:43.177, 2025-05-20 10:19:12.309, 2024-11-09 02:26:43.171 |
| `REGISTER_INVESTMENT_DATE` | DATE | Ngày đăng ký đầu tư | 2025-07-14, 2025-07-15, 2025-07-16 |
| `FIRST_INVESTMENT_TID` | FLOAT | Mã định danh đầu tư đầu tiên | 99365766880, 87993255172, 70954856979 |
| `DEPOSIT_AIO_QR_STATUS` | FLOAT | Trạng thái nạp tiền qua QR | 1, 0 |
| `TARGET_GOAL` | STRING | Mục tiêu quỹ nhóm | saving, travel, shopping |
| `COVER` | STRING | Ảnh bìa của quỹ nhóm có chứa thông tin nhạy cảm | — |
| `IMAGES` | STRING | Hình ảnh quỹ nhóm có chứa thông tin nhạy cảm | — |
| `COVER_TYPE` | STRING | Loại ảnh bìa | [1]. Default, [2]. Changed |
| `USER_DISPLAYNAME` | STRING | Tên hiển thị của người dùng có chứa thông tin nhạy cảm | — |
| `FUND_SIZE` | INTEGER | Quy mô quỹ | 1, 2, 3 |
| `FUND_TYPE` | STRING | Loại hình quỹ | [1]. Individual, [4]. 5+ People, [2]. 2 People |
| `FUND_TYPE_detail` | STRING | Chi tiết loại hình quỹ | [1]. Individual, [6]. Group 9+, [2]. Couple |
| `FUND_TYPE_include_B2W` | STRING | Loại hình quỹ bao gồm B2W | [1]. Individual, [3]. Family & Friends, [2]. Couple |
| `STATUS_FUND_final` | FLOAT | Trạng thái cuối cùng của quỹ | 1, 0, 3 |
| `age_group` | STRING | Nhóm tuổi của người tham gia | [2].18-22, [3].23-27, [4].28-35 |
| `citygroup` | STRING | Nhóm thành phố của người tham gia | Thành Phố Hồ Chí Minh, Tỉnh khác, Hà Nội |
| `gender` | STRING | Giới tính của người tham gia | male, female, unknown |
| `ACTIVE_POOL_FUND` | STRING | Quỹ nhóm đang hoạt động | [1]. Active, [2]. Non-active |
| `USER_TYPE_bymonth` | STRING | Loại hình người dùng theo tháng | [1]. New User, [2]. Existing |
| `OWNER_AGE` | STRING | Tuổi của chủ sở hữu quỹ | [2].Owner >18, [1].Owner Under 18 |
| `ACTIVE_FUND` | STRING | Quỹ đang hoạt động | [1]. Chưa khóa - Active, [1]. Chưa khóa - Non-Active, [2]. Đã khóa - Active |
| `avail_balance` | FLOAT | Số dư khả dụng trong quỹ | 0, 1000, 2000 |
| `FLOW_TAO_QUY` | STRING | Quy trình tạo quỹ | [Fund Home]. Toast tạo quỹ thành công - Mainflow (not template), [Fund Home]. Toast tạo quỹ thành công - Template (Cá nhân), [Fund Home]. Toast tạo quỹ thành công - Template (Người yêu) |

### `project-5400504384186300846.MBI_DA.flat_quy_gift`
> Flat_quy_gift, lấy raw data từ model gift: https://atlassiantool.mservice.com.vn:9443/pages/viewpage.action?spaceKey=BS&title=G_7_8+DB+Schema#G_7_8DBSchema-ii.GIFT_INFO. Bảng này có chứa các thông tin mới: service code, tổng hợp thông tin chi tiết về các món quà, bao gồm giá trị, loại, trạng thái và mã định danh của người dùng. Các mục đích sử dụng của bảng này có thể bao gồm quản lý quà tặng, phân tích hiệu suất của chương trình quà tặng và theo dõi các giao dịch nhận quà.Flat_quy_gift, lấy raw data từ model gift: https://atlassiantool.mservice.com.vn:9443/pages/viewpage.action?spaceKey=BS&title=G_7_8+DB+Schema#G_7_8DBSchema-ii.GIFT_INFO.  
Bảng này có chứa các thông tin mới: service code,

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `gift_id` | STRING | ID của gift.Gift id | 0NC506PM6XDJ0, 0NC2MKKZAWMG0, 0NC45BT52WQ80 |
| `gift_type_id` | STRING | ID loại gift.Gift type id | qn_movie_10k_250423_giam_100pt10k_xip57, qn_15k_new_t6_250602_giam_100pt15k_cylw2, qn_10k_new_t7_250704_giam_100pt10k_58rjh |
| `amount` | FLOAT | Giá trị của gift.giá trị gift amount | 10000, 15000, 5000 |
| `status` | FLOAT | Trạng thái của gift. Status = 6 là đã redeem.Status của gift. Status = 6 là đã redeem | 5, 6, 1 |
| `agent_id` | STRING | Mã định danh của user.Mã định danh của user | 47475273, 52912959, 85255659 |
| `start_date` | DATE | Ngày bắt đầu của gift (collect).Ngày bắt đầu của gift (collect) | 2025-04-25, 2025-06-03, 2025-04-24 |
| `start_datetime` | DATETIME | Thời gian bắt đầu của gift (collect).Thời gian bắt đầu của gift (collect) | 2025-11-24 19:56:27.032, 2025-04-25 13:02:33.474, 2025-04-26 10:47:14.595 |
| `end_datetime` | DATETIME | Thời gian kết thúc của gift (collect).Thời gian kết thúc của gift (collect) | 2025-05-15 23:59:59, 2025-07-31 23:59:59, 2025-07-06 00:00:00 |
| `modify_datetime` | DATETIME | Thời gian cập nhật của gift (collect).Thời gian cập nhật của gift (collect) | 2025-05-16 21:00:00, 2025-05-16 20:00:00, 2025-08-01 20:00:00 |
| `agent` | STRING | Mã định danh của user.Mã định danh của user | kgs_sp301_20250424_0051, kgs_sp301_20250602_0041, kgs_sp301_20250704_0015 |
| `ver` | FLOAT | Phiên bản của gift. | 1, 9 |
| `created_datetime` | DATETIME | Thời gian tạo gift.Thời gian tạo gift | 2025-04-21 18:05:52, 2025-05-12 17:34:02, 2025-03-27 19:43:29 |
| `is_reward` | BOOLEAN | Có phải gift thuộc schema reward không. (true: thuộc schema reward, false: không thuộc schema reward)Có phải gift thuộc schem reward không | false, true |
| `tran_id` | FLOAT | Transaction ID của giao dịch redeem.Transaction id của giao dịch redeem | 112998699150, 112543719051, 112513082271 |
| `total_amount` | FLOAT | Tổng giá trị của gift.Tổng tiền của gift | 10000, 20000, 5000 |
| `promo_amount` | FLOAT | Tổng giá trị promotion của gift.Tổng giá trị promotion của gift | 3000, 10000, 1111 |
| `vc_amount` | FLOAT | Tổng giá trị voucher của gift.Tổng giá trị voucher của gift | 0, 10000, 5000 |
| `cb_amount` | FLOAT | Tổng giá trị cashback của gift.Tổng giá trị cashback của gift | 0, 3000, 1111 |
| `bnvc_amount` | FLOAT | Chưa rõ.Chưa rõ | 0 |
| `is_redeemed` | BOOLEAN | Gift đã được redeem chưa. (true: đã redeem, false: chưa redeem)Gift đã được redeem chưa | false, true |
| `redeem_datetime` | DATETIME | Thời gian gift được redeem.Thời gian gift được redeem | 2025-10-08 20:53:58, 2025-08-22 18:19:46, 2025-12-09 09:28:43 |
| `service_code` | STRING | Mã dịch vụ liên quan đến gift. | Unknown, u2u, cardcashout.mbbank_w2b |
| `owner_monthly_active_type` | STRING | Loại hoạt động hàng tháng của chủ sở hữu. | Unknown, [03]. Reactivation, [01]. New to service |
| `fund_type` | STRING | Loại fund của gift. | Unknown, [1]. Individual, [2]. Couple |
| `specialproject` | STRING | Dự án đặc biệt liên quan đến gift. | Unknown, P2P - EWALLET TO BANK, AIRTIME |
| `is_active_from_redeem` | BOOLEAN | Gift có hoạt động từ lúc redeem không. | false, true |
| `gift_type_name` | STRING | Tên của loại gift. | Giảm 10K Cho đơn từ 0đ, Giảm 10K  Vé Xem Phim từ 0đ, Giảm 15K khi sử dụng Quỹ Nhóm |
| `USER_ID_OWNER` | STRING | Mã định danh của chủ sở hữu user. | 32083706, 59459161, 35879376 |
| `is_active_user` | BOOLEAN | User có hoạt động không. | false, true |
| `is_active_owner` | BOOLEAN | Chủ sở hữu có hoạt động không. | false, true |

### `project-5400504384186300846.MBI_DA.fact_quy_owner_monthly`
> Bảng fact lưu trữ thông tin hành vi và đặc điểm hoạt động của chủ quỹ (owner) P2P FUND theo tháng. - Phân tích nhóm người dùng hoạt động (retention, reactivation) trong tháng đối với từng quỹ. - Đo lường hiệu quả của các chiến dịch/tactic (Organic, Paid, Noti...) đối với chủ quỹ. - Tính toán attribution rank, priority rank để phục vụ báo cáo và mô hình credit.Bảng fact lưu trữ thông tin hành vi và đặc điểm hoạt động của chủ quỹ (owner) P2P FUND theo tháng. 
- Phân tích nhóm người dùng hoạt động (retention, reactivation) trong tháng đối với từng quỹ. 
- Đo lường hiệu quả của các chiến dịch/tactic (Organic, Paid, Noti...) đối với chủ quỹ. 
- Tính toán attribution rank, priority rank để phục vụ báo cáo và mô hình credit. 
 - Logic: https://docs.google.com/spreadsheets/d/1P1-R4XZ7LSZvzonH2O2FiDE5ypwObjWUp0MlE57AWs8/edit?gid=1450600554#gid=1450600554

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng tính dữ liệu (định dạng yyyy-mm-01)Tháng tính dữ liệu (định dạng yyyy-mm-01)  **Sample value**: 2025-08-01 | 2025-12-01, 2025-09-01, 2025-11-01 |
| `owner_aid` | STRING | Mã định danh ví MoMo của chủ quỹMã định danh ví MoMo của chủ quỹ  **Sample value**: 101025737, 104163241, 104533126 | 52450319, 51461473, 81459126 |
| `monthly_active_type` | STRING | Phân loại hoạt động trong tháng của chủ quỹ: [01] New, [02] Retention, [03] Reactivation, [04] DormantPhân loại hoạt động trong tháng của chủ quỹ: [01] New, [02] Retention, [03] Reactivation, [04] Dormant  **Sample value**: [02]. Retention, [03]. Reactivation | [02]. Retention, [03]. Reactivation, [01]. New to service |
| `action_type` | STRING | Loại hành động cuối cùng của chủ quỹ trong tháng: final_action, first_action...Loại hành động cuối cùng của chủ quỹ trong tháng: final_action, first_action...  **Sample value**: final_action | final_action |
| `fund_id` | STRING | Mã quỹ nhóm P2P FUND do chủ quỹ tạo raMã quỹ nhóm P2P FUND do chủ quỹ tạo ra  **Sample value**: mp_101025737_3ox5w3bacovtvtddqt1bdj, mp_104163241_14hxodbmomp0kackhpdbxt | mp_99453831_1zexrxakn0fwrebcaw5s61, mp_68663598_4xql1ltl6nok6d2nyahpjl, mp_86757068_4n08ybfl0js8g3rchwjaq |
| `tid` | FLOAT | Mã transaction ID của hành động cuối tháng (dạng số thực)Mã transaction ID của hành động cuối tháng (dạng số thực)  **Sample value**: 95920443644.0, 95924763627.0 | 113024320203, 113316939863, 112940817248 |
| `date` | DATE | Ngày active đầu tiên trong thángNgày active đầu tiên trong tháng  **Sample value**: 2025-08-01 | 2025-12-01, 2026-01-01, 2025-10-01 |
| `datetime` | DATETIME | Thời điểm active đầu tiên trong thángThời điểm active đầu tiên trong tháng  **Sample value**: 2025-08-01 20:56:01.227, 2025-08-01 21:35:29.305 | 2025-06-05 22:26:44.136, 2025-02-07 12:49:53.072, 2025-02-02 21:06:18.715 |
| `milisecond_diff` | INTEGER | Khoảng thời gian tính bằng mili-giây (null nếu không áp dụng)Khoảng thời gian tính bằng mili-giây (null nếu không áp dụng)  **Sample value**: null | 0, 100, 103 |
| `detail_id` | STRING | Nội dung chi tiết dạng json/message (private)Nội dung chi tiết dạng json/message (private) | — |
| `tactic` | STRING | Tactic gây ảnh hưởng: Organic, Paid, Noti...Tactic gây ảnh hưởng: Organic, Paid, Noti...  **Sample value**: Organic | Organic, voucher, gamification |
| `kpi_type` | STRING | Loại KPI tương ứng với tactic: Organic, Paid, Noti...Loại KPI tương ứng với tactic: Organic, Paid, Noti...  **Sample value**: Organic | Organic, growth, engage |
| `sub_tactics` | STRING | Sub-tactic chi tiết của tactic: Organic, PaidSearch, Display...Sub-tactic chi tiết của tactic: Organic, PaidSearch, Display...  asdasdSample value**: Organic | Organic, tran_game, redeem_voucher_collect |
| `campaign_name_lv1` | STRING | Tên campaign cấp độ 1 (cấp cao nhất)Tên campaign cấp độ 1 (cấp cao nhất)  **Sample value**: Organic | Organic, , SC25 |
| `campaign_name_lv2` | STRING | Tên campaign cấp độ 2 (cấp con của lv1)Tên campaign cấp độ 2 (cấp con của lv1)  **Sample value**: Organic | Organic, , qn_w2b_251204_cbttt_100pt3k_hje7k |
| `priority_rank_lv1` | INTEGER | Thứ tự ưu tiên của tactic trong cùng campaign lv1 (0 = thấp nhất)Thứ tự ưu tiên của tactic trong cùng campaign lv1 (0 = thấp nhất)  **Sample value**: 0 | 0, 3, 2 |
| `priority_rank_lv3` | INTEGER | Thứ tự ưu tiên của tactic trong cùng campaign lv3 (0 = thấp nhất)Thứ tự ưu tiên của tactic trong cùng campaign lv3 (0 = thấp nhất)  **Sample value**: 0 | 0, 3, 2 |
| `attribution_rank` | INTEGER | Thứ hạng attribution của tactic (null nếu không áp dụng)Thứ hạng attribution của tactic (null nếu không áp dụng)  **Sample value**: null | 1 |

### `momovn-prod.MBI_DA.P2P_FUND_SURVEY_SOF`
> Bảng này chứa dữ liệu khảo sát liên quan đến dịch vụ Quỹ nhóm P2P. Bảng bao gồm thông tin về người tham gia khảo sát, thời gian bắt đầu và hoàn thành khảo sát, cùng với các câu trả lời cho từng câu hỏi trong khảo sát. Các thông tin có thể được sử dụng để phân tích sự hiểu biết và nhu cầu của người dùng về dịch vụ Quỹ nhóm, đưa ra quyết định cải thiện dịch vụ và xác định các dịch vụ phổ biến khác liên quan đến Ví Momo.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `user_id` | INTEGER | ID của người dùng tham gia khảo sát | 7265934, 45489588, 27969159 |
| `status` | STRING | Trạng thái của khảo sát, ví dụ: đã hoàn thành hoặc chưa hoàn thành | COMPLETED |
| `time_start` | TIMESTAMP | Thời gian khi người dùng bắt đầu khảo sát | 2025-12-30 11:00:50+00, 2025-12-29 19:59:19+00, 2026-01-04 11:38:23+00 |
| `time_submit` | TIMESTAMP | Thời gian khi người dùng hoàn tất và nộp khảo sát | 2025-12-31 09:48:36+00, 2026-01-03 14:40:07+00, 2025-12-30 17:15:45+00 |
| `q1_1` | STRING | Câu trả lời cho câu hỏi số 1 phần 1 của khảo sát | Có thể chuyển trực tiếp tiền từ Quỹ A sang Quỹ B, không cần rút về Ví rồi nạp lại |
| `q1_2` | STRING | Câu trả lời cho câu hỏi số 1 phần 2 của khảo sát | Dùng Quỹ để thanh toán thêm các dịch vụ bên ngoài MoMo (Vd: Grab, TikTok) |
| `q1_3` | STRING | Câu trả lời cho câu hỏi số 1 phần 3 của khảo sát | Tự động góp Quỹ định kỳ, không lo quên lịch góp |
| `q1_4` | STRING | Câu trả lời cho câu hỏi số 1 phần 4 của khảo sát | Ẩn một số Quỹ khi thanh toán để tránh tiêu nhầm (Vd: quỹ dự phòng, quỹ nhóm) |
| `q1_5` | STRING | Câu trả lời cho câu hỏi số 1 phần 5 của khảo sát | Cho phép cài đặt Quỹ ở thứ tự thanh toán số 1 để không cần chọn lại Quỹ mỗi lần thanh toán |
| `q1_7` | STRING | Câu trả lời cho câu hỏi số 1 phần 7 của khảo sát | Dùng Quỹ để thanh toán hóa đơn định kỳ (Vd: hóa đơn điện), Dùng Quỹ để thanh toán hóa đơn định kỳ (Vd: Netflix, Youtube Premium, Hóa đơn điện) |
| `q1_7_other` | STRING | Thông tin khác nếu có cho câu hỏi số 1 phần 7 của khảo sát | Ok, ok, Để chế độ uỷ quyền để cùng rút tiền không cần phê duyệt |
| `q2_grab` | STRING | Câu trả lời liên quan đến dịch vụ Grab trong khảo sát | Grab |
| `q2_shopee` | STRING | Câu trả lời liên quan đến dịch vụ Shopee trong khảo sát | Shopee |
| `q2_xanhsm` | STRING | Câu trả lời liên quan đến dịch vụ xanhsm trong khảo sát | XanhSM |
| `q2_be` | STRING | Câu trả lời liên quan đến dịch vụ Be trong khảo sát | be |
| `q2_tiktok_shop` | STRING | Câu trả lời liên quan đến TikTok Shop trong khảo sát | TikTok Shop |
| `q2_netflix` | STRING | Câu trả lời liên quan đến dịch vụ Netflix trong khảo sát | Netflix |
| `q2_app_store` | STRING | Câu trả lời liên quan đến dịch vụ App Store trong khảo sát | App Store |
| `q2_google_play` | STRING | Câu trả lời liên quan đến dịch vụ Google Play trong khảo sát | Cửa hàng Google (Google Play) |
| `q2_youtube_premium` | STRING | Câu trả lời liên quan đến YouTube Premium trong khảo sát | Youtube Premium |
| `q2_other` | STRING | Thông tin khác nếu có cho câu hỏi số 2 của khảo sát | Mua đồ, Thanh toán hoá đơn ăn uống, Lazada |
| `q3_need` | STRING | Câu trả lời về nhu cầu của người dùng trong khảo sát | ., không, Dễ sử dụng |

## Memory
*26 entries — user-trained knowledge*

1. Payment SOF tương ứng với các ACTION in (-2, -4, -5, -6) _2025-10-14_
2. MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE _P2P QUYNHOM · 2025-08-19_
3. STATUS_MEMBER mapping: 1 = '[1]. ACTIVE', 2 = '[2]. LEAVE', 3 = '[3]. INVITE TO JOIN', 4 = '[4]. REJECT INVITATION', 5 = '[5]. REQUEST TO JOIN', 6 = '[6]. REJECT REQUEST', 0 = '[0]. DEACTIVATE' _2025-10-13_
4. INVESTMENT_STATUS mapping: case when INVESTMENT_STATUS = 1 then '[1]. Quỹ Sinh Lời' else '[2]. Quỹ không sinh lời' end as INVESTMENT_STATUS _2025-10-13_
5. STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND _2025-10-13_
6. Churned User: Người dùng được coi là rời bỏ của tháng X, nếu họ không thực hiện bất kỳ giao dịch nào trong tháng X-1, nhưng đã có giao dịch nạp quỹ trong tháng X-2. _P2P QUYNHOM · 2025-07-01_
7. Khi đếm số lượng quỹ, sử dụng COUNT(DISTINCT FUND_ID) thay vì COUNT(FUND_ID) _P2P QUYNHOM · 2025-05-26_
8. User churn (P2P Moneypool): A user is considered churned in month M if they had at least one transaction in any month prior to M, but had no transactions in month M. _P2P QUYNHOM · 2025-07-01_
9. Nạp quỹ bao gồm 3 ACTION: Cash In, CashIn AIOQR (bank-ví), Cash In AIOQR (ví-ví) _P2P QUYNHOM · 2025-07-15_
10. MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE _P2P QUYNHOM · 2025-08-19_
11. ACTIVE_FUND mapping: "[1]. Chưa khóa - Active" = quỹ đang mở và có hoạt động giao dịch gần đây; "[1]. Chưa khóa - Non-Active" = quỹ đang mở nhưng không có hoạt động giao dịch gần đây. _2026-02-26_
12. STATUS_MEMBER mapping: 1 = '[1]. ACTIVE', 2 = '[2]. LEAVE', 3 = '[3]. INVITE TO JOIN', 4 = '[4]. REJECT INVITATION', 5 = '[5]. REQUEST TO JOIN', 6 = '[6]. REJECT REQUEST', 0 = '[0]. DEACTIVATE' _2025-10-13_
13. STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND _2025-10-13_
14. STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND _2025-10-13_
15. Move tiền behavior: User có nhu cầu move tiền khi có giao dịch rút tiền (ACTION_NAME = 'Withdraw') từ quỹ X về ví MoMo, và liền sau đó (gap time 1-3 ngày) có giao dịch góp tiền (ACTION_NAME = 'Cash In' với CORE_MONEY_SOURCE = 'MoMo wallet') vào quỹ B khác _2025-12-22_
16. Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-1 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X _2026-01-15_
17. Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-2 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X-1 _2026-01-15_
18. Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-1 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X _P2P QUYNHOM · 2025-07-01_
19. Khi query quỹ có tên ở dạng 'đấu trường tri thức', sử dụng điều kiện lower(FUND_NAME) LIKE '%đấu trường tri thức%' _P2P QUYNHOM · 2025-07-16_
20. MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE _P2P QUYNHOM · 2025-08-19_
21. MoMo A30: số lượng active user trên hệ thống MoMo của 30 ngày gần nhất, sử dụng bảng momovn-mimir.MIMIR.iDeA_TRANS_CORE _P2P QUYNHOM · 2025-08-19_
22. active_members_bank: thành viên góp quỹ bằng cách quét QR từ app ngân hàng, tương ứng với ACTION_NAME = 'CashIn AIOQR (bank-ví)' _2025-10-28_
23. STATUS_FUND mapping: case when STATUS_FUND = 1 then '[1]. Non-closed' else '[2]. Closed' end as STATUS_FUND _2025-10-13_
24. ACTION = -6 tương ứng với 'Withdraw as requested' _2025-10-14_
25. ROLE = 3 tương ứng với "phó quỹ" trong bảng momovn-prod.MBI_DA.HA_P2P_MONEYPOOL_FUND _2025-12-30_
26. Người dùng rời bỏ của tháng X là những người đã có giao dịch nạp quỹ trong tháng X-2 nhưng không thực hiện bất kỳ giao dịch nào trong tháng X-1 _2026-01-15_
