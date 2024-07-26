/*
A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.

The result format is in the following example.
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |
+------------+----------+--------+
*/
WITH cte AS(
	SELECT
		*,
		DENSE_RANK() OVER (
			PARTITION BY departmentid 
			ORDER BY Salary DESC
		)
	FROM Employee
)
SELECT
	d.name Department,
	c.name Employee,
	c.salary Salary
FROM Department d
LEFT JOIN cte c
	ON d.id = c.departmentid
WHERE c.dense_rank <= 3
ORDER BY 1, 3 DESC, 2
