# Domain: MiMir Performance

## Identity
- **Domain ID:** `0affe82b-83ee-47f6-81e3-8a44e74db5f3`
- **Description:** Dữ liệu người dùng MiMir - Dữ liệu & AI Chatbot
- **Tables:** 4
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-mimir.MIMIR.MIMIR_CONVERSATION_LOG_VER2_PROD
> Bảng này ghi nhận nhật ký cuộc trò chuyện của người dùng với hệ thống MIMIR. Bảng bao gồm thông tin như ID cuộc trò chuyện, nội dung tin nhắn, và trạng thái của cuộc trò chuyện.
Thông tin có thể được sử dụng để:
- Theo dõi và phân tích cuộc trò chuyện của người dùng với chatbot MIMIR.
- Đánh giá hiệ...

| Column | Description | Examples |
|--------|-------------|----------|
| _id | Mã định danh duy nhất của nhật ký cuộc trò chuyện. | 68e375f656c2b05afd2296f1, 68e370c556c2b05afd2296df, 68e3d9da56c2b05afd229760 |
| conversation_id | Mã định danh của cuộc trò chuyện. | 68e382b356c2b05afd229713, 68e48cbd56c2b05afd229785, 68e3739aa33f807c1169aac2 |
| role | Vai trò của đối tượng trong cuộc trò chuyện (người dùng hoặc hệ thống). | user, ai |
| user_email | Email của người dùng tham gia cuộc trò chuyện. | — |
| content | Nội dung tin nhắn trong cuộc trò chuyện. | — |
| domain | Tên miền hoặc lĩnh vực của cuộc trò chuyện. | QLCT, Promotion - Platform Performance (Project team only), , BU-FS: Túi Thần Tài |
| status | Trạng thái hiện tại của cuộc trò chuyện. | NEW, DELIVERED |
| created_at | Thời điểm cuộc trò chuyện được tạo ra. | 2025-10-07 04:26:28.275, 2025-10-07 03:52:27.761, 2025-10-07 04:27:46.547 |
| question_message_id | ID của tin nhắn được đặt câu hỏi trong cuộc trò chuyện. | , 68e388cf56c2b05afd229721, 68e495d156c2b05afd2297a9 |
| use_sse | Cờ đánh dấu việc sử dụng công nghệ SSE (Server-Sent Events) trong cuộc trò chuyện. True: sử dụng SSE, False: không sử dụng SSE. | true, false |
| user_id | ID của người dùng tham gia cuộc trò chuyện. | 685e1725e59123624dd44433, 68a5ae45d9853e54aa0158de, 678e03788587a62afca966e8 |

### momovn-mimir.MIMIR.MIMIR_USER_LOG_VER2_PROD
> Bảng này lưu trữ thông tin chi tiết về các phiên đăng nhập và xác thực của người dùng trên hệ thống MIMIR. Nó có thể được sử dụng để: 
 - Xác định thời gian và trạng thái đăng nhập của người dùng 
 - Theo dõi các phiên đăng nhập theo từng người dùng cụ thể 
 - Kiểm tra và xác thực thông tin người dù...

| Column | Description | Examples |
|--------|-------------|----------|
| _id | Mã định danh duy nhất cho mỗi bản ghi người dùng. | 685e51abe59123624dd44443, 6878c188b65cb8c3a23fd29b, 67ef99c15493e66b6c75e28d |
| iat | Thời gian phát hành mã thông báo (issued at time), được lưu dưới dạng số nguyên. | 1751431569, 1757494161, 1753070157 |
| auth_time | Thời gian xác thực phiên đăng nhập của người dùng. | 2025-07-29 09:25:54, 2025-07-28 03:28:06, 2025-07-01 11:56:25 |
| session_state | Trạng thái của phiên đăng nhập người dùng. | 31626219-e833-4c74-b557-1b5b70fcea55, a846f772-58ad-47ac-8fd3-9dd2ce4f49a1, a163ca3d-7221-40f7-9108-24aa81b81d13 |
| email_verified | Trạng thái xác thực email của người dùng, true: email đã được xác thực, false: email chưa được xác thực. | true |
| name | Tên đầy đủ của người dùng. | HOÀNG NGỌC Ý - ITC - AI & Big Data - Lead - Data Science, NGUYỄN DUY ĐĂNG KHOA - ITC - AI & Big Data - Trainee - Data Science, BÙI QUANG TRÂN - ITC - CTO Office - Project Manager I |
| preferred_username | Tên đăng nhập ưa thích của người dùng. | hien.vo2@mservice.com.vn, duy.kieu1@mservice.com.vn, hang.ta@mservice.com.vn |
| given_name | Tên riêng của người dùng. | NGUYỄN THỊ YẾN NHI, HUỲNH SỸ ĐAN, NGUYỄN HỒNG DÂN |
| family_name | Họ của người dùng. | - Product - Senior - Product Executive, - FS - Manager - Growth Marketing, - ITC - AI & Big Data - Lead - Software Engineering |
| picture | Đường dẫn tới ảnh đại diện của người dùng. | https://lh3.googleusercontent.com/a/ACg8ocKWGFD_sszUKDI7eL5RMbkJpHFKdqBzYW2qD0MSqPkh98iAna0=s96-c, https://lh3.googleusercontent.com/a/ACg8ocKTAkv6mTeJQGdsBr_OkjOiu7TnS0ArWn5YN25SK3m50aep0WoO=s96-c, https://lh3.googleusercontent.com/a/ACg8ocLney3fto3KJSzCgJYTXdaPEI9FAP1f8cLF8C6cmQrf1Be8GiWn=s96-c |
| email | Địa chỉ email của người dùng. | hau.nguyen10@mservice.com.vn, tuong.vo@mservice.com.vn, son.nguyen8@mservice.com.vn |
| role | Vai trò của người dùng trong hệ thống. | du_user |
| emailVerified | Trạng thái xác thực email của người dùng dưới dạng số nguyên, thường là 1: đã xác thực, 0: chưa xác thực. | 0 |

