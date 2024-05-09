/*
Write a solution to find the percentage of the users registered in each contest rounded to two decimals.
Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
The result format is in the following example.
+------------+------------+
| contest_id | percentage |
+------------+------------+
| 208        | 100.0      |
| 209        | 100.0      |
| 210        | 100.0      |
| 215        | 66.67      |
| 207        | 33.33      |
+------------+------------+
*/
WITH total_users AS (
  SELECT COUNT(*) AS total_count
  FROM users
)
SELECT 
    r.contest_id,
    ROUND(
        100 * COUNT(r.user_id)::numeric / total_users.total_count,
        2
    )
    AS percentage
FROM Register r
INNER JOIN total_users ON 1=1
GROUP BY r.contest_id, total_users.total_count
ORDER BY percentage DESC, r.contest_id ASC;





