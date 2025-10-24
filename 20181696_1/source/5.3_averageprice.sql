delimiter //
CREATE PROCEDURE Averageprice(
	OUT AverageVal INTEGER)
BEGIN
	SELECT AVG(price) INTO AverageVal
	FROM Book WHERE price IS NOT NULL;
END;
//
delimiter ;

/* 프로시저 Averageprice를 테스트하는 부분 */
CALL Averageprice(@myValue);
SELECT @myValue;