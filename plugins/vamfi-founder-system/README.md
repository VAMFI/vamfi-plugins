# Vamfi Founder System

A Claude Code / Cowork plugin scaffold for solo founders and small founding teams.

## What this plugin is for

This plugin turns Claude into a practical founder operating system focused on:

- opportunity selection
- customer pain clarity
- research and synthesis
- weekly planning
- daily execution discipline
- decision memos
- launch planning
- founder updates and briefings

It is intentionally biased toward **validation and revenue-generating action**, not endless brainstorming.

## Important implementation note

This scaffold targets the **documented Claude Code plugin format**:
- `.claude-plugin/plugin.json`
- `skills/<name>/SKILL.md`
- `agents/*.md`
- `styles/*.md`

Cowork support articles say plugins can bundle skills, connectors, and sub-agents. However, the public Claude Code plugin schema currently documents skills, agents, hooks, MCP servers, output styles, and LSP servers. This scaffold therefore implements the documented parts directly and leaves connector attachment to Cowork customization after install.

## Included slash commands

After loading the plugin, these commands will be available:

- `/vamfi-founder-system:daily-focus`
- `/vamfi-founder-system:weekly-review`
- `/vamfi-founder-system:opportunity-thesis`
- `/vamfi-founder-system:customer-research-sprint`
- `/vamfi-founder-system:launch-plan`
- `/vamfi-founder-system:decision-memo`
- `/vamfi-founder-system:founder-brief`

## Included subagents

- `strategic-analyst`
- `market-researcher`
- `execution-operator`
- `accountability-coach`

## Included output style

- `Founder Operator`

## Suggested Cowork connectors to attach after install

Use Cowork's Customize flow to attach the connectors most useful for your workflow:

- Google Drive / local files for notes, decks, and docs
- Gmail for inbox triage and customer communication drafts
- Google Calendar for scheduling and founder planning
- Slack for team signals and customer feedback
- Notion / Linear / CRM tools if you use them

## Recommended automations in Cowork

Use the plugin skills together with `/schedule` in Cowork for:

- **Morning founder brief**: top priorities, calendar constraints, unread important signals, current risks
- **Weekly operating review**: wins, misses, blockers, next week's top bets
- **Competitor pulse**: changes in pricing, messaging, launches, and fundraising
- **Customer signal digest**: summarize emails, interviews, CRM notes, and support issues
- **Experiment scoreboard**: review running experiments and update a weekly scorecard

## Local development with Claude Code

Validate the plugin:

```bash
claude plugin validate ./vamfi-founder-system
```

Load it without installation:

```bash
claude --plugin-dir ./vamfi-founder-system
```

Reload after edits:

```text
/reload-plugins
```

## Marketplace install flow

If you package this in a marketplace:

```text
/plugin marketplace add ./vamfi-founder-marketplace
/plugin install vamfi-founder-system@vamfi-founder-tools
```

## Design philosophy

1. Turn vague ideas into testable theses.
2. Prefer evidence over enthusiasm.
3. Convert research into a ranked action plan.
4. Treat time and attention as scarce founder capital.
5. End every workflow with next actions, owners, dates, and decision criteria.

## Next customization steps

1. Replace "Vamfi" branding if needed.
2. Adjust the command set for your exact operating cadence.
3. Add project-specific examples and templates to each skill folder.
4. Add MCP servers or Cowork connectors after install.
5. Add a marketplace if you want team distribution.
