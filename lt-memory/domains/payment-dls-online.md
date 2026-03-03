# Domain: BU Payment: DLS ONLINE

## Identity
- **Domain ID:** `ca851de3-b3cb-42bf-96d6-979acde0a7da`
- **Description:** Chi tiết giao dịch Daily Life Service (DLS) online sử dụng trên MoMo kể từ năm 2024
- **Tables:** 7
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.BU_ECOM.DLS_ONLINE_NFC_INFO

| Column | Description | Examples |
|--------|-------------|----------|
| MONTH |  | — |
| first_NFC_date | ngày NFC đầu tiên | — |
| CATE | luôn viết hoa | — |
| USER_ID |  | — |
| NFC_USER | NFC_user is not null then NFC else Non_NFC | — |
| NFC_TYPE | not_nfc là chưa NFC, còn lại là đã NFC | — |
| device_os | DEVICES user đang dùng | — |
| usecase_type | 1 usecase, 2 usecase, 3 usecase, 4 usecase | — |
| GMV |  | — |
| REVENUE |  | — |

### momovn-prod.BU_ECOM.TOKEN_TRANS_NUM_MERCHANT_CATE_BINDING
> <p>Bảng lưu trữ thông tin về số lượng Merchant (Đối tác) và Cate (Danh mục dịch vụ) mà mỗi người dùng đang liên kết. </p>

