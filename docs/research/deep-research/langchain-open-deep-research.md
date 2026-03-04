# Open Deep Research — LangChain Blog

> Source: https://blog.langchain.com/open-deep-research/
> Published: 2025-07-16 | Modified: 2024-12-24

---

## TL;DR

Deep research has broken out as one of the most popular agent applications. [OpenAI](https://openai.com/index/introducing-deep-research/), [Anthropic](https://www.anthropic.com/engineering/built-multi-agent-research-system), [Perplexity](https://www.perplexity.ai/hub/blog/introducing-perplexity-deep-research), and [Google](https://gemini.google/overview/deep-research/) all have deep research products that produce comprehensive reports using various sources of context. There are also many open source implementations.

We've built an [open deep researcher](https://github.com/langchain-ai/open_deep_research) that is simple and configurable, allowing users to bring their own models, search tools, and MCP servers.

- Open deep research is built on LangGraph. See the code [here](https://github.com/langchain-ai/open_deep_research)!
- Try it out on [Open Agent Platform](https://oap.langchain.com/)

---

## Challenge

Research is an open-ended task; the best strategy to answer a user request can't be easily known in advance. Requests can require different research strategies and varying levels of search depth.

> _"Compare these two products"_

Comparisons typically benefit from a search on each product, followed by a synthesis step to compare them.

> _"Find the top 20 candidates for this role"_

Listing and ranking requests typically require open-ended search, followed by a synthesis and ranking.

> _"Is X really true?"_

Validation questions can require iterative deep research into a specific domain, where the quality of sources matters much more than the breadth of the search.

With these points in mind, a key design principle for open deep research is **flexibility** to explore different research strategies depending on the request.

---

## Architectural Overview

Agents are well suited to research because they can flexibly apply different strategies, using intermediate results to guide their exploration. Open deep research uses an agent to conduct research as part of a three step process:

- **Scope** – _clarify research scope_
- **Research** – _perform research_
- **Write** – _produce the final report_

---

### Phase 1: Scope

The purpose of scoping is to gather all user-context needed for research. This is a two-step pipeline that performs **User Clarification** and **Brief Generation**.

**User Clarification**

[OpenAI has made the point](https://youtu.be/bNEvJYzoa8A?feature=shared&t=1265) that users rarely provide sufficient context in a research request. We use a chat model to ask for additional context if necessary.

**Brief Generation**

The chat interaction can include clarification questions, follow-ups, or user-provided examples (e.g., a prior deep research report). Because the interaction can be quite verbose and token-heavy, we translate it into a comprehensive, yet focused research brief. The research brief serves as our north star for success, and we refer back to it throughout the research and writing phases.

> _We translate the researcher-user chat interaction into a focused brief for the research supervisor to measure against._

---

### Phase 2: Research

The goal of research is to gather the context requested by the research brief. We conduct research using a [supervisor agent](https://langchain-ai.github.io/langgraph/tutorials/multi_agent/agent_supervisor/).

**Research Supervisor**

The supervisor has a simple job: delegate research tasks to an appropriate number of sub-agents. The supervisor determines if the research brief can be broken-down into independent sub-topics and delegates to sub-agents with isolated context windows. This is useful because it allows the system to parallelize research work, finding more information faster.

**Research Sub-Agents**

Each research sub-agent is presented with a sub-topic from the supervisor. The sub-agent is prompted to focus only on a specific topic and doesn't worry about the full scope of research brief – that's a job for the supervisor. Each sub-agent conducts research as a tool-calling loop, making use of search tools and / or MCP tools configured by the user.

When each sub-agent finishes, it makes a final LLM call to write a detailed answer to the subquestion posed, taking into account all of its research and citing helpful sources. This is important because there can be a lot of raw (e.g. scraped web pages) and irrelevant (e.g. failed tool calls, or irrelevant web sites) information collected from tool call feedback.

> _We make an additional LLM call to clean sub-agent research findings so that the supervisor is provided with clean, processed information._

If we return this raw information to the supervisor, the token usage can bloat significantly and the supervisor is forced to parse through more tokens in order to isolate the most useful information. So, our sub-agent cleans up its findings and returns them to the supervisor.

**Research Supervisor Iteration**

The supervisor reasons about whether the findings from the sub-agents sufficiently address the scope of work in the brief. If the supervisor wants more depth, it can spawn further sub-agents to conduct more research. As the supervisor delegates research and reflects on results, it can flexibly identify what is missing and address these gaps with follow-up research.

---

### Phase 3: Report Writing

The goal of report writing is to fulfill the request in the research brief using the gathered context from sub-agents. When the supervisor deems that the gathered findings are sufficient to address the request in the research brief, then we move ahead to write the report.

To write the report, we provide an LLM with the research brief and all of the research findings returned by sub-agents. This final LLM call produces an output in one-shot, steered by the brief and answered with the research findings.

---

## Lessons

### Only use multi-agent for easily parallelized tasks

Multi vs. single-agent is an important design consideration. Cognition has [argued against multi-agent](https://cognition.ai/blog/dont-build-multi-agents) because sub-agents working in parallel can be difficult to coordinate. If the task (e.g., building an application) requires the multi-agent outputs to function together, then coordination is a risk.

We also learned this lesson. Earlier versions of our research agent wrote sections of the final report in parallel with sub-agents. It was fast, but we faced a problem that Cognition raised: the reports were disjoint because the section-writing agents were not well coordinated. We resolved this by using multi-agent for only the research task itself, performing writing after all research was done.

> _Multi-agents are hard to coordinate, and can perform poorly if writing sections of the report in parallel. We restrict multi-agent to research, and write the report in one-shot._

---

### Multi-agent is useful for isolating context across sub-research topics

Our experiments showed that single agent response quality suffers if the request has multiple sub-topics (e.g., compare A to B to C). The intuition here is straightforward: a single context window needs to store and reason about tool feedback across all of the sub-topics. This tool feedback is often token heavy. [Numerous failure modes](https://www.dbreunig.com/2025/06/22/how-contexts-fail-and-how-to-fix-them.html), such as [context clash](https://www.dbreunig.com/2025/06/22/how-contexts-fail-and-how-to-fix-them.html), become prevalent as the context window accumulates tool calls across many different sub-topics.

#### Concrete example

_Compare the approaches of OpenAI vs Anthropic vs Google DeepMind to AI safety. I want to understand their different philosophical frameworks, research priorities, and how they're thinking about the alignment problem._

Our **single agent** implementation used its search tool to send separate queries about each frontier lab _at the same time._

- 'OpenAI philosophical framework for AI safety and alignment'
- 'Anthropic philosophical framework for AI safety and alignment'
- 'Google DeepMind philosophical framework for AI safety and alignment'

The search tool returned results about all three labs in a _single lengthy string_. Our single agent reasoned about the results for all three frontier labs and called the search tool again, asking independent queries of each.

- 'DeepMind statements on social choice and political philosophy'
- 'Anthropic statements on technical alignment challenges'
- 'OpenAI technical reports on recursive reward modeling'

In each tool-call iteration, the single agent juggled context from three independent threads. This was wasteful from a token and latency perspective. We don't need tokens about OpenAI's recursive reward modeling approach to help us generate our next query about DeepMind's alignment philosophies. Another important observation was that a single agent handling multiple topics would naturally research each topic _less deeply_ (# of search queries) before choosing to finish.

A multi-agent approach allows multiple sub-agents to run in parallel, and each is dedicated to an independent, focused task. Applying a multi-agent approach to research captures the benefits [reported by Anthropic](https://www.anthropic.com/engineering/built-multi-agent-research-system) and is highlighted in our own evals: sub-topic context can be isolated in each sub-agent.

> _Context isolation of sub-topics during research can avoid various long context failure modes._

---

### Multi-agent supervisor enables the system to tune to required research depth

Users do not want simple requests to take 10+ minutes. But, there are some requests that require research with higher token utilization and latency, [as Anthropic has nicely shown](https://www.anthropic.com/engineering/built-multi-agent-research-system).

The supervisor can handle both cases by selectively spawning sub-agents to tune the level of research depth needed for a request. The supervisor is prompted with heuristics to reason about when research should be parallelized, and when a single thread of research is sufficient. Our deep research agent has the flexibility to choose whether to parallelize research or not.

> _A multi-agent supervisor allows for flexibility of search strategy._

---

### Context Engineering is important to mitigate token bloat and steer behavior

Research is a token-heavy task. Anthropic reported that their multi-agent system [used 15x more tokens](https://www.anthropic.com/engineering/built-multi-agent-research-system) than a typical chat application! We used [context engineering](https://blog.langchain.com/context-engineering-for-agents/) to mitigate this.

We compress the chat history into a research brief, which prevents token-bloat from prior messages. Sub-agents prune their research findings to remove irrelevant tokens and information before returning to the supervisor.

Without sufficient context engineering, our agent was prone to running into context window limits from long, raw tool-call results. Practically, it also helps save $ on token spend and helps avoid TPM model rate limits.

> _Context engineering has many practical benefits. It saves tokens, helps avoid context window limits, and helps stay under model rate limits._

---

## Next Steps

Open deep research is a living project and we have several ideas we want to try. These are some of the open questions:

- What is the best way to handle token-heavy tool responses, and what is the best way to filter out irrelevant context to reduce unnecessary token expenditure?
- Are there any evaluations worth running in the hot path of the agent to ensure high quality responses?
- Deep research reports are valuable and relatively expensive to create, can we store this work and leverage these in the future with long-term memory?

---

## Resources

- [GitHub Repo](https://github.com/langchain-ai/open_deep_research)
- [Open Agent Platform](https://oap.langchain.com/)
- [LangChain Academy Course — Deep Research with LangGraph](https://academy.langchain.com/courses/deep-research-with-langgraph)
