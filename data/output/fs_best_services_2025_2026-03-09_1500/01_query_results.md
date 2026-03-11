# FS Services Performance — Full Year 2025

> Generated: 2026-03-09

## 1. Paylater (CreditTech)

**SQL:**
```sql
SELECT FORMAT_DATE('%Y-%m', created_date) AS month,
  COUNT(DISTINCT user_id) AS mau, COUNT(*) AS txn_count, SUM(amount) AS total_gmv
FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
WHERE created_date BETWEEN '2025-01-01' AND '2025-12-31'
  AND result_code = 0 AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')
GROUP BY 1 ORDER BY 1
```
**Dry-run:** 6.4 GB | **Runtime:** 7s

| Month | MAU | Txn Count | GMV (VND) |
|-------|-----|-----------|-----------|
| 2025-01 | 988,551 | 7,532,835 | 1.486T |
| 2025-02 | 970,991 | 6,854,338 | 1.392T |
| 2025-03 | 1,042,956 | 8,481,951 | 1.638T |
| 2025-04 | 1,071,670 | 8,541,028 | 1.754T |
| 2025-05 | 1,108,131 | 8,951,987 | 1.877T |
| 2025-06 | 1,165,868 | 9,360,504 | 2.020T |
| 2025-07 | 1,211,056 | 10,179,542 | 2.088T |
| 2025-08 | 1,257,140 | 10,632,869 | 2.185T |
| 2025-09 | 1,275,682 | 10,515,010 | 2.181T |
| 2025-10 | 1,314,094 | 11,374,253 | 2.280T |
| 2025-11 | 1,377,918 | 11,734,885 | 2.283T |
| 2025-12 | 1,436,606 | 12,485,011 | 2.367T |

## 2. Vay Nhanh (Quick Loans)

**SQL:**
```sql
SELECT FORMAT_DATE('%Y-%m', DISBURSED_DATE) AS month,
  COUNT(DISTINCT AGENT_ID) AS unique_borrowers, COUNT(*) AS loan_count, SUM(LOAN_AMOUNT) AS total_disbursed
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY 1 ORDER BY 1
```
**Dry-run:** 136 MB | **Runtime:** <1s

| Month | Unique Borrowers | Loan Count | Disbursed (VND) |
|-------|-----------------|------------|-----------------|
| 2025-01 | 90,386 | 97,134 | 1.163T |
| 2025-02 | 72,865 | 80,321 | 966B |
| 2025-03 | 95,638 | 106,444 | 1.268T |
| 2025-04 | 96,004 | 107,022 | 1.335T |
| 2025-05 | 101,654 | 114,026 | 1.455T |
| 2025-06 | 124,233 | 138,044 | 2.173T |
| 2025-07 | 120,118 | 134,019 | 2.134T |
| 2025-08 | 125,579 | 141,213 | 2.238T |
| 2025-09 | 127,274 | 143,834 | 2.458T |
| 2025-10 | 143,646 | 166,453 | 2.949T |
| 2025-11 | 134,818 | 157,994 | 2.911T |
| 2025-12 | 148,389 | 173,946 | 3.129T |

## 3. Tui Than Tai (Money Market / Savings)

