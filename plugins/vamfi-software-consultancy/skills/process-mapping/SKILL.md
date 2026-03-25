---
name: Process Mapping
description: This skill should be used when the user asks to "map this process", "create an AS-IS process map", "design the TO-BE process", "build a RACI matrix", "identify process bottlenecks", "document a business process", or needs to analyse and improve an existing workflow.
version: 1.0.0
---

# Process Mapping

Document current and future business processes with precision. Identify bottlenecks, handoff failures, and improvement opportunities using structured AS-IS / TO-BE analysis.

## Overview

Process mapping reveals the gap between how a process is supposed to work and how it actually works. Apply this skill before designing any system that automates or supports an existing business process.

## AS-IS Process Mapping

### Step 1: Identify Process Boundaries

Define:
- **Process name**: concise, verb-noun (e.g., "Customer Onboarding", "Invoice Approval")
- **Trigger**: what starts this process
- **End state**: what condition marks the process complete
- **Scope**: what is included and excluded from this mapping

### Step 2: Capture Process Steps

For each step, capture:
- **Step ID**: sequential (1, 2, 3...)
- **Step name**: verb-noun (e.g., "Validate Customer Identity")
- **Actor**: who performs this step (role, not person)
- **System**: what system or tool is used (if any)
- **Input**: what does this step receive
- **Output**: what does this step produce
- **Decision points**: if/else branches with conditions
- **Pain points**: what makes this step slow, error-prone, or frustrating

### Step 3: RACI Matrix

Map responsibilities across roles:

| Step | Role A | Role B | Role C | System/Tool |
|---|---|---|---|---|
| [Step 1] | R | A | I | [System] |
| [Step 2] | I | R | A | [System] |

R = Responsible, A = Accountable, C = Consulted, I = Informed

### Step 4: Pain-Point Heatmap

Rate each step for:
- **Effort**: Low / Medium / High
- **Error rate**: Low / Medium / High
- **Delay**: Low / Medium / High
- **Automation potential**: Low / Medium / High

Steps with High ratings across multiple dimensions are improvement priorities.

## TO-BE Process Design

After mapping the AS-IS:

1. Identify which steps can be eliminated (no value added)
2. Identify which steps can be automated (high effort + high automation potential)
3. Identify which handoffs cause the most delay (redesign the handoff)
4. Identify where decisions could be moved earlier (shift-left)
5. Redesign the process with the improvements applied

For each improvement, document:
- **Change type**: Eliminate / Automate / Simplify / Resequence / Add check
- **Steps affected**
- **Expected benefit**: time saved, error rate reduction, cost saving
- **Implementation effort**: Low / Medium / High

## Output Format

Produce:
1. AS-IS process narrative + step table
2. RACI matrix
3. Pain-point heatmap table
4. TO-BE process narrative with improvement recommendations
5. Improvement summary table (prioritised by benefit vs. effort)

## Additional Resources

- **`references/process-notation-guide.md`** — BPMN notation guide for formal process diagrams
- **`assets/process-map-template.md`** — Blank AS-IS / TO-BE template
