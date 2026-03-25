---
name: Backlog and Story Shaping
description: This skill should be used when the user asks to "shape stories", "create a backlog", "break this epic into stories", "write user stories with acceptance criteria", "define the product backlog", "estimate stories", or needs to convert a PRD or delivery plan into an executable sprint backlog.
version: 1.0.0
---

# Backlog and Story Shaping

Convert PRD requirements and delivery plan phases into well-shaped, independently deployable user stories with acceptance criteria and estimates. Apply the Definition of Ready so stories enter the sprint ready to execute.

## Overview

Well-shaped stories are the unit of delivery. A poorly shaped story is the root cause of missed sprint goals, rework, and scope creep. This skill produces stories that are ready to implement without further clarification.

## Story Shaping Process

### Step 1: Epic Structure

Organise stories into epics aligned to delivery phases and user outcomes:

```markdown
# Epic [N]: [Epic Title]
Objective: [The business or user outcome this epic achieves]
Phase: [Which delivery phase this epic belongs to]
Priority: Must Have / Should Have / Could Have

## Stories
- [STORY-N]: [Title]
- [STORY-N+1]: [Title]
```

### Step 2: Story Format

For each story:

```markdown
# STORY-[N]: [Short, descriptive title]

**Epic**: [Parent epic]
**Priority**: Must Have / Should Have / Could Have
**Estimate**: XS (< 0.5d) | S (0.5-1d) | M (1-2d) | L (2-3d) | XL (> 3d)

## User Story
As a [persona], I want [capability] so that [outcome].

## Acceptance Criteria
- [ ] Given [context], when [action], then [result]
- [ ] Given [invalid context], when [action], then [error handling]
- [ ] Given [edge case], when [action], then [expected behaviour]

## Technical Notes
[Key implementation hints — which components, APIs, or data this story touches]

## Dependencies
[Stories or external items that must complete before this story can start]

## Definition of Ready Checklist
- [ ] User story is clear and understood by the team
- [ ] Acceptance criteria are testable and agreed
- [ ] Dependencies are identified and resolved or scheduled
- [ ] Estimate is agreed
- [ ] Technical approach is understood (no unknowns requiring a spike)
```

### Step 3: Sizing Calibration

Use reference stories to calibrate estimates:
- **XS**: Change a label, add a log statement, update a config value
- **S**: Add a single new API field, fix a known bug with clear cause
- **M**: New CRUD endpoint with validation, simple UI screen with API integration
- **L**: Complex business logic, multi-step process, significant refactoring
- **XL**: New service, major feature — should be broken down further

### Step 4: Backlog Ordering

Order the backlog by:
1. Dependencies (unblocking stories first)
2. Risk reduction (spike stories and architectural decisions early)
3. Business value (highest value features before lower-value enhancements)
4. Learning (stories that validate assumptions before building on them)

### Step 5: Sprint Planning View

For the first sprint, produce a sprint plan:

| Story | Estimate | Assignee (role) | Acceptance Test |
|---|---|---|---|
| STORY-1 | S | Backend Engineer | API returns 200 with correct schema |
| STORY-2 | M | Full-stack | Form submits and data persists |

## Definition of Done

Stories are Done when:
- [ ] Code reviewed and approved
- [ ] Acceptance criteria all passing
- [ ] Unit and integration tests written and passing
- [ ] No new linting or type errors introduced
- [ ] Feature available in staging environment
- [ ] Documentation updated (API docs, README, ADR if applicable)

## Additional Resources

- **`references/story-splitting-patterns.md`** — How to split large stories safely
- **`assets/backlog-template.md`** — Blank backlog template with epic and story structure
