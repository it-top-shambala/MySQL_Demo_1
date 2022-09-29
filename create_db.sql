CREATE SCHEMA books_db;

CREATE TABLE table_authors (
    author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL,
    patronymic TEXT NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_death DATE NULL
);