-- primary key constraint ensures that each record in the table has a unique identifier. It is used to enforce entity integrity by uniquely identifying each row in the table.
-- In this example, the "id" column is defined as the primary key for the "basics.primary_keys" table. The primary key constraint automatically creates a unique index on the "id" column, which helps to optimize query performance when searching for specific records based on their primary key values.

DROP TABLE IF EXISTS basics.sales;

CREATE TABLE basics.sales (
    id SERIAL PRIMARY KEY, -- Primary key constraint ensures that each sale has a unique identifier.
    product_name VARCHAR(100) NOT NULL, -- Not null constraint ensures that the product name is provided.
    quantity INTEGER CHECK (quantity > 0), -- Check constraint ensures that the quantity is greater than 0.
    price NUMERIC(10, 2) CHECK (price >= 0), -- Check constraint ensures that the price is non-negative.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Default constraint sets the created_at timestamp to the current time when a new sale is inserted.
);

INSERT INTO basics.sales (product_name, quantity, price) VALUES
('Product A', 2, 19.99),
('Product B', 1, 29.99),
('Product C', 3, 9.99);

SELECT * FROM basics.sales;