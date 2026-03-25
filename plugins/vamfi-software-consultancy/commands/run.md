---
name: run
description: Ongoing operational support — cost and performance optimisation, incident postmortems, engagement health checks, and continuous improvement planning.
argument-hint: "[incident report, performance metric, or improvement goal]"
allowed-tools: ["Read", "Write", "Grep", "Glob", "Bash"]
---

# VAMFI Run Command

Run operational and continuous improvement skills.

## Process

Determine the user's intent and activate the appropriate skill:

- **Optimisation request**: Activate `cost-and-performance-optimization` — produce FinOps recommendations, query plan analysis, and resource right-sizing guidance.
- **Incident or postmortem**: Activate `incident-postmortem` — facilitate blameless RCA, produce timeline, root cause analysis, action items, and prevention plan.
- **Health check / retrospective**: Activate `engagement-health-check` — assess delivery health, team velocity, technical debt trends, and produce a continuous improvement backlog.

After producing the relevant output:
1. Offer to save results to `docs/vamfi/`.
2. Update the engagement health register if one exists.

## Tips

- For incidents, paste the incident timeline, alerts, and any logs or metrics summaries.
- The Client Success Manager agent facilitates retrospectives and health checks.
- Regular use of `:run` creates a continuous improvement feedback loop across all 8 pipeline stages.
