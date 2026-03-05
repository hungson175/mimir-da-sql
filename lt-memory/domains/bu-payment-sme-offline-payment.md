# BU Payment: SME OFFLINE PAYMENT

**Domain ID:** `03f0b56d-7b56-49d8-9073-6bb94e564fe2`

## Description
A DATASET containing processed information about merchant payment and merchant profile

## Tables

### `project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION`
> Tổng hợp transaction offline payment, gồm các giao dịch payment thành công, có agent nhận tiền thỏa mã 1 trong 2 điều kiện: (1) được define là dịch vụ offline trên service list, (2) là agent của merchant_id được xác định thuộc offline trên hệ thống M4B. Do đó tùy từng mục đích sử dụng và mục đích phân loại khác nhau mà cần lọc lại data. Primary key: tid. Với dự án offline merchant, cần lọc ra các giao dịch valid (tại tháng 11/2023, rule là amount>=10k), thì sử dụng cột is_valid_trans để lọc. 
Thông tin có thể lấy từ table này gồm:
- Thông tin về giao dịch offline và phân loại theo mã dịch vụ
- Phân loại merchant theo các tiêu chí khác nhau như size, type, loại hình thanh toán
- Phân tích mức độ active của store và thông tin quản lý sale team
Contact: cong.tran1@mservice.com.vn
Maintained by: team CDO-K khai.do@mservice.com.vn

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date` | — | Ngày diễn ra giao dịch | — |
| `date_time` | — | Thời điểm diễn ra giao dịch | — |
| `month` | — | Tháng diễn ra giao dịch | — |
| `tid` | — | ID của giao dịch trong hệ thống core, được gọi là TID (transaction ID) | — |
| `service_code` | — | Service_code của giao dịch thanh toán, dùng để lấy thông tin từ Service List | — |
| `agent_id` | — | Agent id của user | — |
| `amount` | — | Số tiền của giao dịch thanh toán, trước khi trừ promotion | — |
| `fund_id` | — | Id của nguồn tiền user dùng thanh toán nếu thanh toán bằng MoMo | — |
| `money_source` | — | Nguồn tiền thanh toán nếu user thanh toán bằng app MoMo (MoMo, NHLK, TTT, VTS,...) | — |
| `payment_type` | — | Phân loại hình thức thanh toán dựa vào payment_method và payment_channel như QR tĩnh, QR động, scanner pos | — |
| `payment_type_group` | — | Phân loại app thanh toán của user, gồm "MoMo" và "Bank" | — |
| `merchant_code` | — | Mã định danh merchant (MID), unique cho mỗi merchant | — |
| `store_id` | — | ID số của store, unique trên M4B. Store có thể được gán là -1 | — |
| `store_code` | — | Mã store bằng chữ, cần check giá trị bên trong cột là store_code hay store_id khi join | — |
| `store_code_unique` | — | Concat merchant code & store code để đếm active store | — |
| `merchant_name_m4b` | — | Tên của merchant theo M4B | — |
| `store_name` | — | Tên store trên M4B | — |
| `merchant_type_m4b` | — | Type M4B của merchant (BPU, SME) | — |
| `merchant_onboarding_type` | — | Luồng onboard merchant do sale team hoặc tự onboard | — |
| `merchant_size` | — | Phân loại merchant theo size và offline/online, bao gồm SME OFFLINE, TOPBRAND OFFLINE, UNDEFINED, PRE - SME OFFLINE | — |
| `store_city` | — | Thành phố của cửa hàng | — |
| `store_district` | — | Quận của cửa hàng | — |
| `store_ward` | — | Phường của cửa hàng | — |
| `bu_category_sl` | — | Phân loại dịch vụ offline hiện tại của BU Offline, gồm: Retail, FnB, SME | — |
| `category_sl_lv1` | — | Phân loại dịch vụ offline trên Service List, tương đương BU_GROUP_CODE_L1 | — |
| `category_sl_lv2` | — | Phân loại dịch vụ offline trên Service List, tương đương BU_GROUP_CODE_L2 | — |
| `category_sl_lv3` | — | Phân loại dịch vụ offline trên Service List, tương đương BU_GROUP_CODE_L3 | — |
| `category_sl_lv4` | — | Phân loại dịch vụ offline trên Service List, tương đương BU_GROUP_CODE_L4 | — |
| `merchant_name_sl` | — | Tên của merchant theo Service List | — |
| `sale_team_m4b` | — | Sale_team mà tạo ra cửa hàng phát sinh giao dịch | — |
| `rsm` | — | Người quản lý đội sale theo miền | — |
| `asm` | — | Người quản lý đội sale theo vùng | — |
| `sale_username` | — | Email, tên miền của sale tạo merchant trên m4b | — |
| `sale_team_pic` | — | Sale team được tính KPI cho số active store | — |
| `store_monthly_active_type` | — | Active_type của store theo level tháng, gồm các giá trị new active, retention, reactive, inactive | — |
| `store_monthly_trans_segment` | — | Segment của store theo số lượng transaction trong tháng, gồm light (1-6), medium (7-30), heavy (31+) | — |
| `master_merchant_label` | — | Tên của master merchant nếu thuộc master merchant, ví dụ IPOS, NHANH, HARAVAN | — |
| `merchant_type_master_merchant` | — | "online" hoặc "offline" nếu merchant thuộc master merchant | — |
| `ipos_creation_source` | — | Nguồn tạo store cho IPOS: MoMo, IPOS tạo hay migrate sang IPOS | — |
| `is_bo_merchant` | — | 1: BO đã note trạng thái trên merchant; 0: chưa có BO action | — |
| `num_day_qa_from_creation` | — | Thời gian từ store được tạo đến lúc BO duyệt | — |
| `merchant_num_day_qa_from_creation` | — | Thời gian từ merchant được tạo đến lúc BO duyệt | — |
| `store_dynamic_integration_datetime` | — | Ngày tích hợp/ mở mới dynamic qr | — |
| `store_qa_approved_datetime` | — | Thời điểm được QC duyệt của store | — |
| `store_acquired_datetime` | — | Thời điểm store được acquired, ngày store có thể thanh toán được | — |
| `store_acquired_date` | — | Ngày store được acquired, ngày store có thể thanh toán được | — |
| `merchant_qa_approved_datetime` | — | Thời điểm được duyệt QA của Merchant | — |
| `is_valid_transaction` | — | Transaction có được tính là valid không | — |
| `merchant_paylater_config_type` | — | Phân biệt merchant được chấp nhận thanh toán bằng nguồn tiền ví trả sau | — |
| `sale_parent_username` | — | Username của ngừoi thuê salesman, thường bằng với sale_username nếu là sale inhouse | — |
| `sale_type` | — | Phân loại salesman vào các nhóm | — |
| `sale_parent_type` | — | Phân loại của ngừoi thuê salesman | — |
| `rank_tid` | — | None | — |
| `soundbox_tran_type_id` | — | type = 1 là transaction soundbox | — |
| `sb_1st_install_date` | — | Ngày đầu tiên soundbox được gắn vào store này | — |

### `project-5400504384186300846.MBI_DA.DM_OFF_STORE_PROFILE`
> Profile của các store trong hệ thống M4B. Primary key: store_id. Trong bảng có các cột có tiền tố 'merchant_' là những cột thông tin ở cấp độ merchant, sẽ lặp lại giữa các store có cùng merchant_id. Các cột không có tiền tố 'merchant_' thì được hiểu là thông tin của store, ví dụ cột city_name được hiểu là city của store nhưng merchant_city_name được hiểu là city của merchant.
Thông tin có thể được lấy từ bảng này bao gồm:
- Danh sách store và mã định danh riêng biệt trên M4B
- Thông tin trạng thái và hoạt động của từng store
- Lịch sử giao dịch và thanh toán của store trong các khoảng thời gian xác định

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `store_id` | — | ID của store bằng số, khác với store_code bằng chữ, mã này unique cho mỗi store trên M4B | — |
| `store_code` | — | Mã store bằng chữ, ví dụ 'Xzyuabc...', khác với mã store bằng số (store ID). Tuy nhiên, field store_code này ở một số bảng raw được đặt là store_id, partner_store_id. Do đó, cần kiểm tra giá trị bên trong cột là store_code hay store_id khi join | — |
| `merchant_code` | — | Mã định danh merchant bằng chữ, còn được gọi là partner_code trong một số bảng dữ liệu hoặc được gọi là 'MID' theo cách gọi của BU. Merchant_code là unique cho mỗi merchant | — |
| `merchant_id` | — | Mã định danh merchant bằng số. Merchant_id là unique cho mỗi merchant | — |
| `latest_state_code` | — | State code (snapshot) của store | — |
| `latest_state_name` | — | Mô tả trạng thái của store dựa vào latest_state_code như: đã duyệt, chưa QA, đã thanh lý... | — |
| `brand_name` | — | Tên thương hiệu trên M4B, nhiều merchant_id có chung brand name | — |
| `merchant_name_m4b` | — | Tên merchant trên M4B, hiển thị trên màn hình thanh toán của user khi giao dịch. Tên này có thể khác với tên merchant trên service list và brand name trên M4B | — |
| `merchant_name_sl` | — | Tên merchant trên service list. Chỉ chọn một agent theo thứ tự ưu tiên để map 1-1 giữa merchant_id và service list | — |
| `store_name` | — | Tên cửa hàng trên M4B | — |
| `representative_name` | — | Tên người đại diện của merchant | — |
| `merchant_created_date` | — | Ngày merchant được tạo ra trên hệ thống M4B | — |
| `merchant_created_datetime` | — | Thời điểm merchant được tạo ra trên hệ thống M4B | — |
| `merchant_qa_approved_datetime` | — | Thời điểm merchant được QA approve theo logic: last datetime if current state_code = 210 (QA Đã Duyệt) else null | — |
| `merchant_qa_approved_date` | — | Ngày merchant được QA approve theo logic: last date if current state_code = 210 (QA Đã Duyệt) else null | — |
| `created_datetime` | — | Thời điểm tạo store trên M4B | — |
| `created_date` | — | Ngày tạo store trên M4B | — |
| `qa_approved_datetime` | — | Thời điểm store được QA approve theo logic: if current state_code = 210 (QA Đã Duyệt) else null | — |
| `qa_approved_date` | — | Ngày store được QA approve theo logic: if current state_code = 210 (QA Đã Duyệt) else null | — |
| `qr_activated_datetime` | — | Thời điểm store lần đầu được gán với 1 mã QR code tĩnh | — |
| `qr_activated_date` | — | Ngày store lần đầu được gán với 1 mã QR code tĩnh | — |
| `dynamic_qr_datetime` | — | Thời điểm store lần đầu phát sinh 1 giao dịch thông qua qr động hoặc scanner pos | — |
| `dynamic_qr_date` | — | Ngày store lần đầu phát sinh 1 giao dịch thông qua qr động hoặc scanner pos | — |
| `acquired_datetime` | — | Thời điểm store được acquired, ngày này được hiểu là ngày store có thể thanh toán được | — |
| `acquired_date` | — | Ngày store được acquired, được tính vào kpi acquire cho sale | — |
| `first_trans_date` | — | Ngày đầu tiên phát sinh giao dịch | — |
| `last_trans_date` | — | Ngày cuối cùng phát sinh giao dịch cho đến thời điểm hiện tại | — |
| `f30_gmv` | — | GMV trong 30 ngày đầu kể từ ngày acquire_date | — |
| `f30_trans` | — | Tổng trans trong 30 ngày đầu kể từ acquire_date | — |
| `f30_user` | — | Tổng unique user trong 30 ngày đầu kể từ acquire_date | — |
| `f60_gmv` | — | Gmv trong 60 ngày đầu kể từ ngày acquire_date | — |
| `f60_trans` | — | Tổng trans trong 60 ngày đầu kể từ ngày acquire_date | — |
| `f90_gmv` | — | Gmv trong 90 ngày đầu kể từ ngày acquire_date | — |
| `f90_trans` | — | Tổng trans trong 90 ngày đầu kể từ ngày được kích hoạt thanh toán | — |
| `accum_gmv` | — | Tổng gmv lifetime tới ngày hiện tại | — |
| `accum_trans` | — | Tổng trans lifetime cho tới ngày hiện tại | — |
| `num_month_active_from_acquisition` | — | Bao nhiêu tháng từ ngày acquired đến ngày có first_trans | — |
| `merchant_size_sl` | — | Phân loại SME OFFLINE/ TOPBRAND OFFLINE theo service list | — |
| `merchant_type_m4b` | — | Type M4B của merchant (BPU, SME) | — |
| `merchant_onboarding_type` | — | Luồng onboard merchant để xác định merchant được onboard do sale team hay tự onboard | — |
| `merchant_size` | — | Phân loại merchant trong dự án Offline merchant, phục vụ cho mục đích tính KPI business | — |
| `full_address` | — | Địa chỉ đầy đủ của store | — |
| `city_name` | — | City của store | — |
| `district_name` | — | District của store | — |
| `ward_name` | — | Ward của store | — |
| `street_name` | — | Đường của store | — |
| `house_number` | — | Số nhà của store | — |
| `longitude` | — | Kinh độ của store | — |
| `latitude` | — | Vĩ độ của store | — |
| `active_status` | — | Trạng thái hoạt động của store, có 2 giá trị: 1 - còn hoạt động, 0 - không còn hoạt động | — |
| `merchant_register_dynamic_qr` | — | Xác định merchant có đăng ký hình thức thanh toán động hay không (1 = có, 0 = không) | — |
| `sale_username` | — | Email hoặc tên miền của sale tạo merchant trên M4B | — |
| `asm` | — | Quản lý sale cấp vùng | — |
| `rsm` | — | Quản lý sale cấp miền | — |
| `sale_team_m4b` | — | Nguồn sale, là telesale hay directsale | — |
| `sale_note` | — | Note dạng free text của sale man | — |
| `email` | — | Email của chủ merchant | — |
| `operating_time` | — | Thời gian hoạt động của cửa hàng | — |
| `store_phone` | — | Số điện thoại của cửa hàng | — |
| `category_m4b` | — | Sub_cate được điền trên M4B | — |
| `sub_category_m4b` | — | Sub_cate được điền trên M4B | — |
| `category_sl_lv1` | — | Phân loại dịch vụ offline trên Service List | — |
| `category_sl_lv2` | — | Phân loại dịch vụ offline trên Service List | — |
| `category_sl_lv3` | — | Phân loại dịch vụ offline trên Service List | — |
| `category_sl_lv4` | — | Phân loại dịch vụ offline trên Service List | — |
| `merchant_bank_account_number` | — | Số tài khoản ngân hàng nhận tiền payout của merchant | — |
| `merchant_bank_name` | — | Tên ngân hàng nhận tiền payout của merchant | — |
| `merchant_payout_phone` | — | Số điện thoại là chủ ví payout của merchant | — |
| `fee` | — | Current fee thu của merchant | — |
| `payout_method` | — | Phương thức payout của merchant | — |
| `sale_team_pic` | — | Sale team được tính KPI cho số active store | — |
| `master_merchant_label` | — | Tên của master merchant nếu merchant thuộc master merchant | — |
| `merchant_type_master_merchant` | — | Gồm 2 giá trị: 'online' hoặc 'offline' cho các merchant thuộc master merchant | — |
| `ipos_creation_source` | — | Nguồn tạo store: store MoMo tạo, store IPOS tạo hay migrate sang IPOS | — |
| `ipos_store_ref_id` | — | Reference ID dùng để map với data phía iPOS | — |
| `is_bo_merchant` | — | Trạng thái BO trên merchant (duyệt/ khóa/ tạm khóa) | — |
| `num_day_qa_from_creation` | — | Thời gian từ việc tạo store đến lúc BO duyệt | — |
| `merchant_num_day_qa_from_creation` | — | Thời gian từ việc tạo merchant đến lúc BO duyệt | — |
| `dynamic_integration_datetime` | — | Thời điểm đầu tiên tích hợp phương thức thanh toán dynamic qr cho store | — |
| `dynamic_integration_date` | — | Ngày đầu tiên tích hợp phương thức thanh toán dynamic qr cho store | — |
| `primary_service_code` | — | Service_code ứng với merchant_code, dùng để map qua service list lấy phân loại cho merchant | — |
| `sale_parent_username` | — | Username của người thuê salesman | — |
| `sale_type` | — | Phân loại salesman vào các nhóm | — |
| `sale_parent_type` | — | Phân loại của người thuê salesman | — |
| `paylater_config_type` | — | Phân loại hình thức thanh toán bằng nguồn tiền ví trả sau của merchant | — |
| `min_aio_qr_datetime` | — | Thời điểm đầu tiên store được trang bị aio qr tĩnh | — |
| `is_store_aio_qr` | — | Phân biệt store có được trang bị aio qr tĩnh hay không (1: có, 0: không) | — |
| `system_fo_status` | — | Nội dung cột 'Hệ thống xét duyệt' trên M4B | — |
| `status_fo_qc_m4b` | — | Final status FO QC trên M4B | — |
| `aio_dynamic_api_date` | — | Ngày đầu tiên có trạng thái call api dynamic | — |
| `merchant_latest_state_code` | — | Mã trạng thái mới nhất của merchant | — |
| `contract_group_agg` | — | Phân loại hợp đồng theo Product tổng hợp | — |
| `min_sign_contract_datetime` | — | Thời điểm ký hợp đồng sớm nhất | — |
| `max_sign_contract_datetime` | — | Thời điểm ký hợp đồng muộn nhất | — |
| `f30_date_payout_ttt` | — | Đếm số ngày bật payout TTT trong 30 ngày đầu | — |
| `sb_1st_install_date` | — | Ngày cài đặt đầu tiên | — |
| `sb_serial` | — | Serial | — |

### `project-5400504384186300846.MBI_DA.DM_OFF_STORE_MONTHLY_PERFORMANCE`
> Tổng hợp thông tin về hiệu suất hàng tháng của cửa hàng thuộc dự án thanh toán offline. Bảng đã lọc các giao dịch hợp lệ (với giá trị giao dịch >= 10k). Chỉ những cửa hàng active mới xuất hiện trong tháng. Composite key của bảng bao gồm store_code_unique và month.
- Mục đích và sử dụng:
  - Theo dõi hiệu suất hàng tháng của các cửa hàng thuộc dự án thanh toán offline.
  - Đánh giá chỉ số hoạt động của các store qua các dữ liệu như monthly_active_type, monthly_trans_segment.
  - Hỗ trợ chiến lược sale và marketing thông qua phân loại merchant_size và sale_type.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | — | Tháng giao dịch. | — |
| `store_id` | — | ID của cửa hàng, sử dụng số. Mã này là unique cho mỗi cửa hàng trên M4B. Nếu không tìm thấy thông tin mã cửa hàng trong M4B, store_id sẽ được gán là -1. | — |
| `merchant_id` | — | Id định danh của merchant. (Name: Tên của merchant) | — |
| `merchant_code` | — | Mã định danh merchant bằng chữ, unique cho mỗi merchant, được gọi là partner_code hoặc MID. (Name: Tên của merchant) | — |
| `store_code` | — | Mã cửa hàng bằng chữ, ví dụ "Xzyuabc...". Không phải mã số store_id. | — |
| `store_code_unique` | — | Cặp mã merchant và mã store, dùng để đếm cửa hàng active. (Private content: Trường dữ liệu có nội dung bao gồm dữ liệu cá nhân) | — |
| `merchant_name_m4b` | — | Tên merchant trên M4B. (Name: Họ, tên khai sinh) | — |
| `merchant_name_sl` | — | Tên merchant được điền bởi BO. (Merchant address: Địa chỉ của merchant) | — |
| `brand_name` | — | Tên thương hiệu. (Merchant address: Địa chỉ của merchant) | — |
| `store_name` | — | Tên cửa hàng. (Merchant address: Địa chỉ của merchant) | — |
| `merchant_type_m4b` | — | Loại M4B của merchant (BPU, SME). | — |
| `merchant_onboarding_type` | — | Luồng onboard merchant, xác định bởi sale team hoặc tự onboard. | — |
| `sale_team_m4b` | — | Sale team tạo ra giao dịch này. | — |
| `rsm` | — | Quản lý sale theo miền. | — |
| `asm` | — | Quản lý sale theo vùng. | — |
| `sale_username` | — | Email/tên miền của nhân viên sale. (Phone number: Số điện thoại) | — |
| `sale_team_pic` | — | Sale team tính KPI cho cửa hàng active. | — |
| `merchant_size` | — | Phân loại merchant trong dự án Offline merchant (SME OFFLINE, TOPBRAND OFFLINE, UNDEFINED, PRE-SME OFFLINE). | — |
| `monthly_active_type` | — | Phân loại active type của store theo level tháng, có thể là new active, retention, reactive, inactive. | — |
| `monthly_trans_segment` | — | Phân nhóm store dựa trên số lượng giao dịch trong tháng (light, medium, heavy). | — |
| `category_m4b` | — | Sub_cate trên M4B. | — |
| `sub_category_m4b` | — | Sub_cate trên M4B. | — |
| `category_sl_lv1` | — | Phân loại dịch vụ offline trên Service List, tương đương cột BU_GROUP_CODE_L1. | — |
| `category_sl_lv2` | — | Phân loại dịch vụ offline trên Service List, tương đương cột BU_GROUP_CODE_L2. | — |
| `category_sl_lv3` | — | Phân loại dịch vụ offline trên Service List, tương đương cột BU_GROUP_CODE_L3. | — |
| `category_sl_lv4` | — | Phân loại dịch vụ offline trên Service List, tương đương cột BU_GROUP_CODE_L4. | — |
| `store_city` | — | Thành phố của cửa hàng. | — |
| `store_district` | — | Quận huyện của cửa hàng. | — |
| `store_ward` | — | Phường xã của cửa hàng. | — |
| `store_street` | — | Đường của cửa hàng. | — |
| `acquired_date` | — | Ngày acquired của store. | — |
| `num_month_from_acquisition` | — | Số tháng kể từ ngày acquire đến hiện tại. | — |
| `num_month_from_last_active` | — | Số tháng kể từ tháng active gần nhất. | — |
| `first_trans_date` | — | Ngày đầu tiên phát sinh giao dịch của store. | — |
| `last_trans_date` | — | Ngày cuối cùng phát sinh giao dịch của store. | — |
| `prev_active_month` | — | Tháng active trước đó. | — |
| `next_active_month` | — | Tháng active tiếp theo. | — |
| `accum_gmv` | — | GMV lifetime của store kể từ khi kích hoạt thanh toán. | — |
| `accum_tran` | — | Tổng số giao dịch lifetime của store. | — |
| `monthly_tran` | — | Tổng số giao dịch trong tháng. | — |
| `monthly_gmv` | — | Tổng GMV trong tháng. | — |
| `monthly_user` | — | Tổng số người dùng phân biệt trong tháng. | — |
| `retain_month` | — | Ngày đầu tháng sau, phục vụ cho tính % retention theo tháng. | — |
| `retain_store_code_unique` | — | Giá trị nếu cửa hàng tiếp tục active trong tháng sau. (Private content: Trường dữ liệu có nội dung bao gồm dữ liệu cá nhân) | — |
| `sale_type` | — | Phân loại salesman vào các nhóm (ctv, non_ctv, master merchant). | — |

### `project-5400504384186300846.MBI_DA.DM_OFF_MERCHANT_MONTHLY_PERFORMANCE`
> Bảng này lưu trữ thông tin hiệu suất hàng tháng của các merchant offline tại MoMo. Bảng dimension này bao gồm dữ liệu như tổng số giao dịch hàng tháng, tổng giá trị giao dịch hàng tháng, số lượng cửa hàng hoạt động hàng tháng, quy mô merchant và thông tin địa lý của các merchant. 
Các thông tin có thể được lấy từ bảng này bao gồm: 
- Theo dõi và đánh giá hiệu suất hoạt động hàng tháng của từng merchant. 
- Phân tích xu hướng thị trường theo khu vực địa lý và quy mô merchant. 
- Quản lý và tối ưu hóa hoạt động của merchant theo loại hình M4B và danh mục nhóm.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | — | Tháng liên quan đến dữ liệu hiệu suất. | — |
| `merchant_code` | — | Mã định danh duy nhất cho từng merchant. | — |
| `merchant_name_sl` | — | Tên của merchant theo định dạng đặc biệt. | — |
| `brand_name` | — | Tên thương hiệu của merchant. | — |
| `type_m4b` | — | Loại hình MoMo for Business của merchant. | — |
| `merchant_size` | — | Quy mô của merchant như lớn, trung bình, nhỏ. | — |
| `group_category_sl` | — | Nhóm danh mục của merchant theo định dạng đặc biệt. | — |
| `category_sl` | — | Danh mục của merchant theo định dạng đặc biệt. | — |
| `city_name` | — | Tên thành phố nơi merchant hoạt động. | — |
| `district_name` | — | Tên quận nơi merchant hoạt động. | — |
| `monthly_active_type` | — | Loại hoạt động hàng tháng của merchant. | — |
| `monthly_user` | — | Số lượng người dùng hoạt động hàng tháng của merchant. | — |
| `num_store` | — | Số lượng cửa hàng của merchant. | — |
| `num_active_store` | — | Số lượng cửa hàng hoạt động của merchant hàng tháng. | — |
| `monthly_trans` | — | Tổng số giao dịch của merchant trong tháng. | — |
| `monthly_gmv` | — | Tổng giá trị giao dịch (GMV) của merchant trong tháng. | — |

### `project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_ENTRY_POINT_JOURNEY`
> project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_ENTRY_POINT_JOURNEY là bảng dimension theo dõi hành trình khá nước của các users đã đặt hàng soundbox. Nó bao gồm thông tin chi tiết về tương tác và hành trình của user qua app trước khi thực hiện đơn hàng. 

Các mục đích sử dụng tiềm năng của bảng này:
 -Xác định nguồn gốc của luồng mà các user đã đi qua trước khi đặt đơn hàng
 -Phân tích hành vi của user thông qua số liệu tổng hợp về nhóm nguồn và nguồn cụ thể
 -Theo dõi số lượng đơn hàng và khuyến mãi liên quan đến sản phẩm soundbox

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `agent_id` | — | Mã định danh của user order sản phẩm soundbox | — |
| `id` | — | Mã định danh của một giao dịch đặt đơn hàng, cũng là duy nhất, mang ý nghĩa hệ thống hơn | — |
| `order_number` | — | Mã định danh của một đơn hàng do user đặt, là duy nhất cho mỗi đơn | — |
| `order_date` | — | Ngày order đơn hàng | — |
| `is_promo` | — | Cho biết đơn hàng có sử dụng khuyến mãi hay không, bao gồm: paid (có sử dụng khuyến mãi), organic (không sử dụng khuyến mãi) | — |
| `journey_group_source` | — | Tổng hợp các source (theo level lớn) mà user đi qua trong 30 ngày, trước khi thực hiện order | — |
| `journey_source` | — | Tổng hợp các source (theo level nhỏ) mà user đi qua trong 30 ngày, trước khi thực hiện order | — |
| `last_source` | — | Entry point cuối cùng mà user click dẫn về luồng order inapp, lấy trong window 30 ngày | — |
| `total_click` | — | Tổng số click vào entry point dẫn về luồng inapp ordering của user | — |

### `project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_INAPP_TRANSACTION`
> Bảng này chứa thông tin chi tiết về giao dịch đặt đơn hàng máy soundbox thông qua ứng dụng. Các thông tin có thể được lấy từ bảng này bao gồm:
- Mã và trạng thái của đơn hàng
- Mã định danh của sản phẩm và cửa hàng
- Chi tiết tài chính của đơn hàng, như giá niêm yết, giảm giá và giá thanh toán

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | — | Mã định danh của giao dịch đặt đơn hàng, mang ý nghĩa hệ thống. | — |
| `order_number` | — | Mã định danh của đơn hàng do người dùng đặt, là duy nhất cho mỗi đơn. | — |
| `merchant_id` | — | Mã định danh của merchant ở dạng số, ám chỉ merchant bán sản phẩm, nhưng tất cả giá trị trong bảng đều là null. | — |
| `merchant_code` | — | Mã định danh kí tự chữ và số của merchant, ám chỉ merchant bán sản phẩm mà người dùng mua. | — |
| `store_id` | — | Mã định danh của cửa hàng ở dạng số, ám chỉ cửa hàng bán sản phẩm mà người dùng mua. | — |
| `user_id` | — | Số điện thoại của người dùng mua hàng. | — |
| `agent_id` | — | Mã định danh duy nhất của người dùng mua hàng, có thể chuyển đổi qua lại với số điện thoại của họ. | — |
| `is_deleted` | — | Cột không quan trọng, bỏ qua. | — |
| `status` | — | Trạng thái của đơn hàng, với các giá trị: Order created, Order success/fail, Preparing, Delivering, Completed. | — |
| `is_success` | — | Cho biết đơn hàng đã thanh toán thành công chưa: 1 - thành công, 0 - chưa thành công. | — |
| `payment_status` | — | Trạng thái thanh toán của đơn hàng, với các giá trị: WAITING, CONFIRMED, FAILED, WAITING_FULL_PAYMENT. | — |
| `delivery_status` | — | Trạng thái vận chuyển của đơn hàng, gồm: FINDING_DRIVER, DELIVERED, DELIVERING. | — |
| `original_amount` | — | Giá niêm yết của sản phẩm. | — |
| `pay_amount` | — | Giá mà người dùng phải trả. | — |
| `discount_amount` | — | Giá giảm của sản phẩm. | — |
| `total_amount` | — | Cột không quan trọng, bỏ qua. | — |
| `created_datetime` | — | Thời gian đơn hàng được khởi tạo. | — |
| `created_date` | — | Ngày đơn hàng được khởi tạo. | — |
| `updated_datetime` | — | Thời gian đơn hàng có trạng thái nào đó hoàn thành khi vào luồng inapp ordering. | — |
| `updated_date` | — | Ngày đơn hàng có trạng thái nào đó hoàn thành khi vào luồng inapp ordering. | — |
| `canceled_by` | — | Người hủy đơn hàng. | — |
| `canceled_reason` | — | Lý do hủy đơn hàng. | — |
| `partner_status` | — | Trạng thái từ phía đối tác giao hàng. | — |
| `payment_tid` | — | Mã định danh của giao dịch mua sản phẩm. | — |
| `partner_store_code` | — | Mã định danh kí tự chữ và số của cửa hàng, ám chỉ cửa hàng bán sản phẩm mà người dùng mua. | — |
| `partner` | — | Đối tác bán sản phẩm. | — |
| `quantity` | — | Số lượng sản phẩm được mua trong đơn hàng. | — |
| `price` | — | Giá của mỗi sản phẩm mà người dùng phải trả. | — |
| `order_plan` | — | Loại hình thanh toán của người dùng: Full Payment (thanh toán toàn bộ), Partial Payment (thanh toán trả chậm). | — |
| `product_name` | — | Tên sản phẩm. | — |
| `promo_type` | — | Loại khuyến mãi của người dùng, thể hiện thông qua giá trị khuyến mãi. | — |
| `current_trans` | — | Số lần đặt đơn soundbox của người dùng. | — |
| `user_type` | — | Loại người dùng đối với việc mua sản phẩm soundbox, có 3 giá trị khác nhau. | — |
| `gift_code` | — | Mã khuyến mãi mà người dùng sử dụng. | — |
| `is_promo` | — | Cho biết đơn hàng có sử dụng khuyến mãi hay không: paid (có sử dụng khuyến mãi), organic (không sử dụng khuyến mãi). | — |
| `gender` | — | Giới tính của người dùng mua sản phẩm. | — |
| `age_group` | — | Nhóm tuổi của người dùng mua sản phẩm. | — |
| `city` | — | Thành phố của người dùng mua sản phẩm. | — |
| `region` | — | Vùng của người dùng mua sản phẩm. | — |

## Memory
*31 entries — user-trained knowledge*

1. Khi người dùng yêu cầu MAU, VTS MAU đóng góp được từ các store có soundbox và total SME, hãy sử dụng truy vấn sau để tính toán tất cả các metric trong một lần:
```sql
SELECT
    COUNT(DISTINCT CASE WHEN merchant_size = 'SME OFFLINE' THEN agent_id END) AS MAU_SME,
    COUNT(DISTINCT CASE WHEN merchant_size = 'SME OFFLINE' AND fund_id = 7 THEN agent_id END) AS VTS_MAU_SME,
    COUNT(DISTINCT CASE WHEN soundbox_tran_type_id = 1 THEN agent_id END) AS MAU_SOUNDBOX,
    COUNT(DISTINCT CASE WHEN soundbox_tran_type_id = 1 AND fund_id = 7 THEN agent_id END) AS VTS_MAU_SOUNDBOX
