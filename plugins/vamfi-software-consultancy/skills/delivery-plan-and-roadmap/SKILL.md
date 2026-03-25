---
name: Delivery Plan and Roadmap
description: This skill should be used when the user asks to "create a delivery plan", "build a roadmap", "plan the phases", "define milestones", "map the critical path", "estimate the timeline", or needs a structured phased plan for delivering an initiative.
version: 1.0.0
---

# Delivery Plan and Roadmap

Produce a realistic, phased delivery plan with milestones, dependencies, and a critical path analysis. Ground estimates in scope and team capacity, not wishful thinking.

## Overview

A delivery plan is not a Gantt chart — it is a set of commitments backed by explicit assumptions about scope, team, and risk. This skill produces a plan that delivery teams can execute and sponsors can track.

## Delivery Planning Process

### Step 1: Define Phases and Objectives

Structure the delivery into phases where each phase delivers standalone business value:

| Phase | Name | Objective | Duration | Entry Criteria | Exit Criteria |
|---|---|---|---|---|---|
| 0 | Foundations | Enable delivery | 2 weeks | Kick-off complete | Environments ready |
| 1 | MVP | Core capability live | 6 weeks | Phase 0 exit criteria met | P0 features in production |
| 2 | Enhancement | Full feature set | 8 weeks | Phase 1 exit criteria met | All MoSCoW Must Haves live |

### Step 2: Define Milestones and Gates

For each phase, define:
- **Milestone**: a specific, verifiable event (not "nearly done")
- **Gate criteria**: the binary conditions that must be met to pass the gate
- **Gate owner**: who makes the go/no-go decision

### Step 3: Identify Dependencies

Map dependencies between work streams:
- **Internal**: between teams or squads in this engagement
- **External**: third-party APIs, platform team deliverables, client sign-offs
- **Regulatory**: compliance approvals, penetration tests, audits

Dependency table:

| Dependency | Type | Provider | Required by | Risk if Late |
|---|---|---|---|---|
| [item] | Internal/External/Regulatory | [who] | [date/milestone] | [impact] |

### Step 4: Critical Path Analysis

Identify the longest chain of dependent tasks — this is the critical path. Delays on the critical path delay the project; delays off the critical path may have float.

Produce a simple critical path diagram:
```
Phase 0 (2w) → Phase 1 API (3w) → Phase 1 Frontend (3w) → Phase 1 Go-Live
                                  ↗ (Phase 1 API must complete first)
         Phase 1 Data Migration (4w) — CRITICAL PATH
```

### Step 5: Risk Register

| Risk | Likelihood | Impact | Risk Score | Mitigation | Owner |
|---|---|---|---|---|---|
| [risk] | H/M/L | H/M/L | H/M/L | [action] | [name] |

Flag critical path risks specifically — these are the ones that will delay the whole programme.

### Step 6: Resource Plan

| Role | Phase 1 | Phase 2 | Phase 3 |
|---|---|---|---|
| Tech Lead | 1 FTE | 1 FTE | 0.5 FTE |
| Engineers | 2 FTE | 3 FTE | 2 FTE |
| QA | 0.5 FTE | 1 FTE | 1 FTE |

## Roadmap Output Format

Produce:
1. Phase table with objectives, duration, and gate criteria
2. Milestone timeline (text-based: `Week 1: X | Week 3: Y | Week 6: Z`)
3. Dependency table
4. Critical path diagram
5. Risk register
6. Resource plan

## Additional Resources

- **`references/estimation-techniques.md`** — T-shirt sizing, story points, and reference class forecasting
- **`assets/delivery-plan-template.md`** — Blank delivery plan template
