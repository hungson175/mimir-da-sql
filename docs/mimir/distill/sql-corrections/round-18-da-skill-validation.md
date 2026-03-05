# Mimir Accuracy Audit — Round 18 (2026-03-06)

**Target month:** Feb 2026
**Metrics tested:** 10 (8 comparable, 2 skipped)
**Score:** 6/8 MATCH (75%)

## Quick View

| # | Domain | Metric | Ours | Mimir | Dev | Verdict |
|---|--------|--------|------|-------|-----|---------|
| Q1 | Paylater | MAU | 1,396,599 | 1,396,599 | 0.0% | MATCH |
| Q2 | Paylater | GMV (txns+VND) | 10.3M txns / 2.18T | N/A (refused) | — | SKIP |
| Q3 | TTT | MAU (total) | 3,447,166 | 3,447,166 | 0.0% | MATCH |
| Q4 | TTT | AUM end-of-month | 12.46T VND | 12.46T VND | 0.0% | MATCH |
| Q5 | Vay Nhanh | Disbursement count | 143,176 | N/A (returned amount) | — | SKIP |
| Q6 | Vay Nhanh | Disbursement amount | 2.515T VND | 2.515T VND | 0.0% | MATCH |
| Q7 | InsurTech | Successful orders | 138,727 | 138,727 | 0.0% | MATCH |
| Q8 | CLO | Disbursement amount | 148.0B VND | 156.8B VND | 5.6% | MISMATCH |
| Q9 | Moni | Moni MAU | 66,498 | 66,498 | 0.0% | MATCH |
| Q10 | P2P | Total fee revenue | 41.7B VND | 217 VND | 100% | MISMATCH |

## Detailed Analysis

### Q1: Paylater MAU (MATCH)
**Our SQL:**
```sql
SELECT COUNT(DISTINCT agent_id) AS mau
FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
WHERE month_trans = '2026-02-01'
```
**Our result:** 1,396,599
**Mimir SQL:** Identical query.
**Mimir result:** 1,396,599
**Verdict:** MATCH (0.0%). Paylater MAU from MAU_SEGMENT table = HIGH trust.

### Q2: Paylater GMV (SKIP)
**Our SQL:**
```sql
SELECT COUNT(*) AS total_txns, SUM(amount) AS total_gmv
FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
WHERE created_date BETWEEN '2026-02-01' AND '2026-02-28'
  AND result_code = 0
  AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')
```
**Our result:** 10,273,077 txns / 2.182T VND
**Mimir:** Refused. Said PAYLATER_MAU_SEGMENT doesn't have GMV data. Didn't try PAYLATER_ALL_TRANS.
**Lesson:** Mimir is domain-scoped to specific tables. It used MAU_SEGMENT but didn't cross to ALL_TRANS.

### Q3: TTT MAU (MATCH)
**Our SQL:**
```sql
SELECT t1.IS_MP,
    COUNT(DISTINCT CAST(REGEXP_EXTRACT(t1.USER_ID, r'\d+') AS STRING)) AS unique_mau_users
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record` AS t1
WHERE t1.GRASS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
    AND t1.MAU_TYPE != '0.Churn'
