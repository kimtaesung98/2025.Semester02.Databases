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