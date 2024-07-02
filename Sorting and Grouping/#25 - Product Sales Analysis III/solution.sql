/*
Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
Return the resulting table in any order.
The result format is in the following example.
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
*/
WITH cte AS(
    SELECT
            product_id,
            MIN("year") first_year
        FROM Sales
        GROUP BY 1
)
SELECT
    fy.product_id,
    fy.first_year,
    s.quantity,
    s.price
FROM cte AS fy
LEFT JOIN Sales s ON
    s.product_id = fy.product_id
    AND s.year = fy.first_year