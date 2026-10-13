-- SELECT name, price, sku FROM products where 

-- ALTER TABLE products
-- ADD COLUMN category TEXT;

SELECT name, category,price,is_active FROM products WHERE category = 'Stationery';

-- UPDATE products
-- SET category = CASE
--     WHEN sku IN ('SKU001', 'SKU002') THEN 'Electronics'
--     WHEN sku IN ('SKU003', 'SKU005') THEN 'Stationery'
--     ELSE 'Other'
-- END;

-- SELECT * FROM PRODUCTS