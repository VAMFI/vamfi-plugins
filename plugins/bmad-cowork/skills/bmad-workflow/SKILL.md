---
name: BMAD Workflow Execution
description: This skill activates when the user asks about "story creation", "sprint planning", "story development cycle", "story validation", "code review workflow", "dev story", "create next story", "story template", or needs guidance on BMAD's implementation workflow patterns.
version: 1.0.0
---

# BMAD Workflow Execution

## Story File Structure

Every BMAD story lives in `docs/stories/` and follows a standard template with these sections:

1. **Status**: Draft | Ready | In Progress | In Review | QA Pass | QA Fail
2. **Story**: User story in "As a [role], I want [capability] so that [benefit]" format
3. **Acceptance Criteria**: Checkbox list of verifiable conditions
4. **Tasks / Subtasks**: Breakdown of implementation work
5. **Dev Notes**: Extracted architecture context with source citations
6. **Testing Requirements**: Unit and integration test expectations
7. **Dev Agent Record**: Debug log, completion notes, file list, change log
8. **QA Results**: Populated exclusively by quinn-qa

Stories are numbered by epic and sequence: `story-E1.S1.md`, `story-E1.S2.md`, etc.

## The Story Cycle

The implementation phase runs a repeating cycle for each story:

### 1. Story Creation (bob-sm)

Bob reads the PRD and architecture docs, then:
- Creates a new story file from the template
- Writes the user story and acceptance criteria based on the PRD epic
- Breaks down tasks and subtasks
- Extracts relevant architecture context into Dev Notes (see BMAD Context Extraction skill)
- Sets status to **Ready**

### 2. Development (james-dev)

James picks up the next Ready story, then:
- Reads the full story file, focusing on Dev Notes for architectural context
- Implements code changes following the tasks list
- Checks off completed tasks
- Records work in the Dev Agent Record:
  - **Debug Log**: Issues encountered and how they were resolved
  - **Completion Notes**: Summary of what was built and any deviations
  - **File List**: All files created or modified
  - **Change Log**: Chronological list of changes made
- Sets status to **In Review**

### 3. QA Review (quinn-qa)

Quinn picks up In Review stories, then:
- Validates each acceptance criterion against the implementation
- Runs tests if they exist
- Checks code quality and adherence to architecture
- Writes QA Results with pass/fail per criterion and any issues found
- Sets status to **QA Pass** or **QA Fail**

### 4. Fix Loop

If QA Fail:
- Quinn's feedback in QA Results becomes james-dev's next input
- James reads the QA Results, fixes the issues, updates Dev Agent Record
- James sets status back to **In Review**
- Quinn re-reviews
- Loop continues until **QA Pass**

## Sprint Planning Process

Before implementation begins, bob-sm plans the sprint:

1. Read all epics from `docs/prd.md`
2. Determine story order based on dependencies and priority
3. Create story files for the first batch (typically one epic at a time)
4. Ensure each story has complete Dev Notes with architecture context
5. Estimate relative complexity (S/M/L) noted in the story header

## Permission Model

Each agent can only edit specific sections of a story file:

| Agent | Can Edit |
|-------|----------|
| bob-sm | Story, Acceptance Criteria, Tasks, Dev Notes, Status (to Ready) |
| james-dev | Tasks (checkboxes), Dev Agent Record, Status (to In Review) |
| quinn-qa | QA Results, Status (to QA Pass or QA Fail) |

No agent should modify sections owned by another agent except through the defined handoff (status change).

## Story Validation Checklist

Before a story is marked Ready, bob-sm validates:

- [ ] User story follows "As a / I want / So that" format
- [ ] At least 2 acceptance criteria are defined
- [ ] Tasks are broken down to actionable steps
- [ ] Dev Notes contain relevant architecture extracts with source citations
- [ ] Testing requirements are specified
- [ ] No external dependencies are unresolved

## Blocking Conditions for Developers

James-dev should NOT begin a story if:
- Status is not "Ready"
- Dev Notes section is empty (no architecture context)
- The story depends on a prior story that has not reached QA Pass
- Required infrastructure or APIs referenced in the story do not exist yet

When blocked, james-dev should message bob-sm via SendMessage to resolve the blocker.
