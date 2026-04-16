 --  OLIST E-COMMERCE DATA ANALYSIS

-- 1. Total Orders
SELECT COUNT(*) AS total_orders
FROM olist_orders_dataset;

-- 2. Total Revenue
SELECT SUM(payment_value) AS total_revenue
FROM olist_order_payments_dataset;

-- 3. Top 5 Best-Selling Products
SELECT product_id, COUNT(*) AS total_sales
FROM olist_order_items_dataset
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 5;

-- 4. Orders by Status
SELECT order_status, COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_status;

-- 5. Monthly Orders Trend
SELECT 
    DATE_FORMAT(order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY month
ORDER BY month;

-- 6. Revenue per Customer
SELECT 
    o.customer_id,
    SUM(p.payment_value) AS revenue
FROM olist_order_payments_dataset p
JOIN olist_orders_dataset o 
ON p.order_id = o.order_id
GROUP BY o.customer_id;