FROM
    `project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION`
WHERE
    TRUE
    AND DATE_TRUNC(date, MONTH) = '2025-06-01'
    AND is_valid_transaction = True
``` _SME OFFLINE PAYMENT · 2025-07-11_
2. Bảng DM_OFF_SOUNDBOX_INAPP_TRANSACTION chỉ chứa thông tin về giao dịch mua soundbox, nên không cần dùng product_name làm điều kiện. _SME OFFLINE PAYMENT · 2025-07-09_
3. Khi người dùng hỏi về MAU hoặc VTS MAU đóng góp từ các store có soundbox, hãy tự động hiểu rằng điều kiện để xác định giao dịch từ store có soundbox là `soundbox_tran_type_id = 1` trong bảng `DM_OFF_TRANSACTION`. Không cần hỏi lại người dùng về điều kiện này. _SME OFFLINE PAYMENT · 2025-07-11_
4. Khi tìm kiếm các giá trị trong cột chuỗi dựa trên yêu cầu của người dùng, hãy sử dụng `LOWER(column_name) LIKE LOWER('%user_input%')` để đảm bảo tìm kiếm không phân biệt chữ hoa chữ thường. Nếu có sự không chắc chắn về thuật ngữ mà người dùng sử dụng (ví dụ: 'notification' so với 'noti'), hãy hỏi lại để xác nhận. _SME OFFLINE PAYMENT · 2025-07-10_
5. Use colors consistently and logically in responses. Green for increasing/high/positive, Red for decreasing/low/negative, and Blue for neutral/normal/unchanged values. _SME OFFLINE PAYMENT · 2025-07-16_
6. Khi đề cập đến merchant SME hay merchant topbrand hãy dùng cột merchant_size, không dùng bất kỳ cột nào khác _SME OFFLINE PAYMENT · 2025-07-15_
7. Để lấy merchant non soundbox, bạn phải lấy tất cả active merchant TRỪ ĐI active soundbox merchant. Cụ thể, để tính MoM retention của Merchant non-soundbox trong tháng 6/2025, sử dụng logic sau:
```sql
WITH mc_sb_active_may AS (
SELECT DISTINCT merchant_code
FROM project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION
WHERE TRUE
AND DATE_TRUNC(date, MONTH) = '2025-05-01'
AND soundbox_tran_type_id = 1
AND is_valid_transaction = True
),
mc_sb_active_june AS (
SELECT DISTINCT merchant_code
FROM project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION
WHERE TRUE
AND DATE_TRUNC(date, MONTH) = '2025-06-01'
AND soundbox_tran_type_id = 1
AND is_valid_transaction = True
),
final_sb AS (
SELECT mc_sb_active_may.merchant_code,
IF(mc_sb_active_june.merchant_code IS NOT NULL, 1, 0) AS is_retain_merchant
FROM mc_sb_active_may
LEFT JOIN mc_sb_active_june
USING(merchant_code)
),

