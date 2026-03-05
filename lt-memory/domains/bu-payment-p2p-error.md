# BU Payment: P2P ERROR

**Domain ID:** `9e15b462-aa3d-4bdc-80ff-dc86a6f83837`

## Description
Dữ liệu về các event lỗi và giao dịch lỗi của người dùng dịch vụ chuyển tiền P2P

## Tables

### `momovn-prod.MBI_DA.P2P_ERROR_ALL`
> Dữ liệu về các event lỗi và giao dịch lỗi của người dùng dịch vụ chuyển tiền P2P. Thông tin từ bảng này có thể được dùng để:
- Theo dõi và phân tích các lỗi xảy ra trong quá trình người dùng thực hiện giao dịch P2P.
- Cải thiện trải nghiệm người dùng bằng cách xác định và xử lý các lỗi phổ biến nhất.
- Đánh giá hiệu suất hệ thống chuyển tiền và định hướng cho các cải tiến công nghệ trong tương lai.Dữ liệu về các event lỗi và giao dịch lỗi của người dùng dịch vụ chuyển tiền P2P

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `month` | DATE | Tháng xảy ra event lỗi hoặc giao dịch lỗi. | 2025-05-01, 2025-04-01, 2025-06-01 |
| `date` | DATE | Ngày xảy ra event lỗi hoặc giao dịch lỗi. | 2025-09-10, 2025-06-03, 2025-06-08 |
| `datetime` | DATETIME | Thời gian cụ thể xảy ra event lỗi hoặc giao dịch lỗi. | 2025-11-10 17:33:08, 2025-04-05 02:44:33, 2025-11-10 17:41:30 |
| `screen` | STRING | Màn hình mà lỗi xảy ra, bao gồm INPUT (màn hình nhập số tiền và lời nhắn), TTAT (màn thanh toán an toàn), KQGD (màn kết quả giao dịch).INPUT là màn hình nhập số tiền và lời nhắn trước khi thực hiện giao dịch, TTAT là màn thanh toán an toàn dùng để user confirm thông tin và xác thực, KQGD là màn kết quả giao dịch | TTAT, INPUT, KQGD |
| `service` | STRING | Loại dịch vụ gặp lỗi, W2W là dịch vụ chuyển tiền ví (wallet) tới ví, W2B là chuyển tiền từ ví tới bank.W2W là dịch vụ chuyển tiền ví (wallet) tới ví, W2B là chuyển tiền từ ví tới bank | W2B, W2W |
| `src` | STRING | Nguồn dữ liệu phát hiện lỗi, có thể từ API, event Popup, hoặc từ các giao dịch Core.nguồn dữ liệu lấy được lỗi đó, thể đến từ thông tin API, thông tin event Popup hoặc từ các giao dịch Core khi đã hình thành giao dịch | API, POPUP, CORE |
| `error_code` | STRING | Mã lỗi.mã lỗi | 881200003, 40000, -9999 |
| `error_description` | STRING | Chi tiết mô tả của lỗi. | , Bạn hãy thử lại hoặc quét mã QR để tiếp tục giao dịch nhé, Ngân hàng thụ hưởng đang bảo trì. Vui lòng thử lại sau ít phút. |
| `agent_id` | STRING | Mã định danh người dùng (user id).mã định danh người dùng, gọi là user id cũng được | 83676480, 95573092, 95517812 |
| `event_id` | STRING | Mã giao dịch hoặc sự kiện của lỗi.mã giao dịch hoặc event của lỗi | ILqYLNwQZhNrRWrILZF-W, zi_eQHKxoMdoos0XcGnR1, rRASU_r6-CZ_1_fxQjbxl |
