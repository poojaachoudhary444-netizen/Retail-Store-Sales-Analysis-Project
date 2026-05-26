-- ============================================
-- Retail Sales Analysis Project
-- Create Tables Script
-- ============================================

SELECT TOP (1000) [order_id]
      ,[customer_id]
      ,[order_status]
      ,[order_date]
      ,[required_date]
      ,[shipped_date]
      ,[store_id]
      ,[staff_id]
      ,[shipping_status]
  FROM [RetailDB].[dbo].[orders]

ALTER TABLE order_items
ALTER COLUMN product_id INT;

ALTER TABLE order_items
ALTER COLUMN quantity INT;

ALTER TABLE order_items
ALTER COLUMN list_price DECIMAL(10,2);

ALTER TABLE order_items
ALTER COLUMN discount DECIMAL(5,2);








