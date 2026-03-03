# Domain: BU MDS: Thổ Địa MoMo

## Identity
- **Domain ID:** `c123d8bc-9569-4dfd-955f-69d587062069`
- **Description:** The dataset records information about 4 core features of TĐMM, including (1) login (2) engage (3) review (4) delivery
- **Tables:** 5
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### project-5400504384186300846.MBI_DA.DM_MART_PROFILE_USER_LOGIN
> Bảng chứa thông tin về tất cả user có login TĐMM, detail về demographic của user như giới tính, location

| Column | Description | Examples |
|--------|-------------|----------|
| ? | **Desc**: Ngày login  **Sample value**: ['2024-05-21'] | — |
| ? | **Desc**: Ngày giờ login  **Sample value**: ['2024-05-21 02:28:29.375000', '2024-05-21 03:03:39.008034', '2024-05-21 13:04:54.058000'] | — |
| ? | **Desc**: ID của user  **Sample value**: ['10118242', '4205365', '82296893'] | — |
| ? | **Desc**: Tên màn user đăng nhập vào  **Sample value**: Home TDMM, Detail BST, Filter Delivery | — |
| ? | **Desc**: Tên của event  **Sample value**: ['service_screen_viewed'] | — |
| ? | **Desc**: Source login của user  **Sample value**: ['shopxu2023', 'tabbar_home', 'tabbar_promotion'] | — |
| ? | **Desc**: ID của event  **Sample value**: ['6XuI5UG12hNRhGOMCrLoy', 'FAmem5nvzdeFKFG_INU85', 'G7OPfXHyJVr0_N-ky868-'] | — |
| ? | **Desc**: Session của action login  **Sample value**: ['26BE4FA3-79BB-445D-9C64-1B93EEA5A722', '51A24449-4770-4332-AA9B-FCD90DF7CB7D', '5AF2664C-48F4-... | — |
| ? | **Desc**: Thành phố nơi user login | — |
| ? | Quận nơi user login | — |
| ? | **Desc**: Giới tính của user login  **Sample value**: ['female', 'male', 'unknown'] | — |
| ? | **Desc**: Nhóm tuổi của user login | — |

### project-5400504384186300846.MBI_DA.DM_MDS_TDMM_USER_ENGAGE
> Bảng record các event engage của user trên TĐMM

| Column | Description | Examples |
|--------|-------------|----------|
| ? | **Desc**: ID của user **Sample value**: ['117238', '118587', '189237'] | — |
| ? | **Desc**: Ngày user engage  **Sample value**: ['2024-06-03'] | — |
| ? | **Desc**: Ngày giờ user engage  **Sample value**: ['2024-06-03 01:26:46.566057', '2024-06-03 01:56:22.043060', '2024-06-03 08:21:43.987000'] | — |
| ? | **Desc**: Tên event  **Sample value**: ['service_button_clicked'] | — |
| ? | **Desc**: Session engage của user **Sample value**: ['64C1FB10-7397-4DE4-8FBD-ADF8672BCE26', '75DF7E16-A0EE-4844-A13C-57655131A83D', '7a6c5af3-52be-46... | — |
| ? | **Desc**: ID của event  **Sample value**: ['1_4y-tUOqtHlL0jgPqya6', '3Z_QaupaDhND9RoFQ_CSi', '4-0FOOkSBIfAWZAzFb_tU'] | — |
| ? | **Desc**: Loại hành động của người dùng: 'impression' hoặc 'click'.  **Sample value**: ['click', 'view'] | — |
| ? | **Desc**: Các block/ component mà user engage  **Sample value**: ['engage_BP_detail'] | — |
| ? | **Desc**: Trạng thái của event engage   **Sample value**: ['hide', 'failed', 'success'] | — |
| ? | **Desc**: Tên service mà user engage  **Sample value**: ['local_discovery', 'oa_miniapp'] | — |
| ? | **Desc**: Tên màn hình user engage  **Sample value**: ['tdmm_collection_home' , 'oa', 'home', 'group_sku'] | — |
| ? | **Desc**: Tên block mà user engage **Sample value**: ['search', 'user_location', 'page_info'] | — |
| ? | **Desc**: Tên icon mà user engage **Sample value**: ['change_address', 'view_all_sku', 'save', 'back'] | — |
| ? | **Desc**: Tên component mà user engage  **Sample value**: ['oa_familiar', 'trigger_review'] | — |
| ? | **Desc**: Tên button mà user engage  **Sample value**: ['category', 'save', 'Bánh Mì - Xôi'] | — |
| ? | **Desc**: Loại component mà user engage **Sample value**: ['promotion_card', 'QUICK_CARD', 'filter_bar'] | — |
| ? | **Desc**: Tên label mà user engage  **Sample value**: ['EARLYMORNING', 'CHILL_CHILL_CUOI_NGAY', 'BLOCK_QUAN_NGON_QUANH_BAN'] | — |
| ? | **Desc**: Timeslot mà user engage với các block  **Sample value**: ['AFTERNOON', 'NOON', 'MORNING', 'EARLYMORNING', 'EVENING'] | — |
| ? | **Desc**: ID của OA được user engage  **Sample value**: ['123456'] | — |

### project-5400504384186300846.MBI_DA.DM_MDS_TDMM_DELIVERY_ORDER_last_update
> Bảng record thông tin về các đơn hàng delivery trên TĐMM

| Column | Description | Examples |
|--------|-------------|----------|
| ? | **Desc**: ID của hành động đặt hàng **Sample value**: ['1862410.0', '1862419.0'] | — |
| ? | **Desc**: Mã định danh của người dùng thực hiện đơn hàng.  **Sample value**: ['49279214'] | — |
| ? | **Desc**: Ngày tạo đơn hàng.  **Sample value**: ['2024-09-10'] | — |
| ? | **Desc**: Timestamp chỉnh sửa cuối cùng của đơn hàng.  **Sample value**: ['1725938306000', '1725938466000'] | — |
| ? | **Desc**: Mã định danh của Official Account liên quan đến đơn hàng.  **Sample value**: ['1009393'] | — |
| ? | Tên cửa hàng của Official Account liên quan đến đơn hàng | — |
| ? | **Desc**: Mã định danh của đơn hàng  **Sample value**: ['100924-RDK1512', '100924-XQN7484'] | — |
| ? | **Desc**: Trạng thái xóa của đơn hàng, 0: chưa xóa, 1: đã xóa.  **Sample value**: ['0.0'] | — |
| ? | **Desc**: Trạng thái của đơn hàng (ví dụ: INIT, COMPLETED).  **Sample value**: DISH_READY, COMPLETED, ORDER_FAILED, DELIVERING, PREPARING, INIT, CANCE... | — |
| ? | **Desc**: Trạng thái thanh toán của đơn hàng (ví dụ: WAITING, PAID).  **Sample value**: ['WAITING'] | — |
| ? | **Desc**: Trạng thái giao hàng của đơn hàng.  **Sample value**: DELIVERED, DELIVERING, FOUND_A_DRIVER, CANCELED, FINDING_DRIVER | — |
| ? | **Desc**: Loại hình phục vụ của đơn hàng (ví dụ: DELIVERY, PICKUP).  **Sample value**: ['DELIVERY'] | — |
| ? | **Desc**: Tổng số tiền gốc của đơn hàng trước khi áp dụng khuyến mãi.  **Sample value**: ['165000.0', '95000.0'] | — |
| ? | **Desc**: Số tiền thực tế phải trả sau khi áp dụng khuyến mãi.  **Sample value**: ['165000.0', '95000.0'] | — |
| ? | **Desc**: Số tiền được giảm giá từ khuyến mãi.  **Sample value**: ['0.0'] | — |
| ? | **Desc**: Ghi chú của khách hàng cho đơn hàng.  **Sample value**: ['None'] | — |
| ? | **Desc**: Phương thức thanh toán của đơn hàng.  **Sample value**: ['None'] | — |
| ? | **Desc**: Người hủy đơn hàng.  **Sample value**: ['System', 'Merchant'] | — |
| ? | **Desc**: Lý do hủy đơn hàng.  **Sample value**: ['None'] | — |
| ? | **Desc**: Mã đơn hàng của đối tác  **Sample value**: ['060525-AOX4111'] | — |
| ? | **Desc**: ID của giao dịch (Transaction_id)  **Sample value**: ['None'] | — |

### project-5400504384186300846.MBI_DA.MART_ORDER_INFO
> Bảng record các thông tin tổng hợp về đơn hàng Delivery trên TĐMM

| Column | Description | Examples |
|--------|-------------|----------|
| ? | **Desc**: Mã giao dịch thanh toán, định danh duy nhất cho mỗi giao dịch.  **Sample value**: ['75067906441', '75072801619', '75085887421'] | — |
| ? | **Desc**: Số tiền được giảm giá từ voucher trong giao dịch.  **Sample value**: ['0.0', 'nan'] | — |
| ? | **Desc**: Ngày thực hiện giao dịch.  **Sample value**: ['2024-12-28'] | — |
| ? | **Desc**: Loại ngân sách được sử dụng trong giao dịch, ví dụ: MoMo_Fund.  **Sample value**: MoMo_Fund, MC_Fund | — |
| ? | **Desc**: Mã định danh của 1 gift_type_id liên quan đến giao dịch.  **Sample value**: ['None'] | — |
| ? | **Desc**: Mã định danh của chiến dịch khuyến mãi liên quan đến giao dịch.  **Sample value**: ['None'] | — |
| ? | **Desc**: Mã định của gift config trên Athena liên quan đến giao dịch  **Sample value**: ['None'] | — |

### project-5400504384186300846.MBI_DA.DM_MDS_TDMM_REVIEWER_CLUB
> Bảng record các bài review của user trên Reviewer Club thuộc TĐMM (Review cho các cửa hàng FnB)

| Column | Description | Examples |
|--------|-------------|----------|
| ? | **Desc**: ID của bài đánh giá.  **Sample value**: ['111835355104227.0', '111835431481138.0', '111836244495419.0'] | — |
| ? | **Desc**: Nội dung của bài đánh giá.  **Sample value**: ['Ko', 'Momo', 'None', '👍'] | — |
| ? | **Desc**: Số lượng hình ảnh trong bài đánh giá.  **Sample value**: ['0.0', '1.0'] | — |
| ? | **Desc**: Số lượng video trong bài đánh giá.  **Sample value**: ['0.0'] | — |
| ? | **Desc**: ID của sản phẩm được đánh giá.  **Sample value**: ['nan'] | — |
| ? | **Desc**: ID của nhóm sản phẩm.  **Sample value**: ['nan'] | — |
| ? | **Desc**: ID của loại sản phẩm.  **Sample value**: ['107059573304974.0', '107250683969276.0', '107799895377533.0', '109505859350662.0'] | — |
| ? | **Desc**: Tên của sản phẩm được đánh giá.  **Sample value**: ['Chuyển Tiền Miễn Phí', 'Heo Đất MoMo', 'Hóng hớt MoMo', 'MaMa Đầu Tư'] | — |
| ? | **Desc**: Trạng thái thanh toán của bài đánh giá (1: đã thanh toán, 0: chưa thanh toán).  **Sample value**: [1, 0] | — |
| ? | **Desc**: ID của người tạo bài đánh giá.  **Sample value**: ['10055322', '17020961', '39691779'] | — |
| ? | **Desc**: Tên loại sản phẩm.  **Sample value**: ['OA Brand'] | — |
| ? | Trạng thái bài viết (chờ duyệt, published,deleted,hidden) tại thời điểm hiện tại; chờ duyệt = 1 duyệt = 5 (visibility = 1) thu hồi (visibility = 0, st... | — |
| ? | **Desc**: Trạng thái nổi bật của bài viết (1: nổi bật, 0: không nổi bật).  **Sample value**: ['0.0'] | — |
| ? | **Desc**: Tên các thẻ công khai gắn với bài đánh giá.  **Sample value**: [''] | — |
| ? | **Desc**: Tên các thẻ nội bộ gắn với bài đánh giá.  **Sample value**: ['None'] | — |
| ? | **Desc**: Ngày tạo bài đánh giá.  **Sample value**: ['2024-01-29'] | — |
| ? | **Desc**: Ngày giờ tạo bài đánh giá.  **Sample value**: ['2024-01-29 03:01:33.000', '2024-01-29 03:20:58.000', '2024-01-29 06:47:44.000'] | — |
| ? | **Desc**: Thời gian cập nhật bài đánh giá.  **Sample value**: ['2024-01-29 03:01:33.783', '2024-01-29 03:20:58.764', '2024-01-29 06:47:44.198'] | — |
| ? | **Desc**: Đánh giá của người dùng cho sản phẩm.  **Sample value**: 1,2,3,4,5 | — |
| ? | **Desc**: Loại bài đánh giá.  **Sample value**: ['Review', 'Advanced_review'] | — |
| ? | **Desc**: ID của Official Account được user đánh giá  **Sample value**: ['9898513', '9926377', '9926379', '9926837'] | — |
| ? | Phân loại bài viết 1 Fanpage post 3 User post public 9 User post friend 10 User post only me 4 Activity post 11 Activity post public 12 Activity post ... | — |
| ? | **Desc**: Danh mục M4B liên quan đến sản phẩm.  **Sample value**: ['Food and Beverage'] | — |

## Suggested Probe Questions

- Status: **Not yet probed**
