# Customer Experience: CEE USER SUGGESTIONS

**Domain ID:** `20e405eb-5b2b-4a23-bacc-35196c4e707d`
**Last refreshed:** 2026-03-03

## Description
The dataset records information about user suggestions received through Feedback Feature in all CS channel

## Schema DDL
```sql
###Dataset name: CEE USER SUGGESTIONS -- Description: The dataset records information about user suggestions received through Feedback Feature channel
CREATE TABLE `momovn-cee-shared.CEE_MAIL.FF_CONTENTS_V2` (
  created_date -- DATE, -- Ngày ghi nhận ticket được tạo
  bu -- STRING, -- Business Unit được phân cho ticket
  service_plus -- STRING, -- Phân loại dịch vụ góp ý
  ticket_id -- STRING, -- mã phản ánh / ID của ticket
  source -- STRING, -- Nguồn gửi góp ý
  level2 -- STRING, -- Level 2 của ticket góp ý
  level3 -- STRING, -- Level 3 của ticket góp ý
  category -- STRING, -- Phân loại category góp ý
  contents -- STRING, -- Nội dung góp ý của khách hàng kèm Ticket ID
);#Table Data Examples
  created_date                         bu               service_plus       ticket_id            source                level2                 level3                      category                                                                                                                                                                                                                                                               contents
0   2025-05-07                Xác thực ví      Xác Thực eKYC Và TT23  250112.0000718  Feedback Feature             Tài Khoản  Xác Thực eKYC Và TT23                    Góp ý khác                                                                                                                                                                                                                    nên cho nhiều lì xì hơn (Ticket ID: 250112.0000718)
1   2025-04-05       Thu hộ vay tiêu dùng       Thu hộ vay tiêu dùng  250430.0002956          FAQs             Tính Năng               Paylater            Góp ý về tính năng                                                                                                                                                                                                       tránh gian lận và mất uy tín từ MoMo (Ticket ID: 250430.0002956)
2   2025-05-19                 Ví Trả Sau                 Ví Trả Sau  250116.0003735             Email  Tài Chính - Bảo Hiểm   Thu hộ vay tiêu dùng    Góp ý về vận hành sản phẩm  không có nhu cầu dùng những ưu đãi này và những phần quà ttương tự. đã nhiều lần phản ánh rồi \ntặng ra tặng chứ đừng như kiểu gài, cho 50k với điều kiện bỏ ra hơn 50k, khôn vậy dưới xóm khoá mỗm xích lại hết rồi.\nđừng gửi dùm thêm  (Ticket ID: 250116.0003735)
3   2025-04-14  Chuyển tiền đến Ngân hàng  Chuyển tiền đến Ngân hàng  250122.0009356              None  Chi hộ vay tiêu dùng         Captcha Puzzle  Góp ý về chính sách sản phẩm  thêm nhiều voucher giảm tiền điện,  nước (Ticket ID: 250122.0009356)
4   2025-05-05            Online Payments                  Promotion  241226.0000914              None      Chuyển Nhận Tiền  Quỹ nhóm - Money Pool                          None                         Phần thông báo "lưu thẻ thành công" đè lên 2 chức năng "bỏ-lưu", phải chờ thông báo này tắt đi mới bấm lưu tiếp được. Gây bất tiện, cũng như mất thời gian cho người dùng. Mong đội ngũ dev thiết kế lại phần này. (Ticket ID: 241226.0000914)

```
