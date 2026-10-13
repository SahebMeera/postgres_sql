
-- This SQL script drops the "students" table if it already exists, ensuring that the table can be created without any conflicts.
DROP TABLE IF EXISTS basics.students;

-- This SQL script creates a table named "students" within the "basics" schema. The "students" table has the following columns:
CREATE TABLE basics.students (
    --id SERIAL PRIMARY KEY,
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    age INTEGER CHECK (age >= 18), -- This constraint ensures that the age of the student is at least 18.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- insert some sample data into the "students" table for testing purposes.
INSERT INTO basics.students (name, email, age) VALUES
('Alice Johnson', 'alice.johnson@example.com', 20),
('Bob Smith', 'bob.smith@example.com', 22),
('Charlie Brown', 'charlie.brown@example.com', 21);