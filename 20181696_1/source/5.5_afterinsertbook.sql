DROP TRIGGER IF EXISTS AfterInsertBook;
delimiter //
CREATE TRIGGER AfterInsertBook 
  AFTER INSERT ON Book FOR EACH ROW
BEGIN  
	DECLARE average INTEGER;
	INSERT INTO Book_log 
	VALUES(new.bookid, new.bookname, new.publisher, new.price);
END;
//
delimiter ;

/* 삽입한 내용을 기록하는 트리거 확인 */
-- 반복 테스트를 위해 기존 데이터를 먼저 삭제합니다.
DELETE FROM Book WHERE bookid=14;
DELETE FROM Book_log WHERE bookid=14;
INSERT INTO Book VALUES(14, '스포츠 과학 1', '이상미디어', 25000);
SELECT * FROM Book WHERE BOOKID=14;
SELECT * FROM Book_log  WHERE bookid='14'; -- 결과 확인