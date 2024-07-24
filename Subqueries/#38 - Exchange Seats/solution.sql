/*
Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.
The result format is in the following example.
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
*/

WITH cte AS (
	SELECT
		*,
		LEAST(
			id - (1 - ( 1 + MOD(id, 2) ) * MOD(id, 2)),
			(
				SELECT COUNT(id) 
				FROM Seat
			)
		) new_id
	FROM Seat
)
SELECT
	s.id,
	c.student
FROM Seat s
LEFT JOIN cte c ON s.id = c.new_id