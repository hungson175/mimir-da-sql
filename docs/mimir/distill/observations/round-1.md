# Round 1 Observations (2026-03-03)

**Target:** Feb 2026 | **Score:** 2/6 (33%)

## Per-Metric Observations

### 1. Paylater MAU — MATCH (0%)
- **Mimir behavior:** Correct table, correct column, correct filter. Identical to our SQL.
- **Why it worked:** `PAYLATER_MAU_SEGMENT` is 1 row per user per month. Only one reasonable way to count MAU. Date column is DATE type with first-of-month format — no ambiguity.
- **Pattern:** Mimir excels when table design makes the query unambiguous.

### 2. Vay Nhanh Disbursement — ERROR (Feb 29)
- **Mimir behavior:** Used `'2026-02-29'` as end date. SQL crashed before execution.
- **Hidden second bug:** No STATUS filter — would have included cancelled/rejected loans.
- **Our SQL filtered:** `STATUS IN ('SUCCESS', 'DISBURSED', 'LIQUIDATED')`
- **Question:** Does Mimir know about valid loan statuses? The metadata has example_data for STATUS column showing all values. Mimir should have filtered.

### 3. TTT MAU — ERROR (Feb 29)
- **Mimir behavior:** Same Feb 29 bug. SQL structure was actually good: used REGEXP_EXTRACT for USER_ID, grouped by IS_MP.
- **Hidden second bug:** No `MAU_TYPE != '0.Churn'` filter — would return 11M accounts vs 3M active.
- **Interesting:** Mimir knows about REGEXP_EXTRACT trick for TTT user dedup. This is non-obvious domain knowledge.

### 4. InsurTech Orders — MISMATCH (100%)
- **Mimir behavior:** Filtered `CC_STATUS = 'Thành Công'` (Vietnamese). Actual value: 'SUCCESS'.
- **Mimir tried twice:** First with Feb 28 (correct date, wrong status), second with Feb 29 (wrong date, wrong status).
- **Key insight:** Mimir's metadata describes CC_STATUS as "Thành Công/Thất Bại" but the ACTUAL data uses English.
- **Broader pattern?** Need to check if other domains have metadata-vs-reality mismatches.

### 5. Moni MAU — MISMATCH (96.1%)
- **Mimir behavior:** Added `PRODUCT = 'MONI' AND ACTION = 'CHAT'` to filter. Got 66,498.
- **Our query:** No product/action filter. Got 1,686,840.
- **Analysis:** SEMANTIC_QLCT_VISIT has products QLCT and MONI, actions VISIT and CHAT. "Moni MAU" in business context = all users of expense management features. Mimir interpreted literally as just the chatbot.
- **Who's technically right?** Debatable. If you ask "MAU cua Moni" — Moni is the chatbot AI character. QLCT is the expense tracking feature. Together they make up the "Expense Management" product. The Mimir domain is called "Expense Management" not "Moni".
- **Note for skill:** Need to define what "Moni MAU" means precisely and encode this in the question template.

### 6. Chatbot Conversations — MATCH (0%)
- **Mimir behavior:** Used `FORMAT_TIMESTAMP('%Y-%m', event_date) = '2026-02'` instead of our BETWEEN. Functionally identical.
- **Why it worked:** conversation_id is unique per conversation. COUNT DISTINCT is the only reasonable approach. Table has clear event_date column.
- **Pattern:** Same as Paylater — unambiguous table design leads to correct queries.

## Meta-Observations

1. **Mimir's date handling is fundamentally broken for February.** Not a one-off — it's in the date-range generation logic.
2. **Mimir trusts metadata descriptions literally.** When metadata says "Thành Công", Mimir uses that exact string. No probing to verify.
3. **Mimir has some deep domain knowledge** (TTT REGEXP_EXTRACT) but misses critical business logic filters (MAU_TYPE, STATUS).
4. **Simple tables = reliable Mimir.** Complexity comes from: (a) date edge cases, (b) business-logic filters not in metadata, (c) ambiguous product scope.
