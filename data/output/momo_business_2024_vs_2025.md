# MoMo Business Performance: 2024 vs 2025

> Generated: 2026-02-25
> Source: Mimir domain tables via BigQuery
> Job project: `momovn-bu-fs-ondemand` (temporary, prev: `momovn-bu-fi-shared`)

## Executive Summary

MoMo saw **strong growth across all measured business lines** in 2025 vs 2024. Lending (Vay Nhanh) exploded 4x, P2P transfer volume grew 50-66%, and the Moni product scaled rapidly after its late-2024 launch.

**Caveat:** No access to `Transaction MoMo` aggregate table or `DLS Online` — this report covers P2P transfers, Lending, and Moni only. DLS (Daily Life Services — bill pay, top-up, e-commerce) is a major revenue driver that's missing here.

---

## 1. P2P Transfers (Wallet-to-Wallet + Wallet-to-Bank)

### W2W (Wallet-to-Wallet)

| Metric | 2024 | 2025 | Change |
|--------|------|------|--------|
| Total transactions | 324.3M | 537.9M | **+66%** |
| Unique senders | 7.0M | 8.1M | +15% |
| Total GMV | 81.9T VND | 152.2T VND | **+86%** |
| Avg transaction size | 252K VND | 283K VND | +12% |

<details>
<summary>SQL & Raw Result</summary>

```sql
SELECT
  EXTRACT(YEAR FROM DATE) AS year,
  COUNT(*) AS total_txns,
  COUNT(DISTINCT user_id) AS unique_senders,
  SUM(AMOUNT) AS total_gmv,
  AVG(AMOUNT) AS avg_txn_size
FROM `momovn-prod.MBI_DA.LOAN_P2P_W2W_RAW_MAPPING`
WHERE DATE >= '2024-01-01' AND DATE < '2026-01-01'
GROUP BY year
ORDER BY year
```

```json
[
  {"year": "2024", "total_txns": "324315440", "unique_senders": "7001300", "total_gmv": "8.1852653388536E13", "avg_txn_size": "252385.92830651565"},
  {"year": "2025", "total_txns": "537866731", "unique_senders": "8070245", "total_gmv": "1.52188707924563E14", "avg_txn_size": "282948.72903110087"}
]
```

</details>

### W2B (Wallet-to-Bank)

| Metric | 2024 | 2025 | Change |
|--------|------|------|--------|
| Total transactions | 406.8M | 611.4M | **+50%** |
| Unique senders | 9.4M | 10.0M | +6% |
| Total GMV | 165.5T VND | 221.6T VND | **+34%** |
| Avg transaction size | 407K VND | 363K VND | -11% |

<details>
<summary>SQL & Raw Result</summary>

```sql
SELECT
  EXTRACT(YEAR FROM DATE) AS year,
  COUNT(*) AS total_txns,
  COUNT(DISTINCT user_id) AS unique_senders,
  SUM(AMOUNT) AS total_gmv,
  AVG(AMOUNT) AS avg_txn_size
FROM `momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING`
WHERE DATE >= '2024-01-01' AND DATE < '2026-01-01'
GROUP BY year
ORDER BY year
```

```json
[
  {"year": "2024", "total_txns": "406833229", "unique_senders": "9446316", "total_gmv": "1.65496365636917E14", "avg_txn_size": "406791.6626272363"},
  {"year": "2025", "total_txns": "611352591", "unique_senders": "10020942", "total_gmv": "2.21618692114242E14", "avg_txn_size": "362505.52525137184"}
]
```

</details>

### P2P Combined

| Metric | 2024 | 2025 | Change |
|--------|------|------|--------|
| Total transactions | **731.1M** | **1.15B** | **+57%** |
| Total GMV | **247.4T VND** | **373.8T VND** | **+51%** |

**Insight:** W2W growing faster than W2B in both volume (+66% vs +50%) and GMV (+86% vs +34%). W2B avg ticket size dropped 11%, suggesting broader adoption among smaller-value users. W2W avg ticket increased — heavier users sending more per transaction.

---

## 2. Lending — Vay Nhanh (Quick Loans)

