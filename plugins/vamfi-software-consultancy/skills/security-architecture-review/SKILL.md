---
name: Security Architecture Review
description: This skill should be used when the user asks to "review security architecture", "run a threat model", "produce a security review", "check for security risks", "review OWASP compliance", "assess security controls", "run a pre-production security gate", or needs security analysis at any stage of the SDLC — not just at the end.
version: 1.0.0
---

# Security Architecture Review

Embed security thinking at every stage of the SDLC. Produce threat models, security controls checklists, and compliance gap analyses that identify risks before they reach production.

## Overview

Security architecture review is not a final gate — it is a continuous practice applied at design, implementation, test, and release stages. This skill is callable from any pipeline stage. The earlier a security concern is found, the cheaper it is to fix.

## Shift-Left Security Activities by Stage

| Stage | Security Activity | Output |
|---|---|---|
| Discovery | Data classification, compliance identification | Data map, regulatory checklist |
| Architecture | Threat modelling, security controls design | STRIDE threat model, controls spec |
| Implementation | Secure code review patterns, secrets audit | Code security checklist |
| Testing | Security test cases, DAST planning | Security test plan |
| Release | Pre-production gate, dependency audit | Go/No-go security gate |
| Run | Incident response, continuous monitoring | Security runbook |

## STRIDE Threat Modelling

For each trust boundary in the system:

### Identify Threats

| Threat | Category | Asset at Risk | Attack Vector | Likelihood | Impact | Risk | Control |
|---|---|---|---|---|---|---|---|
| [description] | S/T/R/I/D/E | [what is exposed] | [how attack occurs] | H/M/L | H/M/L | H/M/L | [mitigation] |

STRIDE categories:
- **S**poofing Identity
- **T**ampering with Data
- **R**epudiation
- **I**nformation Disclosure
- **D**enial of Service
- **E**levation of Privilege

Risk = Likelihood × Impact. HIGH risk requires a documented control before architecture sign-off.

## Security Controls Checklist

Assess against the following controls:

**Authentication and Identity**
- [ ] Multi-factor authentication for sensitive operations
- [ ] Secure session management (token rotation, expiry)
- [ ] OAuth 2.0 / OIDC for third-party auth
- [ ] Password policy enforcement

**Authorisation**
- [ ] Role-based or attribute-based access control implemented
- [ ] Principle of least privilege applied
- [ ] IDOR prevention (object-level access checks)
- [ ] API endpoint authorisation (not just authentication)

**Input Validation and Output Encoding**
- [ ] Server-side input validation on all endpoints
- [ ] Parameterised queries / ORM for database access
- [ ] Output encoding to prevent XSS
- [ ] File upload validation (type, size, content)

**Secrets and Configuration**
- [ ] No hardcoded credentials in source code
- [ ] Secrets managed in a vault (not environment variables in plain text)
- [ ] Secret rotation schedule defined
- [ ] Production configs separated from code

**Data Protection**
- [ ] TLS 1.2+ for all data in transit
- [ ] Encryption at rest for sensitive data
- [ ] Data classification applied and documented
- [ ] Data retention and deletion policy defined

**Dependency Security**
- [ ] Automated dependency vulnerability scanning in CI
- [ ] SBOM (Software Bill of Materials) generated
- [ ] Licence compliance checked
- [ ] Unpinned dependencies flagged

## Pre-Production Security Gate

Binary PASS / FAIL assessment:

| Check | Status | Blocker? |
|---|---|---|
| No CRITICAL CVEs in dependencies | PASS/FAIL | Yes |
| No hardcoded secrets in codebase | PASS/FAIL | Yes |
| Authentication implemented and tested | PASS/FAIL | Yes |
| OWASP Top 10 reviewed | PASS/FAIL | Yes |
| Security test cases passing | PASS/FAIL | Yes |
| Data classification documented | PASS/FAIL | No |

Result: **PASS** (proceed) / **FAIL** (list of blocking items to resolve first)

## Additional Resources

- **`references/owasp-top10-mapping.md`** — OWASP Top 10 2025 with controls
- **`references/compliance-frameworks.md`** — GDPR, SOC 2, ISO 27001, PCI-DSS, HIPAA mappings
- **`assets/security-review-template.md`** — Blank threat model + controls template
