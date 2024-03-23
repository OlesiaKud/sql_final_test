/* задача 2
Выведите только четные числа от 1 до 10 (Через цикл).
Пример: 2,4,6,8,10 */


DROP PROCEDURE IF EXISTS print_even_number;
DELIMITER $$ 
CREATE PROCEDURE print_even_number
(
	IN input_number INT                                            -- число на ввод пользователем
)
BEGIN
	DECLARE n INT DEFAULT 2;  
	DECLARE result VARCHAR(100) DEFAULT "";

	IF input_number BETWEEN 0 AND 1                                -- если пришло 0 и 1
		THEN SET result = CONCAT('нет четных чисел в промежутке от 0 до ', input_number);
	ELSE
    		IF input_number < 0 
			THEN SET input_number = input_number *(-1);    -- если пришло  отриц.число
        	END IF;
		REPEAT
			SET result = CONCAT(result, " ", n); 
			SET n = n + 2;
			UNTIL n >= input_number                        -- Условие выхода из цикла: n больше/равен input_numbers
		END REPEAT;
    
    	END IF;
	SELECT result;
END ;

CALL print_even_number(10);
