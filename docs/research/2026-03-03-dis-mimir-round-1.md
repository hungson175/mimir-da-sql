# Mimir Accuracy Audit — Round 1 (2026-03-03)

**Target month:** Feb 2026
**Metrics tested:** 6
**Score:** 3/6 MATCH, 0 CLOSE, 1 MISMATCH, 2 ERROR

## Quick View

| # | Domain | Metric | Ours | Mimir | Deviation | Verdict |
|---|--------|--------|------|-------|-----------|---------|
| 1 | Paylater | MAU | 1,396,599 | 1,396,599 | 0% | MATCH |
| 2 | Vay Nhanh | Disbursement | 2.515T VND | ERROR | — | ERROR |
| 3 | TTT | MAU | 3,012,756 | ERROR | — | ERROR |
| 4 | InsurTech | Orders | 138,727 | 0 | 100% | MISMATCH |
| 5 | Moni | MAU (CHAT) | 66,498* | 66,498 | 0% | MATCH |
| 6 | Chatbot | Conversations | 344,580 | 344,580 | 0% | MATCH |

---

## Detailed Analysis

### Metric 1: Paylater MAU (Feb 2026) — MATCH

**Our SQL:**
```sql
SELECT COUNT(DISTINCT agent_id) AS paylater_mau
FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
WHERE month_trans = '2026-02-01'
```
**Our result:** 1,396,599

**Mimir question:** "MAU cua Paylater trong thang 2/2026 la bao nhieu? KHONG can chart."
**Mimir result:** 1,396,599
**Mimir SQL:**
```sql
SELECT count(distinct agent_id)
FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
WHERE month_trans = '2026-02-01'
```

**Verdict:** MATCH (0.0%)
**Analysis:** Identical query logic. Mimir nailed this one — simple single-table aggregation with a clear date filter. The `PAYLATER_MAU_SEGMENT` table is well-structured (1 row per user per month), making it hard to get wrong.

---

### Metric 2: Vay Nhanh Disbursement (Feb 2026) — ERROR

**Our SQL:**
```sql
SELECT COUNT(*) AS total_loans, SUM(DISBURSED_AMOUNT) AS total_disbursed
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND STATUS IN ('SUCCESS', 'DISBURSED', 'LIQUIDATED')
```
**Our result:** 143,174 loans / 2,515,191,000,000 VND (2.515T)

**Mimir question:** "Tong so giai ngan Vay Nhanh trong thang 2/2026 la bao nhieu? KHONG can chart."
**Mimir result:** ERROR
**Mimir SQL:**
```sql
SELECT SUM(DISBURSED_AMOUNT)
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-29'
```
**Mimir error:** `Could not cast literal "2026-02-29" to type DATE`

**Verdict:** ERROR — Mimir used Feb 29 in a non-leap year
**Analysis:** Mimir assumed 2026 was a leap year. 2026 is NOT a leap year (not divisible by 4). This is a systematic date-handling bug that will affect ANY query for Feb in non-leap years. Also note: Mimir did NOT filter by STATUS — it would have included cancelled/rejected loans in its sum.

**Root cause:** Mimir's date range logic defaults to `BETWEEN '...-02-01' AND '...-02-29'` without checking leap year.

---

### Metric 3: TTT MAU (Feb 2026) — ERROR

**Our SQL:**
```sql
SELECT COUNT(DISTINCT CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING)) AS ttt_mau
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND MAU_TYPE != '0.Churn'
```
**Our result:** 3,012,756

**Mimir question:** "Tong so user Tui Than Tai trong thang 2/2026 la bao nhieu? KHONG can chart."
**Mimir result:** ERROR
**Mimir SQL:**
```sql
SELECT
    COUNT(DISTINCT (CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING))) AS total_users,
    IS_MP
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE BETWEEN '2026-02-01' AND '2026-02-29'
GROUP BY IS_MP
```
**Mimir error:** `Could not cast literal "2026-02-29" to type DATE`

**Verdict:** ERROR — Same Feb 29 bug as Metric 2
**Analysis:** Same systematic date bug. Interesting that Mimir's SQL structure was actually quite good — it used `REGEXP_EXTRACT` for USER_ID dedup and grouped by `IS_MP`. However, it did NOT filter `MAU_TYPE != '0.Churn'`, which means even if the date worked, it would have returned ~11M total accounts instead of ~3M active users.

**Two bugs:** (1) Feb 29 date error, (2) Missing MAU_TYPE filter.

---

### Metric 4: InsurTech Orders (Feb 2026) — MISMATCH

**Our SQL:**
```sql
SELECT COUNT(*) AS total_orders, SUM(AMOUNT) AS total_amount
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND CC_STATUS = 'SUCCESS'
```
**Our result:** 138,727 orders / 12,091,805,025 VND (12.09B)

**Mimir question:** "Tong so don bao hiem thanh cong trong thang 2/2026 la bao nhieu? KHONG can chart."
**Mimir result:** 0
**Mimir SQL (attempt 1):**
```sql
SELECT count(DISTINCT ID)
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND CC_STATUS = 'Thành Công'
```
**Mimir SQL (attempt 2):** Same query with `'2026-02-29'` — date error.

