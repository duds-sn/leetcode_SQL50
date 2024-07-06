/*
There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.
Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit
The result format is in the following example.
+-------------+
| person_name |
+-------------+
| John Cena   |
+-------------+
*/
WITH cte AS (
    SELECT
        person_id,
        person_name,
        weight,
        SUM( weight ) OVER ( ORDER BY turn ASC ) cumulative_weight
    FROM Queue
)
SELECT
    person_name
FROM cte
WHERE cumulative_weight <= 1000
ORDER BY cumulative_weight DESC
LIMIT 1