# How We Built Our Multi-Agent Research System

**Source:** https://www.anthropic.com/engineering/multi-agent-research-system
**Published:** Jun 13, 2025
**Authors:** Jeremy Hadfield, Barry Zhang, Kenneth Lien, Florian Scholz, Jeremy Fox, Daniel Ford

---

Our Research feature uses multiple Claude agents to explore complex topics more effectively. We share the engineering challenges and the lessons we learned from building this system.

Claude now has Research capabilities that allow it to search across the web, Google Workspace, and any integrations to accomplish complex tasks.

The journey of this multi-agent system from prototype to production taught us critical lessons about system architecture, tool design, and prompt engineering. A multi-agent system consists of multiple agents (LLMs autonomously using tools in a loop) working together. Our Research feature involves an agent that plans a research process based on user queries, and then uses tools to create parallel agents that search for information simultaneously. Systems with multiple agents introduce new challenges in agent coordination, evaluation, and reliability.

This post breaks down the principles that worked for us—we hope you'll find them useful to apply when building your own multi-agent systems.

## Benefits of a Multi-Agent System

Research work involves open-ended problems where it's very difficult to predict the required steps in advance. You can't hardcode a fixed path for exploring complex topics, as the process is inherently dynamic and path-dependent. When people conduct research, they tend to continuously update their approach based on discoveries, following leads that emerge during investigation.

This unpredictability makes AI agents particularly well-suited for research tasks. Research demands the flexibility to pivot or explore tangential connections as the investigation unfolds. The model must operate autonomously for many turns, making decisions about which directions to pursue based on intermediate findings. A linear, one-shot pipeline cannot handle these tasks.

The essence of search is compression: distilling insights from a vast corpus. Subagents facilitate compression by operating in parallel with their own context windows, exploring different aspects of the question simultaneously before condensing the most important tokens for the lead research agent. Each subagent also provides separation of concerns—distinct tools, prompts, and exploration trajectories—which reduces path dependency and enables thorough, independent investigations.

Once intelligence reaches a threshold, multi-agent systems become a vital way to scale performance. For instance, although individual humans have become more intelligent in the last 100,000 years, human societies have become _exponentially_ more capable in the information age because of our _collective_ intelligence and ability to coordinate. Even generally-intelligent agents face limits when operating as individuals; groups of agents can accomplish far more.

Our internal evaluations show that multi-agent research systems excel especially for breadth-first queries that involve pursuing multiple independent directions simultaneously. We found that a multi-agent system with Claude Opus 4 as the lead agent and Claude Sonnet 4 subagents outperformed single-agent Claude Opus 4 by 90.2% on our internal research eval. For example, when asked to identify all the board members of the companies in the Information Technology S&P 500, the multi-agent system found the correct answers by decomposing this into tasks for subagents, while the single agent system failed to find the answer with slow, sequential searches.

Multi-agent systems work mainly because they help spend enough tokens to solve the problem. In our analysis, three factors explained 95% of the performance variance in the BrowseComp evaluation (which tests the ability of browsing agents to locate hard-to-find information). We found that token usage by itself explains 80% of the variance, with the number of tool calls and the model choice as the two other explanatory factors. This finding validates our architecture that distributes work across agents with separate context windows to add more capacity for parallel reasoning. The latest Claude models act as large efficiency multipliers on token use, as upgrading to Claude Sonnet 4 is a larger performance gain than doubling the token budget on Claude Sonnet 3.7. Multi-agent architectures effectively scale token usage for tasks that exceed the limits of single agents.

There is a downside: in practice, these architectures burn through tokens fast. In our data, agents typically use about 4x more tokens than chat interactions, and multi-agent systems use about 15x more tokens than chats. For economic viability, multi-agent systems require tasks where the value of the task is high enough to pay for the increased performance. Further, some domains that require all agents to share the same context or involve many dependencies between agents are not a good fit for multi-agent systems today. For instance, most coding tasks involve fewer truly parallelizable tasks than research, and LLM agents are not yet great at coordinating and delegating to other agents in real time. We've found that multi-agent systems excel at valuable tasks that involve heavy parallelization, information that exceeds single context windows, and interfacing with numerous complex tools.

## Architecture Overview for Research

Our Research system uses a multi-agent architecture with an orchestrator-worker pattern, where a lead agent coordinates the process while delegating to specialized subagents that operate in parallel.

