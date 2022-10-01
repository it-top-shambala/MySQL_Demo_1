CREATE SCHEMA books_db;

CREATE TABLE table_authors (
    author_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    patronymic VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    date_of_death DATE NULL
);

CREATE TABLE table_genres (
    genre_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    genre VARCHAR(100) NOT NULL
);

CREATE TABLE table_age_categories (
    age_category_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    age_category VARCHAR(3) NOT NULL
);

CREATE TABLE table_books(
    book_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author INT,
    genre INT,
    year_of_publishing INT NOT NULL,
    age_category INT,
    price FLOAT,
    FOREIGN KEY (genre)
    REFERENCES table_genres(genre_id),
    FOREIGN KEY (author)
    REFERENCES table_authors(author_id),
    FOREIGN KEY (age_category)
    REFERENCES table_age_categories(age_category_id)
);