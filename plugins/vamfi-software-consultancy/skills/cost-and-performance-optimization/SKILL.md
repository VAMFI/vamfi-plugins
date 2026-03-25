---
name: Cost and Performance Optimization
description: This skill should be used when the user asks to "optimise costs", "reduce cloud spend", "improve performance", "fix slow queries", "analyse FinOps", "reduce latency", "optimise infrastructure", "right-size resources", or needs to improve the efficiency of a running system.
version: 1.0.0
---

# Cost and Performance Optimization

Systematically identify and resolve cost inefficiencies and performance bottlenecks in running systems. Apply FinOps principles and performance engineering practices to deliver measurable improvements.

## Overview

Optimisation without measurement is guessing. This skill starts with data collection, identifies the most impactful opportunities, and produces a prioritised improvement plan with expected outcomes.

## Cost Optimization (FinOps)

### Step 1: Cost Analysis

Identify the cost breakdown by:
- Service/component (which is the largest cost driver?)
- Resource type (compute, storage, network, database, egress)
- Environment (production vs. non-production)
- Time pattern (constant vs. spiky — opportunity for savings?)

### Step 2: Common Cost Opportunities

| Opportunity | Typical Saving | Effort | Risk |
|---|---|---|---|
| Right-size over-provisioned compute | 30-50% compute cost | Low | Low |
| Reserved instances / Savings Plans (1-year) | 30-40% vs on-demand | Low | Low |
| Delete unused resources (orphaned volumes, snapshots, LBs) | Variable | Low | Low |
| Reduce non-prod environments operating hours | 60-70% non-prod compute | Low | Low |
| Move infrequent-access data to cheaper storage tiers | 50-80% storage cost | Medium | Low |
| Cache frequently read data (reduce DB reads) | 20-40% DB cost | Medium | Medium |
| Optimise network egress (CDN, compression) | Variable | Medium | Low |

### Step 3: Produce Cost Optimisation Report

```markdown
# Cost Optimisation Report: [Service/System]
Analysis Period: [YYYY-MM to YYYY-MM]
Current Monthly Cost: [£/$]

## Top 5 Opportunities
| Opportunity | Current Cost | Estimated Saving | Effort | Recommended Action |
|---|---|---|---|---|
| [item] | [£/$] | [£/$ or %] | S/M/L | [specific action] |

## Quick Wins (implement this sprint)
[List of low-effort, low-risk actions with expected savings]

## Medium-Term Actions (next quarter)
[Actions requiring more planning]
```

## Performance Optimization

### Step 1: Identify Bottlenecks

Use the performance data available:
- **Latency**: which endpoints or operations are slowest? (p95, p99 distribution)
- **Throughput**: where does throughput degrade under load?
- **Resource saturation**: which resource hits 100% first (CPU, memory, DB connections)?
- **Error rate under load**: does error rate increase at higher traffic?

### Step 2: Query and Database Optimization

For slow database queries:
1. Identify queries by execution time (EXPLAIN ANALYZE)
2. Check for missing indexes on WHERE and JOIN columns
3. Check for N+1 query patterns (load relationship once, not per record)
4. Check for unbounded queries (missing LIMIT clause)
5. Evaluate query caching (Redis/Memcached) for read-heavy, stable data

### Step 3: Application Performance

- Identify synchronous operations that should be async (move to queue)
- Identify repeated computation that should be cached
- Identify excessive serialisation/deserialisation
- Identify memory leaks (growing heap over time)

### Step 4: Performance Improvement Plan

```markdown
# Performance Improvement Plan
Baseline: [p95 latency: Xms, throughput: Y rps, error rate: Z%]
Target: [p95 latency: Xms, throughput: Y rps]

## Prioritised Improvements
| # | Improvement | Expected Gain | Effort | Owner |
|---|---|---|---|---|
| 1 | [improvement] | [X% latency reduction] | S/M/L | [role] |
```

## Additional Resources

- **`references/finops-framework.md`** — FinOps principles and cloud-specific optimisation
- **`references/performance-profiling.md`** — Profiling techniques per tech stack
