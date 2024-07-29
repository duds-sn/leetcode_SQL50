/*
Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

Return the result table in any order.

The result format is in the following example.
+--------------------+---------+
| product_name       | unit    |
+--------------------+---------+
| Leetcode Solutions | 130     |
| Leetcode Kit       | 100     |
+--------------------+---------+
*/
SELECT
	p.product_name,
	SUM(o.unit) unit
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
WHERE TO_CHAR(order_date, 'YYYY-MM') = '2020-02'
GROUP BY 1
HAVING SUM(o.unit) >= 100;