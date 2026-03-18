---
name: team-save
description: Save a running team's configuration as a reusable team pack folder
argument-hint: "<name> [output-path]"
allowed-tools: ["Read", "Write", "Bash", "Glob"]
---

# Save Team as Team Pack

Capture a running Claude Code team's configuration and save it as a reusable team pack folder.

## Process

1. **Find the running team**: Look in `~/.claude/teams/` for the current team config
   - If multiple teams exist, list them and ask which one to save
   - Read the team's `config.json`

2. **Extract team metadata**:
   - Team name and description
   - All members with their agentId, name, model, prompt, tools

3. **Generate team.yaml**:
   - Map team members to the universal format
   - Create tool_mappings section with claude_code mappings (and generic placeholders for other runtimes)
   - Add shared_rules and workflows as empty arrays (user can add later)

4. **Generate agent .md files**:
   For each team member (excluding team-lead):
   - Create `agents/{name}.md` with YAML frontmatter
   - Extract the agent's prompt from config.json and use as the markdown body
   - Set model_preference, tools, reports_to fields in frontmatter

5. **Generate orchestrator.md**:
   - Use the team lead's configuration
   - Include `{{TEAM_ROSTER}}` placeholder in the team roster section
   - Add standard orchestrator coordination instructions

6. **Generate rules/communication.md**:
   - Create default communication protocol based on team structure

7. **Save to disk**:
   - Default location: `~/.claude/team-packs/{name}/`
   - Or user-specified output path
   - Create all directories and write all files

8. **Report**:
   - Show what was saved and where
   - Show file listing
   - Remind user they can customize the pack by editing the markdown files

## Arguments

- `<name>` (required): Name for the team pack (used as folder name)
- `[output-path]` (optional): Where to save. Defaults to `~/.claude/team-packs/{name}/`

## Output Format

```
Team Pack Saved: {name}
Location: {path}
Files created:
  - team.yaml
  - orchestrator.md
  - agents/{name-1}.md
  - agents/{name-2}.md
  - ...
  - rules/communication.md

To reload this team: /team-load {path}
To customize: edit the .md files in {path}/agents/
```
