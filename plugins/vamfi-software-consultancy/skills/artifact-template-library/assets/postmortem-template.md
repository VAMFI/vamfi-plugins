# Incident Postmortem: [INCIDENT TITLE]
Date: [YYYY-MM-DD] | Severity: P0 / P1 / P2
Author: VAMFI SRE Lead | Reviewed by: [STAKEHOLDERS]
Status: Draft / In Review / Final

---

## Summary

[2-3 sentences: what happened, who was affected, how long it lasted, and whether there was data loss.]

**Total impact duration**: [HH:MM]
**Users affected**: [COUNT or %]
**Revenue/SLO impact**: [ESTIMATE]

---

## Timeline

All times in UTC.

| Time | Event | Source |
|---|---|---|
| [HH:MM] | [First symptom or alert fired] | [Monitoring / User report] |
| [HH:MM] | [On-call engineer paged] | [PagerDuty] |
| [HH:MM] | [Engineer begins investigation] | [Slack thread] |
| [HH:MM] | [Root cause identified] | [Slack thread] |
| [HH:MM] | [Mitigation applied] | [Deployment log] |
| [HH:MM] | [Service fully restored] | [Monitoring] |

**Key metrics:**
- Time to detect (TTD): [X min]
- Time to acknowledge (TTA): [X min]
- Time to mitigate (TTM): [X min]
- Time to resolve (TTR): [X min]

---

## Impact

| Dimension | Value |
|---|---|
| Duration | [X minutes/hours] |
| Affected users | [COUNT / %] |
| Affected services | [LIST] |
| Data loss | Yes / No — [details if yes] |
| SLO impact | [error budget consumed: X%] |
| Customer communications sent | Yes / No |

---

## Root Cause Analysis (5 Whys)

**Symptom**: [What users experienced]

**Why 1**: [Immediate cause — what triggered the outage]
**Why 2**: [Cause of Why 1 — the mechanism]
**Why 3**: [Cause of Why 2 — the underlying condition]
**Why 4**: [Cause of Why 3 — the systemic issue]
**Why 5 (Root cause)**: [The systemic or process failure that allowed this to happen]

**Contributing factors** (conditions that made the incident worse):
- [FACTOR 1 — e.g., "Alert threshold was set too high to catch this early"]
- [FACTOR 2 — e.g., "Runbook had not been updated since the last architecture change"]

---

## What Went Well

[Things that helped contain or resolve the incident faster. Be specific.]

- [ITEM 1]
- [ITEM 2]

---

## What Could Be Improved

[Things that made the incident worse or harder to resolve. Be specific, not generic.]

- [ITEM 1 — e.g., "No alert for this specific failure mode — we detected it via user reports, not monitoring"]
- [ITEM 2]

---

## Action Items

| # | Action | Type | Owner | Due Date | Priority | Status |
|---|---|---|---|---|---|---|
| 1 | [Prevention action] | Prevention | [ROLE] | [YYYY-MM-DD] | P0 | Open |
| 2 | [Detection improvement] | Detection | [ROLE] | [YYYY-MM-DD] | P1 | Open |
| 3 | [Response improvement] | Response | [ROLE] | [YYYY-MM-DD] | P1 | Open |
| 4 | [Process improvement] | Process | [ROLE] | [YYYY-MM-DD] | P2 | Open |

Action types: Prevention / Detection / Response / Process / Documentation

---

*This postmortem was conducted with blameless intent. The goal is to improve the system and our processes, not to assign fault.*
