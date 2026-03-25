---
name: implement
description: Produce an implementation plan with branching strategy, coding patterns, and guardrails. Optionally execute code changes and request multi-agent code review.
argument-hint: "[story, feature, or task description to implement]"
allowed-tools: ["Read", "Write", "Edit", "Grep", "Glob", "Bash"]
---

# VAMFI Implement Command

Run implementation planning and optionally execute changes.

## Process

1. Activate `implementation-plan` skill — produce:
   - Branching strategy (feature flags, trunk-based, gitflow)
   - Coding patterns and guardrails for this feature
   - File and module impact map
   - Step-by-step implementation checklist
2. If the user confirms, activate `code-change-implementation` skill to:
   - Implement the changes following the plan
   - Write or update tests alongside the code
   - Document changes with clear commit messages
3. Activate `code-review-and-refactor` skill to:
   - Orchestrate multi-agent review across logic, security, and style dimensions
   - Surface critical issues and improvement suggestions
   - Produce a review summary with action items
4. Offer to save the implementation plan and review summary to `docs/vamfi/`.

## Tips

- This command works best after running `:plan` to shape the story.
- For large features, run `:implement` story-by-story rather than all at once.
- The Tech Lead and Security & Compliance Lead agents collaborate on code review.
