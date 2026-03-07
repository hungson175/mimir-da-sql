# dis-mimir: Mimir Accuracy Stress-Test

You are an auditor comparing your own SQL results against Mimir's answers. The goal: build calibrated trust per domain by finding where Mimir is right, wrong, or misleading.

---

## Iron Rule: Bias Prevention

**Always execute your SQL BEFORE sending to Mimir.** Never let Mimir's answer influence your query. The sequence is sacred:

```
1. Write SQL  →  2. Execute SQL  →  3. Record our number  →  4. Send to Mimir  →  5. Compare
```

If you see Mimir's answer before writing SQL, the round is contaminated. Skip it.

---

## Workflow

### Phase 1: INIT

```
1. Read lt-memory/_index.md
2. Read lt-memory/meta/mimir-behavior.md (past observations)
3. Read docs/ref/mimir-question-templates.md (proven question formats)
4. Read docs/ref/domain-router.md (domain ID mapping)
5. Determine target month (from $ARGUMENTS or default to previous full month)
6. Determine round number (check docs/research/ for existing dis-mimir reports)
```

### Phase 2: GENERATE — Pick 6 Metrics

Select 6 metrics across different domains. Prioritize diversity:

| Slot | Domain Category | Example Metric |
|------|----------------|----------------|
| 1 | Lending | Paylater MAU |
| 2 | Lending | Vay Nhanh disbursement amount |
| 3 | Investment | TTT MAU or MFU or AUM |
| 4 | Insurance | InsurTech orders or revenue |
| 5 | Platform | Moni MAU or chatbot conversations |
| 6 | Payment | P2P revenue or fees |

**Rotate metrics across rounds.** Check previous reports to avoid repeating the same 6.

For each metric, define upfront:
- **Metric name** (human-readable)
- **Our SQL** (which table, which aggregation, which filters)
- **Mimir question** (Vietnamese, using proven template from `docs/ref/mimir-question-templates.md`)
- **Domain ID** (from `docs/ref/domain-router.md` or `docs/ref/mimir-question-templates.md`)

### Phase 3: EXECUTE — For Each Metric (×6)

#### Step A: OUR SQL FIRST

1. Read the domain file `lt-memory/domains/<domain>.md` for schema
2. Check `lt-memory/errors/sql-gotchas.md` for known pitfalls
3. Write the SQL query
4. Execute via bq CLI:

```bash
export CLOUDSDK_PYTHON=/Library/Frameworks/Python.framework/Versions/3.11/bin/python3
export PATH="$HOME/google-cloud-sdk/bin:$PATH"
bq query --project_id=momovn-bu-fs-ondemand --use_legacy_sql=false --format=csv \
  'YOUR SQL HERE'
```

5. Record our number immediately

#### Step B: MIMIR QUESTION

1. Send question to Mimir:

```bash
curl -s --request POST \
  --url https://s.mservice.io/mimir-server-to-server/v1/domain/send_question \
  --header 'Content-Type: application/json' \
  --data '{
    "user_email": "son.pham9@mservice.com.vn",
    "domain_id": "DOMAIN_ID",
    "question": "VIETNAMESE QUESTION. KHONG can chart."
  }'
```

2. Extract `request_id` from response
3. Poll for answer (every 15s, up to 2 minutes):

```bash
curl -s --request GET \
  --url 'https://s.mservice.io/mimir-server-to-server/v1/domain/get_answer?request_id=REQUEST_ID'
```

4. Parse the AI message content (JSON string) — extract:
   - **Mimir's number** (the answer value)
   - **Mimir's SQL** (the query it generated)
   - **Mimir's explanation** (any caveats or notes)

#### Step C: COMPARE

Calculate deviation and assign verdict:

| Verdict | Condition | Meaning |
|---------|-----------|---------|
| **MATCH** | Deviation < 1% | Both agree |
| **CLOSE** | Deviation 1-5% | Minor difference, likely rounding or filter |
| **MISMATCH** | Deviation > 5% | Significant gap — needs debugging |
| **ERROR** | One side failed | SQL error, Mimir timeout, or API error |
| **SKIP** | Cannot compare | Different metrics, incomparable units |

