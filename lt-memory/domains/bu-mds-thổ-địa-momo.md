# BU MDS: Thổ Địa MoMo

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `c123d8bc-9569-4dfd-955f-69d587062069`

## Description
The dataset records information about 4 core features of TĐMM, including (1) login (2) engage (3) review (4) delivery

## Tables

### `project-5400504384186300846.MBI_DA.DM_MART_PROFILE_USER_LOGIN`
> Bảng chứa thông tin về tất cả user có login TĐMM, detail về demographic của user như giới tính, location

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATE` | DATE | **Desc**: Ngày login  **Sample value**: ['2024-05-21'] | — |
| `DATETIME` | DATETIME | **Desc**: Ngày giờ login  **Sample value**: ['2024-05-21 02:28:29.375000', '2024-05-21 03:03:39.008034', '2024-05-21 13:04:54.058000'] | — |
| `USER_ID` | STRING | **Desc**: ID của user  **Sample value**: ['10118242', '4205365', '82296893'] | — |
| `SCREEN_NAME` | STRING | **Desc**: Tên màn user đăng nhập vào  **Sample value**: Home TDMM, Detail BST, Filter Delivery | — |
| `EVENT_NAME` | STRING | **Desc**: Tên của event  **Sample value**: ['service_screen_viewed'] | — |
| `SOURCE` | STRING | **Desc**: Source login của user  **Sample value**: ['shopxu2023', 'tabbar_home', 'tabbar_promotion'] | — |
| `EVENT_ID` | STRING | **Desc**: ID của event  **Sample value**: ['6XuI5UG12hNRhGOMCrLoy', 'FAmem5nvzdeFKFG_INU85', 'G7OPfXHyJVr0_N-ky868-'] | — |
| `MOMO_SESSION_ID_V2` | STRING | **Desc**: Session của action login  **Sample value**: ['26BE4FA3-79BB-445D-9C64-1B93EEA5A722', '51A24449-4770-4332-AA9B-FCD90DF7CB7D', '5AF2664C-48F4-411E-94C0-127624DFBBB0'] | — |
| `CITY` | STRING | **Desc**: Thành phố nơi user login | — |
| `DISTRICT` | STRING | Quận nơi user login | — |
| `GENDER` | STRING | **Desc**: Giới tính của user login  **Sample value**: ['female', 'male', 'unknown'] | — |
| `AGE_GROUP` | STRING | **Desc**: Nhóm tuổi của user login | — |

### `project-5400504384186300846.MBI_DA.DM_MDS_TDMM_USER_ENGAGE`
> Bảng record các event engage của user trên TĐMM

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `USER_ID` | STRING | **Desc**: ID của user **Sample value**: ['117238', '118587', '189237'] | — |
| `DATE` | DATE | **Desc**: Ngày user engage  **Sample value**: ['2024-06-03'] | — |
| `DATETIME` | DATETIME | **Desc**: Ngày giờ user engage  **Sample value**: ['2024-06-03 01:26:46.566057', '2024-06-03 01:56:22.043060', '2024-06-03 08:21:43.987000'] | — |
| `EVENT_NAME` | STRING | **Desc**: Tên event  **Sample value**: ['service_button_clicked'] | — |
| `MOMO_SESSION_ID_V2` | STRING | **Desc**: Session engage của user **Sample value**: ['64C1FB10-7397-4DE4-8FBD-ADF8672BCE26', '75DF7E16-A0EE-4844-A13C-57655131A83D', '7a6c5af3-52be-46a6-833f-0f54bd7cbddf'] | — |
| `EVENT_ID` | STRING | **Desc**: ID của event  **Sample value**: ['1_4y-tUOqtHlL0jgPqya6', '3Z_QaupaDhND9RoFQ_CSi', '4-0FOOkSBIfAWZAzFb_tU'] | — |
| `IMPRESSION_OR_CLICK` | STRING | **Desc**: Loại hành động của người dùng: 'impression' hoặc 'click'.  **Sample value**: ['click', 'view'] | — |
| `TOUCH_POINT` | STRING | **Desc**: Các block/ component mà user engage  **Sample value**: ['engage_BP_detail'] | — |
| `STATUS` | STRING | **Desc**: Trạng thái của event engage   **Sample value**: ['hide', 'failed', 'success'] | — |
| `SERVICE_NAME` | STRING | **Desc**: Tên service mà user engage  **Sample value**: ['local_discovery', 'oa_miniapp'] | — |
| `SCREEN_NAME` | STRING | **Desc**: Tên màn hình user engage  **Sample value**: ['tdmm_collection_home' , 'oa', 'home', 'group_sku'] | — |
| `BLOCK_NAME` | STRING | **Desc**: Tên block mà user engage **Sample value**: ['search', 'user_location', 'page_info'] | — |
| `ICON_NAME` | STRING | **Desc**: Tên icon mà user engage **Sample value**: ['change_address', 'view_all_sku', 'save', 'back'] | — |
| `COMPONENT_NAME` | STRING | **Desc**: Tên component mà user engage  **Sample value**: ['oa_familiar', 'trigger_review'] | — |
| `BUTTON_NAME` | STRING | **Desc**: Tên button mà user engage  **Sample value**: ['category', 'save', 'Bánh Mì - Xôi'] | — |
| `COMPONENT_TYPE` | STRING | **Desc**: Loại component mà user engage **Sample value**: ['promotion_card', 'QUICK_CARD', 'filter_bar'] | — |
| `LABEL_NAME` | STRING | **Desc**: Tên label mà user engage  **Sample value**: ['EARLYMORNING', 'CHILL_CHILL_CUOI_NGAY', 'BLOCK_QUAN_NGON_QUANH_BAN'] | — |
| `TIME_SLOT` | STRING | **Desc**: Timeslot mà user engage với các block  **Sample value**: ['AFTERNOON', 'NOON', 'MORNING', 'EARLYMORNING', 'EVENING'] | — |
| `OA_ID` | STRING | **Desc**: ID của OA được user engage  **Sample value**: ['123456'] | — |

### `project-5400504384186300846.MBI_DA.DM_MDS_TDMM_DELIVERY_ORDER_last_update`
> Bảng record thông tin về các đơn hàng delivery trên TĐMM

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ID` | FLOAT | **Desc**: ID của hành động đặt hàng **Sample value**: ['1862410.0', '1862419.0'] | — |
| `USER_ID` | STRING | **Desc**: Mã định danh của người dùng thực hiện đơn hàng.  **Sample value**: ['49279214'] | — |
| `DATE` | DATE | **Desc**: Ngày tạo đơn hàng.  **Sample value**: ['2024-09-10'] | — |
| `LAST_MODIFIED` | INT | **Desc**: Timestamp chỉnh sửa cuối cùng của đơn hàng.  **Sample value**: ['1725938306000', '1725938466000'] | — |
| `OA_ID` | STRING | **Desc**: Mã định danh của Official Account liên quan đến đơn hàng.  **Sample value**: ['1009393'] | — |
| `OA_STORE_NAME` | STRING | Tên cửa hàng của Official Account liên quan đến đơn hàng | — |
| `ORDER_NUMBER` | STRING | **Desc**: Mã định danh của đơn hàng  **Sample value**: ['100924-RDK1512', '100924-XQN7484'] | — |
| `IS_DELETED` | FLOAT | **Desc**: Trạng thái xóa của đơn hàng, 0: chưa xóa, 1: đã xóa.  **Sample value**: ['0.0'] | — |
| `STATUS` | STRING | **Desc**: Trạng thái của đơn hàng (ví dụ: INIT, COMPLETED).  **Sample value**: DISH_READY, COMPLETED, ORDER_FAILED, DELIVERING, PREPARING, INIT, CANCELED, ORDER_SUCCESS | — |
| `PAYMENT_STATUS` | STRING | **Desc**: Trạng thái thanh toán của đơn hàng (ví dụ: WAITING, PAID).  **Sample value**: ['WAITING'] | — |
| `DELIVERY_STATUS` | STRING | **Desc**: Trạng thái giao hàng của đơn hàng.  **Sample value**: DELIVERED, DELIVERING, FOUND_A_DRIVER, CANCELED, FINDING_DRIVER | — |
| `SERVING_TYPE` | STRING | **Desc**: Loại hình phục vụ của đơn hàng (ví dụ: DELIVERY, PICKUP).  **Sample value**: ['DELIVERY'] | — |
| `ORIGINAL_AMOUNT` | FLOAT | **Desc**: Tổng số tiền gốc của đơn hàng trước khi áp dụng khuyến mãi.  **Sample value**: ['165000.0', '95000.0'] | — |
| `PAY_AMOUNT` | FLOAT | **Desc**: Số tiền thực tế phải trả sau khi áp dụng khuyến mãi.  **Sample value**: ['165000.0', '95000.0'] | — |
| `DISCOUNT_AMOUNT` | FLOAT | **Desc**: Số tiền được giảm giá từ khuyến mãi.  **Sample value**: ['0.0'] | — |
| `CUSTOMER_NOTE` | STRING | **Desc**: Ghi chú của khách hàng cho đơn hàng.  **Sample value**: ['None'] | — |
| `PAYMENT_METHOD` | STRING | **Desc**: Phương thức thanh toán của đơn hàng.  **Sample value**: ['None'] | — |
| `CANCELED_BY` | STRING | **Desc**: Người hủy đơn hàng.  **Sample value**: ['System', 'Merchant'] | — |
| `CANCELED_REASON` | STRING | **Desc**: Lý do hủy đơn hàng.  **Sample value**: ['None'] | — |
| `PARTNER_ORDER_NUMBER` | STRING | **Desc**: Mã đơn hàng của đối tác  **Sample value**: ['060525-AOX4111'] | — |
| `PAYMENT_TID` | STRING | **Desc**: ID của giao dịch (Transaction_id)  **Sample value**: ['None'] | — |

