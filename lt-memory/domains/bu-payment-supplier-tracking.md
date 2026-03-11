# BU Payment: SUPPLIER TRACKING

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `0c367c81-99d6-4b01-90e2-e7bab0b77677`

## Description
Theo dõi performance của các nhà cung cấp Telco

## Tables

### `project-5400504384186300846.BU_UTILITIES_TELCO.TELCO_WAREHOUSE_ARGG_ALL`
> Bảng này lưu trữ thông tin chi tiết về các giao dịch viễn thông thông qua MoMo. Đây là bảng fact, giúp cung cấp thông tin về ngày phát sinh giao dịch, nhà mạng, dịch vụ và tổng số tiền phát sinh của các giao dịch viễn thông. 
Các thông tin có thể lấy từ bảng này gồm:
- Theo dõi số lượng giao dịch theo ngày và nhà mạng.
- Phân loại các dịch vụ viễn thông và thống kê dịch vụ nào được sử dụng nhiều nhất.
- Tính toán tổng số tiền phát sinh theo nhóm dịch vụ.

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `date` | — | Ngày phát sinh giao dịch | — |
| `cate` | — | Nhà mạng của giao dịch | — |
| `group_service` | — | Group dịch vụ của giao dịch: Topup&Mathe = Airtime, 3G/4G = Data | — |
| `service_code` | — | Service code của giao dịch | — |
| `service` | — | Loại dịch vụ. TOPUP: dịch vụ topup, MATHE: dịch vụ mã thẻ, COMBO: dịch vụ data combo, SIM: dịch vụ sim, OTHER: Dịch vụ khác | — |
| `supplier` | — | Nhà cung cấp của giao dịch | — |
| `menh_gia` | — | Mã sản phẩm của giao dịch | — |
| `amount` | — | Tổng số tiền phát sinh | — |
| `quantity` | — | Tổng số lượng mã sản phẩm | — |
**Distinct values:**
```
- Distinct value `cate` là ['Vnsky' 'Local' 'Viettel' 'Vietnamobile' 'Vinaphone' 'Saymee' 'Gmobile'
 'Xplori' 'OTHER' 'Wintel' 'Gohub' 'itel' 'Reddi' 'Mobifone' 'VNSKY']
- Distinct value `supplier` là ['VIETTEL DIRECT' 'MEGATEK' 'EWAVE' 'IMD' 'ASIM' 'VMG/IMEDIA' 'GOHUB'
 'WHYPAY' 'Vietnamobile' 'Viettel' 'WINTEL' 'Vinaphone' 'VIETNAMOBILE'
 'EPAY' 'Gmobile' 'MOBICAST' 'VIEN PHUONG NAM' 'OCTA/LOGICH' 'IO MEDIA'
 'Mobifoneplus' 'XPLORI' 'Mobifone' 'ZOTA/FIVI' 'VIETTEL' 'MobiPlus'
 'IMEDIA' 'PHUONG QUAN' 'Mservice' 'My data' 'VNSKY']
- Distinct value `group_service` là ['Topup&Mathe' '3G/4G']
- Distinct value `service` là ['MATHE' 'COMBO' 'OTHERS' 'TOPUP' 'SIM']
```
