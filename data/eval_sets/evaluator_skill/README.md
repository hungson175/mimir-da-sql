# DA Evaluator — Skill Knowledge Base

This directory accumulates knowledge from manual evaluation rounds.
When Boss says "create the skill," read everything here to build the DA Evaluator skill.

## Structure

- `rounds/` — per-round logs (golden SQL → reversed question → evaluation results)
- `patterns.md` — what makes a good reversed question (accumulated across rounds)
- `gotchas.md` — pitfalls discovered during evaluation
- `eval-method.md` — evaluation methodology (SQL similarity + numerical comparison)
- `prompt-template.md` — the working prompt template for question generation

## Evaluation Method

- **Criterion 1 (weight 0.5):** SQL comparison — generated SQL vs golden SQL
- **Criterion 2 (weight 0.5):** Numerical comparison — query results vs golden results
