/*
Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The result format is in the following example.
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
*/
SELECT
	user_id,
	UPPER(SUBSTRING(name from 1 for 1)) || LOWER(SUBSTRING(name from 2 for LENGTH(name))) name
FROM Users
ORDER BY 1