When a user submits a query, the lead agent analyzes it, develops a strategy, and spawns subagents to explore different aspects simultaneously. The subagents act as intelligent filters by iteratively using search tools to gather information, and then returning results to the lead agent so it can compile a final answer.

Traditional approaches using Retrieval Augmented Generation (RAG) use static retrieval. That is, they fetch some set of chunks that are most similar to an input query and use these chunks to generate a response. In contrast, our architecture uses a multi-step search that dynamically finds relevant information, adapts to new findings, and analyzes results to formulate high-quality answers.

### Process Flow

When a user submits a query, the system creates a LeadResearcher agent that enters an iterative research process:

1. The LeadResearcher begins by thinking through the approach and saving its plan to Memory to persist the context (since if the context window exceeds 200,000 tokens it will be truncated and it is important to retain the plan).
2. It then creates specialized Subagents with specific research tasks.
3. Each Subagent independently performs web searches, evaluates tool results using interleaved thinking, and returns findings to the LeadResearcher.
4. The LeadResearcher synthesizes these results and decides whether more research is needed—if so, it can create additional subagents or refine its strategy.
5. Once sufficient information is gathered, the system exits the research loop and passes all findings to a CitationAgent, which processes the documents and research report to identify specific locations for citations.
6. The final research results, complete with citations, are returned to the user.

## Prompt Engineering and Evaluations for Research Agents

Multi-agent systems have key differences from single-agent systems, including a rapid growth in coordination complexity. Early agents made errors like spawning 50 subagents for simple queries, scouring the web endlessly for nonexistent sources, and distracting each other with excessive updates. Since each agent is steered by a prompt, prompt engineering was our primary lever for improving these behaviors.

### 8 Principles for Prompting Agents

1. **Think like your agents.** To iterate on prompts, you must understand their effects. Build simulations with the exact prompts and tools from your system, then watch agents work step-by-step. This immediately reveals failure modes: agents continuing when they already have sufficient results, using overly verbose search queries, or selecting incorrect tools. Effective prompting relies on developing an accurate mental model of the agent.

2. **Teach the orchestrator how to delegate.** The lead agent decomposes queries into subtasks and describes them to subagents. Each subagent needs an objective, an output format, guidance on the tools and sources to use, and clear task boundaries. Without detailed task descriptions, agents duplicate work, leave gaps, or fail to find necessary information.

3. **Scale effort to query complexity.** Agents struggle to judge appropriate effort for different tasks, so embed scaling rules in the prompts:
   - Simple fact-finding: 1 agent with 3-10 tool calls
   - Direct comparisons: 2-4 subagents with 10-15 calls each
   - Complex research: 10+ subagents with clearly divided responsibilities

4. **Tool design and selection are critical.** Agent-tool interfaces are as critical as human-computer interfaces. Give agents explicit heuristics: examine all available tools first, match tool usage to user intent, search the web for broad external exploration, or prefer specialized tools over generic ones. Bad tool descriptions can send agents down completely wrong paths.

5. **Let agents improve themselves.** Claude 4 models can be excellent prompt engineers. When given a prompt and a failure mode, they can diagnose why the agent is failing and suggest improvements. A tool-testing agent—when given a flawed MCP tool—attempts to use it and rewrites the tool description to avoid failures. This resulted in a **40% decrease in task completion time** for future agents.

6. **Start wide, then narrow down.** Search strategy should mirror expert human research: explore the landscape before drilling into specifics. Prompt agents to start with short, broad queries, evaluate what's available, then progressively narrow focus.

7. **Guide the thinking process.** Extended thinking mode can serve as a controllable scratchpad. The lead agent uses thinking to plan its approach, assessing which tools fit the task, determining query complexity and subagent count, and defining each subagent's role. Subagents use interleaved thinking after tool results to evaluate quality, identify gaps, and refine their next query.

8. **Parallel tool calling transforms speed and performance.** Two kinds of parallelization: (1) the lead agent spins up 3-5 subagents in parallel; (2) the subagents use 3+ tools in parallel. These changes **cut research time by up to 90%** for complex queries.

### Prompting Strategy Summary

Focus on instilling good heuristics rather than rigid rules. Study how skilled humans approach research tasks and encode these strategies in prompts—strategies like decomposing difficult questions, carefully evaluating source quality, adjusting search approaches based on new information, and recognizing when to focus on depth vs. breadth. Set explicit guardrails to prevent agents from spiraling out of control. Focus on a fast iteration loop with observability and test cases.

