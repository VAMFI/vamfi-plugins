---
name: Regression Plan
description: This skill should be used when the user asks to "create a regression plan", "plan regression testing", "identify regression risks", "plan test automation", "assess flaky tests", "determine regression scope for this release", or needs to protect against regressions during a release or refactoring exercise.
version: 1.0.0
---

# Regression Plan

Define the scope, priority, and automation approach for regression testing. Identify flaky tests and calculate automation ROI to ensure regression testing is sustainable and effective.

## Overview

Regression testing answers: "Does the new change break anything that was working before?" A regression plan prevents over-testing (running everything every time) and under-testing (missing critical paths).

## Regression Planning Process

### Step 1: Define Regression Scope

For each release or change, determine which test suites must run:

| Trigger | Regression Scope | Rationale |
|---|---|---|
| Any PR merge | Unit + lint | Fast feedback, catches most errors |
| Staging deploy | Unit + integration + E2E smoke | Validates environment |
| Production release | Full suite + performance baseline | Maximum safety |
| Database schema change | Data migration tests + full integration | Schema regressions are high risk |
| Authentication change | Security tests + full E2E | Auth breakage is critical |
| Third-party update | Integration tests for that provider | Contract validation |

### Step 2: Risk-Based Prioritisation

Score each test suite by risk:

| Test Suite | Business Impact | Change Frequency | Automation | Priority |
|---|---|---|---|---|
| [Payment flow E2E] | Critical | Low | 100% | P0 — always run |
| [User registration] | High | Medium | 90% | P0 — always run |
| [Report generation] | Medium | Low | 70% | P1 — run on staging |
| [Admin settings] | Low | Low | 50% | P2 — run on release |

### Step 3: Flaky Test Identification

Identify flaky tests (tests that pass and fail without code changes):

| Test ID | Failure Rate | Root Cause Category | Recommendation |
|---|---|---|---|
| [TC-042] | 15% | Timing/async issue | Fix or quarantine |
| [TC-103] | 30% | Test data collision | Isolate test data |
| [TC-201] | 8% | External service dependency | Mock the service |

Root cause categories:
- **Timing**: test relies on async operations without proper awaiting
- **Test data**: shared test data mutated by concurrent tests
- **External dependency**: real API/service called, subject to availability
- **Order dependency**: test relies on side effects from another test
- **Environment**: test behaves differently across environments

### Step 4: Automation ROI Assessment

For each manual regression area, calculate automation ROI:

```
Manual effort per release: [time] hours × [£/hr] = [£cost]
Automation build cost: [time] hours × [£/hr] = [£build cost]
Maintenance per release: [time] hours × [£/hr] = [£maintenance]

Annual saving: (manual cost - maintenance) × releases/year
Payback period: build cost / annual saving
ROI: (annual saving - build cost) / build cost × 100%
```

Recommend automation where:
- Payback period < 6 months, OR
- Risk is Critical/High and manual effort is > 30 minutes

### Step 5: Regression Execution Plan

| Phase | Suite | Owner | Duration | Pass Criteria |
|---|---|---|---|---|
| PR gate | Unit + lint | CI/CD | < 5 min | 100% pass |
| Staging | Integration + smoke | CI/CD | < 15 min | 100% pass |
| Release | Full suite | QA Lead | < 45 min | 100% pass, no P0 open |

## Additional Resources

- **`references/flaky-test-remediation.md`** — Patterns for fixing flaky tests by root cause