**Verdict:** MISMATCH (100%) — Mimir returned 0 orders when there were 138,727
**Analysis:** Mimir used the Vietnamese `CC_STATUS = 'Thành Công'` but the actual column value is English `'SUCCESS'`. The domain metadata describes CC_STATUS as "Trạng thái giao dịch: Thành Công/Thất Bại" (Vietnamese), but the actual stored values are English. This is a metadata-vs-reality mismatch that Mimir cannot detect without probing the data.

**Root cause:** Domain metadata describes column values in Vietnamese but actual data stores English values. Mimir trusts metadata literally.

---

### Metric 5: Moni MAU (Feb 2026) — MATCH (CORRECTED)

**Our original SQL was WRONG:**
```sql
-- WRONG: no PRODUCT/ACTION filter, counts all QLCT+MONI users
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH = '2026-02-01'
```
**Our wrong result:** 1,686,840 (all QLCT+MONI users)

**Mimir question:** "MAU cua Moni trong thang 2/2026 la bao nhieu? KHONG can chart."
**Mimir result:** 66,498
**Mimir SQL:**
```sql
SELECT COUNT(DISTINCT AGENT_ID)
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE PRODUCT = 'MONI' AND MONTH = '2026-02-01' AND ACTION = 'CHAT'
```

**Verdict:** MATCH — **Mimir was RIGHT, we were wrong.**
**Analysis:** Moni is the AI chatbot inside the QLCT (expense management) product. "Moni MAU" = users who chatted with Moni = `PRODUCT='MONI' AND ACTION='CHAT'`. This matches the known Jan 2026 baseline of 290K (verified: Jan query returns 290,471). Our query was too broad — it counted all QLCT visitors (1.69M), not Moni users.

**Correct SQL for Moni MAU:**
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE PRODUCT = 'MONI' AND ACTION = 'CHAT' AND MONTH = '2026-02-01'
```

**SEMANTIC_QLCT_VISIT breakdown (Feb 2026):**
| PRODUCT | ACTION | Users |
|---------|--------|-------|
| QLCT | VISIT | 1,668,009 |
| MONI | VISIT | 91,536 |
| MONI | CHAT | 66,498 |

**Alert:** Moni MAU dropped from 290K (Jan) to 66K (Feb) — a 77% drop. Worth investigating separately.

---

### Metric 6: Chatbot Conversations (Feb 2026) — MATCH

**Our SQL:**
```sql
SELECT COUNT(DISTINCT conversation_id) AS total_conversations,
       COUNT(DISTINCT user_id) AS unique_users
FROM `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
WHERE event_date BETWEEN '2026-02-01' AND '2026-02-28'
```
**Our result:** 344,580 conversations / 237,770 users

**Mimir question:** "Tong so cuoc hoi thoai Chatbot Moni trong thang 2/2026 la bao nhieu? KHONG can chart."
**Mimir result:** 344,580
**Mimir SQL:**
```sql
SELECT COUNT(DISTINCT conversation_id)
FROM `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
WHERE FORMAT_TIMESTAMP('%Y-%m', event_date) = '2026-02'
```

**Verdict:** MATCH (0.0%)
**Analysis:** Both counted distinct conversation_id. Mimir used `FORMAT_TIMESTAMP` for the date filter (less efficient than BETWEEN but functionally equivalent). Exact match.

---

## Score Summary

- **MATCH (< 1%):** 3 metrics (Paylater MAU, Moni MAU, Chatbot Conversations)
- **CLOSE (1-5%):** 0 metrics
- **MISMATCH (> 5%):** 1 metric (InsurTech Orders)
- **ERROR:** 2 metrics (Vay Nhanh, TTT — both Feb 29 date bug)
- **Overall accuracy:** 3/6 = 50%

## Lessons Extracted

1. **Feb 29 date bug (CRITICAL)** — Mimir assumes Feb has 29 days in all years. This breaks ANY February query in non-leap years (2025, 2026, 2027). Affects at least Vay Nhanh and TTT domains. Written to `lt-memory/meta/mimir-behavior.md`.

2. **CC_STATUS metadata mismatch (InsurTech)** — Domain metadata describes status values in Vietnamese ('Thành Công') but actual data stores English ('SUCCESS'). Mimir trusts metadata literally and gets 0 results. Written to `lt-memory/errors/mimir-insurtech-status.md`.

3. **WE were wrong on Moni MAU** — Moni is the chatbot inside QLCT. "Moni MAU" = `PRODUCT='MONI' AND ACTION='CHAT'`. Our query had no filter and returned 1.69M (all QLCT visitors). Mimir correctly returned 66K. DA_PROMPT.md baseline of 290K matches Jan 2026 exactly. Corrected our SQL and updated lt-memory.

4. **TTT missing MAU_TYPE filter** — Even if Mimir's date had worked, it did NOT filter `MAU_TYPE != '0.Churn'`, which would have returned ~11M total accounts instead of ~3M active users. Written to `lt-memory/meta/mimir-behavior.md`.

5. **Mimir strengths** — Simple, well-defined metrics on clean tables work perfectly (Paylater MAU, Chatbot conversations). When the table is 1-row-per-entity-per-period and the filter is straightforward, Mimir is reliable.
