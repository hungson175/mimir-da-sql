# CDO: Data Ownership

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `51216294-46c7-4058-8ba2-aa53f7409fe6`

## Description
Thông tin về data contract, data owner, những bảng đã được lên contract và data quality của những bảng đã được lên contract.

## Tables

### `momovn-cdo-shared.DATA_OWNERSHIP.DIM_CONTRACT_LAST_VERSION`
> Bảng này chứa thông tin về phiên bản cuối cùng của các hợp đồng trong hệ thống Aurora. Bảng này cung cấp các thông tin như ID hợp đồng, phiên bản, trạng thái, tên hợp đồng, mô tả, ngày hiệu lực, và các thông tin liên quan đến chủ sở hữu dữ liệu, nhà sản xuất dữ liệu, và người tiêu dùng dữ liệu. Bảng này có thể được sử dụng để theo dõi và quản lý các hợp đồng dữ liệu, kiểm tra trạng thái và phiên bản của hợp đồng, và xác định các bên liên quan trong hợp đồng.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `id` | INTEGER | ID của phiên bản hợp đồngID của phiên bản hợp đồng | 1778, 1194, 2055 |
| `contract_id` | INTEGER | ID của hợp đồngID của hợp đồng. | 338, 216, 528 |
| `version` | INTEGER | Phiên bản của hợp đồngPhiên bản của hợp đồng. | 3, 1, 2 |
| `status` | STRING | Trạng thái của hợp đồngTrạng thái của hợp đồng. | terminated, rejected, awaiting signing |
| `name` | STRING | Tên của hợp đồngTên của hợp đồng | JSM-IT Internal-Operations-Feedback Final-TERMINATED, Online Panel-Ingestion Contract-CIO-SphinxV1, CS-Ingestion Contract-Customer Service-CRM_ADMIN-V0 |
| `description` | STRING | Mô tả chi tiết về hợp đồngMô tả chi tiết về hợp đồng. | — |
| `effective_date` | DATE | Ngày hiệu lực của hợp đồngNgày hiệu lực của hợp đồng | 2025-07-21, 2024-11-26, 2024-09-09 |
| `data_owner` | STRING | Chủ sở hữu dữ liệu của hợp đồngChủ sở hữu dữ liệu của hợp đồng. | linh.nguyen24, anh.pham16, vien.ly |
| `data_producer` | STRING | Người tạo ra các bảng được định nghĩa trong hợp đồngNgười tạo ra các bảng được định nghĩa trong hợp đồng. | toan.mai1, giang.le2, nhan.vo3 |
| `frequency` | STRING | Tần suất cập nhật hoặc kiểm tra hợp đồngTần suất cập nhật hoặc kiểm tra hợp đồng | daily, Daily |
| `stakeholders` | STRING | Stakeholder của các bảng trong hợp đồngStakeholder của các bảng trong hợp đồng | , khanh.ho; hien.cao1 |
| `update_time` | TIMESTAMP | Ngày tạo hợp đồngNgày tạo hợp đồng | 2025-01-10 07:35:29.708140+00, 2024-12-17 09:43:42.786946+00, 2025-10-08 07:16:37.627319+00 |
| `project_name` | STRING | Tên dự án liên quan đến hợp đồngTên dự án liên quan đến hợp đồng | CS , BigQuery_Usage, QLCT |
| `retention` | STRING | Ngày dữ liệu được lưu trữ trong bảngNgày dữ liệu được lưu trữ trong bảng | 90, , 365 |
| `expiration_date` | DATE | Ngày hết hạn của hợp đồngNgày hết hạn của hợp đồng. | 2025-12-05, 2025-07-23, 2026-02-05 |
| `db_type` | STRING | Loại cơ sở dữ liệu liên quan đến hợp đồngLoại cơ sở dữ liệu liên quan đến hợp đồng. | ORACLE, Oracle, Oracle port default 1521 |
| `db_name` | STRING | Tên cơ sở dữ liệu liên quan đến hợp đồngTên cơ sở dữ liệu liên quan đến hợp đồng. | FSCFG  
, giftv2 |
| `contract_type` | STRING | Loại hợp đồngLoại hợp đồng. | Ingestion, Data Model, Deletion |

