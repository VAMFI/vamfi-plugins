---
name: BMAD Phase Orchestration
description: This skill activates when the user discusses BMAD methodology, project phases, agent coordination, phase gates, workflow routing, or asks about "which BMAD agent", "what phase am I in", "BMAD workflow", "phase transition", "agent handoff". Provides knowledge about BMAD's 4-phase methodology and 9 specialized agents.
version: 1.0.0
---

# BMAD Phase Orchestration

## The 4 BMAD Phases

BMAD projects follow a strict four-phase lifecycle. Each phase has a primary agent, required artifacts, and a gate that must be satisfied before the next phase begins.

### Phase 1: Analysis

- **Agent**: mary-analyst
- **Purpose**: Understand the problem space, target users, market landscape, and project constraints
- **Artifacts**: `docs/brief.md`
- **Activities**: Stakeholder interviews, competitive analysis, user research synthesis, problem framing
- **Gate**: `docs/brief.md` must contain a substantive project brief with problem statement, target audience, and key features

### Phase 2: Planning

- **Agent**: john-pm (with sally-ux for UX-heavy projects)
- **Purpose**: Translate analysis into a structured product plan with epics, stories, and priorities
- **Artifacts**: `docs/prd.md`
- **Activities**: Feature prioritization, epic decomposition, MVP scoping, requirement specification
- **Gate**: `docs/prd.md` must contain at least one epic with defined stories

### Phase 3: Solutioning

- **Agent**: winston-architect
- **Purpose**: Design the technical architecture that satisfies the PRD requirements
- **Artifacts**: `docs/architecture/index.md` and supporting docs
- **Activities**: Tech stack selection, system design, API design, data modeling, security planning
- **Gate**: `docs/architecture/index.md` must exist with architecture overview and tech decisions

### Phase 4: Implementation

- **Agents**: bob-sm (coordination), james-dev (coding), quinn-qa (testing)
- **Purpose**: Build the product story-by-story with continuous QA
- **Artifacts**: `docs/stories/*.md` and source code
- **Activities**: Story creation, development, code review, QA validation, bug fixing
- **Gate**: All stories reach "QA Pass" status

## The 9 BMAD Agents

| Agent | Role | Primary Phase | Responsibilities |
|-------|------|---------------|------------------|
| mary-analyst | Business Analyst | Analysis | Research, brief creation, problem framing |
| john-pm | Product Manager | Planning | PRD, epics, prioritization, MVP scope |
| sally-ux | UX Designer | Planning | User flows, wireframes, interaction design |
| winston-architect | Architect | Solutioning | System design, tech stack, API design |
| bob-sm | Scrum Master | Implementation | Story creation, sprint coordination, context extraction |
| james-dev | Developer | Implementation | Code implementation, debugging, dev records |
| quinn-qa | QA Engineer | Implementation | Testing, validation, bug reports |
| barry-quick | Quick Flow | Any | Rapid prototyping, quick tasks, bypasses full BMAD |
| paige-writer | Technical Writer | Any | Documentation, user guides, API docs |

## Phase Gates

Phase gates prevent premature advancement. A phase gate checks:

1. **Artifact existence**: The required files must exist
2. **Content quality**: Files must contain substantive content (not just placeholders)
3. **Completeness**: Key sections must be populated (e.g., PRD must have at least one epic)

Gates are enforced in `/bmad-sprint` and should be checked manually when working phase-by-phase.

## Agent Handoff Patterns

When one phase completes and the next begins:

1. The completing agent summarizes its work and key decisions
2. The phase transition is logged to `.bmad/phase-log.json`
3. `.bmad/config.json` is updated with new phase status
4. The next agent reads all prior artifacts as input context
5. The next agent begins its phase-specific work

### Key handoff data flows:
- **Analysis → Planning**: Brief informs epic structure and feature priorities
- **Planning → Solutioning**: PRD requirements drive architecture decisions
- **Solutioning → Implementation**: Architecture docs are extracted into story Dev Notes
- **Within Implementation**: Story results feed into subsequent story context

## Quick Flow vs Full BMAD

Use **barry-quick** (Quick Flow) when:
- The task is small and well-defined (< 1 day of work)
- No cross-cutting architecture decisions are needed
- The user wants a rapid prototype or proof-of-concept
- The change is isolated to a single component

Use **full BMAD** when:
- The project is greenfield or involves significant new architecture
- Multiple stakeholders need alignment
- Quality gates and QA validation are important
- The work spans multiple epics or stories

## Cowork Team Coordination

BMAD leverages the Cowork framework for multi-agent coordination:

- **SendMessage**: Agents communicate context, handoffs, and blockers
- **TaskCreate / TaskUpdate**: Work items are tracked as tasks with ownership
- **Agent tool**: Spawns specialized agents for phase execution
- Agents share the project filesystem as the source of truth — artifacts in `docs/` are the coordination mechanism