mc_non_sb_active_may AS (
SELECT DISTINCT merchant_code
FROM project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION
WHERE TRUE
AND DATE_TRUNC(date, MONTH) = '2025-05-01'
AND is_valid_transaction = True

EXCEPT DISTINCT 

SELECT DISTINCT merchant_code 
FROM mc_sb_active_may
),
mc_non_sb_active_june AS (
SELECT DISTINCT merchant_code
FROM project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION
WHERE TRUE
AND DATE_TRUNC(date, MONTH) = '2025-06-01'
AND is_valid_transaction = True

EXCEPT DISTINCT 

SELECT DISTINCT merchant_code 
FROM mc_sb_active_june
),
final_non_sb AS (
SELECT mc_non_sb_active_may.merchant_code,
IF(mc_non_sb_active_june.merchant_code IS NOT NULL, 1, 0) AS is_retain_merchant
FROM mc_non_sb_active_may
LEFT JOIN mc_non_sb_active_june
USING(merchant_code)
)

SELECT (COUNT(DISTINCT CASE WHEN final_sb.is_retain_merchant = 1 THEN final_sb.merchant_code END) / COUNT(DISTINCT final_sb.merchant_code)) - (COUNT(DISTINCT CASE WHEN final_non_sb.is_retain_merchant = 1 THEN final_non_sb.merchant_code END) / COUNT(DISTINCT final_non_sb.merchant_code))
FROM final_sb, final_non_sb;
``` _SME OFFLINE PAYMENT · 2025-07-10_
8. User sử dụng domain này thuộc team SME. Khi user hỏi về merchant, hãy hỏi lại để xác nhận xem họ muốn lấy dữ liệu của tất cả merchant hay chỉ SME merchant, vì bảng dữ liệu bao gồm cả SME và TOPBRAND. _SME OFFLINE PAYMENT · 2025-07-14_
9. Khi được hỏi về số máy soundbox được bán ra, hãy sử dụng bảng `project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_INAPP_TRANSACTION` và cột `quantity` để xác định số lượng. _SME OFFLINE PAYMENT · 2025-07-09_
10. Bảng DM_OFF_SOUNDBOX_INAPP_TRANSACTION chỉ đang chứa toàn bộ lượt order của sản phẩm soundbox, với product_name là "LOA THÔNG BÁO CHUYỂN KHOẢN" _SME OFFLINE PAYMENT · 2025-07-09_
11. Nếu cột store_code_unique không dùng được, hãy thay thế bằng CONCAT(merchant_code, store_code) để đếm active store. _SME OFFLINE PAYMENT · 2025-07-14_
12. Bảng DM_OFF_SOUNDBOX_INAPP_TRANSACTION chỉ đang chứa toàn bộ lượt order của sản phẩm soundbox, với product_name là "DM_OFF_SOUNDBOX_INAPP_TRANSACTION " _SME OFFLINE PAYMENT · 2025-07-07_
13. Khi truy vấn số lượng soundbox bán ra, hãy sử dụng SELECT SUM(quantity) as n_soundbox để đặt tên rõ ràng cho metric. _SME OFFLINE PAYMENT · 2025-07-09_
14. Người dùng thực hiện giao dịch thông qua Soundbox InApp có thể là người dùng thực hiện giao dịch ở cửa hàng có soundbox hoặc người thực hiện giao dịch mua soundbox qua kênh bán hàng InApp _SME OFFLINE PAYMENT · 2025-07-10_
15. Trong BigQuery, khi chia hai số nguyên, kết quả sẽ tự động là số thập phân (FLOAT64), nên không cần dùng CAST(column AS FLOAT64) một cách tường minh cho các phép tính trung bình. _SME OFFLINE PAYMENT · 2025-07-09_
16. Khi tìm merchant có GMV cao nhất (hoặc bất kỳ giá trị top N nào), cần sử dụng ORDER BY và LIMIT 1 (hoặc N) để đảm bảo lấy đúng merchant_code và merchant_name tương ứng, thay vì dùng ANY_VALUE. _SME OFFLINE PAYMENT · 2025-07-11_
17. Khi sử dụng bảng DM_OFF_TRANSACTION, luôn thêm điều kiện is_valid_transaction = True để lọc các giao dịch hợp lệ. _SME OFFLINE PAYMENT · 2025-07-09_
18. Khi so sánh số đơn hàng soundbox giữa tháng hiện tại và tháng trước, hãy so sánh cùng kỳ (ví dụ: 10 ngày đầu tháng này với 10 ngày đầu tháng trước) nếu tháng hiện tại chưa kết thúc. Sử dụng query sau để tính toán sự tăng giảm theo last_source:
```sql
declare day_end int64 default extract(day from current_date('+7') - 1);
declare day_start int64 default extract(day from date_trunc(current_date('+7') - 1, month));

