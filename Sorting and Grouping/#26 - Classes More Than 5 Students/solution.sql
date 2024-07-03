/*
Write a solution to find all the classes that have at least five students.
Return the result table in any order.
The result format is in the following example.
+---------+
| class   |
+---------+
| Math    |
+---------+
*/
SELECT
    class
FROM Courses
GROUP BY 1
HAVING count(student) >= 5