---
name: Test Strategy and Plan
description: This skill should be used when the user asks to "create a test strategy", "define the testing approach", "plan our test levels", "set quality gates", "define test coverage targets", "create a test plan for this feature", or needs to define how an initiative will be tested end-to-end.
version: 1.0.0
---

# Test Strategy and Plan

Define a comprehensive testing approach that starts at requirements and covers every level of the test pyramid. Produce quality gates and tooling recommendations grounded in the system's risk profile.

## Overview

A test strategy is not a list of tools — it is a risk-based decision about how much testing is enough and where to invest. This skill produces a strategy that the team can own and execute, not a document that collects dust.

## Test Strategy Components

### 1. Risk-Based Test Scope

Identify the highest-risk areas requiring the heaviest testing:

| Area | Risk Level | Reason | Test Investment |
|---|---|---|---|
| [Payment processing] | Critical | Financial data, compliance | High: unit + integration + E2E + security |
| [User authentication] | High | Security boundary | High: unit + integration + security |
| [Reporting export] | Medium | Data accuracy | Medium: unit + integration |
| [Static content pages] | Low | No logic | Low: smoke test only |

### 2. Test Pyramid

Define the target test distribution:

```
        /\
       /E2E\         (10-20%): critical user journeys
      /------\
     / Integ. \      (30-40%): service integrations, API contracts
    /----------\
   / Unit Tests \    (50-60%): functions, business logic, edge cases
  /--------------\
```

Rationale for the chosen distribution (adjust based on system type):
- API-heavy systems: heavier integration layer
- UI-heavy systems: more E2E coverage
- Event-driven systems: add contract and consumer tests

### 3. Tooling Selection

| Test Level | Tool | Reason |
|---|---|---|
| Unit | [Jest/pytest/JUnit] | [rationale] |
| Integration | [Supertest/pytest-httpx] | [rationale] |
| Contract | [Pact] | Consumer-driven contract tests |
| E2E | [Playwright/Cypress] | [rationale] |
| Performance | [k6/Locust] | [rationale] |
| Security | [OWASP ZAP/Burp] | [rationale] |
| Accessibility | [axe-core/Pa11y] | [rationale] |

### 4. Quality Gates

Define pass/fail thresholds per pipeline stage:

| Stage | Gate | Threshold | Action on Fail |
|---|---|---|---|
| Pre-merge | Unit tests | 100% pass | Block PR |
| Pre-merge | Coverage | > 80% on new code | Block PR |
| Pre-merge | Linting | 0 errors | Block PR |
| Pre-deploy (staging) | Integration tests | 100% pass | Block deploy |
| Pre-deploy (staging) | E2E (smoke) | 100% pass | Block deploy |
| Pre-deploy (production) | E2E (full suite) | 100% pass | Block deploy |
| Pre-deploy (production) | Performance baseline | p95 < [target]ms | Block deploy |

### 5. Shift-Left Test Activities

Embed testing earlier in the SDLC:
- **At requirements**: write acceptance criteria as Given/When/Then (BDD scenarios)
- **At architecture**: identify testability requirements (dependency injection, seams)
- **At implementation**: TDD for business logic, contract tests for integrations
- **At CI**: all tests run on every commit, not just pre-merge

### 6. Test Data Strategy

Define how test data is created and managed:
- **Unit tests**: inline test data and factories
- **Integration tests**: dedicated test database, seeded via fixtures
- **E2E tests**: synthetic test accounts, never production data
- **Performance tests**: anonymised production clone or generated realistic dataset

## Test Plan Structure

For a specific feature or sprint, produce a test plan:

```markdown
# Test Plan: [Feature Name]
Sprint: [N] | Author: VAMFI QA Lead

## Scope
In scope: [features covered]
Out of scope: [features not covered by this plan]

## Test Cases Summary
| Level | Count | Automated | Manual |
|---|---|---|---|
| Unit | [N] | [N] | 0 |
| Integration | [N] | [N] | 0 |
| E2E | [N] | [N] | [N] |

## Quality Gate Checklist
[ ] All unit tests passing
[ ] Coverage target met
[ ] Integration suite passing
[ ] E2E smoke suite passing
[ ] No P0 or P1 defects open
```

## Additional Resources

- **`references/test-level-patterns.md`** — Detailed patterns per test level
- **`assets/test-strategy-template.md`** — Blank test strategy template
