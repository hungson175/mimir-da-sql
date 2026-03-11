# BU MDS: OTA

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `7172ddb9-dc48-40d4-bff7-1aa74f6ff435`

## Description
Record information about:
(1): User behaviors across airline & non-air booking funnel (search → view → payment)
(2): Revenue tracking & performance by provider, route type, booking window, segment, holiday type

## Tables

### `momovn-prod.REPORT.2022_HUY_EVENTS_LANDINGPAGE_V2_PIVOTED_UNION`
> Bảng này tổng hợp các sự kiện người dùng từ trang đích landingpage qua nhiều phiên bản. Dữ liệu trong bảng có thể được sử dụng để phân tích hành vi người dùng, xác định hiệu quả của các tính năng và kiểm soát doanh thu từ các sự kiện trên ứng dụng.
 - Xác định và phân tích sự kiện người dùng dựa trên các thông số như thời gian, thiết bị và phiên bản ứng dụng.
 - Kiểm tra doanh thu và lượng giao dịch thành công, thất bại từ các sự kiện.
 - Theo dõi và đo lường hiệu quả chuyển đổi từ các khối và điểm gắn trên ứng dụng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `EVENT_DATE` | — | Ngày diễn ra sự kiện. | 2021-10-20, 2022-07-20, 2022-10-10 |
