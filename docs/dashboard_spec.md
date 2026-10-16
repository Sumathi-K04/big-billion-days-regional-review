# Dashboard Specification

## Data source

Source: `data/orders_clean.csv`. Load `order_month` as text, not a date.

| Field | Classification |
|---|---|
| order_id | Dimension |
| order_month | Dimension |
| clean_first_name | Dimension |
| clean_last_name | Dimension |
| region | Dimension |
| rep_name | Dimension |
| item | Dimension |
| category | Dimension |
| unit_price | Measure |
| quantity | Measure |
| amount | Measure |
| revenue_calc | Measure |
| status | Dimension |

## KPI cards

- **Total Revenue:** INR 346,200 (SUM(amount)). This equals Part A q05 `total_revenue` = INR 346,200.
- **Total Units Sold:** 106 (SUM(quantity)).

## Worksheet 1 — Revenue by Region

Chart type: bar chart. Rows: `region`; Columns: `SUM(amount)`; Colour: `region`. Bars make regional revenue easy to compare.

| Region | Revenue (INR) |
|---|---:|
| East | 69500 |
| North | 119300 |
| South | 82500 |
| West | 74900 |

## Worksheet 2 — Revenue by Category

Chart type: bar chart. Rows: `category`; Columns: `SUM(amount)`; Colour: `category`. A bar chart ranks category contribution clearly.

| Category | Revenue (INR) |
|---|---:|
| Electronics | 142300 |
| Home | 126400 |
| Apparel | 77500 |

## Worksheet 3 — Revenue Trend by Month and Category

Chart type: line chart. Rows: `SUM(amount)`; Columns: `order_month`; Colour: `category`; one line per category. Lines show changes across the three monthly periods.

| Month | Apparel | Electronics | Home | Total |
|---|---:|---:|---:|---:|
| 2026-09 | 24700 | 43000 | 30600 | 98300 |
| 2026-10 | 30600 | 49900 | 12600 | 93100 |
| 2026-11 | 22200 | 49400 | 83200 | 154800 |

## Worksheet 4 — Region x Category Detail

Chart type: text table. Rows: `region`; Columns: `category`; Text: `SUM(amount)`; Colour: none. Exact values support detailed regional/category comparison.

| Region | Apparel | Electronics | Home | Total |
|---|---:|---:|---:|---:|
| East | 10600 | 21400 | 37500 | 69500 |
| North | 19400 | 73400 | 26500 | 119300 |
| South | 10000 | 28700 | 43800 | 82500 |
| West | 37500 | 18800 | 18600 | 74900 |

## Dashboard layout

1. Top band: horizontal container with Total Revenue and Total Units Sold KPI cards.
2. Directly below KPIs: category filter in a horizontal container; apply to all four worksheets using this data source.
3. Next: full-width Revenue Trend by Month and Category line chart.
4. Next: Revenue by Region and Revenue by Category bar charts side by side in a horizontal container.
5. Bottom: full-width Region x Category Detail text table.
Use a vertical container for these stacked bands. With **Use as Filter** enabled on Revenue by Region, clicking a region bar filters the category chart, trend chart and detail table to that region.

## Visualization summary

The dashboard compares completed-order revenue by region and category, tracks month-by-month revenue by category, and provides a region/category detail table. KPI cards display INR revenue and units sold.

## Summary analysis

- North generated INR 119,300, compared with East at INR 69,500.
- Electronics was the highest-revenue category at INR 142,300; Apparel recorded INR 77,500.
- Total completed revenue changed from INR 98,300 in 2026-09 to INR 93,100 in 2026-10, a change of INR -5,200.

## Recommendations

1. Prioritise a targeted campaign for North based on its INR 119,300 revenue; monitor next-month completed revenue and conversion.
2. Review inventory and promotion placement for Electronics, the top category at INR 142,300; monitor units sold and category revenue.
3. Investigate the lower-performing East region (INR 69,500) with a local product mix test; monitor completed revenue against its current baseline.

## Reconciliation

| Measure | Value (INR) |
|---|---:|
| Total Revenue KPI | 346200 |
| Sum of Revenue by Region | 346200 |
| Sum of Revenue by Category | 346200 |
| Part B pivot grand total | 346200 |
