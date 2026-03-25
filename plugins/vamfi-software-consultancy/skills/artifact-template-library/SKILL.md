---
name: Artifact Template Library
description: This skill should be used when the user asks to "use the VAMFI templates", "get the proposal template", "find the PRD template", "use the HLD template", "load the runbook template", "access artifact templates", or needs a blank template for any VAMFI consultancy document.
version: 1.0.0
---

# Artifact Template Library

Access the complete library of VAMFI consultancy artifact templates. Each template is ready to use and follows VAMFI's standard structure for the relevant pipeline stage.

## Available Templates

All templates are in `assets/`. Load the relevant template and populate it:

### Lead & Discovery Stage
- **`assets/opportunity-brief-template.md`** — Opportunity qualification brief
- **`assets/discovery-document-template.md`** — Full discovery document with stakeholder map and assumption register
- **`assets/proposal-template.md`** — Client proposal with executive summary and commercial section
- **`assets/rfp-compliance-matrix.md`** — RFP requirements compliance matrix

### Requirements & Analysis Stage
- **`assets/prd-template.md`** — Product Requirements Document with all standard sections
- **`assets/process-map-template.md`** — AS-IS / TO-BE process map

### Architecture & Design Stage
- **`assets/hld-template.md`** — High-Level Design document with C4 diagram structure
- **`assets/lld-template.md`** — Low-Level Design document for critical components
- **`assets/adr-template.md`** — Architecture Decision Record

### Delivery & Implementation Stage
- **`assets/delivery-plan-template.md`** — Phased delivery plan with milestones and risk register
- **`assets/backlog-template.md`** — Epic and story backlog with Definition of Ready

### Testing & Quality Stage
- **`assets/test-strategy-template.md`** — Full test strategy with quality gates
- **`assets/test-plan-template.md`** — Sprint-level test plan

### Release, DevOps & Run Stage
- **`assets/deployment-plan-template.md`** — Deployment plan with go/no-go checklist
- **`assets/runbook-template.md`** — Operational runbook with incident response playbook
- **`assets/postmortem-template.md`** — Blameless postmortem with 5 Whys and action tracker

### Cross-Cutting
- **`assets/health-check-template.md`** — Engagement health dashboard
- **`assets/security-review-template.md`** — Security architecture review and controls checklist
- **`assets/engagement-registry-template.md`** — Pipeline stage tracker for docs/vamfi/REGISTRY.md

## How to Use Templates

1. Identify the template needed from the list above
2. Read the template file: `${CLAUDE_PLUGIN_ROOT}/skills/artifact-template-library/assets/[template-name].md`
3. Populate all `[PLACEHOLDER]` fields with the engagement-specific content
4. Save the completed artifact to `docs/vamfi/[date]-[artifact-name].md` in the project

## Template Naming Convention

When saving completed artifacts:
- Format: `docs/vamfi/YYYY-MM-DD-[artifact-type]-[brief-description].md`
- Examples:
  - `docs/vamfi/2026-03-25-prd-checkout-flow.md`
  - `docs/vamfi/2026-03-25-hld-payment-service.md`
  - `docs/vamfi/2026-03-25-postmortem-db-outage.md`
