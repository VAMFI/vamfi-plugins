# Security Architecture Review: [SYSTEM NAME]
Date: [YYYY-MM-DD] | Author: VAMFI Security & Compliance Lead
Stage: [Architecture / Implementation / Pre-Production] | Status: Draft

---

## System Scope

**System**: [NAME AND BRIEF DESCRIPTION]
**Data classification**: [PII / Financial / Health / Public / Internal]
**Regulatory requirements**: [GDPR / SOC 2 / ISO 27001 / PCI-DSS / HIPAA / None identified]
**Trust boundaries**: [Where data crosses security domains]

---

## Threat Model (STRIDE)

| # | Threat | Category | Asset at Risk | Attack Vector | Likelihood | Impact | Risk | Control | Priority |
|---|---|---|---|---|---|---|---|---|---|
| T-001 | [THREAT DESCRIPTION] | Spoofing | [ASSET] | [HOW] | H/M/L | H/M/L | H/M/L | [CONTROL] | P0/P1/P2 |
| T-002 | | Tampering | | | | | | | |
| T-003 | | Repudiation | | | | | | | |
| T-004 | | Information Disclosure | | | | | | | |
| T-005 | | Denial of Service | | | | | | | |
| T-006 | | Elevation of Privilege | | | | | | | |

Risk = Likelihood × Impact. HIGH risk requires documented control before sign-off.

---

## Security Controls Assessment

### Authentication and Identity
- [ ] PASS / [ ] FAIL / [ ] N/A — Multi-factor authentication for privileged operations
- [ ] PASS / [ ] FAIL / [ ] N/A — Secure session management (token rotation, expiry configured)
- [ ] PASS / [ ] FAIL / [ ] N/A — OAuth 2.0 / OIDC for third-party authentication
- [ ] PASS / [ ] FAIL / [ ] N/A — Password policy enforced

### Authorisation
- [ ] PASS / [ ] FAIL / [ ] N/A — RBAC or ABAC implemented
- [ ] PASS / [ ] FAIL / [ ] N/A — Principle of least privilege applied
- [ ] PASS / [ ] FAIL / [ ] N/A — Object-level access checks (IDOR prevention)
- [ ] PASS / [ ] FAIL / [ ] N/A — API endpoint authorisation verified

### Input Validation and Output Encoding
- [ ] PASS / [ ] FAIL / [ ] N/A — Server-side input validation on all endpoints
- [ ] PASS / [ ] FAIL / [ ] N/A — Parameterised queries / ORM for DB access
- [ ] PASS / [ ] FAIL / [ ] N/A — Output encoding for XSS prevention
- [ ] PASS / [ ] FAIL / [ ] N/A — File upload validation (type, size, content)

### Secrets and Configuration
- [ ] PASS / [ ] FAIL / [ ] N/A — No hardcoded credentials in source code
- [ ] PASS / [ ] FAIL / [ ] N/A — Secrets managed in vault (not plain-text env vars)
- [ ] PASS / [ ] FAIL / [ ] N/A — Secret rotation schedule defined
- [ ] PASS / [ ] FAIL / [ ] N/A — Production config separated from code

### Data Protection
- [ ] PASS / [ ] FAIL / [ ] N/A — TLS 1.2+ for all data in transit
- [ ] PASS / [ ] FAIL / [ ] N/A — Encryption at rest for sensitive data
- [ ] PASS / [ ] FAIL / [ ] N/A — Data retention and deletion policy defined
- [ ] PASS / [ ] FAIL / [ ] N/A — Data classification documented

### Dependency Security
- [ ] PASS / [ ] FAIL / [ ] N/A — Automated CVE scanning in CI
- [ ] PASS / [ ] FAIL / [ ] N/A — SBOM generated
- [ ] PASS / [ ] FAIL / [ ] N/A — No CRITICAL CVEs unmitigated

---

## Pre-Production Security Gate

**Result: PASS / FAIL**

| Check | Status | Blocker? | Notes |
|---|---|---|---|
| No CRITICAL CVEs in dependencies | PASS / FAIL | Yes | |
| No hardcoded secrets in codebase | PASS / FAIL | Yes | |
| Authentication implemented and tested | PASS / FAIL | Yes | |
| OWASP Top 10 mitigations reviewed | PASS / FAIL | Yes | |
| Security test cases passing | PASS / FAIL | Yes | |
| Data classification documented | PASS / FAIL | No | |

**Blocking items** (if FAIL):
1. [ITEM — must be resolved before production release]
2. [ITEM]

---

## Compliance Gap Analysis

| Requirement | Framework | Current State | Gap | Remediation | Owner | Due |
|---|---|---|---|---|---|---|
| [REQUIREMENT] | [GDPR / SOC2 etc.] | [CURRENT] | [GAP] | [ACTION] | [ROLE] | [DATE] |
