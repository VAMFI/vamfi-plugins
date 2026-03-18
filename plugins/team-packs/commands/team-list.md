---
name: team-list
description: List all saved team packs and built-in templates
allowed-tools: ["Read", "Bash", "Glob"]
---

# List Team Packs

Show all available team packs from all sources.

## Process

1. **Check user-saved packs**: Scan `~/.claude/team-packs/` for folders containing `team.yaml`
2. **Check project-local packs**: Scan `./team-packs/` in the current working directory
3. **Check built-in packs**: Scan `${CLAUDE_PLUGIN_ROOT}/assets/team-packs/` for bundled templates
4. **For each pack found**, read `team.yaml` and extract:
   - Name
   - Description
   - Agent count
   - Workflow count

## Output Format

```
Saved Team Packs (~/.claude/team-packs/):
  1. my-dev-team — "Full-stack dev team with TDD" (5 agents, 3 workflows)
  2. content-team — "Content creation pipeline" (4 agents, 2 workflows)

Project Team Packs (./team-packs/):
  (none found)

Built-in Templates:
  1. software-dev-team — "Full-stack software development" (5 agents, 2 workflows)
  2. marketing-team — "Marketing campaign team" (4 agents, 2 workflows)
  3. devops-team — "DevOps and SRE team" (4 agents, 3 workflows)

Load a pack: /team-load <name-or-path>
Create new: /team-new
```

If no packs found anywhere, suggest creating one with `/team-new` or loading a built-in with `/team-load software-dev-team`.
