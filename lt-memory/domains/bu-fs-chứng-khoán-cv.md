# BU FS: Chứng khoán CV

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `ef8cc111-d13a-4b0b-a1fd-8cccb065fc74`

## Description
Hỏi về thông tin đăng ký tài khoản, giao dịch chứng khoán và traffic user.

## Tables

### `momovn-cvs.BU_CVS.MIMIR_CVS_TRANSACTION`
> Bảng data chứa toàn bộ giao dịch người dùng sản phẩm Chứng khoán CV (cũng hay gọi tắt là CVS). Bảng này có thể dùng độc lập để tra cứu giao dịch trading của user. Ngoài ra cũng có thể mapping bằng cột AGENT_ID với bảng KHÁC để tìm ra hành vi user.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `TRANS_CATE` | STRING | Loại giao dịch record: "MONEY" là giao dịch nạp/rút tiền, "STOCK" là lệnh đặt mua/bán chứng khoánLoại giao dịch record: "MONEY" là giao dịch nạp/ rút tiền, "STOCK" là lệnh đặt mua/ bán chứng khoán | STOCK, MONEY |
| `AGENT_ID` | STRING | Mã định danh của khách hàng trên ứng dụng MoMo, đây khóa chính dùng để mapping các table với nhauMã định danh của khách hàng trên ứng dụng MoMo, đây khóa chính dùng để mapping các table với nhau | 10423891, 40032050, 49299661 |
| `ACCO_NAME` | STRING | Loại tài khoản chứng khoán user thao tác nạp/rút tiền, đặt lệnh mua/bán chứng khoán: "CASH" là tài khoản tiền mặt, "MARGIN" là tài khoản marginLoại tài khoản chứng khoán user thao tác nạp/ rút tiền, đặt lệnh mua/ bán chứng khoán: "CASH" là tài khoản tiền mặt, chỉ dùng tiền mặt để mua; "MARGIN" là tài khoản margin, có thể dùng tiền mượn để mua chứng khoán | CASH, MARGIN |
| `TRADE_MONTH` | DATE | Tháng giao dịch. Lưu ý rằng các lệnh hoặc giao dịch có thể được đặt ngoài giờ giao dịch và hạch toán vào ngày giao dịch thực tếTháng giao dịch, lưu ý các lệnh hoặc giao dịch có thể được đặt trước vào ngoài giờ giao dịch các ngày trước (có thể rơi vào tháng trước) nhưng khớp/ hạch toán vào ngày giao dịch nào sau đó thì tính vào ngày giao dịch đó. Trade month được lưu với giá trị 01 đầu mỗi tháng | 2024-08-01, 2025-07-01, 2024-07-01 |
| `TRADE_DATE` | DATE | Ngày giao dịch. Các lệnh hoặc giao dịch có thể được đặt ngoài giờ giao dịch và hạch toán vào ngày giao dịch thực tếNgày giao dịch, lưu ý các lệnh hoặc giao dịch có thể được đặt trước vào ngoài giờ giao dịch các ngày trước (có thể rơi vào tháng trước) nhưng khớp/ hạch toán vào ngày giao dịch nào sau đó thì tính vào ngày giao dịch đó. | 2024-08-01, 2024-08-12, 2024-08-05 |
| `CREATE_TIME` | DATETIME | Đối với giao dịch "MONEY" là thời gian user thực hiện giao dịch, giao dịch "STOCK" là thời gian user đặt lệnh. Datetime theo GMT+7Đối với giao dịch "MONEY" (theo giá trị ở cột TRANS_CATE) là thời gian user thực hiện giao dịch, giao dịch "STOCK" là thời gian user đặt lệnh. Datetime đã được định dạng theo GMT+7 | 2025-06-30 16:00:33, 2024-10-04 16:00:20, 2024-10-04 16:00:06 |
| `CONFIRM_TIME` | DATETIME | Thời gian lệnh được xác nhận. Datetime theo GMT+7Thời gian lệnh đó được confirm. Datetime đã được định dạng theo GMT+7 | 2025-08-07 09:00:00, 2025-07-28 09:00:01, 2025-06-23 09:00:01 |
| `TRANS_ID` | STRING | Mã giao dịch/đặt lệnh, thường dùng để đếm số lượng giao dịch/đặt lệnhMã giao dịch/ đặt lệnh, thường dùng để đếm số lượng giao dịch/ đặt lệnh | TRADING_, CASH_IN_, 2024110820003571 |
| `STATUS_NAME` | STRING | Trạng thái giao dịch: "MONEY" với "Đã duyệt" là thành công, các status khác không thành công; "STOCK" với "Khớp hết" hoặc "Khớp 1 phần" là thành công, các status khác không thành côngĐối với giao dịch "MONEY" (theo giá trị ở cột TRANS_CATE) có giá trị "Đã duyệt" là thành công, các status khác là chưa thành công; giao dịch "STOCK" có các giá trị sau là thành công: "Khớp hết" (đặt lệnh khớp lệnh hết số lượng), "Khớp 1 phần" (đặt lệnh chỉ khớp 1 phần), các status khác hoặc null thì không thành công. | Đã duyệt, Khớp hết, Unknown |
| `TRANS_TYPE` | STRING | Loại giao dịch: "MONEY" với "CASH_IN" là nạp tiền, "CASH_OUT" là rút tiền; "STOCK" với "BUY" là mua chứng khoán, "SELL" là bán chứng khoánĐối với giao dịch "MONEY" (theo giá trị ở cột TRANS_CATE) có 2 giá trị: "CASH_IN" là nạp tiền vào tài khoản chứng khoán, "CASH_OUT" là rút tiền ra khỏi tài khoản; giao dịch "STOCK" có 2 giá trị: "BUY" là đặt mua chứng khoán, "SELL" là bán chứng khoán | BUY, SELL, TRADING |
| `MONEY_SOURCE_RECEIPT` | STRING | Nguồn hoặc đích của tiền trong giao dịch "MONEY" dựa trên TRANS_TYPEChỉ có giá trị nếu TRANS_CATE = "MONEY": Nguồn tiền mà user nạp tiền vào tài khoản chứng khoán (nếu TRANS_TYPE = "CASH_IN") hoặc đích tài khoản user rút tiền ra khỏi tài khoản chứng khoán (nếu TRANS_TYPE = "CASH_OUT") | TTT, MOMO, BANK LINKED |
| `AMOUNT` | FLOAT | Giá trị nạp/rút tiền hoặc giá trị khớp lệnh giao dịch mua/bán chứng khoánGiá trị nạp/ rút tiền hoặc giá trị khớp lệnh giao dịch mua/ bán chứng khoán | 0, 10000, 1000 |
| `MAT_QTY` | FLOAT | Số lượng cổ phiếu khớp lệnh (mua/bán)Số lượng cổ phiếu khớp lệnh (mua/ bán) | 0, 1, 100 |
| `ORD_QTY` | FLOAT | Số lượng cổ phiếu đặt lệnh ban đầuSố lượng cổ phiếu đặt lệnh ban đầu | 1, 100, 10 |
| `ORD_PRICE` | FLOAT | Giá đặt lúc mua cổ phiếuGiá đặt lúc mua cổ phiếu | 13, 12, 25 |
| `FEE_AMT` | FLOAT | Phí giao dịch mua/bán chứng khoánPhí giao dịch mua/ bán chứng khoán | 0, 24, 11 |
| `STOCK_CD` | STRING | Mã cổ phiếuMã cổ phiếu | HPG, VIX, MBB |
| `TRADE_LOT_TYPE` | STRING | Giao dịch "Lô chẵn" chẵn hay "Lô lẻ"Giao dịch "Lô chẵn" chẵn hay "Lô lẻ" | Lô lẻ, Lô chẵn |
| `MAU` | STRING | Phân loại người dùng có thực hiện giao dịch nạp/rút tiền (thành công) theo hành viPhân loại người dùng có thực hiện giao dịch nạp/rút tiền (thành công) trong tháng, theo hành vi: "1 New": Người dùng lần đầu tiên nạp/rút tiền; "2 Retain": Người dùng có giao dịch nạp/rút trong tháng trước, và tiếp tục nạp/rút ở tháng hiện tại (2 tháng liên tiếp); "3 Reactive": Người dùng đã từng nạp/rút trong quá khứ, nhưng không phải tháng trước. Tại tháng hiện tại, người dùng quay lại nạp/rút; "4 Retain in month": Người dùng đã từng nạp/rút trong tháng hiện tại nhưng vào ngày khác, và tiếp tục có thêm giao dịch nạp/rút trong một ngày khác của cùng tháng; "5 Retain in day": Người dùng đã từng nạp/rút trong cùng ngày, và tiếp tục có thêm giao dịch nạp/rút khác trong ngày đó. | 5 Retain in day, 4 Retain in month, 1 New |
| `MTU` | STRING | Phân loại người dùng có thực hiện giao dịch đặt và khớp lệnh mua/bán chứng khoán thành công theo hành viPhân loại người dùng có thực hiện giao dịch đặt và khớp lệnh mua/bán chứng khoán thành công trong tháng, theo hành vi: "1 New": Người dùng lần đầu tiên thực hiện đặt lệnh mua/bán thành công; "2 Retain": Người dùng có đặt lệnh thành công trong tháng trước, và tiếp tục đặt lệnh thành công ở tháng hiện tại (2 tháng liên tiếp); "3 Reactive": Người dùng đã từng giao dịch thành công trong quá khứ, nhưng không phải tháng trước. Tại tháng hiện tại, người dùng quay lại giao dịch; "4 Retain in month": Người dùng đã từng giao dịch thành công trong tháng hiện tại nhưng vào ngày khác, và tiếp tục có thêm giao dịch ở một ngày khác của cùng tháng; "5 Retain in day": Người dùng đã từng giao dịch thành công trong cùng ngày, và tiếp tục có thêm giao dịch khác trong ngày đó. | 5 Retain in day, 4 Retain in month, 2 Retain |

