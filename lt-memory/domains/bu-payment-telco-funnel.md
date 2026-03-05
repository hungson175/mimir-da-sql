# BU Payment: Telco Funnel

**Domain ID:** `fdc4e81a-0f8e-4412-b5b4-1602705daae6`

## Description
Funnel cơ bản của user Airtime và Data.
Funnel cơ bản của user SIM.
Chỉ sử dụng khi tính về event, traffic, không dùng để tính retention rate.

## Tables

### `momovn-prod.BU_UTILITIES_TELCO.FULL_FUNNEL_TELCO_OPTIMIZE`
> Bảng này mô tả các chỉ số tối ưu hóa funnel cho dịch vụ viễn thông tiện ích trên MoMo. Có thể sử dụng bảng này để phân tích hành vi của người dùng qua từng bước của funnel, xác định loại hình dịch vụ viễn thông được sử dụng phổ biến, và đánh giá hiệu quả các chiến dịch tối ưu hóa dịch vụ.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date_partition` | DATE | Ngày thực hiện hành động của userNgày thực hiện hành động của user | 2025-11-15, 2025-11-14, 2025-12-16 |
| `user_id` | STRING | ID mã hóa của người dùng để tham gia vào các hoạt động của dịch vụ viễn thônguser ở dạng mã hóa | 47349484, 53249364, 50174008 |
| `step` | STRING | Các bước hành động của user trong funnel dịch vụ viễn thông, bao gồm: screen_service, trans_confirmation, is_payment_by_core_trans, MHTTAT, load_KQGD, CTAscreen_service: user xem màn hình dịch vụ (Screen). trans_confirmation: click nút confirm ở MHTTAT(click TTAT). is_payment_by_core_trans: giao dịch thanh toán (đã loại giao dịch auto debit) được ghi nhận ở core (Transactions). MHTTAT:user đã đến step xem MHTTAT (MHTTAT). load_KQGD:load thành công MHKQGD (Load_KQGD). CTA: click nút Mua hàng ở màn hình dịch vụ (Purchase CTA) | screen_service, CTA, MHTTAT |
| `service_name` | STRING | Tên dịch vụ viễn thông. Các giá trị gồm mobilebuycard, mobiletopup, mobilecombo, mobiletopupdatamobilebuycard, mobiletopup: dịch vụ Airtime. mobilecombo, mobiletopupdata: dịch vụ Data. | mobilebuycard, mobiletopupdata, mobiletopup |
| `service` | STRING | Chi tiết dịch vụ viễn thông. Bao gồm: Topup_new, Topup, Topup_revamp, buycard_new, buycard, data_topup, data_topup_new, data_topup_revamp, data_buycard, data_buycard_new, data_combo, data_combo_revampTopup_new, Topup, Topup_revamp, topup: dịch Topup Airtime. buycard_new, buycard: dịch vụ mã thẻ Airtime. data_topup, data_topup_new, data_topup_revamp: dịch vụ topup data. data_buycard, data_buycard_new:dịch vụ mã thẻ Data. data_combo, data_combo_revamp: dịch vụ combo data | topup, data_topup, Topup_revamp |
| `number_event` | INTEGER | Số lượng traffic hoặc giao dịch nếu bước là is_payment_by_core_transsố lượng traffic/số lượng giao dịch (nếu ở step = is_payment_by_core_trans) | 1, 2, 3 |
| `airtime_segment_user` | STRING | Phân khúc người dùng dịch vụ Airtime gồm new_user, retain_user, recover_useruser_segment của dịch vụ Airtime. new_user: new user là user lần đầu sử dụng dịch vụ. retain_user: retain user là user dùng dịch vụ tháng trước và tháng này tiếp tục sử dụng dịch vụ. recover_user: recover user là user đã sử dụng dịch vụ trước tháng T-2, tháng này quay lại | retain_user, recover_user, new_user |
| `data_segment_user` | STRING | Phân khúc người dùng dịch vụ Data gồm new_user, retain_user, recover_useruser_segment của dịch vụ Data. new_user: new user là user lần đầu sử dụng dịch vụ. retain_user: retain user là user dùng dịch vụ tháng trước và tháng này tiếp tục sử dụng dịch vụ. recover_user: recover user là user đã sử dụng dịch vụ trước tháng T-2, tháng này quay lại | retain_user, new_user, recover_user |
| `age_group` | STRING | Nhóm tuổi của người dùng với các phân loại: <18 tuổi, 18 - 22 tuổi, 23 - 26 tuổi, 27 - 30 tuổi, 31 - 35 tuổi, 36 - 40 tuổi, >40 tuổiage_group là nhóm tuổi của user. [1]. <18 y/o = nhỏ hơn 18 tuổi [2]. 18 - 22 y/o = từ 18 - 22 tuổi [3]. 23 - 26 y/o = từ 23 - 26 tuổi [4]. 27 - 30 y/o = từ 27 - 30 tuổi [5]. 31 - 35 y/o = từ 31 - 35 tuổi [6]. 36 - 40 y/o = từ 36 - 40 tuổi [7]. >40 y/o = lớn hơn 40 tuổi | [2]. 18 - 22 y/o, [3]. 23 - 26 y/o, [4]. 27 - 30 y/o |

### `project-5400504384186300846.BU_UTILITIES_TELCO.FULL_FUNNEL_SIM_CDOVTTI-189`
> Bảng này chứa thông tin về hành vi và tương tác của người dùng với dịch vụ SIM thông qua các bước, bao gồm loại SIM, sự kiện và xác nhận giao dịch. Có thể dùng bảng này để phân tích hành vi người dùng qua các bước mua SIM, theo dõi số lượng giao dịch và phân tích loại SIM mà người dùng quan tâm.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date_partition` | DATE | Ngày thực hiện hành động của userNgày thực hiện hành động của user | 2025-12-15, 2025-01-16, 2025-12-13 |
| `user_id` | STRING | user ở dạng mã hóauser ở dạng mã hóa | 44194092, 40683537, 60353774 |
| `step` | STRING | Mô tả các bước tương tác của người dùng với dịch vụ SIM: screen_service: user xem màn hình dịch vụ SIM (Screen). CTA: click nút Mua hàng ở màn hình dịch vụ SIM (Purchase CTA). MHTTAT: user đã đến step xem MHTTAT (MHTTAT). trans_confirmation: click nút confirm ở MHTTAT (click TTAT). Load_KQGD: load thành công màn hình KQGD (Load_KQGD).screen_service: user xem màn hình dịch vụ SIM (Screen). CTA: click nút Mua hàng ở màn hình dịch vụ SIM (Purchase CTA). MHTTAT: user đã đến step xem MHTTAT (MHTTAT). trans_confirmation: click nút confirm ở MHTTAT (click TTAT). Load_KQGD: load thành công màn hình KQGD (Load_KQGD). | screen_service, CTA, trans_confirmation |
| `cate` | STRING | Phân loại SIM. simdulich: SIM du lịch. simdienthoai: SIM điện thoại.Phân loại SIM. simdulich: SIM du lịch. simdienthoai: SIM điện thoại. | simdienthoai, simdulich |
| `number_event` | INTEGER | Số lượng traffic hoặc số lượng giao dịch (nếu ở step = is_payment_by_core_trans)số lượng traffic hoặc số lượng giao dịch (nếu ở step = is_payment_by_core_trans) | 1, 2, 3 |

