/*
Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.
The result format is in the following example.
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
*/
WITH first_login AS (
    SELECT
        player_id,
        MIN( event_date ) AS first_login_date
    FROM Activity
    GROUP BY player_id
)

SELECT
    ROUND(    
        COUNT(DISTINCT a.player_id) FILTER (
                WHERE ac.player_id IS NOT NULL
                    AND fl.first_login_date = a.event_date
            )
            / COUNT(DISTINCT a.player_id)::numeric,
        2
    ) AS fraction
FROM Activity a
LEFT JOIN 
    Activity ac 
        ON a.player_id = ac.player_id
            AND a.event_date + 1 = ac.event_date
LEFT JOIN
    first_login fl
        ON a.player_id = fl.player_id