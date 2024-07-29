/*
Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
or
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
*/
WITH cte AS (
	SELECT
		Salary SecondHighestSalary
	FROM (
		SELECT
			*,
			DENSE_RANK() OVER (ORDER BY salary DESC) rank
		FROM Employee
	)
	WHERE rank = 2
)
SELECT 
	*
FROM (
	SELECT 
		SecondHighestSalary
	FROM cte
	UNION ALL
	SELECT NULL
)
LIMIT 1