### `momovn-cdo-shared.DATA_OWNERSHIP.AURORA_FACT_TABLES_IN_CONTRACT`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `contract_id` | INTEGER | ID hợp đồng, dùng để định danh duy nhất cho mỗi hợp đồng trong hệ thống | 194, 17, 282 |
| `contract_type` | STRING | Loại hợp đồng, mô tả phân loại của các hợp đồng khác nhau | Data Model, Deletion, Ingestion |
| `contract_name` | STRING | Tên hợp đồng, giúp nhận diện hợp đồng trong hệ thống | Data Dynamic Pricing - Deletion Contract - Giang.tran5 - V0, Lx24-Deletion Contract-loan.doan-V0, fusion-deletion-bandao-bufi-version1 |
| `contract_status` | STRING | Trạng thái hiện tại của hợp đồng, ví dụ như đang hoạt động, hết hạn, bị hủy,... | signed |
| `last_status` | STRING | Trạng thái cuối cùng của hợp đồng trước khi có sự thay đổi gần đây nhất | signed, terminated, awaiting signing |
| `expected_destination_table_path` | STRING | Đường dẫn dự kiến tới bảng đích, nơi dữ liệu sẽ được chuyển đến | project-5400504384186300846.BUSINESS_PAGE.GAMIFICATION_HISTORY, momovn-ci-shared.IRIS.USER_SURVEY_TRACKING, project-5400504384186300846.SOAP_ADMIN.OP_MINI_APP_ON_USERS |
| `origin_Table` | STRING | Tên bảng nguồn gốc, nơi dữ liệu ban đầu được lấy từ | bigquery.project-5400504384186300846.MBI_DA.DataDP_score_group_test3_2, bigquery.project-5400504384186300846.MBI_DA.F_DONATION_TRANSACTION, bigquery.project-5400504384186300846.MBI_DA.F_DONATION_EVENT |
| `bq_table_type` | STRING | Loại bảng BigQuery trong hệ thống, phân biệt giữa bảng nền và bảng dữ liệu khác | PARTITION, SHARD |
| `table_name` | STRING | Tên bảng, dùng để nhận diện bảng trong hệ thống Aurora | momovn-prod.MBI_DA.BEHALF_USERS_CONSENT_HISTORY, project-5400504384186300846.BACKEND.BACKEND_REGISTER_LOGIN_TRACKING_V2, momovn-prod.LIXI_2024.LX24_GAME_BALANCE_TURN |
| `dag` | STRING | Tên DAG quản lý quy trình ETL liên quan đến bảng | v2_soap_admin__10, v2_connector__8, v2_crm_cvs |
| `schedule_interval` | STRING | Khoảng thời gian lên lịch chạy cho quy trình ETL liên quan đến bảng | 0 3 * * *, 30 3 * * *, 0 2 * * * |
| `bq_table_name` | STRING | Tên bảng trong BigQuery, nơi dữ liệu của hợp đồng được lưu trữ | project-5400504384186300846.BUFI_DATA_SERVICES.MOMO_DRDONG_JUL_SEP_2022_LABEL_UNPROCESSED_YYYYMMDD, project-5400504384186300846.MBI_DA.DataDP_error_nonsensitive_test2_2, project-5400504384186300846.MBI_DA.DataDP_error_sensitive_test2_2 |