| Column | Description | Examples |
|--------|-------------|----------|
| month | <p>Tháng</p> | — |
| agent_id | <p>Mã người dùng</p> | — |
| merchant | <p>Tên đối tác/dịch vụ (Luôn viết hoa)</p> | — |
| cate | <p>Danh mục dịch vụ (Luôn viết hoa)</p> | — |
| num_merchant |  | — |
| num_usecase |  | — |
| merchant_type | <p>Số Merchant (Đối tác/Dịch vụ) mà người dùng đang liên kết, phân loại theo 4 mục: 1 MC (liên kết 1 merchant), 2 MC (liên kết 2 merchants), 3 MC (liê... | — |
| usecase_type | <p>Số CATE (danh mục dịch vụ) mà người dùng đang liên kết, phân loại theo 4 mục: 1 USECASE (liên kết với 1 CATE), 2 USECASE (liên kết với 2 CATE), 3 U... | — |

### momovn-prod.BU_ECOM.DLS_GIFT_V3_VER2
> 
Bảng này chứa thông tin về các quà tặng trong hệ thống MoMo, bao gồm mã quà, tên quà, giá trị quà, và các thông tin liên quan đến giao dịch và người dùng. 
- Theo dõi và quản lý thông tin quà tặng được phát hành và sử dụng.
- Phân tích hiệu quả của các chương trình khuyến mãi thông qua các loại quà...

| Column | Description | Examples |
|--------|-------------|----------|
| GIFT_ID | <p>Mã định danh của quà tặng.<br></p> | — |
| GIFT_NAME | <p>Tên của quà tặng.<br></p> | — |
| GIFT_AMOUNT | <p>Giá trị của quà tặng.<br></p> | — |
| AGENT_NAME | <p>Tên của ví Momo.<br></p> | — |
| PROMO_TYPE | <p>Loại chương trình khuyến mãi.<br></p> | — |
| USER_ID | ID của user, SAFE_CAST(USER_ID AS INT64) khi map với USER_ID của bảng Transaction | — |
| START_DATE | ngày thả voucher | — |
| END_DATE | ngày hết hạn voucher | — |
| STATUS |  | — |
| TRAN_DATE | ngày giao dịch có sử dụng voucher | — |
| TRAN_ID | transaction id của giao dịch sử dụng voucher, nếu null tức là voucher không được sử dụng | — |
| GMV | giá trị giao dịch sử dụng voucher | — |
| VC_AMOUNT | giá trị voucher giảm | — |
| CB_AMOUNT |  | — |
| ERROR |  | — |
| CATE |  | — |
| SUB_CATE |  | — |
| MERCHANT |  | — |
| SUB_MERCHANT |  | — |

### momovn-prod.BU_ECOM.CAISHEN_CASH_BACK_TRANSACTION
> <p>Bảng lưu trữ thông tin về các giao dịch hoàn tiền của dịch vụ Hoàn tiền mua sắm - CAISHEN</p>

| Column | Description | Examples |
|--------|-------------|----------|
| dt | <p>Ngày user được hoàn tiền (trở thành MAU) của Hoàn tiền Mua sắm.</p><p>Khi cần tìm các chỉ số của MAU, hoặc lấy riêng status = 'CASHBACKED' trong mộ... | — |
| name | <p>Tên Merchant/Brand của đơn hàng. Ví dụ: shopee.</p><p>Khi lấy thông tin của cột này cần UPPER hoặc LOWER để đảm bảo tính chính xác</p> | — |
| cash_back_type | <p>Đơn hoàn tiền nhanh (FLASH_CASH_BACK) hoặc hoàn thường (NORMAL_CASH_BACK)</p> | — |
| status | <p>Trạng thái của đơn hàng, hiện tại bao gồm 4 trạng thái:</p><ul class="om-list-disc"><li class="om-leading-normal"><p>WAITING_TO_CONFIRM: Đơn hàng đ... | — |
| order_id | <p>Mã đơn hàng</p> | — |
| cash_back_amount | <p>Số tiền hoàn user được nhận</p> | — |
| user_id | <p>Mã người dùng</p> | — |
| date_update | <p>Ngày đặt đơn, khi tính các chỉ số MOU và MEU thì lấy theo cột này.</p> | — |
| datetime_update | <p>Ngày và giờ đặt đơn, khi tính các chỉ số chi tiết theo khung giờ hay chính xác về thời gian thì lấy theo cột này.</p> | — |
| GMV | <p>Giá trị của đơn hàng.</p> | — |
| is_brand_bonus | <p>Có phải hãng hoàn tiền thêm hay không</p> | — |
| partner | <p>Đối tác</p> | — |

### momovn-prod.BU_ECOM.TOKEN_TRANS
> <p>Bảng lưu trữ thông tin về các giao dịch sử dụng token hàng ngày.</p><p></p>

| Column | Description | Examples |
|--------|-------------|----------|
| date_act | <p>Ngày giao dịch</p> | — |
| datetime_act | <p>Ngày giờ giao dịch</p> | — |
| request_id |  | — |
| core_tran_id |  | — |
| core_result_code |  | — |
| core_result_description |  | — |
| agent_id | <p>Mã người dùng thực hiện giao dịch</p> | — |
| partner_code | <p>Mã đối tác</p> | — |
| merchant | <p>Tên đối tác/dịch vụ (Sử dụng LOWER(MERCHANT) hoặc UPPER(MERCHANT) khi truy vấn vì tên đối tác có tên viết hoa có tên viết thường) </p> | — |
| cate | <p>Danh mục dịch vụ (Luôn viết hoa)</p> | — |
| sub_cate |  | — |
| bu_name |  | — |
| total_amount |  | — |
| discount_amount |  | — |
| money_source |  | — |
| money_source_name | <p>Tên nguồn tiền giao dịch, bao gồm: MoMo Wallet (Ví MoMo), Banklink (Liên kết ngân hàng), Túi Thần Tài, Paylater (Ví Trả Sau),....</p> | — |

### momovn-prod.BU_ECOM.MAU_BY_USECASE_VER2

| Column | Description | Examples |
|--------|-------------|----------|
| MONTH |  | — |
| USER_ID | số điện thoại user được mã hóa | — |
| CATE | luôn viết hoa | — |
| MERCHANT | luôn viết hoa | — |
| USECASE_TYPE | 1 usecase, 2 usecase, 3 usecase, 4 usecase | — |
| MC_TYPE | MC = merchant, gồm 1 merchant, 2 merchant, 3 merchant, 4 merchant trở lên | — |

### momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1

| Column | Description | Examples |
|--------|-------------|----------|
| DATE | Ngày giao dịch | — |
| DATETIME | Ngày giờ giao dịch | — |
| MONTH |  | — |
| USER_ID | user có giao dịch | — |
| ORDER_ID | transaction | — |
| TRANS_TYPE |  | — |
| ALL_IN_ONE | giao dịch qua QR AIO | — |
| REQ_TYPE | token,app in app, web in app | — |
| PARTNER_CODE |  | — |
| STORE_ID |  | — |
| MONEY_SOURCE |  | — |
| MONEY_SOURCE_NAME | bao gồm các giá trị như MoMo wallet, Túi thần tài, Paylater(Ví trả sau), Banklink(Ngân hàng liên kết),... | — |
| SERVICE_CODE | agent dịch vụ | — |
| BU_NAME |  | — |
| BU_GROUP_CODE_L1 |  | — |
| BU_GROUP_CODE_L2 |  | — |
| GROUP_CODE_L1 |  | — |
| CATE | luôn viết hoa | — |
| SUB_CATE |  | — |
| MERCHANT | luôn viết hoa | — |
| SUB_MERCHANT |  | — |
| GMV |  | — |
| TOTAL_REV |  | — |
| REFUND_REV |  | — |
| NET_REV |  | — |
| PROMO_AMOUNT |  | — |
| REFUND_AMOUNT |  | — |
| CASHBACK_AMOUNT |  | — |
| CASHBACK_AGENTID |  | — |
| GENDER |  | — |
| AGE |  | — |
| AGE_GROUP |  | — |
| CITY |  | — |
| REGION |  | — |
| IS_KYC | đây là KYC, ko phải định danh bằng CCCD găn chip | — |
| IS_FACE_MATCHING |  | — |
| CHEATING | cheat user | — |
| QD2345_CHECK |  | — |
| NFC_TYPE |  | — |

## Domain Knowledge (from Mimir)

- TPU: number of transactions per user 
- TIKTOKSHOP: Khi hỏi là merchant tiktokshop hoặc TIKTOKSHOP thì lấy merchant = 'TIKTOK', cate = 'MARKETPLACE'

- app store: CATE = "APPLICATION STORE"
- dịch vụ Transport: CATE = "LOGISTICS"
AND UPPER(SERVICE_CODE) LIKE "%TRANSPORT%"
- Reactive User: user thanh toán lifetime trước tháng T-1, không thanh toán tháng T-1, quay lại thanh toán tháng T. Chỉ count lần đầu user quay lại
- Khi xử lý giao dịch với MERCHANT, sử dụng 'sieu thi aeon' thay vì 'aeon'
- Reactivated user của TikTok shop là người dùng từng sử dụng TikTok Shop nhưng tháng T-1 không sử dụng TikTok Shop và tháng T quay lại sử dụng, không count trùng lặp nếu như tháng T tiếp tục sử dụng nhiều lần
- Khi tính MAU cho Token Payment, cần lọc CORE_RESULT_CODE = 0
- MERCHANT phải là 'MÃ THẺ GOOGLE PLAY' khi truy vấn GMV và Transaction cho Mã Thẻ Google
- Khi xử lý giao dịch với Spotify, sử dụng LOWER(MERCHANT) LIKE '%spotify%' thay vì LOWER(MERCHANT) = 'spotify'
- Reactive user của merchant là user đã thanh toán merchant đó trước tháng T-1, không thanh toán tháng T-1 nhưng quay lại thanh toán tháng T
- Ưu đãi hoàn 10K cho bạn mới: Đây là một chương trình khuyến mãi dành cho người dùng mới của dịch vụ Hoàn tiền mua sắm, trong đó người dùng mới sẽ nhận được ưu đãi hoàn 10.000 VNĐ.
- Đối với nguồn tiền Ví Trả Sau, chỉ cần query 'Paylater'
- Khi kiểm tra số user thanh toán dịch vụ Logistics từ ngày 1/11/2025 đến 18/11/2025, chỉ lấy những user đã thanh toán dịch vụ Logistics trong tháng 9/2025 nhưng không thanh toán dịch vụ trong suốt tháng 10/2025, cần sử dụng LEFT JOIN để loại trừ user đã thanh toán trong tháng 10/2025
- nguồn tiền NHLK: money_source = 2
- hard, heavy: SQL: USER_SEGMENT = '1. Heavy'
Definition: Nhóm có GMV > 50tr/tháng
- tài xế: CASE
    WHEN SERVICE_CODE IN ( 'govietbike', 'm4becomgocar_app') THEN 'Tài xế Gojek'
    WHEN SERVICE_CODE IN ( 'disburse.lalamove_disburse', 'm4becomlalamove') THEN 'Tài xế Lalamove'
    WHEN SERVICE_CODE IN ( 'billpaygrab', 'billpaygrabbike') THEN 'Tài xế Grab'
    WHEN (SERVICE_CODE ='aha20151225001' AND  STORE_ID IN ('aha_supplier_topup', 'aha_supplier_transferCOD'))
        OR SERVICE_CODE IN ('m4becomahamove_taixe', 'disburse.ahamove_disburse_v2') THEN 'Tài xế Ahamove'
    ELSE 'Không phải tài xế'
END AS TAIXE
- số lượng user NFC: NFC thì cột NFC_TYPE IN ('FIRST_NFC','CURRENT_NFC')
Chưa NFC thì lấy cột: NFC_TYPE = 'NOT_NFC'
- Trong cột `CATE` có các dữ liệu sau:
SME OFFLINE
LOGISTICS
APPLICATION STORE
MARKETPLACE
RETAIL
ADS PAYMENT
DIGITAL CONTENT
FNB
GAME
OTT
INSURANCE
DEVICE FINANCING
Trong cột `MERCHANT` có các dữ liệu sau:
GRAB-ENDUSER
TIKTOK
APPLE
BE GROUP
GOOGLE
GSM
FACEBOOK
VIETLOTT SMS
MWG - BACH HOA XANH
CIRCLE K
TIKTOK LIVE
JOLLIBEE
GS25
7-ELEVEN
FUNTEK
MINISTOP
HIGHLANDS COFFEE
VÍ MOMO GOOGLE VN
FAMILYMART
LAZADA
SPOTIFY
NETFLIX
KINGFOOD
AHAMOVE
V/MC/JCB GOOGLE VN
LALAMOVE
HỒNG TRÀ NGÔ GIA
MM MEGA MARKET
CO.OPMART
COOP FOOD
(nhiều merchant khác nữa)
----
Khi được hỏi liên quan một loại dịch vụ, merchant thì hãy sử dụng các giá trị trên, nếu thấy tương tự thôi thì nhớ confirm lại user. Nếu bị hỏi tới một dịch vụ hay merchant quá lạ thì phải hỏi lại, không thì nhờ user feedback cách làm đúng tránh truy vấn không ra dữ liệu nào
- Reactive User tháng T (theo cate Logistics) là người dùng đã từng thanh toán bất kỳ merchant của cate Logistics với trước tháng T-1, không phát sinh thanh toán với cate Logistics trong tháng T-1, và quay lại thanh toán với cate Logistics trong tháng T. Reactive user by merchant là khi người dùng quay lại thanh toán với cate Logistics với merchant nào thì chỉ tính cho merchant đó, không tính reactive trùng lặp cho bất kỳ merchant nào khác mà họ có thể thanh toán sau đó.
- Reactive User tháng T (theo merchant Tiktok Shop) là người dùng đã từng thanh toán tiktok shop với trước tháng T-1, không phát sinh thanh toán Tiktok shop trong tháng T-1, và quay lại thanh toán với Tiktok shop trong tháng T. Không tính reactive trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- RETAINED USER = người dùng đã dùng dịch vụ Marketplace vào tháng T-1 và tháng T tiếp tục quay lại sử dụng Marketplace. Không tính retain trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- Khi xử lý giao dịch online, không sử dụng CORE_RESULT_CODE = 0
- New user (người dùng lần đầu) is a user who has their first token transaction in the specified month.
- Retain user TikTok Shop là user sử dụng TikTok Shop ở tháng T và tháng T+1 tiếp tục sử dụng dịch vụ của TikTok Shop, không count trùng lặp nếu user tiếp tục sử dụng giao dịch tiếp theo trong tháng T+1
- New to cate Marketplace là số lượng user lần đầu sử dụng market place trong tháng T, không count lặp lại nếu tiếp tục sử dụng trong tháng T
- Khi hỏi TikTok Shop hoặc TikTok đối với giao dịch Hoàn Tiền Mua Sắm (HTMS) thì chọn name là 'tiktok shop' ở bảng cash_back_transaction
- RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này
- 'xanh SM', 'GSM', 'xanh' tương ứng với merchant = 'GSM' trong data
- NTMC = New To Merchant (người dùng thực hiện giao dịch đầu tiên với merchant trong kỳ báo cáo)
- ads payment: CATE = "ADS PAYMENT"
- GRAB-ENDUSER: MERCHANT = "GRAB-ENDUSER"
- Churn user của tháng T là lifetime user thanh toán trước tháng T-1, không quay lại thanh toán trong tháng T
- SPU: spending per user
- RETAINED USER = người dùng đã sử dụng dịch vụ TikTok Shop trong tháng T-1 và tháng T quay lại sử dụng dịch vụ TTS. Không tính retain trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- NTMC = New To Merchant (người dùng thực hiện giao dịch đầu tiên với merchant trong kỳ báo cáo). new to merchant của tiktok shop là nhóm người dùng lần đầu sử dụng dịch vụ TikTok Shop trong tháng T và không tính new to merchant trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- Reactive User tháng T (theo cate) là người dùng đã từng thanh toán cate đó trước tháng T-1, không thanh toán cate đó trong tháng T-1, và quay lại thanh toán cate đó trong tháng T.
- Reactive cate là user thanh toán cate trước tháng T-1, không quay lại thanh toán tháng T-1, thanh toán tháng T
- Retained user của merchant là user đã thanh toán merchant đó tháng T-1 và quay lại thanh toán tháng T
- Khi join bảng CAISHEN_CASH_BACK_TRANSACTION với bảng BU_ECOM.DLS_ALL_TRANS_V3_1, phải join điều kiện user_id bằng nhau và payment_transaction_id trong bảng CAISHEN_CASH_BACK_TRANSACTION với order_id bảng BU_ECOM.DLS_ALL_TRANS_V3_1
- Tránh sử dụng NULL trong toán tử NOT IN - NULL trong truy vấn con NOT IN trả về NULL. Sử dụng NOT EXISTS hoặc LEFT JOIN với kiểm tra IS NULL để xử lý NULL an toàn hơn
- Cột AGE_GROUP lưu trữ nhóm tuổi dưới dạng chuỗi văn bản theo một định dạng cụ thể. Ví dụ, giá trị '[2].18-22' đại diện cho nhóm người dùng có độ tuổi từ 18 đến 22. Khi truy vấn, cần sử dụng chính xác định dạng này (ví dụ: AGE_GROUP = '[2].18-22' ).
- medium: SQL: USER_SEGMENT = '2. Medium'
Definition: Nhóm có GMV > 3-50tr/tháng
- youtube premium: Để lấy được giao dịch này cần sử dụng cột SUB_MERCHANT như sau:
SUB_MERCHANT IN ("APPLE YOUTUBE PREMIUM"', "GOOGLE YOUTUBE PREMIUM")
- tiktok ads: MERCHANT = "TIKTOK"
AND CATE = "ADS PAYMENT"
- usecase: Usecase: số cate user sử dụng 1 tháng, tính trong PAYMENT và TRANSFER
- RETAINED USER = người dùng đã sử dụng dịch vụ TikTok Shop trong tháng T-1 và tháng T quay lại sử dụng dịch vụ TTS. Không tính retain trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- NTMC = New To Merchant (người dùng thực hiện giao dịch đầu tiên với merchant trong kỳ báo cáo)
- NTMC = New To Merchant (người dùng thực hiện giao dịch đầu tiên với merchant trong kỳ báo cáo). new to merchant của tiktok shop là nhóm người dùng lần đầu sử dụng dịch vụ TikTok Shop trong tháng T và không tính new to merchant trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- Reactive User tháng T (theo cate Marketplace) là người dùng đã từng thanh toán bất kỳ merchant của cate Marketplace với trước tháng T-1, không phát sinh thanh toán với cate Marketplace trong tháng T-1, và quay lại thanh toán với cate Marketplace trong tháng T. Không tính reactive trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- Reactive User tháng T (theo cate Marketplace) là người dùng đã từng thanh toán bất kỳ merchant của cate Marketplace với trước tháng T-1, không phát sinh thanh toán với cate Marketplace trong tháng T-1, và quay lại thanh toán với cate Marketplace trong tháng T. Không tính reactive trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- retention rate = user có thanh toán tháng T-1 và quay lại thanh toán trong tháng T
- Reactive User tháng T (theo cate Marketplace) là người dùng đã từng thanh toán bất kỳ merchant của cate Marketplace với trước tháng T-1, không phát sinh thanh toán với cate Marketplace trong tháng T-1, và quay lại thanh toán với cate Marketplace trong tháng T. Không tính reactive trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- RETAINED USER = người dùng đã sử dụng dịch vụ TikTok Shop trong tháng T-1 và tháng T quay lại sử dụng dịch vụ TTS. Không tính retain trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- Cột ngày giao dịch trong bảng `momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1` là `DATE`
- NTMC = New To Merchant (người dùng thực hiện giao dịch đầu tiên với merchant trong kỳ báo cáo). new to merchant của tiktok shop là nhóm người dùng lần đầu sử dụng dịch vụ TikTok Shop trong tháng T và không tính new to merchant trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- New to merchant ở tháng T là user lần đầu thanh toán merchant đó trong tháng T. Retained user với merchant là user đã thanh toán merchant đó tháng T-1 và quay lại thanh toán merchant đó tháng T. Reactive user với merchant là user đã thanh toán merchant đó trước tháng T-1, không thanh toán tháng T-1 và quay lại thanh toán merchant đó tháng T
- Retain user TikTok Shop là user sử dụng TikTok Shop ở tháng T và tháng T+1 tiếp tục sử dụng dịch vụ của TikTok Shop, không count trùng lặp nếu user tiếp tục sử dụng giao dịch tiếp theo trong tháng T+1
- Reactive user của TikTok shop là người dùng từng sử dụng TikTok Shop nhưng tháng T-1 không sử dụng TikTok Shop và tháng T quay lại sử dụng, không count trùng lặp nếu như tháng T tiếp tục sử dụng nhiều lần
- Retained cate là user thanh toán cate tháng T-1, quay lại thanh toán tháng T
- NTMC = user lần đầu dùng merchant trong tháng T
- Khi count các giao dịch Ads Payment, chỉ sử dụng các SERVICE_CODE sau: m4becomadyen_facebook, m4becomboku_facebook, m4becombytedance_promote_payin, m4becombytedance_ads_payin, googleasia, m4btopbrandecom_googlemomoewallet_19041
- User Ads Payment tiers:
Mốc 1: chi tiêu ads payment từ 0 đến dưới 30 triệu/tháng
Mốc 2: chi tiêu ads payment từ 30 đến dưới 90 triệu/tháng
Mốc 3: chi tiêu ads payment từ 90 triệu/tháng trở lên
- tiktok: 
# Tiktok Shop
WHERE MERCHANT = "TIKTOK"
  AND CATE = "MARKETPLACE"
# Tiktok Live
WHERE MERCHANT = "TIKTOK LIVE"
# Tiktok Ads
WHERE MERCHANT = "TIKTOK"
  AND CATE = "ADS PAYMENT"

- MAU: tức là số lượng user
- merchant ads: MERCHANT = {MERCHANT_NAME}
AND CATE = "ADS PAYMENT"
- NFC: NFC nghĩa là xác thực sinh trắc học. Để lấy status NFC của người dùng thì sẽ sử dụng
-Table: momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1
-Column: NFC_TYPE
-Value: 
+NOT_NFC: Tháng đó người dùng chưa NFC
+CURRENT_NFC: Tháng đó người dùng đã từng NFC
+FIRST_NFC: Tháng đó là tháng đầu tiên người dùng NFC
- facebook ads: MERCHANT = "FACEBOOK"
AND CATE = "ADS PAYMENT"
- User type:
light user: User có GMV trong tháng < 3tr/ tháng -
medium user: User có GMV từ 3tr đến 50tr/ tháng -
hardcore user: User có GMV trên 50tr/ tháng -
Nhờ hỏi thanh toán này là khoản nào hay toàn bộ

- RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này
- RETAINED USER = người dùng đã dùng dịch vụ vào tháng trước và tiếp tục dùng trong tháng này
- NTC = New To Category (người dùng thực hiện giao dịch đầu tiên với một danh mục dịch vụ trong kỳ báo cáo)
- Reactive User tháng T (theo cate Marketplace) là người dùng đã từng thanh toán bất kỳ merchant của cate Marketplace với trước tháng T-1, không phát sinh thanh toán với cate Marketplace trong tháng T-1, và quay lại thanh toán với cate Marketplace trong tháng T. Không tính reactive trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- New user của Ads payment ở tháng T là nhóm người dùng lần đầu sử dụng dịch vụ ads payment vào tháng T, không tính lặp lại nếu người dùng tiếp tục sử dụng dịch vụ vào tháng T
- MERCHANT 'tch' tương ứng với 'the coffee house'
- Khi xử lý MERCHANT, sử dụng LIKE '%value%' thay vì = 'value'
- NTMC = New To Merchant (người dùng thực hiện giao dịch đầu tiên với merchant trong kỳ báo cáo).
- Khi truy vấn giao dịch token, cần lọc CORE_RESULT_CODE = 0
- NTMC = New To Merchant (người dùng thực hiện giao dịch đầu tiên với merchant trong kỳ báo cáo). new to merchant của tiktok shop là nhóm người dùng lần đầu sử dụng dịch vụ TikTok Shop trong tháng T và không tính new to merchant trùng lặp nếu họ có thể thanh toán sau đó trong tháng T.
- Khi join bảng DLS_GIFT_V3_VER2 và DLS_ALL_TRANS_V3_1, sử dụng điều kiện t1.TRAN_ID = t2.ORDER_ID
- New to cate Marketplace là số lượng user lần đầu sử dụng market place trong tháng T, không count lặp lại nếu tiếp tục sử dụng trong tháng T
- Khi truy vấn số lượng người dùng Hoàn tiền Mua sắm, sử dụng cột date_update thay vì dt
- Reactive user của Grab là người dùng đã từng giao dịch với Grab trước tháng T-1, không giao dịch với Grab trong tháng T-1, và quay lại giao dịch với Grab trong tháng T.


## Suggested Probe Questions

- Status: **Not yet probed**
