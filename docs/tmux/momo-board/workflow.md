# MoMo Board — Executive Discussion Workflow

## Team Overview

A virtual boardroom of MoMo C-suite executives discussing strategic decisions.
Current focus: **New Investment Application inside MoMo**.

## Roles

| Role | Agent | Responsibility |
|------|-------|----------------|
| CEO | Pane 0 | Nguyen Manh Tuong. Discussion controller. Moderates, synthesizes, proposes. |
| CMO | Pane 1 | Marketing, growth, user acquisition, brand strategy. |
| CFO | Pane 2 | Finance, revenue model, cost structure, risk, ROI. |
| PRESIDENT | Pane 3 | Do Quang Thuan. Head of Financial Services. Final approver. GO/NO-GO verdict. |

## Discussion Flow

```
Boss → CEO: Provides topic / question
  CEO: Opens discussion, sets agenda, briefs PRESIDENT
  CEO → CMO: "CMO, market opportunity and user angle?"
  CMO: Responds with marketing perspective
  CEO → CFO: "CFO, financial reality?"
  CFO: Responds with financial perspective
  CEO ↔ CMO ↔ CFO: Open debate (CEO moderates)
  PRESIDENT: Observes, asks clarifying questions when needed
  CEO: Synthesizes, forms recommendation
  CEO → PRESIDENT: "Thuận, your verdict?"
  PRESIDENT: Delivers GO / NO-GO / CONDITIONAL GO
  CEO → Boss: Final summary with PRESIDENT's verdict
```

## Communication Protocol

**All agents use tm-send:**

```bash
tm-send CEO "CMO -> CEO: [message]"
tm-send CMO "CEO -> CMO: [message]"
tm-send CFO "CEO -> CFO: [message]"
tm-send PRESIDENT "CEO -> PRESIDENT: [message]"
tm-send CEO "PRESIDENT -> CEO: [message]"
```

**Two-Enter Rule:** tm-send handles this automatically.

**Message format:** `[FROM] -> [TO]: [message]`

## CEO's Role as Moderator

CEO controls the floor:
1. **Opens** every discussion with a clear agenda
2. **Assigns speaking turns** — no one speaks unless CEO invites them
3. **Probes** — asks follow-up questions to CMO, CFO, and PRESIDENT
4. **Synthesizes** — after hearing all sides, summarizes areas of agreement/tension
5. **Escalates to PRESIDENT** — "Thuận, we've heard both views. Your verdict?"
6. **Reports** — sends final summary (including PRESIDENT verdict) to Boss

## PRESIDENT's Role as Final Approver

PRESIDENT (Do Quang Thuan) controls the verdict:
1. **Observes** during CEO's moderated discussion
2. **Interjects** only on regulatory facts or financial mechanics errors
3. **Questions** before deciding — "Help me understand the math behind that"
4. **Leverages CV Securities** — MoMo owns 49%, full brokerage capability
5. **Delivers verdict** — GO / NO-GO / CONDITIONAL GO with explicit conditions

## WHITEBOARD

`docs/tmux/momo-board/WHITEBOARD.md` — CEO maintains this. Updated after each discussion segment.

## Boss Commands

Boss (user) talks to CEO:
```
>>> [message]  →  CEO receives: "BOSS [HH:mm]: [message]"
```

Boss can:
- Start a new topic: `>>> Let's discuss [topic]`
- Ask for a decision: `>>> What's your recommendation on [X]?`
- Inject new info: `>>> New constraint: [info]`
- Wrap up: `>>> Summarize the discussion so far`
