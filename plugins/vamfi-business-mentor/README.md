# Vamfi Business Mentor

AI-powered business mentor plugin for Claude Code. Get strategic advice, proven frameworks, and actionable guidance for any business — from idea stage to scale.

Built and open-sourced by **Vamfi**.

## Features

### Skills (Auto-activate on relevant questions)
- **Business Strategy** — Business models, pricing, go-to-market, competitive analysis, positioning
- **Startup Guidance** — Fundraising, MVPs, product-market fit, cap tables, startup metrics
- **Operations Coaching** — Team building, hiring, OKRs, processes, leadership, scaling
- **Financial Modeling** — Unit economics, P&L, cash flow, break-even, revenue forecasting

### Commands
| Command | Description |
|---------|-------------|
| `/mentor [topic]` | Start a mentoring session on any business topic |
| `/swot [business]` | Run a SWOT analysis |
| `/lean-canvas [idea]` | Generate a Lean Canvas |
| `/pitch-review [pitch]` | Review and improve a pitch |
| `/business-plan [desc]` | Create a structured business plan |

### Agents (Auto-trigger on context)
- **Business Advisor** — Strategic guidance for business decisions and challenges
- **Market Researcher** — Market sizing, competitive analysis, industry research
- **Pitch Coach** — Pitch preparation, storytelling, investor readiness

## Installation

### From Plugin Directory
```bash
claude --plugin-dir /path/to/vamfi-business-mentor
```

### For Project Use
Copy to your project's `.claude-plugin/` directory or add as a git submodule.

## Usage

Just ask business questions naturally — the skills activate automatically:

```
> How should I price my SaaS product?
> What's a good go-to-market strategy for a B2B tool?
> Help me think through my hiring plan
> Is my burn rate sustainable?
```

Or use commands for structured outputs:

```
> /mentor pricing strategy for developer tools
> /swot my project management app
> /lean-canvas AI-powered customer support
> /pitch-review
> /business-plan for a marketplace connecting freelancers with startups
```

## What Makes This Different

- **Stage-aware**: Advice calibrated to your business stage (idea → seed → growth → scale)
- **Industry-agnostic**: Works for SaaS, marketplace, e-commerce, services, hardware, and more
- **Framework-driven**: Uses proven frameworks (SWOT, Lean Canvas, Porter's Five Forces, OKRs) applied to YOUR situation
- **Project-contextual**: Reads your project files to give relevant advice, not generic theory
- **Challenge-oriented**: Pushes back on weak assumptions — real mentors don't just agree
- **Action-focused**: Every interaction ends with concrete next steps

## License

MIT — use it, fork it, improve it.

## Contributing

Contributions welcome. If you have business domain expertise and want to improve the mentoring quality, open a PR.
