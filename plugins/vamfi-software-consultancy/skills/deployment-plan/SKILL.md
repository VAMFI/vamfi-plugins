---
name: Deployment Plan
description: This skill should be used when the user asks to "create a deployment plan", "plan the release", "design the rollout strategy", "define rollback procedures", "plan the go-live", "create a release checklist", or needs to plan how a feature or service will be deployed to production.
version: 1.0.0
---

# Deployment Plan

Produce a detailed deployment plan with rollout strategy, go/no-go criteria, rollback procedures, and a release checklist. Treat every production deployment as a risk management exercise.

## Overview

A deployment plan is not an afterthought — it is the bridge between working code and a production service. This skill produces a plan that is executable by any engineer on the team, not only the person who wrote the code.

## Deployment Strategy Selection

Select the appropriate strategy based on risk and system characteristics:

| Strategy | When to Use | Rollback Speed | Risk |
|---|---|---|---|
| **Rolling update** | Stateless services, low risk | Fast (redeploy) | Low |
| **Blue-Green** | Zero-downtime required, fast rollback needed | Instant (switch) | Low |
| **Canary** | High-traffic, gradual risk validation needed | Fast (redirect traffic) | Very Low |
| **Feature flags** | Business-controlled release, A/B testing | Instant (toggle) | Very Low |
| **Big bang** | Schema migrations, monolith, unavoidable downtime | Slow (manual rollback) | High |

For database schema changes: always use backwards-compatible migrations (expand/contract pattern).

## Deployment Plan Structure

```markdown
# Deployment Plan: [Service/Feature Name]
Release Date: [YYYY-MM-DD] | Release Manager: [Role]

## Deployment Strategy
[Selected strategy and rationale]

## Pre-Deployment Checklist
- [ ] All acceptance criteria passing in staging
- [ ] Performance baseline validated in staging
- [ ] Security gate PASSED
- [ ] Database migrations tested and reversible
- [ ] Runbook reviewed by on-call engineer
- [ ] Rollback procedure tested in staging
- [ ] Monitoring dashboards prepared
- [ ] On-call engineer briefed and available
- [ ] Change record raised (if required)

## Deployment Steps
| Step | Action | Owner | Duration | Validation |
|---|---|---|---|---|
| 1 | [Run DB migration] | DevOps | 5 min | [verify row count] |
| 2 | [Deploy new container version] | DevOps | 3 min | [health check passes] |
| 3 | [Smoke test critical paths] | QA | 10 min | [checklist passes] |
| 4 | [Enable feature flag for 10% of traffic] | Product | 1 min | [error rate stable] |
| 5 | [Monitor for 30 minutes] | On-call | 30 min | [SLOs met] |
| 6 | [Enable for 100% of traffic] | Product | 1 min | [error rate stable] |

## Go/No-Go Criteria
**Go**: All pre-deployment checklist items checked AND error rate < [threshold] in first 10 minutes
**No-Go**: Any pre-deployment checklist item not met OR error rate > [threshold] at any point

## Rollback Procedure
| Trigger | Action | Owner | Duration |
|---|---|---|---|
| Error rate > [X]% | Disable feature flag / revert traffic | On-call | < 2 min |
| Service unavailable | Redeploy previous image | DevOps | < 5 min |
| Data corruption | Roll back DB migration | DBA | [estimate] |

## Post-Deployment Checklist
- [ ] SLOs met for 1 hour post-deployment
- [ ] No P0 or P1 incidents raised
- [ ] Deployment notes updated in runbook
- [ ] Feature flag removal task created (with date)
- [ ] Stakeholders notified of successful release
```

## Additional Resources

- **`references/migration-patterns.md`** — Backwards-compatible database migration patterns
- **`assets/deployment-plan-template.md`** — Blank deployment plan template
