/*
Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
Return the result table in any order.
The result format is in the following example.
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
*/

SELECT
    c.customer_id
FROM Customer c
LEFT JOIN Product p ON p.product_key = c.product_key
GROUP BY 1
HAVING COUNT(DISTINCT c.product_key) 
    = (
        SELECT 
            COUNT(product_key) 
        FROM Product
    )