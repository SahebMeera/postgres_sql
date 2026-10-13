-- Enable pgcrypto so PostgreSQL can generate UUID values.
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Drop tables in dependency order so the foreign-key constraints do not block the reset.
DROP TABLE IF EXISTS post_tags;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS users;

-- Store each user's name. A user can create multiple posts.
CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

-- Store posts created by users. Each post belongs to one user.
CREATE TABLE posts (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES users(id),
    title TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'draft'
      CHECK (status IN ('draft', 'published')),
    views INTEGER NOT NULL DEFAULT 0 CHECK (views >= 0)
);

-- Store comments on posts. Each comment belongs to one post.
CREATE TABLE comments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    post_id UUID NOT NULL REFERENCES posts(id),
    body TEXT NOT NULL
);

-- Store tags that can be assigned to posts.
CREATE TABLE tags (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

-- Link posts and tags in a many-to-many relationship.
-- The composite primary key prevents the same tag being added to a post more than once.
CREATE TABLE post_tags (
    post_id UUID NOT NULL REFERENCES posts(id),
    tag_id UUID NOT NULL REFERENCES tags(id),
    PRIMARY KEY (post_id, tag_id)
);

-- Insert seven users. Their UUIDs are generated automatically.
INSERT INTO users (name) VALUES
    ('Alice Johnson'),
    ('Bob Smith'),
    ('Carol Davis'),
    ('David Wilson'),
    ('Eva Brown'),
    ('Frank Miller'),
    ('Grace Taylor');

-- Insert seven posts. Each user_id is looked up by the user's name.
INSERT INTO posts (user_id, title, status, views) VALUES
    ((SELECT id FROM users WHERE name = 'Alice Johnson'), 'Getting Started with PostgreSQL', 'published', 120),
    ((SELECT id FROM users WHERE name = 'Bob Smith'), 'Understanding SQL Joins', 'published', 85),
    ((SELECT id FROM users WHERE name = 'Carol Davis'), 'Database Design Basics', 'draft', 0),
    ((SELECT id FROM users WHERE name = 'David Wilson'), 'Working with UUIDs', 'published', 64),
    ((SELECT id FROM users WHERE name = 'Eva Brown'), 'Useful SQL Constraints', 'draft', 0),
    ((SELECT id FROM users WHERE name = 'Frank Miller'), 'Writing Better Queries', 'published', 203),
    ((SELECT id FROM users WHERE name = 'Grace Taylor'), 'Introduction to Indexes', 'published', 47);

-- Insert seven comments. Each post_id is looked up by the post title.
INSERT INTO comments (post_id, body) VALUES
    ((SELECT id FROM posts WHERE title = 'Getting Started with PostgreSQL'), 'This introduction was very helpful.'),
    ((SELECT id FROM posts WHERE title = 'Understanding SQL Joins'), 'The join examples made the topic clear.'),
    ((SELECT id FROM posts WHERE title = 'Database Design Basics'), 'Looking forward to the finished post.'),
    ((SELECT id FROM posts WHERE title = 'Working with UUIDs'), 'Thanks for explaining UUIDs.'),
    ((SELECT id FROM posts WHERE title = 'Useful SQL Constraints'), 'Constraints are important for data quality.'),
    ((SELECT id FROM posts WHERE title = 'Writing Better Queries'), 'These query tips saved me time.'),
    ((SELECT id FROM posts WHERE title = 'Introduction to Indexes'), 'Please share more about indexes.');

-- Insert seven tags. Their UUIDs are generated automatically.
INSERT INTO tags (name) VALUES
    ('PostgreSQL'),
    ('SQL'),
    ('Database Design'),
    ('UUID'),
    ('Constraints'),
    ('Queries'),
    ('Indexes');

-- Link each post to its tag using scalar subqueries to look up their generated IDs.
INSERT INTO post_tags (post_id, tag_id) VALUES
    ((SELECT id FROM posts WHERE title = 'Getting Started with PostgreSQL'), (SELECT id FROM tags WHERE name = 'PostgreSQL')),
    ((SELECT id FROM posts WHERE title = 'Understanding SQL Joins'), (SELECT id FROM tags WHERE name = 'SQL')),
    ((SELECT id FROM posts WHERE title = 'Database Design Basics'), (SELECT id FROM tags WHERE name = 'Database Design')),
    ((SELECT id FROM posts WHERE title = 'Working with UUIDs'), (SELECT id FROM tags WHERE name = 'UUID')),
    ((SELECT id FROM posts WHERE title = 'Useful SQL Constraints'), (SELECT id FROM tags WHERE name = 'Constraints')),
    ((SELECT id FROM posts WHERE title = 'Writing Better Queries'), (SELECT id FROM tags WHERE name = 'Queries')),
    ((SELECT id FROM posts WHERE title = 'Introduction to Indexes'), (SELECT id FROM tags WHERE name = 'Indexes'));