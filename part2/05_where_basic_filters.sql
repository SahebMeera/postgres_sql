-- where cluase is used to filter the rows returned by a query based on a specified condition. It allows you to retrieve only the rows that meet certain criteria.

-- select * from products;
-- SELECT * FROM products
-- WHERE is_active = TRUE;

-- SELECT * FROM products
-- WHERE price < 20;

SELECT * FROM products
WHERE price >= 30 AND price <= 50;