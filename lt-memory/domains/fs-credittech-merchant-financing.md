# Domain: BU FS: CreditTech – Merchant Financing

## Identity
- **Domain ID:** `076f32ab-ad98-46fc-9998-1dd58de7134a`
- **Description:** Data của sản phẩm Vay nhanh cho nhà bán hàng, bao gồm các step accessed/submitted/disbursed
- **Tables:** 1
- **Metadata fetched:** 2026-02-25

## Tables & Columns

### momovn-prod.BU_FI.FMOB_PERFORMANCE_BY_OFFER
> Data về performance của sản phẩm Vay nhanh cho nhà bán hàng

| Column | Description | Examples |
|--------|-------------|----------|
| ETL_DATE | ngày thực hiện hành động | — |
| AGENT_ID | mã người dùng momo | — |
| OFFER_GROUP | luồng offer của user, được phân chia ở đầu whitelist: - 50M - 70M | — |
| ACTION | hành động của user bao gồm: - accessed - submitted - disbursed | — |
| AMOUNT | số tiền vay | — |
| LOAN_ID | mã hợp đồng khoản vay | — |
| TENOR | kỳ hạn | — |
| EMI | số tiền phải trả hàng tháng | — |
| GMV_3_MONTH | gmv 3 tháng gần nhất của user | — |
| GMV_6_MONTH | gmv 6 tháng gần nhất của user | — |

## Domain Knowledge (from Mimir)

- GMV = Gross Merchandise Value = Tổng giá trị giao dịch của người dùng trong một khoảng thời gian nhất định. Dữ liệu hiện có bao gồm GMV 3 tháng và GMV 6 tháng của user.

## Suggested Probe Questions

- Status: **Not yet probed**
