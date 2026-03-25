---
name: Spec-Driven Planning
description: This skill should be used when the user asks to "create a spec", "break this into tasks", "spec out this feature", "write a spec for this story", "convert requirements to tasks", "plan this initiative", or needs to turn any natural language requirement into a structured, agent-executable task breakdown following the 2026 Spec Kit pattern.
version: 1.0.0
---

# Spec-Driven Planning

Convert any natural language requirement into a structured specification that drives the entire downstream delivery pipeline. Based on the 2026 Spec Kit pattern used by GitHub and leading engineering organisations.

## Overview

Spec-driven planning is the universal entry point for any VAMFI engagement work. It transforms vague briefs, PRD sections, or user stories into structured specs with acceptance criteria, measurable task breakdowns, and dependency maps. This makes work agent-executable and leaves nothing to interpretation.

## When to Apply This Skill

Apply spec-driven planning before any implementation, story shaping, or delivery planning work. It is especially valuable when:
- Requirements are ambiguous or incomplete
- Multiple agents need to work on the same initiative
- Estimates are needed but the scope is unclear
- A large feature needs breaking into independently deliverable tasks

## Spec Creation Process

### Step 1: Parse the Input

Extract from the provided requirement:
- **Goal**: The business or user outcome this spec aims to achieve
- **Scope**: What is explicitly included and excluded
- **Constraints**: Technology, timeline, regulatory, or architectural constraints
- **Acceptance criteria**: How success will be measured (binary pass/fail statements)

If any of these are missing, state the assumption or ask the one most important question.

### Step 2: Write the Structured Spec

Produce a spec document with this structure:

```markdown
# Spec: [Title]

## Goal
[One paragraph: what outcome does this achieve and for whom?]

## Scope
**In scope:**
- [item 1]
- [item 2]

**Out of scope:**
- [item 1]
- [item 2]

## Acceptance Criteria
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [edge case], then [expected handling]

## Constraints
- [Technical, regulatory, performance, or timeline constraints]

## Assumptions
| Assumption | Confidence | Owner | Validation |
|---|---|---|---|
| [assumption] | High/Med/Low | [name] | [how to validate] |

## Open Questions
- [Question that must be answered before implementation begins]
```

### Step 3: Task Breakdown

Break the spec into numbered, measurable, independently executable tasks:

```markdown
## Task Breakdown

1. [Task title] — [1-2 sentence description of exactly what to do]
   - Input: [what this task requires]
   - Output: [what this task produces]
   - Estimate: [XS/S/M]

2. [Next task]
   - Input: [...]
   - Output: [...]
   - Estimate: [...]
```

Rules for task breakdown:
- Each task must be completable in isolation
- Each task must have a clear, verifiable output
- No task should be larger than M (1-2 days)
- Prefer 5-15 tasks; break further if needed

### Step 4: Dependency Map

Identify which tasks must complete before others can start:

```
Task 1 → Task 3
Task 2 → Task 4
Task 1, Task 2 → Task 5
```

Flag the critical path: the longest chain of dependent tasks.

### Step 5: Agent Assignment (Optional)

If the work spans multiple VAMFI agents, suggest which agent handles which task:
- Architecture tasks → solution-architect
- Security tasks → security-compliance-lead
- Test tasks → qa-lead
- Implementation tasks → tech-lead
- Deploy tasks → devops-sre-lead

## Output Format

Produce the complete spec document as formatted markdown, followed by the task breakdown table, dependency map, and optional agent assignment. Offer to save to `docs/vamfi/spec-[feature-name].md`.

## Additional Resources

- **`references/spec-examples.md`** — Complete worked examples of well-formed specs
- **`references/task-breakdown-patterns.md`** — Patterns for breaking down different types of work
