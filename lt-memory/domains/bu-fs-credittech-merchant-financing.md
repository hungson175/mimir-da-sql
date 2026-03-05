# BU FS: CreditTech – Merchant Financing

**Domain ID:** `076f32ab-ad98-46fc-9998-1dd58de7134a`

## Description
Data của sản phẩm Vay nhanh cho nhà bán hàng, bao gồm các step accessed/submitted/disbursed

## Tables

### `momovn-prod.BU_FI.FMOB_PERFORMANCE_BY_OFFER`
> Data về performance của sản phẩm Vay nhanh cho nhà bán hàng

| Column | Type | Description | Example |
|--------|------|-------------|---------|
| `ETL_DATE` | DATE | ngày thực hiện hành động | — |
| `AGENT_ID` | STRING | mã người dùng momo | — |
| `OFFER_GROUP` | STRING | luồng offer của user, được phân chia ở đầu whitelist: - 50M - 70M | — |
| `ACTION` | STRING | hành động của user bao gồm: - accessed - submitted - disbursed | — |
| `AMOUNT` | FLOAT | số tiền vay | — |
| `LOAN_ID` | STRING | mã hợp đồng khoản vay | — |
| `TENOR` | FLOAT | kỳ hạn | — |
| `EMI` | FLOAT | số tiền phải trả hàng tháng | — |
| `GMV_3_MONTH` | FLOAT | gmv 3 tháng gần nhất của user | — |
| `GMV_6_MONTH` | FLOAT | gmv 6 tháng gần nhất của user | — |

## Memory
*1 entries — user-trained knowledge*

1. GMV = Gross Merchandise Value = Tổng giá trị giao dịch của người dùng trong một khoảng thời gian nhất định. Dữ liệu hiện có bao gồm GMV 3 tháng và GMV 6 tháng của user. _FS Merchant Financing · 2025-07-16_
