-- inner join return only the matching rows both tables 

SELECT 
  users.name AS Author_name,
  posts.title AS Title, 
  posts.status, 
  posts.views
FROM users 
INNER JOIN posts 
ON posts.user_id = users.id 
WHERE posts.status = 'published' 
ORDER BY posts.views DESC;