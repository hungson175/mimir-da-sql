# DA Evaluator — Question Reversal Patterns

> Accumulated from manual rounds. Read this to build the DA Evaluator skill later.

## Gold Dataset Structure

- **File:** `gold_dataset.csv` (extracted from `AAA_LLM_Evaluation.xlsx`, tab "Gold_Dataset")
- **Total:** 123 questions across 5 domains
- **Evaluable (has Gold SQL):** 75 questions — ONLY these can be evaluated
- **Not evaluable (no Gold SQL):** 48 questions (all 13 InsurTech, all 20 BANK, 15 Ambiguous/Complex)
- **Columns:** ID, Question (NL), Category, Difficulty, Target Tables, Target Columns, Business Rules / Notes, Gold SQL, Gold Result (summary), Expected Row Count, Dataset Split, Created By, Created Date, DOMAIN

| Prefix | Domain | Count |
|--------|--------|-------|
| TTT | Tui Than Tai | 51 |
| VTS | Paylater (Vi Tra Sau) | 20 |
| BANK | Bank Partnership | 20 |
| Q | Vay Nhanh | 19 |
| INS | InsurTech | 13 |

**Difficulty:** Simple 37, Moderate 38, Complex 32, Ambiguous 16

## Mimir Question Format Rules

From `docs/ref/mimir-question-templates.md` and `docs/ref/mimir-api.md`:

1. **Always specify time range explicitly** — "thang 2/2026", "tu thang 1 den thang 12 nam 2025"
2. **Always end with "KHONG can chart"** — focuses Mimir on data, not visualization
3. **Use Vietnamese** — Mimir expects Vietnamese questions
4. **Single metric per question** — Mimir handles one metric well
5. **Use Mimir's known vocabulary** — MAU, giao dich, giai ngan, revenue, GMV, user, DAU, WAU, retention rate
6. **Template:** `{metric} {product} trong thang {MM}/{YYYY} la bao nhieu? KHONG can chart.`

## Question Reversal Principles

1. **Natural-sounding** — like a real business user, NOT revealing table names, column names, or schema
2. **Unambiguous** — only one correct interpretation matching the golden SQL
3. **Mimir-compatible** — single domain, clear time range, known metrics
4. **No schema leaks** — never mention BQ table names, column names, dataset paths

### Schema Leak Detection (Critical)

When reversing a golden SQL into a question, NEVER expose internal column/table names as part of the question. The user knows **business concepts**, not database schema.

**Example — BAD:**
- "Tong AUM (tong BALANCE) cua TTT..." → leaks column name `BALANCE`

**Example — GOOD:**
- "Tong AUM cua Tui Than Tai vao cuoi thang 1/2026 la bao nhieu?" → user knows "AUM" (business concept) and "cuoi thang" (snapshot timing), but does NOT know the column is called `BALANCE`

**Rule:** The reversed question should only contain words a business user would naturally say. The DA/LLM must figure out which columns, filters, and tables map to those business concepts. That's the whole point of evaluation — can the DA bridge from business language to correct SQL?

**Gray area: business-logic hints like "giao dich thanh cong"**
- "giao dich thanh cong" (successful transactions) = natural business language, OK to include
- "result_code = 0" = schema leak, NOT OK
- Guideline: if a non-technical executive would say it in a meeting, it's fine. If only a DA would say it, it's a leak.

## Complexity Handling

