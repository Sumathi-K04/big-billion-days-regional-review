# Spreadsheet Notes

## Setup

- Tabs: `orders`, `products`, `completed_orders`.
- Imported 90 data rows into `orders` from `data/orders_enriched.csv` (plus header).
- `products` contains the ordered product lookup table in A1:C10, with headers in row 1.
- Kept `order_month` as plain text (examples: 2026-09, 2026-10, 2026-11).
- Applied filter `status = completed`, sorted `amount` descending, and copied the 63 visible rows as values to `completed_orders`.
- Tested XLOOKUP with key `Mystery Item`; expected fallback displayed `UNKNOWN_ITEM`.

## Formulas (first data row; copy down)

- `clean_first_name`: `=PROPER(TRIM(C2))` (assuming raw first_name is column C after import; use the original first_name cell reference for your actual column placement).
- `clean_last_name`: `=PROPER(TRIM(D2))` (assuming raw last_name is column D).
- `category`: `=VLOOKUP(G2,products!$A$2:$C$10,2,FALSE)` (assuming item is G2).
- `unit_price`: `=XLOOKUP(G2,products!$A$2:$A$10,products!$C$2:$C$10,"UNKNOWN_ITEM")`.
- `revenue_calc`: `=I2*J2` (unit_price multiplied by quantity in the completed_orders column order).

## Completed-order aggregates

| Statistic | Amount |
|---|---:|
| COUNT(amount) | 63 |
| SUM(amount) | 346200 |
| AVERAGE(amount) | 5495.24 |
| MIN(amount) | 1100 |
| MAX(amount) | 15600 |

## Pivot (i): sum of amount by category and region

| Category | East | North | South | West | Grand Total |
|---|---:|---:|---:|---:|---:|
| Apparel | 10600 | 19400 | 10000 | 37500 | 77500 |
| Electronics | 21400 | 73400 | 28700 | 18800 | 142300 |
| Home | 37500 | 26500 | 43800 | 18600 | 126400 |
| Grand Total | 69500 | 119300 | 82500 | 74900 | 346200 |

## Pivot (ii): order month sum and count

| order_month | Sum of amount | Count of order_id |
|---|---:|---:|
| 2026-09 | 98300 | 19 |
| 2026-10 | 93100 | 20 |
| 2026-11 | 154800 | 24 |
| Grand Total | 346200 | 63 |

## Reconciliation with Part A q05

| Statistic | Spreadsheet | Part A q05 | Status |
|---|---:|---:|---|
| COUNT | 63 | 63 | Match |
| SUM | 346200 | 346200 | Match |
| AVERAGE | 5495.24 | 5495.24 | Match |

## Data validation

- Missing amounts occur in order IDs 1001, 1010 and 1064 (Part A q02). They are pending orders, so they are not part of the completed-order analysis; values were left missing rather than invented.
- Numeric columns `unit_price`, `quantity`, `amount` and `revenue_calc` should be stored as numeric values; `order_month` remains text.
- Completed-order `order_id` values were checked for duplicates; each order should occur once. Largest completed amount is INR 15600, on order IDs 1061, 1065, 1069, 1077. This is a high-value order, but not treated as an error without additional evidence.
- Handover decision: preserve the original imported `orders` tab, document transformations, and do not impute missing amounts into revenue.
