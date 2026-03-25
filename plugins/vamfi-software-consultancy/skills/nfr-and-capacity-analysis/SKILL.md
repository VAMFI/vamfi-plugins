---
name: NFR and Capacity Analysis
description: This skill should be used when the user asks to "define NFRs", "set performance targets", "define SLAs and SLOs", "analyse capacity requirements", "specify scalability targets", "define reliability requirements", or needs to translate business expectations into measurable non-functional requirements.
version: 1.0.0
---

# NFR and Capacity Analysis

Translate business expectations into precise, measurable non-functional requirements and SLO definitions that constrain and guide architecture decisions.

## Overview

NFRs are the quality attributes a system must have in addition to its functional behaviour. Vague NFRs ("must be fast", "must be secure") are useless. This skill produces specific, measurable NFRs and derives the capacity model that the architecture must support.

## NFR Categories and Metrics

### Performance
- **Response time**: p50, p95, p99 latency targets per endpoint type
- **Throughput**: requests per second at peak load
- **Processing time**: for batch or async operations

### Availability and Reliability
- **Uptime SLO**: expressed as % per month (99.9% = 43.8min downtime/month)
- **RTO** (Recovery Time Objective): max time to restore service after failure
- **RPO** (Recovery Point Objective): max data loss acceptable
- **MTBF** (Mean Time Between Failures): for hardware/infrastructure

### Scalability
- **Concurrent users**: expected and peak concurrent sessions
- **Data volume**: current volume and growth rate (1yr, 3yr projection)
- **Request rate**: sustained and burst peak (e.g., "10x normal during Black Friday")
- **Geographic distribution**: single region or multi-region

### Security
- **Authentication strength**: MFA required? Which protocols?
- **Data classification**: PII, financial, health, public
- **Encryption requirements**: in transit (TLS 1.3), at rest (AES-256)
- **Compliance requirements**: GDPR, SOC 2, ISO 27001, PCI-DSS, HIPAA

### Maintainability
- **Deployment frequency target**: multiple/day, daily, weekly
- **Change failure rate target**: < X% of deployments cause incidents
- **Mean time to recovery**: < X hours for P1 incidents
- **Code coverage floor**: minimum test coverage %

## NFR Documentation Format

```markdown
## Non-Functional Requirements

### Performance
| Metric | Current | Target | Rationale |
|---|---|---|---|
| API p95 latency | N/A | < 200ms | UX research shows 200ms feels instant |
| Throughput | N/A | 1,000 rps peak | Based on 50,000 DAU × 20 actions/day |

### Availability
| Metric | Target | Downtime Budget/Month |
|---|---|---|
| Uptime SLO | 99.9% | 43.8 minutes |
| RTO | 1 hour | — |
| RPO | 15 minutes | — |

### Scalability
| Dimension | Current | 1 Year | 3 Year |
|---|---|---|---|
| Registered users | 0 | 100,000 | 1,000,000 |
| Concurrent sessions | 0 | 5,000 peak | 50,000 peak |
| Data volume | 0 | 500GB | 5TB |
```

## Capacity Model

Derive infrastructure sizing from NFRs:

1. Start from peak concurrent users and request rate
2. Model request distribution across endpoints (80/20: 80% reads, 20% writes typical)
3. Estimate CPU and memory per request based on complexity
4. Add redundancy multiplier (N+1 for active-passive, N+2 for active-active)
5. Add headroom buffer (30% minimum for burst)
6. Size database IOPS from write rate and read cache hit ratio

Produce a capacity table:

| Component | Baseline | Peak Load | Redundancy | Recommended Size |
|---|---|---|---|---|
| API servers | [size] | [size] | N+1 | [recommendation] |
| Database | [size] | [size] | Primary + Replica | [recommendation] |

## Additional Resources

- **`references/slo-sli-reference.md`** — SLO/SLI definitions and examples by system type
- **`references/capacity-planning-models.md`** — Capacity calculation worksheets