- **Simple/Moderate** → rephrase using Mimir template patterns, evaluate both Claude DA and Mimir
- **Complex (multi-join, window functions, cohorts)** → rephrase precisely, flag as "Claude DA only" (Mimir likely can't handle)
- **Ambiguous** → the original DA question is vague; the reversed question must REMOVE the ambiguity

## Evaluation Method

- **Criterion 1 (weight 0.5):** SQL comparison — generated SQL vs golden SQL (structural/semantic similarity)
- **Criterion 2 (weight 0.5):** Numerical comparison — query results vs golden query results
- Weights are configurable (e.g., 0.8/0.2, 0.5/0.5) — store raw scores separately so totals can be recalculated

## CSV Formatting Rules

- Use Python `csv.DictWriter` with `quoting=csv.QUOTE_ALL` — every field double-quoted
- Encoding: `utf-8-sig` (UTF-8 with BOM) — required for Numbers/Excel to auto-detect encoding
- Never hand-write CSV rows — always use Python csv module to avoid comma-in-field breakage
- When appending rows, read existing CSV with `csv.DictReader`, append new dicts, rewrite entire file with `csv.DictWriter`

## Results CSV Format

File: `eval_results.csv` — append each evaluation as a new row.

Columns:
```
id, domain, difficulty, category,
original_question, reversed_question,
golden_sql, golden_result,
claude_sql, claude_result,
mimir_sql, mimir_result,
claude_sql_score, claude_num_score,
mimir_sql_score, mimir_num_score,
w_sql, w_num,
claude_total, mimir_total
```

- Raw scores (0-1) stored separately from weights so weights can be adjusted later
- `claude_total = claude_sql_score * w_sql + claude_num_score * w_num`
- `mimir_total = mimir_sql_score * w_sql + mimir_num_score * w_num`

## Execution Architecture

```
Main context = question reversal + scoring only (has golden SQL — contaminated)
├── eval-da subagent (isolated) = Claude DA SQL generation (NO access to golden SQL)
└── eval-mimir subagent (isolated) = Mimir API call (external, naturally isolated)
```

- Both subagents run in PARALLEL to avoid cross-contamination
- Both must return SQL + numerical result
- Scoring happens in main context only
- Subagent definitions: `.claude/agents/eval-da.md` and `.claude/agents/eval-mimir.md`
- Use `subagent_type` matching the agent name, with `model: sonnet` to save tokens

## Error Categorization

When either system errors, assign an `error_category` from this list (generate new ones on the fly as needed):

| Category | Meaning |
|----------|---------|
| `API_PERMISSION` | Mimir API account lacks access to the domain or table |
| `SCHEMA_MISMATCH` | Mimir metadata describes columns differently from actual BQ schema |
| `DATE_BUG` | Feb 29 in non-leap year, wrong date format, etc. |
| `COLUMN_NOT_FOUND` | Referenced a column that doesn't exist in the table |
| `TABLE_NOT_FOUND` | Referenced a table that doesn't exist or is inaccessible |
| `JOIN_ERROR` | Wrong join key or failed join between tables |
| `FILTER_MISSING` | Missing required business-logic filter (e.g., result_code=0, STATUS) |
| `TIMEOUT` | Mimir didn't respond within 180s |
| `AUTH_ERROR` | Mimir returns 401 |
| `BQ_ACCESS_DENIED` | BigQuery denies access to dataset/table |
| `LOGIC_ERROR` | SQL runs but produces wrong result due to incorrect logic |

CSV columns for errors: `claude_error`, `claude_error_category`, `mimir_error`, `mimir_error_category`
- Empty when no error (success)
- `error` = exact error message (copy-paste, no summarizing)
- `error_category` = one of the categories above, or a new one if none fits

## CSV Reason Fields (Added after Round 1-3)

Each score needs a reason explaining WHY that score was given. 4 reason columns:
- `claude_sql_reason` — why Claude DA's SQL got that score
- `claude_num_reason` — why Claude DA's numerical result got that score
- `mimir_sql_reason` — why Mimir's SQL got that score
- `mimir_num_reason` — why Mimir's numerical result got that score

Reasons should be concise (1-2 sentences) but specific enough to review. Include:
- What was correct/incorrect
- Root cause of failure (if score < 1.0)
- Known bugs triggered (e.g., "Feb 29 bug", "column name mismatch")

## Findings by Round

### Round 1: TTT001 (Simple, TTT)
- Both score 1.0 — simple aggregation on clean table, no differentiation
- Both independently added GROUP BY IS_MP — reasonable over-delivery
- Claude DA used LAST_DAY() (more robust); Mimir hardcoded date

### Round 2: VTS001 (Simple, Paylater)
- **Claude DA 1.0, Mimir 0.0** — first real differentiation!
- Mimir FAILED: doesn't know `service_category` column in `PAYLATER_ALL_TRANS`. Tried `usecase` (wrong table), then broken JOIN on `agent_id` (not in ALL_TRANS). Known "Column names on ALL_TRANS: LOW" trust issue.
- Claude DA succeeded because `lt-memory/knowledge/paylater.md` has the correct column name
- **Lesson:** Domain knowledge in lt-memory is the key advantage over Mimir for Paylater ALL_TRANS queries
- **Confirmed:** Reran with 180s timeout — same error. Not a timeout issue, genuine schema gap in Mimir's metadata.
- **Mimir polling:** Use 180s max (12 polls × 15s) — Mimir can take a long time, especially when it retries internally after SQL errors

### Round 3: Q7 (Simple, Vay Nhanh)
- Both score 1.0 — clean table, straightforward SUM/AVG
- Mimir hit Feb 29 bug again but self-corrected (retried with 02-28)
- Both missed `DISBURSED_DATE IS NOT NULL` filter from golden SQL — no impact since BETWEEN excludes NULLs anyway
- **Lesson:** Vay Nhanh is clean domain for Mimir — simple column names, no metadata mismatches

### Round 4-8: Moderate + Complex (TTT003, VTS008, Q2, TTT007, VTS014)

**TTT003 (Moderate, TTT cashin):**
- Claude DA 0.8: missed `cashin_mp_gmv` (6/7 channels). Domain knowledge gap — `cashin_mp_gmv` not in lt-memory
- Mimir 0.25: Feb 29 bug → stalled. SQL logic was correct (also 6 channels, same gap)

**VTS008 (Moderate, VTS top 10% GMV):**
- Claude DA 1.0: used ALL_TRANS (different approach from golden's MAU_SEGMENT) but exact same numbers
- Mimir 0.25: used `month_trans` and `agent_id` (both wrong for ALL_TRANS). Correct logic, wrong columns

**Q2 (Complex, VayNhanh last touchpoint):**
- Claude DA 0.55: correct approach but used ETL_DATE instead of EVENT_TIME, partitioned by user instead of loan. Same top-3 ranking but different percentages
- Mimir 0.25: correct SQL logic but Feb 29 killed it

**TTT007 (Complex, TTT net cash flow):**
- Claude DA 0.8: same cashin_mp_gmv gap. Cashout all 7 channels correct. Net direction correct.
- Mimir 0.25: same Feb 29 stall

**VTS014 (Complex, VTS utilization vs retention):**
- Claude DA 0.7: used 80% threshold vs golden's 70%. Same conclusion, different group sizes
- Mimir 0.0: metadata doesn't expose credit_limit/spending_vts at all

## Systematic Failure Patterns

1. **Mimir Feb 29 bug on TTT domain:** 3/3 Feb 2026 TTT queries failed. Self-correction stalls. CRITICAL.
2. **Mimir Paylater ALL_TRANS schema:** 3/3 queries using ALL_TRANS failed. Wrong column names (usecase, month_trans, agent_id). CRITICAL.
3. **Mimir Paylater MAU_SEGMENT schema:** metadata doesn't expose credit_limit, spending_vts. Complex VTS queries impossible.
4. **Claude DA TTT cashin_mp_gmv:** consistently missing Money Pool cashin channel. lt-memory gap.
5. **Claude DA VayNhanh EVENT_TIME vs ETL_DATE:** used ETL_DATE for touchpoint timing instead of EVENT_TIME. Subtle domain knowledge error.

## Mimir API for Evaluation

- **Send question:** POST `/v1/domain/send_question` with `user_email`, `domain_id`, `question`
- **Poll answer:** GET `/v1/domain/get_answer?request_id=REQUEST_ID` (every 15s, up to 2 min)
- **Parse SQL from response:** `tools_used[].tool_calls[].function.arguments.sql`
- **Domain IDs:** TTT=`fa0fb3af-d3d9-4459-9a82-fb7c6eafab11`, Paylater=`7e23d41a-0baf-4b36-84c3-07fb850bdb6e`, VayNhanh=`bb231763-b11c-45c6-9b0d-eb6d24588e3d`, InsurTech=`800bf3e8-a8ba-45c3-90d8-5f54bdaba156`
- **BANK domain ID:** needs discovery (not in known list)
