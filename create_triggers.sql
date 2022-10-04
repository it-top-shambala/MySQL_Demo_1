DELIMITER |
CREATE TRIGGER trigger_insert_author
    AFTER INSERT ON table_authors
    FOR EACH ROW
    BEGIN
        INSERT INTO table_journal(table_name, action, comment)
            VALUE ('table_authors', 'insert', CONCAT(NEW.last_name, ' ', NEW.first_name));
    END|

DELIMITER ||
CREATE TRIGGER trigger_insert_genre
    AFTER INSERT ON table_genres
    FOR EACH ROW
    BEGIN
        INSERT INTO table_journal(table_name, action, comment)
            VALUE ('table_genres', 'insert', NEW.genre);
    END||

DELIMITER ||
CREATE TRIGGER trigger_insert_book
    AFTER INSERT ON table_books
    FOR EACH ROW
    BEGIN
        INSERT INTO table_journal(table_name, action, comment)
            VALUE ('table_books', 'insert', NEW.title);
    END||