## Memory
*8 entries — user-trained knowledge*

1. sim điện thoại là sim chính chủ _2026-01-30_
2. Khi xử lý dữ liệu theo tháng, sử dụng date_trunc(date_partition, month) để xác định month_active _2025-09-29_
3. Retention rate của Telco thì chọn domain VTTI Overall _2026-02-03_
4. khi nhắc tới dịch vụ Airtime hay dịch vụ Data thì sử dụng cột service_name và filter cho đúng các service thuộc từng dịch vụ:
- Airtime thì filter các giá trị: "mobilebuycard", "mobiletopup". KHÔNG SỬ DỤNG giá trị "airtime" vì giá trị này lâu rồi không dùng nữa
- Data thì filter các giá trị: "mobilecombo", "mobiletopupdata" _2025-10-14_
5. Khi user hỏi về retention rate mà không nhắc tới Telco, hãy hướng dẫn user qua domain VTTI Overall. _2026-02-04_
6. Khi xử lý dữ liệu Telco, sử dụng bảng `project-5400504384186300846.BU_UTILITIES_TELCO.VTTI_TRANID_ALL` thay vì `momovn-prod.BU_UTILITIES_TELCO.FULL_FUNNEL_TELCO_OPTIMIZE` _2026-02-03_
7. Khi tính retention rate, sử dụng cột `user_Payment` và lọc theo `group_service` là 'Topup&Mathe', '3G/4G' _2026-02-03_
8. Retention rate được tính bằng cách lấy số lượng người dùng giữ chân chia cho tổng số người dùng duy nhất, làm tròn đến 2 chữ số thập phân _2026-02-03_
