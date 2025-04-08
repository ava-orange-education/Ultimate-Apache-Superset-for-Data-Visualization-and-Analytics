SELECT customer_name, SUM(order_amount) AS total_sales
FROM orders
WHERE order_date >= '2023-01-01'
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;
