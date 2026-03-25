---
name: test
description: Create a test strategy, generate test cases, and produce a regression plan. Covers all test levels from unit through E2E, with AI-generated edge cases.
argument-hint: "[feature, PRD section, or codebase path to test]"
allowed-tools: ["Read", "Write", "Grep", "Glob", "Bash"]
---

# VAMFI Test Command

Run testing skills to produce a complete quality assurance package.

## Process

1. Activate `test-strategy-and-plan` skill — produce:
   - Test levels and scope (unit, integration, E2E, performance, security)
   - Tooling recommendations with rationale
   - Coverage targets and quality gates
   - Shift-left test planning (tests defined at requirements stage)
2. Activate `test-case-generation` skill — produce:
   - Happy path test cases
   - Edge cases and boundary conditions (AI-generated)
   - Error handling and negative test cases
   - Property-based test suggestions
3. Activate `regression-plan` skill — produce:
   - Regression scope and priority matrix
   - Automation ROI assessment
   - Flaky test identification strategy
4. Offer to save the test package to `docs/vamfi/`.

## Tips

- Point to a specific feature or PRD section for targeted test generation.
- The QA Lead agent can generate test cases in your project's testing framework.
