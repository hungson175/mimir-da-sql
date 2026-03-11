# BU MDS: Business Page

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `3220e3ea-a817-4cad-a795-6221771b5956`

## Description
The dataset records all information about features in BP, including: (1) information about BP (2) Merchant engagement (3) User engagement

## Tables

### `project-5400504384186300846.MBI_DA.OA_MASTER_INFO`
> Bảng tổng hợp tất cả các thông tin của OA

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `CREATE_DATE` | DATE | **Desc**: Ngày tạo của OA_ID trong bảng `project-5400504384186300846.OFFICIAL_ACCOUNT.OFFICIAL_ACCOUNT_20*`  **Sample value**: ['2022-04-27'] | — |
| `CREATE_DATETIME` | DATETIME | **Desc**: Thời gian chi tiết tạo OA_ID  **Sample value**: ['2022-04-27 13:32:34', '2022-04-27 13:33:59', '2022-04-27 13:35:37'] | — |
| `MODIFIED_DATE` | DATE | **Desc**: Ngày cập nhật thông tin OA  **Sample value**: ['2022-04-27', '2023-12-14', '2024-11-29', '2024-12-02'] | — |
| `MODIFIED_DATETIME` | DATETIME | **Desc**: Ngày giờ cập nhật thông tin OA  **Sample value**: ['2022-04-27 15:51:12', '2022-04-27 15:52:00', '2022-04-27 15:52:47'] | — |
| `OA_ID` | STRING | **Desc**: ID của Official Account (OA).  **Sample value**: ['1061276', '1061277', '1061278'] | — |
| `OA_MERCHANT_STORE_ID` | FLOAT | **Desc**: Thông tin về ID của bảng `project-5400504384186300846.OFFICIAL_ACCOUNT.OA_MERCHANT_STORE_*` **Sample value**: ['46237.0', '46253.0', '47507.0'] | — |
| `MERCHANT_ID` | FLOAT | **Desc**: Thông tin về Merchant ID (không phải Partnercode / Merchant Code)  **Sample value**: ['1019744.0', '1019803.0', '1019804.0'] | — |
| `ORI_STORE_ID` | FLOAT | **Desc**: Thông tin về Store_id được ghi nhận trong bảng `project-5400504384186300846.OFFICIAL_ACCOUNT.OFFICIAL_ACCOUNT_20*`  **Sample value**: ['1022000.0', '1022001.0', '1022002.0'] | — |
| `STORE_ID_RECODE` | FLOAT | **Desc**: Thông tin về Store_id được recode với thông tin của M4B_STORE **Sample value**: ['1022006.0', '1022010.0', '1022011.0'] | — |
| `ORI_PARTNER_CODE` | STRING | **Desc**: Thông tin về Partner code được ghi nhận trong bảng `project-5400504384186300846.OFFICIAL_ACCOUNT.OFFICIAL_ACCOUNT_20*`  **Sample value**: ['MOMOABFY20220427', 'MOMOCF3V20220427', 'MOMODKKO20190327'] | — |
| `ORI_STORE_CODE` | STRING | **Desc**: Thông tin về Store code được ghi nhận trong bảng `project-5400504384186300846.OFFICIAL_ACCOUNT.OFFICIAL_ACCOUNT_20*`  **Sample value**: ['00168', '00170', '00184'] | — |
| `STORE_CODE_RECODE` | STRING | **Desc**: Mã cửa hàng sau khi mã hóa lại.  **Sample value**: ['00168', '00170', '00184'] | — |
| `TYPE_RECODE` | STRING | **Desc**: Thông tin về các store_id được recode **Sample value**: ['Keep', 'Recode'] | — |
| `OA_STORE_NAME` | STRING | — | — |
| `OA_STORE_ADDRESS` | STRING | — | — |
| `LATITUDE` | FLOAT | — | — |
| `LONGITUDE` | FLOAT | — | — |
| `HOTLINE_AID` | STRING | — | — |
| `IS_ENABLE_FNB` | FLOAT | — | — |
| `OWNERSHIP_STATUS` | FLOAT | — | — |
| `IS_OA_CLAIM` | INT | — | — |
| `IS_OA_ACTIVE` | BOOLEAN | — | — |
| `IS_OA_DELETED` | BOOLEAN | — | — |
| `M4B_CAT` | STRING | — | — |
| `PAYLATER_CONFIG_TYPE` | STRING | — | — |
| `IMG_MENU` | INT | — | — |
| `IMG_ITEM` | INT | — | — |
| `IMG_BANNER` | INT | — | — |
| `IMG_LOGO` | INT | — | — |
| `IMG_SPACE` | INT | — | — |
| `MIN_RATING` | FLOAT | — | — |
| `AVG_RATING` | FLOAT | — | — |
| `MEDIAN_RATING` | FLOAT | — | — |
| `CNT_REVIEW` | INT | — | — |
| `CNT_REVIEWER` | INT | — | — |
| `CNT_DATE_REVIEW` | INT | — | — |
| `LAST_UPDATE` | DATE | — | — |
| `UU_LAST_90_DAYS` | INT | — | — |
| `TOTAL_TRANS_LAST_90_DAYS` | INT | — | — |
| `UU_LAST_30_DAYS` | INT | — | — |
| `TOTAL_TRANS_LAST_30_DAYS` | INT | — | — |
| `UU_LAST_7_DAYS` | INT | — | — |
| `TOTAL_TRANS_LAST_7_DAYS` | INT | — | — |
| `AVG_AOV_LAST_7_DAYS` | FLOAT | — | — |
| `AVG_AOV_LAST_30_DAYS` | FLOAT | — | — |
| `AVG_AOV_LAST_90_DAYS` | FLOAT | — | — |
| `START_TIME` | STRING | — | — |
| `END_TIME` | STRING | — | — |
| `IPOS_STORE` | FLOAT | — | — |
| `CNT_SKU` | INT | — | — |
| `OA_QUALITY` | STRING | — | — |
| `OPERATING_STATUS_DEFINE` | STRING | — | — |
| `IS_STATUS_SOCIAL_PACKAGE` | STRING | Trạng thái đăng kí gói Social của OA | — |
| `WARD_NAME` | STRING | — | — |
| `DISTRICT_NAME` | STRING | — | — |
| `CITY_NAME` | STRING | — | — |
| `TYPE_LOCATION` | STRING | — | — |
| `HOUSE_NUMBER` | STRING | — | — |
| `OA_DESCRIPTION` | STRING | — | — |
| `AVG_PRICE` | FLOAT | **Desc**: Giá trung bình.  **Sample value**: ['100000.0', '200000.0', '50000.0', 'nan'] | — |
| `UTILITY_NAME` | STRING | **Desc**: Tên tiện ích.  **Sample value**: ['None', 'Phù hợp nhóm bạn \| Bán tại chỗ \| Có wifi \| Giao hàng \| Trả thẻ \| Gửi xe miễn phí \| Bán mang đi'] | — |
| `OA_SOURCE` | STRING | **Desc**: Nguồn OA.  **Sample value**: ['M4B', 'OPERATION'] | — |
| `GOOGLE_SOURCE` | STRING | **Desc**: Nguồn Google.  **Sample value**: ['N'] | — |
| `AMBIENCE` | STRING | **Desc**: Không gian.  **Sample value**: ['cổ điển', 'đậm chất riêng,ấm áp', 'ấm áp'] | — |
| `CNT_UTILITY` | INT | **Desc**: Số lượng tiện ích.  **Sample value**: ['7', '<NA>'] | — |
| `CNT_AMBIENCE` | INT | **Desc**: Số lượng không gian.  **Sample value**: ['1', '2'] | — |
| `TYPE_PILOT` | STRING | **Desc**: Loại thử nghiệm.  **Sample value**: ['MVP', 'Other'] | — |
| `TDMM_DISPLAY` | STRING | **Desc**: Hiển thị TDMM.  **Sample value**: ['Hiển thị', 'Không hiển thị'] | — |
| `OA_CATEGORY_NAME` | STRING | **Desc**: Tên danh mục OA.  **Sample value**: ['Cơm chiên (cơm rang) \| Nhà hàng - Quán - Dịch vụ Ăn uống', 'Cơm gà \| Cơm văn phòng \| Gà chiên \| Gà rán \| Khoai tây chiên \| Kiểu chiên \| Nhà hàng - Quán - Dịch vụ Ăn uống', 'Cơm gà \| Nhà hàng - Quán - Dịch vụ Ăn uống'] | — |
| `CNT_CATE` | INT | **Desc**: Số lượng danh mục.  **Sample value**: ['2', '7'] | — |
| `STREET_NAME` | STRING | **Desc**: Tên đường.  **Sample value**: ['Hoàng Văn Thái', 'Lê Hồng Phong', 'None', 'Quán Trung'] | — |
| `TOTAL_RATING` | FLOAT | **Desc**: Tổng số điểm đánh giá.  **Sample value**: ['0.0', '1.0'] | — |
| `IS_DELIVERABLE` | FLOAT | **Desc**: Trạng thái có thể giao hàng.  **Sample value**: ['nan'] | — |
| `CHECK_LOCATION_ALLEY` | STRING | **Desc**: Kiểm tra vị trí hẻm.  **Sample value**: ['Other'] | — |
| `STREET_ID` | FLOAT | **Desc**: ID của đường.  **Sample value**: ['106912.0', '111152.0', '124487.0', 'nan'] | — |
| `TYPE_OA` | STRING | **Desc**: Loại OA.  **Sample value**: ['OA Store', 'OA Brand'] | — |
| `OA_ID_BRAND` | STRING | **Desc**: ID của OA Brand/ OA cha  **Sample value**: ['9892658', 'None'] | — |
| `OA_PARENT_STATUS_DEFINE` | STRING | **Desc**: Trạng thái của OA cha  **Sample value**: ['CURRENT LINK', 'REJECT', 'WAITING FOR APPROVE'] | — |
| `OA_PARENT_IS_DELETED` | FLOAT | **Desc**: Trạng thái xóa của OA cha.  **Sample value**: ['0.0', 'nan'] | — |
| `PUBLISH` | FLOAT | **Desc**: Trạng thái hiển thị của OA trên momo  **Sample value**: ['0.0', '1.0'] | — |
| `DISPUTE_STATUS_DEFINE` | STRING | **Desc**: Dispute status liên quan đến status Ops check KYB  **Sample value**: Dispute status có các giá trị: NONE_OR_RESOLVED(1), WAITING_FOR_VERIFICATION(2), WAITING_FOR_RECLAIM_VERIFICATION(3); | — |
| `CLAIM_TS` | DATETIME | **Desc**: Thời gian yêu cầu claim  **Sample value**: ['NaT'] | — |
| `OA_CLAIM_STATUS` | STRING | **Desc**: Trạng thái claim request của OA.  **Sample value**: WAIT_FOR_APPROVAL, REJECTED, APPROVED | — |
| `FINAL_OA_STATUS` | STRING | Status cuối cùng của OA  UNKNOWN DRAFT_INIT DRAFT_PENDING DELETED CLAIMED DRAFT_CANCELED UNCLAIMED WAITING_FOR_VERIFICATION DRAFT_REJECTED | — |
| `FNB_LEVEL` | FLOAT | Thông tin về merchant badge gamification của các store FnB | — |
| `CONTACT_NUMBER_AID` | STRING | SĐT contact của cửa hàng theo định dạng agent_id | — |

