---
name: Current State Assessment
description: This skill should be used when the user asks to "assess the current architecture", "document the existing system", "analyse the codebase", "identify technical debt", "review the legacy system", "produce a current-state report", or needs to understand what exists before designing a target architecture.
version: 1.0.0
---

# Current State Assessment

Systematically assess an existing system or codebase to produce a clear picture of the current architecture, capabilities, and technical debt. This assessment drives the gap analysis that informs the target architecture.

## Overview

No target architecture is designed in a vacuum. This skill documents what exists today — its strengths, its limitations, and the debt that will impede change — so that the target architecture is grounded in reality.

## Assessment Process

### Step 1: System Inventory

Catalogue what exists:
- **Services and components**: name, purpose, technology, age
- **Data stores**: type (RDBMS, NoSQL, cache, file), technology, approximate size
- **Integrations**: upstream/downstream systems, protocol (REST, gRPC, queue, file)
- **Infrastructure**: hosting (cloud provider, region, on-prem), container/VM, IaC maturity
- **CI/CD**: pipeline tools, deployment frequency, automation level

Read the codebase (if available) using Glob and Read to supplement what the user provides.

### Step 2: Architecture Pattern Identification

Identify the dominant architectural pattern:
- Monolith (single deployable unit)
- Modular monolith (logical separation, single deployment)
- SOA (service-oriented, shared database common)
- Microservices (independent deployable services, independent data stores)
- Serverless (function-based, managed infrastructure)
- Event-driven (async messaging, event sourcing)
- Hybrid (combination)

Note whether the pattern is intentional or has evolved organically.

### Step 3: Capability Assessment

Rate current capabilities:

| Capability | Current State | Maturity | Notes |
|---|---|---|---|
| Scalability | [description] | Low/Med/High | |
| Observability | [description] | Low/Med/High | |
| Security | [description] | Low/Med/High | |
| Testability | [description] | Low/Med/High | |
| Deployability | [description] | Low/Med/High | |
| Developer Experience | [description] | Low/Med/High | |

### Step 4: Technical Debt Register

| Item | Category | Severity | Impact on Change | Remediation Approach | Effort |
|---|---|---|---|---|---|
| [debt item] | Architecture/Code/Data/Ops | Critical/High/Med/Low | [how it blocks progress] | [recommendation] | S/M/L |

Categories:
- **Architecture debt**: structural decisions that limit scalability or change
- **Code debt**: poor quality code that is hard to maintain or test
- **Data debt**: schema problems, lack of data quality, no data contracts
- **Operational debt**: missing observability, manual processes, no runbooks

### Step 5: Gap Analysis

Compare current state to typical requirements for the target state:

| Capability | Current | Required for Target | Gap | Priority |
|---|---|---|---|---|
| [capability] | [current level] | [required level] | [description of gap] | High/Med/Low |

## Output Format

Produce a Current State Assessment document with:
1. System inventory table
2. Architecture pattern description + diagram (Mermaid text)
3. Capability maturity table
4. Technical debt register
5. Gap analysis table
6. Executive summary (3-5 bullet points on the most important findings)

## Additional Resources

- **`references/technical-debt-patterns.md`** — Common technical debt patterns and remediation strategies
- **`assets/current-state-template.md`** — Blank assessment template
