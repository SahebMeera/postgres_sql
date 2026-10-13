-- INSERT INTO products (name, description, is_active, sku, price, category) VALUES
-- ('Temp', 'temp description', TRUE, 'SKU010', 39.99, 'Other') RETURNING  id, name, price,sku,category;

UPDATE products SET name ='TEMP update' where sku='SKU010' RETURNING id, name, price,sku,category;
