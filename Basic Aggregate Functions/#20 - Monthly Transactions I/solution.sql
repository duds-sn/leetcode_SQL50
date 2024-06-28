/*
Write an SQL query to find for each month and country, the number of transactions and their total amount, 
    the number of approved transactions and their total amount.
Return the result table in any order.
The query result format is in the following example.
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+
*/

SELECT 
    to_char(t.trans_date, 'YYYY-MM'),
    country,
    COUNT(t.id) AS trans_count,
    ( COUNT(t.id) FILTER ( WHERE t.state = 'approved' ) ) AS approved_count,
    SUM( t.amount ) AS trans_total_amount,
    ( COALESCE(SUM(t.amount) FILTER ( WHERE t.state = 'approved' )) ) AS approved_total_amount
    
FROM transactions t
GROUP BY to_char(t.trans_date, 'YYYY-MM'), country