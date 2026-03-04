# BU FS: CreditTech – Merchant Financing

**Domain ID:** `076f32ab-ad98-46fc-9998-1dd58de7134a`
**Last refreshed:** 2026-03-03

## Description
Data của sản phẩm Vay nhanh cho nhà bán hàng, bao gồm các step accessed/submitted/disbursed

## Schema DDL
```sql
###Dataset name: BU FS: CreditTech – Merchant Financing 
 ## Table information : {"table_name":"momovn-prod.BU_FI.FMOB_PERFORMANCE_BY_OFFER","table_desc":"Data về performance của sản phẩm Vay nhanh cho nhà bán hàng","column_desc":[{"column_name":"ETL_DATE","description":"ngày thực hiện hành động","data_type":"DATE"},{"column_name":"AGENT_ID","description":"mã người dùng momo","data_type":"STRING"},{"column_name":"OFFER_GROUP","description":"luồng offer của user, được phân chia ở đầu whitelist:\n- 50M\n- 70M","data_type":"STRING"},{"column_name":"ACTION","description":"hành động của user bao gồm:\n- accessed\n- submitted\n- disbursed","data_type":"STRING"},{"column_name":"AMOUNT","description":"số tiền vay","data_type":"FLOAT"},{"column_name":"LOAN_ID","description":"mã hợp đồng khoản vay","data_type":"STRING"},{"column_name":"TENOR","description":"kỳ hạn","data_type":"FLOAT"},{"column_name":"EMI","description":"số tiền phải trả hàng tháng","data_type":"FLOAT"},{"column_name":"GMV_3_MONTH","description":"gmv 3 tháng gần nhất của user","data_type":"FLOAT"},{"column_name":"GMV_6_MONTH","description":"gmv 6 tháng gần nhất của user","data_type":"FLOAT"}]}
```
