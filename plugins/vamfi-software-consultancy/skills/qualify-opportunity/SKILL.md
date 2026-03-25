---
name: Qualify Opportunity
description: This skill should be used when the user asks to "qualify this opportunity", "assess this inbound request", "evaluate this client brief", "score this RFP", "check if we should pursue this", "write an opportunity brief", or needs to determine whether to pursue a sales or consulting engagement.
version: 1.0.0
---

# Qualify Opportunity

Assess inbound opportunities with the discipline of a senior engagement manager. Produce a structured Opportunity Brief that enables a fast, evidence-based go/no-go decision.

## Overview

Qualification prevents VAMFI from spending proposal effort on opportunities that are unlikely to close or deliver — and from declining opportunities that appear rough but are genuinely strong fits. Apply this skill to any inbound request, RFP, or client conversation that may become an engagement.

## Qualification Dimensions

Score each dimension 1–5 (1 = poor fit, 5 = excellent fit):

### 1. Strategic Fit
- Does this engagement leverage VAMFI's core capabilities?
- Does it open or deepen a target industry vertical?
- Would reference-ability from this client be valuable?

### 2. Commercial Fit
- Is the indicated or implied budget realistic for the stated scope?
- What is the estimated engagement value (£/$ range)?
- Is the commercial model (T&M, fixed-price, outcome-based) workable?

### 3. Timeline Fit
- Is the requested timeline achievable with quality?
- Is there flexibility, or is the date fixed by an external event?
- What would need to be true for us to meet this timeline?

### 4. Delivery Risk
- How clearly are requirements defined? (Undefined = high risk)
- Are there known technical constraints or legacy debt?
- How mature is the client's internal team and decision-making?

### 5. Relationship Fit
- Is there an existing relationship or warm introduction?
- Who is the sponsor and do they have budget authority?
- Are there competitive threats or incumbents to displace?

## Opportunity Brief Structure

Produce a document with:

```markdown
# Opportunity Brief: [Client / Initiative Name]
Date: [YYYY-MM-DD]

## Summary
[2-3 sentences: what is being asked and by whom]

## Qualification Scores
| Dimension | Score (1-5) | Evidence |
|---|---|---|
| Strategic Fit | [N] | [reason] |
| Commercial Fit | [N] | [reason] |
| Timeline Fit | [N] | [reason] |
| Delivery Risk | [N] | [reason] |
| Relationship Fit | [N] | [reason] |
| **Overall** | **[avg]** | |

## Budget Assessment
Indicated budget: [£/$ or "not stated"]
Estimated scope cost: [£/$ range]
Assessment: [Aligned / Under-budgeted by ~X% / Significantly under-budgeted]

## Top 3 Risks
1. [Risk] — Mitigation question: [question to ask client]
2. [Risk] — Mitigation question: [question to ask client]
3. [Risk] — Mitigation question: [question to ask client]

## Recommendation
[PROCEED / PROCEED WITH CONDITIONS / NEEDS MORE INFORMATION / DECLINE]
Rationale: [2-3 sentences]

## Proposed Proposal Outline (if proceeding)
1. Executive Summary
2. [Section 2 tailored to this opportunity]
3. [Section 3 ...]
```

## Handling Incomplete Briefs

When input is vague or minimal:
1. Produce the best assessment possible with available information
2. List the 5 most important missing pieces of information
3. Recommend discovery questions to ask before investing in a proposal
4. Mark scores as "Assumed" where evidence is not available

## Additional Resources

- **`references/qualification-criteria.md`** — Detailed scoring rubric for each dimension
- **`assets/opportunity-brief-template.md`** — Blank template ready to fill