### `momovn-cdo-shared.DATA_OWNERSHIP.AURORA_FACT_APPROVALS`
| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `name` | STRING | Tên của người dùng hoặc đối tượng liên quan đến phê duyệt. | OFFLINE PAYMENT MERCHANT PAYOUT - Ingestion Contract - CDO - MERCHANT.STORE_DEVICE - V0, BANK_CUSTOMER_SNAPSHOT-Ingestion Contract-Product-Connector-V0, CINEMA - Ingestion Contract - CDO - B2C_CINEMA |
| `contract_id` | INTEGER | ID của hợp đồng cần được phê duyệt. | 166, 369, 460 |
| `contract_type` | STRING | Loại hợp đồng liên quan đến phê duyệt. | Ingestion, Deletion, Data Model |
| `status` | STRING | Trạng thái hiện tại của phê duyệt hợp đồng. | signed, awaiting signing, rejected |
| `last_update` | TIMESTAMP | Lần cuối cùng thông tin phê duyệt được cập nhật. | 2025-01-10 07:35:29.708140+00, 2024-12-17 09:43:42.786946+00, 2025-04-15 08:55:50.909910+00 |
| `start_date` | TIMESTAMP | Ngày bắt đầu của hợp đồng. | 2025-08-04 02:39:07.057415+00, 2024-08-02 07:37:55.978064+00, 2024-08-02 12:42:05.215698+00 |
| `user` | STRING | Người dùng liên quan đến phê duyệt này. | toan.vo, quoc.ho, vinh.dang |
| `role` | STRING | Vai trò của người dùng trong quá trình phê duyệt. | approval, data_producer, data_owner |
| `end_date` | TIMESTAMP | Ngày kết thúc của hợp đồng. | 2025-03-18 07:48:29.291015+00, 2024-10-17 07:10:11.439040+00, 2024-09-09 02:55:09.759050+00 |

## Memory
*7 entries — user-trained knowledge*

1. Phân biệt data owner, data consumer và data producer: phân biệt giữa Data Owner, Data Consumer, và Data Producer:

1. Data Owner
Vai trò chính:

Chịu trách nhiệm quản lý và giám sát tài sản dữ liệu trong một lĩnh vực cụ thể.
Đảm bảo chất lượng, bảo mật, tuân thủ, và quyền truy cập vào dữ liệu.
Trách nhiệm:

Định nghĩa tiêu chuẩn chất lượng dữ liệu và giải quyết các vấn đề phát sinh dựa trên hợp đồng dữ liệu.
Phê duyệt các yêu cầu truy cập hoặc thay đổi dữ liệu, đặc biệt là xóa dữ liệu.
Đảm bảo metadata của tài sản dữ liệu được cập nhật đầy đủ và chính xác.
Theo dõi thay đổi để tránh ảnh hưởng đến các quy trình hoặc luồng dữ liệu hiện tại.
Đóng vai trò chiến lược trong việc quản lý tài sản dữ liệu.
Quyền hạn:

Quyết định cuối cùng về việc sử dụng, thay đổi, hoặc chia sẻ dữ liệu.
2. Data Consumer
Vai trò chính:

Người sử dụng dữ liệu để phân tích, tạo báo cáo, hoặc đưa ra các quyết định kinh doanh.
Trách nhiệm:

Sử dụng metadata và các nguồn dữ liệu được định nghĩa bởi Data Owner để đảm bảo chính xác và minh bạch.
Phối hợp với Data Owner để đảm bảo rằng dữ liệu được sử dụng phù hợp với yêu cầu kinh doanh.
Theo dõi chất lượng dữ liệu thông qua các báo cáo tập trung và gửi phản hồi khi có vấn đề.
Đảm bảo rằng các yêu cầu truy cập dữ liệu được phê duyệt bởi Data Owner trước khi sử dụng.
Hạn chế:

Không có quyền thay đổi hoặc xóa dữ liệu nếu không có sự phê duyệt từ Data Owner.
3. Data Producer
Vai trò chính:

Người tạo hoặc thu thập dữ liệu từ các hệ thống hoặc quy trình vận hành.
Trách nhiệm:

Đảm bảo dữ liệu được tạo ra chính xác và phù hợp với yêu cầu từ Data Owner hoặc Data Consumer.
Đáp ứng các yêu cầu kỹ thuật để đảm bảo dữ liệu được thu thập, lưu trữ, và chia sẻ theo tiêu chuẩn.
Hỗ trợ quá trình ingest dữ liệu vào hệ thống lưu trữ hoặc kho dữ liệu.
Hạn chế:

Không chịu trách nhiệm về việc sử dụng cuối cùng của dữ liệu hoặc các quyết định kinh doanh dựa trên dữ liệu đó.
Vai trò tập trung vào khía cạnh kỹ thuật của dữ liệu hơn là quản lý hoặc phân tích. _Data Ownership · 2025-05-13_
2. Làm sao để làm contract cho luồng ingestion hoặc luồng deletion?: Để làm contract cho luồng ingestion hoặc luồng deletion, bạn hãy tham khảo tài liệu sau để biết thêm thông tin chi tiết: https://docs.google.com/presentation/d/1SkWtFaKTvuXOSmyhhD7kKlGeqYc_MyQoi3Z3L3LgFpU/edit#slide=id.g2d063bdb225_0_366 _Data Ownership · 2025-05-13_
3. Quy trình làm data contract ở đâu và như thế nào?: Để tạo một Data Contract, bạn cần thực hiện các bước sau:

Quy trình tạo Data Contract
Đồng bộ Metadata:

Đồng bộ Metadata từ nguồn dữ liệu (Oracle hoặc khác) vào Data Catalog.
Cập nhật thông tin: Data Owner, miêu tả bảng/cột, và tag nhạy cảm (nếu cần).
Đăng nhập Aurora Tool:

Truy cập Aurora Tool.
Tạo hợp đồng mới với thông tin: Tên hợp đồng, danh sách bảng, SLA.
Ký và Nộp Hợp đồng:

Ký xác nhận trách nhiệm trên Aurora Tool.
Hợp đồng sẽ được đội DP và CDO xét duyệt trong tối đa 4 ngày làm việc.
Quản lý Hợp đồng:

Theo dõi và cập nhật hợp đồng khi cần.
Lưu ý: Nếu không tìm thấy bảng dữ liệu, yêu cầu DP thêm vào Data Catalog. Tham khảo kĩ hơn hướng dẫn tại nguồn sau: https://docs.google.com/presentation/d/1zZT3OyTmKJhAVes-AFDeijalAadLiOSO6wWelkfixNI/edit#slide=id.g2d18997cff3_0_177 _Data Ownership · 2025-05-13_
4. Data Ownership là gì?: Data Ownership là khái niệm liên quan đến việc xác định và quản lý trách nhiệm đối với dữ liệu trong một tổ chức. Người sở hữu dữ liệu có quyền và trách nhiệm quản lý dữ liệu, đảm bảo dữ liệu được sử dụng đúng cách, bảo vệ, và duy trì tính nhất quán cũng như chất lượng của nó.

Các yếu tố chính của Data Ownership:
Quản lý dữ liệu:
Đảm bảo dữ liệu được lưu trữ, xử lý, và sử dụng theo các tiêu chuẩn đã được đặt ra.
Bảo vệ dữ liệu:
Đảm bảo dữ liệu được bảo mật, tuân thủ các chính sách pháp lý và quy định.
Chất lượng dữ liệu:
Theo dõi và đảm bảo dữ liệu có độ tin cậy cao, phù hợp với mục đích sử dụng.
Trách nhiệm và minh bạch:
Đảm bảo các quyết định về dữ liệu đều có sự giám sát và minh bạch.
Lợi ích của Data Ownership:
Cải thiện chất lượng dữ liệu: Dữ liệu trở nên chính xác, đáng tin cậy và nhất quán hơn.
Tăng cường bảo mật dữ liệu: Các vấn đề về quyền riêng tư và bảo vệ thông tin được quản lý chặt chẽ hơn.
Giảm thời gian ngừng trệ: Các sự cố dữ liệu được phát hiện và khắc phục nhanh chóng.
Hỗ trợ ra quyết định: Dữ liệu chất lượng cao hỗ trợ việc phân tích và ra quyết định chính xác.

Để tìm hiểu thêm về khái niệm data ownership tại Momo, bạn hãy truy cập slide sau: https://docs.google.com/presentation/d/1SrhKOlZgZWjy3KRwcIXbH6Fafg9CYiqozr62mZANpEg/edit#slide=id.g237f3d75e2e_0_53

