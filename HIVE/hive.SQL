CREATE VIEW IF NOT EXISTS topmovieWithID AS
SELECT movie_id, COUNT(movie_id) AS ratingCount
FROM ratings
GROUP BY movie_id
ORDER BY ratingCount DESC;
 

SELECT n.name, ratingCount
FROM topmovieWithID t
JOIN movie_names n
ON t.movie_id = n.movie_id;



CREATE VIEW IF NOT EXISTS avgRatings AS
SELECT movie_id, AVG(rating) as avgRating, COUNT(movie_id) as ratingCount
FROM ratings
GROUP BY movie_id
ORDER BY avgRating DESC;

SELECT n.name, n.movie_id, avgRating
FROM avgRatings ar
JOIN movie_names n
ON n.movie_id = ar.movie_id
WHERE ratingCount > 10;


DROP VIEW topmovieWithID;
DROP VIEW avgRatings;
