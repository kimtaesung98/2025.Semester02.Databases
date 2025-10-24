USE madangdb;
delimiter //
CREATE PROCEDURE InsertBook(
	IN mybookid		INTEGER,
	IN mybookname	VARCHAR(40),
	IN mypublisher	VARCHAR(40), 
	IN myprice		INTEGER)
BEGIN
 	INSERT INTO Book(bookid, bookname, publisher, price)
		VALUES(mybookid, mybookname, mypublisher, myprice);
END;
//
delimiter ;


/* 프로시저 InsertBook을 테스트하는 부분 */
CALL InsertBook(13, '스포츠과학', '마당과학서적', 25000);
SELECT * FROM Book;