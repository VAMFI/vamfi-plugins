---
name: Code Review and Refactor
description: This skill should be used when the user asks to "review this code", "review the PR", "check code quality", "refactor this module", "improve this code", "run a code review", or needs systematic review of recently written or changed code before it merges.
version: 1.0.0
---

# Code Review and Refactor

Perform comprehensive code review across logic, security, style, and maintainability dimensions. Orchestrate multi-agent review for thorough, independent analysis. Produce a structured review report with actionable findings.

## Overview

Code review is the quality gate before code merges. This skill orchestrates a multi-dimensional review inspired by Claude Code's native multi-agent review approach: different review dimensions are applied independently to reduce shared blind spots.

## Review Dimensions

Apply each dimension as an independent review pass:

### Dimension 1: Logic and Correctness
- Does the code do what the story/requirement says it should?
- Are edge cases handled (null, empty, boundary values)?
- Are errors handled and propagated correctly?
- Are there any off-by-one errors, race conditions, or state management issues?
- Is business logic in the right layer?

### Dimension 2: Security
- SQL injection, XSS, IDOR, path traversal vulnerabilities?
- Authentication and authorisation checks in place?
- Secrets or credentials hardcoded?
- Input validation at the system boundary?
- Sensitive data logged or exposed?

### Dimension 3: Performance
- Unnecessary database queries in loops (N+1 problem)?
- Missing indexes on queried columns?
- Unbounded queries (no limit clause)?
- Memory leaks (unclosed resources, growing caches)?
- Synchronous operations that should be async?

### Dimension 4: Maintainability and Style
- Functions and classes adhere to single responsibility?
- Code readable without comments (do names describe intent)?
- Duplication that should be extracted to a shared function?
- Dead code or commented-out code?
- Consistent with existing codebase conventions?

### Dimension 5: Test Coverage
- Are new functions and branches covered by tests?
- Are edge cases tested, not just the happy path?
- Are tests meaningful (not just coverage for coverage's sake)?
- Integration tests for new API endpoints or event handlers?

## Review Report Format

```markdown
# Code Review: [Feature/PR Name]
Date: [YYYY-MM-DD]

## Summary
[2-3 sentence overall assessment]

## Critical Issues (must fix before merge)
| # | Location | Issue | Suggested Fix |
|---|---|---|---|
| 1 | [file:line] | [description] | [recommendation] |

## Important Issues (should fix)
| # | Location | Issue | Suggested Fix |
|---|---|---|---|

## Suggestions (nice to have)
| # | Location | Suggestion | Rationale |
|---|---|---|---|

## Positive Observations
- [What was done well]

## Review Verdict
APPROVED | APPROVED WITH COMMENTS | CHANGES REQUIRED
```

## Refactoring Guidance

When refactoring is recommended:
1. Define the specific improvement goal (not "make it better")
2. Confirm existing tests cover the code being refactored
3. Refactor in small steps — one structural change at a time
4. Run tests after each step
5. Do not change behaviour during refactoring (separate commit)

Common refactoring patterns:
- Extract Method: repeated code → named function
- Introduce Parameter Object: long parameter list → typed object
- Replace Conditional with Polymorphism: type-checking switch statements
- Move Logic to Domain: business logic leaked into controllers

## Additional Resources

- **`references/review-checklist.md`** — Comprehensive per-language review checklist
