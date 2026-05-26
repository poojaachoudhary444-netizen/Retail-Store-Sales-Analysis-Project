-- ============================================
-- Retail Sales Analysis Project
-- SQL Views
-- ============================================

CREATE VIEW vw_sales_summary AS
SELECT
o.order_id,
o.order_date,
c.first_name,
s.store_name,
p.product_name,
b.brand_name,
cat.category_name,
oi.quantity,
oi.list_price,
oi.discount,
(oi.quantity * oi.list_price * (1-oi.discount)) AS Total_Sales
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN stores s
ON o.store_id = s.store_id
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
JOIN brands b
ON p.brand_id = b.brand_id
JOIN categories cat
ON p.category_id = cat.category_id;
CREATE VIEW vw_kpi_summary AS
SELECT
    SUM(oi.quantity * oi.list_price * (1-oi.discount)) AS Total_Sales,
    COUNT(DISTINCT o.order_id) AS Total_Orders,
    COUNT(DISTINCT o.customer_id) AS Total_Customers,
    COUNT(DISTINCT p.product_id) AS Total_Products
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;
CREATE VIEW vw_store_sales AS
SELECT
    s.store_name,
    SUM(oi.quantity * oi.list_price * (1-oi.discount)) AS Total_Sales
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN stores s
ON o.store_id = s.store_id
GROUP BY s.store_name;
CREATE PROCEDURE GetTopProducts
AS
BEGIN
    SELECT TOP 10
        p.product_name,
        SUM(oi.quantity * oi.list_price) AS Revenue
    FROM order_items oi
    JOIN products p
    ON oi.product_id = p.product_id
    GROUP BY p.product_name
    ORDER BY Revenue DESC;
END;