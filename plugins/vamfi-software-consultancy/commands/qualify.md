---
name: qualify
description: Run lead qualification for an inbound opportunity. Analyses the request, assesses strategic fit, budget reality, timeline, risks, and produces an opportunity brief with a recommended proposal outline.
argument-hint: "[paste inbound request, email, or brief description of the opportunity]"
allowed-tools: ["Read", "Write", "Glob"]
---

# VAMFI Qualify Command

Run the `qualify-opportunity` skill to assess this inbound engagement request.

## Process

1. Read any context provided as arguments or pasted in the conversation.
2. Activate the `qualify-opportunity` skill.
3. Produce a structured Opportunity Brief covering:
   - Strategic fit score (1-5) with rationale
   - Budget reality check (is the ask realistic for the scope?)
   - Timeline assessment (achievable vs. optimistic vs. unrealistic)
   - Top 3 risks and mitigating questions to ask
   - Recommended next step (proceed / needs more info / decline)
   - Proposed proposal outline if proceeding
4. Offer to save the Opportunity Brief to `docs/vamfi/` if the user confirms.
5. Suggest running `/vamfi-software-consultancy:discover` as the next stage.

## Tips

- Paste the raw inbound email or Slack message — the skill handles unstructured input.
- If no input is provided, the Engagement Manager agent will ask clarifying questions.
- Use `/vamfi-software-consultancy:full-pipeline` to run all stages at once.
