# FS Business Performance: 2024 vs 2025 vs 2026

Analysis of MoMo Financial Services across 6 product lines.

## Files
- `01_query_results.md` — Raw SQL results from BigQuery
- `02_insights.md` — Extracted insights, YoY comparisons, 2026 projections
- `03_dashboard.html` — Interactive SPA dashboard (open in browser)

## Coverage
- Paylater (MAU, GMV, Fee Revenue)
- Vay Nhanh (Disbursements, Loan Size)
- CLO / FI Solutions (Contracts, Revenue)
- InsurTech (Orders, Revenue by Product)
- TTT / Tui Than Tai (MAU, AUM)
- Moni / QLCT (Chat MAU, Expense Tracking MAU)

## Data Limitations
- TTT: No 2024 data (BQ table starts 2025-01-01)
- Moni: Data starts Sep 2024 (product launch)
- CLO: Launched Jun 2024 (no full-year 2024)
- Vay Nhanh: MoMo's referral fee revenue not in BQ
