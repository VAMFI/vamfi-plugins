---
name: Draft PRD
description: This skill should be used when the user asks to "write a PRD", "draft product requirements", "create a requirements document", "define features and NFRs", "write user stories for a product", or needs to produce a structured Product Requirements Document from discovery findings or a product brief.
version: 1.0.0
---

# Draft PRD

Produce a precise, structured Product Requirements Document (PRD) that defines what to build, for whom, and how success will be measured. Every requirement must be testable; every assumption must be explicit.

## Overview

A PRD is the contract between business and delivery. It defines the scope of what will be built and what will not. This skill produces a PRD that is specific enough to drive architecture and story shaping, while remaining a business document that non-technical stakeholders can validate.

## PRD Creation Process

### Step 1: Establish Goals and Non-Goals

Goals must be outcome-oriented, not output-oriented:
- Bad: "Build a notification system"
- Good: "Reduce user drop-off at payment step by 30% by ensuring users receive timely payment reminders"

Non-goals are equally important — state at least 3 things that are deliberately excluded.

### Step 2: Define User Personas

For each primary persona:
- **Name and role**: who they are
- **Job-to-be-done**: the outcome they're trying to achieve
- **Current pain**: what makes today's experience frustrating
- **Success looks like**: how they'll know the new experience works

### Step 3: Write Functional Requirements

Format each requirement as:
```
REQ-[N]: [Short title]
As a [persona], I want [capability] so that [outcome].
Acceptance criteria:
- Given [context], when [action], then [result]
Priority: Must Have / Should Have / Could Have / Won't Have (MoSCoW)
```

### Step 4: Define Non-Functional Requirements

| Category | Requirement | Metric | Target | Priority |
|---|---|---|---|---|
| Performance | Page load time | p95 response time | < 2s | Must Have |
| Availability | Service uptime | Monthly uptime | 99.9% | Must Have |
| Security | Authentication | MFA support | Required for admin | Must Have |
| Scalability | Concurrent users | Peak load | 10,000 | Should Have |
| Accessibility | WCAG compliance | WCAG level | 2.1 AA | Must Have |

### Step 5: Document Constraints and Dependencies

Constraints: technical, regulatory, timeline, or budget facts that bound the solution space.
Dependencies: other systems, teams, or external parties that must deliver something for this to work.

### Step 6: Action Ledger

Track every significant decision made during PRD authoring:

| Decision | Options Considered | Rationale | Date | Owner |
|---|---|---|---|---|
| [decision] | [option A vs B] | [why this choice] | [date] | [who decided] |

## PRD Structure

```markdown
# Product Requirements Document: [Product/Feature Name]
Version: 1.0 | Date: [YYYY-MM-DD] | Status: Draft

## Goals
[Outcome-oriented goals]

## Non-Goals
[Explicit exclusions]

## User Personas
[Persona cards]

## User Journey
[Key flows — happy path and exception paths]

## Functional Requirements
[REQ-N format requirements]

## Non-Functional Requirements
[Table]

## Constraints
[Technical, regulatory, timeline, budget]

## Dependencies
[External systems, teams, services]

## Open Questions
[Unresolved items that must be decided before build]

## Action Ledger
[Decision log table]

## Out of Scope
[Explicit out-of-scope items to prevent scope creep]
```

## Additional Resources

- **`references/requirement-quality-checklist.md`** — Checklist for testable, unambiguous requirements
- **`assets/prd-template.md`** — Full blank PRD template
