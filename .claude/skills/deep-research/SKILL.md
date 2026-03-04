---
name: deep-research
description: >-
  Multi-agent deep research skill that produces comprehensive, cited research
  reports on any topic. Spawns parallel sub-researcher agents — each handling
  an isolated sub-topic — then synthesizes all findings into a final one-shot
  report. Use when the user asks to deeply research a topic, compare multiple
  things thoroughly, investigate a claim, produce a research report, or any
  request requiring breadth and depth across multiple sources. Triggers on
  phrases like "deep research", "research X in depth", "compare X vs Y vs Z
  thoroughly", "investigate and report on", "write a comprehensive report
  about", or "find everything about".
---

# Deep Research

Multi-agent research workflow. Decomposes a query into independent sub-topics, spawns parallel `sub-researcher` agents (each with an isolated context window), then synthesizes clean findings into a final one-shot report.

**Architecture:** Lead Researcher (you) → N × sub-researcher agents (parallel) → one-shot synthesis

---

## Phase 1: Scope

### 1a. Clarify (if needed)
If the query is vague or missing critical context, ask **1-2 targeted questions** before proceeding. Examples:
- "How deep should this go? (quick overview vs. exhaustive report)"
- "Any specific angle — technical, business, historical?"
- "Target audience? (executive summary vs. technical deep-dive)"

Skip clarification if the query is already specific enough.

### 1b. Generate Research Brief
Compress the conversation into a focused brief. Reference this throughout:

```
RESEARCH BRIEF
==============
Topic: [What we're researching]
Goal: [What a great answer looks like — the "north star"]
Sub-topics: [List of N independent angles to investigate]
Depth: [simple / moderate / exhaustive]
Output format: [report style, sections expected]
Constraints: [recency requirements, excluded angles, etc.]
```

**Sub-topic decomposition rules:**
- Break into INDEPENDENT threads (no sub-topic should depend on another's findings)
- Simple query (1 angle) → 1 sub-topic, no parallelization needed
- Comparison (A vs B vs C) → 1 sub-topic per entity
- Complex research → 3-8 sub-topics covering different dimensions
- Max 10 sub-researchers in a single wave

---

## Phase 2: Research

### 2a. Spawn sub-researchers in parallel
Use the **Agent tool** to spawn `sub-researcher` agents. Launch ALL independent sub-topics in a **single message** with multiple Agent tool calls — this runs them in parallel.

Each sub-researcher call:
```
subagent_type: "sub-researcher"
prompt: |
  RESEARCH BRIEF CONTEXT:
  [Paste the full Research Brief]

  YOUR SUB-TOPIC:
  [One specific sub-topic from the brief]

  SEED URLS (if any):
  [Optional list of URLs to start from]

  Return compressed findings with citations.
```

### 2b. Evaluate findings
After all sub-researchers return, review:
- Does each finding sufficiently address its sub-topic?
- Are there gaps, contradictions, or missing dimensions?
- Does the combined context address the full Research Brief?

**If gaps exist:** Spawn follow-up sub-researchers targeting the specific gaps. Use the same parallel pattern.

**If sufficient:** Move to Phase 3.

### 2c. Scale guidance

| Query type | Sub-researchers | Search depth |
|------------|----------------|--------------|
| Simple fact / single topic | 1 (or skip agents, research inline) | 3-5 searches |
| Direct comparison (2-3 things) | 1 per entity | 5-10 searches each |
| Multi-dimensional research | 3-6 agents | 5-10 searches each |
| Exhaustive report | 5-10 agents | 10+ searches each |

---

## Phase 3: Write (One-Shot)

**Never write sections in parallel.** Always write the full report in one pass after ALL research is complete. Parallel section writing produces disjoint, incoherent reports.

### 3a. Synthesize
With the Research Brief and all sub-researcher findings in context, write the final report in one LLM pass:

```
Use the brief as your north star.
Use sub-researcher findings as your source material.
Cite sources inline where relevant.
Write for the stated audience and format.
```

### 3b. Report structure (default, adapt as needed)
```
# [Topic]

## Executive Summary
[3-5 sentences: what we found, key insight, so-what]

## [Section per major dimension / sub-topic]
[Findings, data points, analysis]

## Synthesis / Comparison (if applicable)
[Cross-topic analysis, patterns, contradictions]

## Conclusions
[Key takeaways, recommendations if asked]

## Sources
[All cited sources with URLs]
```

---

## Key Rules (from research on multi-agent systems)

1. **Multi-agent = research only.** Write the report yourself, one-shot. Never delegate writing to sub-agents.
2. **Parallel is default.** Launch all independent sub-researchers in one message.
3. **Sub-researchers clean their output.** They return compressed findings, not raw scraped content. Trust their output.
4. **Brief is the north star.** Refer back to it when evaluating whether research is sufficient and when writing.
5. **Context engineering matters.** Compress the brief before passing to sub-researchers — not the full chat history.
6. **Stop when sufficient.** Don't spawn more agents than needed. Match depth to query complexity.
