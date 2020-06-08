-- Question 1 -- 
SELECT * FROM movies.movies;

-- Question 2 --
SELECT title, id FROM movies.movies LIMIT 10;

-- Question 3 --

SELECT * FROM movies.movies WHERE id = 485

-- Question 4 --

SELECT id FROM movies.movies WHERE title = 'Made in America (1993)';

-- Question 5 --

SELECT * FROM movies.movies ORDER BY title ASC LIMIT 10;

-- Question 6 --

SELECT * FROM movies.movies WHERE title LIKE '%2002%';

-- Question 7 --

SELECT * FROM movies.movies WHERE title LIKE '%GodFather, The%';

-- Question 8 --

SELECT * FROM movies.movies WHERE genres  LIKE '%Comedy%';

-- Question 9 --

SELECT * FROM movies.movies WHERE genres LIKE '%Comedy%' AND title LIKE '%2002%';

-- Question 10 --

SELECT * FROM movies.movies WHERE genres LIKE '%Comedy%' AND '%death%' OR title LIKE '%die%';

-- Question 11 --

SELECT * FROM movies.movies WHERE (title LIKE '%2002%' OR title LIKE '%2001%') AND title LIKE '%super%';

-- Question 12 --

CREATE TABLE `movies`.`actors` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `character_name` VARCHAR(45) NOT NULL,
  `movie_id` INT NOT NULL,
  `birthday` DATETIME NOT NULL,
  PRIMARY KEY (`id`));


-- Question 13 --

INSERT INTO movies.actors 
(name, character_name, movie_id, birthday)
VALUES
('Henry Cavill', 'Superman', '136864', '1983-05-05'),

-- Question 14 --

ALTER TABLE `movies`.`movies` 
ADD COLUMN `mpaa` INT NULL AFTER `genres`,
CHANGE COLUMN `id` `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id`);
;

UPDATE movies.movies
SET mpaa = 1
WHERE id = 1;

UPDATE movies.movies
SET mpaa = 3
WHERE id = 2;

UPDATE movies.movies
SET mpaa = 3
WHERE id = 3;

UPDATE movies.movies
SET mpaa = 4
WHERE id = 4;

UPDATE movies.movies
SET mpaa = 5
WHERE id = 5;

--Joins--
-- Question 1 --

SELECT mov.title, rat.rating  
FROM movies.movies mov
INNER JOIN movies.ratings rat
ON mov.id = rat.movie_id
WHERE title LIKE '%godfather%';

-- Question 2 --

SELECT mov.title, rat.rating  
FROM movies.movies mov
INNER JOIN movies.ratings rat
ON mov.id = rat.movie_id
WHERE title LIKE '%godfather%'
ORDER BY title ASC;

-- Question 3 --

SELECT mov.title, lin.imdb_Id FROM movies.movies mov
INNER JOIN movies.links lin
ON mov.id = lin.movie_Id
WHERE (genres LIKE '%comedy%'
AND title LIKE '%2005%');

-- Question 4 --


-- aggregation --

-- Question 1 --
SELECT
AVG(r.rating) average
FROM movies.ratings r
WHERE r.movie_id = 1;
-- Question 2 --
SELECT
SUM(r.rating) SUM
FROM movies.ratings r
WHERE r.movie_id = 1;
-- Question 3 --
SELECT COUNT(*) FROM movies.movies
WHERE genres LIKE '%comedy%';
-- Question 4 --
--No user--
-- Question 5 --


-- Question 6 --

-- Question 7 --

-- Question 8 --
SELECT r.movie_id, AVG(r.rating) a
FROM movies.ratings r
GROUP BY r.movie_id
HAVING AVG (r.rating) > 4;
