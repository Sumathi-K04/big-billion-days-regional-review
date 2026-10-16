# Big Billion Days Regional Performance Review

A traceable analytics project using a synthetic Big Billion Days dataset. All monetary values are in INR.

## Tools

- **SQL:** SQLite, using SQLite Online for query execution.
- **Spreadsheet:** Google Sheets for cleaning, formulas, summary metrics, pivot tables, and reconciliation.
- **Dashboard:** Tableau Public.

## Tableau Public Dashboard

[View the Big Billion Days Regional Performance Review](https://public.tableau.com/app/profile/sumathi.k2438/viz/BigBillionDaysRegionalPerformanceReview/Dashboard1)

## Three Key Findings

- Completed-order revenue is **₹346,200** across **63 completed orders**.
- **North** is the highest-revenue region at ₹119,300; East is the lowest at ₹69,500.
- **Electronics** is the highest-revenue category at ₹142,300. Total completed units sold: **106**.

## Project Files

- `sql/00_schema_and_seed.sql` — database schema and seed data.
- `sql/q01.sql`–`sql/q13.sql` — business analysis queries.
- `sql/d1_corrected.sql` — corrected AI-generated regional query.
- `results/query_results.md` — query outputs and row counts.
- `data/orders_enriched.csv` — 90 joined orders.
- `data/orders_clean.csv` — 63 completed orders, cleaned and enriched.
- `docs/spreadsheet_notes.md` — formulas, summary metrics, pivot tables, and validation.
- `docs/dashboard_spec.md` — dashboard specifications and recommendations.
- `docs/ai_log.md` — prompts, AI response audit, and human verification.

## Assumptions

- The dataset is synthetic and monetary values are in INR.
- `order_month` is retained as text.
- Missing amounts are not imputed; pending records are excluded from completed-order revenue.
- Spreadsheet calculations and SQL outputs are reconciled against the same completed-order dataset.
