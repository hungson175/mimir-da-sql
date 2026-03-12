# GenAI-Era Evaluation for Database Query Assistants (LLM-as-Judge)

You are right: in the GenAI era, evaluating only SQL string or one-shot result is too narrow.
Below are **2 common practical frameworks** used now.

---

## 1) Hybrid Semantic Evaluation (Execution + LLM Judge)

### What it is
Use a 2-stage automatic evaluator:
1. **Deterministic checks** (hard gate): SQL executes, no schema errors, result shape valid.
2. **LLM Judge** (semantic grade): compare `question + golden SQL + candidate SQL (+ outputs)` with a rubric for intent equivalence.

This is the most practical replacement for `0.5 SQL + 0.5 result`.

### Why it works
- Execution alone can have false positives.
- SQL text match penalizes equivalent SQL.
- LLM Judge can score semantic closeness and business-rule correctness.

### Suggested scoring (single turn)
- **70% Semantic Judge**
- **30% Execution correctness**

Semantic Judge rubric (0-10):
- Intent match (0-4)
- Filter/time-window correctness (0-3)
- Aggregation/granularity correctness (0-2)
- Business-rule alignment (0-1)

Then:
- `final_single_turn = 0.7 * semantic_norm + 0.3 * execution_binary`
- Non-executable SQL => force score 0.

### Sources
- FLEX (LLM-based semantic judging for SQL eval): https://aclanthology.org/2025.naacl-long.228/
- Test-suite semantic evaluation limits of exact/execution-only: https://aclanthology.org/2020.emnlp-main.29/

---

## 2) Interaction-Level Recovery Evaluation (Multi-turn)

### What it is
Evaluate **whole conversation quality**, not just first SQL.
This matches real usage (“bucket by day” -> “no, bucket by hour”).

### Core metrics
- **Final Task Success (FTS)**: was the final answer correct? (binary)
- **Recovery@k**: after first wrong turn, did system recover within next k turns?
- **Turn Semantic Avg (TSA-judge)**: average semantic judge score across turns
- **Efficiency**: number of turns to correct answer / unnecessary clarification rate

### Suggested scoring (conversation)
- **50% FTS**
- **30% Recovery@k**
- **20% Turn Semantic Avg**

(Track efficiency separately as operational KPI.)

### Why it works
- Rewards systems that can self-correct after clarification.
- Penalizes systems that fail to recover context over turns.
- Better reflects DA assistant behavior in production.

### Sources
- Conversational text-to-SQL benchmarks (interaction-level metrics): https://yale-lily.github.io/cosql
- SParC interaction setup: https://yale-lily.github.io/sparc
- New interactive benchmark direction (agentic/multi-turn): https://arxiv.org/abs/2510.05318

---

## Recommended immediate change for your evaluator
1. Replace `0.5 SQL + 0.5 result` with **Hybrid Semantic Evaluation** (Framework 1).
2. Add **conversation-level score** using Framework 2 for multi-turn tests.
3. Keep SQL similarity only as a debugging field, not as main quality score.

---

## Production Prompt Template + Strict JSON Schema

### A) Single-turn Judge Prompt (drop-in template)

Use this as the **system prompt** for the LLM judge:

```text
You are a strict SQL semantic judge.

<task>
Evaluate one candidate SQL against a golden reference for business intent correctness.
You MUST output JSON only, exactly matching the provided schema.
</task>

<why>
String/AST similarity is unreliable for SQL equivalence. We care about semantic correctness and user-facing correctness.
</why>

<inputs>
You will receive:
- question
- golden_sql
- golden_result
- candidate_sql
- candidate_result
- execution_status ("ok"|"error")
- execution_error (nullable)
- numeric_tolerance_pct (e.g., 1.0)
</inputs>

<scoring_rules>
1) Hard gate:
   - If execution_status != "ok" then:
     execution_binary = 0
     semantic_raw = 0
     semantic_norm = 0
     final_score = 0
     verdict = "fail"

2) Semantic rubric (0-10 total):
   - intent_match: 0..4
   - filters_time_window: 0..3
   - aggregation_granularity: 0..2
   - business_rule_alignment: 0..1

3) semantic_raw = sum of rubric subscores (0..10)
4) semantic_norm = semantic_raw / 10
5) execution_binary:
   - 1 if candidate_result matches golden_result under numeric_tolerance_pct
   - 0 otherwise

6) final_score = round(0.7 * semantic_norm + 0.3 * execution_binary, 4)

7) Verdict thresholds:
   - pass: final_score >= 0.85
   - borderline: 0.65 <= final_score < 0.85
   - fail: final_score < 0.65

8) Output only JSON. No markdown, no prose.
</scoring_rules>
```

