/*
For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.
Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
Return the result table ordered by employee_id.
The result format is in the following example.
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
*/

SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) reports_count,
    ROUND(AVG(e.age), 0) average_age
FROM Employees m, Employees e
WHERE m.employee_id = e.reports_to
GROUP BY 1, 2
ORDER BY 1