| Metric | 2024 | 2025 | Change |
|--------|------|------|--------|
| Loans disbursed | 563K | 1.56M | **+177% (2.8x)** |
| Unique borrowers | 436K | 909K | **+108% (2.1x)** |
| Total disbursed | 5.95T VND | 24.18T VND | **+306% (4.1x)** |
| Avg loan size | 10.6M VND | 15.5M VND | +47% |
| First loans | 300K | 611K | +104% |
| Re-loans | 263K | 950K | **+261%** |

<details>
<summary>SQL & Raw Result</summary>

```sql
SELECT
  EXTRACT(YEAR FROM DISBURSED_DATE) AS year,
  COUNT(DISTINCT LOAN_ID) AS num_loans,
  COUNT(DISTINCT AGENT_ID) AS unique_borrowers,
  SUM(DISBURSED_AMOUNT) AS total_disbursed,
  AVG(DISBURSED_AMOUNT) AS avg_loan_size,
  COUNTIF(PROCESS_TYPE = 'First loan') AS first_loans,
  COUNTIF(PROCESS_TYPE = 'Re-loan') AS re_loans
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE >= '2024-01-01' AND DISBURSED_DATE < '2026-01-01'
  AND STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')
GROUP BY year
ORDER BY year
```

```json
[
  {"year": "2024", "num_loans": "563398", "unique_borrowers": "436133", "total_disbursed": "5.9489005E12", "avg_loan_size": "1.0558966308009615E7", "first_loans": "300026", "re_loans": "263372"},
  {"year": "2025", "num_loans": "1560445", "unique_borrowers": "908865", "total_disbursed": "2.4177946E13", "avg_loan_size": "1.549426349534911E7", "first_loans": "610617", "re_loans": "949828"}
]
```

</details>

**Insight:** Vay Nhanh absolutely exploded in 2025 — 4x disbursement growth. Re-loans grew faster than first loans (261% vs 104%), showing strong repeat usage. Average loan size increased 47% (10.6M → 15.5M VND), suggesting the product moved upmarket or loosened credit limits.

---

## 3. Lending — CLO (FI Solutions: Home Credit, FE Credit, etc.)

| Partner | 2024 Tickets | 2024 Disbursed | 2025 Tickets | 2025 Disbursed | Change |
|---------|-------------|----------------|-------------|----------------|--------|
| Home Credit | 6,131 | 174.5B VND | 38,506 | 1.04T VND | **+498%** |
| FE Credit | — | — | 13,291 | 379.1B VND | *New in 2025* |
| MCredit | — | — | 1,332 | 25.4B VND | *New in 2025* |
| SHB | — | — | 600 | 10.0B VND | *New in 2025* |
| F88 | — | — | 4 | 219M VND | *New in 2025* |

| CLO Total | 2024 | 2025 | Change |
|-----------|------|------|--------|
| Tickets | 6,131 | 53,733 | **+776%** |
| Disbursed | 174.5B VND | 1.46T VND | **+735%** |
| Unique users | 5,974 | 51,789 | **+767%** |

<details>
<summary>SQL & Raw Result</summary>

```sql
SELECT
  EXTRACT(YEAR FROM DATE_MODIFIED) AS year,
  PARTNER_ID,
  COUNT(DISTINCT TICKET_ID) AS num_tickets,
  COUNT(DISTINCT USER) AS unique_users,
  SUM(CONTRACT_AMOUNT) AS total_disbursed
FROM `momovn-prod.BU_FI.FIS_TCST`
WHERE DATE_MODIFIED >= '2024-01-01' AND DATE_MODIFIED < '2026-01-01'
  AND STATUS_CODE = 'DISBURSED'
  AND SERVICE_TYPE = 'CLO'
GROUP BY year, PARTNER_ID
ORDER BY year, total_disbursed DESC
```

