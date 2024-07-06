/*
Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.
Return the result table ordered by employee_id.
The result format is in the following example.
+-------------+
| employee_id |
+-------------+
| 11          |
+-------------+
*/

SELECT
    e.employee_id
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.employee_id
WHERE m.employee_id IS NULL AND e.manager_id IS NOT NULL AND e.salary < 30_000
ORDER BY e.employee_id