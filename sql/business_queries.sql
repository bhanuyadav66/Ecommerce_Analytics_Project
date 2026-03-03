SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'retail';
1: Total Revenue
select sum(total_price) as total_revenue from retail ;

2:Total Orders
select count(distinct invoice) as total_orders from retail;

3: Total Customers
select count(distinct customer_id) as total_customers from retail;

4:Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', invoicedate) AS month,
    SUM(total_price) AS revenue
FROM retail
GROUP BY month
ORDER BY month;

5:Top 10 Customers
SELECT 
    customer_id,
    SUM(total_price) AS total_spent
FROM retail
GROUP BY customer_id
oRDER BY total_spent DESC
LIMIT 10;

6:Revenue by Country
SELECT 
    country,
    SUM(total_price) AS revenue
FROM retail
GROUP BY country
ORDER BY revenue DESC;

7:Customer Repeat Rate
SELECT 
    customer_id,
    COUNT(DISTINCT invoice) AS total_orders
FROM retail
GROUP BY customer_id
HAVING COUNT(DISTINCT invoice) > 1;

8:Top 10 Products by Revenue
SELECT 
    description,
    SUM(total_price) AS revenue
FROM retail
GROUP BY description
ORDER BY revenue DESC
LIMIT 10;

9:Customer Lifetime Value 
SELECT 
    customer_id,
    SUM(total_price) AS lifetime_value
FROM retail
GROUP BY customer_id
ORDER BY lifetime_value DESC;