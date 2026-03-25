---
name: full-pipeline
description: Run the complete VAMFI 8-stage consulting pipeline end-to-end. Each stage produces artifacts and waits for human approval before proceeding. Use for new engagement kickoffs or full initiative reviews.
argument-hint: "[opportunity description, initiative brief, or repo path]"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "Bash"]
---

# VAMFI Full Pipeline Command

Orchestrate the complete 8-stage consultancy pipeline with human approval checkpoints between each stage.

## Pipeline Stages

Execute these stages in sequence, pausing for user confirmation after each:

### Stage 1 — Lead Qualification
Run `qualify-opportunity` skill. Present Opportunity Brief. **Checkpoint: Proceed?**

### Stage 2 — Discovery & Requirements
Run `run-discovery` + `draft-prd` skills. Present Discovery Doc + PRD. **Checkpoint: Approve PRD?**

### Stage 3 — Solution Architecture
Run `current-state-assessment` + `target-architecture-design` + `integration-design` + `nfr-and-capacity-analysis` + `security-architecture-review` skills. Present architecture package. **Checkpoint: Approve architecture?**

### Stage 4 — Delivery Planning
Run `spec-driven-planning` + `delivery-plan-and-roadmap` + `backlog-and-story-shaping` skills. Present plan + backlog. **Checkpoint: Approve plan?**

### Stage 5 — Implementation
Run `implementation-plan` skill. Confirm before running `code-change-implementation`. Run `code-review-and-refactor`. **Checkpoint: Accept implementation?**

### Stage 6 — Testing & Quality
Run `test-strategy-and-plan` + `test-case-generation` + `regression-plan` skills. Present test package. **Checkpoint: Approve test strategy?**

### Stage 7 — Release & DevOps
Run `deployment-plan` + `runbook-and-operability-review` skills. Present release package. **Checkpoint: Approve release plan?**

### Stage 8 — Run & Continuous Improvement
Run `engagement-health-check` skill. Present improvement backlog. **Checkpoint: Engagement complete.**

## Artifact Handling

After all stages, offer to save the complete artifact set to `docs/vamfi/` and update `docs/vamfi/REGISTRY.md`.

## Tips

- This command is best for greenfield engagements or major initiative reviews.
- For individual stages, use the dedicated stage commands (`:qualify`, `:discover`, etc.).
- The Pipeline Orchestrator agent manages handoffs and ensures context carries forward between stages.
