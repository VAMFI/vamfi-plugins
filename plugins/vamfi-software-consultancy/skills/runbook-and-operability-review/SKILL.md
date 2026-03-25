---
name: Runbook and Operability Review
description: This skill should be used when the user asks to "create a runbook", "write operational procedures", "define SLO alerting", "design the on-call playbook", "review service operability", "create incident response procedures", or needs to prepare a service for production operations.
version: 1.0.0
---

# Runbook and Operability Review

Produce a comprehensive operational runbook and conduct an operability review. Ensure the service can be operated, monitored, and recovered by anyone on the on-call rotation — not just the person who built it.

## Overview

A service is not production-ready when it deploys without errors — it is production-ready when it can be operated without the original author. This skill produces the runbook and identifies operability gaps before go-live.

## Operability Review

Before writing the runbook, assess operability:

| Dimension | Assessment | Gap | Recommendation |
|---|---|---|---|
| Logging | [what is logged] | [gaps] | [action] |
| Metrics | [what is measured] | [gaps] | [action] |
| Tracing | [distributed tracing coverage] | [gaps] | [action] |
| Alerting | [alert coverage] | [gaps] | [action] |
| Health checks | [liveness/readiness probes] | [gaps] | [action] |
| Graceful shutdown | [handling in-flight requests] | [gaps] | [action] |
| Runbook coverage | [operational procedures] | [gaps] | [action] |

Flag any RED items (critical gaps) that must be resolved before go-live.

## Runbook Structure

```markdown
# Runbook: [Service Name]
Version: [N] | Last Updated: [YYYY-MM-DD] | On-Call Escalation: [contact]

## Service Overview
**Purpose**: [What this service does and why it matters]
**Criticality**: P0 / P1 / P2 / P3
**Dependencies**: [upstream/downstream services]
**SLO**: [uptime target] | [latency target]
**On-call contact**: [Slack channel] | [PagerDuty rotation]

## Architecture Diagram
[Mermaid diagram or link]

## Common Operational Procedures

### Deploy a new version
1. [Step]
2. [Step]
Validation: [how to confirm success]
Rollback: see Rollback section

### Restart the service
1. [Step]
Validation: [health check URL or command]

### Scale the service
1. [Step]
When to scale: [trigger conditions]

### Run database migration
1. [Step]
Warning: [any destructive operations to be aware of]

## Incident Response Playbook

### Alert: [Alert Name]
**Severity**: P0 / P1 / P2
**Trigger**: [condition that fires this alert]
**Symptoms**: [what users or dependent services experience]
**Diagnosis steps**:
1. Check [dashboard/metric]
2. Check logs: `[log query]`
3. Check [downstream dependency]
**Remediation**:
- If [condition A]: [action]
- If [condition B]: [action]
**Escalate if**: [condition under which to wake up the team lead]

## SLO Alerting Guide

| SLI | SLO Target | Fast-Burn Alert | Slow-Burn Alert |
|---|---|---|---|
| Availability | 99.9% | < 99% over 1hr | < 99.5% over 6hr |
| p95 Latency | < 200ms | > 500ms over 5min | > 300ms over 1hr |
| Error rate | < 0.1% | > 1% over 5min | > 0.5% over 30min |

## On-Call Handoff Checklist
- [ ] Check open incidents from previous shift
- [ ] Review SLO burn rate dashboards
- [ ] Check deployment log (any deploys in last 24hr?)
- [ ] Check dependency health
- [ ] Note any unusual patterns for incoming on-call
```

## Additional Resources

- **`references/sre-practices.md`** — SRE principles and error budget management
- **`assets/runbook-template.md`** — Blank runbook template
