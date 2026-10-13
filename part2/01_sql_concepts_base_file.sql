CREATE EXTENSION IF NOT EXISTS pgcrypto; -- This extension is used for cryptographic functions, which can be useful for hashing passwords or other sensitive data.

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(), -- This column is a universally unique identifier (UUID) that serves as the primary key for the table. It is generated using the "gen_random_uuid()" function from the "pgcrypto" extension.
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE, -- This column indicates whether the product is active or not. By default, it is set to TRUE.
    sku TEXT UNIQUE, -- This column stores the stock keeping unit (SKU) for the product and enforces uniqueness across the table.
    price NUMERIC(10, 2) CHECK (price >= 0), -- This constraint ensures that the price value is non-negative.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (name, description, is_active, sku, price) VALUES
('Product A', 'Description for Product A', TRUE, 'SKU001', 19.99),
('Product B', 'Description for Product B', TRUE, 'SKU002', 29.99),
('Product C', 'Description for Product C', FALSE, 'SKU003', 9.99);


SELECT * FROM products;