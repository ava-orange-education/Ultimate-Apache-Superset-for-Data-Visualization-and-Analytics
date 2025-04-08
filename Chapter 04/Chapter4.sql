-- Basic SELECT Query
SELECT * FROM sales;

--Total Sales by Customer
SELECT CUSTOMERNAME, SUM(SALES) AS total_sales
FROM sales
GROUP BY CUSTOMERNAME
ORDER BY total_sales DESC;

-- Filtering Sales by Date and Status
SELECT ORDERNUMBER, ORDERDATE, SALES, STATUS
FROM sales
WHERE STATUS = 'Shipped' AND YEAR_ID = 2003 AND QTR_ID = 1


-- Aggregating Sales by Product Line
SELECT PRODUCTLINE, SUM(SALES) AS total_sales
FROM sales
GROUP BY PRODUCTLINE
ORDER BY total_sales DESC;

-- Filtering by Deal Size
SELECT ORDERNUMBER, CUSTOMERNAME, SALES, DEALSIZE
FROM sales
WHERE DEALSIZE = 'Large';

-- Targeted SELECT Query
SELECT ORDERNUMBER, CUSTOMERNAME, SALES 
FROM sales;

-- Filtering Orders by Status:
SELECT ORDERNUMBER, STATUS, SALES
FROM sales
WHERE STATUS = 'Shipped';

-- Sorting Orders by Sales Amount:
SELECT ORDERNUMBER, CUSTOMERNAME, SALES
FROM sales
ORDER BY SALES DESC;

-- Combining SELECT, WHERE, and ORDER BY
SELECT ORDERNUMBER, CUSTOMERNAME, SALES, STATUS
FROM sales
WHERE STATUS = 'Shipped'
ORDER BY SALES DESC;

--Self Joins in SQL
SELECT 
    a.CUSTOMERNAME AS customer_name,
    a.ORDERNUMBER AS first_order,
    a.ORDERDATE AS first_order_date,
    b.ORDERNUMBER AS second_order,
    b.ORDERDATE AS second_order_date
FROM sales a
JOIN sales b 
    ON a.CUSTOMERNAME = b.CUSTOMERNAME 
    AND a.ORDERDATE < b.ORDERDATE
ORDER BY customer_name, first_order_date;

-- Comparing Sales Between Consecutive Orders (Using LAG)
SELECT 
    CUSTOMERNAME,
    ORDERNUMBER,
    ORDERDATE,
    SALES,
    LAG(SALES, 1) OVER (PARTITION BY CUSTOMERNAME ORDER BY ORDERDATE) AS previous_order_sales,
    SALES - LAG(SALES, 1) OVER (PARTITION BY CUSTOMERNAME ORDER BY ORDERDATE) AS sales_difference
FROM sales
ORDER BY CUSTOMERNAME, ORDERDATE;


-- Finding the Next Order Date for Each Customer (Using LEAD)
SELECT 
    CUSTOMERNAME,
    ORDERNUMBER,
    ORDERDATE,
    LEAD(ORDERDATE, 1) OVER (PARTITION BY CUSTOMERNAME ORDER BY ORDERDATE) AS next_order_date
FROM sales
ORDER BY CUSTOMERNAME, ORDERDATE;


-- Conditional Aggregations Using SUM with CASE
SELECT 
    CUSTOMERNAME,
    SUM(CASE WHEN STATUS = 'Shipped' THEN SALES ELSE 0 END) AS total_shipped_sales,
    SUM(CASE WHEN STATUS = 'Cancelled' THEN SALES ELSE 0 END) AS total_cancelled_sales
FROM sales
GROUP BY CUSTOMERNAME
ORDER BY total_shipped_sales DESC;


