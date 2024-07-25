/*
You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

The result format is in the following example.
+--------------+--------------+----------------+
| visited_on   | amount       | average_amount |
+--------------+--------------+----------------+
| 2019-01-07   | 860          | 122.86         |
| 2019-01-08   | 840          | 120            |
| 2019-01-09   | 840          | 120            |
| 2019-01-10   | 1000         | 142.86         |
+--------------+--------------+----------------+
*/
SELECT
	c.visited_on,
	SUM(u.amount) amount,
	ROUND( SUM(u.amount) / 7::numeric, 2) average_amount
FROM (
	SELECT
		DISTINCT visited_on 
	FROM Customer
) c
LEFT JOIN Customer u
	ON u.visited_on BETWEEN c.visited_on - 6 AND c.visited_on
GROUP BY 1
HAVING COUNT( DISTINCT u.visited_on ) = 7
ORDER BY 1
