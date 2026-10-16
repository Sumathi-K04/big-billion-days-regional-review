-- q11: Region and month report.
-- INNER JOIN keeps only customers with orders; COUNT(DISTINCT ...) counts unique customers rather than counting them once per order.
SELECT c.region, o.order_month, COUNT(o.order_id) AS number_of_orders, COUNT(DISTINCT o.customer_id) AS number_of_customers, SUM(o.amount) AS total_revenue, AVG(o.amount) AS average_revenue FROM orders AS o JOIN customers AS c ON o.customer_id = c.customer_id WHERE o.status = 'completed' GROUP BY c.region, o.order_month ORDER BY c.region, o.order_month;
