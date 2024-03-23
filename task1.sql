/* задача 1 
Создайте процедуру ИЛИ функцию, которая принимает кол-во сек и формат их в кол-во дней, 
часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' */

DROP PROCEDURE IF EXISTS get_interval;
DELIMITER $$ -- Начало процедуры 
CREATE PROCEDURE get_interval
(
	IN count_sec INT -- кол-во секунд 
)
BEGIN
	DECLARE time_interval VARCHAR(200) DEFAULT "";
	DECLARE count_day INT;    -- кол-во дней 
    DECLARE count_hour INT;   -- кол-во часов 
    DECLARE count_min INT;    -- кол-во минут 
    DECLARE balance INT;      -- остаток
    SET balance := count_sec;
	
	SET count_day = balance DIV 86400;   -- ищем кол-ко дней
	SET balance = balance % 86400;
	
    SET count_hour = balance DIV 3600;   -- ищем кол-во часов
    SET balance =  balance % 3600;
    
    SET count_min = balance DIV 60;      -- ищем кол-во минут
    SET balance = balance % 60;
    
    SET time_interval = CONCAT(count_sec, ' секунд = ', count_day, ' дней, ', count_hour, ' часов, ', count_min,' минут, ', balance, ' секунд ');
	SELECT time_interval;
END ;

-- Вызов процедуры
CALL get_interval(123456);