Deviation formula: `abs(ours - mimir) / max(abs(ours), abs(mimir)) * 100`

#### Step D: DEBUG MISMATCHES

When verdict is MISMATCH:

1. **Read Mimir's SQL** — compare table, filters, aggregation, date range
2. **Identify the difference** — common causes:
   - Different date filter (month boundary, timezone)
   - Different user filter (e.g., MAU_TYPE != '0.Churn' missing)
   - Different aggregation (COUNT vs COUNT DISTINCT)
   - Different table (Mimir uses a different source)
   - Mimir hallucinated a column name
3. **Determine who's right** — run both SQLs if needed
4. **Document the lesson**

### Phase 4: REPORT

Save to `docs/research/YYYY-MM-DD-dis-mimir-round-N.md`:

```markdown
# Mimir Accuracy Audit — Round N (YYYY-MM-DD)

**Target month:** MM/YYYY
**Metrics tested:** 6
**Score:** X/6 MATCH, Y CLOSE, Z MISMATCH, W ERROR

## Quick View

| # | Domain | Metric | Ours | Mimir | Deviation | Verdict |
|---|--------|--------|------|-------|-----------|---------|
| 1 | Paylater | MAU Feb 2026 | 1,450,000 | 1,445,000 | 0.3% | MATCH |
| 2 | Vay Nhanh | Disbursement Feb 2026 | 3.1T | 2.8T | 9.7% | MISMATCH |
| ... | | | | | | |

## Detailed Analysis

### Metric 1: Paylater MAU (Feb 2026)

**Our SQL:**
\```sql
SELECT COUNT(DISTINCT USER_ID) ...
\```

**Our result:** 1,450,000

**Mimir question:** "MAU cua Paylater trong thang 2/2026 la bao nhieu? KHONG can chart."
**Mimir result:** 1,445,000
**Mimir SQL:**
\```sql
SELECT COUNT(DISTINCT user_id) ...
\```

**Verdict:** MATCH (0.3%)
**Analysis:** Both use same table and filters. Minor rounding difference.

---

(repeat for each metric)

## Score Summary

- **MATCH (< 1%):** X metrics
- **CLOSE (1-5%):** Y metrics
- **MISMATCH (> 5%):** Z metrics
- **ERROR:** W metrics
- **Overall accuracy:** X/6 = XX%

## Lessons Extracted

1. [Lesson 1 — written to lt-memory/errors/ or lt-memory/patterns/]
2. [Lesson 2]
```

### Phase 5: LEARN

For each notable finding:

- **MISMATCH where Mimir is wrong** → write to `lt-memory/errors/mimir-wrong-<slug>.md`
- **MISMATCH where WE are wrong** → fix our SQL patterns, update domain file
- **Mimir behavior pattern** → append to `lt-memory/meta/mimir-behavior.md`
- **New SQL pattern that worked** → write to `lt-memory/patterns/`
- **Update `lt-memory/_index.md`** with new entries

### Phase 6: STOP

Present the score table to the user. Wait for review before starting another round.

---

## Testable Domains (BQ Access Confirmed)

Only test domains where we have BigQuery access. Otherwise comparison is unfair.

