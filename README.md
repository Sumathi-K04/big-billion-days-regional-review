# Big Billion Days Regional Performance Review

A traceable analytics project using the synthetic Big Billion Days dataset. Money values are INR.

## Tools

- SQL compiler: SQLite Online (https://sqliteonline.com/).
- SQL dialect: SQLite.
- Spreadsheet: Google Sheets or Microsoft Excel; use the formulas and pivots documented in `docs/spreadsheet_notes.md`.
- Dashboard: written specification provided for Tableau Public; the specification is the deliverable and a Tableau workbook is not included.

## Three key findings

- Completed-order revenue is INR 346,200 across 63 completed orders, matching q05.
- The highest-revenue region is North (INR 119,300); the lowest among the four is East (INR 69,500).
- The highest-revenue category is Electronics (INR 142,300); completed revenue totals 106 units sold.

## File index

- `sql/00_schema_and_seed.sql` — schema and synthetic seed data (Part A).
- `sql/q01.sql`–`sql/q13.sql` — required business queries (Part A).
- `sql/d1_corrected.sql` — corrected AI-generated regional query (Part D).
- `results/query_results.md` — seed counts, query outputs and row counts (Part A).
- `data/orders_enriched.csv` — all 90 joined orders (Part A).
- `data/orders_clean.csv` — 63 completed orders, cleaned and enriched (Part B).
- `docs/spreadsheet_notes.md` — formulas, aggregates, pivots, reconciliation and validation notes (Part B).
- `docs/dashboard_spec.md` — dashboard data source, KPI cards, chart tables, layout and recommendations (Part C).
- `docs/ai_log.md` — structured prompts, AI answer audit and human verification (Part D).

## Assumptions

The assignment allows either Google Sheets or Excel and permits a written dashboard specification without a Tableau workbook. The project documents formulas for Google Sheets/Excel and specifies a Tableau Public dashboard but does not claim a workbook was built. `order_month` is retained as text. Missing amounts remain empty in the enriched CSV and are not imputed; those records are pending, not completed revenue.
