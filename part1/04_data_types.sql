DROP TABLE IF EXISTS basics.products_basic;

CREATE TABLE basics.products_basic (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    stock INTEGER DEFAULT 0 CHECK (stock >= 0), -- This constraint ensures that the stock of the product is non-negative.
    total_views BIGINT DEFAULT 0 CHECK (total_views >= 0), -- This constraint ensures that the total views of the product is non-negative.
    -- exact decimal values
    -- 10 means the total number of digits that can be stored, and 2 means the number of digits that can be stored after the decimal point.
    price NUMERIC(10, 2) CHECK (price >= 0), -- This constraint ensures that the price of the product is non-negative.
    is_active BOOLEAN DEFAULT TRUE, -- This column indicates whether the product is active or not. By default, it is set to TRUE.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- query to insert some sample data into the "products_basic" table for testing purposes.
INSERT INTO basics.products_basic (name, description, stock, total_views, price, is_active) VALUES
('Product A', 'Description for Product A', 10, 100, 19.99, TRUE),
('Product B', 'Description for Product B', 5, 50, 29.99, TRUE),
('Product C', 'Description for Product C', 0, 0, 9.99, FALSE);


-- query to select all data from the "products_basic" table to verify that the data has been inserted correctly.
SELECT * FROM basics.products_basic;

SELECT id, name, price, is_active
FROM basics.products_basic 
WHERE is_active = FALSE;