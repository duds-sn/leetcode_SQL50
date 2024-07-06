/*
Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
Return the result table in any order.
The result format is in the following example.
+------------+-------+
| product_id | price |
+------------+-------+
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |
+------------+-------+
*/

WITH last_update AS (
    SELECT
        DISTINCT product_id,
        MAX(change_date) max_date
    FROM products
    WHERE change_date <= '2019-08-16'
    GROUP BY 1
),
unique_products AS (
    SELECT
        DISTINCT product_id
    FROM products
)

SELECT
    u.product_id,
    COALESCE(p.new_price, 10) price
FROM unique_products u
LEFT JOIN last_update l ON l.product_id = u.product_id
LEFT JOIN products p ON p.product_id = u.product_id AND p.change_date = l.max_date