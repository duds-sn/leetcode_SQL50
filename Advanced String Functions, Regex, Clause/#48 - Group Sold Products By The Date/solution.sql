/*
Write a solution to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

The result format is in the following example.
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+
*/
WITH cte AS (
	SELECT
		*
	FROM Activities
	ORDER BY product
)
SELECT
	sell_date,
	COUNT(DISTINCT product) num_sold,
	STRING_AGG(DISTINCT product, ',') products
FROM cte
GROUP BY sell_date
ORDER BY 1