# Domain Review 2026-03-11 — Kiểm Tra Dữ Liệu FS

## Mục Đích

Thư mục này chứa tài liệu để **đội ngũ DA kiểm tra và xác nhận** tính đầy đủ, chính xác của dữ liệu trên các domain FS (Financial Services).

**Tại sao cần kiểm tra?**
- Dữ liệu bảng được lấy từ **OpenMetadata Data Catalog** — cần DA xác nhận còn hoạt động và đầy đủ
- Knowledge (kiến thức tích lũy về cách query) cần được cập nhật thường xuyên
- Cần xác định DA phụ trách, metric chính, tần suất cập nhật cho từng domain

## Cấu Trúc Thư Mục

```
domain-review-2026-03-11/
├── README.md                              ← File này
├── bu-fs-bank-partnership/
│   ├── kiem_tra_bang_du_lieu.csv           ← Danh sách bảng — DA kiểm tra
│   ├── memory_da.csv                      ← Knowledge tích lũy — DA review & bổ sung
│   └── domain_information.csv             ← Thông tin domain — DA điền vào
├── bu-fs-chung-khoan-cv/
├── bu-fs-credittech-merchant-financing/
├── bu-fs-credittech-paylater/
├── bu-fs-fi-solutions/
├── bu-fs-financial-hub/
├── bu-fs-insurtech-insurance/
├── bu-fs-tui-than-tai/
└── bu-fs-vay-nhanh/
```

## Các Domain (9 domain FS)

| # | Thư Mục | Domain | Số Bảng (OpenMetadata) |
|---|---------|--------|----------------------|
| 1 | bu-fs-bank-partnership | Bank Partnership | 6 |
| 2 | bu-fs-chung-khoan-cv | Chứng Khoán CV | ⚠️ Không có trong OpenMetadata |
| 3 | bu-fs-credittech-merchant-financing | Merchant Financing | 1 |
| 4 | bu-fs-credittech-paylater | CreditTech Paylater | 3 |
| 5 | bu-fs-fi-solutions | FI Solutions (CLO) | 3 |
| 6 | bu-fs-financial-hub | Financial Hub | ⚠️ Không có trong OpenMetadata |
| 7 | bu-fs-insurtech-insurance | InsurTech Insurance | 10 |
| 8 | bu-fs-tui-than-tai | Túi Thần Tài (TTT) | 3 |
| 9 | bu-fs-vay-nhanh | Vay Nhanh | 4 |

## Ý Nghĩa Từng File (CSV — mở bằng Excel/Google Sheets)

### 1. `kiem_tra_bang_du_lieu.csv` — Kiểm Tra Bảng Dữ Liệu
- Liệt kê **tất cả các bảng** từ OpenMetadata Data Catalog
- DA cần: kiểm tra từng bảng còn hoạt động không, bổ sung bảng thiếu

### 2. `memory_da.csv` — Memory & Knowledge
- Chứa **kiến thức đã tích lũy** từ quá trình sử dụng Mimir (gotchas, cách tính metric, filter SQL...)
- DA cần: kiểm tra từng mục còn đúng không, sửa trực tiếp, bổ sung mục mới

### 3. `domain_information.csv` — Thông Tin Domain
- Thông tin cấp domain: DA phụ trách, tần suất cập nhật, metric chính, mức tin cậy Mimir
- DA cần: điền các mục còn thiếu (đánh dấu ❓)

## Hướng Dẫn Review

### Bước 1: Mở thư mục domain của bạn
Tìm đến domain mà bạn phụ trách (VD: `bu-fs-credittech-paylater/`).

### Bước 2: Kiểm tra bảng dữ liệu (`kiem_tra_bang_du_lieu.csv`)
1. Mở file CSV bằng Excel hoặc Google Sheets
2. Kiểm tra từng bảng — đánh dấu ✅ hoặc ❌ ở cột "Còn Hoạt Động?"
3. Nếu thiếu bảng, thêm vào phần "BẢNG BỔ SUNG" phía dưới

### Bước 3: Kiểm tra knowledge (`memory_da.csv`)
1. Đọc từng mục knowledge
2. Đánh dấu ✅ nếu còn đúng, ❌ nếu sai
3. Nếu sai, ghi lại nội dung đúng ở cột "Sửa Lại"
4. Thêm knowledge mới vào phần "BỔ SUNG" phía dưới

### Bước 4: Điền thông tin domain (`domain_information.csv`)
1. Điền DA phụ trách
2. Xác nhận tần suất cập nhật dữ liệu
3. Liệt kê metric chính của domain
4. Đánh giá mức tin cậy Mimir

### Bước 5: Gửi lại
Gửi file CSV đã chỉnh sửa cho team lead.

## Lưu Ý

- Mở file CSV bằng **Excel** hoặc **Google Sheets** để dễ chỉnh sửa
- Nếu phát hiện lỗi lớn (bảng bị mất, data sai), báo ngay cho team lead
- File CSV dùng encoding UTF-8 BOM — nếu tiếng Việt bị lỗi, chọn encoding UTF-8 khi mở
