-- and && or || and not ! operators in SQL

-- SELECT * FROM products WHERE is_active = FALSE AND price > 50;

-- or, not, and operators can be combined to create complex conditions in the WHERE clause. The AND operator is used to combine multiple conditions, while the OR operator is used to specify alternative conditions. The NOT operator is used to negate a condition.

-- SELECT * FROM products WHERE is_active = TRUE AND (price < 20 OR price > 50);


-- SELECT * FROM products WHERE is_active = TRUE OR price > 50;

-- SELECT *
-- FROM products
-- WHERE is_active = TRUE
--   AND (price < 20 OR price > 50);

-- 20 above and 50 below records find

-- SELECT * from products where is_active AND (price > 20 OR price < 50);

-- 

