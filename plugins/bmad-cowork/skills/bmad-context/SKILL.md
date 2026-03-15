---
name: BMAD Context Extraction
description: This skill activates when the user asks about "architecture extraction", "story context", "dev notes", "source citations", "context bridge", "relevant architecture", or needs guidance on how BMAD extracts and embeds relevant architecture context into story files for developers.
version: 1.0.0
---

# BMAD Context Extraction

## Why Context Extraction Matters

Architecture documents can span thousands of lines across many files. Developers working on a single story should not need to read 100% of the architecture to be effective. Context extraction solves this by:

- Reducing cognitive load — developers see only what is relevant to their story
- Preventing drift — extracted context includes source citations so decisions can be traced
- Enabling parallel work — each story is self-contained with embedded context
- Maintaining accuracy — citations let developers verify context against the source

## How Bob (SM) Extracts Context

When creating a story, bob-sm follows this process:

### 1. Identify Relevant Architecture

Read the story's acceptance criteria and tasks to determine which architectural concerns apply:
- Which system components are touched?
- Which APIs or data models are involved?
- What patterns or conventions must be followed?
- Are there security, performance, or scaling constraints?

### 2. Extract Specific Sections

From the architecture docs in `docs/architecture/`, extract ONLY the sections relevant to this story. Do not copy entire documents. Target:

- Specific API endpoint definitions the story implements
- Data model schemas the story creates or modifies
- Authentication/authorization rules if the story touches protected resources
- Naming conventions and code patterns from the architecture style guide
- Integration points with other components

### 3. Write Dev Notes with Citations

Every extracted block in Dev Notes must include a source citation:

```markdown
## Dev Notes

### API Design
The user endpoint follows RESTful conventions with JWT auth:
- POST /api/users — create new user
- GET /api/users/:id — retrieve user profile
- Auth: Bearer token required, validated via middleware
[Source: architecture/api-design.md#user-endpoints]

### Data Model
User schema includes: id (UUID), email (unique), name, created_at, updated_at
Password is stored as bcrypt hash, never returned in API responses.
[Source: architecture/data-model.md#user-schema]

### Conventions
- Use repository pattern for data access
- All endpoints return { data, error, meta } envelope
[Source: architecture/index.md#coding-conventions]
```

## Source Citation Format

Citations follow this pattern:
```
[Source: architecture/<filename>.md#<section-heading>]
```

- `filename` is the architecture doc file name
- `section-heading` is the nearest heading above the extracted content, lowercased with hyphens
- Multiple sources can be cited per block

Examples:
- `[Source: architecture/index.md#tech-stack]`
- `[Source: architecture/api-design.md#error-handling]`
- `[Source: architecture/data-model.md#relationships]`
- `[Source: architecture/auth.md#jwt-flow]`

## What Goes in Dev Notes vs Architecture Docs

| In Dev Notes | In Architecture Docs |
|---|---|
| Subset of architecture relevant to THIS story | Complete system architecture |
| Specific API endpoints being implemented | All API endpoints across the system |
| Data models being created/modified | Full data model with all entities |
| Relevant conventions and patterns | Complete style guide and conventions |
| Cross-references to related stories | No story references |

Dev Notes are a **lens** into the architecture, not a copy. They should be concise and actionable.

## Cross-Referencing Between Stories

When a story builds on work from a previous story, bob-sm should include:

```markdown
### Previous Story Context
Story E1.S2 implemented the user authentication endpoint. The auth middleware
created there should be reused for this story's protected routes.
[Source: stories/story-E1.S2.md#completion-notes]
```

This creates a chain of context that helps developers understand the evolving codebase without re-reading all prior stories.

## Context Freshness

Architecture documents may change during the project. Context extraction should be re-done when:

- The architecture doc's last modified date is newer than the story's creation date
- A prior story's implementation caused architecture changes
- The architect (winston-architect) has flagged specific docs as updated

Bob-sm should check file modification timestamps before extracting context for new stories. If architecture has changed since the last story was created, re-extract affected sections for accuracy.
