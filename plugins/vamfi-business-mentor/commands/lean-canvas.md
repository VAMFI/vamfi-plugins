---
name: lean-canvas
description: Generate a Lean Canvas — a one-page business model for startups. Walks through all 9 blocks with probing questions and produces a complete, structured canvas.
argument-hint: "[business idea or product description]"
allowed-tools: ["Read", "Glob", "Grep", "WebSearch", "WebFetch"]
---

Guide the user through creating a Lean Canvas (Ash Maurya's adaptation of Business Model Canvas for startups).

## Process

1. **Understand the business**: If the user provides a description, use it. If in a project directory, read relevant files. If neither, ask: "Describe your business idea in 1-2 sentences."

2. **Fill the canvas**: Work through each block in this order (optimized for learning flow):
   1. **Problem** (Top 3 problems your customers have)
   2. **Customer Segments** (Who has these problems? Who pays?)
   3. **Unique Value Proposition** (Single, clear compelling message — why you're different AND worth paying attention to)
   4. **Solution** (Top 3 features that address the top 3 problems)
   5. **Channels** (How you reach customers)
   6. **Revenue Streams** (How you make money, pricing model)
   7. **Cost Structure** (Fixed and variable costs)
   8. **Key Metrics** (The 1-3 numbers that tell you if it's working)
   9. **Unfair Advantage** (What can't be easily copied or bought — be honest, most startups don't have one yet)

3. **Output format**:

```
╔══════════════════════════════════════════════════════════════╗
║                       LEAN CANVAS                           ║
║  [Business Name] — [Date]                                   ║
╠══════════════╦══════════════╦══════════════╦════════════════╣
║ PROBLEM      ║ SOLUTION     ║ UNIQUE VALUE ║ UNFAIR         ║
║              ║              ║ PROPOSITION  ║ ADVANTAGE      ║
║ 1.           ║ 1.           ║              ║                ║
║ 2.           ║ 2.           ║ [One clear   ║ [What can't    ║
║ 3.           ║ 3.           ║  message]    ║  be copied]    ║
║              ║              ║              ║                ║
║ Existing     ║              ║              ║                ║
║ alternatives:║              ║              ║                ║
║              ║              ║              ║                ║
╠══════════════╬══════════════╬══════════════╬════════════════╣
║ KEY METRICS  ║ CHANNELS     ║ CUSTOMER     ║ EARLY          ║
║              ║              ║ SEGMENTS     ║ ADOPTERS       ║
║ 1.           ║ 1.           ║              ║                ║
║ 2.           ║ 2.           ║ [Who pays?]  ║ [First users]  ║
║ 3.           ║ 3.           ║              ║                ║
╠══════════════╩══════════════╩══════════════╩════════════════╣
║ COST STRUCTURE                 ║ REVENUE STREAMS              ║
║                                ║                              ║
║ Fixed:                         ║ Model:                       ║
║ Variable:                      ║ Pricing:                     ║
║                                ║ LTV:                         ║
╚════════════════════════════════╩══════════════════════════════╝
```

4. **Challenge each block**: After presenting the canvas, identify:
   - The **riskiest assumption** in the canvas
   - The **first experiment** to run to test that assumption
   - **What to change first** if the experiment fails

## Coaching Notes
- UVP is the hardest block — help the user craft a specific, measurable promise
- "Unfair Advantage" is often blank for early startups — that's OK, be honest
- Push for specificity in Customer Segments — "everyone" is not a segment
- Key Metrics should be leading indicators, not vanity metrics
