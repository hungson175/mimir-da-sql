# Domain: BU FS: Túi Thần Tài

## Identity
- **Domain ID:** `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11`
- **Description:** Trả lời cho toàn bộ câu hỏi về Business metric của Túi Thần Tài và Traffic vào TTT và Túi+ kèm Entry Point và Thao tác Event tracking tại miniapp 
- **Tables:** 2
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.BU_FI.fact_ttt_event_tracking
> <p><strong>TABLE_NAME</strong>: fact_ttt_event_tracking<br><strong>BUSINESS_PURPOSE</strong>: &gt;<br>Bảng ghi nhận thông tin thao tác của người dùng vào Miniapp Túi Thần Tài (TTT) (service_name = 'investment_goldenpocket') trên ứng dụng MoMo. <br>Mỗi dòng tương ứng với một event thể hiện hành động ...

| Column | Description | Examples |
|--------|-------------|----------|
| grass_date | <p>Ngày có truy cập (traffic) của user vào Miniapp Túi Thần Tài hoặc Túi+, format dưới dạng YYYY-MM-DD</p><ul class="om-list-disc"><li class="om-leadi... | — |
| grass_datetime | <p>Ngày giờ cụ thể có truy cập (traffic) của user vào Miniapp Túi Thần Tài hoặc Túi+, format dưới dạng YYYY-MM-DD HH:MM:SS</p><ul class="om-list-disc"... | — |
| user_id | <p>Mã định danh người dùng MoMo có truy cập Miniapp TTT</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul cla... | — |
| device_os | <p>Hệ điều hành mà thiết bị di động (điện thoại) của user sử dụng</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Ví dụ</strong>:... | — |
| app_version | <p>Mã version của ứng dụng MoMo (Momo app version) </p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Tags</strong>: App Key</p></l... | — |
| trail_id | <p>Mã định danh 1 hành động của user khi truy cập miniapp TTT </p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note:</strong></p>... | — |
| event_name | <p>Tên định danh 1 hành động của user khi truy cập một miniapp hoặc app_id bất kì.</p><ul class="om-list-disc"><li class="om-leading-normal"><p><stron... | — |
| screen_name |  | — |
| component_name |  | — |
| block_name |  | — |
| tab_name |  | — |
| icon_name |  | — |
| button_name |  | — |
| field_name |  | — |
| schema_version |  | — |
| key | <p>Tên định danh 1 parameter (params/param) thông tin chi tiết hơn của mỗi event</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>... | — |
| value | <p>Value của param ở mỗi event hành động</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-dis... | — |
| grass_month | <p>Tháng tương ứng của truy cập, dùng để phân tích theo tháng, luôn trả về ngày đầu tiên mỗi tháng và được format dưới dạng YYYY-MM-DD</p><ul class="o... | — |
| mfu_type | <p>Monthly Funded User (MFU) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trong Túi Thần Tài và nhận lãi ngày mỗi tháng</p><... | — |
| mfu100k_type | <p>Monthly Funded User 100k (MFU100k) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trung bình tháng tối thiểu 100k VND hoặc ... | — |
| plus_type |  | — |
| plus_segment |  | — |
| plus_segment_engage_type |  | — |
| mau_type |  | — |
| mau_sof_type |  | — |
| int_group |  | — |
| bal_group |  | — |
| avg_bal_group |  | — |
| region |  | — |
| gender |  | — |
| age_group |  | — |

### momovn-prod.BU_FI.mart_ttt_daily_user_record
> <p><strong>TABLE_NAME</strong>: mart_ttt_daily_record - Bảng Mart <br><strong>PARTITION and CLUSTER</strong>: Partition by GRASS_DATE, cluster by USER_ID, MAU_TYPE, MFU_TYPE, PLUS_TYPE<br><strong>BUSINESS_PURPOSE</strong>: &gt;<br>Bảng ghi lại trạng thái hoạt động, hành vi tài chính và các chỉ số li...

