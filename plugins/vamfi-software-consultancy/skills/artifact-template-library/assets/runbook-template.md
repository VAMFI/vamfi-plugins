# Runbook: [SERVICE NAME]
Version: 1.0 | Last Updated: [YYYY-MM-DD] | Owner: [TEAM/ROLE]

---

## Service Overview

| Field | Value |
|---|---|
| **Service name** | [NAME] |
| **Purpose** | [What this service does and why it matters] |
| **Criticality** | P0 / P1 / P2 / P3 |
| **SLO** | [uptime %] uptime · p95 latency < [Xms] |
| **On-call channel** | [Slack / PagerDuty rotation] |
| **Escalation contact** | [Tech Lead name / Slack handle] |
| **Repository** | [repo URL] |
| **Dashboard** | [monitoring dashboard URL] |

---

## Architecture Overview

[Brief description of the service and its dependencies. Include a simple diagram if helpful.]

**Key dependencies:**
| Dependency | Type | Criticality | Health check |
|---|---|---|---|
| [DB] | Synchronous | Critical | [health URL] |
| [Queue] | Asynchronous | High | [health URL] |

---

## Common Operational Procedures

### Deploy a New Version
1. Verify all CI checks pass on the release branch
2. Run: `[deploy command]`
3. Monitor deployment: `[command or dashboard]`
4. Validate: `[smoke test command or URL]`
5. **Rollback if needed**: see Rollback section

### Restart the Service
1. `[restart command]`
2. Wait [X] seconds for health checks to pass
3. Validate: `[health check URL]`

### Scale the Service
1. When to scale: [CPU > 80% sustained for 5 min, or queue depth > 1000]
2. `[scale command]`
3. Validate: [latency returns to baseline within 2 minutes]

### Run a Database Migration
1. Create a backup: `[backup command]`
2. Test migration in staging first
3. Run migration: `[migration command]`
4. Validate: `[validation query]`
5. **Warning**: [any destructive steps to be aware of]

---

## Incident Response Playbook

### Alert: [ALERT NAME 1]
**Severity**: P0 / P1 / P2
**Trigger condition**: [What metric/threshold fires this alert]
**User impact**: [What users or dependent services experience]

**Diagnosis steps:**
1. Check [dashboard]: look for [what to look for]
2. Check recent deployments: `git log --oneline -10`
3. Check logs: `[log query command]`
4. Check upstream dependency: `[health check]`

**Remediation:**
- If [CONDITION A]: [ACTION]
- If [CONDITION B]: [ACTION]
- If cause unknown: escalate to [ROLE] via [CHANNEL]

---

### Alert: [ALERT NAME 2]
**Severity**:
**Trigger condition**:
**User impact**:
**Diagnosis steps:**
**Remediation:**

---

## SLO Alerting Guide

| SLI | SLO Target | Fast-Burn Alert | Slow-Burn Alert | Severity |
|---|---|---|---|---|
| Availability | 99.9% | < 99% over 1hr | < 99.5% over 6hr | P0 / P1 |
| p95 Latency | < [X]ms | > [2X]ms over 5min | > [1.5X]ms over 1hr | P1 / P2 |
| Error rate | < 0.1% | > 1% over 5min | > 0.5% over 30min | P0 / P1 |

---

## Rollback Procedures

| Trigger | Action | Owner | Duration |
|---|---|---|---|
| Error rate > [X]% | Disable feature flag / revert traffic split | On-call | < 2 min |
| Service unavailable | `[redeploy previous version command]` | On-call | < 5 min |
| DB migration failure | `[rollback migration command]` | DBA | [estimate] |

---

## On-Call Handoff Checklist

At the end of each shift, hand over:
- [ ] Open incidents and current status
- [ ] SLO burn rate — is the error budget healthy?
- [ ] Recent deployments (last 24h) and any related issues
- [ ] Any unusual patterns observed
- [ ] Pending actions from previous handoff