| `EVENT_TIME` | — | Thời gian chi tiết diễn ra sự kiện. | 2023-11-09 16:42:03.552, 2023-11-09 07:24:29.218, 2023-11-09 14:08:45.493 |
| `USER_ID` | — | Mã định danh của người dùng thực hiện sự kiện. | 52486046, 52835360, 38322143 |
| `DEVICE_OS` | — | Hệ điều hành của thiết bị người dùng. | Android, ANDROID, IOS |
| `APP_VERSION` | — | Phiên bản ứng dụng mà người dùng đang sử dụng. | 3.0.0-rc4, 4.2.2-beta.10, 4.2.25-beta.4 |
| `SESSION_ID` | — | Mã định danh của phiên làm việc. | 69529956_1679284950, 33007378_1679249913, 55383968_1679290237 |
| `EVENT_NAME` | — | Tên của sự kiện diễn ra. | feature_trans_history, service_screen_interacted, service_search_result_clicked |
| `SCREEN_DEFINE` | — | Định nghĩa màn hình nơi sự kiện diễn ra. | bus_home, man_hinh_danh_sach_khach_san, flight_information |
| `TYPE_KEY` | — | Loại khóa của sự kiện. | 230815_dls_ota_native_train_all_mshock_15k_min300k, e_s12_aw_500k_241211_giam_100pt40k_oq4sp, 220524_ota_hourlyhotel_btl_69k |
| `BLOCK` | — | Khối liên quan đến sự kiện. | MOMO Đề Xuất, ƯU ĐÃI ĐẶC BIỆT, hotel_widget_location |
| `MOUNT_POINT` | — | Điểm gắn nơi sự kiện xảy ra. | 37718360188, 37719100632, 37712361084 |
| `n_block` | — | Khối mới liên quan đến sự kiện. | recent_step, popular_service, guidebook |
| `n_button_name` | — | Tên nút mới trong sự kiện. | faq, price, napas_vnr_paybill_new |
| `n_component_name` | — | Tên thành phần mới trong sự kiện. | quick_filter_seat_type, block, int |
| `n_destination` | — | Điểm đến mới của sự kiện. | Phan Thiết, Đà Nẵng, Vũng Tàu |
| `n_entry_point` | — | Điểm vào mới của sự kiện. | landing_page_ota |
| `n_feature_10` | — | Tính năng thứ 10 trong sự kiện mới. | — |
| `n_feature_8` | — | Tính năng thứ 8 trong sự kiện mới. | — |
| `n_position` | — | Vị trí mới trong sự kiện. | 6, 8, 6.0 |
| `n_ref_id` | — | ID tham chiếu mới trong sự kiện. | — |
| `n_screen_name` | — | Tên màn hình mới trong sự kiện. | bus_home, man_hinh_danh_sach_khach_san, return_filter |
| `n_service` | — | Dịch vụ mới liên quan đến sự kiện. | landing_page_ota |
| `n_service_id` | — | ID dịch vụ mới liên quan đến sự kiện. | transport_airlines, transport_bus, booking_experiences_vinwonders |
| `n_service_name` | — | Tên dịch vụ mới liên quan đến sự kiện. | landing_page_ota, ota_landing_page, topbar_paymentcode |
| `n_time_load` | — | Thời gian tải mới của sự kiện. | 280, 459, 1148 |
| `n_trans_confirm` | — | Xác nhận giao dịch mới trong sự kiện. | 72578770_1679310469, 65443201_1679301264, 36916612_1679304985 |
| `n_trans_confirm_screen` | — | Màn hình xác nhận giao dịch mới trong sự kiện. | 67565171_1679264301, 43408455_1679272678, 54631593_1679325093 |
| `n_trans_fail` | — | Giao dịch thất bại mới trong sự kiện. | 57927799_1659539667, 19391790_1600214624, 51072305_1647266598 |
| `n_trans_success` | — | Giao dịch thành công mới trong sự kiện. | 42306021_1679295261, 42599303_1679307257, 43204877_1679314077 |
| `SUB_CATE` | — | Phân loại phụ của sự kiện. | 01. AIRLINE, 09. LANDINGPAGE_OTA, 02. TRAIN |
| `TYPE_USER` | — | Loại người dùng thực hiện sự kiện. | DIRECT, LDP |
| `EVENT_TIME_CHECK` | — | Thời gian kiểm tra sự kiện. | 2020-07-28 07:02:39.017079, 2020-07-28 11:26:07.243008, 2020-07-28 12:05:39.271015 |
| `ID` | — | Mã định danh của sự kiện. | 37729025773, 37740484959, 37727853161 |
| `TOTAL_AMOUNT` | — | Tổng số tiền liên quan đến sự kiện. | 827000, 1783000, 3856000 |
| `REVENUE` | — | Doanh thu từ sự kiện. | 7499.9999999999991, 22516.363636363636, 17775.81818181818 |
| `REVENUE_AFTER_REFUND` | — | Doanh thu sau khi hoàn tiền từ sự kiện. | 13480.363636363636, 21818.181818181813, 22017.272727272728 |
| `CONTRIBUTION_SOURCE` | — | Nguồn đóng góp của sự kiện. | home, LDP |
| `new_to_cate_datetime` | — | Thời gian mới phân loại sự kiện theo danh mục. | 2023-01-28 18:53:00, 2022-11-04 10:22:20, 2022-05-13 09:34:26 |
| `is_existing_user` | — | 0: không phải người dùng hiện có, 1: là người dùng hiện có. | 0, 1 |

