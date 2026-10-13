-- constraints Not null, unique, primary key, foreign key, check, default

DROP TABLE IF EXISTS basics.products_constraints;

CREATE TABLE basics.products_constraints (
    id SERIAL PRIMARY KEY, -- Primary key constraint ensures that each product has a unique identifier.
    full_name VARCHAR(200) NOT NULL, -- Not null constraint ensures that the full name of the product is provided.
    name VARCHAR(100) NOT NULL UNIQUE, -- Not null and unique constraints ensure that the product name is provided and is unique across the table.
    price NUMERIC(10, 2) CHECK (price >= 0), -- Check constraint ensures that the price is non-negative.
    age INTEGER CHECK (age >= 18), -- Check constraint ensures that the age is at least 18.
    is_active BOOLEAN DEFAULT TRUE, -- Default constraint sets the is_active column to TRUE if no value is provided.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Default constraint sets the created_at timestamp to the current time when a new product is inserted.
); 

INSERT INTO basics.products_constraints (full_name, name, price, age) VALUES
('Product A Full Name', 'Product A', 19.99, 20),
('Product B Full Name', 'Product B', 29.99, 22); -- This will fail due to the unique constraint on the name column.

