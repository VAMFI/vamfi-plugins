# VAMFI Software Consultancy Plugin

**Cognizant-grade consulting + SDLC pipeline for Claude Cowork**

A complete end-to-end software consultancy plugin that covers the full engagement lifecycle — from lead qualification and discovery through architecture, delivery, testing, release, and continuous improvement. Install it once; bring enterprise-quality consulting methodology to every project.

---

## Overview

This plugin brings 8 pipeline stages, 10 specialist agents, 25 skills, 9 commands, and a full artifact template library into your Cowork workspace. It is research-backed (2026 patterns from GitHub Spec Kit, Claude Code's multi-agent review, Cognizant's Neuro® AI Framework) and built for the agent-first era.

---

## Installation

### Local (Cowork / Claude Code)

```bash
# Copy to your project's plugin directory
cp -r /path/to/vamfi-software-consultancy .claude-plugins/

# Or test directly with plugin-dir flag
cc --plugin-dir /path/to/vamfi-software-consultancy
```

### Per-Project Settings (Optional)

Create `.claude/vamfi.local.md` in your project:

```yaml
---
company: VAMFI Software
client: ""                    # optional — client name for artifacts
vertical: ""                  # fintech | healthcare | retail | saas | public-sector
engagement_type: greenfield   # greenfield | modernisation | augmentation | advisory
tech_stack: ""                # e.g. "TypeScript, Node.js, PostgreSQL, AWS"
maturity_tier: assisted       # assisted | driven | autonomous
---
```

---

## Pipeline Stages

| Stage | Command | Lead Agent | Key Artifacts |
|---|---|---|---|
| 1. Lead Qualification | `/vamfi-software-consultancy:qualify` | Engagement Manager | Opportunity Brief |
| 2. Discovery & Requirements | `/vamfi-software-consultancy:discover` | Business Analyst | Discovery Doc + PRD |
| 3. Solution Architecture | `/vamfi-software-consultancy:architect` | Solution Architect | HLD + ADRs + Security Review |
| 4. Delivery Planning | `/vamfi-software-consultancy:plan` | Tech Lead | Delivery Plan + Backlog |
| 5. Implementation | `/vamfi-software-consultancy:implement` | Tech Lead | Implementation Plan + Code Review |
| 6. Testing & Quality | `/vamfi-software-consultancy:test` | QA Lead | Test Strategy + Test Cases |
| 7. Release & DevOps | `/vamfi-software-consultancy:release` | DevOps/SRE Lead | Deployment Plan + Runbook |
| 8. Run & Improvement | `/vamfi-software-consultancy:run` | Client Success Manager | Health Check + Improvement Backlog |

Run all 8 stages end-to-end:
```
/vamfi-software-consultancy:full-pipeline
```

---

## Agents

| Agent | Role | Colour |
|---|---|---|
| `engagement-manager` | Lead qualification, proposals, RFP responses | Yellow |
| `business-analyst` | Discovery, PRD, process mapping | Blue |
| `solution-architect` | HLD, technology decisions, ADRs | Cyan |
| `domain-architect` | DDD, bounded contexts, domain modelling | Blue |
| `tech-lead` | Delivery planning, story shaping, implementation | Green |
| `qa-lead` | Test strategy, test cases, quality gates | Yellow |
| `devops-sre-lead` | Deployment, CI/CD, runbooks, SRE | Green |
| `security-compliance-lead` | Threat modelling, controls, compliance (shift-left) | Red |
| `client-success-manager` | Retrospectives, health checks, improvement | Magenta |
| `pipeline-orchestrator` | Full pipeline coordination, engagement state | Magenta |

**Example invocations:**

```
Engagement Manager: qualify this inbound request email and suggest a proposal outline.

Run Discovery on this new product idea and produce a PRD.

Solution Architect: design target architecture for this repo + requirements in claude.md.

Tech Lead: generate a delivery plan and break into epics/stories with estimates.

QA Lead: create a test strategy and initial test cases for this feature set.

DevOps Lead: propose a deployment plan and runbook for this service.
```

---

## Skills (25)

### Lead & Discovery
- `spec-driven-planning` — Universal entry point: converts any brief into structured spec + tasks
- `qualify-opportunity` — Opportunity assessment with scoring and risk analysis
- `run-discovery` — Discovery facilitation, stakeholder mapping, assumption register
- `write-proposal-rfp-response` — Win-themed proposals and RFP responses

### Requirements & Analysis
- `draft-prd` — Product Requirements Document with goals, personas, NFRs, action ledger
- `process-mapping` — AS-IS / TO-BE process maps with RACI and pain-point heatmap

### Architecture & Design
- `current-state-assessment` — Architecture analysis, technical debt register, gap analysis
- `target-architecture-design` — HLD with C4 diagrams, tech stack decisions, ADRs
- `integration-design` — API contracts, event catalogue, contract testing strategy
- `nfr-and-capacity-analysis` — SLAs, SLOs, capacity model
- `security-architecture-review` — STRIDE threat model, OWASP controls, compliance mapping

### Delivery & Implementation
- `delivery-plan-and-roadmap` — Phased roadmap with critical path and risk register
- `backlog-and-story-shaping` — Epics, stories, acceptance criteria, estimates
- `implementation-plan` — Branching strategy, coding patterns, step-by-step checklist
- `code-change-implementation` — Hands-on implementation with TDD and commit discipline
- `code-review-and-refactor` — Multi-dimensional code review (logic, security, performance, style)

### Testing & Quality
- `test-strategy-and-plan` — Risk-based test strategy with quality gates
- `test-case-generation` — AI-generated edge cases, boundary conditions, security tests
- `regression-plan` — Regression scope, flaky test identification, automation ROI

### Release, DevOps & Run
- `deployment-plan` — Rollout strategy, go/no-go criteria, rollback procedures
- `runbook-and-operability-review` — Operational runbook, SLO alerts, on-call playbook
- `cost-and-performance-optimization` — FinOps analysis, query optimisation, right-sizing
- `incident-postmortem` — Blameless RCA, timeline, action tracker

### Cross-Cutting
- `artifact-template-library` — Ready-to-use templates for all 16+ artifact types
- `engagement-health-check` — RAG health dashboard, retrospectives, improvement backlog

---

## Artifact Templates

Ready-to-use templates in `skills/artifact-template-library/assets/`:

- `prd-template.md` · `hld-template.md` · `adr-template.md`
- `proposal-template.md` · `discovery-document-template.md`
- `test-strategy-template.md` · `deployment-plan-template.md`
- `runbook-template.md` · `postmortem-template.md`
- `engagement-registry-template.md`

Completed artifacts are saved to `docs/vamfi/` with the naming convention:
`YYYY-MM-DD-[artifact-type]-[description].md`

---

## Hooks

| Hook | Event | Purpose |
|---|---|---|
| Context Loader | `SessionStart` | Scans for existing VAMFI artifacts and CLAUDE.md context; briefs you on the engagement state |
| Artifact Saver | `Stop` | Offers to save produced artifacts to `docs/vamfi/` with the registry updated |

---

## Author

**VAMFI Software** — hello@vamfi.com — vamfi.com