```json
[
  {"year": "2024", "PARTNER_ID": "lending_mp_homecredit", "num_tickets": "6131", "unique_users": "5974", "total_disbursed": "1.74482958931E11"},
  {"year": "2025", "PARTNER_ID": "lending_mp_homecredit", "num_tickets": "38506", "unique_users": "36940", "total_disbursed": "1.043403786819E12"},
  {"year": "2025", "PARTNER_ID": "clo_fecredit", "num_tickets": "13291", "unique_users": "12942", "total_disbursed": "3.7906126E11"},
  {"year": "2025", "PARTNER_ID": "clo_mcredit", "num_tickets": "1332", "unique_users": "1303", "total_disbursed": "2.5412E10"},
  {"year": "2025", "PARTNER_ID": "clo_shb", "num_tickets": "600", "unique_users": "600", "total_disbursed": "1.0014E10"},
  {"year": "2025", "PARTNER_ID": "clo_f88", "num_tickets": "4", "unique_users": "4", "total_disbursed": "2.19E8"}
]
```

</details>

**Insight:** CLO platform expanded from 1 partner (Home Credit) to 5 partners in 2025. Home Credit alone grew 6x. FE Credit entered and already became the #2 partner at 379B VND. Platform strategy is working — multi-partner lending marketplace.

---

## 4. Moni / QLCT (Expense Management)

| Metric | 2024 | 2025 | Notes |
|--------|------|------|-------|
| Months with data | 4 | 12 | Moni launched ~Sep 2024 |
| Yearly unique users | 190K | 1.35M | **+612%** |
| Avg monthly MAU | 53K | 158K | **+196%** |

<details>
<summary>SQL & Raw Result</summary>

```sql
SELECT
  EXTRACT(YEAR FROM MONTH) AS year,
  COUNT(DISTINCT MONTH) AS months_with_data,
  COUNT(DISTINCT AGENT_ID) AS yearly_unique_users,
  ROUND(COUNT(DISTINCT CONCAT(CAST(MONTH AS STRING), CAST(AGENT_ID AS STRING))) * 1.0
        / COUNT(DISTINCT MONTH)) AS avg_monthly_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH >= '2024-01-01' AND MONTH < '2026-01-01'
  AND PRODUCT = 'MONI'
  AND ACTION = 'CHAT'
GROUP BY year
ORDER BY year
```

```json
[
  {"year": "2024", "months_with_data": "4", "yearly_unique_users": "189621", "avg_monthly_mau": "53439.0"},
  {"year": "2025", "months_with_data": "12", "yearly_unique_users": "1349896", "avg_monthly_mau": "158255.0"}
]
```

</details>

**Insight:** Moni (AI chatbot for expense management) launched in late 2024 and scaled from 53K avg MAU to 158K — 3x growth. Reached 1.35M unique users across 2025. Still small relative to P2P (8-10M users) but growing fast.

---

## Overall Assessment

| Business Line | 2024 Scale | 2025 Scale | YoY Growth |
|---------------|-----------|-----------|------------|
| P2P GMV | 247.4T VND | 373.8T VND | +51% |
| Vay Nhanh disbursed | 5.95T VND | 24.18T VND | +306% |
| CLO disbursed | 174.5B VND | 1.46T VND | +735% |
| Moni MAU (avg) | 53K | 158K | +196% |

**Key takeaways:**
1. **P2P remains the backbone** — 373.8T VND in 2025, solid +51% growth
2. **Lending is the growth engine** — Vay Nhanh 4x, CLO 8x. Combined lending went from ~6.1T to ~25.6T VND
3. **Multi-partner CLO strategy pays off** — 4 new lending partners in 2025
4. **Moni is nascent but promising** — 3x MAU growth, AI-powered product
5. **Missing data:** DLS Online and aggregate Transaction MoMo not accessible — likely adds significant volume (DLS was ~113.5M txns/mo per domain notes)

---

## Data Sources & Limitations

| Query | Table | Rows Scanned | Runtime |
|-------|-------|-------------|---------|
| P2P W2W | `momovn-prod.MBI_DA.LOAN_P2P_W2W_RAW_MAPPING` | 862M | 15s |
| P2P W2B | `momovn-prod.MBI_DA.LOAN_P2P_W2B_RAW_MAPPING` | 1.02B | 29s |
| Vay Nhanh | `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO` | 2.2M | <1s |
| CLO | `momovn-prod.BU_FI.FIS_TCST` | 60K | <1s |
| Moni | `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` | 76M | <1s |

**Not accessible:**
- `Transaction MoMo` — different project (`project-5400504384186300846`), no read access
- `DLS Online` — `momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1`, access denied