### `project-5400504384186300846.MBI_DA.F_OA_USER_ACTION`
> Bảng tổng hợp các action của user có tương tác engage với BP

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATETIME` | DATETIME | Ngày giờ engage | — |
| `DATE` | DATE | Ngày engage | — |
| `AGENT_ID` | STRING | AGENT_ID của user engage | — |
| `OA_ID` | STRING | ID của OA được engage | — |
| `ACTION_TYPE_DETAIL` | STRING | Chi tiết các action của user (VD: click button nào) | — |
| `EVENT_ID` | STRING | ID của event user engage | — |
| `ACTION_TYPE` | STRING | Các action của user, bao gồm chat_engage click_any_button save_collection review_rating follow_oa post_engage screen_OA_detail | — |
| `INTERNAL_OR_EXTERNAL` | STRING | OA đó là OA internal hay external | — |
| `M4B_CAT` | STRING | M4B category của OA | — |

### `project-5400504384186300846.MBI_DA.F_OA_MERCHANT_ACTION_TRACKING`
> Bảng record tất cả action engage của Merchant

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATETIME` | DATETIME | Ngày giờ engage | — |
| `DATE` | DATE | Ngày engage | — |
| `OA_ID` | STRING | ID của OA engage | — |
| `ACTION_TYPE` | STRING | Tên action engage của MC, bao gồm: post_create content_update story_create campaign_join banner_update image_upload broadcast_create | — |
| `SUB_ACTION` | STRING | Tên của các action phụ mà MC engage | — |
| `SOURCE` | STRING | Source engage của MC | — |
| `CREATE_SOURCE` | STRING | Source OA được tạo | — |
| `PARTNER_CODE` | STRING | Code định danh merchant | — |
| `STORE_CODE` | STRING | Code định danh store | — |
| `OA_STORE_NAME` | STRING | Tên của OA | — |
| `OA_CATEGORY` | STRING | Category của OA | — |
| `TYPE_OA` | STRING | Phân loại OA: OA Store/ OA Brand | — |
| `IS_OA_ACTIVE` | BOOLEAN | OA có active và tìm kiếm được trên momo không | — |
| `OA_QUALITY` | STRING | Level quality của OA | — |
| `IS_STATUS_SOCIAL_PACKAGE` | STRING | Trạng thái đăng kí gói Social của OA | — |
| `OA_ID_CHILD` | STRING | ID của OA con | — |
| `INTERNAL_OR_EXTERNAL` | STRING | OA đó là internal hay external | — |
| `M4B_CAT` | STRING | M4B_CATEGORY của OA | — |

