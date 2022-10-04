INSERT INTO table_genres(genre)
VALUES ('драма'),
       ('роман'),
       ('фантастика');

INSERT INTO table_authors(last_name, first_name)
VALUES ('Толстой', 'Лев'),
       ('Пушкин', 'Александр'),
       ('Толстой', 'Алексей');

INSERT INTO table_books(title, genre_id, author_id)
VALUES ('Аэлита',
        (SELECT genre_id
         FROM table_genres
         WHERE genre = 'фантастика'),
        (SELECT author_id
         FROM table_authors
         WHERE last_name = 'Толстой'
           AND first_name = 'Алексей')),
       ('Война и мир',
        (SELECT genre_id
         FROM table_genres
         WHERE genre = 'роман'),
        (SELECT author_id
         FROM table_authors
         WHERE last_name = 'Толстой'
           AND first_name = 'Лев')),
       ('Пиковая дама',
        (SELECT genre_id
         FROM table_genres
         WHERE genre = 'драма'),
        (SELECT author_id
         FROM table_authors
         WHERE last_name = 'Пушкин'));