with july_order as   
(
  select last_source 
       , count(distinct order_number) as n_orders_july
  from `project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_ENTRY_POINT_JOURNEY`
  where true 
    and extract(day from order_date) between day_start and day_end
    and date_trunc(order_date, month) = '2025-07-01'
  group by all
)

, june_order as    
(
  select last_source 
       , count(distinct order_number) as n_orders_june
  from `project-5400504384186300846.MBI_DA.DM_OFF_SOUNDBOX_ENTRY_POINT_JOURNEY`
  where true 
    and extract(day from order_date) between day_start and day_end
    and date_trunc(order_date, month) = '2025-06-01'
  group by all
)

select july_order.last_source 
     , july_order.n_orders_july 
     , ifnull(june_order.n_orders_june, 0) as n_order_june
     , july_order.n_orders_july - ifnull(june_order.n_orders_june, 0) as change
from july_order 
left join june_order 
  on ((july_order.last_source = june_order.last_source) or (july_order.last_source is null and june_order.last_source is null))
```
Sau đó dựa vào cột 'change' để kết luận tăng hay giảm. _SME OFFLINE PAYMENT · 2025-07-10_
19. Khi người dùng hỏi về việc có tương tác với một nguồn cụ thể (ví dụ: 'có đi qua source là noti'), hãy sử dụng cột `journey_source` thay vì `last_source` để kiểm tra sự tương tác đó. _SME OFFLINE PAYMENT · 2025-07-10_
20. Người dùng domain này thường quan tâm đến những merchant SME. Khi user hỏi về merchant, hãy hỏi lại để xác nhận xem họ muốn lấy dữ liệu của tất cả merchant hay chỉ SME merchant. _SME OFFLINE PAYMENT · 2025-07-11_
21. Khi so sánh số đơn hàng soundbox giữa các tháng, hãy sử dụng IFNULL(last_source, 'unknown') để gán nhãn 'unknown' cho các giá trị NULL trong cột last_source, đảm bảo rằng các đơn hàng không có kênh xác định vẫn được so sánh chính xác giữa các kỳ. _SME OFFLINE PAYMENT · 2025-07-16_
22. Khi user hỏi về merchant, hãy hỏi lại để xác nhận xem họ muốn lấy dữ liệu của tất cả merchant hay chỉ SME merchant. Khi user hỏi về store, hãy hỏi lại để xác nhận xem họ muốn lấy dữ liệu của tất cả store hay chỉ SME store. _SME OFFLINE PAYMENT · 2025-07-14_
23. Hãy cố gắng dùng CTE thay cho subquery để phần code tường minh, dễ hiểu hơn. _SME OFFLINE PAYMENT · 2025-07-14_
24. Query to calculate MOM retention of merchants with soundbox: ```sql
with mc_sb_active_may as   
(
  select distinct merchant_code 
  from `project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION`
  where true 
  and date_trunc(date, month) = '2025-05-01'
  and soundbox_tran_type_id = 1
)

