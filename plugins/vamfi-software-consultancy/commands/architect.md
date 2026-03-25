---
name: architect
description: Design the solution architecture for an initiative. Produces current-state assessment, target HLD, integration design, NFR analysis, security review, and Architecture Decision Records.
argument-hint: "[repo path, PRD, or description of the system to architect]"
allowed-tools: ["Read", "Write", "Grep", "Glob", "Bash"]
---

# VAMFI Architect Command

Run the architecture skills to produce a complete solution design package.

## Process

1. Activate `current-state-assessment` skill — read the codebase or description to document the existing architecture, technical debt register, and capability gaps.
2. Activate `target-architecture-design` skill — design the future-state High-Level Design (HLD) with:
   - Component diagram and data flow
   - Technology choices with rationale
   - Architecture Decision Records (ADRs) for each key decision
   - Migration path from current to target state
3. Activate `integration-design` skill — produce:
   - API contracts and event catalogue
   - Integration patterns (sync/async, event-driven, etc.)
   - Contract testing strategy
4. Activate `nfr-and-capacity-analysis` skill — define SLAs, SLOs, scalability targets.
5. Activate `security-architecture-review` skill — produce threat model and controls checklist.
6. Offer to save the architecture package to `docs/vamfi/`.
7. Suggest running `/vamfi-software-consultancy:plan` next.

## Tips

- Point to the repo root or specific directories for current-state analysis.
- The Solution Architect and Security & Compliance Lead agents collaborate automatically on this command.
