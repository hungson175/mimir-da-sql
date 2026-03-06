# Vay Nhanh Performance Dashboard

**Generated:** 2026-03-06  
**Data Period:** January 1 - March 6, 2026

## Files

| File | Description |
|------|-------------|
| `01_queries.sql` | All SQL queries used for data extraction |
| `01_query_results.md` | Raw query results in markdown tables |
| `03_dashboard.html` | Interactive SPA dashboard with charts |

## Metrics Covered

1. **Whitelist Users** - Traffic from users in whitelist (from BAOTU_VAYNHANH_ENTRY_POINT)
2. **Submitted Users** - Users who submitted loan applications
3. **Disbursed Users** - Users who received loan disbursements
4. **GMV Disburse** - Total disbursement amount (VND)
5. **Average Ticket Size** - Average loan amount per disbursement

## Time Granularities

- **Daily:** Jan 1 - Mar 6, 2026 (65 days)
- **Weekly:** 10 weeks
- **Monthly:** Jan, Feb, Mar (partial)

## Key Findings

| Metric | Jan 2026 | Feb 2026 | Mar 2026 (partial) |
|--------|----------|----------|-------------------|
| Whitelist Users | 1,050,927 | 994,054 | 400,621 |
| Submitted Users | 207,951 | 178,617 | 35,114 |
| Disbursed Users | 147,982 | 126,248 | 25,424 |
| GMV | 3,108.4B VND | 2,515.2B VND | 474.2B VND |
| Avg Ticket Size | 18.1M VND | 17.6M VND | 17.5M VND |

## Tet Holiday Impact

Week 7 (Feb 17-23, Tet week) shows significant drop:
- Whitelist: -34% vs Week 6
- Submissions: -52% vs Week 6
- Disbursements: -54% vs Week 6
- GMV: -58% vs Week 6

Recovery started Week 8 and continues into March.

## How to View

Open `03_dashboard.html` in any modern web browser:
```bash
open data/output/vaynhanh_dashboard_2026-03-06/03_dashboard.html
```
