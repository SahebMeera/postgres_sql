-- group by createds groups of rows 
-- WHERE -- filters normal rows before grouping 
-- Having filter groups after grouping 


-- find authors who have return at least 2 posts

SELECT 
  u.name AS Author_name,
  COUNT(u.id) AS total_posts,
  SUM(p.views) AS total_views
FROM users AS u
LEFT JOIN posts AS p
ON u.id = p.user_id
GROUP BY u.id, u.name
HAVING COUNT(p.id ) = 1
ORDER BY total_posts DESC;
