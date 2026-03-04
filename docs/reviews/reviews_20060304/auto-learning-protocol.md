# Review: Auto-Learning Protocol for Multi-User Rollout

**Date:** 2026-03-04
**Context:** Preparing to roll out the DA skill to 4-5 early adopters who won't know `/claude-md`
**Problem:** The DA must self-correct and persist lessons without any manual trigger from users

---

## Proposal Summary

Add an **Auto-Learning Protocol** section to `DA_PROMPT.md` that makes correction detection and memory updates automatic — zero user training required.

---

## What to Detect (Correction Signals)

| Signal Type | Examples | Confidence |
|-------------|----------|------------|
| **Explicit correction** | "sai roi", "wrong", "it should be X not Y", "the real number is Z" | HIGH |
| **Angry/frustrated language** | Cursing, insults, "ngu qua", "sai bet" — treat as correction, not offense | HIGH |
| **Contradicting data** | User shares screenshot or number that doesn't match DA output | HIGH |
| **Re-asks same question** | Implies first answer wasn't good enough | MEDIUM |
| **"Fix it" / "Sua lai"** | Explicit redo request | HIGH |
| **Quiet disengagement** | User stops responding after getting results, moves to different topic abruptly | LOW (don't act on this) |

---

## What to Do When Correction Detected

### Step 1: Acknowledge (don't be defensive)
- "Got it, updating my knowledge."
- Never argue with the user's correction. They have domain expertise you don't.

### Step 2: Extract the Lesson
Identify specifically:
- **Which domain/table/column** was wrong
- **What the correct value/logic/filter** should be
- **Why** it was wrong (wrong column name? wrong date filter? wrong aggregation?)

### Step 3: Save Immediately
Write to the appropriate `lt-memory/` file:
- Column/table corrections → `lt-memory/errors/sql-gotchas.md`
- Working query patterns → `lt-memory/patterns/<domain>.md`
- Domain knowledge (metric definitions, business logic) → `lt-memory/domains/<domain>.md`
- Update `lt-memory/_index.md` with new entry

### Step 4: Re-run Corrected Query
Prove the fix works. Show the user the corrected result.

---

## Where to Implement

**Single location:** Add as a top-level mandatory section in `docs/DA_PROMPT.md`.

Every DA session loads DA_PROMPT.md, so every user gets this behavior automatically. No hooks, no extra skills, no user training.

### Suggested Section Placement

After the existing `RECALL -> EXPLORE -> LEARN` loop sections, add:

```
## AUTO-LEARN — Correction Detection (Mandatory)

You MUST monitor every user message for correction signals...
[detection rules + save behavior here]
```

Make it **MUST**, not **SHOULD**. Non-optional.

---

## Lesson Metadata Format

Each saved lesson should include:

```markdown
### [DOMAIN] Lesson title
- **Date:** 2026-03-04
- **Source:** user correction
- **What was wrong:** [description]
- **Correct behavior:** [description]
- **Verified:** yes/no
```

This lets future sessions evaluate conflicting lessons from different users.

---

## Risk: Conflicting Corrections from Multiple Users

**Scenario:** User A says "revenue includes refunds", User B says "revenue excludes refunds".

**Mitigation:**
1. Tag each lesson with source user + date
2. When conflicts exist, the DA should flag it: "I have two conflicting lessons about this metric — which is correct?"
3. More recent corrections take precedence by default
4. Lessons verified by SQL results (data backs it up) outweigh opinions

---

## Risk: Over-Learning (Saving Noise)

**Scenario:** User is just venting, not actually correcting anything specific.

**Mitigation:**
- Only save when there's a **concrete, actionable lesson** (specific column, filter, metric, query pattern)
- Vague frustration ("this is useless") without specific corrections = don't save
- The detection rules above already filter by confidence level

---

## Risk: lt-memory File Bloat

**Scenario:** Dozens of users adding corrections, files grow huge.

**Mitigation:**
- Periodic consolidation (existing `_index.md` pattern handles this)
- Duplicate detection: before saving, check if lesson already exists
- Keep entries atomic — one lesson per entry, not paragraphs of context

---

## What This Replaces

| Before (you, the builder) | After (early adopters) |
|---------------------------|------------------------|
| You type `/claude-md` manually | DA auto-detects and saves |
| You know the lt-memory structure | Users don't need to know it exists |
| Corrections require explicit "remember this" | Any correction signal triggers auto-save |

---

## Implementation Effort

**Small.** One section added to `DA_PROMPT.md`. No new files, no hooks, no infrastructure. Pure prompt engineering.

---

## Recommendation

**Do it.** This is the minimum viable self-improvement loop for multi-user rollout. Without it, every user starts from scratch and lessons are lost between sessions.
