DROP TABLE IF EXISTS basics.app_events;

CREATE TABLE basics.app_events (
   id UUID PRIMARY KEY DEFAULT gen_random_uuid(), -- This column is a universally unique identifier (UUID) that serves as the primary key for the table. It is generated using the "gen_random_uuid()" function from the "pgcrypto" extension.
    event_name VARCHAR(100) NOT NULL,
    -- user_id INTEGER REFERENCES basics.users(id) ON DELETE CASCADE, -- This foreign key references the "id" column in the "users" table. If a user is deleted, all their associated events will also be deleted.
    metadata JSONB, -- This column can store additional data related to the event in JSON format.
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- query to insert some sample data into the "app_events" table for testing purposes.

INSERT INTO basics.app_events (event_name, metadata) VALUES
('sign_up', '{"source": "web", "campaign": "spring_sale"}'),
('login', '{"device": "mobile", "os": "iOS"}'),
('purchase', '{"product_id": 123, "amount": 49.99}');

SELECT * FROM basics.app_events;

SELECT  event_name, metadata ->> 'source' AS source, metadata ->> 'campaign' AS campaign
FROM basics.app_events
WHERE metadata ? 'source' AND metadata ? 'campaign';