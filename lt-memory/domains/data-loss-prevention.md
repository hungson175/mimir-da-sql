# Domain: Data Loss Prevention

## Identity
- **Domain ID:** `7a5b7857-5204-4a8a-a961-f427f228cf99`
- **Official Name:** Data Loss Prevention
- **Description:** Cung cấp thông tin về các vấn đề bảo mật, bao gồm danh sách các fields (cột) đang được gắn nhãn (policy tag), thông tin về các nhãn dữ liệu, các truy cập dữ liệu cá nhân của người dùng, các quyền dữ liệu, quyền dữ liệu cá nhân đang được cấp cho người dùng.
- **Metadata fetched:** 2026-02-25 (from API)

## Tables & Columns

### momovn-res-data-services.DLP.OBJECT_TAG_STAGING
> Bảng lưu trữ việc scan và tag (policy tag) của các cột (column) chứa dữ liệu cá nhân (PII). Khi có sự thay đổi trong database (thêm bảng, truncate bảng, sửa cấu trúc bảng) thì hệ thống sẽ scan xem có ...

| Column | Type | Description | Examples |
|--------|------|-------------|----------|
| project_id | STRING | Project của cột được gắn nhãn | project-5400504384186300846, momovn-prod, momovn-dev |
| dataset_id | STRING | Dataset của cột được gắn nhãn | CONNECTOR, REPORT, SF |
| table_id | STRING | Table của cột được gắn nhãn | RESET_PIN_TRACKING, BACKEND_REGISTER_LOGIN_TRACKING_V2, ALL_CORE_TRANS |
| column_name | STRING | Tên column được gắn nhãnColumn được gắn nhãn | agent_id, PHONE_NUMBER, user_id |
| tag_taxonomy_project_id | STRING | Project của Tag taxonomyTag taxonomy | momovn-res-data-services |
| tag_taxonomy_location | STRING | Location của Tag taxonomyLocation của Tag taxonomy | us |
| tag_taxonomy_name | STRING | Tên Tag taxonomyTên  | High Sensitivity |
| tag_name | STRING | Tên policy tag (nhãn). Nếu giá trị là "none" thì cột đó không được bỏ qua trong việc gắn nhãn. Nếu l... | none, Phone number, Private content |
| created_time | TIMESTAMP | Thời gian scan và gắn nhãn. | 2023-09-06 15:35:43.533315+00, 2023-12-18 08:34:07.871120+00, 2024-05-05 09:44:40.837388+00 |
| last_updated_time | TIMESTAMP | Thời gian cập nhật nhãnThời gian cập nhật  | 2023-09-07 00:00:00+00, 2024-05-07 06:49:20.455940+00, 2024-03-15 09:32:45.796133+00 |
| last_updated_by | STRING | Người thực hiện cập nhật lần cuối cùng | quoc.ho@mservice.com.vn, system, hue.truc@mservice.com.vn |
| table_pattern | STRING | Mẫu pattern của table | AGENT_BODY_, cloudaudit_googleapis_com_activity_, cloudaudit_googleapis_com_data_access_ |
| parent_column | STRING | Column cha trong cấu trúc của bảng | protopayload_auditlog, agent_id, PHONE_NUMBER |
| data_type | STRING | Loại dữ liệu của cột được gắn nhãn | STRING, INT64, FLOAT64 |

## Suggested Probe Questions
- Status: **Not yet probed**