GROUP BY t1.IS_MP
```
**Our result:** Individual 3,012,756 + Money Pool 434,410 = 3,447,166
**Mimir SQL:** Same query, same REGEXP_EXTRACT, same MAU_TYPE filter.
**Mimir result:** 3,447,166
**Verdict:** MATCH (0.0%).
**Note:** Mimir tried Feb 29 first (known bug), then retried with Feb 28. Bug persists but Mimir self-corrects.

### Q4: TTT AUM (MATCH — BUG FIXED!)
**Our SQL:**
```sql
SELECT IS_MP, SUM(balance) AS total_aum
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE = '2026-02-28'
GROUP BY IS_MP
```
**Our result:** Individual 10.71T + Money Pool 1.75T = 12.46T VND
**Mimir SQL:** `SELECT is_mp, SUM(BALANCE) FROM ... WHERE GRASS_DATE = '2026-02-28' GROUP BY is_mp`
**Mimir result:** 12.46T VND
**Verdict:** MATCH (0.0%).
**IMPORTANT:** Previously (Batch 4, 2026-03-03), Mimir summed BALANCE across ALL days = 30x inflation. This is now FIXED. Mimir correctly uses end-of-month snapshot. Trust upgrade: AUM LOW → HIGH.

### Q5: Vay Nhanh Disbursement Count (SKIP)
**Our SQL:**
```sql
SELECT COUNT(*) AS total_disbursements
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-28'
```
**Our result:** 143,176
**Mimir:** Returned disbursement AMOUNT (2.515T VND) instead of count. "Tong so giai ngan" was interpreted as total disbursed amount, not number of disbursements.
**Lesson:** Vietnamese ambiguity — "tong so giai ngan" can mean either "total disbursements (count)" or "total disbursed (amount)". For count, ask "tong so khoan giai ngan".

### Q6: Vay Nhanh Disbursement Amount (MATCH)
**Our SQL:**
```sql
SELECT SUM(LOAN_AMOUNT) AS total_disbursed_vnd
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-28'
```
**Our result:** 2,515,241,000,000 VND (2.515T)
**Mimir SQL:** `SELECT SUM(DISBURSED_AMOUNT) FROM ... WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-28'`
**Mimir result:** 2,515,241,000,000 VND (2.515T)
**Verdict:** MATCH (0.0%).
**Note:** Mimir uses DISBURSED_AMOUNT, we used LOAN_AMOUNT — same result. Mimir tried Feb 29 (known bug), retried Feb 28.
**New lesson:** LOAN_AMOUNT = DISBURSED_AMOUNT in this table.

### Q7: InsurTech Successful Orders (MATCH)
**Our SQL:**
```sql
SELECT COUNT(*) AS successful_orders, SUM(final_rev) AS total_revenue
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE trans_date BETWEEN '2026-02-01' AND '2026-02-28'
  AND CC_STATUS = 'SUCCESS'
```
**Our result:** 138,727 orders / 4.73B VND revenue
**Mimir SQL:** `SELECT COUNT(DISTINCT ID) FROM ... WHERE CC_STATUS = 'SUCCESS' AND TRANS_DATE BETWEEN ...`
**Mimir result:** 138,727
**Verdict:** MATCH (0.0%).
**Note:** Mimir correctly used CC_STATUS = 'SUCCESS' (English, not Vietnamese). Previously inconsistent — now reliable.

### Q8: CLO Disbursement Amount (MISMATCH — 5.6%)
**Our SQL:**
```sql
SELECT COUNT(*) AS total_disbursements, SUM(CONTRACT_AMOUNT) AS total_amount
FROM `momovn-prod.BU_FI.FIS_TCST`
WHERE DATE_REQUESTED BETWEEN '2026-02-01' AND '2026-02-28'
  AND SERVICE_TYPE = 'CLO'
  AND STATUS_CODE IN ('CONTRACT_SIGNED', 'DISBURSED')
```
**Our result:** 7,102 disbursements / 148.0B VND
**Mimir SQL:** `SELECT SUM(CONTRACT_AMOUNT) FROM ... WHERE DATE_MODIFIED BETWEEN '2026-02-01' AND '2026-02-28' ...`
**Mimir result:** 156.8B VND
**Verdict:** MISMATCH (5.6%). Delta = 8.76B VND.
**Root cause:** Mimir uses DATE_MODIFIED (known persistent bug). DATE_MODIFIED captures status change date, which can differ from DATE_REQUESTED by days/weeks. Some loans requested in January had status modified in February → counted by Mimir but not by us.
**Who's right:** Depends on definition. DATE_REQUESTED = when application was submitted. DATE_MODIFIED = when disbursement status was updated. For "disbursed in February", DATE_REQUESTED is more accurate for cohort analysis.

