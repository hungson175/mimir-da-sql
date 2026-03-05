# BU MDS: Donation

**Domain ID:** `dd5f63eb-9981-4d0b-ba85-bd73ce80f52f`

## Description
Donation là nền tảng gây quỹ từ thiện tích hợp trong ví điện tử. Người dùng có thể quyên góp tiền hoặc heo vàng cho các dự án xã hội (trẻ em, người già, giáo dục, y tế, v.v) thông qua nhiều hình thức như chuyển tiền trực tiếp, quyên góp bằng item heo đất nhận được khi chơi game, quét mã QR, hoặc mua hàng gây quỹ.

## Tables

### `project-5400504384186300846.MBI_DA.DONATION_ENGAGEMEN_OVERLAP_MOMO_A90_MEU`
> Bảng này dùng để phân tích sự giao thoa giữa người dùng hoạt động hàng tháng (MEU) trong bối cảnh quyên góp và người dùng hoạt động trong 90 ngày qua (A90) trên nền tảng MoMo. 
Thông qua bảng này, có thể lấy được thông tin về: 
- Số lượng người dùng được ghi nhận trong tháng cho cả MEU trong bối cảnh quyên góp và A90 trên nền tảng MoMo. 
- Số lượng người dùng chỉ có mặt trong nhóm MEU quyên góp nhưng không thuộc nhóm A90. 
- Số lượng người dùng chỉ thuộc nhóm A90 mà không có tương tác với nhóm MEU quyên góp.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng báo cáo (YYYY-MM-DD), đại diện cho ngày chụp nhanh của phân tích giao thoa.The reporting month (YYYY-MM-DD), representing the snapshot date of the overlap analysis. | — |
| `total_meu` | INTEGER | Tổng số người dùng hoạt động hàng tháng (MEU) trong bối cảnh quyên góp cho tháng nhất định.Total Monthly Engaged Users (MEU) within the Donation context for the given month. | 402597 |
| `total_a90` | INTEGER | Tổng số người dùng hoạt động trong 90 ngày qua (A90) trên nền tảng MoMo.Total Active Users in the last 90 days (A90) across the MoMo platform. | 12424284 |
| `overlap_meu_a90` | INTEGER | Số lượng người dùng duy nhất có mặt trong cả nhóm quyên góp MEU và nhóm A90 nền tảng.The count of unique users who are present in both the Donation MEU and the platform A90 groups. | — |
| `only_meu` | INTEGER | Người dùng chỉ có mặt trong nhóm quyên góp MEU nhưng không thuộc nhóm A90 nền tảng (Tổng MEU - Giao thoa).Users who are in the Donation MEU group but are NOT part of the platform A90 (Total MEU - Overlap). | — |
| `only_a90` | INTEGER | Người dùng chỉ thuộc nhóm A90 nền tảng nhưng không có tương tác với nhóm quyên góp MEU (Tổng A90 - Giao thoa).Users who are in the platform A90 group but have NOT engaged with Donation MEU (Total A90 - Overlap). | — |
| `pct_meu_in_a90` | FLOAT | Phần trăm người dùng quyên góp MEU cũng thuộc nhóm A90 (Giao thoa / Tổng MEU).The percentage of Donation MEU users who are also part of the A90 base (Overlap / Total MEU). | — |

