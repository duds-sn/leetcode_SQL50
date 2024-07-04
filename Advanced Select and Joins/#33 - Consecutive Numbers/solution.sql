/*
Find all numbers that appear at least three times consecutively.
Return the result table in any order.
The result format is in the following example.
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/

SELECT
    DISTINCT l.num ConsecutiveNums
FROM Logs l, Logs o, Logs g
WHERE l.id - 1 = o.id AND l.id - 2 = g.id
    AND l.num = o.num AND l.num = g.num