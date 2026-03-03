# Pattern: Vay Nhanh Annual Disbursement Summary

## Domain
Vay Nhanh (bb231763-b11c-45c6-9b0d-eb6d24588e3d)

## SQL — Monthly disbursement with key metrics
```sql
SELECT
  FORMAT_DATE("%Y-%m", DISBURSED_DATE) AS month,
  COUNT(*) AS loan_count,
  COUNT(DISTINCT AGENT_ID) AS unique_borrowers,
  SUM(DISBURSED_AMOUNT) AS total_disbursed,
  AVG(DISBURSED_AMOUNT) AS avg_loan_size,
  APPROX_QUANTILES(DISBURSED_AMOUNT, 2)[OFFSET(1)] AS median_loan_size
FROM `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO`
WHERE DISBURSED_DATE >= "2025-01-01" AND DISBURSED_DATE < "2026-01-01"
  AND STATUS IN ("DISBURSED", "SUCCESS", "LIQUIDATED")
GROUP BY month
ORDER BY month
```

## Result
- **2025 Total:** 24.18T VND, 1.56M loans
- **H1:** 8.36T | **H2:** 15.82T (+89%)
- **Peak:** Dec 3025 3.13T
- **Avg Loan Size:** 12M (Jan) → 18M (Nov)

## Schema Notes
- `DISBURSED_DATE` (DATE) — use for time filtering
- `DISBURSED_AMOUNT` (FLOAT) — actual disbursed amount in VND
- `STATUS IN ('DISBURSED', 'SUCCESS', 'LIQUIDATED')` — filters for successful disbursements
- `LENDER_ID` — values: VIET_CREDIT, MCREDIT, AMBER, MBV
- `FINAL_SEGMENT_USER` — values: RELOAN, NEWLOAN, REPEATED, FM_MERCHANT_NEW, FM_STUDENT_NEW, FM_MERCHANT_REPEATED
- `TENOR` — loan tenor in months (common: 6, 9, 12, 15, 18, 24)