### `project-5400504384186300846.MBI_DA.DONATION_TRANSACTION_AGG`
> Bảng tổng hợp giao dịch từ thiện, cung cấp thông tin chi tiết về các hành động của người dùng liên quan đến các hoạt động từ thiện trong MoMo. Các thông tin có thể lấy từ bảng này:
- Ngày, tháng của giao dịch để phân tích xu hướng đóng góp
- Loại đóng góp và hành động của người dùng liên quan đến đóng góp
- Tổng số tiền đã đóng góp và tổng số giao dịch của người dùng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date_` | DATE | Ngày cụ thể của giao dịch từ thiện (YYYY-MM-DD).The specific transaction date (YYYY-MM-DD). | 2025-05-23, 2025-05-20, 2025-06-13 |
| `month` | DATE | Tháng báo cáo (YYYY-MM-01) được dùng để phân tích nhóm khách hàng và độ giữ chân.The reporting month (YYYY-MM-01) for cohort and retention analysis. | 2024-12-01, 2025-06-01, 2024-09-01 |
| `user_id` | STRING | Định danh duy nhất của người đóng góp.Unique identifier of the donor. | 40417928, 46892922, 64473741 |
| `creditor` | STRING | Mã đối tượng hoặc chiến dịch nhận đóng góp.The recipient or campaign ID receiving the donation. | dbp_vietqrp2p_052025, dbp_vietqr_122024, dbp_vietqr_final |
| `donate_type` | STRING | Danh mục đóng góp, ví dụ: donate_heo_vang.Category of the donation (e.g., donate_heo_vang). | donate_heo_vang, donate_money |
| `game_id` | STRING | Mã định danh của trò chơi hoặc tính năng kích hoạt đóng góp.Identifier of the game/feature that triggered the donation. | dbp_vietqrp2p_052025, dbp_vietqr_122024, dbp_vietqr_final |
| `action` | STRING | Hành động chính của người dùng được ghi nhận.Primary user action captured. | donate_heo_vang, donate_by_purchase, donate_money_trai_tim |
| `action_2` | STRING | Phân loại thứ cấp hoặc chi tiết hơn về hành động của người dùng.Secondary or more granular classification of the user action. | donate_heo_vang, donate_by_purchase, donate_cash |
| `total_amount` | FLOAT | Tổng giá trị đóng góp (tiền hoặc điểm).Total volume of the donation (Currency or Points). | 10, 20, 9 |
| `total_trans` | INTEGER | Số lượng giao dịch cho kết hợp người dùng/ngày/hành động cụ thể.The count of transactions for this specific user/date/action combination. | 1, 2, 3 |
| `last_month_donate` | DATE | Tháng của đóng góp trước đây của người dùng để kiểm tra tính liên tục.The month value of the user's previous donation to check for continuity. | 2025-05-01, 2024-09-01, 2024-12-01 |
| `mon_retain_segment` | STRING | Phân loại người dùng dựa trên hành vi tháng qua tháng (ví dụ: 'Ligh', 'New', 'Medium', 'Heavy').User classification based on month-over-month behavior (e.g., 'Ligh', 'New', 'Medium', 'Heavy'). | Retain, New, Redonated_3_mon |
| `num_date_donate_by_action` | INTEGER | Số lượng ngày mà người dùng đã đóng góp dựa trên hành động. | 1, 2, 3 |
| `num_date_donate_by_action_2` | INTEGER | Số lượng ngày mà người dùng đã đóng góp dựa trên hành động phân loại thứ cấp. | 1, 2, 3 |
| `num_date_donate` | INTEGER | Tổng số ngày riêng biệt mà người dùng đã đóng góp trong tháng.Cumulative count of distinct days the user has donated within the month. | 1, 2, 31 |
| `lag_date_in_month` | DATE | Số ngày kể từ lần đóng góp trước của người dùng trong cùng tháng.The number of days since the user's previous donation within the same month. | 2025-06-05, 2025-06-06, 2025-05-20 |
| `lag_date_in_month_by_action_2` | DATE | Số ngày kể từ lần đóng góp trước của người dùng dựa trên phân loại hành động thứ cấp trong cùng tháng. | 2025-06-06, 2025-06-05, 2025-05-20 |
| `first_donate_in_month` | INTEGER | Cờ nhị phân (1/0) cho biết đây có phải là lần đóng góp đầu tiên của người dùng trong tháng dương lịch.Binary flag (1/0) indicating if this is the user's first donation of the calendar month. | 0, 1 |
| `first_donate_in_month_by_action_2` | INTEGER | Cờ nhị phân chỉ định đây là lần đóng góp đầu tiên của người dùng theo hành động phân loại thứ cấp trong tháng. | 0, 1 |
| `all_action_in_month` | STRING | Một chuỗi hoặc danh sách tất cả các hành động được thực hiện bởi người dùng trong tháng để phân tích đường dẫn.A concatenated string or list of all actions performed by the user during the month for path analysis. | donate_by_purchase, donate_by_purchase,donate_by_purchase, donate_by_purchase,donate_by_purchase,donate_by_purchase |

### `project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_RETENTION`
> Bảng DONATION_ENGAGEMENT_RETENTION tổng hợp dữ liệu về sự tham gia đóng góp và tỷ lệ giữ chân người dùng trong các hoạt động từ thiện qua MoMo. Bảng này cung cấp thông tin hữu ích để phân tích xu hướng tham gia và duy trì người dùng trong các hoạt động từ thiện theo tháng. Thông tin có thể được lấy từ bảng này bao gồm: 
-Tổng số người dùng tham gia vào các hoạt động từ thiện qua MoMo 
-Tỷ lệ giữ chân người dùng khi tham gia hoạt động từ thiện 
-Phân loại hình thức tham gia hoạt động từ thiện

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng báo cáo cho dữ liệu, thường là ngày đầu tiên của tháng (YYYY-MM-DD).The reporting month for the data, typically represented by the first day of the month (YYYY-MM-DD). | 2025-10-01, 2024-12-01, 2024-02-01 |
| `engage_type` | STRING | Danh mục cụ thể của sự tham gia đóng góp (ví dụ: engage_feed, engage_community, engage_walk).The specific category of donation engagement (e.g., engage_feed, engage_community, engage_walk). | engage_community, engage_fashion, engage_feed |
| `total_user` | INTEGER | Tổng số người dùng duy nhất tham gia vào loại hình tham gia cụ thể trong tháng.The total count of unique users who participated in the specified engagement type during the month. | 443936, 60329, 55759 |
| `user_retain_next_month` | INTEGER | Số lượng người dùng duy nhất từ nhóm người dùng của tháng hiện tại quay lại hoặc tham gia lại trong tháng tiếp theo.The number of unique users from the current month's cohort who returned or engaged again in the following month. | 182946, 308402, 260348 |
| `retention_rate` | FLOAT | Tỷ lệ phần trăm người dùng được giữ chân, được tính bằng (user_retain_next_month / total_user) * 100.The percentage of users retained, calculated as (user_retain_next_month / total_user) * 100. | 0, 49.591441204542356, 44.765237059267804 |

### `project-5400504384186300846.MBI_DA.DONATION_OVERLAP_MAU_MEU`
> Bảng này lưu trữ dữ liệu về sự trùng lặp của người dùng trên nền tảng quyên góp trong một tháng cụ thể. Các thông tin có thể được trích xuất từ bảng này bao gồm: 
- Số lượng người dùng độc đáo tổng hợp trên nền tảng quyên góp 
- Phân loại người dùng theo từng nhóm tương tác và quyên góp 
- Tổng số lượng người dùng thuộc mỗi danh mục.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng báo cáo (YYYY-MM-DD) cho ảnh chụp sự trùng lặp.The reporting month (YYYY-MM-DD) for the overlap snapshot. | 2025-09-01 |
| `total_user` | INTEGER | Tổng số lượng người dùng độc đáo trong phân tích (tổng của Only_MEU + Only_MAU + OVERLAP).The total distinct count of all users in the analysis (Sum of Only_MEU + Only_MAU + OVERLAP). | 1779506, 693950 |
| `total_meu_user` | INTEGER | Số lượng người dùng độc đáo đã tham gia tương tác với nền tảng quyên góp (ví dụ: chơi game) bất kể họ có quyên góp hay không.The distinct count of users who engaged with the donation platform (e.g., played games) regardless of whether they donated. | 380071, 402596, 371713 |
| `TYPE` | STRING | Danh mục phân đoạn: 'Only_MEU' (chỉ tương tác/chơi game nhưng không quyên góp), 'Only_MAU' (chỉ quyên góp nhưng không có hành động tương tác như chơi game), hoặc 'OVERLAP_MAU_MEU' (cả tương tác và quyên góp).Segment category: 'Only_MEU' (Engaged/played games but did not donate), 'Only_MAU' (Donated but had no engagement actions like games), or 'OVERLAP_MAU_MEU' (Both engaged and donated). | Only_MAU, Only_MEU |
| `total_user_by_type` | INTEGER | Số lượng người dùng độc đáo thuộc danh mục cụ thể được xác định trong cột 'TYPE'.The number of unique users belonging to the specific category defined in the 'TYPE' column. | 9517, 364389, 256023 |

### `project-5400504384186300846.MBI_DA.DONATION_FIRST_DONATE`
> Bảng chứa thông tin về lượt quyên góp đầu tiên của người dùng trên nền tảng. Bảng này có thể được sử dụng để:
- Xác định người quyên góp thông qua mã định danh duy nhất.
- Phân tích phương thức hoặc kênh quyên góp cụ thể mà người dùng sử dụng.
- Theo dõi ngày đầu tiên thực hiện quyên góp theo phương thức hoặc kênh cụ thể.
- Xác định ngày đầu tiên người dùng thực hiện bất kỳ quyên góp nào trên nền tảng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `user_id` | STRING | Mã định danh duy nhất của người quyên góp. Lưu ý: '0' có thể đại diện cho khách hoặc người dùng chưa được xác định.Unique identifier of the donor. Note: '0' may represent guest or unmapped users. | 38845676, 5412045, 20362858 |
| `action` | STRING | Phương thức hoặc kênh quyên góp cụ thể mà người dùng đã sử dụng (VD: QR Code, Heart Money, Golden Pig).The specific donation method or channel used (e.g., QR Code, Heart Money, Golden Pig). | donate_by_purchase, donate_heo_vang, donate_money_trai_tim |
| `first_date_donate_by_action` | DATE | Ngày sớm nhất (YYYY-MM-DD) mà người dùng thực hiện phương thức quyên góp cụ thể này.The earliest date (YYYY-MM-DD) the user performed this specific 'action'. | 2024-08-29, 2024-08-30, 2024-08-31 |
| `first_date` | DATE | Ngày đầu tiên mà người dùng thực hiện bất kỳ quyên góp nào trên nền tảng (Global First Touch).The absolute first date the user ever made any donation on the platform (Global First Touch). | 2024-08-29, 2024-08-30, 2022-07-18 |

### `project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_AGG`
> Bảng tổng hợp hành vi tham gia quyên góp của người dùng theo ngày và tháng. project-5400504384186300846.MBI_DA.DONATION_ENGAGEMENT_AGG chứa thông tin về:
- Ngày và tháng cụ thể mà người dùng tham gia quyên góp
- Loại hình và hành động tham gia của người dùng
- Mức độ tần suất tham gia của người dùng trong tháng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date_` | DATE | Ngày cụ thể mà người dùng tham gia quyên góp (YYYY-MM-DD).The specific date of engagement (YYYY-MM-DD). | 2022-08-10, 2022-01-18, 2022-08-17 |
| `month` | DATE | Tháng báo cáo (YYYY-MM-01) để phân tích xu hướng.The reporting month (YYYY-MM-01) for trend analysis. | 2022-08-01, 2022-10-01, 2022-01-01 |
| `user_id` | STRING | Định danh duy nhất của người dùng.Unique identifier of the user. | — |
| `engage_type` | STRING | Loại hình tham gia cấp cao (ví dụ: engage_community).The high-level category of engagement (e.g., engage_community). | engage_feed, engage_walk, engage_school |
| `action` | STRING | Hành động cụ thể được thực hiện trong loại hình tham gia.The specific action taken within the engagement type. | feed_pig, walk_reward_100g, submit_event |
| `n_action` | INTEGER | Tổng số lần hành động được thực hiện vào ngày này.Total number of times the action was performed on this date. | 1, 3, 2 |
| `first_date_engage_by_type` | DATE | Ngày đầu tiên người dùng tham gia với loại hình tham gia cụ thể này.The first date the user ever engaged with this specific engage_type. | 2021-10-01, 2021-10-02, 2023-04-28 |
| `first_date_engage` | DATE | Ngày đầu tiên toàn cầu mà người dùng từng tham gia trên nền tảng quyên góp.The absolute first date the user ever engaged with the donation platform (Global First Engagement). | 2021-10-01, 2019-10-31, 2019-11-01 |
| `num_date_by_engage` | INTEGER | Tổng số ngày riêng biệt mà người dùng đã tham gia với loại hình cụ thể này trong tháng.Total distinct days the user engaged with this specific type within the month. | 0, 31, 30 |
| `num_date_engage` | INTEGER | Tổng số ngày riêng biệt mà người dùng đã tham gia với bất kỳ phần nào của nền tảng trong tháng.Total distinct days the user engaged with any part of the platform within the month. | 0, 31, 30 |
| `segment_in_month_by_engage` | STRING | Phân đoạn cường độ của người dùng (ví dụ: Light, Heavy) dựa trên việc tham gia với một loại hình cụ thể.User intensity segment (e.g., Light, Heavy) based on engagement with a specific type. | Heavy, Medium, Light |
| `segment_in_month` | STRING | Phân đoạn cường độ tổng thể của người dùng (ví dụ: Light, Heavy) dựa trên tổng quan về mức độ tham gia trong tháng.Overall user intensity segment (e.g., Light, Heavy) based on total monthly engagement. | Heavy, Medium, Light |
| `lag_date_in_month` | DATE | Số ngày trôi qua kể từ lần tham gia trước đó trong tháng hiện tại.Days elapsed since the previous engagement in the current month. | 2022-08-17, 2022-08-15, 2022-10-13 |
| `lag_date_in_month_by_engage` | DATE | Số ngày trôi qua kể từ lần tham gia trước đó với loại hình cụ thể trong tháng hiện tại. | 2022-10-18, 2022-08-11, 2022-08-18 |
| `first_engage_in_month` | INTEGER | Cờ (1/0) chỉ ra nếu đây là lần đầu tiên người dùng tham gia trong tháng.Flag (1/0) indicating if this is the user's first engagement of the month. | 0, 1 |
| `first_engage_in_month_by_engage` | INTEGER | Cờ (1/0) chỉ ra nếu đây là lần đầu tiên người dùng tham gia với loại hình cụ thể trong tháng. | 0, 1 |
| `agent_id` | STRING | Định danh duy nhất của người dùng.Unique identifier of the user. | 50539017, 62201827, 42832108 |

