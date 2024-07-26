/*
Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

For Pandas users, please note that you are supposed to modify Person in place.

After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.

The result format is in the following example.
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
*/
DELETE
FROM Person
WHERE id IN(
	SELECT
		id
	FROM(
		SELECT
			id,
			email,
			RANK() OVER (PARTITION BY email ORDER BY id ASC) rank
		FROM Person
	)
	WHERE rank > 1
);
SELECT * FROM Person;

DELETE
FROM Person
WHERE id NOT IN(
	SELECT
		MIN(id)
	FROM Person
	GROUP BY email
);

SELECT * FROM Person;