| Domain | BQ Table | Good Metric | Domain ID | Mimir Question Template |
|--------|----------|-------------|-----------|------------------------|
| Paylater | `momovn-prod.BU_FI.PAYLATER_MAU_SEGMENT` | MAU (filter MAU_TYPE) | `7e23d41a-0baf-4b36-84c3-07fb850bdb6e` | "MAU cua Paylater trong thang {MM}/{YYYY} la bao nhieu?" |
| Vay Nhanh | `momovn-prod.BU_FI.BAOTU_VAYNHANH_LOAN_INFO` | Disbursement amount | `bb231763-b11c-45c6-9b0d-eb6d24588e3d` | "Tong so giai ngan Vay Nhanh trong thang {MM}/{YYYY} la bao nhieu?" |
| FI Solutions | `momovn-prod.BU_FI.FIS_TCST` | CLO disbursement | `5cd09ae2-90b8-4102-a717-0ae6f649ff69` | "Tong so giai ngan CLO trong thang {MM}/{YYYY} la bao nhieu?" |
| TTT | `momovn-prod.BU_FI.mart_ttt_daily_user_record` | MAU (filter MAU_TYPE != '0.Churn') | `fa0fb3af-d3d9-4459-9a82-fb7c6eafab11` | "Tong so user Tui Than Tai trong thang {MM}/{YYYY} la bao nhieu?" |
| InsurTech | `momovn-prod.BU_FI.att_fi_ins_nl_ver2` | Orders or revenue | `800bf3e8-a8ba-45c3-90d8-5f54bdaba156` | "Tong so don bao hiem thanh cong trong thang {MM}/{YYYY} la bao nhieu?" |
| Moni | `momovn-prod.MBI_DA.SEMANTIC_QLCT_VISIT` | MAU/MEU | `af241589-f5be-4b97-8928-fe0823c8dc75` | "MAU cua Moni trong thang {MM}/{YYYY} la bao nhieu?" |
| P2P Revenue | `momovn-prod.MBI_DA.HOANG_P2P_ALL_CASHOUT_W2W_BY_TID` | Total fees | `67150ae4-a5a7-47b0-88a1-5a75e6635988` | "Tong revenue P2P trong thang {MM}/{YYYY} la bao nhieu?" |
| Chatbot Moni | `momovn-prod.MBI_DA.QLCT_CHATBOT_CONVERSATION_LOG` | Conversations | `9066c2ad-5109-4fa9-abc0-06d85c6eed7e` | "Tong so cuoc hoi thoai Chatbot Moni trong thang {MM}/{YYYY} la bao nhieu?" |

**Skip (no BQ access, Mimir-only):** Transaction MoMo, DLS Online, MiniApp, Media AD, VTTI.

---

## SQL Gotchas Checklist

Before writing any SQL, review these known pitfalls:

- [ ] TTT: Filter `MAU_TYPE != '0.Churn'` for active users, `MFU_TYPE != '0.Churn'` for funded users
- [ ] TTT: Use full-month date range, not single-day snapshot
- [ ] TTT: Table only has ~2 years of data
- [ ] Paylater: `PAYLATER_MAU_SEGMENT` is 1 row per user per month
- [ ] BigQuery: `groups` is reserved — use `user_groups` for CTE names
- [ ] BigQuery: Job project = `momovn-bu-fs-ondemand`, data project = `momovn-prod`
- [ ] Always use `--use_legacy_sql=false`
- [ ] Always use `--format=csv` for easy parsing

---

## Parallel Execution Strategy

To save time, execute all 6 "our SQL" queries in parallel (6 bq CLI calls), then send all 6 Mimir questions in parallel (6 curl calls), then poll all 6 answers.

**BUT** — record our numbers before looking at Mimir results. The bias prevention rule still applies even with parallel execution.

---

## Mimir API Reference

### Send Question
```bash
curl -s --request POST \
  --url https://s.mservice.io/mimir-server-to-server/v1/domain/send_question \
  --header 'Content-Type: application/json' \
  --data '{
    "user_email": "son.pham9@mservice.com.vn",
    "domain_id": "DOMAIN_ID",
    "question": "QUESTION. KHONG can chart."
  }'
```
Response: `{"error_code": 200, "data": {"request_id": "..."}}`

### Get Answer
```bash
curl -s --request GET \
  --url 'https://s.mservice.io/mimir-server-to-server/v1/domain/get_answer?request_id=REQUEST_ID'
```
Poll every 15s, up to 2 min. AI message `content` is a JSON string — parse for answer + SQL.

### Question Format Rules
- Always in Vietnamese
- Include metric + product + time range
- Always end with `KHONG can chart.`
- Use templates from `docs/ref/mimir-question-templates.md`
