-- foreign keys is col that points to the primary key of another 
-- users.id -- parent key
-- posts.user_id - foregin key
-- every post u will create that must belong to an existing users

SELECT id , name FROM users;

SELECT id,user_id,title FROM posts;