### momovn-mimir.MIMIR.MIMIR_DOMAIN_LOG_VER2_PROD
> Bảng này chứa thông tin chi tiết về các hoạt động và đặc điểm của các domain trong hệ thống Mimir của MoMo. 
- Theo dõi thời gian tạo và cập nhật domain.
- Cung cấp thông tin về người tạo, người sở hữu và người cập nhật cuối cùng cho mỗi domain.
- Xác định trạng thái hoạt động và độ nhạy cảm của dom...

| Column | Description | Examples |
|--------|-------------|----------|
| _id | ID duy nhất của mỗi bản ghi trong bảng. | 6841b861fc436c4e0711ae6d, 68d9f2e08c1f6f7f46d8316e, 6841b746fc436c4e0711adcd |
| created_at | Thời gian tạo domain, được lưu dưới dạng UNIX timestamp. | 1752657682099, 1755748309548, 1760327560130 |
| creator_email | Email của người đã tạo ra domain. | hang.nguyen16@mservice.com.vn, hoang.pham5@mservice.com.vn, loc.tu@mservice.com.vn |
| description | Mô tả chi tiết về domain. | Bảng Notification chỉ tổng hợp số lượng notiid giống dạng event, không theo user do bảng user quá nặng không load nổi nên tất cả câu hỏi có chữ "user", "người dùng" đều trả kết quả null
Metric chính sẽ là  delivery outapp, Impression inapp, Click inapp, click outapp, CTR inapp, CTR outapp
Phải input đúng tên campaign name, templateid mới trả ra kết quả |
| domain_department_brief | Mô tả ngắn gọn về bộ phận liên quan đến domain. | CDO |
| domain_id | Mã định danh của domain trong hệ thống. | 72fbb966-0b9b-4205-a433-b14fca48597d, d1e8f246-6e15-4b30-9d5e-ac33d4a03f12, f9ccec9b-d24b-47b8-9e81-1805aa865726 |
| domain_is_active | Trạng thái hoạt động của domain. True: đang hoạt động, False: không hoạt động. | true, false |
| domain_name | Tên của domain. | PAYLATER, Chứng khoán CV, OTA - Business - Bus Transaction, Telco Funnel |
| domain_sensitive | Mức độ nhạy cảm của domain. True: nhạy cảm, False: không nhạy cảm. | false |
| last_updated_at | Thời gian lần cuối domain được cập nhật, dưới dạng UNIX timestamp. | 1752657753002, 1760502926035, 1752745107040 |
| last_updated_by | Email của người đã cập nhật domain lần cuối. |  |
| status | Trạng thái của domain trong hệ thống. | APPROVED, DRAFT, REJECTED |
| owner | Người sở hữu chính chịu trách nhiệm về domain. |  |
| user_role | Vai trò của người dùng liên quan đến domain. | 0 |
| source | Nguồn thông tin hoặc nguồn gốc của domain. | , big-query, catalog |
| updated_at | Thời gian cập nhật gần nhất của domain, dưới dạng số thực. | 1753774953721, 0, 1752826818179 |
| schema_ddl | DDL của schema liên quan đến domain. |  |

### momovn-mimir.MIMIR.MIMIR_DOMAIN_PERMISSION_LOG_VER2_PROD
> Bảng nhật ký quyền truy cập tên miền của Mimir. Bảng này cung cấp dữ liệu về log permission theo tên miền. Có thể sử dụng để: 
- Theo dõi và ghi nhận các thay đổi quyền truy cập vào từng tên miền trong nền tảng Mimir. 
- Kiểm tra lịch sử thay đổi quyền hạn của người dùng và quản trị viên. 
- Phân tí...

| Column | Description | Examples |
|--------|-------------|----------|
| _id | ID của bản ghi trong bảng. | 6841b860fc436c4e0711ae6c, 6841b7affc436c4e0711ae05, 6841b7fa589bbd32a4731c9b |
| created_at | Thời gian bản ghi được tạo. | 2025-06-05 15:28:32.073, 2025-06-05 15:31:53.019, 2025-06-05 15:27:15.203 |
| domain_id | ID của tên miền được ghi nhận. | e5beb7b6-4273-47ff-9755-a5bcf8d51b97, a8e52ce3-b404-42fe-afff-30201ea2897e, 9d86b9d9-bf1e-4bab-8e11-86279716984a |
| domain_role | Vai trò liên quan đến tên miền. | USER, OWNER |
| updated_at | Thời gian bản ghi được cập nhật. | 2025-10-06 04:12:23.777, 2025-08-28 00:15:42.323, 2025-08-25 10:28:42.860 |
| user_id | ID người dùng liên quan đến quyền truy cập. | 678e03788587a62afca966e8, 68bab3811abdb9076eef7509, 6878c238b65cb8c3a23fd2a4 |
| status | Trạng thái của yêu cầu cấp quyền. | APPROVED, REJECTED, IN_REVIEW, WAITING_FOR_ACCEPT |
| request_id | ID của yêu cầu cấp quyền truy cập. | , b93f0598-9e84-4783-a3e2-3f746eb781ed, 02d48ac2-953e-4b83-a702-4c6cd2cace5a |
| user_email | Email của người dùng liên quan đến quyền truy cập. | son.pham9@mservice.com.vn, khoa.nguyen@mservice.com.vn, yen.tran5@mservice.com.vn |

## Suggested Probe Questions

- Status: **Not yet probed**
