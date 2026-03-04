# Error: InsurTech CC_STATUS metadata vs reality mismatch

**Discovered:** 2026-03-03 (dis-mimir Round 1)

## What happened

Mimir queried `att_fi_ins_nl_ver2` with `CC_STATUS = 'Thành Công'` (Vietnamese) and got 0 results. The actual value in the data is `'SUCCESS'` (English).

## Mimir's SQL
```sql
SELECT count(DISTINCT ID)
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND CC_STATUS = 'Thành Công'
```

## Correct SQL
```sql
SELECT COUNT(*) AS total_orders
FROM `momovn-prod.BU_FI.att_fi_ins_nl_ver2`
WHERE TRANS_DATE BETWEEN '2026-02-01' AND '2026-02-28'
AND CC_STATUS = 'SUCCESS'
```

## Root cause

The domain metadata describes CC_STATUS as "Trạng thái giao dịch: Thành Công/Thất Bại" — using Vietnamese. Mimir uses this description to generate filter values. But the actual stored values are English: `SUCCESS`, `CANCEL`.

## Actual CC_STATUS values (verified Feb 2026)

| Value | Count |
|-------|-------|
| SUCCESS | 138,727 |
| CANCEL | 361 |

## Lesson

Never trust metadata descriptions for exact filter values on InsurTech tables. Always verify with a `SELECT DISTINCT` probe first. This same pattern may affect other InsurTech tables (INS_COL_ALL_TRANS, INS_PUBLIC_HEALTH).
