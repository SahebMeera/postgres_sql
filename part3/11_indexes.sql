--- idX_posts_status
-- idx -- index
-- posts -- table name
-- status -- colum name

CREATE INDEX IF NOT EXISTS idX_posts_status 
 ON posts(status);

-- composite index

CREATE INDEX if NOT EXISTS idx_posts_status_views
ON posts(status, views DESC)