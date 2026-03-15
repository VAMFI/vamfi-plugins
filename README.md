# Vamfi Plugins for Claude Code

Open-source Claude Code plugin marketplace by **[Vamfi](https://vamfi.org)**.

## Installation

Add this marketplace to Claude Code:

```bash
claude plugins add-marketplace github:VAMFI/vamfi-plugins
```

Then install individual plugins:

```bash
claude plugins install vamfi-business-mentor
claude plugins install bmad-cowork
```

## Plugins

### vamfi-business-mentor

AI-powered business mentor providing strategic advice, proven frameworks, and actionable guidance for any business — from idea stage to scale.

**Features:**
- 4 auto-activating skills: Business Strategy, Startup Guidance, Operations Coaching, Financial Modeling
- 5 commands: `/mentor`, `/swot`, `/lean-canvas`, `/pitch-review`, `/business-plan`
- 3 specialized agents: Business Advisor, Market Researcher, Pitch Coach
- Stage-aware advice calibrated to your business (idea → seed → growth → scale)
- Framework-driven: SWOT, Lean Canvas, Porter's Five Forces, OKRs, Business Model Canvas

### bmad-cowork

BMAD (Breakthrough Method of Agile AI-Driven Development) as native Claude Cowork teams. 9 specialized AI agents collaborate autonomously through phased workflows to take projects from idea to implementation.

**Features:**
- 9 Cowork-native agents: Mary (Analyst), John (PM), Sally (UX), Winston (Architect), Bob (Scrum Master), James (Developer), Quinn (QA), Barry (Quick Dev), Paige (Tech Writer)
- 4-phase methodology: Analysis → Planning → Solutioning → Implementation
- 3 commands: `/bmad-start`, `/bmad-status`, `/bmad-sprint`
- Autonomous agent handoffs via SendMessage
- Story-driven development with architecture context extraction
- Phase gates ensuring quality before advancement
- Quick Flow path for simple tasks (skip ceremony)

## Contributing

Contributions welcome! To add a new plugin:

1. Fork this repo
2. Create your plugin in `plugins/your-plugin-name/`
3. Follow the [Claude Code plugin structure](https://docs.anthropic.com/en/docs/claude-code/plugins)
4. Add your plugin to `.claude-plugin/marketplace.json`
5. Open a PR

## License

MIT
