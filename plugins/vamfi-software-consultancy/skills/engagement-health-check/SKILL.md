---
name: Engagement Health Check
description: This skill should be used when the user asks to "run a health check", "assess the engagement", "how healthy is this project", "retrospective", "check delivery health", "review team performance", "assess client satisfaction", or needs a structured assessment of an ongoing consulting engagement.
version: 1.0.0
---

# Engagement Health Check

Assess the health of an ongoing consulting engagement across five dimensions. Produce a RAG status report, improvement backlog, and retrospective output that feeds the next cycle of delivery.

## Overview

Regular health checks prevent engagements from quietly failing. Applied every sprint or month, this skill surfaces problems while they are still correctable and reinforces what is working.

## Health Assessment Dimensions

Score each dimension: Green (on track), Amber (at risk, needs action), Red (failing, needs immediate intervention).

### 1. Delivery Health
Questions to assess:
- Is velocity stable or improving?
- Is the team meeting sprint goals?
- Are blockers being resolved within 24 hours?
- Is the scope stable, or is there uncontrolled scope creep?
- Is the critical path being protected?

Evidence to gather: Sprint completion rates, velocity chart, blocker log, scope change log.

### 2. Quality Health
Questions to assess:
- Is the defect rate increasing or decreasing sprint-on-sprint?
- Is test coverage growing with the codebase?
- Is technical debt being managed (not ignored)?
- Are production incidents decreasing?

Evidence to gather: Defect counts by sprint, coverage %  trend, debt register changes, incident count.

### 3. Team Health
Questions to assess:
- Is the team engaged and motivated?
- Are skills being developed (not just tasks being executed)?
- Is knowledge being shared (bus factor reducing)?
- Is the team understaffed, overloaded, or well-balanced?

Evidence to gather: Team sentiment (1-10 quick survey), knowledge sharing activities, PR review distribution.

### 4. Relationship Health
Questions to assess:
- Is the client sponsor engaged and satisfied?
- Is communication happening at the right cadence?
- Are there unresolved concerns or tensions?
- Is the client receiving visible value each sprint?

Evidence to gather: Stakeholder meeting notes, decision log, any escalations or complaints.

### 5. Commercial Health
Questions to assess:
- Is budget burn on track with delivery progress?
- Is the remaining budget sufficient to complete the agreed scope?
- Are there change requests that need commercialising?
- Are there signals of renewal or expansion?

Evidence to gather: Budget tracker, forecast to complete, change request log.

## Health Report Format

```markdown
# Engagement Health Report: [Engagement Name]
Date: [YYYY-MM-DD] | Reporting Period: [Sprint/Month]

## Health Dashboard
| Dimension | Status | Trend | Key Finding |
|---|---|---|---|
| Delivery | 🟢/🟡/🔴 | ↑/→/↓ | [key finding] |
| Quality | 🟢/🟡/🔴 | ↑/→/↓ | [key finding] |
| Team | 🟢/🟡/🔴 | ↑/→/↓ | [key finding] |
| Relationship | 🟢/🟡/🔴 | ↑/→/↓ | [key finding] |
| Commercial | 🟢/🟡/🔴 | ↑/→/↓ | [key finding] |
| **Overall** | 🟢/🟡/🔴 | | |

## Key Findings
[3-5 bullet points on the most important findings]

## Improvement Actions
| Action | Dimension | Owner | Due | Expected Outcome |
|---|---|---|---|---|
| [action] | [dimension] | [role] | [date] | [outcome] |
```

## Retrospective Facilitation (4Ls)

Run a 4L retrospective to collect team input:

**Liked**: What worked well this sprint/period?
**Learned**: What did we discover (good or bad)?
**Lacked**: What was missing that would have helped?
**Longed for**: What would we ideally have had?

For each item in Lacked and Longed for: produce an action item with an owner.

## Additional Resources

- **`references/engagement-maturity-model.md`** — Maturity progression from AI-Assisted to AI-Autonomous
- **`assets/health-check-template.md`** — Blank health check template
