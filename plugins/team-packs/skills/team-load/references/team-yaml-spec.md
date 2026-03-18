# team.yaml Complete Specification

## Required Fields

```yaml
name: string              # Team identifier (kebab-case)
description: string       # What the team does (1-2 sentences)

orchestrator:
  file: string            # Path to orchestrator .md file (relative to team pack root)
  model: string           # Model: opus | sonnet | haiku
```

## Agent Definition

```yaml
agents:
  - name: string          # Agent identifier (kebab-case, unique within team)
    file: string          # Path to agent .md file (relative to team pack root)
    model: string         # Model: opus | sonnet | haiku
    tools: [string]       # List of generic tool names
    reports_to: string    # Agent name this one reports to (usually "orchestrator")
    collaborates_with:    # Optional: peer agents for direct communication
      - string
```

## Optional Fields

```yaml
version: string           # Semantic version of the team pack
shared_rules: [string]    # Paths to shared rule files
workflows: [string]       # Paths to workflow YAML files

tool_mappings:
  claude_code:             # Claude Code tool name mappings
    generic_name: ClaudeToolName
  openai:                  # OpenAI Assistants API mappings
    generic_name: openai_tool_name
  generic:                 # Fallback generic mappings
    generic_name: generic_tool_name
```

## Agent .md File Format

```markdown
---
name: agent-name
role: Human-readable role title
description: What this agent does (1-2 sentences)
model_preference: opus | sonnet | haiku
tools:
  - generic_tool_name_1
  - generic_tool_name_2
reports_to: orchestrator
collaborates_with:
  - other-agent-name
---

System prompt body goes here. This becomes the agent's instructions.

## Your Role
Define what the agent does.

## Communication Protocol
How the agent communicates with teammates.
```

## Workflow .yaml Format

```yaml
name: workflow-name
description: What this workflow does
trigger: "regex pattern matching user requests"

phases:
  - name: phase-name
    agent: agent-name           # Which agent handles this phase
    task: |                     # Task description (supports {{variable}} interpolation)
      Describe what to do.
      Can reference outputs: {{previous-output-name}}
    output: output-name         # Name for this phase's output (referenced by later phases)
    depends_on: [phase-name]    # Phases that must complete first
    parallel_with: [phase-name] # Phases that can run concurrently
    requires_approval: false    # If true, pause for human approval
    timeout: 5m                 # Optional timeout
```

## Complete Example

```yaml
name: software-dev-team
version: "1.0"
description: Full-stack software development team with TDD and code review

orchestrator:
  file: orchestrator.md
  model: opus

agents:
  - name: researcher
    file: agents/researcher.md
    model: sonnet
    tools: [file_read, web_search, file_search, content_search]
    reports_to: orchestrator

  - name: developer
    file: agents/developer.md
    model: opus
    tools: [file_read, file_write, file_edit, shell, content_search]
    reports_to: orchestrator
    collaborates_with: [reviewer, tester]

  - name: reviewer
    file: agents/reviewer.md
    model: sonnet
    tools: [file_read, content_search, shell]
    reports_to: orchestrator
    collaborates_with: [developer]

  - name: tester
    file: agents/tester.md
    model: sonnet
    tools: [file_read, file_write, shell]
    reports_to: orchestrator
    collaborates_with: [developer]

shared_rules:
  - rules/coding-standards.md
  - rules/communication.md

workflows:
  - workflows/build-feature.yaml
  - workflows/fix-bug.yaml

tool_mappings:
  claude_code:
    file_read: Read
    file_write: Write
    file_edit: Edit
    shell: Bash
    web_search: WebSearch
    file_search: Glob
    content_search: Grep
  openai:
    file_read: file_search
    shell: code_interpreter
    web_search: web_search
  generic:
    file_read: read_file
    file_write: write_file
    file_edit: edit_file
    shell: execute_command
    web_search: web_search
```
