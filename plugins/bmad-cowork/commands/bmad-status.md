---
name: bmad-status
description: Show current BMAD project status — active phase, completed artifacts, team activity, and next steps.
allowed-tools: ["Read", "Glob", "Grep"]
---

# BMAD Project Status Dashboard

You are generating a status report for the current BMAD project.

## Step 1: Read Project State

Read `.bmad/config.json` to get the project configuration. If the file does not exist, tell the user "No BMAD project found in this directory. Use `/bmad-start` to initialize one."

## Step 2: Read Phase History

Read `.bmad/phase-log.json` for phase transition history.

## Step 3: Scan Artifacts

Check which artifacts exist by scanning `docs/`:

- `docs/brief.md` — check if it has content beyond the placeholder comment
- `docs/prd.md` — check if it has content beyond the placeholder comment
- `docs/architecture/` — count files present, check for `index.md`
- `docs/stories/` — count story files, check their Status fields (Draft, In Progress, Complete, QA Pass, QA Fail)
- `docs/quick/` — count any quick-flow outputs

## Step 4: Compute Progress

For each phase, determine status:
- **completed**: required artifacts exist with real content
- **active**: this is the currentPhase in config.json
- **pending**: not yet started

For implementation phase, parse story files to count:
- Total stories
- Stories completed (Status: Complete or QA Pass)
- Stories in progress (Status: In Progress)
- Stories failed QA (Status: QA Fail)

## Step 5: Determine Next Action

Based on current phase and artifact state, recommend the next action:
- If analysis active and no brief: "Create or brainstorm the project brief"
- If analysis active and brief exists: "Review brief and advance to Planning"
- If planning active and no PRD: "Create the PRD with epics and stories"
- If planning active and PRD exists: "Review PRD and advance to Solutioning"
- If solutioning active and no architecture index: "Create architecture documents"
- If solutioning active and architecture exists: "Review architecture and advance to Implementation"
- If implementation active: "Continue sprint — [N] stories remaining"

## Step 6: Format Output

Display a clean status dashboard:

```
BMAD Project: [name]
Objective: [objective]
Phase: [current] ([X/4] complete)

  [icon] Analysis       — [artifact list or "not started"]
  [icon] Planning       — [artifact list or "not started"]
  [icon] Solutioning    — [artifact list or "not started"]
  [icon] Implementation — [story progress or "not started"]

Next: [recommended action]
```

Use these status icons:
- Completed phase: checkmark
- Active phase: cycle arrows
- Pending phase: hourglass
