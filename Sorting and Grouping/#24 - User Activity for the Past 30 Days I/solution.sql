/*
Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.
Return the result table in any order.
The result format is in the following example.
+------------+--------------+ 
| day        | active_users |
+------------+--------------+ 
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |
+------------+--------------+
*/
SELECT
    activity_date "day",
    COUNT(DISTINCT user_id) active_users 
FROM Activity
WHERE activity_date BETWEEN (DATE '2019-07-27' - 29) AND '2019-07-27'
GROUP BY 1