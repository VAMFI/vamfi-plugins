---
name: discover
description: Run a full discovery session for a new product, feature, or transformation initiative. Produces a Discovery Document, stakeholder map, assumption register, and first-draft PRD.
argument-hint: "[idea, initiative name, or existing requirements to expand]"
allowed-tools: ["Read", "Write", "Glob"]
---

# VAMFI Discover Command

Run the `run-discovery` and `draft-prd` skills to convert an initiative idea into a structured Discovery Document and PRD.

## Process

1. Activate the `run-discovery` skill.
2. Produce a Discovery Document containing:
   - Problem statement and opportunity
   - Stakeholder map (roles, interests, influence)
   - Interview plan and question sets
   - Assumption register with confidence ratings
   - Success metrics and KPIs
3. Activate the `draft-prd` skill to produce:
   - Goals and non-goals
   - User personas and journeys
   - Functional requirements with acceptance criteria
   - Non-functional requirements (performance, security, compliance)
   - Constraints and dependencies
   - Action ledger (what was decided and why)
4. Offer to save both documents to `docs/vamfi/`.
5. Suggest running `/vamfi-software-consultancy:architect` next.

## Tips

- Provide any existing requirements, PRFAQs, or strategy docs as input.
- For complex initiatives, the Business Analyst agent can facilitate a structured discovery session.
