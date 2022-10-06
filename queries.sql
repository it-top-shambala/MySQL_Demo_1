SELECT title, last_name, first_name
FROM table_books, table_authors
WHERE table_books.author_id = table_authors.author_id AND
      table_authors.last_name = 'Пушкин';

SELECT title, last_name, first_name
FROM table_books
JOIN table_authors
    ON table_books.author_id = table_authors.author_id
WHERE table_authors.last_name = 'Пушкин';

SELECT * FROM table_books;

DELETE FROM table_authors
WHERE author_id = 3;

-- DROP TABLE table_authors;
-- DROP TABLE table_genres;
-- DROP TABLE table_books;