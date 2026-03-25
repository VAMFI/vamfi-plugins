# Test Strategy: [INITIATIVE/PRODUCT NAME]
Version: 1.0 | Date: [YYYY-MM-DD]
Author: VAMFI QA Lead | Status: Draft

---

## Overview

[2-3 sentences on the initiative being tested and the key quality goals.]

**In scope**: [What is covered by this strategy]
**Out of scope**: [What is NOT covered]

---

## Risk-Based Test Scope

| Area | Risk Level | Reason | Test Investment |
|---|---|---|---|
| [FEATURE/AREA 1] | Critical | [reason] | Heavy: unit + integration + E2E + security |
| [FEATURE/AREA 2] | High | [reason] | High: unit + integration + E2E |
| [FEATURE/AREA 3] | Medium | [reason] | Medium: unit + integration |
| [FEATURE/AREA 4] | Low | [reason] | Low: smoke test only |

---

## Test Pyramid

Target distribution for this initiative:

| Level | Coverage Target | Rationale |
|---|---|---|
| Unit | [60%] of test effort | [reason for this ratio] |
| Integration | [30%] of test effort | [reason] |
| E2E | [10%] of test effort | [reason] |

---

## Tooling

| Test Level | Tool | Version | Rationale |
|---|---|---|---|
| Unit | [Jest / pytest / JUnit] | [VERSION] | [WHY] |
| Integration | [Supertest / httpx] | [VERSION] | [WHY] |
| Contract | [Pact] | [VERSION] | Consumer-driven contracts |
| E2E | [Playwright / Cypress] | [VERSION] | [WHY] |
| Performance | [k6 / Locust] | [VERSION] | [WHY] |
| Security | [OWASP ZAP] | [VERSION] | [WHY] |
| Accessibility | [axe-core / Pa11y] | [VERSION] | [WHY] |

---

## Quality Gates

| Stage | Gate | Threshold | Action on Fail |
|---|---|---|---|
| Pre-merge | Unit tests | 100% pass | Block PR |
| Pre-merge | Code coverage | > [80]% on new code | Block PR |
| Pre-merge | Linting | 0 errors | Block PR |
| Pre-deploy staging | Integration tests | 100% pass | Block deploy |
| Pre-deploy staging | E2E smoke | 100% pass | Block deploy |
| Pre-deploy production | Full E2E suite | 100% pass | Block deploy |
| Pre-deploy production | Performance | p95 < [Xms] | Block deploy |

---

## Shift-Left Test Activities

| Stage | Activity | Owner | Timing |
|---|---|---|---|
| Requirements | Write AC as Given/When/Then (BDD) | Business Analyst | Before sprint |
| Architecture | Identify testability requirements | Solution Architect | During HLD |
| Implementation | TDD for business logic | Developer | During coding |
| Implementation | Contract tests for integrations | Developer | During coding |
| CI | All tests on every commit | CI/CD pipeline | Automated |

---

## Test Data Strategy

| Environment | Data Source | Sensitive Data Handling |
|---|---|---|
| Unit | Inline factories | No PII |
| Integration | Seeded test DB, reset per suite | Synthetic data only |
| E2E | Synthetic test accounts | No production data |
| Performance | Anonymised prod clone or generated | No PII |

---

## Test Environment Requirements

| Environment | Purpose | Owner | Availability |
|---|---|---|---|
| Local | Developer testing | Developer | Always |
| CI | Automated test runs | CI/CD | On every commit |
| Staging | Pre-production validation | DevOps | 24/7 |
| Performance | Load testing | QA Lead | On demand |