### `momovn-prod.REPORT.ota_dwd_ota_user_funnel_traffic_source_daily`
> Bảng này lưu trữ dữ liệu về hành vi người dùng theo từng bước trong quy trình đặt dịch vụ OTA (Online Travel Agency) hàng ngày, bao gồm các nguồn lưu lượng truy cập. Các thông tin có thể thu thập từ bảng này bao gồm: theo dõi liệu người dùng đã tải trang chủ, thực hiện tìm kiếm, hoặc tải thông tin thanh toán hay chưa; xác định liệu người dùng đã nhập thông tin hành khách hay đã thực hiện giao dịch; phân tích các nguồn lưu lượng truy cập dẫn đến sự kiện.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `event_date` | — | Ngày diễn ra sự kiện | 2025-06-03, 2025-02-17, 2024-12-14 |
| `user_id` | — | Mã định danh người dùng duy nhất | 79546140, 20277440, 44447911 |
| `sub_cate` | — | Danh mục phụ của dịch vụ hoặc sự kiện | 03. BUS, 02. TRAIN, 01. AIRLINE |
| `has_load_home` | — | Biểu thị liệu người dùng đã tải trang chủ hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_search` | — | Biểu thị liệu người dùng đã thực hiện tìm kiếm hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_load_listing` | — | Biểu thị liệu người dùng đã tải trang danh sách sản phẩm/dịch vụ hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_load_seat_departure_OR_fare_group_OR_hotel_info` | — | Biểu thị liệu người dùng đã tải trang chọn chỗ ngồi, nhóm giá vé hoặc thông tin khách sạn hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_passenger_info` | — | Biểu thị liệu người dùng đã nhập thông tin hành khách hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_ancillary` | — | Biểu thị liệu người dùng đã chọn các dịch vụ bổ sung hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_load_payment_info` | — | Biểu thị liệu người dùng đã tải thông tin thanh toán hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_load_ttat` | — | Biểu thị liệu người dùng đã tải trang TTAT (Thời gian thực hiện hành động) hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `has_transaction` | — | Biểu thị liệu người dùng đã thực hiện giao dịch hay chưa (1 nếu có, 0 nếu không) | 1, 0 |
| `transaction` | — | Trạng thái của giao dịch (có thể là mã số hoặc boolean) | 16, 4, 17 |
| `traffic_source_event` | — | Nguồn lưu lượng truy cập dẫn đến sự kiện này | official_account, offline_hub, hdss_v2 |

## Memory
*36 entries — user-trained knowledge*

1. Khi tính tổng số vé, sử dụng SUM(total_ticket) thay vì COUNT(DISTINCT pnr_booking_code) _2025-09-18_
2. RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này _2026-01-15_
3. Luôn sử dụng cột user_payment trong bảng momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE để tính các chỉ số MAU/ active user/ user đã mua/ user thanh toán _OTA · 2025-07-01_
4. Để tính số MAU của máy bay quốc tế, dùng COUNT(DISTINCT USER_PAYMENT) _OTA · 2025-07-01_
5. NEWUSER_MOMO và NEWUSER_OTA chứa ID người dùng thay vì cờ 0 hoặc 1 _OTA · 2025-07-29_
6. Khi hỏi số lượng người dùng mới của MoMo, luôn dùng cột NEWUSER_MOMO_EXCL_CASHIN_OUT _OTA · 2025-07-29_
7. MONEYSOURCE: 1=MOMO, 2=NHLK - Ngân hàng liên kết, 3=NAPAS, 4=VISA_DEBIT, 5=VISA_CREDIT, 6=GOLDEN_POCKET - Túi thần tài, 7=PAYLATER - Ví trả sau, 8=CASHBACK, 9=CCM_VIRTUAL_CREDIT_CARD, 10=BNPL, 11=Newton, 12=Direct Debit, 13=Quy Nhom _OTA · 2025-08-01_
8. Dùng cột date trong bảng momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE để tính MAU _OTA · 2025-08-04_
9. Khi tính doanh thu, cần thêm điều kiện STATUSID = 2 _OTA · 2025-07-01_
10. Dùng data thuộc bảng momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE _OTA · 2025-07-01_
11. Nếu đề cập đến native hay app momo, filter platform = 'App Momo' _OTA · 2025-07-02_
12. Khi tính trung bình số chuyến bay trong tháng 07, cần xác định platform là 'App Momo' hay 'Partner' _OTA · 2025-07-25_
13. Nếu cột NEWUSER_OTA có giá trị (không phải NULL), người dùng đó là người dùng mới của dịch vụ OTA _OTA · 2025-07-29_
14. STATUSID = 2 đại diện cho giao dịch thành công _OTA · 2025-07-29_
15. Tính phần trăm người dùng quay lại bằng cách lấy số lượng người dùng tìm kiếm trong cả tháng 4 và tháng 5 chia cho tổng số người dùng tìm kiếm trong tháng 4, không phải tháng 5 _OTA · 2025-07-31_
16. Cột ngày tháng chính xác trong bảng momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE là DATE, không phải EVENT_DATE _2025-10-26_
17. Trong bảng momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE, các group_sub_cate được mã hóa như sau:
- Train = '02. LAND TRANSPORT' (bao gồm cả Bus và Train)
- Bus = '02. LAND TRANSPORT' (bao gồm cả Bus và Train)  
- Hotel = '03. HOTEL'
- Experience = '04. ETP & OTHERS' _2026-01-02_
18. MONEYSOURCE: 1=MOMO, 2=NHLK - Ngân hàng liên kết, 3=NAPAS, 4=VISA_DEBIT, 5=VISA_CREDIT, 6=GOLDEN_POCKET - Túi thần tài, 7=PAYLATER - Ví trả sau, 8=CASHBACK, 9=CCM_VIRTUAL_CREDIT_CARD, 10=BNPL, 11=Newton, 12=Direct Debit, 13=Quy Nhom _OTA · 2025-07-01_
19. CR được tính bằng công thức: count(distinct case WHEN EVENT_DATE <= date'2022-05-25' and c_trans_success is not null then USER_ID when EVENT_DATE > date'2022-05-25' and EVENT_NAME = 'trans_success_be' THEN USER_ID end)/count(distinct USER_ID) trong bảng momovn-prod.REPORT.2022_HUY_EVENTS_LANDINGPAGE_V2_PIVOTED_UNION _OTA · 2025-07-01_
20. Statusid = 6 để lọc các giao dịch thất bại _OTA · 2025-07-01_
21. Khi tính trung bình số chuyến bay tháng 07, cần lọc dữ liệu với PLATFORM = 'App Momo' và SUB_CATE = '01. AIRLINE' _OTA · 2025-07-25_
22. Retention được tính bằng số lượng người dùng cùng tồn tại ở tháng trước và tháng hiện tại, sau đó chia cho số lượng người dùng tháng trước đó _OTA · 2025-07-27_
23. Khi tính trung bình số chuyến bay, dùng cột flight_no thay vì pnr_booking_code _OTA · 2025-07-25_
24. Phân loại khu vực Bắc và Nam dựa trên vĩ tuyến 17: từ vĩ tuyến 17 về phía Bắc là Bắc, về phía Nam là Nam _OTA · 2025-07-27_
25. Nếu cột NEWUSER_MOMO có giá trị (không phải NULL), người dùng đó là người dùng mới của MoMo _OTA · 2025-07-29_
26. Luôn thêm statusid = 2 để lọc ra những giao dịch thành công _OTA · 2025-07-01_
27. Khi xử lý dữ liệu Vietnam Airlines luồng Inapp, sử dụng SERVICE_ID_MBI in ('ota_airline_vna', 'airline.hpl') thay vì SERVICE_CODE = 'm4becomvnaweb' _OTA · 2025-07-31_
28. Khi đề cập đến vé máy bay quốc tế thì filter flight_region <> 'VN' _OTA · 2025-07-01_
29. Nếu đề cập đến payment gateway, pmt hay cổng thanh toán, filter platform = 'Partner' _OTA · 2025-07-02_
30. Không dùng cột INITIATOR để tính toán metrics liên quan đến user _OTA · 2025-07-01_
31. Khi user đề cập đến từ 'bay', phải filter sub_cate = '01. AIRLINE' _OTA · 2025-07-01_
32. SERVICE_CODE 'm4bthaiairasia' maps to MERCHANT 'AIRASIA'. SERVICE_CODE 'm4becomvnaweb' maps to MERCHANT 'VN AIRLINES'. _OTA · 2025-07-10_
33. Phân loại địa điểm theo miền Bắc, Trung, Nam dựa trên danh sách các tỉnh/thành _OTA · 2025-07-31_
34. Khi xử lý vấn đề liên quan tới danh sách người dùng mua vé bay từ SGN, dùng departure_ư_code cho cột departure_station_code _OTA · 2025-08-19_
35. Khi đề cập đến vé máy bay quốc tế thì filter flight_region <> 'VN' _2025-10-16_
36. Bảng momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE cần được liệt kê khi list tất cả bảng và schema của domain _2025-10-26_
