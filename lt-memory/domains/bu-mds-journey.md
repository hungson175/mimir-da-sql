# BU MDS: Journey

**Domain ID:** `6471b001-623f-4ce2-a6a5-5bf63b2cf928`

## Description
Thông tin về journey camp chạy, gồm CVR enter, goal, ctr noti, ctr adv
Cách tạo journey ở đây https://docs.google.com/presentation/d/17Ql0pm8iCq9zsmCTsyaMLMpms7G_fTdIsal2-VOTkVc/edit?slide=id.g2e2e0b1a5bb_0_1563#slide=id.g2e2e0b1a5bb_0_1563

## Tables

### `momovn-prod.MBI_DA.journey_track_node_agg_v2`
> Bảng này tổng hợp và theo dõi các node trong hành trình khách hàng, dựa trên các dữ liệu từ các hoạt động quảng cáo và thông báo. Mục đích của bảng này gồm có: 
- Theo dõi và phân tích hiệu suất của từng chiến dịch quảng cáo thông qua node
- Đánh giá mức độ tương tác của người dùng với các thông báo và quảng cáo
- Xác định người dùng tiềm năng đạt được goal nhờ vào các hành động được request từ hệ thống Journey.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `node_date` | DATE | Ngày node thực hiệnngày node thực hiện | 2025-12-07, 2025-11-18, 2025-11-01 |
| `campaign_id` | STRING | Mã định danh campaign namemã định danh campaign name | LI4b1JG4ayQBv8nZhXLG, SL5yGM0YkjjqlEJe877D, TXyZENDYECH3v5ghcepa |
| `campaign_name` | STRING | Tên campaign mà BU tự đặt têntên campaign mà BU tự đặt tên | 240403_JN_VTS_Clone_2TR7_A7_Segment1_Official_16, 240403_JN_VTS_Clone_2TR3_A60_Segment2_Official_16, 240403_JN_VTS_Clone_2TR9_RECREATE_Segment3_Official16 |
| `is_test` | BOOLEAN | Camp dùng để test hay chạy thực. True là test, False là không test, chạy thiệtcamp dùng để test hay chạy thực. true là test, false là không test chạy thiệt | false, true |
| `account_id` | STRING | Mã định danh BUmã định danh BU | GMC Cross-sell, null, Social Payment |
| `goal_type` | STRING | Loại goal BU tự chọn, ví dụ: CONSIDERATION_CONVERSIONloại goal BU tự chọn vd CONSIDERATION_CONVERSION | CONSIDERATION_CONVERSION, ENGAGEMENT_CROSS_SELLING, null |
| `node_id` | STRING | Mã định danh từng node chạy, là node action của noti, adv, widget, ...mã định danh từng node chạy, là node action của noti, adv, widget, .... | 53605162507, 62146981952, 62146981955 |
| `node_type` | STRING | Dạng node action, ví dụ: noti và những cái còn lạidạng node action vd noti và những cái còn lại | NOTIFICATION, CUSTOM_ACTION, THIN_BANNER |
| `action_type_lv1` | STRING | Level nhỏ hơn của node typelevel nhỏ hơn của node type | ADS_V2, null, CHAT_TEMPLATE |
| `caption` | STRING | Tên caption của notitên caption của noti | Thông báo quan trọng 🚨, Thông báo quan trọng, Kiểm tra doanh thu hôm nay |
| `body` | STRING | Nội dung của notinội dụng của noti | Bạn sẽ bị gián đoạn giao dịch thanh toán, chuyển tiền nếu chưa xác thực sinh trắc học. Bỏ qua nếu đã thực hiện!, Bạn ơi, hạn mức đến 20 triệu, thoải mái dùng trước - trả sau đang chờ bạn khám phá. Mở Ví ngay!, Theo quy định của ngân hàng nhà nước, bạn cần cung cấp CCCD để tiếp tục sử dụng tất cả tính năng của MoMo. Thêm ngay! |
| `refid` | STRING | ID tham chiếu của noti | voucher_detail, credit_paylater_new, my_vouchers |
| `image` | STRING | Đường dẫn hình ảnh của noti | https://static.momocdn.net/app/img/XSell/900x507.jpg, https://attachment.momocdn.net/common/u/ec084a014eeed7d0d9ff1df73c334ff53775b39f38c6194a891af2b2ec449e71/63f82136-23e8-4c90-9ea6-aaee90c1e68el54_dr8p.jpg, https://attachment.momocdn.net/common/u/ec084a014eeed7d0d9ff1df73c334ff53775b39f38c6194a891af2b2ec449e71/a1790a90-bc48-4232-a53b-333590bd5224xjpccrd_.jpg |
| `preview_0` | STRING | Hình ảnh xem trước đầu tiên | null, gmc_xsell_1sv_JN_banner_cornerstone, 1111_GMCxsell_1 |
| `preview_1` | STRING | Hình ảnh xem trước thứ hai | null, CAROUSEL_BANNER, DYNAMIC_WIDGET |
| `preview_2` | STRING | Hình ảnh xem trước thứ ba | null, ENGAGEMENT_CARD, 31-03-2025 15:21:44 - 30-04-2025 23:59:59 |
| `preview_3` | STRING | Hình ảnh xem trước thứ tư | null, 12 impression/user/day & 90 impression/user/all time, Mass |
| `pre_condition_inf` | STRING | Thông tin điều kiện tiên quyết của node | , _, AND_User login (case 104)_1_DAY_ACTION_FREQUENCY_OPERATOR_GREATER_THAN_OR_EQUAL_1_true_ |
| `non_organic_goal_user` | INTEGER | Số lượng user đạt goal nhờ vào Journey, là user đạt goal sau khi được Journey request actionsố lượng user đạt goal nhờ vào Journey, là user đạt goal sau khi được Journey request action | 0, 1, 2 |
| `action_request_cnt` | INTEGER | Số lượng action được request từ Journey đến các bên như noti, adv, ...số lượng action được request từ Journey đến các bên như noti, adv,.. | 1, 2, 3 |
| `noti_request_cnt` | INTEGER | Số lượng noti được request gửisố lượng noti được request gửi | 0, 1, 2 |
| `noti_sent_cnt` | INTEGER | BU không dùng cột nàyBU không dùng cột này | 0, 1, 2 |
| `noti_sent_outapp_cnt` | INTEGER | BU không dùng cột nàyBU không dùng cột này | 0, 1, 2 |
| `noti_sent_mqtt_cnt` | INTEGER | Số lượng noti được sent qua MQTTsố lượng noti được sent mqtt | 0, 1, 2 |
| `noti_delivery_outapp_cnt` | INTEGER | Số lần noti được gửi outappsố lần noti được gửi outapp | 0, 1, 2 |
| `noti_impression_inapp_cnt` | INTEGER | Số lần noti được impression trong ứng dụngsố lần noti được impression inapp | 1, 0, 2 |
| `noti_click_read_inapp_cnt` | INTEGER | Số lần noti được click trong ứng dụngsố lần noti được click inapp | 0, 1, 2 |
| `noti_click_read_outapp_cnt` | INTEGER | Số lần noti được click ngoài ứng dụngsố lần noti được click outapp | 0, 1, 2 |
| `noti_click_read_cnt` | INTEGER | Số lần noti được clicksố lần noti được click | 0, 1, 2 |
| `ad_impresion_cnt` | INTEGER | Số lần quảng cáo được hiển thịsố lần adv impress | 1, 2, 3 |
| `ad_click_cnt` | INTEGER | Số lần quảng cáo được clicksố lần adv được click | 0, 1, 2 |
| `Click` | INTEGER | Tổng số lần click từ notification và advertisingtổng click từ notification và advertising | 0, 1, 2 |
| `Traffic` | INTEGER | Tổng số lượng noti gửi outapp + số lần impression inapp của noti và quảng cáotổng số lượng noti gửi outapp + số lần impression inapp của noti và adv | 0, 1, 2 |
| `goal_classification` | STRING | Phân loại mục tiêu gồm 3 loại: trans, non trans, mix3 loại gồm trans, non trans, mix | trans, non_trans, unknown |

