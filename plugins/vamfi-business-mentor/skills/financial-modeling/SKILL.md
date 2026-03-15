---
name: Financial Modeling
description: This skill activates when the user asks about "financial model", "revenue projections", "cash flow", "P&L", "profit and loss", "break-even analysis", "unit economics", "budget", "financial forecast", "burn rate", "runway", "margins", "cost structure", "financial planning", "pricing model", or needs guidance on financial analysis, business math, or financial decision-making.
version: 1.0.0
---

# Financial Modeling & Analysis

Provide practical financial modeling guidance for businesses at any stage. Focus on the numbers that drive decisions, not accounting perfection.

## Unit Economics

The foundation of every business model. Always start here.

### SaaS / Subscription
- **MRR/ARR**: Monthly/Annual Recurring Revenue — the heartbeat metric
- **ARPU**: Average Revenue Per User — segment by plan tier
- **CAC**: Customer Acquisition Cost — fully loaded (ads + sales team + tools)
- **LTV**: Lifetime Value = ARPU × Gross Margin % × (1 / Monthly Churn Rate)
- **LTV:CAC ratio**: Target 3:1+ (below 1:1 = losing money on every customer)
- **Payback period**: Months to recoup CAC — target <12 months for venture scale
- **NRR**: Net Revenue Retention — >100% means existing customers grow revenue

### Marketplace / Platform
- **GMV**: Gross Merchandise Value — total transaction volume
- **Take rate**: Revenue / GMV — typically 5-30% depending on value added
- **Liquidity**: Match rate, time-to-fill, supply/demand ratio
- **Contribution margin**: Revenue per transaction minus variable costs

### E-commerce / Physical Products
- **COGS**: Cost of Goods Sold — materials, manufacturing, shipping
- **Gross margin**: (Revenue - COGS) / Revenue — target 60%+ for DTC, 30%+ for wholesale
- **Contribution margin**: Gross profit - variable selling costs (ads, fulfillment)
- **AOV**: Average Order Value — key lever for profitability
- **Repeat purchase rate**: Cohort analysis of repurchase behavior

### Services / Consulting
- **Billable rate**: Revenue target / billable hours available
- **Utilization rate**: Billable hours / total hours — target 65-80%
- **Project margin**: Project revenue - (direct labor + direct costs)
- **Revenue per employee**: Total revenue / headcount — benchmark by industry

## Revenue Forecasting

### Bottom-Up Approach (Preferred)
Build from specific, measurable inputs:
1. **Traffic/leads**: How many potential customers will you reach?
2. **Conversion rates**: What % convert at each funnel stage?
3. **ARPU**: What will each customer pay on average?
4. **Retention**: What % stay each month/year?
5. **Expansion**: What % of revenue comes from upsells?

Formula: Revenue = New Customers × ARPU + Existing Customers × ARPU × Retention × (1 + Expansion Rate)

### Cohort-Based Modeling
Model revenue by customer cohort:
- Each month's new customers are a cohort
- Apply retention curve to each cohort
- Sum all active cohorts for total revenue
- This naturally accounts for churn and growth

### Scenario Planning
Always model three scenarios:
- **Base case**: Realistic assumptions with current trends
- **Bull case**: Everything goes right (2x base growth rate)
- **Bear case**: Things go wrong (50% of base, higher churn)

## P&L Structure

Guide through a clean P&L:

```
Revenue
- COGS (hosting, infrastructure, direct costs)
= Gross Profit (target: 70-80% for SaaS, 40-60% for marketplace)

- Sales & Marketing (CAC, marketing team, tools)
- Research & Development (engineering, product team)
- General & Administrative (ops, legal, finance, office)
= Operating Income (EBITDA)

- Depreciation & Amortization
- Interest
- Taxes
= Net Income
```

### Key Ratios by Stage
| Stage | Gross Margin | S&M % Rev | R&D % Rev | G&A % Rev |
|-------|-------------|-----------|-----------|-----------|
| Pre-revenue | N/A | High | 60-80% | 10-20% |
| Early ($1-5M) | 60-75% | 40-60% | 30-50% | 15-25% |
| Growth ($5-20M) | 70-80% | 30-50% | 25-35% | 10-20% |
| Scale ($20M+) | 75-85% | 20-40% | 20-30% | 8-15% |

## Cash Flow & Runway

### Runway Calculation
- **Monthly burn**: Total monthly expenses - total monthly revenue
- **Runway**: Cash in bank / monthly burn rate
- **Buffer**: Always plan to fundraise with 6+ months runway remaining
- **Default alive vs default dead**: At current growth and burn, will you reach profitability before running out of cash?

### Cash Flow Management
1. **Collect faster**: Annual prepay discounts (20% for annual billing), shorter payment terms
2. **Pay slower**: Negotiate 30-60 day payment terms with vendors
3. **Variable > fixed**: Use contractors, cloud services, and variable-cost tools
4. **Cut deeply once**: If cutting costs, cut 30%+ at once rather than death by 1,000 cuts

## Break-Even Analysis

Help calculate and visualize break-even:
- **Break-even units**: Fixed Costs / (Price per Unit - Variable Cost per Unit)
- **Break-even revenue**: Fixed Costs / Contribution Margin %
- **Break-even timeline**: Month when cumulative revenue exceeds cumulative costs
- **Sensitivity analysis**: How do changes in price, volume, or costs affect break-even?

## Mentoring Style

- **Math with context**: Numbers without narrative are meaningless — explain what drives them
- **Sanity check assumptions**: If someone projects 50% monthly growth for 3 years, push back
- **Benchmarks**: Always compare to industry benchmarks and comparable companies
- **Decision-focused**: Every model should answer a specific question or inform a specific decision
- **Simple first**: A clear 3-line model beats a complex 50-tab spreadsheet nobody understands
- **Iterate**: Models are living documents — update monthly with actuals vs projections
