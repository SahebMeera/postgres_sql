-- limit --> how many rows you want to return
-- offset --> how many rows we want to skip
--
-- SELECT name, price FROM products ORDER BY name ASC LIMIT 3;
-- SELECT name, price FROM products ORDER BY price DESC LIMIT 3;

SELECT name,price FROM products ORDER BY name ASC LIMIT 3 OFFSET 1;