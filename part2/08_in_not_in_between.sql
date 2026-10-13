-- in not in between sql query for sql 
-- IN -> value must match one item from the list 
-- NOT IN --> value must not match any item the list
-- BETWEEN --> value must be inside the range

-- SELECT name, price, description FROM products where name IN ('Product A', 'Product C')



-- SELECT name, price, description FROM products where name NOT IN ('Product A', 'Product C')

SELECT name, price, description FROM products where price BETWEEN 20 AND 50;