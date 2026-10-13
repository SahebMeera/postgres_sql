-- like - case senstive pattern match
-- ilike --  case insenstive pattern match
-- % means any no of chars
-- exactly match patterns 
-- the % after word means anthink can come 
-- SELECT name, price FROM products where name LIKE 'David%';
-- SELECT name, price FROM products where description LIKE '%for%';

-- ILIKE 
SELECT name, price,description FROM products where description ILIKE '%FOR%';