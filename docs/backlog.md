# Product Backlog

> Dump for features, to-do tasks, and ideas. Newest items at top.

## Verification & Testing

- [ ] **Verify business performance query results.** Take the SQL queries from `data/output/momo_business_2024_vs_2025.md`, re-run them manually in BigQuery console, and cross-check the numbers match what the DA reported (P2P, Vay Nhanh, CLO, Moni — 2024 vs 2025).

- [ ] **Test DA memory persistence across sessions.** Back up current query results, then teach the DA new domain knowledge (corrections, patterns, pitfalls). Clear the entire context, start a fresh session, and verify it retained what was taught — checks if `lt-memory/` and `CLAUDE.md` actually work as persistent knowledge.

## Backlog

- [ ] Get access to `Transaction MoMo` table (`project-5400504384186300846.REPORT.DAILY_PAID_USER_TRANS_VER2`) — needed for overall MoMo transaction aggregates
- [ ] Get access to `DLS Online` table (`momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1`) — needed for Daily Life Services metrics
- [ ] Re-fetch domain files with mojibake (Transaction MoMo, P2P W2W, CreditTech Paylater) — Vietnamese descriptions are garbled from the fork
- [ ] Build reusable SQL patterns in `lt-memory/patterns/` — start with common queries (MAU, GMV, disbursement)
- [ ] Explore InsurTech domain — metadata returns `?` for all columns, need workaround via Mimir question API