## Effective Evaluation of Agents

### Key Evaluation Principles

- **Start evaluating immediately with small samples.** In early agent development, changes tend to have dramatic impacts. A prompt tweak might boost success rates from 30% to 80%. Start with ~20 queries representing real usage patterns. Don't delay creating evals because you believe only large evals are useful.

- **LLM-as-judge evaluation scales when done well.** Research outputs are difficult to evaluate programmatically. Use an LLM judge that evaluates each output against criteria:
  - Factual accuracy (do claims match sources?)
  - Citation accuracy (do cited sources match claims?)
  - Completeness (are all requested aspects covered?)
  - Source quality (did it use primary sources?)
  - Tool efficiency (did it use right tools a reasonable number of times?)

  A single LLM call with scores from 0.0-1.0 and a pass-fail grade was the most consistent and aligned with human judgements.

- **Human evaluation catches what automation misses.** People testing agents find edge cases that evals miss—hallucinated answers on unusual queries, system failures, or subtle source selection biases.

Multi-agent systems have emergent behaviors which arise without specific programming. Small changes to the lead agent can unpredictably change how subagents behave. The best prompts are not just strict instructions, but frameworks for collaboration.

## Production Reliability and Engineering Challenges

### Agents Are Stateful and Errors Compound

Agents run for long periods maintaining state across many tool calls. Without effective mitigations, minor system failures can be catastrophic. Built systems that can resume from where the agent was when errors occurred. Use the model's intelligence to handle issues gracefully: let the agent know when a tool is failing and let it adapt. Combine AI adaptability with deterministic safeguards like retry logic and regular checkpoints.

### Debugging Benefits from New Approaches

Agents make dynamic decisions and are non-deterministic between runs, even with identical prompts. Added full production tracing to diagnose why agents failed. Monitor agent decision patterns and interaction structures without monitoring individual conversation contents (privacy). High-level observability helped diagnose root causes, discover unexpected behaviors, and fix common failures.

### Deployment Needs Careful Coordination

Agent systems are highly stateful webs of prompts, tools, and execution logic that run almost continuously. Use **rainbow deployments** to avoid disrupting running agents—gradually shifting traffic from old to new versions while keeping both running simultaneously.

### Synchronous Execution Creates Bottlenecks

Currently, lead agents execute subagents synchronously, waiting for each set to complete before proceeding. This simplifies coordination but creates bottlenecks. Asynchronous execution would enable additional parallelism but adds challenges in result coordination, state consistency, and error propagation.

## Key Stats

| Metric | Value |
|--------|-------|
| Multi-agent vs single-agent improvement | **90.2%** on internal research eval |
| BrowseComp variance explained by tokens | **80%** |
| BrowseComp variance explained by all 3 factors | **95%** |
| Agent tokens vs chat tokens | **4x** more |
| Multi-agent tokens vs chat tokens | **15x** more |
| Research time reduction from parallelization | **up to 90%** |
| Task completion time improvement from agent-improved tools | **40% decrease** |

## Appendix: Additional Tips

### End-State Evaluation of Agents That Mutate State

For agents that modify persistent state across multi-turn conversations, focus on end-state evaluation rather than turn-by-turn analysis. Evaluate whether the agent achieved the correct final state rather than judging whether it followed a specific process. Break evaluation into discrete checkpoints where specific state changes should have occurred.

### Long-Horizon Conversation Management

Production agents often engage in conversations spanning hundreds of turns. Implement patterns where agents summarize completed work phases and store essential information in external memory before proceeding. When context limits approach, agents can spawn fresh subagents with clean contexts while maintaining continuity through careful handoffs and retrieving stored context like research plans from memory.

### Subagent Output to a Filesystem to Minimize the 'Game of Telephone'

Rather than requiring subagents to communicate everything through the lead agent, implement artifact systems where specialized agents can create outputs that persist independently. Subagents call tools to store their work in external systems, then pass lightweight references back to the coordinator. This prevents information loss during multi-stage processing and reduces token overhead.

---

*See the [open-source prompts in the Anthropic Cookbook](https://platform.claude.com/cookbook/patterns-agents-basic-workflows) for example prompts from this system.*