### Q9: Moni MAU (MATCH)
**Our SQL:**
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE PRODUCT = 'MONI' AND ACTION = 'CHAT' AND MONTH = '2026-02-01'
```
**Our result:** 66,498
**Mimir SQL:** Identical query.
**Mimir result:** 66,498
**Verdict:** MATCH (0.0%).
**Warning:** Both results are PARTIAL — ETL only has data through Feb 6. True Feb MAU likely ~250-290K. Neither BQ nor Mimir flags this.

### Q10: P2P Total Fee Revenue (MISMATCH — 100%)
**Our SQL:**
```sql
SELECT SUM(fee) AS total_fee_revenue
FROM `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID`
WHERE month = '2026-02-01'
```
**Our result:** 41.7B VND
**Mimir SQL:** `SELECT SUM(fee) FROM ... WHERE month = '2026-02-01' AND service = 'W2W'`
**Mimir result:** 217 VND
**Verdict:** MISMATCH (100%). Off by ~192 million times.
**Root cause:** Mimir adds `service = 'W2W'` filter when asked about "P2P revenue". W2W transfers are FREE (fee = ~0 VND). Actual revenue comes from W2B (45B) and CASHOUT (4.4B). Known bug from Batch 17, still unfixed.

## Score Summary

- **MATCH (< 1%):** 6 metrics (Q1, Q3, Q4, Q6, Q7, Q9)
- **CLOSE (1-5%):** 0 metrics
- **MISMATCH (> 5%):** 2 metrics (Q8 CLO 5.6%, Q10 P2P 100%)
- **SKIP:** 2 metrics (Q2 Paylater GMV refused, Q5 VN count interpreted as amount)
- **Overall accuracy:** 6/8 = 75%

## Lessons Extracted

1. **TTT AUM bug is FIXED** — Mimir now uses end-of-month snapshot. Upgrade trust: AUM LOW → HIGH. (Save to knowledge)
2. **Feb 29 bug persists** — Mimir still tries Feb 29 in non-leap years, but self-corrects with retry. Not a blocker.
3. **CLO DATE_MODIFIED bug persists** — Still uses DATE_MODIFIED instead of DATE_REQUESTED. Known since Batch 9.
4. **P2P W2W revenue bug persists** — Mimir filters service='W2W' which returns ~0. Known since Batch 17.
5. **Mimir refuses cross-table queries** — Asked about Paylater GMV → only checked MAU_SEGMENT, didn't try ALL_TRANS.
6. **Vietnamese question ambiguity** — "tong so giai ngan" = amount or count? Use "tong so khoan giai ngan" for count.
7. **LOAN_AMOUNT = DISBURSED_AMOUNT** — Both columns exist in BAOTU_VAYNHANH_LOAN_INFO, same values.
8. **InsurTech CC_STATUS now reliable** — Consistently uses English 'SUCCESS'. Trust upgrade from INCONSISTENT.
9. **Moni ETL lag** — Feb 2026 only has 6 days of data. Neither BQ nor Mimir warns about this.

## Trust Calibration Update

| Domain | Previous Trust | New Trust | Change |
|--------|---------------|-----------|--------|
| Paylater MAU | HIGH | HIGH | Confirmed |
| TTT MAU | MEDIUM | HIGH | Confirmed accurate |
| TTT AUM | LOW | HIGH | Bug FIXED |
| Vay Nhanh amount | MEDIUM | HIGH | Exact match |
| InsurTech orders | MEDIUM | HIGH | CC_STATUS now reliable |
| CLO | MEDIUM | LOW | DATE_MODIFIED persists |
| Moni MAU | UNVERIFIED | HIGH | Exact match |
| P2P revenue | LOW | LOW | W2W bug persists |