https://docs.google.com/presentation/d/1UdITIVcmHwtDEr039FlOKMBql0kDlqku5Gs5PD2YNMY/edit#slide=id.g2a72fe3fded_1_222 _Data Ownership · 2025-05-13_
5. Muốn lên contract cho luồng deletion và ingestion thì làm như thế nào?: Process cho deletion và ingestion contract có thể tìm thấy ở đây: https://docs.google.com/presentation/d/1SkWtFaKTvuXOSmyhhD7kKlGeqYc_MyQoi3Z3L3LgFpU/edit#slide=id.g2d1e5fbfe33_0_10 _Data Ownership · 2025-05-13_
6. Tại sao cần Data Contract?: 1. Đảm bảo Chất lượng Dữ liệu
Vấn đề: Chất lượng dữ liệu kém dẫn đến sai lệch trong phân tích, báo cáo và ra quyết định.
Giải pháp:
Data Contract quy định các tiêu chí chất lượng như độ đầy đủ, tính chính xác, và thời gian cập nhật của dữ liệu.
Giúp phát hiện và xử lý các vấn đề chất lượng sớm hơn thông qua quy trình và tiêu chuẩn đã được định nghĩa.
2. Giảm Thiểu Xung Đột Giữa Các Bên
Vấn đề: Các bên liên quan (Producers, Owners, Consumers) thường hiểu sai hoặc không đồng nhất về mục tiêu và cách sử dụng dữ liệu.
Giải pháp:
Data Contract đóng vai trò như một tài liệu tham chiếu, giúp các bên hiểu rõ trách nhiệm của mình và cách phối hợp với nhau.
Loại bỏ các vùng "xám" trong trách nhiệm và giảm thiểu tranh chấp khi xảy ra sự cố.
3. Tăng Tính Minh Bạch và Trách Nhiệm
Vấn đề: Thiếu sự minh bạch trong cam kết và hành động từ các bên dẫn đến gián đoạn quy trình và khó xử lý sự cố.
Giải pháp:
Thỏa thuận rõ ràng về những gì mỗi bên cần cung cấp và thời điểm cần cung cấp.
Xác định rõ người chịu trách nhiệm khi xảy ra lỗi hoặc cần sửa chữa, giúp rút ngắn thời gian gián đoạn.
4. Đáp Ứng Yêu Cầu Kinh Doanh
Vấn đề: Nhiều dữ liệu được tạo ra nhưng không đáp ứng đúng nhu cầu thực tế của doanh nghiệp.
Giải pháp:
Data Contract giúp xác định rõ yêu cầu từ Data Consumers (ví dụ: loại dữ liệu, tần suất cập nhật, định nghĩa các trường dữ liệu).
Đảm bảo dữ liệu phù hợp với mục tiêu kinh doanh và không bị lãng phí.
5. Cải Thiện Quản Lý Dữ Liệu
Vấn đề: Các quy trình quản lý dữ liệu không được chuẩn hóa dẫn đến dữ liệu "bị bỏ rơi" hoặc không sử dụng được.
Giải pháp:
Quy định rõ ràng cách thức thêm mới, xóa, hoặc sửa đổi dữ liệu.
Data Contract giúp duy trì và nâng cao khả năng sử dụng dữ liệu trong dài hạn.
6. Giảm Thời Gian Gián Đoạn Dữ Liệu (Data Downtime)
Vấn đề: Các lỗi dữ liệu thường mất nhiều thời gian để phát hiện và khắc phục do thiếu quy trình rõ ràng.
Giải pháp:
Data Contract tạo ra sự minh bạch trong quy trình từ khâu tạo dữ liệu đến khâu sử dụng, giúp phát hiện lỗi nhanh hơn.
Cải thiện thời gian khắc phục sự cố và duy trì tính liên tục của hệ thống.
7. Hỗ Trợ Tuân Thủ Pháp Lý và Chính Sách
Vấn đề: Các quy định về bảo mật và tuân thủ pháp lý (như GDPR, CCPA) yêu cầu sự kiểm soát chặt chẽ đối với dữ liệu.
Giải pháp:
Data Contract đảm bảo rằng dữ liệu được xử lý, lưu trữ, và chia sẻ phù hợp với các quy định pháp lý và chính sách nội bộ. _Data Ownership · 2025-05-13_
7. Vai trò của data owner là gì?: Người sở hữu dữ liệu là người đưa ra các quyết định chiến lược, chịu trách nhiệm quản lý các tài sản dữ liệu quan trọng, đảm bảo việc bảo vệ, tính nhất quán và chất lượng của dữ liệu. Họ được trang bị các công cụ và chính sách để quản lý hiệu quả lĩnh vực của mình. _Data Ownership · 2025-05-13_
