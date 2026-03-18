---
name: team-load
description: Load a team pack from a folder and create a Claude Code team with all agents
argument-hint: "<path-to-team-pack>"
allowed-tools: ["Read", "Write", "Bash", "Glob"]
---

# Load Team Pack

Load a team pack from a folder path and bootstrap it as a Claude Code agent team.

## Process

1. **Validate the path**: Check that the provided path exists and contains a `team.yaml` file
2. **Parse team.yaml**: Read and parse the team manifest
3. **Load shared rules**: Read all files listed in `shared_rules` and concatenate them
4. **Load orchestrator prompt**: Read the orchestrator's `.md` file, strip YAML frontmatter, append shared rules
5. **Replace template variables**: Replace `{{TEAM_ROSTER}}` in orchestrator prompt with the actual agent list from team.yaml
6. **Map tools**: Use the `tool_mappings.claude_code` section to translate generic tool names to Claude Code tool names
7. **Create the team**: Use TeamCreate with the team name and description from team.yaml
8. **Spawn agents**: For each agent in team.yaml:
   - Read the agent's `.md` file
   - Strip YAML frontmatter to get the system prompt
   - Append shared rules to the prompt
   - Spawn as a teammate using the Task tool with team_name, mapped tools, and model from config
9. **Report**: Show the user what was loaded — team name, agent count, available workflows

## If no path is provided

Check these locations for team packs:
1. `./team-packs/` in the current working directory
2. `~/.claude/team-packs/` for globally saved packs
3. The plugin's built-in packs at `${CLAUDE_PLUGIN_ROOT}/assets/team-packs/`

List all found team packs and ask the user which one to load.

## If path points to a built-in pack name

Check if the name matches a built-in team pack (software-dev-team, marketing-team, devops-team) and load from the plugin's assets directory.

## Output Format

```
Team Pack Loaded: {name}
Description: {description}
Agents: {count} spawned
  - {agent-name} ({model}) — {role}
  - ...
Workflows Available: {count}
  - {workflow-name}: {description}
  - ...

Use SendMessage to coordinate agents, or run a workflow with /team-workflow {name}
```
