---
name: team-save
description: This skill should be used when the user asks to "save the current team", "export team config", "capture team setup", "create team pack from running team", "save team as reusable pack", or wants to persist a running Claude Code team as a portable folder configuration.
version: 1.0.0
---

# Team Save — Capture Running Teams

## Purpose

Capture a running Claude Code team's configuration and export it as a reusable team pack folder that can be loaded later or shared with others.

## When to Use

This skill activates when:
- User wants to save a running team for later reuse
- User asks to export or capture a team configuration
- User wants to create a team pack from an existing team
- The `/team-save` command is invoked

## Save Process

### Step 1: Find Running Teams

Read team configs from `~/.claude/teams/`:

```bash
ls ~/.claude/teams/
```

For each team, read `config.json` to get team details. If multiple teams exist, present a list and ask which one to save.

### Step 2: Extract Team Configuration

From the team's `config.json`, extract:

- **Team metadata**: name, description
- **Members**: For each member (excluding team-lead):
  - name
  - agentType
  - model
  - prompt (the full system prompt)
  - color
  - tools (if specified)

### Step 3: Generate team.yaml

Create the manifest from extracted data:

```yaml
name: {team-name}
version: "1.0"
description: {team-description}

orchestrator:
  file: orchestrator.md
  model: {lead-model}

agents:
  - name: {member-name}
    file: agents/{member-name}.md
    model: {member-model}
    tools: [file_read, file_write, shell]  # Default generic tools
    reports_to: orchestrator

shared_rules:
  - rules/communication.md

tool_mappings:
  claude_code:
    file_read: Read
    file_write: Write
    file_edit: Edit
    shell: Bash
    web_search: WebSearch
    file_search: Glob
    content_search: Grep
  generic:
    file_read: read_file
    file_write: write_file
    shell: execute_command
```

### Step 4: Generate Agent .md Files

For each team member, create `agents/{name}.md`:

```markdown
---
name: {name}
role: {extracted-from-prompt-or-agentType}
description: {first-sentence-of-prompt}
model_preference: {model}
tools:
  - file_read
  - file_write
  - shell
reports_to: orchestrator
---

{full-prompt-from-config.json}
```

**Prompt extraction rules:**
- If the member has an inline `prompt` field in config.json, use it as the body
- Strip any "You are X on team Y" prefix — this gets regenerated at load time
- Preserve all task-specific instructions, constraints, and standards

### Step 5: Generate Orchestrator .md

Create `orchestrator.md` from the team-lead's configuration:

```markdown
---
name: orchestrator
role: Team Lead & Coordinator
description: Coordinates the {team-name} team
model_preference: {lead-model}
---

You are the **Orchestrator** — the team lead coordinating a multi-agent team.

## Your Team
{{TEAM_ROSTER}}

## Responsibilities
1. Decompose incoming requests into tasks
2. Assign tasks to specialist agents
3. Monitor progress and unblock agents
4. Synthesize results into final output
5. Quality gate — review before marking complete
```

### Step 6: Generate Default Rules

Create `rules/communication.md`:

```markdown
# Communication Protocol

## Reporting
- Report completion to your `reports_to` agent with a summary
- Report blockers immediately with details
- Include file paths in all status updates

## Message Format
- Lead with status: DONE, BLOCKED, QUESTION, UPDATE
- Keep messages concise
- Include actionable details
```

### Step 7: Write to Disk

Default location: `~/.claude/team-packs/{name}/`
Create all directories and write all files.

### Step 8: Report

Show what was saved, the file listing, and reload instructions.

## Limitations

- Cannot capture task history (tasks are ephemeral)
- Agent context windows are not saved (they're session-scoped)
- Running state (in-progress work) is not captured
- Tool permissions are approximated (not exact Claude Code tool names)

## Additional Resources

For team.yaml specification details, see the team-load skill's `references/team-yaml-spec.md`.
