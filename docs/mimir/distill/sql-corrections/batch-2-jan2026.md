# SQL Corrections — Batch 2 (Jan 2026, FS domains)

> Mimir = source of truth. Learning from differences.

## Q1: Paylater MAU — MATCH
- Ours: 1,453,583 | Mimir: 1,453,583
- Both identical SQL. Nothing to learn.

## Q2: Paylater by Segment — MATCH
- Ours: New 107,875 / Retain 1,187,118 / Reactive 158,590
- Mimir: Same numbers. Mimir added ORDER BY MAU_segment (alphabetical). Minor style difference.

## Q3: Vay Nhanh Disbursement — MATCH (but different filters!)

| | Ours | Mimir |
|---|------|-------|
| Result | 3.108T VND | 3.108T VND |
| STATUS filter | `IN ('SUCCESS','DISBURSED','LIQUIDATED')` | **None** |
| Date column | DISBURSED_DATE | DISBURSED_DATE |

**Learning:** Mimir did NOT filter by STATUS but got the same result. This means DISBURSED_DATE is only populated for actually-disbursed loans. The STATUS filter is redundant when filtering by DISBURSED_DATE.

**Correct Mimir SQL:**
```sql
SELECT SUM(DISBURSED_AMOUNT) AS total_disbursed_amount
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE BETWEEN '2026-01-01' AND '2026-01-31'
```

## Q4: Vay Nhanh New vs Reloan — MISMATCH (we measured different things)

| | Ours | Mimir |
|---|------|-------|
| First loan | 58,267 | 109,443 |
| Re-loan | 113,306 | 149,553 |
| Date column | DISBURSED_DATE | **CREATED_DATE** |
| Filter | STATUS IN (...) | **None** |
| Counting | COUNT(*) disbursed only | COUNT(LOAN_ID) all applications |

**Learning:** Mimir used CREATED_DATE to count ALL loan applications. We used DISBURSED_DATE to count only disbursed loans. "So luong don vay" = applications, not disbursements. Mimir's interpretation is more natural.

**Lesson:** "don vay" = loan application (use CREATED_DATE). "giai ngan" = disbursement (use DISBURSED_DATE).

## Q5: TTT MAU — CLOSE (different scope)

| | Ours | Mimir |
|---|------|-------|
| Result | 2,998,000 | 3,460,873 |
| GROUP BY | None | **IS_MP** (Individual: 2,998,000 + Money Pool: 462,873) |
| MAU_TYPE filter | Yes | Yes |

**Learning:** Mimir includes BOTH Individual (2,998,000) and Money Pool (462,873) users. Our query only returned Individual because... wait, actually our SQL didn't filter IS_MP. Let me check.

Actually our 2,998,000 is suspiciously close to Mimir's Individual count. Our SQL counted across all IS_MP but got the Individual number. This suggests our REGEXP_EXTRACT dedup might behave differently than Mimir's. But wait — Mimir also uses REGEXP_EXTRACT. The difference is likely that Money Pool USER_IDs overlap with Individual USER_IDs, so DISTINCT collapses them.

**Actually:** Our 2,998,000 = Mimir's Individual 2,998,000. Mimir reports total as 3,460,873 = Individual + Money Pool. **Mimir's total (3.46M) is the correct "TTT MAU" because it counts both account types.** We should GROUP BY IS_MP and sum.

**Correct SQL (from Mimir):**
```sql
SELECT IS_MP, COUNT(DISTINCT (cast(REGEXP_EXTRACT(USER_ID, r'\d+') as string))) AS mau_users
FROM `momovn-prod.BU_FI.mart_ttt_daily_user_record`
WHERE GRASS_DATE BETWEEN '2026-01-01' AND '2026-01-31'
AND MAU_TYPE != '0.Churn'
GROUP BY IS_MP
```

## Q6: InsurTech Orders — MATCH

| | Ours | Mimir |
|---|------|-------|
| Result | 127,352 | 127,352 |
| Status filter | `CC_STATUS = 'SUCCESS'` | `CC_STATUS = 'SUCCESS'` |

**Learning:** For Jan 2026, Mimir used CC_STATUS='SUCCESS' (English). In Round 1 (Feb), it used 'Thành Công' (Vietnamese). **Mimir is inconsistent on InsurTech CC_STATUS!** Sometimes English, sometimes Vietnamese. The English one works. This might be session-dependent or model-version-dependent.

## Q7: InsurTech Revenue — SKIP (Mimir asked for clarification)

Mimir asked: "Distribution, Collection, or Health Insurance?" — This is actually smart behavior. Our question was too vague. InsurTech has 3 sub-products.

**Learning:** For InsurTech revenue questions, specify the sub-product: "doanh thu Distribution" or "doanh thu Collection" or "doanh thu Bao Hiem Y Te".

## Q8: CLO Disbursement — MATCH

| | Ours | Mimir |
|---|------|-------|
| Result | 124.57B VND | 124.59B VND |
| Deviation | ~0.01% | |
| STATUS filter | `STATUS_CODE = 'DISBURSED'` | `STATUS_CODE IN ('CONTRACT_SIGNED', 'DISBURSED')` |

**Learning:** Mimir includes CONTRACT_SIGNED in addition to DISBURSED. The tiny difference suggests CONTRACT_SIGNED adds very little. Mimir's filter is more complete — a signed contract that's been modified (DATE_MODIFIED) is effectively disbursed.

**Correct SQL (from Mimir):**
```sql
SELECT SUM(CONTRACT_AMOUNT)
FROM `momovn-prod.BU_FI.FIS_TCST`
WHERE DATE_MODIFIED BETWEEN '2026-01-01' AND '2026-01-31'
AND SERVICE_TYPE = 'CLO'
AND STATUS_CODE IN ('CONTRACT_SIGNED', 'DISBURSED')
```

## Q9: CLO Revenue — CLOSE (different date column)

| | Ours | Mimir |
|---|------|-------|
| Result | 4.83B VND | 4.85B VND |
| Deviation | 0.3% | |
| Date column | DATE_MODIFIED | **DATE_REQUESTED** |
| STATUS filter | `STATUS_CODE = 'DISBURSED'` | **None** |

**Learning:** Mimir uses DATE_REQUESTED (date loan was requested) and NO status filter for revenue. We used DATE_MODIFIED with DISBURSED filter. Small difference. Mimir's approach: revenue is recognized when requested. Ours: revenue when disbursed. Both reasonable, Mimir's is slightly broader.

---

## Summary of Lessons

| # | Lesson | Impact |
|---|--------|--------|
| 1 | DISBURSED_DATE is only populated for disbursed loans — STATUS filter redundant | Simplify VN SQL |
| 2 | "don vay" = applications (CREATED_DATE), "giai ngan" = disbursements (DISBURSED_DATE) | Correct semantics |
| 3 | TTT MAU should include Money Pool — GROUP BY IS_MP and report total | Fix our TTT query |
| 4 | InsurTech CC_STATUS is inconsistent in Mimir — sometimes English, sometimes Vietnamese | Monitor |
| 5 | InsurTech revenue needs sub-product specification | Better question templates |
| 6 | CLO STATUS_CODE should include CONTRACT_SIGNED + DISBURSED | Fix our CLO query |
| 7 | CLO revenue uses DATE_REQUESTED, not DATE_MODIFIED | Different date semantics |
