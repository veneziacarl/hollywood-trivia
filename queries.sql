-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

SELECT movies.title, movies.rating FROM movies WHERE movies.rating IS NOT NULL ORDER BY movies.rating ASC LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

SELECT movies.title FROM movies WHERE movies.rating IS NULL ORDER BY movies.title ASC;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

SELECT movies.title FROM movies WHERE movies.synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

SELECT movies.title AS title, movies.year AS year, movies.rating AS rating
FROM movies JOIN genres
ON movies.genre_id = genres.id
WHERE genres.name = 'Science Fiction & Fantasy'
AND movies.year > 1979
AND movies.year < 1990
ORDER BY movies.rating DESC;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

SELECT actors.name, movies.title, movies.year
FROM cast_members
JOIN actors
ON cast_members.actor_id = actors.id
LEFT OUTER JOIN movies
ON cast_members.movie_id = movies.id
WHERE cast_members.character LIKE 'James Bond'
ORDER BY movies.year ASC;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

SELECT movies.title, movies.year, genres.name
FROM movies
JOIN genres
ON movies.genre_id = genres.id
ORDER BY genres.name, movies.title;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

SELECT movies.title, movies.year, studios.name
FROM movies
LEFT OUTER JOIN studios
ON movies.studio_id = studios.id
JOIN genres
ON movies.genre_id = genres.id
WHERE genres.name LIKE 'Horror'
ORDER BY movies.year  
LIMIT 5;