### `project-5400504384186300846.MBI_DA.OA_TDMM_EVENT_v2_converted`
> Bảng chứa tất cả các event của BP và TĐMM

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `DATE_PARTITION` | TIMESTAMP | **Desc**: Thời gian phân vùng dữ liệu.  **Sample value**: ['2024-11-21 00:20:44.123000+00:00', '2024-11-21 02:59:15.035000+00:00', '2024-11-21 03:57:25.043000+00:00'] | — |
| `DATE` | DATE | **Desc**: Ngày diễn ra sự kiện.  **Sample value**: ['2024-11-21'] | — |
| `DATETIME` | DATETIME | **Desc**: Thời gian cụ thể diễn ra sự kiện.  **Sample value**: ['2024-11-21 07:20:44.123', '2024-11-21 09:59:15.035', '2024-11-21 10:57:25.043'] | — |
| `USER_ID` | STRING | **Desc**: ID của người dùng thực hiện sự kiện.  **Sample value**: ['32377539', '34061292', '44141058'] | — |
| `EVENT_NAME` | STRING | **Desc**: Tên của sự kiện diễn ra.  **Sample value**: ['service_block_clicked'] | — |
| `SCREEN_NAME` | STRING | **Desc**: Tên màn hình nơi sự kiện diễn ra.  **Sample value**: ['destination_pages', 'home', 'voucher_detail'] | — |
| `TAB_NAME` | STRING | **Desc**: Tên tab nơi sự kiện diễn ra.  **Sample value**: [''] | — |
| `BUTTON_NAME` | STRING | **Desc**: Tên nút bấm được người dùng tương tác.  **Sample value**: [''] | — |
| `COMPONENT_NAME` | STRING | **Desc**: Tên thành phần của ứng dụng liên quan đến sự kiện.  **Sample value**: ['', 'list_medium', 'single_card'] | — |
| `OA_ID` | STRING | **Desc**: ID của Official Account liên quan đến sự kiện.  **Sample value**: ['None'] | — |
| `STORE_CODE` | STRING | — | — |
| `PARTNER_CODE` | STRING | — | — |
| `OA_STORE_NAME` | STRING | — | — |
| `SERVICE_NAME` | STRING | — | — |
| `BLOCK_NAME` | STRING | — | — |
| `ICON_NAME` | STRING | — | — |
| `FIELD_NAME` | STRING | — | — |
| `TRAIL_ID` | STRING | — | — |
| `OA_CATEGORY` | STRING | — | — |
| `MOMO_SESSION_ID_V2` | STRING | — | — |
| `EVENT_ID` | STRING | — | — |
| `GIFT_TYPE` | STRING | — | — |
| `CAMPAIGN_ID` | STRING | — | — |
| `UTM_MEDIUM` | STRING | — | — |
| `STATUS` | STRING | — | — |
| `FIREBASE_ERROR` | STRING | — | — |
| `GLOBAL_TRIGGER_ID` | STRING | — | — |
| `SEARCH` | STRING | — | — |
| `ERROR_VALUE` | STRING | — | — |
| `SOURCEFROMFORTRACKING` | STRING | — | — |
| `SERVICENAME` | STRING | — | — |
| `ACTION` | STRING | — | — |
| `GIFT_ID` | STRING | — | — |
| `MINIAPP_VERSION` | STRING | — | — |
| `STAGE` | STRING | — | — |
| `COMPONENT_TYE` | STRING | — | — |
| `FIREBASE_SCREEN_CLASS` | STRING | — | — |
| `SLOT` | STRING | — | — |
| `TIMESTAMP__` | STRING | — | — |
| `UTM_CAMPAIGN` | STRING | — | — |
| `PRODUCT_LIST` | STRING | — | — |
| `REDIRECTTO` | STRING | — | — |
| `FIREBASE_EVENT_ORIGIN` | STRING | — | — |
| `BUILD_NUMBER` | STRING | — | — |
| `USER_PSEUDO_ID` | STRING | — | — |
| `OA_ID_PARAM` | STRING | — | — |
| `DEEPLINK_ID` | STRING | — | — |
| `UTM_SOURCE` | STRING | — | — |
| `LABEL_NAME` | STRING | — | — |
| `STOREID` | STRING | — | — |
| `ATTRIBUTION_ID` | STRING | — | — |
| `ZERO_BANNER` | STRING | — | — |
| `SOURCE` | STRING | — | — |
| `EVENT_COUNT` | STRING | — | — |
| `BUTTON` | STRING | — | — |
| `PRODUCT_NAME` | STRING | — | — |
| `PRODUCT_ID` | STRING | — | — |
| `IMAGE_NAME` | STRING | — | — |
| `NETWORK_TYPE` | STRING | — | — |
| `TRAN_ID` | STRING | — | — |
| `COMPONENT_TYPE` | STRING | — | — |
| `ENGAGED_SESSION_EVENT` | STRING | — | — |
| `TRIGGER_ID` | STRING | — | — |
| `STORE_ID` | STRING | — | — |
| `PROVIDER` | STRING | — | — |
| `MERCHANT_ID` | STRING | — | — |
| `PRODUCT` | STRING | — | — |
| `USERSESSIONTOKEN` | STRING | — | — |
| `PRODUCT_IDS` | STRING | **Desc**: Danh sách ID sản phẩm liên quan đến sự kiện.  **Sample value**: ['None'] | — |
| `TIME_LOAD` | STRING | **Desc**: Thời gian tải liên quan đến sự kiện.  **Sample value**: ['None'] | — |
| `TIMESTAMP` | STRING | **Desc**: Dấu thời gian của sự kiện.  **Sample value**: ['None'] | — |
| `ORDER_NUMBER` | STRING | **Desc**: Số đơn hàng liên quan đến sự kiện.  **Sample value**: ['None'] | — |
| `MINIAPPID` | STRING | **Desc**: ID của miniapp liên quan đến sự kiện.  **Sample value**: ['None'] | — |
| `KEYWORD` | STRING | **Desc**: Từ khóa liên quan đến sự kiện.  **Sample value**: ['None'] | — |
| `CAMPAIGN_NAME` | STRING | **Desc**: Tên chiến dịch liên quan đến sự kiện.  **Sample value**: ['None'] | — |
| `TIME_SLOT` | STRING | **Desc**: Khoảng thời gian của sự kiện.  **Sample value**: ['None'] | — |
| `BLOCK` | STRING | **Desc**: Block liên quan đến sự kiện.  **Sample value**: ['None'] | — |