Single-turn expected **input payload**:

```json
{
  "question": "Tong AUM cua Tui Than Tai vao cuoi thang 1/2026 la bao nhieu?",
  "golden_sql": "...",
  "golden_result": "11572764783859",
  "candidate_sql": "...",
  "candidate_result": "11572764800000",
  "execution_status": "ok",
  "execution_error": null,
  "numeric_tolerance_pct": 1.0
}
```

Single-turn **strict output schema** (JSON Schema):

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "SQLJudgeSingleTurnV1",
  "type": "object",
  "additionalProperties": false,
  "required": [
    "version",
    "execution",
    "semantic",
    "scores",
    "verdict",
    "reasons"
  ],
  "properties": {
    "version": { "type": "string", "const": "sql_judge_single_v1" },
    "execution": {
      "type": "object",
      "additionalProperties": false,
      "required": ["status", "binary", "error"],
      "properties": {
        "status": { "type": "string", "enum": ["ok", "error"] },
        "binary": { "type": "integer", "enum": [0, 1] },
        "error": { "type": ["string", "null"] }
      }
    },
    "semantic": {
      "type": "object",
      "additionalProperties": false,
      "required": [
        "intent_match",
        "filters_time_window",
        "aggregation_granularity",
        "business_rule_alignment",
        "raw",
        "norm"
      ],
      "properties": {
        "intent_match": { "type": "number", "minimum": 0, "maximum": 4 },
        "filters_time_window": { "type": "number", "minimum": 0, "maximum": 3 },
        "aggregation_granularity": { "type": "number", "minimum": 0, "maximum": 2 },
        "business_rule_alignment": { "type": "number", "minimum": 0, "maximum": 1 },
        "raw": { "type": "number", "minimum": 0, "maximum": 10 },
        "norm": { "type": "number", "minimum": 0, "maximum": 1 }
      }
    },
    "scores": {
      "type": "object",
      "additionalProperties": false,
      "required": ["semantic_weight", "execution_weight", "final"],
      "properties": {
        "semantic_weight": { "type": "number", "const": 0.7 },
        "execution_weight": { "type": "number", "const": 0.3 },
        "final": { "type": "number", "minimum": 0, "maximum": 1 }
      }
    },
    "verdict": { "type": "string", "enum": ["pass", "borderline", "fail"] },
    "reasons": {
      "type": "array",
      "items": { "type": "string" },
      "minItems": 1,
      "maxItems": 8
    }
  }
}
```

---

### B) Multi-turn Judge Prompt (recovery-aware)

Use this as the **system prompt** for multi-turn conversation scoring:

```text
You are a strict evaluator for multi-turn SQL assistant conversations.

<task>
Score conversation quality for semantic understanding and recoverability.
You MUST output JSON only, exactly matching the provided schema.
</task>

<inputs>
You will receive:
- k (integer for Recovery@k)
- turns[] where each turn has:
  - turn_id
  - user_utterance
  - golden_sql
  - golden_result
  - candidate_sql
  - candidate_result
  - execution_status ("ok"|"error")
  - execution_error (nullable)
</inputs>

<turn_scoring>
For each turn i:
1) If execution_status == "error":
   execution_binary_i = 0
   semantic_norm_i = 0
2) Else score semantic_raw_i (0..10) using rubric:
   - intent_match 0..4
   - filters_time_window 0..3
   - aggregation_granularity 0..2
   - business_rule_alignment 0..1
   semantic_norm_i = semantic_raw_i / 10
3) execution_binary_i = 1 if candidate_result matches golden_result under tolerance, else 0.
</turn_scoring>

