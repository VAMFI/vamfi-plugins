---
name: Implementation Plan
description: This skill should be used when the user asks to "create an implementation plan", "define the branching strategy", "specify coding patterns", "plan how to implement this feature", "set coding guardrails", or needs a detailed technical plan before writing code.
version: 1.0.0
---

# Implementation Plan

Produce a detailed technical implementation plan that specifies the branching strategy, coding patterns, guardrails, and step-by-step checklist before any code is written. Prevent rework by planning before implementing.

## Overview

An implementation plan bridges the gap between a shaped story and working code. It ensures the developer (human or agent) understands the what, why, and how before starting, reducing back-and-forth and rework.

## Implementation Planning Process

### Step 1: Scope and Impact Analysis

Read the relevant codebase (Grep and Glob) to:
- Identify which files and modules will be touched
- Find existing patterns to follow (or deliberately break with)
- Identify integration points and their current contracts
- Flag any existing technical debt that this change might interact with

Produce an impact map:

| Component | Change Type | Risk | Notes |
|---|---|---|---|
| [file/module] | Add/Modify/Delete | Low/Med/High | [what changes and why] |

### Step 2: Branching Strategy

Select and document the branching approach:

**Trunk-based development** (preferred for high-frequency delivery):
- Short-lived feature branches (< 2 days), merged to main via PR
- Feature flags for work-in-progress that needs to be merged but not released

**Gitflow** (for release-cadence-based teams):
- Feature branches from `develop`
- Release branches from `develop` to `main`
- Hotfix branches from `main`

**Feature flags** (when applicable):
- Flag name convention: `[team]-[feature]-[date]`
- Flag lifecycle: define the removal date at creation
- Default: off in production, on in staging

### Step 3: Coding Patterns and Guardrails

Define the patterns to follow for this implementation:
- **Architectural pattern**: which layer handles what (controller → service → repository)
- **Error handling**: how errors propagate and are logged
- **Data validation**: where validation happens (boundary, not deep in business logic)
- **Testing approach**: test first (TDD) or test alongside
- **Naming conventions**: follow existing conventions discovered in Step 1

Anti-patterns to avoid:
- [ ] Do not add business logic to controllers/routes
- [ ] Do not bypass the data access layer for direct DB queries
- [ ] Do not introduce new dependencies without documenting the ADR
- [ ] Do not merge without tests for the new behaviour

### Step 4: Step-by-Step Implementation Checklist

Produce a numbered checklist that an engineer (or agent) can follow:

```markdown
## Implementation Checklist: [Feature Name]

### Setup
- [ ] 1. Create branch `feature/[story-id]-[short-description]` from `main`
- [ ] 2. Confirm local environment matches staging config

### Implementation
- [ ] 3. [First implementation step — specific file and change]
- [ ] 4. [Second implementation step]
- [ ] 5. Write unit tests for [specific component]
- [ ] 6. Write integration test for [specific flow]

### Validation
- [ ] 7. Run test suite: all tests pass
- [ ] 8. Run linter: no new errors
- [ ] 9. Manual smoke test: [specific user flow to test]
- [ ] 10. Check performance: [specific metric to validate]

### Merge
- [ ] 11. Create PR with reference to STORY-[N]
- [ ] 12. Request review from [role]
- [ ] 13. Address review comments
- [ ] 14. Squash and merge on approval
```

## Additional Resources

- **`references/branching-strategies.md`** — Detailed branching pattern guidance
- **`references/coding-guardrails.md`** — Language and framework-specific guardrails
