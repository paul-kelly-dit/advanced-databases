create table if not exists FILM (
    FILM_ID INT  not null primary key,
    LENGTH INT not null,
    TITLE VARCHAR(400) not null,
    RENTAL_DURATION INT not null
);

SHOW INDEX FROM film;

SELECT *
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'film';

-- insert all the data from script week3-sample-data.sql

-- now run 

-- add an index
CREATE INDEX film_rental_duration_idx ON film (rental_duration);

SELECT *
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_NAME = 'film';

EXPLAIN SELECT title, rental_duration, length
FROM film
WHERE rental_duration = 3 AND length = 100;

-- any difference?

