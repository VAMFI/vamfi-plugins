---
name: team-new
description: Interactive wizard to design and create a new team pack from scratch
argument-hint: "[team-name]"
allowed-tools: ["Read", "Write", "Bash", "Glob"]
---

# Create New Team Pack

Launch the team-builder agent to interactively design and create a new team pack.

## Process

1. **Spawn the team-builder agent**: Use the team-builder agent to guide the user through team design
2. **The agent will ask about**:
   - Team mission and domain
   - Number and types of agents needed
   - Communication patterns
   - Shared rules and standards
   - Common workflows
3. **Generate all files**: The agent creates the complete team pack folder structure
4. **Save the team pack**: Write to `~/.claude/team-packs/{name}/` or a custom path

## If a team-name argument is provided

Use it as the team name and skip asking for it. Still ask all other design questions.

## Quick Start Templates

If the user wants to skip the wizard, offer these templates:
- `software-dev` — 5-agent dev team (researcher, architect, developer, reviewer, tester)
- `marketing` — 4-agent marketing team (researcher, strategist, copywriter, reviewer)
- `devops` — 4-agent devops team (infra-engineer, security-auditor, monitor, incident-responder)

Copy from `${CLAUDE_PLUGIN_ROOT}/assets/team-packs/` and let the user customize.
