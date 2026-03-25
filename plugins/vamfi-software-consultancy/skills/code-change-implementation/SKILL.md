---
name: Code Change Implementation
description: This skill should be used when the user asks to "implement this feature", "write the code for this story", "execute this implementation plan", "make this code change", "add this functionality", or needs hands-on code implementation following a VAMFI implementation plan.
version: 1.0.0
---

# Code Change Implementation

Execute code changes following the VAMFI implementation plan. Read before writing, follow existing patterns, write tests alongside code, and produce clean commits with clear messages.

## Overview

Code implementation is the execution phase of the VAMFI pipeline. This skill executes changes with discipline: understand first, plan the change, implement, test, review. Never write code without first understanding the context.

## Pre-Implementation Checklist

Before writing any code:
- [ ] Read the implementation plan (or produce one if absent using the `implementation-plan` skill)
- [ ] Read the relevant source files (Glob to find, Read to understand)
- [ ] Identify the patterns used in the existing codebase
- [ ] Confirm the test file locations and testing conventions
- [ ] Confirm there is no existing implementation of this feature

## Implementation Process

### Step 1: Read and Understand

Use Glob and Grep to locate relevant files:
- Find the entry point (route, controller, handler)
- Find the business logic layer (service, use case, domain)
- Find the data layer (repository, model, schema)
- Find existing tests to understand test conventions

### Step 2: Plan the Change

Before editing any file, produce a brief change plan:
- Which files will be modified (in order)
- What will be added, changed, or deleted in each
- What tests will be written

### Step 3: Implement

Follow this order:
1. **Write tests first** (TDD) where the story has clear acceptance criteria
2. **Implement the data layer** (schema changes, repository methods)
3. **Implement the business logic layer** (service, use case, domain)
4. **Implement the presentation layer** (controller, handler, API endpoint)
5. **Add integration tests** for the full flow

### Step 4: Code Quality Standards

Apply these standards to every change:
- Functions do one thing (single responsibility)
- Variable and function names describe intent, not implementation
- Error handling is explicit (no swallowed exceptions)
- No hardcoded values (use constants or config)
- No commented-out code
- New public APIs are documented

### Step 5: Commit Discipline

Write commit messages in the format:
```
[type]([scope]): [short description]

[optional body: why this change was made]

Refs: STORY-[N]
```

Types: feat, fix, refactor, test, docs, chore, perf

Example:
```
feat(payments): add Stripe webhook handler for payment confirmation

Implements the payment.succeeded event handler which updates order
status and triggers fulfilment. Webhook signature verification
prevents replay attacks.

Refs: STORY-42
```

## Post-Implementation Checklist

- [ ] All acceptance criteria from the story are satisfied
- [ ] Unit tests written and passing
- [ ] Integration tests written and passing
- [ ] No new linting errors or type errors
- [ ] Commit messages follow the convention
- [ ] Implementation plan checklist items marked complete

## Handoff to Review

After implementation, invoke the `code-review-and-refactor` skill to:
- Run multi-agent review across logic, security, and style dimensions
- Produce a review summary with action items before raising a PR

## Additional Resources

- **`references/code-quality-standards.md`** — Language-agnostic quality standards
