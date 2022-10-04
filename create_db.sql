-- CREATE SCHEMA books_db;

CREATE TABLE table_authors (
    author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    last_name TEXT NOT NULL,
    first_name TEXT NOT NULL
);

CREATE TABLE table_genres (
    genre_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre TEXT NOT NULL
);

CREATE TABLE table_books (
    book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title TEXT NOT NULL,
    genre_id INT NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES table_genres(genre_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    FOREIGN KEY (author_id) REFERENCES table_authors(author_id)
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
