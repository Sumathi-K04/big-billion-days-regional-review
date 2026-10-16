# Big Billion Days Regional Performance Review

A data analytics project reviewing regional sales performance using SQL, Google Sheets, Tableau Public, and AI-assisted verification. The dataset is synthetic, and all monetary values are in Indian Rupees (INR).

## Project Overview

This project analyzes order data to identify regional revenue patterns, category performance, monthly trends, and business opportunities. It includes SQL queries, spreadsheet cleaning and validation, a Tableau dashboard, and an audit of AI-generated analytical results.

## Tools Used

- **SQL:** SQLite for database creation, joins, aggregations, subqueries, and business analysis.
- **Spreadsheet:** Google Sheets for data cleaning, formulas, summary metrics, pivot tables, and reconciliation.
- **Dashboard:** Tableau Public for interactive visual analysis.
- **AI verification:** Human review of generated SQL, result validation, and correction of analytical errors.

## Tableau Public Dashboard

[**View the Big Billion Days Regional Performance Review Dashboard**](https://public.tableau.com/app/profile/sumathi.k2438/viz/BigBillionDaysRegionalPerformanceReview/Dashboard1)

The dashboard presents regional revenue, category revenue, and monthly revenue trends.

## Key Findings

- **Total completed-order revenue:** ₹346,200 across 63 completed orders.
- **Highest-revenue region:** North, with ₹119,300.
- **Lowest-revenue region:** East, with ₹69,500.
- **Highest-revenue category:** Electronics, with ₹142,300.
- **Total units sold:** 106.
- Monthly completed-order revenue was ₹98,300 in September 2026, ₹93,100 in October 2026, and ₹154,800 in November 2026.

## Project Structure

- `data/orders_enriched.csv` — enriched order dataset containing 90 records.
- `data/orders_clean.csv` — cleaned completed-order dataset containing 63 records.
- `sql/00_schema_and_seed.sql` — database schema and seed data.
- `sql/q01.sql` through `sql/q13.sql` — SQL analysis queries.
- `sql/d1_corrected.sql` — corrected regional analysis query.
- `results/query_results.md` — SQL query outputs and row-count checks.
- `docs/spreadsheet_notes.md` — spreadsheet formulas, summary metrics, pivot tables, and reconciliation notes.
- `docs/dashboard_spec.md` — dashboard specifications, observations, and recommendations.
- `docs/ai_log.md` — AI prompts, validation checks, identified defects, and corrections.
- `README.md` — project overview, key findings, and links.

## Data Validation

- The original enriched dataset contains 90 orders.
- The completed-order analysis contains 63 orders.
- Completed-order revenue reconciles to ₹346,200.
- Total completed units reconcile to 106.
- Regional revenue totals reconcile to the overall completed-order revenue.
- AI-generated SQL results were reviewed and corrected where necessary.

## Business Recommendations

1. Prioritize regional planning using revenue performance while investigating opportunities to improve lower-performing regions.
2. Review Electronics inventory and promotion strategies because the category contributes the highest revenue.
3. Monitor monthly revenue trends and validate future decisions against completed-order data.

## Assumptions and Limitations

- The dataset is synthetic and does not represent actual customer transactions.
- All monetary values are expressed in INR.
- Revenue analysis excludes orders that are not marked as completed.
- `order_month` is retained as text in the source data.
- Findings and recommendations are based only on the supplied dataset and should not be generalized to actual sales without further validation.
