/*
Write a solution to find each query_name, the quality and poor_query_percentage.
Both quality and poor_query_percentage should be rounded to 2 decimal places.
Return the result table in any order.
The result format is in the following example.
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
*/

SELECT 
    query_name,
    ROUND( AVG( rating::numeric / position ), 2 ) quality,
    ROUND( 100 * ( COUNT( rating ) FILTER (WHERE rating < 3) )::numeric / COUNT( rating ), 2 ) poor_query_percentage 
FROM queries
WHERE query_name IS NOT NULL
GROUP BY query_name;