### `project-5400504384186300846.MBI_DA.MART_ORDER_INFO`
> Bảng record các thông tin tổng hợp về đơn hàng Delivery trên TĐMM

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `PAYMENT_TID` | STRING | **Desc**: Mã giao dịch thanh toán, định danh duy nhất cho mỗi giao dịch.  **Sample value**: ['75067906441', '75072801619', '75085887421'] | — |
| `VOUCHER_AMOUNT` | FLOAT | **Desc**: Số tiền được giảm giá từ voucher trong giao dịch.  **Sample value**: ['0.0', 'nan'] | — |
| `DATE` | DATE | **Desc**: Ngày thực hiện giao dịch.  **Sample value**: ['2024-12-28'] | — |
| `BUDGET_TYPES` | STRING | **Desc**: Loại ngân sách được sử dụng trong giao dịch, ví dụ: MoMo_Fund.  **Sample value**: MoMo_Fund, MC_Fund | — |
| `GIFT_ID` | STRING | **Desc**: Mã định danh của 1 gift_type_id liên quan đến giao dịch.  **Sample value**: ['None'] | — |
| `CAMPAIGN_ID` | STRING | **Desc**: Mã định danh của chiến dịch khuyến mãi liên quan đến giao dịch.  **Sample value**: ['None'] | — |
| `GIFT_TYPE_ID` | STRING | **Desc**: Mã định của gift config trên Athena liên quan đến giao dịch  **Sample value**: ['None'] | — |

