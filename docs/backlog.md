# Product Backlog

> Dump for features, to-do tasks, and ideas. Newest items at top.

## Agent System Testing (TOP PRIORITY)

- [ ] **Test the Claude Code-like agent on this system.** Verify the agent runs smoothly end-to-end on the Mimir DA SQL project — can it read memory, write SQL, call APIs, and learn correctly? This is the most urgent item before any new feature work.

## Report-Based Learning

- [ ] **Report-based ground truth testing.** Use real C-level end-of-year reports as ground truth to validate DA accuracy. Flow: take a report → extract key numbers → generate test questions (where we already know the correct answers) → run the DA → compare against ground truth → learn from mismatches. This is a level above Mimir Distill — instead of learning from Mimir's SQL, we learn from verified business reports. Solves the core problem: we lack domain knowledge to verify if the DA's answers are right or wrong. Folder: `experiments/training/reports_based/`.

## Verification & Testing

- [ ] **Verify business performance query results.** Take the SQL queries from `data/output/momo_business_2024_vs_2025.md`, re-run them manually in BigQuery console, and cross-check the numbers match what the DA reported (P2P, Vay Nhanh, CLO, Moni — 2024 vs 2025).

- [ ] **Test DA memory persistence across sessions.** Back up current query results, then teach the DA new domain knowledge (corrections, patterns, pitfalls). Clear the entire context, start a fresh session, and verify it retained what was taught — checks if `lt-memory/` and `CLAUDE.md` actually work as persistent knowledge.

## Mimir Distill — CEO Question Roadmap

Current: 8 batches done, 38 queries, 5 CEO questions (all easy/medium).

**Phase 1 (DONE):** Simple — single domain, single metric, one month
**Phase 2 (DONE):** MoM comparison — same metric across 2 months
**Phase 3 (DONE):** Ranking — top contributors, segment breakdowns
**Phase 4 (DONE):** Daily time-series — trend within a month

**Phase 5 (READY — start now):** Hard strategic questions requiring deep domain knowledge + multi-step reasoning.

Each question below should be decomposed into 3-8 sub-queries, then compared with Mimir. The goal is testing whether Mimir can handle questions that require INSIGHT, not just aggregation.

### Hard CEO Questions (decompose → sub-queries → compare with Mimir)

**H1: "Tình hình làm ăn mảng FS năm 2025 so với 2024?"**
- Requires: YoY comparison across ALL FS products (6 domains)
- Sub-queries: Monthly MAU trend 2024 vs 2025, revenue YoY per product, growth rate ranking
- Tests: Multi-month range, derived metrics (growth %), cross-domain synthesis
- Challenge: TTT table only has ~2 years of data. 2024 data may be missing.

**H2: "Sản phẩm FS nào đang healthy, sản phẩm nào cần lo?"**
- Requires: Combine multiple signals — MAU trend, new user ratio, revenue trend, churn
- Sub-queries: New/Retain/Reactive ratio per product, revenue per user trend, MoM growth consistency
- Tests: Derived KPIs (ARPU, retention rate), multi-dimensional scoring
- Insight: "Healthy" = growing MAU + growing revenue + high retention. "Worried" = declining any of these.

**H3: "User Paylater có dùng TTT không? Cross-sell giữa các sản phẩm FS?"**
- Requires: Cross-domain user overlap — need user_id join across tables
- Sub-queries: Distinct users per product, intersection counts, conversion funnel
- Tests: Cross-table JOIN capability (Mimir can only query ONE domain at a time)
- Challenge: Mimir is single-domain — this will likely FAIL. Documents a hard limitation.

**H4: "Tết ảnh hưởng đến business FS thế nào? So sánh trước-trong-sau Tết"**
- Requires: Identify Tet window (late Jan), compare 3 periods (pre-Tet, Tet week, post-Tet)
- Sub-queries: Daily trends Dec 25 - Feb 15 per product, identify drop/recovery patterns
- Tests: Date-aware business logic, seasonality analysis
- Insight from Batch 8: Paylater already shows Jan decline (525K→332K/day). Tet hypothesis testable.

**H5: "ARPU (Average Revenue Per User) theo từng sản phẩm, xu hướng 6 tháng gần nhất?"**
- Requires: Revenue ÷ MAU per month for each product, 6-month time series
- Sub-queries: Monthly revenue + MAU per product Aug 2025 → Jan 2026, calculate ARPU
- Tests: Derived metric (division), long time range, trend analysis
- Challenge: Not all products have "revenue" — Paylater has GMV, VN has disbursement. Need consistent definition.

**H6: "Mảng nào của FS hiệu quả nhất per-user? Unit economics đơn giản"**
- Requires: GMV/revenue per active user per product
- Sub-queries: SUM(revenue or GMV) / COUNT(DISTINCT active_user) per product
- Tests: Comparative efficiency metric across products
- Insight: TTT interest per MFU, Paylater GMV per MAU, VN disbursement per borrower, CLO revenue per contract

**H7: "Churn rate của từng sản phẩm FS? Sản phẩm nào giữ user tốt nhất?"**
- Requires: New/Reactive/Retain ratios, month-over-month retention
- Sub-queries: Segment distribution per product, Retain% trend, Reactive% trend
- Tests: Retention/churn derived metrics, comparative analysis
- Data available: Paylater has MAU_segment (New/Retain/Reactive), TTT has MFU_TYPE

**H8: "Forecast: Dự đoán MAU tháng 2/2026 dựa trên xu hướng 3 tháng gần nhất"**
- Requires: 3-month MAU trend per product, simple linear projection
- Sub-queries: Nov/Dec/Jan MAU per product, calculate growth rate, project Feb
- Tests: Whether Mimir can do basic forecasting or just historical aggregation
- Expected: Mimir will likely just return historical data, not forecast. Documents capability boundary.

## Backlog

- [ ] Get access to `Transaction MoMo` table (`project-5400504384186300846.REPORT.DAILY_PAID_USER_TRANS_VER2`) — needed for overall MoMo transaction aggregates
- [ ] Get access to `DLS Online` table (`momovn-prod.BU_ECOM.DLS_ALL_TRANS_V3_1`) — needed for Daily Life Services metrics
- [ ] Re-fetch domain files with mojibake (Transaction MoMo, P2P W2W, CreditTech Paylater) — Vietnamese descriptions are garbled from the fork
- [ ] Build reusable SQL patterns in `lt-memory/patterns/` — start with common queries (MAU, GMV, disbursement)
- [ ] Explore InsurTech domain — metadata returns `?` for all columns, need workaround via Mimir question API
