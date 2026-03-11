# Fraud

> **LLM INSTRUCTION:** Read this file completely — do not truncate or skip sections. Critical knowledge (corrections, gotchas, business rules) may appear in any section, especially `## Memory` at the end.


**Domain ID:** `2892bd4e-f624-4d5e-b9b3-1477c5fd9a44`

## Description
Thông tin về Fraud

## Schema DDL (raw)
```
###Dataset name: Fraud
```

## Memory
*3 entries — user-trained knowledge*

1. When user mentions 'MyViettel', it refers to SERVICE_CODE = 'm4bvttimyviettel' _2025-10-20_
2. MONEY_SOURCE mapping: when MONEY_SOURCE = '1' then 'MoMo' when MONEY_SOURCE = '2' then 'NHLK' when MONEY_SOURCE = '3' then 'Napas' when MONEY_SOURCE = '4' then 'Visa Debit' when MONEY_SOURCE = '5' then 'Visa Credit' when MONEY_SOURCE = '6' then 'TTT' when MONEY_SOURCE = '7' then 'Paylater' when MONEY_SOURCE = '8' then 'Cashback' when MONEY_SOURCE = '9' then 'CCM' when MONEY_SOURCE = '10' then 'BNPL' when MONEY_SOURCE = '11' then 'Newton' when MONEY_SOURCE = '12' then 'Direct Debit' when MONEY_SOURCE = '13' then 'Quỹ Nhóm' when MONEY_SOURCE = 'Fastmoney' then 'Fastmoney' _2025-10-17_
3. When user mentions 'MyViettel', it refers to SERVICE_TYPE = 'm4bvttimyviettel' _2025-10-20_