### `project-5400504384186300846.MBI_DA.DM_MDS_TDMM_REVIEWER_CLUB`
> Bảng record các bài review của user trên Reviewer Club thuộc TĐMM (Review cho các cửa hàng FnB)

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `REVIEW_ID` | FLOAT | **Desc**: ID của bài đánh giá.  **Sample value**: ['111835355104227.0', '111835431481138.0', '111836244495419.0'] | — |
| `REVIEW_DESC` | STRING | **Desc**: Nội dung của bài đánh giá.  **Sample value**: ['Ko', 'Momo', 'None', '👍'] | — |
| `IMG_COUNT` | FLOAT | **Desc**: Số lượng hình ảnh trong bài đánh giá.  **Sample value**: ['0.0', '1.0'] | — |
| `VIDEO_COUNT` | FLOAT | **Desc**: Số lượng video trong bài đánh giá.  **Sample value**: ['0.0'] | — |
| `PRODUCT_ID` | FLOAT | **Desc**: ID của sản phẩm được đánh giá.  **Sample value**: ['nan'] | — |
| `GROUP_ID` | FLOAT | **Desc**: ID của nhóm sản phẩm.  **Sample value**: ['nan'] | — |
| `TYPE_ID` | FLOAT | **Desc**: ID của loại sản phẩm.  **Sample value**: ['107059573304974.0', '107250683969276.0', '107799895377533.0', '109505859350662.0'] | — |
| `PRODUCT_NAME` | STRING | **Desc**: Tên của sản phẩm được đánh giá.  **Sample value**: ['Chuyển Tiền Miễn Phí', 'Heo Đất MoMo', 'Hóng hớt MoMo', 'MaMa Đầu Tư'] | — |
| `PAID` | FLOAT | **Desc**: Trạng thái thanh toán của bài đánh giá (1: đã thanh toán, 0: chưa thanh toán).  **Sample value**: [1, 0] | — |
| `CREATOR_ID` | STRING | **Desc**: ID của người tạo bài đánh giá.  **Sample value**: ['10055322', '17020961', '39691779'] | — |
| `PRODUCT_TYPE_NAME` | STRING | **Desc**: Tên loại sản phẩm.  **Sample value**: ['OA Brand'] | — |
| `POST_STATUS` | FLOAT | Trạng thái bài viết (chờ duyệt, published,deleted,hidden) tại thời điểm hiện tại; chờ duyệt = 1 duyệt = 5 (visibility = 1) thu hồi (visibility = 0, status =5) xóa (visibility = 0, status =5) - có thể khôi phục gỡ bỏ (xóa khỏi DBeaver) | — |
| `OUTSTANDING_STATUS` | FLOAT | **Desc**: Trạng thái nổi bật của bài viết (1: nổi bật, 0: không nổi bật).  **Sample value**: ['0.0'] | — |
| `PUBLIC_TAG_NAMES` | STRING | **Desc**: Tên các thẻ công khai gắn với bài đánh giá.  **Sample value**: [''] | — |
| `INTERNAL_TAG_NAMES` | STRING | **Desc**: Tên các thẻ nội bộ gắn với bài đánh giá.  **Sample value**: ['None'] | — |
| `DATE` | DATE | **Desc**: Ngày tạo bài đánh giá.  **Sample value**: ['2024-01-29'] | — |
| `DATE_TIME` | DATETIME | **Desc**: Ngày giờ tạo bài đánh giá.  **Sample value**: ['2024-01-29 03:01:33.000', '2024-01-29 03:20:58.000', '2024-01-29 06:47:44.000'] | — |
| `UPDATED_DATE_TIME` | DATETIME | **Desc**: Thời gian cập nhật bài đánh giá.  **Sample value**: ['2024-01-29 03:01:33.783', '2024-01-29 03:20:58.764', '2024-01-29 06:47:44.198'] | — |
| `RATING` | FLOAT | **Desc**: Đánh giá của người dùng cho sản phẩm.  **Sample value**: 1,2,3,4,5 | — |
| `REVIEW_TYPE` | STRING | **Desc**: Loại bài đánh giá.  **Sample value**: ['Review', 'Advanced_review'] | — |
| `OA_ID` | STRING | **Desc**: ID của Official Account được user đánh giá  **Sample value**: ['9898513', '9926377', '9926379', '9926837'] | — |
| `POST_TYPE` | FLOAT | Phân loại bài viết 1 Fanpage post 3 User post public 9 User post friend 10 User post only me 4 Activity post 11 Activity post public 12 Activity post friend 13 Activity post only me 99 Review 17 QR post public 18 QR post friend 19 QR post only me | — |
| `M4B_CAT` | STRING | **Desc**: Danh mục M4B liên quan đến sản phẩm.  **Sample value**: ['Food and Beverage'] | — |
