---
name: Incident Postmortem
description: This skill should be used when the user asks to "run a postmortem", "write an incident report", "document this outage", "conduct a blameless retrospective for this incident", "analyse the root cause", or needs to learn from a production incident.
version: 1.0.0
---

# Incident Postmortem

Facilitate a blameless postmortem that finds the real root cause, not just the proximate cause. Produce an incident report with a timeline, root cause analysis, and an action tracker that prevents recurrence.

## Overview

Postmortems are learning opportunities, not blame exercises. This skill produces a structured report that improves the system and the team's ability to respond to future incidents. The goal is to understand how the incident happened and prevent the same class of problem from recurring.

## Blameless Principles

Apply these principles throughout:
- Focus on the system and process, not individual fault
- Ask "why did the system allow this?" not "who caused this?"
- Assume everyone acted with the best information available at the time
- Distinguish between the proximate cause (what happened last) and the root causes (why the system was in a state where this could happen)

## Postmortem Process

### Step 1: Build the Incident Timeline

Reconstruct a precise timeline of events. Use log timestamps where available:

| Time (UTC) | Event | Source |
|---|---|---|
| HH:MM | [Alert fired / First symptom observed] | [PagerDuty / Monitoring] |
| HH:MM | [Engineer paged, began investigation] | [Slack] |
| HH:MM | [Root cause identified] | [Engineer log] |
| HH:MM | [Mitigation applied] | [Deployment log] |
| HH:MM | [Service restored to normal] | [Monitoring] |

Key metrics:
- **Time to detect** (TTD): alert fired minus incident started
- **Time to acknowledge** (TTA): on-call paged minus alert fired
- **Time to resolve** (TTR): service restored minus incident started

### Step 2: Root Cause Analysis (5 Whys)

Start from the symptom and ask "why" five times:

```
Symptom: [What users experienced]

Why 1: [Immediate cause]
Why 2: [Cause of Why 1]
Why 3: [Cause of Why 2]
Why 4: [Cause of Why 3]
Why 5: [Root cause — typically a systemic or process failure]
```

Identify contributing factors (conditions that made the incident worse):
- [Factor 1: e.g., "No alerting for this error type"]
- [Factor 2: e.g., "Runbook out of date"]

### Step 3: Impact Assessment

| Dimension | Impact |
|---|---|
| Duration | [minutes/hours] |
| Affected users | [% or count] |
| Affected services | [list] |
| Data loss | [Yes/No — quantify if yes] |
| SLO impact | [remaining error budget consumed] |
| Customer communications | [Yes/No — if yes, what was communicated] |

### Step 4: Action Items

| # | Action | Type | Owner | Due Date | Priority |
|---|---|---|---|---|---|
| 1 | [Prevent recurrence action] | Prevention | [role] | [YYYY-MM-DD] | P0 |
| 2 | [Improve detection action] | Detection | [role] | [YYYY-MM-DD] | P1 |
| 3 | [Improve response action] | Response | [role] | [YYYY-MM-DD] | P1 |

Action types: Prevention / Detection / Response / Process

Track action items to completion — unresolved postmortem actions are a leading indicator of repeat incidents.

## Postmortem Report

```markdown
# Incident Postmortem: [Incident Title]
Date: [YYYY-MM-DD] | Severity: P0/P1/P2 | Author: [role]

## Summary
[2-3 sentences: what happened, who was affected, how long]

## Timeline
[Table]

## Root Cause Analysis
[5 Whys + contributing factors]

## Impact
[Table]

## What Went Well
[Things that helped contain or resolve the incident faster]

## What Could Be Improved
[Things that made the incident worse or harder to resolve]

## Action Items
[Table — all with owners and due dates]
```

## Additional Resources

- **`assets/postmortem-template.md`** — Blank postmortem template
- **`references/incident-severity-matrix.md`** — Severity classification criteria
