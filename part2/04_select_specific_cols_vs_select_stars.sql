-- select * from products;
-- select specific columns from products table
-- AS creates as alias for the column name in the result set

-- SELECT name, description, price
-- FROM products;

Select name AS product_name, description AS product_description, price AS product_price
FROM products;