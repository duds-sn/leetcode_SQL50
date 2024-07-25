/*
Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.
+----+-----+
| id | num |
+----+-----+
| 3  | 3   |
+----+-----+
*/
WITH cte AS (
	SELECT
		requester_id id
	FROM RequestAccepted
	UNION ALL
	SELECT
		accepter_id id
	FROM RequestAccepted
)
SELECT
	id,
	COUNT(id) num
FROM cte
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1