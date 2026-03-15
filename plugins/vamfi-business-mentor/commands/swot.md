---
name: swot
description: Run a SWOT analysis (Strengths, Weaknesses, Opportunities, Threats) for a business, product, or strategic decision. Produces a structured, actionable analysis.
argument-hint: "[business/product name or description]"
allowed-tools: ["Read", "Glob", "Grep", "WebSearch", "WebFetch"]
---

Conduct a thorough SWOT analysis for the user's business, product, or strategic decision.

## Process

1. **Gather context**: If in a project directory, read business-relevant files for context. If the user provides a description, use that. If neither, ask: "What business, product, or decision would you like me to analyze?"

2. **Research if needed**: Use WebSearch to find relevant market data, competitor information, and industry trends that inform the analysis.

3. **Build the SWOT matrix**: Create a comprehensive analysis:

### Output Format

Present as a clean matrix:

```
┌─────────────────────────────┬─────────────────────────────┐
│ STRENGTHS (Internal +)      │ WEAKNESSES (Internal -)     │
│                             │                             │
│ • [specific strength]       │ • [specific weakness]       │
│ • [specific strength]       │ • [specific weakness]       │
│ • [specific strength]       │ • [specific weakness]       │
├─────────────────────────────┼─────────────────────────────┤
│ OPPORTUNITIES (External +)  │ THREATS (External -)        │
│                             │                             │
│ • [specific opportunity]    │ • [specific threat]         │
│ • [specific opportunity]    │ • [specific threat]         │
│ • [specific opportunity]    │ • [specific threat]         │
└─────────────────────────────┴─────────────────────────────┘
```

4. **Strategic implications**: After the matrix, provide:
   - **SO strategies** (use Strengths to capture Opportunities)
   - **WO strategies** (address Weaknesses to capture Opportunities)
   - **ST strategies** (use Strengths to mitigate Threats)
   - **WT strategies** (address Weaknesses to avoid Threats)

5. **Priority actions**: List the top 3 actions to take based on the analysis, ordered by impact.

## Quality Standards
- Each quadrant should have 3-5 specific, evidence-based items
- Avoid generic entries like "strong team" — be specific about WHY
- Threats and opportunities should reference real market forces
- Strategic implications should be actionable, not theoretical
