---
name: release
description: Produce a deployment plan, operational runbook, and DevSecOps pipeline design for releasing a feature or service to production.
argument-hint: "[service name, feature, or release scope to plan]"
allowed-tools: ["Read", "Write", "Grep", "Glob", "Bash"]
---

# VAMFI Release Command

Run release and DevOps skills to produce a complete release package.

## Process

1. Activate `deployment-plan` skill — produce:
   - Deployment strategy (canary, blue-green, rolling, feature flags)
   - Infrastructure requirements and IaC templates
   - Rollback criteria and procedures
   - Release checklist with go/no-go gates
2. Activate `runbook-and-operability-review` skill — produce:
   - Operational runbook with step-by-step procedures
   - SLO alerting rules and thresholds
   - On-call escalation playbook
   - Observability dashboard requirements
3. Activate `security-architecture-review` skill for release-specific checks:
   - Pre-production security gate checklist
   - Secrets and credentials audit
   - Dependency vulnerability scan plan
4. Offer to save the release package to `docs/vamfi/`.
5. Suggest running `/vamfi-software-consultancy:run` post-release.

## Tips

- The DevOps/SRE Lead and Security & Compliance Lead agents co-produce this package.
- Include the target environment (staging, prod, multi-region) in your prompt for tailored guidance.
