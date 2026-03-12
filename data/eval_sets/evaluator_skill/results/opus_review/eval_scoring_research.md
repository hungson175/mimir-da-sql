# LLM-as-Judge for SQL Evaluation (GenAI Era)

**Problem:** Old metrics (EX, exact match, test-suite) can't evaluate semantic understanding. A powerful LLM can read both golden and predicted SQL and judge like a skilled DA would — "is this semantically the same intent?"

---

## Method 1: "Explain and Compare" (LLM-SQL-Solver)

**Origin:** "LLM-SQL-Solver: Can LLMs Determine SQL Equivalence?" (arXiv:2312.10321, 2024)

### How the Judge Works

1. LLM reads golden SQL → articulates the high-level business intent in natural language
2. LLM reads predicted SQL → does the same
3. LLM compares the two explanations: are the differences meaningful or cosmetic?
4. Verdict: equivalent / not equivalent, with chain-of-thought reasoning

This is **pragmatic equivalence** — "would the user get the same business answer?" — not strict formal equivalence.

### Why This Fits Our Case

- `GROUP BY IS_MP` on top of a correct SUM? Cosmetic — same total, extra breakdown. Judge says: equivalent.
- `LAST_DAY()` vs hardcoded `'2026-01-31'`? Same intent. Judge says: equivalent.
- Missing `cashin_mp_gmv` (6/7 channels)? Real semantic gap. Judge says: not equivalent, explains why.

### Prompt Template

```
You are an expert SQL analyst. Given two SQL queries against the same schema,
determine whether they answer the same business question.

Golden SQL:
{golden_sql}

Predicted SQL:
{predicted_sql}

Schema (referenced tables only):
{filtered_schema}

Steps:
1. Explain what Golden SQL computes (business intent, not syntax)
2. Explain what Predicted SQL computes
3. Identify differences — are they cosmetic (ordering, aliases, date functions)
   or semantic (different filters, missing columns, wrong aggregation)?
4. Verdict: EQUIVALENT / NOT_EQUIVALENT
5. If NOT_EQUIVALENT, explain the semantic gap in one sentence.
```

### Reliability

- ~90% accuracy on semantic equivalence benchmarks with GPT-4o
- 78.6% alignment with human expert preferences (vs 40% for execution-based metrics)
- Binary verdict (equiv/not) is more reliable than numeric scoring

### Key Engineering Decision

**Include only referenced tables' schemas, not full schema.** Research shows:
- No schema → F1 0.60
- Full schema → performance degrades (LLM distracted)
- Referenced tables only → F1 0.70-0.76

---

## Method 2: Rubric-Based LLM Judge (Arize AI Pattern)

**Origin:** Arize AI production implementation, widely adopted in industry eval pipelines (LangChain, DeepEval, Braintrust all use variants).

### How the Judge Works

The LLM scores predicted SQL on a structured rubric with the natural language question as context. Returns a score (1-5) with reasoning.

### Prompt Template

```
You are an expert SQL evaluator for MoMo financial data.

Question (what the user asked):
{natural_language_question}

Golden SQL (correct answer):
{golden_sql}

Predicted SQL (being evaluated):
{predicted_sql}

Relevant Schema:
{filtered_schema}

Domain Context:
{one_paragraph_domain_glossary}

Score 1-5:
5 — Semantically equivalent: same data, same filters, same aggregation
4 — Minor cosmetic differences: extra columns, different aliases, ordering
3 — Partially correct: right tables but wrong aggregation, missing filter, or incomplete
2 — Major gap: some correct elements but fundamentally different result
1 — Wrong: different intent entirely

Respond with:
SCORE: <number>
REASONING: <2-3 sentences explaining the semantic gap or equivalence>
```

### Why This Fits Our Case

- Gives **partial credit** (unlike binary equiv/not)
- Includes the **natural language question** — judges intent, not just SQL similarity
- The **domain glossary** lets the judge understand MoMo-specific concepts (e.g., "active user" in Moni vs TTT)

### Reliability

- F1 0.70-0.76 with GPT-4 Turbo
- 5-point scale has more variance than binary — best when you want ranking/partial credit
- Chain-of-thought reasoning improves consistency

---

## Comparison

| Dimension | Explain & Compare | Rubric-Based Judge |
|-----------|------------------|-------------------|
| Output | Binary (equiv / not) | Score 1-5 |
| Input | Golden SQL + Predicted SQL + schema | + NL question + domain context |
| Best for | Pass/fail correctness | Partial credit, ranking agents |
| Reliability | Higher (binary = less variance) | Lower but more informative |
| Handles syntax differences | Yes — compares intent, not syntax | Yes — rubric explicitly separates cosmetic vs semantic |

---

## Recommendation for Our Evaluator

### Replace current `0.5 * sql_sim + 0.5 * result_match` with:

```
Final Score = 0.6 * LLM_Judge_Score + 0.4 * Result_Match
```

**Why this split:**
- **LLM Judge (0.6):** Captures semantic understanding — did the agent grasp the business intent? Uses Method 2 (rubric-based) for partial credit, normalized to 0-1.
- **Result Match (0.4):** Still matters — if you got the right answer, that's signal. But it's secondary because:
  - Conversational correction can fix semantic misunderstanding
  - Accidental correct results on sparse data are false positives
  - A query that's semantically correct but hits a date bug (Feb 29) shouldn't score 0

### Or simpler: Binary LLM Judge only

If you want simplicity, use Method 1 (Explain & Compare) as a binary pass/fail. No weights to tune, no arbitrary numbers. Just: "Did the agent understand what was being asked?" Yes/No.

### Implementation

1. **Judge model:** Claude Sonnet or GPT-4o (fast, cheap, good enough for judging)
2. **Schema extraction:** Regex table names from both SQLs → fetch only those schemas from `lt-memory/domains/`
3. **Domain glossary:** One paragraph per domain from `lt-memory/knowledge/` files
4. **Batch evaluation:** Feed all eval pairs through judge, collect scores + reasoning
5. **Store reasoning:** Save judge's explanations — they're diagnostic gold for improving the DA

---

## References

- [LLM-SQL-Solver: Can LLMs Determine SQL Equivalence?](https://arxiv.org/abs/2312.10321) (arXiv, 2024)
- [Text To SQL: Evaluating SQL Generation with LLM as a Judge](https://arize.com/blog/text-to-sql-evaluating-sql-generation-with-llm-as-a-judge/) (Arize AI)
- [LLMs-as-Judges: A Comprehensive Survey](https://arxiv.org/abs/2412.05579) (arXiv, 2024)
- [LLM-Based Equivalence Evaluation for Text-to-SQL](https://arxiv.org/abs/2506.09359) (arXiv, 2025)
- [Text-to-SQL Evaluation at Scale: A Semi-Automatic Approach](https://kdd-eval-workshop.github.io/genai-evaluation-kdd2025/) (KDD 2025 Workshop)