### `momovn-cvs.BU_CVS.MIMIR_CVS_EVENT_DATA`
> Bảng data chứa event (là hành vi người dùng trên app chứng khoán). Mỗi lần hiện screen hay user click gì đó sẽ record một dòng theo thời gian. Bảng này dùng cho việc user hỏi về "truy cập CVS", "traffic CVS"... Mỗi lần vậy thì chỉ cần count_distinct agent_id toàn bộ event ngày cần tìm (vì nếu có truy cập thì mới phát sinh event hiển thị, click...). Dùng cột AGENT_ID để mapping với các table khác. Ngoài ra để xem xét hành vi (trước, sau...) thì dùng thêm cột EVENT_TIME cùng với event tương ứng để mapping các bảng TRANSACTION hay REGISTER.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `EVENT_DATE` | DATE | Ngày xảy ra EVENTNgày xảy ra EVENT | 2025-07-18, 2025-07-17, 2025-07-22 |
| `EVENT_TIME` | DATETIME | Thời gian xảy ra EVENT, là DATETIME đã theo GMT+7Thời gian xảy ra EVENT, là DATETIME đã theo GMT+7 | 2025-06-26 10:16:49.192, 2025-08-05 15:17:50.025, 2025-06-17 23:36:12.266 |
| `AGENT_ID` | STRING | Mã định danh UNIQUE của user. Dùng để mapping các bảng khác để lấy ra hành vi của user.Mã định danh UNIQUE của user. Dùng để mapping các bảng khác để lấy ra hành vi của user. | 71554809, 59744200, 20485330 |
| `SESSION_ID` | STRING | Định danh momo app session id. 1 session được khởi tạo khi app platform không ghi nhận event nào trong 60 giây trước đó.Định danh momo app session id. 1 session được khởi tạo khi app platform không ghi nhất bất cứ event nào cho user trong vòng 60s trước đó. Như thế nói nôm na để xem số lần vào app/ miniapp Chứng khoán CV thì có thể count distinct cột này. | 241B19DB-D714-46FF-AFFA-7E3325A20333, 5a79baf1-f4d0-4e14-b39b-cf91407b985a, 2da76de2-162b-46cc-b329-29ef388cd1f0 |
| `TRAIL_ID` | STRING | Định danh 1 mini app session từ entry point đến exit point. Trong 1 session_id có thể có nhiều trail_id.Định danh 1 mini app session. Bắt đầu từ entry point & kết thúc ở exit point. Mỗi lần vào miniapp Chứng khoán CV sẽ sinh ra 1 trail_id, như vậy trong cùng 1 session_id có thể có nhiều trail_id. | Tbh0NjE3X8L8Hyh05WC7P, fCeTimOUXeNoWxQpQvh5Z, wmsezOv3zhL4puXXbBr5C |
| `EVENT_ID` | STRING | Định danh của mỗi event phát sinh theo user tại một thời điểm.Định danh của mỗi event phát sinh theo user trong 1 thời điểm. Trường hợp lý tưởng là mỗi event ứng 1 event_id. | doS50Oemf8V2iRXY-JzUQ, HTPwDWw6vt2dL1nCl8c6f, WOxauY3zbPsiF5vegw1Tk |
| `OBJECT` | STRING | Đối tượng event đang record: 'SCREEN' cho màn hình, 'COMPONENT' cho ô hiển thị trên màn hình.Đối tượng event đang record. Có thể là "SCREEN" -> Tức màn hình; "COMPONENT": Một dạng ô được hiển thị trên 1 màn hình... Như vậy trong cùng 1 lần hiển thị SCREEN có thể hiển thị nhiều COMPONENT... | SCREEN |
| `ACTION` | STRING | Hành động với OBJECT: 'VIEW' là xem SCREEN/COMPONENT, 'CLICK' là nhấn vào đối tượng.Hành động với OBJECT: "VIEW": hiển thị thành công SCREEN/ COMPONENT; "CLICK": Nhấn vào một đối tượng nào đó để đi tiếp (tùy mục đích của CTA) | VIEW |
| `SCREEN_NAME` | STRING | Tên màn hình đang load. Nếu OBJECT là 'SCREEN', đây là tên màn hình; nếu 'COMPONENT', thì là màn hình chứa COMPONENT.Tên màn hình đang load. Như thế nếu OBJECT là "SCREEN" thì chính là tên màn hình, OBJECT là "COMPONENT" thì là tên màn hình mà cái block đang hiển thị trên đó. | stock_detail, stock_home, stock_center |
| `OBJECT_NAME` | STRING | Nếu OBJECT không phải là 'SCREEN', thể hiện tên OBJECT tương ứng (ví dụ COMPONENT).Nếu OBJECT không phải là "SCREEN" thì hiển thị tên OBJECT tương ứng. Ví dụ OBJECT là "COMPONENT" thì cột này thể hiện tên. | — |
| `STOCK_NAME` | STRING | Nếu SCREEN_NAME là 'stock_detail', giá trị là 3 chữ cái đại diện cho cổ phiếu.Nếu SCREEN_NAME = "stock_detail" (màn hình chi tiết giới thiệu cổ phiếu, có thông tin của loại cổ phiếu đó) thì sẽ có giá trị là 3 mã chữ cái cổ phiếu. | VIX, HPG, VIC |
| `SCREEN_SOURCE` | STRING | Màn hình mà user đã đi từ đó đến màn hình hiện tại. Nếu null thì không có.Một vài màn hình sẽ record là user đi từ màn hình nào tới màn hình này. Nếu null thì là không có. | stock_market, , stock_home |

## Memory
*2 entries — user-trained knowledge*

1. Màn hình Home có screen_name = 'stock_home' _Chứng khoán CV · 2025-07-16_
2. Xem stock_detail có nghĩa là VIEW SCREEN với screen_name = 'stock_detail' _Chứng khoán CV · 2025-07-16_
