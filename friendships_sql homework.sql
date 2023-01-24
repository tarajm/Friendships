SELECT * FROM friendships;
SELECT * FROM users;


-- Queries create 6 new users

INSERT INTO users(first_name, last_name)
VALUES("Tara", "Massan"), ("Jake", "Blue"), ("Phoebe", "Blue"), ("Jasper", "Blue"), ("Mithee", "Massan"), ("DingDong", "Blue");

-- Queries to have people be friends with others.

INSERT INTO friendships(user_id, friend_id)
VALUES(1,2), (1,4), (1,6);
INSERT INTO friendships(user_id, friend_id)
VALUES(2,1), (2,3), (2,5),(3,2), (3,5), (4,3), (5,1), (5,6), (6,2), (6,3);

-- Query Dispaly the relationships created as shown in the table in the above image

SELECT users.first_name as first_name, users.last_name as last_name, users2.first_name as friend_first_name, users2.last_name as friend_last_name FROM users
JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users as users2 ON users2.id = friendships.friend_id;

-- Ninja Bonus: Return all users who are friends with the first_user, make sure their names are displayed in results

SELECT users2.first_name as first_name, users2.last_name as last_name, users.first_name as friends_with FROM users
JOIN friendships ON users.id = friendships.user_id
LEFT JOIN users as users2 on users2.id = friendships.friend_id
WHERE users.id =1;


-- Return the count of all friendships

SELECT count(*) as num_of_friendships from friendships;

-- Find out who has the most friends and return the count of their friends

SELECT user_id, users.first_name, users.last_name, count(user_id) as num_of_friends from friendships
JOIN users ON users.id = friendships.user_id
GROUP BY user_id
ORDER BY num_of_friends DESC
LIMIT 1;

-- Return the friends of the third user in alphabetical order











