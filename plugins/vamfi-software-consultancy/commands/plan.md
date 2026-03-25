---
name: plan
description: Generate a delivery plan, phased roadmap, and shaped backlog with epics and stories. Uses the spec-driven-planning skill to break the initiative into measurable, agent-executable tasks.
argument-hint: "[PRD, HLD, or initiative description to plan]"
allowed-tools: ["Read", "Write", "Glob"]
---

# VAMFI Plan Command

Run delivery planning skills to produce a complete plan package.

## Process

1. Activate `spec-driven-planning` skill — convert requirements into a structured spec with acceptance criteria, task breakdown, and dependency map.
2. Activate `delivery-plan-and-roadmap` skill — produce:
   - Phased roadmap with milestones and gates
   - Critical path analysis
   - Resource and skill requirements
   - Risk register with mitigations
3. Activate `backlog-and-story-shaping` skill — produce:
   - Epic breakdown aligned to roadmap phases
   - User stories with acceptance criteria
   - Story point estimates (T-shirt sizing)
   - Definition of Ready and Definition of Done
4. Offer to save the plan package to `docs/vamfi/`.
5. Suggest running `/vamfi-software-consultancy:implement` next.

## Tips

- Input the PRD and HLD from previous stages for the most accurate plan.
- The Tech Lead agent can refine estimates based on the codebase complexity.
