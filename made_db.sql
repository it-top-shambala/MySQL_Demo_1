CREATE SCHEMA book_db_top;

CREATE TABLE  table_book(
    name_book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_book TEXT NOT NULL,
    made_year_book TEXT NOT NULL,
    others_property TEXT NOT NULL,
    price int NOT NULL
);
CREATE TABLE table_author(
    name_book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_author TEXT NOT NULL,
    years_of_life TEXT NOT NULL
);
CREATE TABLE table_genre
(
    name_book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre    TEXT NOT NULL
);
