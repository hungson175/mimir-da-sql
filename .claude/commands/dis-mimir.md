# dis-mimir: Stress-Test Mimir Accuracy

Load and follow `docs/prompts/DIS_MIMIR_PROMPT.md` — that file contains the full skill instructions.

**Context:** You are running a Mimir accuracy audit. For each metric, you write your own SQL first (bias prevention), then ask Mimir the same question, and compare results.

**Target month:** $ARGUMENTS (default: previous full month)