| Column | Description | Examples |
|--------|-------------|----------|
| GRASS_DATE | Ngày ghi nhận dữ liệu người dùng TTT, format dưới dạng YYYY-MM-DD - **Note**: Data từ bảng sẽ có range lưu record trong 2 năm, nhưng cần giới hạn tố đ... | — |
| USER_ID | Mã định danh người dùng TTT  - **Note**:     - COUNT(DISTINCT user_id) để để đếm số unique user TTT theo các segment và record được lưu trữ - **Tags**... | — |
| MAU_TYPE | Monthly Active User (MAU) Type phân loại user theo mức độ engage của họ trong việc có thực hiện ít nhất 1 lần tạo ra biến động cho số dư Túi Thần Tài ... | — |
| MAU_SOF_TYPE | Monthly Active User Source Of Fund (MAU SOF) Type phân loại user theo mức độ engage của họ trong việc có thực hiện ít nhất 1 lần tạo ra biến động cho ... | — |
| MFU_TYPE | Monthly Funded User (MFU) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trong Túi Thần Tài và nhận lãi ngày mỗi tháng - **Not... | — |
| INT_GROUP | Phân loại user theo theo tổng mức tiền lãi (interest) nhận được trong vòng 30 ngày vừa qua, tính tới ngày Grass Date đang xét - **Note**:     - Mức Lã... | — |
| BAL_GROUP | <p>Phân loại user theo số dư TTT hiện tại cho tới cuối ngày Grass date đang xét.</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>... | — |
| CASHIN_TRANS | Số lượng giao dịch (trans) cashin thuần (nạp tiền thuần từ nguồn tiền Ví MoMo vào TTT)  - **Tags**: MAU Metric | — |
| CASHIN_P2P_TRANS | Số lượng giao dịch (trans) cashin nhờ P2P transfer (nạp tiền vào TTT nhờ nguồn tiền được bạn bè chuyển vào ví MoMo và sau đó là tự động nạp thăng vào ... | — |
| CASHIN_VA_TRANS | Số  lượng giao dịch (trans) nạp tiền vào TTT theo luồng Tài khoản ngân hàng ảo (Virtual Account - VA) , đây là nguồn tiền mà user sẽ chủ động mở app n... | — |
| CASHIN_AI_TRANS | Số lượng giao dịch (trans) cashin nhờ tính năng nạp tự động (Auto Invest). User có thể bật tính năng này và định kì theo tùy chọn sở thích của họ, MoM... | — |
| CASHIN_STOCK_TRANS | Số giao dịch(Trans) mà user cashin vào TTT nhờ việc bán cổ phiếu ở miniapp CVS của MoMo. Sau khi bán cổ phiếu, tiền sẽ tự động được nạp vào ngăn ví Mo... | — |
| CASHIN_PAYOUT_TRANS | Số lượng giao dịch (trans) cashin vào TTT bằng payout(giao dịch nhận tiền vào TTT đặc biệt của user là đối tác của app MoMo (partner , merchant)).  Gi... | — |
| CASHOUT_TRANS | Số lượng giao dịch (trans) rút tiền từ TTT về ngăn ví MoMo (rút tiền thuần - cashout thuần)  - **Tags**: MAU Metric | — |
| CASHOUT_NAPAS_TRANS | Số giao dịch (Trans) mà user rút tiền TTT (cashout) bằng phương thức nhận chuyển khoản trực tiếp qua số tài khoản ngân hàng cá nhân. Với phương thức r... | — |
| CASHOUT_STOCK_TRANS | Số giao dịch (Trans) mà user rút tiền TTT (cashout) và mua cổ phiếu ở miniapp CVS của MoMo. Sau khi mua cổ phiếu, tiền sẽ tự động được nạp vào ngăn ví... | — |
| CASHOUT_PAYMENT_TRANS | Số giao dịch (Trans) mà user rút tiền TTT (cashout) để thanh toán dịch vụ ở MoMo **Tags**: MAU SOF Metric **Note**: nếu user sở hữu túi+ và thanh toán... | — |
| CASHOUT_P2P_TRANS | Số lượng giao dịch (trans) rút tiền từ TTT (cashout) và chuyển cho user momo khác với tính năng: - Chuyển tiền qua Ngân hàng (**ví dụ:** từ TTT của us... | — |
| CASHIN_GMV | <p>Số tiền (GMV - Amount) mà user nạp vào TTT trực tiếp từ ngăn ví MoMo (gọi là Cashin Thuần)</p><p><strong>Tag</strong>: MAU Metric</p> | — |
| CASHIN_P2P_GMV | Số tiền (GMV - Amout) cashin nhờ P2P transfer (nạp tiền vào TTT nhờ nguồn tiền được bạn bè chuyển vào ví MoMo và sau đó là tự động nạp thăng vào TTT -... | — |
| CASHIN_VA_GMV | Số tiền (GMV - Amount) user nạp vào TTT theo luồng Tài khoản ngân hàng ảo (Virtual Account - VA) , đây là nguồn tiền mà user sẽ chủ động mở app ngần h... | — |
| CASHIN_AI_GMV | Số tiền (GMV - AMOUNT) mà user cashin vào TTT nhờ tính năng nạp tự động (Auto Invest). User có thể bật tính năng này và định kì theo tùy chọn sở thích... | — |
| CASHIN_STOCK_GMV | Số tiền (GMV - AMOUNT) mà user cashin vào TTT nhờ việc bán cổ phiếu ở miniapp CVS của MoMo. Sau khi bán cổ phiếu, tiền sẽ tự động được nạp vào ngăn ví... | — |
| CASHIN_PAYOUT_GMV | Số tiền (GMV - Amount) cashin vào TTT bằng payout(giao dịch nhận tiền vào TTT đặc biệt của user là đối tác của app MoMo (partner , merchant)).  Giao d... | — |
| CASHOUT_GMV | Số tiền (GMV - Amount) mà User thực hiện với giao dịch rút tiền từ TTT và chuyển trực tiếp về ngăn ví MoMo của họ (Cashout Thuần) **TAG**: MAU Metric | — |
| CASHOUT_NAPAS_GMV | Số tiền (Amount - GMV) mà user rút tiền TTT (cashout) bằng phương thức nhận chuyển khoản trực tiếp qua số tài khoản ngân hàng cá nhân. Với phương thức... | — |
| CASHOUT_STOCK_GMV | Số tiền (GMV - Amount) mà user rút ra từ TTT (cashout) và mua cổ phiếu ở miniapp CVS của MoMo. Sau khi mua cổ phiếu, tiền sẽ tự động được nạp vào ngăn... | — |
| CASHOUT_PAYMENT_GMV | Số tiền (GMV - AMOUNT) mà user rút tiền TTT (cashout) để thanh toán dịch vụ ở MoMo **Tags**: MAU SOF Metric **Note**: nếu user sở hữu túi+ và thanh to... | — |
| CASHOUT_P2P_GMV | Số tiền (Amount - GMV) mà user rút tiền từ TTT (cashout) và chuyển cho user momo khác với tính năng  - Chuyển tiền qua Ngân hàng (**ví dụ:** từ TTT củ... | — |
| INTEREST | Số tiền (GMV - Amount) lãi mà user nhận được . Đơn vị: VND  **Tags**: MFU Metric | — |
| BALANCE | <p>Snapshot Số dư TTT vào cuối ngày (Grass_date) đang đo, hay còn gọi là asset under management (AUM) của một hoặc một nhóm người dùng. Đơn vị: VND</p... | — |
| INTEREST_BASE_AMOUNT | Số dư TTT vào cuối ngày (Grass_date) đang đo và hợp lệ để được nhận lãi của ngày hôm đó. Đơn vị: VND  **Note**: Số dư này có thể thấp hơn số dư từ cột... | — |
| AVG_BALANCE | <p>Số dư trung bình TTT của user mỗi ngày trong 30 ngày vừa qua (tính trung bình last 30 day tới ngày GRASS_DATE đang xét), không phải là trung bình t... | — |
| DCI_BALANCE | Số dư ngăn ví chứa tiền lãi của TTT tại ngày đang xét (Grass_date) , cột này sẽ chỉ có giá trị với GRASS_DATE < 2025-04-01 vì từ tháng 4 2025, TTT đã ... | — |
| CONVERT_INTEREST_TRANS | Số giao dịch (trans) user thực hiện nhờ bấm nút "Nhận Lãi" (claim interest) **NOTE**: cột này sẽ chỉ có giá trị với GRASS_DATE < 2025-04-01 vì từ thán... | — |
| CONVERT_INTEREST_GMV | Số tiền (gmv - amount) user nhận nhờ thực hiện bấm nút "Nhận Lãi" (claim interest) **NOTE**: cột này sẽ chỉ có giá trị với GRASS_DATE < 2025-04-01 vì ... | — |
| CASHIN_MP_GMV | Số tiền (gmv - amount) user nạp vào tài khoản Quỹ nhóm (Money Pool - MP) của họ và có kích hoạt sinh lời nhận lãi ngày của TTT. Khi kích hoạt tiền sẽ ... | — |
| CASHIN_MP_ACTIVE_GMV | Số tiền (gmv - amount) user nạp lần đầu tiên vào tài khoản Quỹ nhóm (Money Pool - MP) của họ khi mới kích hoạt sinh lời nhận lãi ngày của TTT. Khi kíc... | — |
| CASHOUT_PAYMENT_MP_GMV | Số tiền (Amount -GMV) user rút ra khỏi Quỹ nhóm (Money Pool - MP) của họ và dùng nó thực hiện thanh toán dịch vụ trên MoMo. Khi thực hiện dùng nguồn t... | — |
| CASHIN_MP_TRANS | Số giao dịch (Trans) user nạp vào tài khoản Quỹ nhóm (Money Pool - MP) của họ và có kích hoạt sinh lời nhận lãi ngày của TTT. Khi kích hoạt tiền sẽ tự... | — |
| CASHIN_MP_ACTIVE_TRANS | Số giao dịch (Trans) user nạp lần đầu tiên vào tài khoản Quỹ nhóm (Money Pool - MP) của họ khi mới kích hoạt sinh lời nhận lãi ngày của TTT. Khi kích ... | — |
| CASHOUT_PAYMENT_MP_TRANS | Số giao dịch (Trans) user rút ra khỏi Quỹ nhóm (Money Pool - MP) của họ và dùng nó thực hiện thanh toán dịch vụ trên MoMo. Khi thực hiện dùng nguồn ti... | — |
| CASHOUT_MP_GMV | Số tiền  (Amount - GMV) user rút ra khỏi Quỹ nhóm (Money Pool - MP) về ví MoMo cá nhân của họ  **Tag**: MAU Metric **Note**: Dù quỹ nhóm có id khác vớ... | — |
| CASHOUT_MP_TRANS | Số giao dịch (Trans) user rút ra khỏi Quỹ nhóm (Money Pool - MP) về ví MoMo cá nhân của họ  **Tag**: MAU Metric **Note**: Dù quỹ nhóm có id khác với U... | — |
| AVG_BAL_GROUP | <p>Phân loại user theo số dư trung bình TTT trong vòng 30 ngày qua , xét từ ngày Grass_date đang xét, và đây không phải phân loại số dư trung bình thá... | — |
| PLUS_TYPE | Plus Type phân loại user theo mức độ engage của họ trong việc sở hữu đặc quyền Túi + hàng tháng - **Note**:      - Túi+ là một version nâng cấp của TT... | — |
| PLUS_SEGMENT | <p>Plus Segment phân loại user theo cách mà họ thỏa điều kiện để sở hữu Túi+ hàng tháng</p><ul class="om-list-disc"><li class="om-leading-normal"><p><... | — |
| IS_MP | Phân loại tài khoản là quỹ nhóm hay cá nhân, dùng để đánh giá impact của sản phẩm quỹ nhóm lên TTT  **Default Value**: Mặc định luôn filter is_mp = 'I... | — |
| MFU100K_TYPE | Monthly Funded User  100k (MFU100k) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trung bình tháng tối thiểu 100k VND hoặc có... | — |
| TOTAL_CASHBACK_GMV | Tổng số tiền (GMV - Amount) mà user sở hữu túi+ được hoàn tiền nhờ thực hiện thanh toán dịch vụ (cashout_pay_gmv) với nguồn tiền TTT (Đơn vị: VND) **N... | — |
| TOTAL_CASHBACK_TRANS | Tổng số giao dịch (Trans) mà user sở hữu túi+ được hoàn tiền nhờ thực hiện thanh toán dịch vụ (cashout_pay_gmv) với nguồn tiền TTT  **Note**: kết hợp ... | — |
| IS_STOCKBACK | Gắn tag phân loại liệu user có túi + và nhận cổ phiếu quà tặng(Stockback) từ miniapp (sản phẩm) Chứng Khoán CVS. Mỗi tháng user sở hữu Túi+ sẽ có thể ... | — |
| IS_WHEEL | Gắn tag phân loại liệu user có túi + và chơi quay thưởng nhận quà Vòng Quay May Mắn/ Vòng Quay Thần tài / Wheel 88. User có sở hữu túi+ sẽ được tặng t... | — |
| IS_TKOL8M | Gắn tag phân loại liệu user có túi + và có gửi tiết kiệm ở miniapp (sản phẩm) Tiết kiệm Online (TKOL) kì hạn 8 tháng (8M) với mức lãi ưu đãi. User có ... | — |
| IS_CASHBACK | Gắn tag phân loại liệu user có túi + và thanh toán dùng nguồn tiền TTT (trans_type = momocashout_pay) để được quyền lợi (benefit) hoàn tiền 0.1% (cash... | — |
| IS_CASHOUT_NAPAS | Gắn tag phân loại liệu user có túi + và có thực hiện giao dịch rút tiền từ TTT về tài khoản ngân hàng cá nhân qua Số tài khoản với phương thức Napas m... | — |
| REGION | Vùng địa lý của người dùng, ánh xạ theo tỉnh/thành phố. - **Sample value**:     - Hà Nội, Hồ Chí Minh (tách riêng)     - Vùng trung du và miền núi phí... | — |
| GENDER | Giới tính của người dùng lấy từ bảng demographic chuẩn nội bộ. - **Sample value**: male, female, unknown - **Tags**: Demographic | — |
| AGE_GROUP | Nhóm tuổi của người dùng được tính từ năm sinh so với năm hiện tại trong trong Grass Month. - **Sample value**:     - 1. Age Below 22     - 2. Age 23–... | — |

## Domain Knowledge (from Mimir)

- Khi xử lý dữ liệu Túi Thần Tài, không cần điều kiện IS_MP = 'Individual' cho cột MFU_TYPE
- PLUS_TYPE không được bao gồm ('0.Churn', 'None') trong điều kiện WHERE
- AUM của Túi Thần Tài bao gồm cả tài khoản cá nhân và tài khoản quỹ nhóm
- Khi xử lý tổng mức GMV rút tiền, sử dụng công thức SUM(coalesce(cashout_napas_gmv,0) + coalesce(cashout_payment_gmv,0) + coalesce(cashout_gmv,0) + coalesce(cashout_stock_gmv,0))
- Không có dữ liệu để phân loại ngày user có sở hữu Túi+
- Khi xử lý dữ liệu với option_value, không nên sử dụng điều kiện IS NULL
- Khi tính tổng số lượng người dùng rút tiền, chỉ tính những người dùng có GMV rút tiền lớn hơn 0
- Khi xử lý GRASS_MONTH, sử dụng DATE_TRUNC(GRASS_DATE, MONTH) thay vì GRASS_MONTH
- Tổng tiền lãi (Interest) không cần điều kiện IS_MP = 'Individual'
- Người dùng là Túi+ tháng 7 nhưng không là Túi+ tháng 8: 165,056,722,906 VND nạp VA trong tháng 8. Người dùng là Túi+ tháng 8 nhưng không là Túi+ tháng 9: 72,367,111,233 VND nạp VA trong tháng 9.
- Khi tính số lượng user MAU SOF Túi Thần Tài, cần sử dụng AVG(balance) > 100000 và SUM(CASHOUT_P2P_TRANS) = 0 thay vì AVG_BAL_GROUP và CASHOUT_P2P_TRANS = 0
- Traffic màn hình home tháng 6 bao gồm cả user chưa đăng ký Túi Thần Tài
- Khi xử lý dữ liệu Túi+ cho tháng 10, sử dụng GRASS_DATE từ '2025-10-01' đến '2025-10-05'
- Khi xử lý vấn đề liên quan tới USER_ID, dùng REGEXP_EXTRACT(USER_ID, r'\d+') cho cột USER_ID

## Suggested Probe Questions

- Status: **Not yet probed**