### MAU
**SQL:**
```sql
SELECT FORMAT_DATE('%Y-%m', t.GRASS_DATE) AS month,
  COUNT(DISTINCT CAST(REGEXP_EXTRACT(t.USER_ID, r'\d+') AS STRING)) AS mau
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` t
WHERE t.GRASS_DATE BETWEEN '2025-01-01' AND '2025-12-31' AND t.MAU_TYPE != '0.Churn'
GROUP BY 1 ORDER BY 1
```
**Dry-run:** 123 GB | **Runtime:** 75s

| Month | MAU |
|-------|-----|
| 2025-01 | 3,247,552 |
| 2025-02 | 2,904,268 |
| 2025-03 | 2,723,987 |
| 2025-04 | 2,597,053 |
| 2025-05 | 2,743,059 |
| 2025-06 | 2,857,439 |
| 2025-07 | 3,116,574 |
| 2025-08 | 3,086,244 |
| 2025-09 | 3,009,282 |
| 2025-10 | 2,915,868 |
| 2025-11 | 2,914,881 |
| 2025-12 | 3,012,444 |

### AUM (End-of-Month Snapshot)
**SQL:**
```sql
SELECT FORMAT_DATE('%Y-%m', GRASS_DATE) AS month, SUM(balance) AS total_aum
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE IN ('2025-01-31','2025-02-28',...,'2025-12-31')
GROUP BY 1 ORDER BY 1
```
**Dry-run:** 2.2 GB | **Runtime:** <1s

| Month | AUM (VND) |
|-------|-----------|
| 2025-01 | 9.18T |
| 2025-02 | 9.43T |
| 2025-03 | 9.50T |
| 2025-04 | 9.89T |
| 2025-05 | 10.10T |
| 2025-06 | 10.38T |
| 2025-07 | 10.47T |
| 2025-08 | 10.72T |
| 2025-09 | 10.85T |
| 2025-10 | 10.90T |
| 2025-11 | 11.12T |
| 2025-12 | 11.30T |

## 4. InsurTech (Insurance)

**SQL:**
```sql
SELECT FORMAT_DATE('%Y-%m', TRANS_DATE) AS month,
  COUNT(DISTINCT DEBITOR) AS mau, COUNT(*) AS order_count,
  SUM(FINAL_REV) AS total_revenue, SUM(AMOUNT) AS total_premium
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2025-01-01' AND '2025-12-31' AND CC_STATUS = 'SUCCESS'
GROUP BY 1 ORDER BY 1
```
**Dry-run:** 192 MB | **Runtime:** 11s

| Month | MAU | Orders | Revenue (VND) | Premium (VND) |
|-------|-----|--------|---------------|---------------|
| 2025-01 | 171,179 | 208,188 | 8.83B | 17.25B |
| 2025-02 | 72,260 | 90,413 | 2.84B | 6.61B |
| 2025-03 | 50,132 | 65,472 | 1.94B | 5.02B |
| 2025-04 | 58,479 | 77,160 | 2.10B | 5.99B |
| 2025-05 | 55,352 | 72,924 | 2.02B | 5.48B |
| 2025-06 | 52,570 | 68,968 | 1.97B | 5.87B |
| 2025-07 | 58,840 | 75,537 | 2.01B | 5.64B |
| 2025-08 | 65,792 | 81,116 | 2.04B | 5.38B |
| 2025-09 | 52,345 | 66,393 | 1.80B | 5.14B |
| 2025-10 | 53,808 | 73,323 | 2.09B | 6.24B |
| 2025-11 | 56,218 | 73,487 | 2.39B | 6.64B |
| 2025-12 | 86,197 | 107,351 | 3.29B | 8.89B |

## 5. CLO (FI Solutions — Lending Marketplace)

**SQL:**
```sql
SELECT FORMAT_DATE('%Y-%m', DATE_REQUESTED) AS month,
  COUNT(*) AS contract_count, SUM(CONTRACT_AMOUNT) AS total_disbursed, SUM(REVENUE) AS total_revenue
FROM `momovn-prod.BU_FI.FIS_TCST`
WHERE DATE_REQUESTED BETWEEN '2025-01-01' AND '2025-12-31'
  AND SERVICE_TYPE = 'CLO' AND STATUS_CODE IN ('CONTRACT_SIGNED', 'DISBURSED')
GROUP BY 1 ORDER BY 1
```
**Dry-run:** 139 MB | **Runtime:** <1s

| Month | Contracts | Disbursed (VND) | Revenue (VND) |
|-------|-----------|-----------------|---------------|
| 2025-01 | 2,028 | 53.7B | 1.98B |
| 2025-02 | 3,901 | 105.6B | 4.06B |
| 2025-03 | 4,608 | 124.2B | 4.79B |
| 2025-04 | 4,489 | 124.6B | 4.80B |
| 2025-05 | 4,747 | 129.7B | 5.00B |
| 2025-06 | 4,869 | 133.9B | 5.17B |
| 2025-07 | 4,180 | 114.2B | 4.41B |
| 2025-08 | 4,191 | 117.4B | 4.53B |
| 2025-09 | 5,739 | 151.7B | 5.84B |
| 2025-10 | 6,665 | 180.4B | 6.93B |
| 2025-11 | 4,741 | 131.6B | 5.08B |
| 2025-12 | 4,866 | 125.2B | 4.84B |
