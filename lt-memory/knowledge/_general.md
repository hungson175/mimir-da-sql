# Knowledge: General (BQ, Mimir, SQL)
> Learned gotchas, corrections, business insights. Never auto-overwritten.
> Last updated: 2026-03-04

## SQL Gotchas

### Mimir API: Field Name is `user_email` (2026-02-25)
The send_question API field is `user_email`, NOT `user`. Using `user` returns 500 NullPointerException.
```json
{"user_email":"son.pham9@mservice.com.vn","domain_id":"...","question":"..."}
```

### BigQuery Reserved Words (2026-02-25)
`GROUPS` is a reserved keyword in BigQuery. Use `user_groups`, `grp`, or `user_grp` instead.

### SQL Operator Precedence: Always Parenthesize OR Clauses (2026-03-02)
`WHERE A AND B OR C` evaluates as `(A AND B) OR C`, NOT `A AND (B OR C)`.
Always wrap OR conditions: `WHERE A AND (B OR C)`.

### Deduplication Pattern for Demographics Join (2026-03-03)
`SEMANTIC_QLCT_VISIT` has multiple rows per user (one per day/product/action). Deduplicate with:
```sql
ROW_NUMBER() OVER (PARTITION BY AGENT_ID ORDER BY MONTH DESC, DATE DESC) AS rn
-- then filter WHERE rn = 1
```
Filter `MONTH >= '2025-09-01'` (last ~3 months) to keep scan cost down.

## Mimir Behavior

### Long-Running BQ Queries Can Take 20+ Minutes (2026-03-03)
Some large table scans take 20+ minutes. Mimir stays in `"NEW"` status — this is normal, NOT a bug.
Wait strategy: poll every 60s for 3 min, then every 2-3 min. Declare TIMEOUT only after 15-20 min.

| Query Type | Typical Wait |
|-----------|--------|
| Single month MAU | < 90s |
| 3-month GROUP BY | 1-2 min |
| 8-month GROUP BY | 10-20 min |
| Complex multi-join | up to 20 min |

### Mimir Timeout on Complex Analytical Queries (2026-03-03)
Mimir sometimes times out on complex queries (MFU distribution with monthly GROUP BY, MoM growth).
Simple single-metric aggregations succeed; multi-step analytical queries may fail.
Break into simpler sub-questions for derived metrics.

### Mimir Partial Month Issue (2026-03-04)
Mimir reports incomplete month data as complete. Example: Mar 2026 Paylater "MAU 403K" was only 2 days.
**Always verify MAX(date) for BOTH BQ AND Mimir before accepting current-month figures.**

