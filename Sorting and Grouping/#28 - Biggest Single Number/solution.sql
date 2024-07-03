/*
A single number is a number that appeared only once in the MyNumbers table.
Find the largest single number. If there is no single number, report null.
The result format is in the following example.
+-----+
| num |
+-----+
| 6   |
+-----+
*/
WITH cte AS(
    SELECT
        num
    FROM MyNumbers
    GROUP BY 1
    HAVING COUNT(num) < 2
    ORDER BY 1 DESC
    LIMIT 1
)
SELECT
    *
FROM cte
UNION ALL
SELECT
    NULL
WHERE NOT EXISTS (SELECT * FROM cte)