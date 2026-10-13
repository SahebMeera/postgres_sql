-- aggresgate functions are always calculate one result from many rows
-- COUNT()--- number of rows 
-- SUM() -- total values
--- AVERage() --- some of the values 
--MAX() --max values 

--admin dashboard , reports , analytces, admin panels

-- select * from posts;

SELECT 
   COUNT(*) AS total_posts,
   COUNT(*) FILTER (WHERE status = 'draft') AS published_count,
   SUM(views) AS total_views,
   AVG(views) AS average_views,
   MIN(views) AS lowest_views,
   MAX(views) AS highest_views
FROM posts;