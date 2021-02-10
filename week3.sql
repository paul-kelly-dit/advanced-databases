create table if not exists FILM (
    FILM_ID INT  not null primary key,
    LENGTH INT not null,
    TITLE VARCHAR(400) not null,
    RENTAL_DURATION INT not null
);

SHOW INDEX FROM film;