## Memory
*11 entries — user-trained knowledge*

1. Hệ thống Chứng khoán CV (OA_ID: 9933291), Quỹ Toàn Năng (OA_ID: 9926379), Mini App (OA_ID: 9877093), Vũ Trụ Game (OA_ID: 9926968), MoMo Building (OA_ID: 1033711), Trợ thủ Đầu Tư (OA_ID: 9898513) are classified as internal BPs. _Business Page · 2025-07-28_
2. Bestie Tài Chính (OA_ID: 10388639) is internal. _Business Page · 2025-07-28_
3. Hệ thống Chứng khoán CV (OA_ID: 9933291) is internal. _Business Page · 2025-07-28_
4. Các phần OA trong danh mục 'Unknown' đa phần là internal hoặc thuộc bên OA của FS _2025-11-03_
5. An Toàn Bảo Mật (OA_ID: 9926774), Mèo Chill Tài (OA_ID: 10484644), Bestie Tài Chính (OA_ID: 10388639), Boss Tổng Ting Ting (OA_ID: 10488532) are classified as internal BPs. _Business Page · 2025-07-28_
6. Boss Tổng Ting Ting (OA_ID: 10488532) is internal. _Business Page · 2025-07-28_
7. An Toàn Bảo Mật (OA_ID: 9926774) is internal. _Business Page · 2025-07-28_
8. Khi xử lý vấn đề liên quan tới tài khoản OA level 1, dùng OA_QUALITY = 'Level_1' cho cột _Business Page · 2025-08-10_
9. Mèo Chill Tài (OA_ID: 10484644) is internal. _Business Page · 2025-07-28_
10. Tính toán số trung bình hãy làm tròn đến 2 chữ số thập phân khi ra output _Business Page · 2025-08-10_
11. Bestie Sinh Viên (OA_ID: 10388639) is internal. _2025-11-01_
