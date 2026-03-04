# SQL Correction Pairs — Round 1

> Each pair: Mimir's SQL (possibly wrong) vs our verified SQL.
> This is training data for the mimir-distill skill.

## Pair 1: Paylater MAU (MATCH)

**Mimir SQL:**
```sql
SELECT count(distinct agent_id)
FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
WHERE month_trans = '2026-02-01'
```

**Our SQL:**
```sql
SELECT COUNT(DISTINCT agent_id) AS paylater_mau
FROM `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT`
WHERE month_trans = '2026-02-01'
```

**Verdict:** MATCH. Both correct. No correction needed.

---

## Pair 2: Vay Nhanh Disbursement (ERROR)

**Mimir SQL:**
```sql
SELECT SUM(DISBURSED_AMOUNT)
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-29'
```

**Our SQL:**
```sql
SELECT COUNT(*) AS total_loans, SUM(DISBURSED_AMOUNT) AS total_disbursed
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND STATUS IN ('SUCCESS', 'DISBURSED', 'LIQUIDATED')
```

**Corrections:**
1. `'2026-02-29'` → `'2026-02-28'` (2026 is not a leap year)
2. Missing `STATUS IN (...)` filter — without it, includes CANCELLED, REJECTED, etc.

---

## Pair 3: TTT MAU (ERROR)

**Mimir SQL:**
```sql
SELECT
    COUNT(DISTINCT (CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING))) AS total_users,
    IS_MP
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE BETWEEN '2026-02-01' AND '2026-02-29'
GROUP BY IS_MP
```

**Our SQL:**
```sql
SELECT COUNT(DISTINCT CAST(REGEXP_EXTRACT(USER_ID, r'\d+') AS STRING)) AS ttt_mau
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND MAU_TYPE != '0.Churn'
```

**Corrections:**
1. `'2026-02-29'` → `'2026-02-28'`
2. Missing `MAU_TYPE != '0.Churn'` — without it returns 11M total accounts vs 3M active users
3. Mimir's GROUP BY IS_MP is nice-to-have but not wrong

---

## Pair 4: InsurTech Orders (MISMATCH)

**Mimir SQL:**
```sql
SELECT count(DISTINCT ID)
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND CC_STATUS = 'Thành Công'
```

**Our SQL:**
```sql
SELECT COUNT(*) AS total_orders, SUM(AMOUNT) AS total_amount
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND CC_STATUS = 'SUCCESS'
```

**Corrections:**
1. `CC_STATUS = 'Thành Công'` → `CC_STATUS = 'SUCCESS'` (metadata describes Vietnamese, data stores English)
2. `COUNT(DISTINCT ID)` vs `COUNT(*)` — both valid, ID should be unique per row anyway

---

## Pair 5: Moni MAU (MATCH — WE WERE WRONG)

**Mimir SQL (CORRECT):**
```sql
SELECT COUNT(DISTINCT AGENT_ID)
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE PRODUCT = 'MONI' AND MONTH = '2026-02-01' AND ACTION = 'CHAT'
```
Result: 66,498 — **CORRECT**

**Our SQL (WRONG):**
```sql
SELECT COUNT(DISTINCT AGENT_ID) AS moni_mau
FROM `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT`
WHERE MONTH = '2026-02-01'
```
Result: 1,686,840 — **WRONG** (counted all QLCT+MONI users)

**Lesson:** Moni is the AI chatbot inside QLCT. "Moni MAU" = `PRODUCT='MONI' AND ACTION='CHAT'`. Matches known baseline (Jan 2026 = 290K). Our DA lacked domain knowledge here — Mimir knew better.

---

## Pair 6: Chatbot Conversations (MATCH)

**Mimir SQL:**
```sql
SELECT COUNT(DISTINCT conversation_id)
FROM `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
WHERE FORMAT_TIMESTAMP('%Y-%m', event_date) = '2026-02'
```

**Our SQL:**
```sql
SELECT COUNT(DISTINCT conversation_id) AS total_conversations, COUNT(DISTINCT user_id) AS unique_users
FROM `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
WHERE event_date BETWEEN '2026-02-01' AND '2026-02-28'
```

**Verdict:** MATCH. Both correct. Mimir's FORMAT_TIMESTAMP approach is slightly less efficient but functionally equivalent.

---

## Correction Pattern Summary

| Bug Type | Count | Domains Affected |
|----------|-------|------------------|
| Feb 29 date error | 2 | Vay Nhanh, TTT |
| Missing business-logic filter | 2 | Vay Nhanh (STATUS), TTT (MAU_TYPE) |
| Metadata-vs-reality value mismatch | 1 | InsurTech (CC_STATUS) |
| OUR SQL was wrong (missing filter) | 1 | Moni (needed PRODUCT+ACTION) |
| No correction needed | 3 | Paylater, Moni, Chatbot |
