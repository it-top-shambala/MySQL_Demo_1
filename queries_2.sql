SELECT COUNT(*)
FROM table_authors;

SELECT author_id, last_name, first_name
FROM table_authors;

SELECT title, author_id
FROM table_books;

SELECT COUNT(*)
FROM table_books
WHERE author_id = 1;

CREATE VIEW view_authors_books AS
SELECT CONCAT(last_name, ' ', first_name) AS 'Автор',
       COUNT(*)                           AS 'Количество книг'
FROM table_books
         JOIN table_authors
              ON table_books.author_id = table_authors.author_id
GROUP BY table_books.author_id;

SELECT view_authors_books.Автор,
       MAX(view_authors_books.`Количество книг`)
FROM view_authors_books;
