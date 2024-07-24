/*
Write a solution to:

- Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
- Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.
The result format is in the following example.

+--------------+
| results      |
+--------------+
| Daniel       |
| Frozen 2     |
+--------------+
*/
(
	SELECT
		u.name AS results
	FROM Users u
	LEFT JOIN MovieRating r
		ON u.user_id = r.user_id
	GROUP BY 1
	ORDER BY COUNT( r.movie_id ) DESC, 1 ASC
	LIMIT 1
)

UNION

(
	SELECT
		m.title AS results
	FROM Movies m
	LEFT JOIN MovieRating r
		ON m.movie_id = r.movie_id
	WHERE to_char(r.created_at, 'YYYY-MM') = '2020-02'
	GROUP BY 1
	ORDER BY AVG( r.rating ) DESC, 1 ASC
	LIMIT 1
)