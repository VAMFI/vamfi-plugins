---
name: Run Discovery
description: This skill should be used when the user asks to "run discovery", "facilitate a discovery session", "create a discovery document", "map stakeholders", "build an assumption register", "define success metrics", "plan discovery interviews", or needs to structure the initial research phase of an engagement.
version: 1.0.0
---

# Run Discovery

Facilitate a structured discovery process that surfaces the real problem, maps stakeholders, and builds the foundation for requirements and architecture work.

## Overview

Discovery is the most leveraged activity in any engagement. Poor discovery produces beautiful solutions to the wrong problem. This skill produces a Discovery Document that becomes the single source of truth for all downstream work.

## Discovery Process

### Phase 1: Problem Framing

Define the problem with precision:
- **Problem statement**: "We have observed [symptom] which causes [impact] for [who]."
- **Root cause hypothesis**: What is believed to be driving the problem?
- **Opportunity framing**: If solved, what becomes possible?
- **Urgency**: What happens if nothing changes in 6 months?

### Phase 2: Stakeholder Mapping

Produce a stakeholder map table:

| Name/Role | Interest | Influence | Communication | Interview Priority |
|---|---|---|---|---|
| [Executive sponsor] | [what they care about] | High | Monthly steering | Essential |
| [End user] | [daily pain points] | Low | User testing | Essential |
| [IT/Engineering] | [technical constraints] | Medium | Working sessions | Important |

Interview priority: Essential / Important / Inform-only

### Phase 3: Interview Plan

For each Essential/Important stakeholder, produce a tailored interview guide:
- 3-4 opening questions (context-setting, not leading)
- 4-6 discovery questions (open-ended, problem-focused)
- 2-3 future-state questions (what would good look like?)
- 1 closing question (who else should I speak with?)

### Phase 4: Assumption Register

| # | Assumption | Category | Confidence | Impact if Wrong | Owner | Validation Method |
|---|---|---|---|---|---|---|
| 1 | [assumption] | Technical/Business/User | High/Med/Low | High/Med/Low | [name] | [how to validate] |

Categories: Technical, Business, User, Commercial, Regulatory

### Phase 5: Success Metrics

Define how success will be measured:
- **Leading indicators**: metrics visible during delivery (velocity, adoption, defect rate)
- **Lagging indicators**: business outcomes visible post-launch (revenue, cost, NPS, churn)
- **Measurement method**: how each metric will be captured
- **Baseline**: current value (or "not yet measured")
- **Target**: desired value and timeline

### Discovery Document Structure

```markdown
# Discovery Document: [Initiative Name]
Date: [YYYY-MM-DD] | Status: Draft

## Problem Statement
[Precise problem framing]

## Stakeholder Map
[Table]

## Key Discovery Findings
[Themes emerging from interviews/research]

## Assumption Register
[Table]

## Success Metrics
[Table]

## Open Questions
[Questions that remain unanswered after discovery]

## Recommended Next Steps
[What to do with these findings]
```

## When Discovery is Desk-Based

If stakeholder interviews are not possible (solo session, internal initiative):
1. Simulate discovery by generating the questions that should be asked
2. Provide reasonable assumptions based on the domain
3. Flag all assumptions clearly with "UNVALIDATED" marker
4. Recommend a real discovery activity as a risk-reduction action

## Additional Resources

- **`references/interview-question-library.md`** — Domain-specific question banks
- **`assets/discovery-document-template.md`** — Full blank template
