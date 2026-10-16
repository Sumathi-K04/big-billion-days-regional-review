# AI Assistance and Human-in-the-Loop Verification Log

## 1. Five-part prompt for q13

**Role:** You are a careful SQL analyst producing an auditable regional sales report.

**Task:** Write q13, measuring each sales representative's completed-order revenue by month and classifying performance against the representative's monthly target.

**Context:** Use SQLite. Real tables and columns: `reps(rep_id, rep_name, region, monthly_target)`, `customers(customer_id, first_name, last_name, city, region, age, rep_id)`, and `orders(order_id, customer_id, item, quantity, amount, status, order_month)`. Join orders to customers using customer_id and customers to reps using rep_id.

**Constraints:** Include completed orders only. `performance_tier` is Below Target when revenue is below monthly_target, On Target when revenue is at least monthly_target but below 1.1 times monthly_target, and Above Target otherwise. Do not use WITH clauses or stored procedures. Do not use aggregate filters in WHERE; repeat aggregate expressions inside CASE.

**Format:** Return raw SQL only, with inline comments. Output columns in this order: rep_name, order_month, monthly_target, revenue, performance_tier. Group by rep, month and monthly_target; order by rep_name then order_month.

## 2. Scenario D1 — defects in the assistant answer

| Defect | Classification | Why it is wrong | Correct fix |
|---|---|---|---|
| `sales` table does not exist | Fake method/function | The real source is `orders`, joined to `customers` for region. | Query the real tables and join on keys. |
| `region_name` and `total_sales` do not exist | Fake method/function | The schema has `customers.region` and `orders.amount`. | Use `c.region` and `SUM(o.amount)`. |
| `WHERE SUM(total_sales) > 80000` | Logic error | Aggregate filters cannot be evaluated in WHERE. | Put `SUM(o.amount) > 80000` in HAVING. |
| Claim of 38% month-over-month growth | Phantom statistic | The claim is not supported by the seed data. | Calculate the actual monthly values and percentage from completed orders. |

## 3. Corrected D1 query and result

Saved as `sql/d1_corrected.sql`. It joins the real tables, filters completed orders in WHERE and applies the revenue threshold in HAVING.

| region | revenue (INR) |
|---|---:|
| North | 119300 |
| South | 82500 |

North completed revenue was INR 53,500 in 2026-09 and INR 41,300 in 2026-10. Month-over-month change = (41,300 − 53,500) / 53,500 × 100 = **-22.8%**. The assistant's claim of 38% growth is contradicted by the data.

## 4. Human-in-the-loop protocol for D1

- **Specification:** Translated “which regions sell the most?” into a defined measure: SUM(amount) for completed orders, grouped by customer region, with a threshold above INR 80,000.
- **Execution:** Ran `sql/d1_corrected.sql` against the SQLite seed; the query returned the two regions and revenues recorded above.
- **Inspection:** Checked that the query uses existing tables and columns, joins orders to customers by customer_id, filters completed orders, and uses HAVING for the aggregate threshold.
- **Verification:** Compared the result with the completed-order regional/month totals. North's 2026-09 to 2026-10 change is -22.8%, not +38%.
- **Decision:** **Reject** the original answer because its schema references and aggregate filter are invalid and the 38% claim is unsupported. **Accept** the corrected query because it runs against the real schema and its outputs reconcile with the dataset.

## 5. Scenario D2 — lookup formula error

**Role:** Act as a spreadsheet formula troubleshooter.

**Task:** Explain why an exact-match VLOOKUP fails and give a corrected formula.

**Context:** `products` occupies A1:C10; item names are in column A and unit prices in column C. On `orders`, G2 contains ` Smart Watch` with a leading space. The current formula is `=VLOOKUP(G2, $A$2:$C$10, 3, FALSE)`.

**Constraints:** Keep exact matching, use the existing lookup range, and remove unintended whitespace without changing product labels in the source table.

**Format:** State the root cause and provide one corrected formula.

**Root cause:** G2 has a leading space, so the lookup key is not an exact match for `Smart Watch` in the products table. Repair: `=VLOOKUP(TRIM(G2),$A$2:$C$10,3,FALSE)`.

## 6. Skeptical-analyst check on the first recommendation

**Prompt:** “Act as a skeptical analyst. Challenge my first recommendation to prioritise a campaign for the highest-revenue region. Identify unstated assumptions, distinguish correlation from cause, and request evidence or checks that could confirm or weaken each assumption. Do not assume revenue alone proves a promotion will work.”

| Unstated assumption | Figure/check to confirm or weaken it |
|---|---|
| High revenue means the region has the strongest demand rather than simply more orders or higher-priced items. | Compare completed order counts and average order value by region. |
| A promotion will increase sales rather than subsidise purchases that would happen anyway. | Compare conversion and incremental revenue during a controlled campaign against a baseline or holdout. |
| The region has enough stock and fulfilment capacity to support a campaign. | Check stock availability, cancellations, fulfilment delays and out-of-stock rates before committing spend. |
