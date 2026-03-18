---
name: team-load
description: This skill should be used when the user asks to "load a team pack", "bootstrap a team", "start a team from config", "use a saved team", "load team-pack", or wants to create a Claude Code team from a folder-based team pack configuration.
version: 1.0.0
---

# Team Load — Bootloader Skill

## Purpose

Load a team pack folder and bootstrap it as a running Claude Code agent team. Parse the universal team.yaml format, resolve agent definitions, inject shared rules, map tools, and spawn all agents.

## When to Use

This skill activates when:
- User asks to load, start, or bootstrap a team from a folder
- User references a team pack by name or path
- User wants to create a team from a saved configuration
- The `/team-load` command is invoked

## Team Pack Format

A team pack is a folder with this structure:

```
team-name/
├── team.yaml              # Required: team manifest
├── orchestrator.md        # Required: lead agent definition
├── agents/
│   ├── agent-1.md         # Agent definitions
│   └── agent-2.md
├── workflows/
│   └── workflow-1.yaml    # Task sequences
└── rules/
    └── standards.md       # Shared rules
```

## Bootload Process

### Step 1: Parse team.yaml

Read the manifest file. Required fields:

```yaml
name: team-name
version: "1.0"
description: What the team does

orchestrator:
  file: orchestrator.md
  model: opus

agents:
  - name: agent-name
    file: agents/agent-name.md
    model: sonnet
    tools: [file_read, file_write, shell]
    reports_to: orchestrator

shared_rules:
  - rules/standards.md

tool_mappings:
  claude_code:
    file_read: Read
    file_write: Write
    file_edit: Edit
    shell: Bash
    web_search: WebSearch
    file_search: Glob
    content_search: Grep
```

### Step 2: Load Shared Rules

Read each file listed in `shared_rules` and concatenate into a single rules block.

### Step 3: Load Orchestrator

1. Read the orchestrator's `.md` file
2. Strip YAML frontmatter (everything between `---` markers)
3. Build the team roster string from `agents` list
4. Replace `{{TEAM_ROSTER}}` in the prompt with the roster
5. Append shared rules under `## Shared Rules` heading

### Step 4: Load Agent Definitions

For each agent in `agents` list:
1. Read the agent's `.md` file from the path in `file`
2. Strip YAML frontmatter, keep body as system prompt
3. Append shared rules under `## Shared Rules` heading
4. Map tools using `tool_mappings.claude_code`

### Step 5: Create Claude Code Team

```
TeamCreate({
  team_name: config.name,
  description: config.description
})
```

### Step 6: Spawn Agents

For each agent, spawn as a teammate:

```
Task({
  team_name: config.name,
  name: agent.name,
  subagent_type: "general-purpose",
  model: agent.model,
  prompt: processedPrompt,
  run_in_background: true
})
```

Spawn ALL agents in a single message for parallel startup.

### Step 7: Report

Output a summary table:

| Agent | Model | Role | Status |
|-------|-------|------|--------|
| name  | model | role | spawned |

List available workflows and how to run them.

## Tool Mapping

The `tool_mappings` section in team.yaml translates generic tool names to runtime-specific ones:

| Generic | Claude Code | OpenAI | Generic |
|---------|------------|--------|---------|
| file_read | Read | file_search | read_file |
| file_write | Write | — | write_file |
| file_edit | Edit | — | edit_file |
| shell | Bash | code_interpreter | execute_command |
| web_search | WebSearch | web_search | web_search |
| file_search | Glob | — | find_files |
| content_search | Grep | — | search_content |

## Search Locations

When loading by name (not path), check in order:
1. `~/.claude/team-packs/{name}/`
2. `./team-packs/{name}/`
3. `${CLAUDE_PLUGIN_ROOT}/assets/team-packs/{name}/`

## Error Handling

- Missing team.yaml → error with message about required format
- Missing agent file → warn and skip that agent
- Missing shared rules file → warn and continue without rules
- Invalid YAML → error with parse details
- No tool_mappings → use generic tool names as-is

## Additional Resources

For the complete team.yaml specification, see `references/team-yaml-spec.md`.
For bootloader implementation examples, see `scripts/`.
