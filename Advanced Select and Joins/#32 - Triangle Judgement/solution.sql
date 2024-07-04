/*
Report for every three line segments whether they can form a triangle.
Return the result table in any order.
The result format is in the following example.
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+
*/

SELECT
    x,
    y,
    z,
    CASE 
        WHEN (
            GREATEST(x, y, z) 
            < ( x + y + z - GREATEST(x, y, z) )
        ) THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle