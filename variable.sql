SET @value := 123;
SET @value := TRUE;
SET @value = 'test';
SELECT @value;

SELECT @value2 := 'test';
SELECT @value2;

SELECT @authors := CONCAT(last_name, ' ', first_name)
FROM table_authors;
SELECT @authors;

-- SET @books := SELECT title FROM table_books;