### PAYLATER_ALL_TRANS: Date Column is `created_date`, Amount is `amount` (2026-03-06)
NOT `month_trans` (that's in `PAYLATER_MAU_SEGMENT`). NOT `gmv` column — use `amount`.
Filter: `result_code=0 AND trans_type IN ('pay_pl','pay_ins','send_pl')` (same as before).
Jan 2026: 1.45M MAU, 12.8M txns, 2.447T total GMV, 78.9B/day avg.

### Mimir Cannot Forecast / Predict Future (2026-03-06)
Questions like "tổng giải ngân tháng 3/2026 sẽ là bao nhiêu?" → Mimir always refuses: "chỉ có dữ liệu lịch sử."
For forecasts: use our BQ daily run rate × days remaining.

### Financial Hub: Mimir Uses Wrong Metric for User Count (2026-03-06)
Mimir queries `SUM(NO_USER_SCREEN)` from `FINHUB_TTTC_QLTK_ENTRY_POINT` → returns ~10.9T (impossible).
**Correct:** `COUNT(DISTINCT USER) FROM FINHUB_TTTC_QLTK_TRAFFIC WHERE MONTH='2026-01-01'` → 5,967,883.
`NO_USER_SCREEN` is daily total impressions (NOT distinct users), summing it = meaningless.

### Bank Partnership: Mimir Sums Per-Bank Counts, Not Global Dedup (2026-03-06)
Mimir reports "total linked users" as sum of per-bank counts (top N only) — no global COUNT(DISTINCT USER).
Result: 610K (sum of top 5) vs actual 806,426 (globally unique). Per-bank breakdown is exact.
**Correct total:** `COUNT(DISTINCT USER) FROM BANK_MAP_ERROR WHERE STAGE='03. success_map' AND ERROR_CATEGORY='SUCCESS' AND DATE BETWEEN '2026-01-01' AND '2026-01-31'` → 806,426.

### Mimir Domain Isolation (2026-03-04)
Mimir domains are siloed — no cross-product aggregation. Total MoMo MAU must be computed from BQ by UNION-ing all product user tables.
When asked cross-domain question (e.g. "PL users without TTT"), Mimir says "không có thông tin về Túi Thần Tài" — polite refusal, correct behavior. VERDICT: EXPECTED.

### DomainSchemaHandler TIMEOUT — Not Domain-Specific, Query-Complexity Based (2026-03-06)
Error: "Timed out after waiting 30000(ms) for a reply... repliedAddress: DomainSchemaHandler/get_domain_send_question"
This timeout occurs on complex/analytical queries across multiple domains, NOT just specific ones.
Known to timeout: OTA `7172ddb9`, Moni `9066c2ad`, TTT `fa0fb3af` (complex new-user query), InsurTech `800bf3e8` (SP enum).
TTT and InsurTech work fine for simple metric queries (MAU, AUM). Fail on complex analytical questions.
Rule: If Mimir times out, simplify the question or use BQ directly.
- OTA ALL queries: always timeout → BQ only: `momovn-prod.REPORT.2023_TAN_OTA_COMPREHENSIVE_ALL_WITH_INCENTIVE`
- Moni ALL queries: always timeout → BQ only: `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG`
- TTT/InsurTech: simple = OK, complex analytical = timeout

### Paylater Mimir: PAYLATER_ALL_TRANS NOT in Schema (2026-03-06)
When querying Paylater domain `7e23d41a` for transaction-level data, Mimir says table not available.
Mimir also reveals WRONG column name: it thinks date column = `date_trans` (actual = `created_date`).
Paylater Mimir domain likely has only PAYLATER_MAU_SEGMENT — not PAYLATER_ALL_TRANS.
For any transaction/GMV/service_category query → use BQ directly, not Mimir.

## BQ Access

### Blocked Datasets (Updated Batch 17, 2026-03-04)
Our account (`son.pham9@mservice.com.vn`, job project `momovn-bu-fi-shared`) CANNOT query:

| Dataset | Alternative |
|---------|-------------|
| `project-5400504384186300846.BU_UTILITIES_TELCO` | Mimir domain `3165cb58` |
| `momovn-prod.BU_ECOM` | Mimir domain `ca851de3` |
| `momovn-growth-analytics.REPORT_MEDIA` | Mimir domain `bf6c7cb8` |

CAN query:
- `momovn-prod.BU_FI.*` — All FS product tables
- `momovn-prod.MBI_DA.*` — P2P, Billpay, QLCT, SEMANTIC_ tables
- `momovn-prod.BU_FI.INFORMATION_SCHEMA` — Schema discovery

### Airtime: BQ Access Blocked (2026-03-03)
Airtime tables in `project-5400504384186300846.BU_UTILITIES_TELCO` — ACCESS DENIED.
For Airtime data: use Mimir domain `3165cb58-8f0a-4c7d-96e6-ae0b189ff572`.

## SPA Dashboard Design (User Feedback)

### Chart Type Selection — Not Everything Needs a Line (2026-03-06)
User feedback: "I don't think everything needs a line to look good."

**Rules for chart type selection in dashboards:**
1. **Traffic/volume metrics** (whitelist users, page views) → **bar chart**. No line needed — bars show daily magnitude clearly.
2. **Funnel-connected metrics** (submitted → disbursed → GMV) → **3 separate area charts side-by-side** in a connected trio layout. Visually shows the flow with arrows between them. Each chart has its own y-axis scale.
3. **Comparison across categories in same period** (monthly user breakdown) → **stacked bar chart**. Shows parts-of-whole: disbursed (bottom) + submitted-not-disbursed (middle) + whitelist-not-submitted (top).
4. **Rates/percentages with very different scales** → **separate charts, NEVER on same axis**. Example: WL→Submit (~8%) and Submit→Disburse (~73%) on the same chart = one huge line and two flat lines. Split into two charts with appropriate y-axis ranges.
5. **Trend with reference** (avg ticket size) → line chart with dashed reference line for baseline.

**Anti-patterns to avoid:**
- 5 identical line charts for 5 metrics — monotonous, no visual hierarchy
- Mixing 8% and 73% rates on same y-axis — makes the smaller rate look flat/meaningless
- Using line charts for everything — bars, areas, and stacked charts each serve different purposes
Source: user correction
