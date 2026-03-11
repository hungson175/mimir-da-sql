# ITC MLBIZ: Explanation Agent

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `7e533485-3f9d-45d1-b97c-82eb59aa3d01`

## Tables

### `momovn-dev.PASION.MERCHANT_VTS_OFFER_TRACING_YYYYMMDD`
> Bảng momovn-dev.PASION.MERCHANT_VTS_OFFER_TRACING_YYYYMMDD lưu trữ thông tin về các chương trình khuyến mãi Ví Trả Sau (VTS) liên quan đến các merchant trong một khoảng thời gian cụ thể. Bảng này cung cấp dữ liệu để phân tích và theo dõi các khuyến mãi VTS bao gồm thông tin mã merchant, loại hình merchant, và các ngày liên quan đến onboard và cài đặt thiết bị Soundbox.
Table có cấu tạo dạng sharding. Sử dụng _TABLE_SUFFIX để tiến hành truy vấn theo ngày

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `merchant_code` | STRING | Mã định danh duy nhất cho mỗi merchant. | MOMOLMJL20250520, MOMOSRYL20230522, MOMOD9JS20250301 |
| `merchant_type` | STRING | Loại hình của merchant. | BPU, P2M, PRE_MERCHANT |
| `onboarding_actor` | STRING | Người thực hiện onboard cho merchant. | SELF, SALE, COLLABORATOR |
| `onboard_date` | DATETIME | Ngày merchant được onboard. | 2022-10-18 11:06:08, 2022-04-22 11:03:01, 2022-04-22 11:03:00 |
| `adhoc_offer_date` | STRING | Ngày diễn ra chương trình khuyến mãi ad-hoc. | 250712, 250813, 251117 |
| `daily_offer_date` | STRING | Ngày diễn ra chương trình khuyến mãi hàng ngày. | 251228, 251117, 251119 |
| `offer_source` | STRING | Nguồn gốc của chương trình khuyến mãi. | no offer, daily offer, adhoc offer |
| `soundbox_install_date` | DATE | Ngày lắp đặt Soundbox cho merchant. | 2025-11-15, 2025-12-26, 2025-12-31 |
| `is_blacklisted` | STRING | Trạng thái merchant có trong danh sách đen hay không. | no, yes |
| `in_dls_block` | INTEGER | Khối gồm những merchant trong hệ thống DLS. | 0, 1 |
| `in_online_offline_block` | INTEGER | Khối gồm những merchant hỗ trợ giao dịch online và offline. | 0, 1 |
| `in_fs_block` | INTEGER | Khối gồm các merchant có trong hệ thống FS. | 0, 1 |
| `in_v2_block` | INTEGER | Khối gồm những merchant hỗ trợ bản V2. | 0, 1 |
| `in_sme_bpu_block` | INTEGER | Khối SME/BPU mà merchant đang thuộc về. | 0, 1 |
| `in_soundbox_risk` | INTEGER | Merchant thuộc diện rủi ro khi sử dụng Soundbox. | 0, 1 |
| `in_rm_quasi_list` | INTEGER | Merchant nằm trong danh sách RM quasi. | 0, 1 |
| `paylater_active` | BOOLEAN | Trạng thái hoạt động của dịch vụ Ví Trả Sau (true: đang hoạt động, false: không hoạt động). | true, false |
| `ccm_active` | BOOLEAN | Trạng thái hoạt động của dịch vụ CCM (true: đang hoạt động, false: không hoạt động). | false, true |
| `last_updated` | TIMESTAMP | Thời điểm lần cuối cùng bảng dữ liệu được cập nhật. | 2025-06-13 10:28:48+00, 2025-06-13 10:25:33+00, 2025-06-13 10:32:59+00 |

## Memory
*2 entries — user-trained knowledge*

1. Merchant MOMOJVUP20251209: BPU merchant, tự onboard và cài đặt soundbox ngày 2025-12-09, không bị blacklist nhưng không được offer VTS vì chưa đạt đủ điểm score theo quy định giai đoạn sau 8.9.2025 _2025-12-22_
2. Merchant MOMOJVUP20251209: BPU merchant, tự onboard và cài đặt soundbox ngày 2025-12-09, không bị blacklist nhưng không được offer VTS vì chưa đạt đủ điểm score theo quy định giai đoạn sau 8.9.2025 _2025-12-24_
