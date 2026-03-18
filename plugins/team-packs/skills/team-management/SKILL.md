---
name: team-management
description: This skill should be used when the user asks to "list team packs", "show saved teams", "validate a team pack", "check team pack structure", "team pack details", "what teams do I have", or needs to manage, inspect, or validate team pack configurations.
version: 1.0.0
---

# Team Management — List, Inspect, Validate

## Purpose

Manage saved team packs: list available packs, show details, validate structure, and compare configurations.

## When to Use

This skill activates when:
- User asks what team packs are available
- User wants details about a specific team pack
- User wants to validate a team pack's structure
- User asks to delete or rename a team pack
- The `/team-list` command is invoked

## Operations

### List Team Packs

Scan all team pack sources and display:

**Sources (in priority order):**
1. `~/.claude/team-packs/` — User-saved packs
2. `./team-packs/` — Project-local packs
3. `${CLAUDE_PLUGIN_ROOT}/assets/team-packs/` — Built-in templates

**For each pack**, read `team.yaml` and show:
- Name and description
- Agent count and names
- Workflow count
- Version (if specified)

### Inspect Team Pack

Show full details of a specific team pack:

1. Read `team.yaml` — show all fields
2. List agents with their roles, models, and tool lists
3. List workflows with phase summaries
4. List shared rules
5. Show tool mappings
6. Show the orchestrator's communication structure

### Validate Team Pack

Check a team pack folder for correctness:

**Required checks:**
- [ ] `team.yaml` exists and is valid YAML
- [ ] `orchestrator.file` points to an existing file
- [ ] Each agent's `file` points to an existing file
- [ ] Agent names are unique
- [ ] Agent names are kebab-case
- [ ] `reports_to` references exist (either "orchestrator" or another agent name)
- [ ] `collaborates_with` references exist
- [ ] Shared rules files exist
- [ ] Workflow files exist and are valid YAML
- [ ] Tool mappings include at least `claude_code` section

**Optional checks:**
- [ ] Agent .md files have valid YAML frontmatter
- [ ] Orchestrator.md contains `{{TEAM_ROSTER}}` placeholder
- [ ] Workflows have valid `depends_on` references
- [ ] No circular dependencies in workflows

**Output format:**
```
Validating team pack: {name}

Required:
  [PASS] team.yaml exists and is valid
  [PASS] orchestrator.md exists
  [PASS] All agent files exist
  [FAIL] Agent "my agent" is not kebab-case → rename to "my-agent"
  ...

Optional:
  [WARN] orchestrator.md missing {{TEAM_ROSTER}} placeholder
  [PASS] No circular workflow dependencies
  ...

Result: {PASS|FAIL} ({pass-count}/{total-count} checks passed)
```

### Compare Team Packs

Compare two team packs side by side:
- Agent differences (added, removed, changed)
- Model differences
- Tool differences
- Workflow differences
- Rule differences

### Delete Team Pack

Remove a saved team pack from `~/.claude/team-packs/`:
1. Confirm with user before deleting
2. Only delete from user-saved location (never built-in templates)
3. Show what will be deleted

### Rename Team Pack

Rename a team pack folder and update `name` in team.yaml:
1. Rename the directory
2. Update `name` field in team.yaml
3. Report the change
