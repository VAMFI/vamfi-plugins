# Deployment Plan: [SERVICE/FEATURE NAME]
Release Date: [YYYY-MM-DD] | Release Manager: [ROLE]
Version: 1.0 | Status: Draft

---

## Deployment Strategy

**Strategy chosen**: [Rolling update / Blue-Green / Canary / Feature flag / Big bang]
**Rationale**: [Why this strategy is appropriate for this release]

---

## Pre-Deployment Checklist

- [ ] All acceptance criteria passing in staging environment
- [ ] Performance baseline validated: p95 latency < [Xms]
- [ ] Security gate: PASSED
- [ ] Database migrations tested and verified reversible
- [ ] Runbook reviewed by on-call engineer
- [ ] Rollback procedure tested in staging
- [ ] Monitoring dashboards and alerts configured
- [ ] On-call engineer briefed and available during deployment window
- [ ] Change record raised: [CHANGE-ID] (if required by process)
- [ ] Stakeholder notification sent: deployment window is [TIME WINDOW]

---

## Deployment Steps

| # | Step | Command / Action | Owner | Duration | Validation |
|---|---|---|---|---|---|
| 1 | [Run DB migration] | `[command]` | DevOps | [X min] | [verify row count / no errors] |
| 2 | [Deploy new version] | `[command]` | DevOps | [X min] | [health check passes] |
| 3 | [Smoke test critical paths] | [test URL / checklist] | QA | [X min] | [checklist passes] |
| 4 | [Enable feature flag — 10% canary] | [toggle in dashboard] | Product | [1 min] | [error rate stable] |
| 5 | [Monitor 30-minute canary window] | [dashboard URL] | On-call | [30 min] | [SLOs within budget] |
| 6 | [Enable feature flag — 100% traffic] | [toggle in dashboard] | Product | [1 min] | [error rate stable] |

---

## Go / No-Go Criteria

**GO**: All pre-deployment checklist items ✅ AND error rate < [X]% AND p95 latency < [Xms] in first 10 minutes

**NO-GO triggers**:
- Any pre-deployment checklist item not complete
- Error rate > [X]% at any point post-deploy
- p95 latency > [2X]ms sustained for > 5 minutes
- Any data integrity issues detected

---

## Rollback Procedures

| Trigger | Action | Command | Owner | Duration |
|---|---|---|---|---|
| Error rate > [X]% | Disable feature flag / revert traffic | `[command]` | On-call | < 2 min |
| Service unavailable | Redeploy previous image | `[command]` | DevOps | < 5 min |
| DB migration failure | Rollback migration | `[command]` | DBA | [estimate] |

---

## Post-Deployment Checklist

- [ ] SLOs met for 1 hour post-deployment
- [ ] No P0 or P1 incidents raised in first hour
- [ ] Deployment notes recorded in runbook: `docs/vamfi/[date]-deployment-notes.md`
- [ ] Feature flag removal task created with date: [YYYY-MM-DD]
- [ ] Stakeholders notified of successful release
- [ ] On-call briefed on any changes to watch for

---

## Deployment Window

| Field | Value |
|---|---|
| Start time | [YYYY-MM-DD HH:MM UTC] |
| Expected duration | [X minutes] |
| Maximum allowed window | [Y minutes] |
| Rollback decision deadline | [YYYY-MM-DD HH:MM UTC] |
| On-call engineer | [NAME / SLACK HANDLE] |
