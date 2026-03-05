# Data Loss Prevention

**Domain ID:** `7a5b7857-5204-4a8a-a961-f427f228cf99`

## Description
Cung cấp thông tin về các vấn đề bảo mật, bao gồm danh sách các fields (cột) đang được gắn nhãn (policy tag), thông tin về các nhãn dữ liệu, các truy cập dữ liệu cá nhân của người dùng, các quyền dữ liệu, quyền dữ liệu cá nhân đang được cấp cho người dùng.

## Tables

### `momovn-res-data-services.DLP.OBJECT_TAG_STAGING`
> Bảng lưu trữ việc scan và tag (policy tag) của các cột (column) chứa dữ liệu cá nhân (PII). Khi có sự thay đổi trong database (thêm bảng, truncate bảng, sửa cấu trúc bảng) thì hệ thống sẽ scan xem có dữ liệu cá nhân không và lưu trữ vào bảng này. Sau đó hệ thống đánh tag sẽ thực hiện việc đánh tag dữ liệu. Mỗi dòng ở bảng này tương ứng với một lần scan của một column và tag tương ứng được gắn. Từ bảng này, có thể lấy thông tin về: 
- Project, dataset, và table của cột được gắn nhãn. 
- Tên policy tag được gắn cho từng cột. 
- Thời gian scan và thời gian cập nhật nhãn.Bảng lưu trữ việc scan và tag (policy tag) của các cột (column) chưa dữ liệu cá nhân (PII). Khi có sự thay đổi trong database (thêm bảng, truncate bảng, sửa cấu trúc bảng) thì hệ thống sẽ scan xem có dữ liệu cá nhân không và  lưu trữ vào bảng này. Sau đó hệ thống đánh tag sẽ thực hiện việc đánh tag dữ liệu. Mỗi dòng ở bảng này là tương ứng với 1 lần scan của 1 column và tag tương ứng được gắn.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `project_id` | STRING | Project của cột được gắn nhãnProject của cột được gắn nhãn | project-5400504384186300846, momovn-prod, momovn-dev |
| `dataset_id` | STRING | Dataset của cột được gắn nhãnDataset của cột được gắn nhãn | CONNECTOR, REPORT, SF |
| `table_id` | STRING | Table của cột được gắn nhãnTable của cột được gắn nhãn | RESET_PIN_TRACKING, BACKEND_REGISTER_LOGIN_TRACKING_V2, ALL_CORE_TRANS |
| `column_name` | STRING | Tên column được gắn nhãnColumn được gắn nhãn | agent_id, PHONE_NUMBER, user_id |
| `tag_taxonomy_project_id` | STRING | Project của Tag taxonomyTag taxonomy | momovn-res-data-services |
| `tag_taxonomy_location` | STRING | Location của Tag taxonomyLocation của Tag taxonomy | us |
| `tag_taxonomy_name` | STRING | Tên Tag taxonomyTên | High Sensitivity |
| `tag_name` | STRING | Tên policy tag (nhãn). Nếu giá trị là "none" thì cột đó không được bỏ qua trong việc gắn nhãn. Nếu lần scan trước đó column được gắn nhãn, và ở lần scan sau nếu tag_name là "none" thì sẽ bỏ qua column này, policy tag được gắn trước đó vẫn giữ nguyênTên policy tag (nhãn). Nếu giá trị là "none" thì cột đó không được bỏ qua trong việc gắn nhãn. Nếu lần scan trước đó column được gắn nhãn, và ở lần scan sau nếu tag_name là "none" thì sẽ bỏ qua column này, policy tag được gắn trước đó vẫn giữ nguyên | none, Phone number, Private content |
| `created_time` | TIMESTAMP | Thời gian scan và gắn nhãn.Thời gian scan và gắn nhãn. | 2023-09-06 15:35:43.533315+00, 2023-12-18 08:34:07.871120+00, 2024-05-05 09:44:40.837388+00 |
| `last_updated_time` | TIMESTAMP | Thời gian cập nhật nhãnThời gian cập nhật | 2023-09-07 00:00:00+00, 2024-05-07 06:49:20.455940+00, 2024-03-15 09:32:45.796133+00 |
| `last_updated_by` | STRING | Người thực hiện cập nhật lần cuối cùng | quoc.ho@mservice.com.vn, system, hue.truc@mservice.com.vn |
| `table_pattern` | STRING | Mẫu pattern của table | AGENT_BODY_, cloudaudit_googleapis_com_activity_, cloudaudit_googleapis_com_data_access_ |
| `parent_column` | STRING | Column cha trong cấu trúc của bảng | protopayload_auditlog, agent_id, PHONE_NUMBER |
| `data_type` | STRING | Loại dữ liệu của cột được gắn nhãn | STRING, INT64, FLOAT64 |
