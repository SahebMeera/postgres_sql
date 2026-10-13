-- many to many relationships 
-- one post can have multiple tags
-- one tags can be associate with multiple posts
-- posts.id === post_tags.post_id
-- tags.id === post_tags.tags_id

SELECT 
   posts.title AS post_title,
   tags.name AS tag_name
FROM posts 
INNER JOIN post_tags 
ON post_tags.post_id = posts.id
INNER JOIN tags 
ON post_tags.tag_id = tags.id
ORDER BY posts.title DESC;

SELECT 
   posts.title AS post_title,
   tags.name AS tag_name
FROM tags 
INNER JOIN post_tags 
ON post_tags.tag_id = tags.id
INNER JOIN posts 
ON post_tags.post_id = posts.id
ORDER BY posts.title DESC;