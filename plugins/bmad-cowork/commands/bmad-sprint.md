---
name: bmad-sprint
description: Run a BMAD implementation sprint autonomously — spawns the full agent team as Cowork teammates and orchestrates phase-by-phase execution with handoffs.
argument-hint: "[phase to start from: analysis|planning|solutioning|implementation|auto]"
allowed-tools: ["Read", "Write", "Glob", "Grep", "Bash", "Edit", "Agent"]
---

# BMAD Sprint Execution

You are orchestrating an autonomous BMAD sprint that runs through project phases with specialized agents.

## Step 1: Read Current State

Read `.bmad/config.json` to determine:
- Current phase
- Which phases are already completed
- Which artifacts already exist

If no `.bmad/config.json` exists, tell the user to run `/bmad-start` first and stop.

## Step 2: Determine Starting Phase

- If the user provided a phase argument (`analysis`, `planning`, `solutioning`, `implementation`), start from that phase
- If the user said `auto` or provided no argument, detect the right starting phase:
  - Check if `docs/brief.md` has real content → analysis is done
  - Check if `docs/prd.md` has real content → planning is done
  - Check if `docs/architecture/index.md` exists → solutioning is done
  - Start from the first incomplete phase

## Step 3: Execute Phases

Run each phase sequentially. For each phase, spawn the appropriate agent(s) using the Agent tool.

### Phase 1: Analysis (mary-analyst)

Spawn mary-analyst to:
1. Research the project objective and domain
2. Identify target users, competitors, and market context
3. Produce `docs/brief.md` with: project overview, problem statement, target audience, key features, success metrics, constraints

**Gate check**: `docs/brief.md` must exist with substantive content before advancing.

### Phase 2: Planning (john-pm + sally-ux)

Spawn john-pm to:
1. Read `docs/brief.md`
2. Create `docs/prd.md` with: product overview, user personas, epics breakdown, prioritized feature list, MVP scope, non-functional requirements
3. Define epics and stories at a high level

If the project has a UI component, also consider sally-ux input for UX flows.

**Gate check**: `docs/prd.md` must exist with at least one epic defined before advancing.

### Phase 3: Solutioning (winston-architect)

Spawn winston-architect to:
1. Read `docs/brief.md` and `docs/prd.md`
2. Create architecture documents in `docs/architecture/`:
   - `index.md` — architecture overview, system diagram, tech stack decisions
   - Component-specific docs as needed (e.g., `api-design.md`, `data-model.md`, `auth.md`)
3. Document technical decisions, patterns, and constraints

**Gate check**: `docs/architecture/index.md` must exist before advancing.

### Phase 4: Implementation (bob-sm, james-dev, quinn-qa)

Spawn bob-sm to orchestrate the implementation cycle:

1. **Story Creation** (bob-sm):
   - Read PRD and architecture docs
   - Create story files in `docs/stories/` using the story template
   - Extract relevant architecture context into Dev Notes with source citations
   - Set story status to "Ready"

2. **Development** (james-dev):
   - Pick up the next Ready story
   - Read the story file, especially Dev Notes for context
   - Implement the code changes
   - Update the Dev Agent Record section with debug log, file list, change log
   - Set story status to "In Review"

3. **QA Review** (quinn-qa):
   - Pick up In Review stories
   - Validate against acceptance criteria
   - Run tests if applicable
   - Write QA Results section
   - Set status to "QA Pass" or "QA Fail" with feedback

4. **Loop**: If QA Fail, james-dev fixes and resubmits. Continue until all stories pass.

## Step 4: Log Phase Transitions

After each phase completes, append to `.bmad/phase-log.json`:
```json
{
  "phase": "[phase name]",
  "status": "completed",
  "completedAt": "[ISO date]",
  "agent": "[primary agent]",
  "artifacts": ["list of files produced"]
}
```

Update `.bmad/config.json`:
- Set completed phase status to "completed"
- Set next phase status to "active"
- Update currentPhase

## Step 5: Sprint Summary

When all phases are complete (or the sprint is interrupted), provide a summary:
- Phases completed in this sprint
- Artifacts produced
- Stories implemented (if reached Phase 4)
- Any issues encountered or decisions made
- Recommended next steps
