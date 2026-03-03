# Domain: Chatbot Moni

## Identity
- **Domain ID:** `9066c2ad-5109-4fa9-abc0-06d85c6eed7e`
- **Description:** Chatbot trả lời các câu hỏi liên quan đến sản phẩm Moni bao gồm user, hội thoại và event tracking
- **Tables:** 3
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG
> Bảng ghi lại các nhật ký của các cuộc hội thoại giữa người dùng và chatbot Moni của dịch vụ quản lý chi tiêu QLCT. Thông tin trong bảng này có thể được sử dụng để theo dõi và phân tích các tương tác của người dùng với Moni, đánh giá hiệu quả của các kịch bản giao tiếp và hiểu hành vi người dùng. Các...

### momovn-prod.MBI_DA.MONI_L3_LABEL_EVENT
> Bảng này lưu trữ các sự kiện (events) trong MoMo. Thông tin trong bảng này bao gồm ID của sự kiện, thông tin người dùng, thời gian diễn ra sự kiện, nguồn và hành động liên quan đến sự kiện. 
Các thông tin có thể được lấy từ bảng này bao gồm: 
- Lịch sử sự kiện của người dùng 
- Phân tích hành vi ngư...

### momovn-prod.MBI_DA.TFBV_DAILY_ACTIVE_USER
> Bảng này chứa thông tin về người dùng hoạt động hàng ngày trên MoMo. Dữ liệu trong bảng này cung cấp chi tiết về các tương tác hàng ngày của người dùng với sản phẩm MoMo. 

Thông tin có thể lấy từ bảng này bao gồm: 
- Lịch sử hoạt động hàng ngày theo mã định danh (AGENT_ID) của mỗi người dùng 
- Ngà...

## Domain Knowledge (from Mimir)

- Khi xử lý số lượng tin nhắn, loại trừ user_message là NULL và 'DEFAULT_START_MESSAGE'

## Suggested Probe Questions

- Status: **Not yet probed**
