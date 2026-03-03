# Domain: CDO: Data Ownership

## Identity
- **Domain ID:** `51216294-46c7-4058-8ba2-aa53f7409fe6`
- **Description:** Thông tin về data contract, data owner, những bảng đã được lên contract và data quality của những bảng đã được lên contract.
- **Tables:** 3
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-cdo-shared.DATA_OWNERSHIP.DIM_CONTRACT_LAST_VERSION

*No columns listed in metadata.*

### momovn-cdo-shared.DATA_OWNERSHIP.AURORA_FACT_TABLES_IN_CONTRACT

*No columns listed in metadata.*

### momovn-cdo-shared.DATA_OWNERSHIP.AURORA_FACT_APPROVALS

*No columns listed in metadata.*

## Domain Knowledge (from Mimir)

- Phân biệt data owner, data consumer và data producer: phân biệt giữa Data Owner, Data Consumer, và Data Producer:

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
Vai trò tập trung vào khía cạnh kỹ thuật của dữ liệu hơn là quản lý hoặc phân tích.

- Làm sao để làm contract cho luồng ingestion hoặc luồng deletion?: Để làm contract cho luồng ingestion hoặc luồng deletion, bạn hãy tham khảo tài liệu sau để biết thêm thông tin chi tiết: https://docs.google.com/presentation/d/1SkWtFaKTvuXOSmyhhD7kKlGeqYc_MyQoi3Z3L3LgFpU/edit#slide=id.g2d063bdb225_0_366
- Quy trình làm data contract ở đâu và như thế nào?: Để tạo một Data Contract, bạn cần thực hiện các bước sau:

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
Lưu ý: Nếu không tìm thấy bảng dữ liệu, yêu cầu DP thêm vào Data Catalog. Tham khảo kĩ hơn hướng dẫn tại nguồn sau: https://docs.google.com/presentation/d/1zZT3OyTmKJhAVes-AFDeijalAadLiOSO6wWelkfixNI/edit#slide=id.g2d18997cff3_0_177
- Data Ownership là gì?: Data Ownership là khái niệm liên quan đến việc xác định và quản lý trách nhiệm đối với dữ liệu trong một tổ chức. Người sở hữu dữ liệu có quyền và trách nhiệm quản lý dữ liệu, đảm bảo dữ liệu được sử dụng đúng cách, bảo vệ, và duy trì tính nhất quán cũng như chất lượng của nó.

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

https://docs.google.com/presentation/d/1UdITIVcmHwtDEr039FlOKMBql0kDlqku5Gs5PD2YNMY/edit#slide=id.g2a72fe3fded_1_222
- Muốn lên contract cho luồng deletion và ingestion thì làm như thế nào?: Process cho deletion và ingestion contract có thể tìm thấy ở đây: https://docs.google.com/presentation/d/1SkWtFaKTvuXOSmyhhD7kKlGeqYc_MyQoi3Z3L3LgFpU/edit#slide=id.g2d1e5fbfe33_0_10
- Tại sao cần Data Contract?: 1. Đảm bảo Chất lượng Dữ liệu
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
Data Contract đảm bảo rằng dữ liệu được xử lý, lưu trữ, và chia sẻ phù hợp với các quy định pháp lý và chính sách nội bộ.

- Vai trò của data owner là gì?: Người sở hữu dữ liệu là người đưa ra các quyết định chiến lược, chịu trách nhiệm quản lý các tài sản dữ liệu quan trọng, đảm bảo việc bảo vệ, tính nhất quán và chất lượng của dữ liệu. Họ được trang bị các công cụ và chính sách để quản lý hiệu quả lĩnh vực của mình.



## Suggested Probe Questions

- User count / MAU query possible (has user ID column)
- Numeric aggregation possible (has numeric columns)
- Time-series query possible (has date column)
- Status: **Not yet probed**