### `project-5400504384186300846.MBI_DA.F_DONATION_ENGAGEMENT`
> project-5400504384186300846.MBI_DA.F_DONATION_ENGAGEMENT là bảng fact chứa thông tin liên quan đến tương tác của người dùng với các hoạt động quyên góp trên MoMo. Bảng này cung cấp thông tin chi tiết về:

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ID` | STRING | Mã định danh duy nhất cho mỗi bản ghi tương tác quyên góp. | — |
| `datetime` | TIMESTAMP | Thời điểm chính xác khi tương tác diễn ra. | 2025-08-17 09:25:48.600738+00, 2024-06-14 22:28:51.052+00, 2024-05-23 02:15:09.663790+00 |
| `date_` | DATE | Ngày mà tương tác diễn ra. | 2025-08-18, 2025-06-08, 2024-09-13 |
| `user_id` | STRING | Mã định danh của người dùng tham gia vào tương tác. | 0, 26863629, 35014823 |
| `engage_type` | STRING | Loại hình tương tác mà người dùng thực hiện (ví dụ: quyên góp, giúp đỡ...). | , engage_school, engage_feed |
| `status` | STRING | Trạng thái của tương tác (ví dụ: thành công, thất bại...). | , PENDING, SUCCESS |
| `action` | STRING | Hành động được thực hiện trong tương tác (ví dụ: gửi tiền, nhận tiền...). | complete_mission, loaded_answer_event_scr, submit_answer |
| `receiver_id` | STRING | Mã định danh của người nhận quỹ từ tương tác. | , 51987542, 48656436 |
| `helper_id` | STRING | Mã định danh của người hỗ trợ hoặc hỗ trợ viên trong tương tác. | , 17654347, 40456357 |
| `event_feed` | STRING | Nguồn thông tin sự kiện liên quan đến tương tác. | , PIG_FEED, HELP_PIG_FEED |
| `gear_type` | STRING | Loại thiết bị được sử dụng trong tương tác. | , clothes, wing |
| `gear_id` | STRING | Mã định danh của thiết bị được sử dụng trong tương tác. | , clothes_sinhnhatheo5_20240716, wing_thienthanxanh_20240722 |
| `event_id` | STRING | Mã định danh của sự kiện liên quan đến tương tác. | , Event_HTACH_20250801, Event_HTACH_20240101 |
| `course_id` | STRING | Mã định danh của khóa học liên quan đến tương tác. | , TTGC_20240210, TTTT_20240401 |
| `answer_id` | STRING | Mã định danh của câu trả lời trong tương tác. | , A, B |
| `is_correct` | INTEGER | Chỉ báo xem câu trả lời có đúng không (1: đúng, 0: sai). | 1, 0 |
| `submission_time` | INTEGER | Thời gian gửi thông tin trong tương tác. | 1706021654650, 1756432804234, 1711533725744 |
| `mission_id` | STRING | Mã định danh của nhiệm vụ trong tương tác. | pay_bill, , mm_transfer |
| `reward_type` | STRING | Loại phần thưởng được trao trong tương tác. | , PIG_FOOD, GOLDEN_PIG |
| `amount` | INTEGER | Số tiền liên quan đến tương tác. | 100, 200, 1 |
| `step_number` | INTEGER | Số bước thực hiện trong tương tác. | 1, 4000, 8 |
| `game_id` | STRING | Mã định danh của trò chơi liên quan đến tương tác. | , wheel_81, wheel_83 |
| `turn_remain` | INTEGER | Số lượt chơi còn lại trong tương tác. | 0, 1, 2 |
| `turn_used` | INTEGER | Số lượt chơi đã sử dụng trong tương tác. | 0, 1, 2 |
| `gift_type` | STRING | Loại quà tặng được trao trong tương tác. | , a, 240201_wheel_72_lwt022024_2heovang |
| `agent_id` | STRING | Mã định danh của tác nhân thực hiện tương tác. | 0, 26863629, 46471147 |

### `project-5400504384186300846.MBI_DA.DONATION_USER_WITH_CLOTHES`
> Bảng này dùng để quản lý thông tin về số lượng người dùng tham gia quyên tặng quần áo. Các mục đích và cách sử dụng của bảng này bao gồm: theo dõi và phân tích hành vi tham gia quyên tặng của người dùng, quản lý danh sách quần áo được quyên tặng, và đánh giá hiệu quả của các chiến dịch quyên tặng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `gear_id` | STRING | Mã định danh của quần áo được quyên tặng. | hat_khancodau_20230301, clothes_bingo_20230919, clothes_maruko_20250113 |
| `action` | STRING | Hành động của người dùng liên quan đến quyên tặng quần áo (ví dụ: quyên tặng, nhận quyên tặng). | receive_clothes, snapshot_clothes |
| `total_user` | INTEGER | Tổng số người dùng tham gia quyên tặng quần áo. | 3, 4, 13132 |

## Memory
*3 entries — user-trained knowledge*

1. Mimir đang hiểu nhầm số lượng Heo Vàng và người dùng quyên góp Heo Vàng _2026-03-01_
2. Khi xử lý MAU, cột ACTION không nên là 'Donate by purchase', mà là 'donate_by_purchase' _2025-08-26_
3. Số lượng Heo Vàng sở hữu của người dùng không khớp với dữ liệu hiện tại _2026-03-01_
