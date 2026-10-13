-- db --> schema --> table --> row --> column

-- This SQL script creates a schema named "basics" and a table named "users" within that schema. The "users" table has the following columns:
-- 1. id: A serial primary key that auto-increments for each new user.
CREATE SCHEMA IF NOT EXISTS basics;

CREATE EXTENSION IF NOT EXISTS pgcrypto; -- This extension is used for cryptographic functions, which can be useful for hashing passwords or other sensitive data.

-- query to create the "users" table within the "basics" schema
SELECT schema_name FROM information_schema.schemata ORDER BY schema_name;

-- CREATE TABLE basics.users (
--     id SERIAL PRIMARY KEY,
--     username VARCHAR(50) NOT NULL UNIQUE,
--     email VARCHAR(100) NOT NULL UNIQUE,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );