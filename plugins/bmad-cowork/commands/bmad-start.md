---
name: bmad-start
description: Initialize a BMAD Cowork project — creates the project structure, spawns the agent team, and begins the first phase. Use this to start any new BMAD project from scratch.
argument-hint: "[project name or objective]"
allowed-tools: ["Read", "Write", "Glob", "Bash", "Agent", "Edit"]
---

# BMAD Project Initialization

You are initializing a new BMAD (Business Mission Analysis & Development) Cowork project.

## Step 1: Gather Input

If the user did not provide a project name and objective as arguments, ask for:
- **Project name** (short, kebab-case friendly)
- **One-line objective** describing what the project should accomplish

Do not proceed until both are known.

## Step 2: Create Project Structure

Create the following directory structure and placeholder files:

```
docs/
  brief.md
  prd.md
  architecture/
  stories/
  quick/
.bmad/
  config.json
  phase-log.json
```

For `docs/brief.md`, write:
```markdown
# Project Brief: [project name]

<!-- This file will be populated by mary-analyst during the Analysis phase -->
```

For `docs/prd.md`, write:
```markdown
# Product Requirements Document: [project name]

<!-- This file will be populated by john-pm during the Planning phase -->
```

## Step 3: Write Configuration

Write `.bmad/config.json` with the following structure (fill in project name, objective, and current ISO date):

```json
{
  "project": "[name]",
  "objective": "[objective]",
  "created": "[ISO date]",
  "currentPhase": "analysis",
  "phases": {
    "analysis": {
      "status": "active",
      "agent": "mary-analyst",
      "artifacts": ["brief.md"],
      "startedAt": "[ISO date]"
    },
    "planning": {
      "status": "pending",
      "agent": "john-pm",
      "artifacts": ["prd.md"],
      "gate": true
    },
    "solutioning": {
      "status": "pending",
      "agent": "winston-architect",
      "artifacts": ["architecture/"],
      "gate": true
    },
    "implementation": {
      "status": "pending",
      "agent": "bob-sm",
      "artifacts": ["stories/"],
      "gate": true
    }
  },
  "team": [
    "mary-analyst",
    "john-pm",
    "sally-ux",
    "winston-architect",
    "bob-sm",
    "james-dev",
    "quinn-qa",
    "barry-quick",
    "paige-writer"
  ]
}
```

Write `.bmad/phase-log.json` as an empty array:
```json
[]
```

## Step 4: Confirm to User

Tell the user:

> BMAD project '[name]' initialized. Phase 1 (Analysis) is active — mary-analyst is ready.
>
> You can:
> - Ask me to brainstorm, research the market, or create a project brief to begin
> - Use `/bmad-sprint` to run all phases autonomously
> - Use `/bmad-status` to check progress at any time
