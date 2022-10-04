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

CREATE TABLE table_journal (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_time DATETIME NOT NULL DEFAULT NOW(),
    table_name TEXT NOT NULL,
    action TEXT NOT NULL,
    comment TEXT NOT NULL
)