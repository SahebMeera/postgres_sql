-- null - unknown value/missing value
-- empty string - known value, but no characters

DROP TABLE IF EXISTS basics.value_examples;

CREATE TABLE basics.value_examples (
    id SERIAL PRIMARY KEY,
    nikename VARCHAR(100) NOT NULL,
    bio TEXT,
    store INTEGER DEFAULT 0 CHECK (store >= 0), -- This constraint ensures that the store value is non-negative.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);  


INSERT INTO basics.value_examples (nikename, bio, store) VALUES
('Alice', 'I love programming.', 10),
('Bob', NULL, 5), -- NULL value for bio
('Charlie', '', 0); -- Empty string for bio


SELECT * FROM basics.value_examples;

SELECT id, nikename, bio, store
FROM basics.value_examples 
WHERE bio IS NULL; -- This query selects rows where the bio column has a NULL value.

SELECT id, nikename, bio, store
FROM basics.value_examples
WHERE bio = ''; -- This query selects rows where the bio column has an empty string value.  
