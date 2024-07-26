/*
Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

The result format is in the following example.
+----------+
| tiv_2016 |
+----------+
| 45.00    |
+----------+
*/

-- SELECT
-- 	i.pid
-- FROM Insurance i
-- INNER JOIN Insurance n 
-- 	ON i.lat = n.lat AND i.lon = n.lon AND i.pid <> n.pid;

-- SELECT
-- 	i.pid
-- FROM Insurance i, Insurance n
-- WHERE i.tiv_2015 = n.tiv_2015
-- GROUP BY i.pid
-- HAVING COUNT(i.tiv_2015) > 1;

WITH no_city AS(
	SELECT
		i.pid
	FROM Insurance i
	INNER JOIN Insurance n 
		ON i.lat = n.lat AND i.lon = n.lon AND i.pid <> n.pid 
),
rep_tiv AS (
	SELECT
		i.pid
	FROM Insurance i, Insurance n
	WHERE i.tiv_2015 = n.tiv_2015
	GROUP BY i.pid
	HAVING COUNT(i.tiv_2015) > 1
)

SELECT
	ROUND( SUM(i.tiv_2016)::numeric, 2) tiv_2016
FROM Insurance i
INNER JOIN rep_tiv r 
	ON i.pid = r.pid
LEFT JOIN no_city n
	ON i.pid = n.pid
WHERE n.pid IS NULL;

WITH no_city AS(
	SELECT
		i.pid
	FROM Insurance i
	INNER JOIN Insurance n 
		ON i.lat = n.lat AND i.lon = n.lon AND i.pid <> n.pid 
),
rep_tiv AS (
	SELECT
		i.pid
	FROM Insurance i, Insurance n
	WHERE i.tiv_2015 = n.tiv_2015
	GROUP BY i.pid
	HAVING COUNT(i.tiv_2015) > 1
)

SELECT
	ROUND( SUM(i.tiv_2016)::numeric, 2) tiv_2016
FROM Insurance i
WHERE i.pid IN (SELECT pid FROM rep_tiv) AND i.pid NOT IN (SELECT pid FROM no_city);