, mc_sb_active_june as   
(
  select distinct merchant_code 
  from `project-5400504384186300846.MBI_DA.DM_OFF_TRANSACTION`
  where true 
  and date_trunc(date, month) = '2025-06-01'
  and soundbox_tran_type_id = 1
)

, final as    
(
  select mc_sb_active_may.merchant_code 
       , if(mc_sb_active_june.merchant_code is not null, 1, 0) as is_retain_merchant
  from mc_sb_active_may
  left join mc_sb_active_june
    using(merchant_code)
)

select count(distinct case when is_retain_merchant = 1 then merchant_code end)/count(distinct merchant_code)
from final
``` _SME OFFLINE PAYMENT · 2025-07-09_
25. Khi truy vấn về nguồn tiền, sử dụng cột fund_id với các giá trị sau: fund_id = 1 cho Ví MoMo, fund_id = 2 cho Ngân hàng liên kết (NHLK), fund_id = 6 cho Túi Thần Tài (TTT), và fund_id = 7 cho Ví Trả Sau (VTS). _SME OFFLINE PAYMENT · 2025-07-09_
26. When a user asks a question with multiple sub-requests, present the result for each sub-request along with its corresponding SQL query for better clarity and transparency. _SME OFFLINE PAYMENT · 2025-07-11_
27. Do not use LIMIT 10 in SQL queries unless explicitly requested by the user. _SME OFFLINE PAYMENT · 2025-07-10_
28. User sử dụng domain này thuộc team SME. Khi user hỏi về merchant, hãy hỏi lại để xác nhận xem họ muốn lấy dữ liệu của tất cả merchant hay chỉ SME merchant, vì bảng dữ liệu bao gồm cả SME và TOPBRAND. _SME OFFLINE PAYMENT · 2025-07-14_
29. Bảng DM_OFF_SOUNDBOX_INAPP_TRANSACTION chỉ đang chứa toàn bộ lượt order của sản phẩm soundbox, với product_name là "MD711" _SME OFFLINE PAYMENT · 2025-07-18_
30. Khi user hỏi về store, hãy hỏi lại để xác nhận xem họ muốn lấy dữ liệu của tất cả store hay chỉ SME store. _SME OFFLINE PAYMENT · 2025-07-14_
31. Khi user hỏi về store, hãy hỏi lại để xác nhận xem họ muốn lấy dữ liệu của tất cả store hay chỉ SME store. _SME OFFLINE PAYMENT · 2025-07-14_
