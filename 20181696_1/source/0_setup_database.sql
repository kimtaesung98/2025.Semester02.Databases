-- 데이터베이스 및 테이블, 샘플 데이터 생성 스크립트
-- 파일명: 0_setup_database.sql
-- 이 파일을 가장 먼저 실행해주세요.

-- 1. madangdb 데이터베이스 생성 (이미 있다면 무시)
CREATE DATABASE IF NOT EXISTS madangdb;
USE madangdb;

-- 2. 테이블 생성 (실행할 때마다 깨끗한 상태에서 시작하기 위해 기존 테이블 삭제)
DROP TABLE IF EXISTS Book_log;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Book;

-- Book 테이블
CREATE TABLE Book (
  bookid      INT PRIMARY KEY,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT
);

-- Orders 테이블
CREATE TABLE Orders (
  orderid     INT PRIMARY KEY,
  custid      INT,
  bookid      INT,
  saleprice   INT,
  orderdate   DATE,
  FOREIGN KEY (bookid) REFERENCES Book(bookid)
);

-- Book_log 테이블 (5.5번 트리거가 사용할 로그 테이블)
CREATE TABLE Book_log (
  bookid      INT,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT
);


-- 3. 샘플 데이터 삽입 (프로시저와 함수 테스트를 위함)

-- Book 테이블 샘플 데이터
INSERT INTO Book VALUES(1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book VALUES(2, '축구아는 여자', '나무수', 13000);
INSERT INTO Book VALUES(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별 기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

-- Orders 테이블 샘플 데이터
INSERT INTO Orders VALUES (1, 1, 1, 6000, '2025-07-01');
INSERT INTO Orders VALUES (2, 1, 3, 21000, '2025-07-03');
INSERT INTO Orders VALUES (3, 2, 5, 8000, '2025-07-03');
INSERT INTO Orders VALUES (4, 3, 6, 6000, '2025-07-04');
INSERT INTO Orders VALUES (5, 4, 7, 20000, '2025-07-05');
INSERT INTO Orders VALUES (6, 1, 2, 12000, '2025-07-07');
INSERT INTO Orders VALUES (7, 4, 8, 13000, '2025-07-07');
INSERT INTO Orders VALUES (8, 3, 10, 12000, '2025-07-08');
INSERT INTO Orders VALUES (9, 2, 10, 7000, '2025-07-09');
INSERT INTO Orders VALUES (10, 3, 8, 13000, '2025-07-10');

-- 4. 준비 완료 메시지
SELECT '데이터베이스, 테이블, 샘플 데이터 준비가 완료되었습니다.' AS 'Setup Status';