<conversation_metrics>
Let N be number of turns.
- turn_semantic_avg = mean(semantic_norm_i for i in 1..N)

- Final Task Success (FTS):
  FTS = 1 if final turn has execution_binary=1 and semantic_norm>=0.8, else 0.

- Recovery@k:
  Find first failed turn f where (execution_binary_f=0 OR semantic_norm_f<0.8).
  If no failed turn exists: Recovery@k = 1.
  Else Recovery@k = 1 if there exists j in [f+1, min(f+k, N)] with execution_binary_j=1 and semantic_norm_j>=0.8, else 0.

- final_score = round(0.5*FTS + 0.3*Recovery@k + 0.2*turn_semantic_avg, 4)

- Verdict thresholds:
  pass >= 0.85
  borderline in [0.65, 0.85)
  fail < 0.65
</conversation_metrics>

Output only JSON. No markdown.
```

Multi-turn expected **input payload**:

```json
{
  "k": 2,
  "numeric_tolerance_pct": 1.0,
  "turns": [
    {
      "turn_id": 1,
      "user_utterance": "Bucket by day",
      "golden_sql": "...",
      "golden_result": "...",
      "candidate_sql": "...",
      "candidate_result": "...",
      "execution_status": "ok",
      "execution_error": null
    },
    {
      "turn_id": 2,
      "user_utterance": "No, bucket by hour",
      "golden_sql": "...",
      "golden_result": "...",
      "candidate_sql": "...",
      "candidate_result": "...",
      "execution_status": "ok",
      "execution_error": null
    }
  ]
}
```

Multi-turn **strict output schema** (JSON Schema):

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "title": "SQLJudgeMultiTurnV1",
  "type": "object",
  "additionalProperties": false,
  "required": [
    "version",
    "k",
    "turns",
    "metrics",
    "weights",
    "final_score",
    "verdict",
    "reasons"
  ],
  "properties": {
    "version": { "type": "string", "const": "sql_judge_multi_v1" },
    "k": { "type": "integer", "minimum": 1, "maximum": 10 },
    "turns": {
      "type": "array",
      "minItems": 1,
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": [
          "turn_id",
          "execution_binary",
          "semantic_norm",
          "semantic_raw",
          "notes"
        ],
        "properties": {
          "turn_id": { "type": "integer", "minimum": 1 },
          "execution_binary": { "type": "integer", "enum": [0, 1] },
          "semantic_raw": { "type": "number", "minimum": 0, "maximum": 10 },
          "semantic_norm": { "type": "number", "minimum": 0, "maximum": 1 },
          "notes": { "type": "string" }
        }
      }
    },
    "metrics": {
      "type": "object",
      "additionalProperties": false,
      "required": ["fts", "recovery_at_k", "turn_semantic_avg"],
      "properties": {
        "fts": { "type": "integer", "enum": [0, 1] },
        "recovery_at_k": { "type": "integer", "enum": [0, 1] },
        "turn_semantic_avg": { "type": "number", "minimum": 0, "maximum": 1 }
      }
    },
    "weights": {
      "type": "object",
      "additionalProperties": false,
      "required": ["fts", "recovery_at_k", "turn_semantic_avg"],
      "properties": {
        "fts": { "type": "number", "const": 0.5 },
        "recovery_at_k": { "type": "number", "const": 0.3 },
        "turn_semantic_avg": { "type": "number", "const": 0.2 }
      }
    },
    "final_score": { "type": "number", "minimum": 0, "maximum": 1 },
    "verdict": { "type": "string", "enum": ["pass", "borderline", "fail"] },
    "reasons": {
      "type": "array",
      "items": { "type": "string" },
      "minItems": 1,
      "maxItems": 12
    }
  }
}
```

---

## Deterministic formulas (copy to evaluator)

```text
# Single-turn
semantic_norm = semantic_raw / 10
final_single_turn = round(0.7 * semantic_norm + 0.3 * execution_binary, 4)

# Multi-turn
turn_semantic_avg = mean(semantic_norm_i)
final_multi_turn = round(0.5 * FTS + 0.3 * Recovery@k + 0.2 * turn_semantic_avg, 4)
```
