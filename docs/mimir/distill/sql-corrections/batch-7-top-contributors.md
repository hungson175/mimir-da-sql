# SQL Corrections — Batch 7: Top Contributors (Jan 2026)

> CEO Question: "Top đối tác và sản phẩm đóng góp doanh thu lớn nhất cho FS tháng 1/2026?"

## Q26: Paylater Top Usecase by GMV — ERROR (Mimir) + LESSONS

Mimir tried `usecase` column which doesn't exist in `PAYLATER_ALL_TRANS`. The correct column is `service_category`.

**Our SQL (correct):**
```sql
SELECT service_category AS usecase, COUNT(*), SUM(amount) AS total_gmv
FROM `momovn-prod.BU_FI.PAYLATER_ALL_TRANS`
WHERE created_date BETWEEN '2026-01-01' AND '2026-01-31'
    AND result_code = 0
    AND trans_type IN ('pay_pl', 'pay_ins', 'send_pl')
GROUP BY 1
ORDER BY total_gmv DESC LIMIT 10
```

**Mimir's SQL (incorrect column):**
```sql
SELECT usecase, SUM(amount) AS total_gmv  -- usecase doesn't exist!
FROM PAYLATER_ALL_TRANS
WHERE ... AND trans_type IN ('pay_pl', 'pay_ins')  -- missing 'send_pl'
```

**Learnings:**
1. `PAYLATER_ALL_TRANS` uses `service_category` not `usecase` for use case breakdown
2. Mimir used `trans_type IN ('pay_pl', 'pay_ins')` — missing `'send_pl'`. Inconsistent with Q19 where it included all 3.
3. **First time Mimir got a column name wrong** on a non-InsurTech domain.

**Top 10 Paylater usecases by GMV (Jan 2026):**
| Rank | Usecase | GMV | Trans |
|------|---------|-----|-------|
| 1 | UTILITIES | 774B | 1.07M |
| 2 | MARKETPLACE | 384B | 1.73M |
| 3 | RETAIL | 252B | 1.11M |
| 4 | SME OFFLINE | 225B | 1.13M |
| 5 | LOGISTICS | 204B | 3.05M |
| 6 | AIRTIME | 169B | 1.76M |
| 7 | APPLICATION STORE | 116B | 1.04M |
| 8 | OTA | 71B | 79K |
| 9 | INSURANCE | 61B | 35K |
| 10 | DIGITAL CONTENT | 43B | 374K |

## Q27: InsurTech Top Product by Revenue — CLOSE + LESSON

| Product | Ours (CC_STATUS=SUCCESS) | Mimir (no filter) | Diff |
|---------|--------------------------|-------------------|------|
| Vehicle Ins | 2,835,516,306 | 2,835,859,106 | 0.01% |
| Travel Ins | 755,363,470 | 755,805,220 | 0.06% |
| PA Bus | 520,354,824 | 525,220,960 | 0.9% |
| Health Ins | 13,209,750 | 13,209,750 | 0% |
| Property Ins | 4,617,995 | 4,626,259 | 0.2% |
| Cyber Ins | 3,775,364 | 3,775,364 | 0% |

**Learning:** Mimir did NOT filter `CC_STATUS='SUCCESS'` for this revenue query! It summed ALL statuses. The difference is tiny (<1%), meaning non-SUCCESS transactions contribute negligible revenue. For InsurTech revenue by product, the CC_STATUS filter is nearly redundant.

**Implication:** For InsurTech:
- **Order COUNT:** Must filter CC_STATUS='SUCCESS' (otherwise includes CANCEL orders)
- **Revenue SUM:** CC_STATUS filter is optional (non-SUCCESS orders have near-zero revenue)

## Q28: CLO Top Partner by Revenue — MATCH
All 5 partners exact match. Both use `DATE_REQUESTED`, `SERVICE_TYPE='CLO'`, `SUM(REVENUE)`.
- Home Credit: 3.02B
- FE Credit: 1.14B
- SHB: 482M
- MCredit: 199M
- F88: 11.4M
**Nothing new.**

## Q29: VN Top Lender by Disbursement — MATCH
All 4 lenders exact match. Both use `DISBURSED_DATE`, `SUM(DISBURSED_AMOUNT)`.
- VIET_CREDIT: 2.15T
- MCREDIT: 605B
- AMBER: 304B
- MBV: 52B
**Nothing new.**

---

## Summary

| # | Domain | Verdict | Key Learning |
|---|--------|---------|-------------|
| Q26 | Paylater | **ERROR** (Mimir) | Column is `service_category` not `usecase`. Mimir got it wrong. |
| Q27 | InsurTech | CLOSE | CC_STATUS filter optional for revenue SUM (non-SUCCESS ≈ 0 revenue) |
| Q28 | CLO | MATCH | — |
| Q29 | Vay Nhanh | MATCH | — |

**Score: 2/4 match, 1 close, 1 error**
**New lessons: 3 (service_category column, Mimir inconsistent trans_type, InsurTech revenue filter optional)**
**Running total: 34 queries, 34 SQL pairs, 18 lessons**
