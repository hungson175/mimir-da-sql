# ITC: MiniApp Performance

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `a8e52ce3-b404-42fe-afff-30201ea2897e`

## Description
Lấy các chỉ số của từng Miniapp trong MoMo

## Tables

### `momovn-mini-app-analyst.MINI_APP_PLATFORM.STT_APDEX_BY_DETAIL`
> Bảng momovn-mini-app-analyst.MINI_APP_PLATFORM.STT_APDEX_BY_DETAIL chứa thông tin về chỉ số Apdex của các mini app cụ thể. Thông tin có thể được lấy từ bảng này bao gồm:
- Ngày báo cáo của chỉ số Apdex cho từng mini app
- Phiên bản ứng dụng và số bản dựng liên quan
- Hệ điều hành thiết bị và chi tiết từng mini app
- Trạng thái hài lòng và trạng thái chịu đựng của người dùng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `report_date` | DATE | Ngày báo cáo cho chỉ số Apdex của mini app. | 2025-07-24, 2025-07-25, 2025-07-26 |
| `miniapp_id` | STRING | Mã định danh duy nhất của từng mini app. | vn.momo.payment, vn.momo.billpay, vn.momo.finance |
| `feature_code` | STRING | Mã định danh của tính năng trong mini app. | transaction_result, request_payment, billpaycenter |
| `screen_name` | STRING | Tên màn hình hiển thị của mini app. | FSDefaultScreen, HomeScreen, AppEntry |
| `app_version` | STRING | Phiên bản ứng dụng của MoMo khi mini app chạy. | 4.2.20, 4.2.19, 4.2.9 |
| `build_number` | STRING | Số hiệu bản dựng của ứng dụng MoMo khi mini app chạy. | 42201, 42191, 42120 |
| `miniapp_version` | STRING | Phiên bản của mini app. | 0, 4779, 4772 |
| `device_os` | STRING | Hệ điều hành của thiết bị khi chạy mini app. | IOS, ANDROID, iOS |
| `satisfied` | INTEGER | Số lượng người dùng cảm thấy hài lòng với mini app. | 1, 2, 0 |
| `tolerating` | INTEGER | Số lượng người dùng cảm thấy chấp nhận được với mini app. | 0, 1, 2 |
| `total_records` | INTEGER | Tổng số lượng người dùng được ghi nhận trong chỉ số Apdex. | 1, 2, 3 |

### `momovn-mini-app-analyst.MINI_APP_PLATFORM.STG_MINIAPP_LOAD_TOAST_SCREEN_ERROR`
> Bảng này ghi lại các lỗi xảy ra khi tải màn hình toast trong miniapp. Dữ liệu có thể được sử dụng để phân tích các lỗi tải của miniapp, xác định vấn đề liên quan đến hệ điều hành thiết bị, phiên bản ứng dụng, và mã lỗi cụ thể.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `report_date` | DATE | Ngày ghi nhận lỗi xảy ra. | 2025-03-10, 2025-05-05, 2025-03-05 |
| `stage` | STRING | Giai đoạn phát sinh lỗi trong miniapp. | scr_fail_loading_miniapp, toast_fail_loading_miniapp, miniapp_render_status |
| `error_code` | STRING | Mã lỗi phát sinh khi tải màn hình toast. | 419 - P13, 403 - P11, 213 - M02 |
| `device_os` | STRING | Hệ điều hành của thiết bị tại thời điểm xảy ra lỗi. | IOS, ANDROID |
| `app_version` | STRING | Phiên bản ứng dụng MoMo sử dụng khi xảy ra lỗi. | 4.2.12, 4.2.20, 4.2.16 |
| `app_id` | STRING | Mã định danh của ứng dụng. | vn.momo.appx, vn.momo.cornerstone, vn.momo.platform |
| `feature_code` | STRING | Mã tính năng liên quan khi tải màn hình toast. | , newuser_widget, cornerstone_widget |
| `miniapp_type` | STRING | Loại miniapp xảy ra lỗi. | miniapp_react_native, widget_react_native, native |
| `agent_id` | INTEGER | Mã định danh cho mỗi ví MoMo. | 0, 53841180, 45714679 |
| `error_message` | STRING | Thông điệp lỗi chi tiết khi tải màn hình toast. | 403 - P11 Get remote version failed by user network: null content: null - , 419 - P13 Load miniapp bundle failed -> Timeout when waiting root bundle loaded -> Force platform f, 500 - B07 No version found from remote with errorCode: 1 errorMessage: not found newest app version - null |
| `mini_app_version` | STRING | Phiên bản miniapp khi xảy ra lỗi. | , 0, 1892 |
| `stage_id` | INTEGER | ID của giai đoạn phát sinh lỗi. | 19, 18, 6 |
| `build_number` | INTEGER | Số bản dựng của ứng dụng MoMo. | 42120, 42201, 42160 |
| `event_id` | STRING | ID của sự kiện liên quan đến lỗi. | q5szBRpNTMu1RoGOqCpRp, glDWGplRKUudLYf_wxbHd, dW7ZXkMo9IHyXidq134oX |
