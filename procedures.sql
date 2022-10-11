DELIMITER |
CREATE FUNCTION function_get_id_author(first TEXT, last TEXT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE id INT DEFAULT 0;
    SELECT author_id INTO id FROM table_authors WHERE last_name = last AND first_name = first;
    RETURN id;
END |

DELIMITER |
CREATE PROCEDURE procedure_insert_author(IN first TEXT, IN last TEXT, OUT id INT)
BEGIN
    -- SELECT @exists := COUNT(author_id) FROM table_authors WHERE last_name = last AND first_name = first;
    SET @exists := EXISTS(SELECT author_id FROM table_authors WHERE last_name = last AND first_name = first);

    IF @exists > 0 THEN
        BEGIN
            SET id = function_get_id_author(first, last);
        END ;
    ELSE
        BEGIN
            INSERT INTO table_authors(last_name, first_name) VALUE (last, first);
            SET id = function_get_id_author(first, last);
        END ;
    END IF ;
END |

DELIMITER |
CREATE FUNCTION function_get_id_genre(genre_name TEXT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE id INT DEFAULT 0;
    SELECT genre_id INTO id FROM table_genres WHERE genre = genre_name;
    RETURN id;
END |

DELIMITER |
CREATE PROCEDURE procedure_insert_genre(IN genre_name TEXT, OUT id INT)
BEGIN
    SET @exists := EXISTS(SELECT genre_id FROM table_genres WHERE genre = genre_name);

    IF @exists > 0 THEN
        BEGIN
            SET id = function_get_id_genre(genre_name);
        END ;
    ELSE
        BEGIN
            INSERT INTO table_genres(genre) VALUE (genre_name);
            SET id = function_get_id_genre(genre_name);
        END ;
    END IF ;
END |

DELIMITER |
CREATE FUNCTION function_get_id_book(book_title TEXT, first TEXT, last TEXT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE id INT DEFAULT 0;
    SELECT book_id INTO id
                   FROM table_books
                   WHERE title = book_title AND
                         author_id = function_get_id_author(first, last);
    RETURN id;
END |

DELIMITER |
CREATE PROCEDURE procedure_insert_book(IN first TEXT, IN last TEXT, IN genre_name TEXT, IN book_title TEXT, OUT id INT)
BEGIN
    DECLARE id_author INT DEFAULT 0;
    DECLARE id_genre INT DEFAULT 0;

    SET @exists := EXISTS(SELECT book_id FROM table_books WHERE title = book_title AND author_id = function_get_id_author(first, last));

    IF @exists THEN
        BEGIN
            SET id = function_get_id_book(book_title, first, last);
        END ;
    ELSE
        BEGIN
            CALL procedure_insert_author(first, last, id_author);
            CALL procedure_insert_genre(genre_name, id_genre);
            INSERT INTO table_books(title, genre_id, author_id) VALUES (book_title, id_genre, id_author);

            SET id = function_get_id_book(book_title, first, last);
        END ;
    END IF ;
END |