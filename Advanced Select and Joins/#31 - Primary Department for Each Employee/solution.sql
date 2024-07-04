/*
Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.
Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
Return the result table in any order.
The result format is in the following example.
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+
*/

SELECT
    employee_id,
    MAX(department_id) department_id
FROM Employee
GROUP BY 1
HAVING COUNT(primary_flag) = 1
UNION
SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'