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

### Mimir Domain Isolation (2026-03-04)
Mimir domains are siloed — no cross-product aggregation. Total MoMo MAU must be computed from BQ by UNION-ing all product user tables.

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
