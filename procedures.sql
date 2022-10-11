-- DROP FUNCTION function_get_id_author;
DELIMITER |
CREATE FUNCTION function_get_id_author(first TEXT, last TEXT) RETURNS INT DETERMINISTIC
BEGIN
    DECLARE id INT DEFAULT 0;
    SELECT author_id INTO id FROM table_authors WHERE last_name = last AND first_name = first;
    RETURN id;
END |

SELECT function_get_id_author('Алексей', 'Толстой');

-- DROP PROCEDURE procedure_insert_author;
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

SET @test_id := 0;
CALL procedure_insert_author('Виктор', 'Гюго', @test_id);
SELECT @test_id;

