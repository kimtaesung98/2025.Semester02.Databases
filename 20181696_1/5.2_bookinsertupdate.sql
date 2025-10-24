USE madangdb;
delimiter //
CREATE PROCEDURE BookInsertOrUpdate(
	mybookid	INTEGER,
	mybookname	VARCHAR(40),
 	mypublisher 	VARCHAR(40),
	myprice		INT)
BEGIN
	DECLARE mycount INTEGER;
	SELECT COUNT(*) INTO mycount FROM Book
		WHERE bookname LIKE mybookname;
IF mycount!=0 THEN
	SET SQL_SAFE_UPDATES=0; /* DELETE, UPDATE 연산에 필요한 설정문 */
	UPDATE Book SET price = myprice
		WHERE bookname LIKE mybookname;
ELSE
	INSERT INTO Book(bookid, bookname, publisher, price)
		VALUES(mybookid, mybookname, mypublisher, myprice);
END IF;
END;
//
delimiter ;

-- BookInsertOrUpdate 프로시저를 실행하여 테스트하는 부분
CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 25000);
SELECT * FROM Book; -- 15번 투플 삽입 결과 확인
-- BookInsertOrUpdate 프로시저를 실행하여 테스트하는 부분
CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);
SELECT * FROM Book; -- 15번 투플 가격 변경 확인