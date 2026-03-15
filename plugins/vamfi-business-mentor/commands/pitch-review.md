---
name: pitch-review
description: Review and improve a pitch deck, elevator pitch, or investor presentation. Provides investor-perspective feedback with specific improvement suggestions.
argument-hint: "[path to pitch deck or paste your pitch]"
allowed-tools: ["Read", "Glob", "Grep", "WebSearch", "WebFetch"]
---

Review the user's pitch materials from an investor's perspective. Provide constructive, specific feedback that strengthens their fundraising or sales pitch.

## Process

1. **Find the pitch**: Check if the user provided a file path, pasted text, or has pitch-related files in the project (look for files named pitch, deck, investor, presentation). If nothing found, ask: "Share your pitch — paste it here, point me to a file, or describe your business and I'll help you build one."

2. **Evaluate against the 10 investor questions**: Every pitch must clearly answer:
   1. What problem are you solving? (Is it real, urgent, and painful?)
   2. For whom? (Specific customer segment, not "everyone")
   3. How do you solve it? (Clear, differentiated solution)
   4. Why now? (Market timing, technology shift, regulatory change)
   5. How big is the market? (Bottom-up TAM, not "it's a $50B market")
   6. How do you make money? (Clear business model with unit economics)
   7. What traction do you have? (Metrics, customers, revenue, growth)
   8. Who is on the team? (Why THIS team for THIS problem?)
   9. What's the competitive landscape? (Honest positioning, not "no competition")
   10. What are you asking for? (Amount, use of funds, milestones)

3. **Score each area** (1-5):
   - 5 = Compelling, investor-ready
   - 4 = Good, minor improvements needed
   - 3 = Adequate but won't stand out
   - 2 = Needs significant work
   - 1 = Missing or fundamentally flawed

4. **Provide specific feedback**:
   - For each area scoring below 4, provide a specific rewrite or improvement
   - Highlight the strongest part of the pitch (lead with it)
   - Identify the single biggest weakness to fix first
   - Suggest a compelling opening hook (first 30 seconds matter most)

5. **Red flags**: Call out investor red flags:
   - "No competition" (investors hear: you haven't done research)
   - Top-down market sizing only (investors want bottom-up)
   - No clear business model or revenue path
   - Team slide with no relevant domain expertise
   - Hockey-stick projections with no basis
   - Asking for too much or too little relative to stage

6. **Deliverable**: End with:
   - Overall pitch score (X/50)
   - Top 3 strengths to emphasize
   - Top 3 improvements to make
   - Suggested 30-second elevator pitch version
