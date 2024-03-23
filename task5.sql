/*задача 5
Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу 
"Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".
(по желанию)*/


DROP FUNCTION IF EXISTS hello;
DELIMITER $$ 
CREATE FUNCTION hello()
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
	DECLARE res VARCHAR(20);
    IF CURTIME() BETWEEN '06:00:00' AND '11:59:59' THEN
        SET res = "Доброе утро! ";
    ELSEIF CURTIME() BETWEEN '12:00:00' AND '17:59:59' THEN
        SET res = "Добрый день!";
    ELSEIF CURTIME() BETWEEN '18:00:00' AND '23:59:59' THEN
        SET res = "Добрый вечер!";
    ELSE
        SET res = "Доброй ночи! ";
    END IF;
    RETURN res; 
END$$ 
DELIMITER ;

SELECT hello();
