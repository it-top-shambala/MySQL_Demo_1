INSERT INTO table_genres(genre) VALUES ('драма'),
                                       ('роман'),
                                       ('фантастика');

INSERT INTO table_authors(last_name, first_name) VALUES ('Толстой', 'Лев'),
                                                        ('Пушкин', 'Александр'),
                                                        ('Толстой', 'Алексей');

INSERT INTO table_books(title, genre_id, author_id) VALUES ('Аэлита', 3, 3),
                                                           ('Война и мир', 2, 1),
                                                           ('Пиковая дама', 1, 2);