### `momovn-prod.MBI_DA.journey_track_camp_agg_v2`
> Bảng này là một bảng dữ liệu về chiến dịch tiếp thị được tạo ra để theo dõi và phân tích hiệu suất của các chiến dịch marketing trên MoMo. Bảng này chứa thông tin chi tiết về các chiến dịch như ngày bắt đầu và kết thúc, loại phân đoạn, số lượng người dùng tham gia và đạt được mục tiêu. 
Thông tin có thể được lấy từ bảng này bao gồm: 
- Thông tin chi tiết về ngày bắt đầu và kết thúc của các chiến dịch 
- Phân loại và phân tích hiệu suất các mục tiêu của chiến dịch 
- Thống kê và theo dõi số lượng người dùng tham gia và thực hiện các hành động trong chiến dịch

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `node_date` | DATE | Ngày của node chạyngày của node chạy | 2026-01-19, 2025-11-24, 2025-11-17 |
| `campaign_id` | STRING | ID định danh campaign nameid định dạnh campaign name | MiYA6V9dEvUUoU0Q1nSI, 8u8HGfFua0N1DoyFkDbS, Y8djwAwQcYIhWJHQWbJY |
| `campaign_name` | STRING | Tên campaign mà BU tự đặt têntên campaign name mà BU tự đặt tên | 240912_GSM_DEFAULT_1543, 241220_NEWTON_RETARGET_PAYMENT_CLICK_TIEP_TUC_CART_1372, 250516_REWARDS_USER_JOURNEY_2632 |
| `description` | STRING | Mô tả chiến dịch | , https://www.figma.com/board/X18PFAb5UVtwPml5x3ecSs/Cross-sell-Journey?node-id=0-1&p=f&t=FBP6GudI4cH7lUR9-0, https://www.figma.com/board/6dtxM4hahBnJAVfdN3d1HY/Student-Pass_Journey?node-id=0-1&p=f&t=CznCBczu6G6tf8lc-0 |
| `created_by` | STRING | Người tạo campaignngười tạo campaign | — |
| `camp_startdate` | DATE | Ngày campaign được BU chọn bắt đầu chạyngày campaign được BU chọn bắt đầu chạy | 2025-09-23, 2025-09-01, 2025-08-01 |
| `camp_enddate` | DATE | Ngày campaign được BU chọn dừng chạyngày campaign được BU chọn dừng chạy | 2025-12-31, 2025-09-30, 2026-12-31 |
| `segment_type` | STRING | Loại phân đoạn của chiến dịch | NOW, EVERY_DAY, EVERY_WEEK |
| `is_test` | BOOLEAN | Là campaign chạy test hay không? true: là test, false: là thậtlà campaign chạy test hay không? true là test, false là thật | false, true |
| `account_id` | STRING | Mã định danh từng BUmã định danh từng BU | Social Payment, GMC Cross-sell, FS - CreditTech |
| `goal_type` | STRING | Mục đích từng loại goal BU tự config trong journey, ví dụ: CONSIDERATION_CONVERSIONmục đích từng loại goal BU tự config trong journey vd CONSIDERATION_CONVERSION | CONSIDERATION_CONVERSION, ENGAGEMENT_CROSS_SELLING, null |
| `link_flow` | STRING | Luồng liên kết trong chiến dịch | https://www.figma.com/file/ElDRnRVxai0Z2kMsrXsGbt/Journey, https://docs.google.com/spreadsheets/d/187ZcSxxRPAPliFo1D4Pgzbl0JA2CS, https://docs.google.com/spreadsheets/d/1O9icKr3A8rLPeVr6FULwYPnDg0TytQvsLK6P0YVdpHY/edit |
| `target_cvr` | STRING | Tỷ lệ chuyển đổi mục tiêu của chiến dịch | null |
| `baseline_cvr` | STRING | Tỷ lệ chuyển đổi cơ bản của chiến dịch | null |
| `goal_desc` | STRING | Mô tả mục tiêu của chiến dịch | null, AND_OR_[BP] User click CTA Follow ở màn hình page detail_final_[BP] User click CTA Follow ở popup, _ |
| `time_enter_user` | INTEGER | Thời gian người dùng tham gia | 0, 1, 2 |
| `enter_user_by_camp` | INTEGER | Unique user enter theo từng camp journeyunique user enter theo từng camp journey | 1, 2, 7290516 |
| `enter_user_by_datecamp` | INTEGER | Số lần user tham gia journeysố lần user enter journey | 1, 2, 3 |
| `goal_user` | INTEGER | Số lượng user đạt goal gồm nhờ vào Journey, và không nhờ vào journey.số lượng user đạt goal gồm nhờ vào Journey, và không nhờ vào journey. | 0, 1, 2 |
| `non_organic_goal_user` | INTEGER | Số lượng user đạt goal nhờ vào Journey, là goal sau khi được request gửi 1 actionsố lượng user đạt goal nhờ vào Journey, là goal sau khi được request gửi 1 action | 0, 1, 2 |
| `exit_user` | INTEGER | Lần user out khỏi journeylần user out khỏi journey | 0, 1, 8 |
| `goal_classification` | STRING | Phân loại goal gồm trans, nontrans, mix (là trans hoặc non trans)phân loại goal gồm trans, nontrans, mix (là trans or non trans) | non_trans, trans, unknown |
