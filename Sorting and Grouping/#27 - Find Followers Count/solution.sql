/*
Write a solution that will, for each user, return the number of followers.
Return the result table ordered by user_id in ascending order.
The result format is in the following example.
+---------+----------------+
| user_id | followers_count|
+---------+----------------+
| 0       | 1              |
| 1       | 1              |
| 2       | 2              |
+---------+----------------+
*/
SELECT
    "user_id",
    COUNT(follower_id) followers_count
FROM Followers
GROUP BY 1
ORDER BY 1 ASC