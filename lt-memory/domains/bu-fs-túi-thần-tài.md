# BU FS: Túi Thần Tài

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.

**Domain ID:** `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11`

## Description
Mô Tả Chi Tiết Domain
- Túi Thần Tài là sản phẩm (miniapp) đầu tư của ứng dụng MoMo, cho người dùng tiên lời mỗi ngày với mức lãi 4% mỗi năm. Điều kiện để nhận lãi là duy trì tối thiểu trên 20 nghìn đồng mỗi ngày. Với số tiền mới nạp thì yêu cầu duy trì trong khoản 2-3 ngày trước khi được tính là hợp lệ để được sinh lời và nhận tiền lãi
- Domain data này sẽ bao gồm metric về Sản phẩm (Traffic) và Business (Doanh thu, hành vi, phân loại user)
- Bảng mart_ttt_daily_user_record  chứa toàn bộ user có sử dụng TTT trong tháng (thỏa điều kiện là MAU hoặc MFU hoặc MAU SOF, hoặc MFU100K hoặc sở hữu Túi+) và chưa bao gồm các user đã đăng kí TTT (tổng 12 triệu hơn users) nhưng đã churn và không sử dụng TTT trong tháng
- Kết hợp bảng mart_ttt_daily_user_record với bảng fact_ttt_traffic_source để giải quyết các câu hỏi về mặt conversion rate hoặc impact từ traffic → hành động hoặc xu hướng của user ảnh hưởng từ hành vì sử dụng app MoMo và TTT
- User túi thần tài được coi là MAU khi có thực hiện bất kì hoặc động "cashin_*" và "cashout_"* trong tháng
- TTT cũng có một dạng MAU tính theo tiêu chuẩn chung của cả app (platform) MoMo gọi là MAU Platform, trong đó, chỉ tính user thực hiện cashin thuần, cashout thuần , và cashout từ quỹ nhóm (cashout_mp_). Đây là những loại giao dịch hợp lệ theo logic chuẩn của Platform vì dòng tiền sẽ đi qua lại giữa TTT và ví MoMo dưới định danh special_project = 'Money Market Fund'
- Với tất cả segment phân loại user như mau_type, mfu_type hay bal_group, etc. thì nhóm Churn có nghĩa là những user không có thực hiện hoặc thuộc phân loại của nhóm segment đó tại tháng đang xét (mau_type, plus_type, mfu_type, mfu100k_type, mau_sof_type) hoặc tính tới ngày đang xét (đối với int_group) hoặc tại ngày đang xét (đối với bal_group)
- Nếu người mới sử dụng hoặc hỏi về cách dùng Chat bot MiMir thì hãy gửi họ đường link này để dẫn tới document nội bộ ở Confluence về MiMir của Túi Thần Tài: https://atlassiantool.mservice.com.vn:9443/pages/viewpage.action?pageId=198333959
- Nếu người dùng hỏi nhờ tìm một giá trị thông tin cụ thể trong data, hãy xét dùng lower(tên cột) và so với giá trji không in hoa của thông tin người dùng nhập vào để đạt được chính xác cao nhất 
* Lưu ý cực kì quan trọng:
- Ngoại trừ metric và câu hỏi liên quan tới MFU và MFU100K, tất cả tính toán về số lượng unique user chỉ được đếm theo ID của user sử dụng câu code COUNT(DISTINCT (cast(REGEXP_EXTRACT(USER_ID, r'\d+') as string)) 
- AUM (Asset Under Management): Tổng số dư đang quản lý. AUM hàng tháng của TTT là tổng số dư (Balance) của tất cả User cá nhân (Individual) và User quỹ nhóm (Money Pool) . AUM được tính tổng  vào ngày cuối cùng mỗi tháng hoặc tại ngày hôm qua nếu đang xét AUM của tháng hiện tại
- Mặc đính luôn Group by IS_MP ở tất cả câu hỏi về metric và ghi chú "Số liệu được phân loại theo nhóm User cá nhân (Individual) và quỹ nhóm (Money Pool" để người dùng biết được performance của 2 tập người dùng chính của TTT
- cashout_gmv/cashout_trans và cashin_gmv/cashin_trans chỉ là metric tính cashout thuần và cashin thuần, nếu được hỏi về tính tổng gmv cashout/cashin hoặc tổng gmv mức nạp rút TTT thì phải cộng hết giá trị của tất cả cột có prefix là cashout_ và cashin_ 
Cách tinh tổng mức cashout/ cashin : 
   + Tổng cashin (nạp): coalesce(cashin_gmv, 0)+coalesce(cashin_p2p_gmv,0)+coalesce(cashin_va_gmv,0)+coalesce(cashin_ai_gmv,0)+coalesce(cashin_stock_gmv,0)+coalesce(cashin_payout_gmv,0) as total_cashin_gmv
   + Tổng cashout(rút): coalesce(cashout_napas_gmv,0) + coalesce(cashout_payment_gmv,0) + coalesce(cashout_gmv,0) + coalesce(cashout_stock_gmv,0) + coalesce(cashout_p2p_gmv, 0) + coalesce(cashout_mp_gmv,0) + coalesce(cashout_payment_mp_gmv,0) as total_cashout_gmv
   + Lưu ý: phải group by có is_mp để phân loại user cá nhân và quỹ nhóm khi tính tổng
   + Người dùng TTT được cho là không thuộc một tập hoặc Churn MFU/MAU/MFU100K/MAU SOF/Túi+ khi và chỉ khi họ không thuộc tập đó ở tất cả các ngày trong tháng, vì vậy nếu được hỏi như "số lượng người dùng không phải MFU trong tháng 11/2025" thì có nghĩa là bạn phải lấy toàn bộ user có record trong tháng 11 và loại đi tập user LÀ NGƯỜI DÙNG MFU của tháng 11

## Tables (3 tables)

### `momovn-prod.BU_FI.fact_ttt_event_tracking`
> <p><strong>TABLE_NAME</strong>: fact_ttt_event_tracking<br><strong>BUSINESS_PURPOSE</strong>: &gt;<br>Bảng ghi nhận thông tin thao tác của người dùng vào Miniapp Túi Thần Tài (TTT) (service_name = 'investment_goldenpocket') trên ứng dụng MoMo. <br>Mỗi dòng tương ứng với một event thể hiện hành động của một user được định danh bằng event_id và event name. Với mỗi user có thể có rất nhiều record event id mỗi ngày <br>Bảng bao gồm thông tin hành động của user như nút bấm, touchpoint, screen name, thời gian, tên nút bấm, app version, ... nhân khẩu học (tuổi, giới tính, khu vực), <br>và phân khúc user theo hành vi, sở hữu Túi+, giá trị trung bình, v.v.</p><p><strong>USE_CASES</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Thực hiện truy xuất ( Scalar Queries) cụ thể theo từng event_name, trail_id, key value param</p></li><li class="om-leading-normal"><p>Phân tích action thao tác của user ở Miniapp TTT theo ngày, tuần, tháng</p></li><li class="om-leading-normal"><p>Tính số lượng unique user thao tác ở TTT, so sánh theo nguồn và thời gian</p></li><li class="om-leading-normal"><p>Phân tích mức độ đóng góp của các event, thao tác, nút bấm, màn hình , component ... để xác định tổng thể về hành vi của user khi truy cập TTT</p></li><li class="om-leading-normal"><p>Kết hợp với bảng <code>mart_ttt_daily_user_record (dùng key user_id và grass_date)</code> và fact_ttt_traffic_source (dùng key user_id và grass_date hoặc map trail_id ở fact_ttt_traffic_source với event_id của fact_ttt_event_tracking để thể hiện được journey hành động user sau khi có traffic vào TTT hoặc Túi+) để tính được conversion thao tác của user từ traffic vào TTT hoặc conversion từ thao tác tới các hành động giao dịch</p></li></ul><p><strong>TIME_GRAIN</strong>: daily<br><strong>FACT_TYPE</strong>: event/product interaction fact<br><strong>PRIMARY_KEY</strong>: trail_id</p><p><strong>PARTITION BY: </strong>grass_date</p><p><strong>CLUSTER BY: </strong>event_name, screen_name, key, user_id<br><strong>SEGMENTS_SUPPORTED</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>mfu_type, plus_segment, plus_segment_engage_type</p></li><li class="om-leading-normal"><p>traffic_source, is_plus_home</p></li><li class="om-leading-normal"><p>age_group, gender, region</p></li><li class="om-leading-normal"><p>balance group, interest group<br><strong>NOTE</strong>:</p></li><li class="om-leading-normal"><p>Bắt buộc mỗi Query đều phải ràng điều kiện GRASS_DATE, EVENT_NAME/SCREEN_NAME/KEY</p></li><li class="om-leading-normal"><p>Metric về tương tác của mỗi khách hàng sẽ có 2 dạng: Lượt tương tác tính bằng unique event_id của mỗi loại event_name và Người dùng có truy cập (user) tính bằng unique user_id</p></li><li class="om-leading-normal"><p>Giới hạn điều kiện filter cho queries là range grass_date có tối đa 15 ngày</p></li><li class="om-leading-normal"><p>Vì mỗi user có thể có nhiều hành động mỗi ngày và số dòng record mỗi user_id ở bảng <strong>fact_ttt_event_tracking </strong>là rất nhiều nên khi join với bảng <code>mart_ttt_daily_user_record sẽ cần lưu ý tránh việc làm duplicate data bảng mart_ttt_daily_user_record dẫn tới SUM() duplicate các metric liên quan tới tổng GMV, TRANS của user</code></p><p></p><p></p></li></ul><p></p>

| Column | Type | Description |
|--------|------|-------------|
| `grass_date` | date | <p>Ngày có truy cập (traffic) của user vào Miniapp Túi Thần Tài hoặc Túi+, format dưới dạng YYYY-MM-DD</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>: Data từ bảng sẽ có range lưu record trong 2 năm, nhưng cần giới hạn tố đa 3 tháng với mỗi Query hoặc chỉ load ... |
| `grass_datetime` | datetime | <p>Ngày giờ cụ thể có truy cập (traffic) của user vào Miniapp Túi Thần Tài hoặc Túi+, format dưới dạng YYYY-MM-DD HH:MM:SS</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>: Data từ bảng sẽ có range lưu record trong 2 năm, nhưng cần giới hạn tố đa 3 tháng với mỗi ... |
| `user_id` | string | <p>Mã định danh người dùng MoMo có truy cập Miniapp TTT</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>COUNT(DISTINCT user_id) để để đếm số unique user có traffic vào TTT/ Túi+ (Số người dùng độc nhấ... |
| `device_os` | string | <p>Hệ điều hành mà thiết bị di động (điện thoại) của user sử dụng</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Ví dụ</strong>: 'IOS'</p></li><li class="om-leading-normal"><p><strong>Tags</strong>: User Device</p></li></ul><p></p> |
| `app_version` | string | <p>Mã version của ứng dụng MoMo (Momo app version) </p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Tags</strong>: App Key</p></li></ul><p></p> |
| `trail_id` | string | <p>Mã định danh 1 hành động của user khi truy cập miniapp TTT </p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note:</strong></p><ul class="om-list-disc"><li class="om-leading-normal"><p>trong một trail_id là unique đại diện cho 1 action cụ thể được user thực hiện và action đ... |
| `event_name` | string | <p>Tên định danh 1 hành động của user khi truy cập một miniapp hoặc app_id bất kì.</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note:</strong></p><ul class="om-list-disc"><li class="om-leading-normal"><p>trail_id có mối quan hệ 1-1 với event_name</p></li><li class="om-lead... |
| `screen_name` | string | — |
| `component_name` | string | — |
| `block_name` | string | — |
| `tab_name` | string | — |
| `icon_name` | string | — |
| `button_name` | string | — |
| `field_name` | string | — |
| `schema_version` | string | — |
| `key` | string | <p>Tên định danh 1 parameter (params/param) thông tin chi tiết hơn của mỗi event</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note:</strong></p><ul class="om-list-disc"><li class="om-leading-normal"><p>1 event_id và event_name sẽ có nhiều key (param) trong nó, chúng có mối... |
| `value` | string | <p>Value của param ở mỗi event hành động</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Value sẽ ghi thông tin record cụ thể của 1 param key ngay tại lúc user thực hiện hành động với mỗi event_name/ ... |
| `grass_month` | date | <p>Tháng tương ứng của truy cập, dùng để phân tích theo tháng, luôn trả về ngày đầu tiên mỗi tháng và được format dưới dạng YYYY-MM-DD</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Sample Value</strong>: ['2025-06-01', '2025-05-01']</p></li><li class="om-leading-normal"><p>... |
| `mfu_type` | string | <p>Monthly Funded User (MFU) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trong Túi Thần Tài và nhận lãi ngày mỗi tháng</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Một us... |
| `mfu100k_type` | string | <p>Monthly Funded User 100k (MFU100k) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trung bình tháng tối thiểu 100k VND hoặc có tổng tiền nạp tháng đó từ 100k VND</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-dis... |
| `plus_type` | string | — |
| `plus_segment` | string | — |
| `plus_segment_engage_type` | string | — |
| `mau_type` | string | — |
| `mau_sof_type` | string | — |
| `int_group` | string | — |
| `bal_group` | string | — |
| `avg_bal_group` | string | — |
| `region` | string | — |
| `gender` | string | — |
| `age_group` | string | — |

### `momovn-prod.BU_FI.fact_ttt_traffic_source`
> **TABLE_NAME**: fact_ttt_traffic_source
**BUSINESS_PURPOSE**: >
  Bảng ghi nhận thông tin truy cập (traffic) của người dùng vào Miniapp Túi Thần Tài (TTT) và Túi Thần Tài Plus (Túi+) trên ứng dụng MoMo. 
  Mỗi dòng tương ứng với một lượt truy cập (session/event) của một user vào một ngày, từ một nguồn traffic (nguồn truy cập - điểm đứng của user trước khi vào TTT/ TÚI+). 
  Bảng bao gồm thông tin nguồn truy cập, loại màn hình truy cập (Túi thường/Túi+), nhân khẩu học (tuổi, giới tính, khu vực), 
  và phân khúc user theo hành vi, sở hữu Túi+, giá trị trung bình, v.v.

**USE_CASES**:
  - Phân tích nguồn traffic vào Miniapp TTT theo ngày, tuần, tháng
  - Tính số lượng unique user truy cập vào TTT, so sánh theo nguồn và thời gian
  - Phân tích mức độ đóng góp vào traffic (lượt và người dùng) của tính năng (noti, tabbar, và  các entry point như lịch sử giao dịch, chat...)  hoặc miniapp nguồn vào  TTT/Túi+
  - So sánh hành vi truy cập giữa nhóm user có sở hữu Túi+ và không sở hữu Túi+
  - Phân tích retention hoặc mức độ quay lại của mỗi user có truy cập theo ngày/ tuần/ tháng
  - Kết hợp với bảng `mart_ttt_daily_user_record` để tính được conversion từ traffic vào TTT tới các hành động giao dịch

**TIME_GRAIN**: daily
**FACT_TYPE**: session/traffic fact
**PRIMARY_KEY**: (user_id + trail_id)
**SEGMENTS_SUPPORTED**:
  - mfu_type, plus_segment, plus_segment_engage_type
  - traffic_source, is_plus_home
  - age_group, gender, region
  - balance group, interest group
**NOTE**:
  - Metric về lượt truy cập của mỗi khách hàng sẽ có 2 dạng: Lượt truy cập (traffic) tính bằng  unique trail_id và Người dùng có truy cập (user) tính bằng unique user_id
  - Giới hạn load data tối đa 3 tháng mỗi Queries, trừ khi có yêu cầu rõ ràng các điều kiện ràng buộc và aggregate
  - Self Join bảng với điều kiện  t2.USER_ID = t1.USER_ID AND t1.GRASS_DATE = DATE_SUB(t2.GRASS_DATE, INTERVAL 1 DAY) và  COUNT(DISTINCT user_id) để lấy số lượng user có truy cập ở ngày/tuần/tháng trước và có quay lại hôm nay và chia cho tổng số lượng user ở ngày/tuần/tháng trước để tính tỉ lệ giữ chân ngày qua ngày của mỗi user (retention rate daily), 
      - Thay bằng grass_month để tính tháng qua tháng và date_trunc(grass_date, week(sunday)) để tính tỉ lệ tuần qua tuần

| Column | Type | Description |
|--------|------|-------------|
| `grass_date` | date | Ngày có truy cập (traffic) của user vào Miniapp Túi Thần Tài hoặc Túi+, format dưới dạng YYYY-MM-DD - **Note**: Data từ bảng sẽ có range lưu record trong 2 năm, nhưng cần giới hạn tố đa 3 tháng với mỗi Query hoặc chỉ load fulltime khi aggreate và ràng điệu kiện kĩ để tránh trường hợp load toàn bộ... |
| `grass_month` | date | Tháng tương ứng của truy cập, dùng để phân tích theo tháng, luôn trả về ngày đầu tiên mỗi tháng và được format dưới dạng YYYY-MM-DD - **Sample Value**: ['2025-06-01', '2025-05-01'] - **Tags**: Time, Month Grain |
| `mfu_type` | string | Monthly Funded User (MFU) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trong Túi Thần Tài và nhận lãi ngày mỗi tháng - **Note**:      - Một user được coi là 1 MFU khi họ được nhận lãi ít nhất 1 lần trong tháng     - Điều kiện nhận lãi là phải duy trì số dư trong Túi Thần... |
| `mfu100k_type` | string | Monthly Funded User  100k (MFU100k) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trung bình tháng tối thiểu 100k VND hoặc có tổng tiền nạp tháng đó từ 100k VND - **Note**:      - Một user được phân loại là 1 MFU100k khi họ được nhận lãi ít nhất 1 lần trong tháng và duy t... |
| `plus_type` | string | Plus Type phân loại user theo mức độ engage của họ trong việc sở hữu đặc quyền Túi + hàng tháng - **Note**:      - Túi+ là một version nâng cấp của TTT với rất nhiều quyền lợi cộng dồn dành cho 1 nhóm user thỏa điều kiện hàng tháng     - Túi+ xuất hiện từ tháng 8/2024     - User có thể sở hữu Túi... |
| `plus_segment` | string | <p>Plus Segment phân loại user theo cách mà họ thỏa điều kiện để sở hữu Túi+ hàng tháng</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Túi+ là một version nâng cấp của TTT với rất nhiều quyền lợi cộn... |
| `plus_segment_engage_type` | string | Plus Segment Engage Type phân loại user theo mức độ engage của họ đối với mỗi cách làm mà họ đã thực hiện để sở hữu đặc quyền Túi + hàng tháng - **Note**:      - Túi+ là một version nâng cấp của TTT với rất nhiều quyền lợi cộng dồn dành cho 1 nhóm user thỏa điều kiện hàng tháng     - Túi+ xuất hi... |
| `mau_type` | string | Monthly Active User (MAU) Type phân loại user theo mức độ engage của họ trong việc có thực hiện ít nhất 1 lần tạo ra biến động cho số dư Túi Thần Tài - **Note**:      - Một user được coi là 1 MAU khi họ thực hiện ít nhất 1 lần các loại giao dịch sau trong tháng, và giao dịch này là chủ động nên s... |
| `mau_sof_type` | string | Monthly Active User Source Of Fund (MAU SOF) Type phân loại user theo mức độ engage của họ trong việc có thực hiện ít nhất 1 lần tạo ra biến động cho số dư Túi Thần Tài thuộc nhóm giao dịch sử dụng nguồn tiền Túi Thần Tài - **Note**:      - Túi Thần Tài ngoài việc là sản phẩm tiết kiệm trả lãi th... |
| `int_group` | string | Phân loại user theo theo tổng mức tiền lãi (interest) nhận được trong tháng Grass_month đang xét - **Note**:     - Mức Lãi của TTT dành cho user duy trì số dư cho tới ngày 2025-07-11 là 4% mỗi năm, TTT sẽ chia mức lãi 4% cho 365 ngày để ra % mỗi ngày và làm hệ số cho tổng số dư duy trì - **Sample... |
| `bal_group` | string | Phân loại user theo số dư TTT hiện tại cho tới cuối ngày Grass date đang xét. - **Note**:      - TTT sẽ chốt số dư mà user duy trì vào mỗi cuối ngày lúc 11h45 tối - **Sample Value**:     -  [0]Churn: Không có số dư     - [1](0-300k]     - [2](300k-3TR]     - [3](3TR-30TR]     - [4](30TR-50TR]    ... |
| `avg_bal_group` | string | Phân loại user theo số dư trung bình TTT  trong tháng Grass_month đang xét - **Note**:      - TTT sẽ chốt số dư mà user duy trì vào mỗi cuối ngày lúc 11h45 tối - **Sample Value**:     -  [0]Churn: Không có số dư     - [1](0-300k]     - [2](300k-3TR]     - [3](3TR-30TR]     - [4](30TR-50TR]     - ... |
| `region` | string | Vùng địa lý của người dùng, ánh xạ theo tỉnh/thành phố. - **Sample value**:     - Hà Nội, Hồ Chí Minh (tách riêng)     - Vùng trung du và miền núi phía Bắc     - Vùng đồng bằng sông Hồng     - Vùng Bắc Trung Bộ và duyên hải miền Trung     - Vùng Tây Nguyên     - Vùng Đông Nam Bộ     - Vùng đồng b... |
| `gender` | string | Giới tính của người dùng lấy từ bảng demographic chuẩn nội bộ. - **Sample value**: male, female, unknown - **Tags**: Demographic |
| `age_group` | string | Nhóm tuổi của người dùng được tính từ năm sinh so với năm hiện tại trong trong Grass Month. - **Sample value**:     - 1. Age Below 22     - 2. Age 23–27     - 3. Age 28–35     - 4. Age 36–50     - 5. Age Above 50     - **unknown **nếu không có thông tin năm sinh (YOB) - **Tags**: Demographic |
| `traffic_source` | string | Nguồn truy cập vào TTT/Túi+, value là tên/ feature code được định danh của các tính năng trên momo và tại đó có các CTA/ Nút bấm mà direct user vào TTT/ TÚI+ - Ví dụ một số feature code nổi bật     - tabbar_home: home landing của app momo     - investment_goldenpocket: home của TTT , nếu traffic ... |
| `user_id` | string | Mã định danh người dùng MoMo có truy cập Miniapp TTT - **Note**:     - COUNT(DISTINCT user_id) để để đếm số unique user có traffic vào  TTT/ Túi+ (Số người dùng độc nhất truy cập vào TTT/TÚI+)   - **Tags**: User Key |
| `trail_id` | string | Mã session/event thể hiện lượt truy cập. Mã này sẽ unique theo mỗi user_id, với 1 record sẽ tính là 1 lần user thực hiện truy cập vào TTT/TÚI+ - **Note**:     - COUNT(DISTINCT Trail_id) để dếm số lượt truy cập - **Tags**: Session, Event ID |
| `is_plus_home` | string | Dùng để xác định màn hình đích đến mà user truy cập:     -  investment_goldenpocket (TTT)      - investment_goldenpocket_plus_home (Túi+) - Tags: Screen, TTT vs TTT+ |
| `appId` | string | Mã code của Mini App tương ứng với nguồn truy cập. (cross miniapp). Vì mỗi Mini App sẽ có 1 hoặc nhiều feature code và ngược lại, cho nên  nếu kết hợp giá trị entry point là traffic_source (lấy từ feature code) và appid thì sẽ cho biết cụ thể user truy cập TTT/ TÚI+ từ miniapp nào, ở feature nào ... |

### `momovn-prod.BU_FI.mart_ttt_daily_user_record`
> <p><strong>TABLE_NAME</strong>: mart_ttt_daily_record - Bảng Mart <br><strong>PARTITION and CLUSTER</strong>: Partition by GRASS_DATE, cluster by USER_ID, MAU_TYPE, MFU_TYPE, PLUS_TYPE<br><strong>BUSINESS_PURPOSE</strong>: &gt;<br>Bảng ghi lại trạng thái hoạt động, hành vi tài chính và các chỉ số liên quan của user trong hệ sinh thái Túi Thần Tài (TTT) theo ngày và chỉ record những user có sử dụng (bảo gồm MAU/MFU/Plus user, các user inactive sẽ ko có thông tin trong ngày hôm đó). <br>Bao gồm CI, CO, GMV, AUM, Interest, MFU, Plus segmentation... mỗi dòng đại diện cho 1 user trong 1 ngày.</p><p>Ngoài ra, bảng này có thể được sử dụng để tính <strong>retention rate theo ngày/tuần/tháng</strong> với logic như sau:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Self Join bảng với điều kiện t2.USER_ID = t1.USER_ID AND t1.GRASS_DATE = DATE_SUB(t2.GRASS_DATE, INTERVAL 1 DAY) và COUNT(DISTINCT user_id) để lấy số lượng user có truy cập ở ngày/tuần/tháng trước và có quay lại hôm nay và chia cho tổng số lượng user ở ngày/tuần/tháng trước để tính tỉ lệ giữ chân ngày qua ngày của mỗi user (retention rate daily),</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Thay bằng Date_trunc(grass_Date,month) để tính tháng qua tháng và date_trunc(grass_date, week(sunday)) để tính tỉ lệ tuần qua tuần</p></li></ul></li><li class="om-leading-normal"><p>Với các cột metric (đơn vị <code>_gmv</code>, <code>_trans</code>): nếu giá trị &gt; 0 thì user có phát sinh hành động tương ứng tại <code>grass_date</code></p></li><li class="om-leading-normal"><p>Với các cột phân loại segment (như <code>mfu_type</code>, <code>plus_type</code>, <code>plus_segment</code>, <code>mau_type</code>, <code>is_cashback</code>,...): nếu khác <code>'0.Churn'</code> hoặc <code>'None'</code> thì user được xem là <strong>active</strong> theo segment đó tại ngày <code>grass_date</code> đang xét</p></li></ul><p><strong>USE_CASES</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Tính số người dùng có giao dịch (active) TTT (MAU), có nhận lãi (MFU) , tính số dư (balance) mỗi user hoặc tổng số dư tài sản của một nhóm user (AUM), lượng tiền/ giao dịch Cashin Cashout, Interest theo ngày/tuần/tháng</p></li><li class="om-leading-normal"><p>Phân loại hành vi user theo MAU, MFU, MAU SOF, MFU100K, user Plus (sở hữu Túi+) và cách họ thỏa điều kiện sở hữu Túi+</p></li><li class="om-leading-normal"><p>So sánh tài chính, CI/CO giữa user cá nhân (is_mp = 'Individual') và tài khoản nhóm (is_mp = 'Money Pool')</p></li><li class="om-leading-normal"><p>Phân tích hành vi gắn với benefit của Túi+: cashback 0.1%, stockback, wheel88, miễn phí rút tiền qua tài khoản ngân hàng 100 triệu/ tháng (cashout Napas)</p></li><li class="om-leading-normal"><p>Kết hợp với bảng <code>fact_ttt_traffic_source</code> để tính conversion rate từ traffic → hành động</p></li><li class="om-leading-normal"><p>Tính retention rate theo bất kỳ phân loại segment hoặc metric nào (chỉ cần so sánh cột có giá trị tại mốc thời gian)</p></li></ul><p><strong>TIME_GRAIN</strong>: daily<br><strong>FACT_TYPE</strong>: behavioral fact<br><strong>PRIMARY_KEY</strong>: user_id + grass_date<br><strong>SEGMENTS_SUPPORTED</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>plus_type, plus_segment</p></li><li class="om-leading-normal"><p>mfu_type, mfu100k_type</p></li><li class="om-leading-normal"><p>mau_type, mau_sof_type</p></li><li class="om-leading-normal"><p>int_group, bal_group, avg_bal_group</p></li><li class="om-leading-normal"><p>is_cashback, is_stockback, is_wheel, is_tkol8m</p></li><li class="om-leading-normal"><p>demographic (age_group, gender, region)</p></li></ul><p><strong>NOTE</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Chỉ nên sử dụng filter is_mp = 'Individual' khi phân tích người dùng cá nhân (không tính tài khoản quỹ nhóm)</p></li><li class="om-leading-normal"><p>Khi truy vấn có liên quan đến tài khoản nhóm (Money Pool), cần filter is_mp = 'Money Pool'</p></li><li class="om-leading-normal"><p>Liên hỏi và cân nhắc với user/stakholder rằng có liệu có nên tính user quỹ nhóm vào Metric hay không</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Nếu có tính user có ID Qũy nhóm (chứa keyword 'mp_') thì:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Số lượng user là MFU : Mỗi id quỹ nhóm được coi là 1 user độc lập và không overlap lẫn nhau , nên 1 user có thể vừa là MFU TTT cá nhân và MFU TTT theo quỹ nhóm và ta tính là 2 user</p></li><li class="om-leading-normal"><p>MAU metric: Mỗi id quỹ nhóm và người chủ quỹ sẽ được coi là 1 người độc nhất và có overlap lẫn nhau , nên 1 user chỉ được tính là 1 MAU TTT cho dù họ thỏa điều kiện làm MAU ở cả TTT Cá nhân (Individual) và Qũy nhóm (Money Pool)</p></li><li class="om-leading-normal"><p>Đối với cần tính số liệu unique user theo level(mức độ) ID của user cá nhân (người dùng độc nhất) để chỉ xét ID của chủ quỹ mà không trùng lặp, ta dùng COUNT(DISTINCT (cast(REGEXP_EXTRACT(USER_ID, r'\d+') as string)) để tính đúng số user độc nhất vì mỗi user có thể có nhiều id quỹ nhóm (có chứa keyword 'mp') nhưng mỗi quỹ nhóm chỉ có 1 ID chủ quỹ unique tương ứng với user_id(chỉ có kí tự số, không chứa mp) hoặc GROUP BY IS_MP để phân loại rõ metric cho nhóm Individual hay Money Pool</p></li></ul></li></ul></li><li class="om-leading-normal"><p>Giới hạn load data tối đa 3 tháng mỗi Queries, trừ khi có yêu cầu rõ ràng các điều kiện ràng buộc và aggregate</p></li><li class="om-leading-normal"><p>AUM (Asset Under Management): Tổng số dư đang quản lý. AUM hàng tháng của TTT là tổng số dư (Balance) của tất cả User đang duy trì số dư TTT vào ngày cuối cùng mỗi tháng (hoặc ngày Hôm qua nếu chưa hết tháng)</p></li><li class="om-leading-normal"><p>User có Active MoMo nói chung khi trong tháng có ít nhất 1 giao dịch MoMo payment hoặc p2p -&gt; Để xác đình User là active MoMo (A30) , ta xét điều kiện với câu lệnh: COALESCE(momo_payment_trans,momo_p2p_trans,0) &gt; 0</p></li><li class="om-leading-normal"><p>Tổng tiền nạp (cashin) vào TTT sẽ tính bảng tổng các cột :  cashin_gmv, cashin_p2p_gmv, cashin_va_gmv, cashin_ai_gmv, cashin_stock_gmv, cashin_payout_gmv, cashin_mp_gmv, cashin_mp_active_gmv</p></li><li class="om-leading-normal"><p>Tổng tiền rút (cashout) ra khỏi TTT sẽ tính bảng tổng các cột : cashout_payment_mp_gmv, cashout_mp_gmv, cashout_gmv, cashout_napas_gmv, cashout_stock_gmv, cashout_payment_gmv, cashout_p2p_gmv</p></li><li class="om-leading-normal"><p>Netcash được tính bằng: Tổng tiền nạp (cashin) vào TTT  - Tổng tiền rút (cashout) ra khỏi TTT</p></li></ul><p></p>

| Column | Type | Description |
|--------|------|-------------|
| `grass_date` | date | Ngày ghi nhận dữ liệu người dùng TTT, format dưới dạng YYYY-MM-DD - **Note**: Data từ bảng sẽ có range lưu record trong 2 năm, nhưng cần giới hạn tố đa 3 tháng với mỗi Query hoặc chỉ load fulltime khi aggreate và ràng điệu kiện kĩ để tránh trường hợp load toàn bộ cột raw full timeline - **Sample ... |
| `user_id` | string | Mã định danh người dùng TTT  - **Note**:     - COUNT(DISTINCT user_id) để để đếm số unique user TTT theo các segment và record được lưu trữ - **Tags**: User Key |
| `mau_type` | string | Monthly Active User (MAU) Type phân loại user theo mức độ engage của họ trong việc có thực hiện ít nhất 1 lần tạo ra biến động cho số dư Túi Thần Tài - **Note**:      - Một user được coi là 1 MAU khi họ thực hiện ít nhất 1 lần các loại giao dịch sau trong tháng, và giao dịch này là chủ động nên s... |
| `mau_sof_type` | string | Monthly Active User Source Of Fund (MAU SOF) Type phân loại user theo mức độ engage của họ trong việc có thực hiện ít nhất 1 lần tạo ra biến động cho số dư Túi Thần Tài thuộc nhóm giao dịch sử dụng nguồn tiền Túi Thần Tài - **Note**:      - Túi Thần Tài ngoài việc là sản phẩm tiết kiệm trả lãi th... |
| `mfu_type` | string | Monthly Funded User (MFU) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trong Túi Thần Tài và nhận lãi ngày mỗi tháng - **Note**:      - Một user được coi là 1 MFU khi họ được nhận lãi ít nhất 1 lần trong tháng     - Điều kiện nhận lãi là phải duy trì số dư trong Túi Thần... |
| `int_group` | string | Phân loại user theo theo tổng mức tiền lãi (interest) nhận được trong vòng 30 ngày vừa qua, tính tới ngày Grass Date đang xét - **Note**:     - Mức Lãi của TTT dành cho user duy trì số dư cho tới ngày 2025-07-11 là 4% mỗi năm, TTT sẽ chia mức lãi 4% cho 365 ngày để ra % mỗi ngày và làm hệ số cho ... |
| `bal_group` | string | <p>Phân loại user theo số dư TTT hiện tại cho tới cuối ngày Grass date đang xét.</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>TTT sẽ chốt số dư mà user duy trì vào mỗi cuối ngày lúc 11h45 tối</p></... |
| `cashin_trans` | string | — |
| `cashin_p2p_trans` | string | — |
| `cashin_va_trans` | string | — |
| `cashin_ai_trans` | string | — |
| `cashin_stock_trans` | string | — |
| `cashin_payout_trans` | string | — |
| `cashout_trans` | string | — |
| `cashout_napas_trans` | string | — |
| `cashout_stock_trans` | string | — |
| `cashout_payment_trans` | string | — |
| `cashout_p2p_trans` | string | — |
| `cashin_gmv` | string | — |
| `cashin_p2p_gmv` | string | — |
| `cashin_va_gmv` | string | — |
| `cashin_ai_gmv` | string | — |
| `cashin_stock_gmv` | string | — |
| `cashin_payout_gmv` | string | — |
| `cashout_gmv` | string | — |
| `cashout_napas_gmv` | string | — |
| `cashout_stock_gmv` | string | — |
| `cashout_payment_gmv` | string | — |
| `cashout_p2p_gmv` | string | — |
| `interest` | string | — |
| `balance` | string | — |
| `interest_base_amount` | string | — |
| `avg_balance` | string | — |
| `dci_balance` | string | — |
| `convert_interest_trans` | string | — |
| `convert_interest_gmv` | string | — |
| `cashin_mp_gmv` | string | — |
| `cashin_mp_active_gmv` | string | — |
| `cashout_payment_mp_gmv` | string | — |
| `cashin_mp_trans` | string | — |
| `cashin_mp_active_trans` | string | — |
| `cashout_payment_mp_trans` | string | — |
| `cashout_mp_gmv` | string | — |
| `cashout_mp_trans` | string | — |
| `avg_bal_group` | string | <p>Phân loại user theo số dư trung bình TTT trong vòng 30 ngày qua , xét từ ngày Grass_date đang xét, và đây không phải phân loại số dư trung bình tháng</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p... |
| `plus_type` | string | Plus Type phân loại user theo mức độ engage của họ trong việc sở hữu đặc quyền Túi + hàng tháng - **Note**:      - Túi+ là một version nâng cấp của TTT với rất nhiều quyền lợi cộng dồn dành cho 1 nhóm user thỏa điều kiện hàng tháng     - Túi+ xuất hiện từ tháng 8/2024     - User có thể sở hữu Túi... |
| `plus_segment` | string | <p>Plus Segment phân loại user theo cách mà họ thỏa điều kiện để sở hữu Túi+ hàng tháng</p><ul class="om-list-disc"><li class="om-leading-normal"><p><strong>Note</strong>:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>Túi+ là một version nâng cấp của TTT với rất nhiều quyền lợi cộn... |
| `is_mp` | string | Phân loại tài khoản là quỹ nhóm hay cá nhân, dùng để đánh giá impact của sản phẩm quỹ nhóm lên TTT  **Default Value**: Mặc định luôn filter is_mp = 'Individual'  **Sample Value for Filter**: Individual, Money Pool **NOTE**: - Khi được hỏi về Quỹ Nhóm thì mới truy vấn có liên quan đến tài khoản nh... |
| `mfu100k_type` | string | Monthly Funded User  100k (MFU100k) Type phân loại user theo mức độ engage của họ trong việc duy trì số dư trung bình tháng tối thiểu 100k VND hoặc có tổng tiền nạp tháng đó từ 100k VND - **Note**:      - Một user được phân loại là 1 MFU100k khi họ được nhận lãi ít nhất 1 lần trong tháng và duy t... |
| `total_cashback_gmv` | string | — |
| `total_cashback_trans` | string | — |
| `is_stockback` | string | Gắn tag phân loại liệu user có túi + và nhận cổ phiếu quà tặng(Stockback) từ miniapp (sản phẩm) Chứng Khoán CVS. Mỗi tháng user sở hữu Túi+ sẽ có thể vào miniapp CVS để bấm nhận (claim) cổ phiếu quà tặng từ CVS - **Sample**:      - Claim Stockback: có sở hữu túi + và có nhận cổ phiếu quả tặng (st... |
| `is_wheel` | string | Gắn tag phân loại liệu user có túi + và chơi quay thưởng nhận quà Vòng Quay May Mắn/ Vòng Quay Thần tài / Wheel 88. User có sở hữu túi+ sẽ được tặng thêm lượt quay mỗi tuần nhiều hơn user bình thường - **Sample**:      - Wheel88: có sở hữu túi + và chơi vòng quay     - None: có hoặc không có túi+... |
| `is_tkol8m` | string | Gắn tag phân loại liệu user có túi + và có gửi tiết kiệm ở miniapp (sản phẩm) Tiết kiệm Online (TKOL) kì hạn 8 tháng (8M) với mức lãi ưu đãi. User có sở hữu túi+ sẽ có thể đăng kí gửi tiết kiệm kì hạn 8 tháng với mức lãi suất cao hơn các kì hạn của user thông thường - **Sample**:      - TKOL 8M: ... |
| `is_cashback` | string | Gắn tag phân loại liệu user có túi + và thanh toán dùng nguồn tiền TTT (trans_type = momocashout_pay) để được quyền lợi (benefit) hoàn tiền 0.1% (cashback 0.1%) trên tổng gmv giao dịch hay không  - **Sample**:      - Cashback: có sở hữu túi + và thanh toán dùng nguồn tiền TTT và nhận tiền cashbac... |
| `is_cashout_napas` | string | Gắn tag phân loại liệu user có túi + và có thực hiện giao dịch rút tiền từ TTT về tài khoản ngân hàng cá nhân qua Số tài khoản với phương thức Napas mà không thông qua ngăn ví MoMo hay tài khoản ngân hàng liên kết. Mỗi tháng user được 100 triệu hạn mức rút tiền qua hình thức này. Tiền sẽ được chu... |
| `region` | string | Vùng địa lý của người dùng, ánh xạ theo tỉnh/thành phố. - **Sample value**:     - Hà Nội, Hồ Chí Minh (tách riêng)     - Vùng trung du và miền núi phía Bắc     - Vùng đồng bằng sông Hồng     - Vùng Bắc Trung Bộ và duyên hải miền Trung     - Vùng Tây Nguyên     - Vùng Đông Nam Bộ     - Vùng đồng b... |
| `gender` | string | Giới tính của người dùng lấy từ bảng demographic chuẩn nội bộ. - **Sample value**: male, female, unknown - **Tags**: Demographic |
| `age_group` | string | Nhóm tuổi của người dùng được tính từ năm sinh so với năm hiện tại trong trong Grass Month. - **Sample value**:     - 1. Age Below 22     - 2. Age 23–27     - 3. Age 28–35     - 4. Age 36–50     - 5. Age Above 50     - **unknown **nếu không có thông tin năm sinh (YOB) - **Tags**: Demographic |
| `is_buy_package` | string | — |
| `package_gmv` | string | — |
| `package_trans` | string | — |
| `is_coin_int` | string | — |
| `is_coin_spent` | string | — |
| `type` | string | <p>Phân loại nhóm người dùng của Túi Thần Tài trong tháng, bao gồm:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>TTT: Người dùng Túi Thần Tài cá nhân phổ thông bình thường</p></li><li class="om-leading-normal"><p>TTT+: Người dùng Túi thần tài cá nhân nhưng có sở hữu Túi+ trong thá... |
| `ttt_p2p_gmv` | string | — |
| `ttt_payment_gmv` | string | — |
| `momo_p2p_gmv` | string | — |
| `momo_payment_gmv` | string | — |
| `ttt_p2p_trans` | string | — |
| `ttt_payment_trans` | string | — |
| `momo_p2p_trans` | string | — |
| `momo_payment_trans` | string | — |
| `plus_silver_date` | date | — |
| `plus_gold_date` | date | — |
| `plus_platinum_date` | date | — |
| `tier` | string | <p>Tier ranking của Túi+, từ 01/01/2026 thì user sở hữu Túi+ sẽ được phân loại thêm thành 3 hạng mức với các quyền lợi được phân bổ khác nhau phù thuộc vào mức hardcore của user hoặc số tiền họ bỏ ra, bao gồm các nhóm:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>1. Silver: User t... |
| `first_payout_date` | date | — |
| `ttt_payout_disable_month` | date | — |
| `netcash` | string | — |

## Memory (from DA review)

- Khi xử lý dữ liệu Túi Thần Tài, không cần điều kiện IS_MP = 'Individual' cho cột MFU_TYPE
- PLUS_TYPE không được bao gồm ('0.Churn', 'None') trong điều kiện WHERE
- AUM của Túi Thần Tài bao gồm cả tài khoản cá nhân và tài khoản quỹ nhóm
- Khi xử lý tổng mức GMV rút tiền, sử dụng công thức SUM(coalesce(cashout_napas_gmv,0) + coalesce(cashout_payment_gmv,0) + coalesce(cashout_gmv,0) + coalesce(cashout_stock_gmv,0))
- Khi xử lý GRASS_MONTH, sử dụng DATE_TRUNC(GRASS_DATE, MONTH) thay vì GRASS_MONTH
- Tổng tiền lãi (Interest) không cần điều kiện IS_MP = 'Individual'
- Người dùng là Túi+ tháng 7 nhưng không là Túi+ tháng 8: 165,056,722,906 VND nạp VA trong tháng 8. Người dùng là Túi+ tháng 8 nhưng không là Túi+ tháng 9: 72,367,111,233 VND nạp VA trong tháng 9.
- Không có dữ liệu để phân loại ngày user có sở hữu Túi+
- Khi xử lý dữ liệu với option_value, không nên sử dụng điều kiện IS NULL
- Khi tính tổng số lượng người dùng rút tiền, chỉ tính những người dùng có GMV rút tiền lớn hơn 0
- Khi tính số lượng user MAU SOF Túi Thần Tài, cần sử dụng AVG(balance) > 100000 và SUM(CASHOUT_P2P_TRANS) = 0 thay vì AVG_BAL_GROUP và CASHOUT_P2P_TRANS = 0
- Traffic màn hình home tháng 6 bao gồm cả user chưa đăng ký Túi Thần Tài
- Khi xử lý dữ liệu Túi+ cho tháng 10, sử dụng GRASS_DATE từ '2025-10-01' đến '2025-10-05'
- Khi xử lý vấn đề liên quan tới USER_ID, dùng REGEXP_EXTRACT(USER_ID, r'\d+') cho cột USER_ID
