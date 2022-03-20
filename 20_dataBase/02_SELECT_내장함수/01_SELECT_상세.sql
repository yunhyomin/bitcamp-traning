/* *************************
SELECT [* | DISTINCT] {컬럼명, 컬럼명, ...}   DISTINCT:동일한 데이터가 있을시 하나만 표시
  FROM 테이블명                              SELECT 와 FROM 은 필수!
[WHERE 조건절]
[GROUP BY {컬럼명, ....}
    [HAVING 조건] ] --GROUP BY 절에 대한 조건
[ORDER BY {컬럼명 [ASC | DESC], ....}] --ASC : 오름차순(기본/생략가능)
                                      --DESC : 내림차순
***************************/
SELECT*FROM BOOK;
SELECT*FROM CUSTOMER;
SELECT*FROM ORDERS;
----------------------------
SELECT*FROM BOOK ORDER BY BOOKNAME; --오름차순 정렬 DESC는 내림차순 
--출판사 기준 오름차순(또는 내림차순), 책제목 오름차순(또는 내림차순)  
SELECT*FROM BOOK ORDER BY PUBLISHER, BOOKNAME; 
--출판사 기준 오름차순, 가격이 큰것부터 (내림차순)
SELECT*FROM BOOK ORDER BY PUBLISHER, PRICE DESC;
-----------------------------
--AND, OR, NOT(자바 &&, ||, ! 여기서는 안씀)
------ AND : 출판사 대한미디어, 금액이 3만원 이상인 책 조회 
SELECT * FROM BOOK
 WHERE PUBLISHER = '대한미디어' AND PRICE >= 30000
 ;
------ OR :  출판사 대한미디어 또는 이상미디어 에서 출판한 책 목록
SELECT * FROM BOOK
 WHERE PUBLISHER = '대한미디어' OR PUBLISHER = '이상미디어'
 ;
------ NOT : 출판사 굿스포츠를 제외하고 나머지 전체
SELECT*FROM BOOK WHERE NOT (PUBLISHER = '굿스포츠');
SELECT*FROM BOOK WHERE PUBLISHER <> '굿스포츠'; -- <> : 같지않다(다르다)
SELECT*FROM BOOK WHERE PUBLISHER != '굿스포츠'; -- != : 같지않다(다르다)
-------
-- 굿스포츠, 대한미디어 출판사가 아닌 도서목록 
SELECT * FROM BOOK--요걸로 쓰자!!
 WHERE PUBLISHER <> '굿스포츠' AND PUBLISHER <> '대한미디어'
 ;
SELECT * FROM BOOK
 WHERE NOT (PUBLISHER = '굿스포츠' OR PUBLISHER = '대한미디어')
 ;
--===========
------ IN () : ()얘네들이 있게해라 (OR문 단순화)
------ NOT IN () : ()얘네들이 없게해라
--(실습)출판사 나무수, 대한미디어, 삼성당에서 출판한 도서목록 
SELECT * FROM BOOK
 WHERE PUBLISHER = '나무수' OR PUBLISHER = '대한미디어' OR PUBLISHER = '삼성당'
 ;
 -->단순화( IN )
SELECT * FROM BOOK
 WHERE PUBLISHER IN ('나무수', '대한미디어', '삼성당')
 ;
--(실습) 나무수, 대한미디어, 삼성당이 아닌 출판사 도서목록 
SELECT * FROM BOOK
 WHERE PUBLISHER <> '나무수' and PUBLISHER <>'대한미디어' and PUBLISHER<> '삼성당'
 ; 
SELECT * FROM BOOK 
 WHERE PUBLISHER NOT IN('나무수','대한미디어','삼성당')
 ;
 --=====================
 ---------같다(=), 크다(>), 작다(<), 크거나같다(>=), 작거나같다(<=)
 ---------같지않다/다르다 : <>, !=
 --(실습) 출판된 책 중에 8000이상이고 22000원 이하인 책 조회(가격순 정렬)
SELECT * FROM BOOK 
 WHERE PRICE >=8000 AND PRICE <=22000 ORDER BY PRICE
 ;
---------- BETWEEN 값1(부터)AND 값2(까지) : 값1부터 값2까지 형태로 사용
SELECT * FROM BOOK 
 WHERE PRICE BETWEEN 8000 AND 22000 ORDER BY PRICE--경계값 포함 
 ;
---------- NOT BETWEEN 값1 AND 값2 : 값1 부터 값2까지 포함이 안되게하라 
SELECT * FROM BOOK 
 WHERE PRICE NOT BETWEEN 8000 AND 22000 ORDER BY PRICE--PRICE<8000 OR PRICE>22000
 ;
--책 제목이 '야구'~'올림픽'
SELECT * FROM BOOK 
 WHERE BOOKNAME BETWEEN '야구' AND '올림픽' ORDER BY BOOKNAME
 ;
----
--(실습) 대한미디어, 이상미디어에서 출판한 책 목록(출판사명, 책제목 정렬)
SELECT * FROM BOOK
 WHERE PUBLISHER IN ( '대한미디어', '이상미디어') ORDER BY PUBLISHER , BOOKNAME
 ;
--(실습) 나무수~ 삼성당 출판사에서 출판한 책(출판사 명으로 정렬)
SELECT *FROM BOOK
 WHERE PUBLISHER BETWEEN '나무수' AND '삼성당' ORDER BY PUBLISHER 
 ;
SELECT * FROM BOOK
 WHERE PUBLISHER IN ( '대한미디어', '이상미디어') AND PRICE BETWEEN 13000 AND 22000
 ORDER BY PUBLISHER , BOOKNAME
 ;
---------------------------
---------- LIKE : '%', '_' 부호와 함께 사용 (함께 사용하지 않으면 = 와 같다)
------ % : 몇개가 오든 관계없이 전체(모든것)를 의미 
------ _(언더바) : 어떤 문자든 상관없이 문자 하나를 의미   

 --출판사명이 <미디어>로 끝나는 출판사 
SELECT * FROM BOOK
 WHERE PUBLISHER LIKE '%미디어'--><미디어>로 끝나는 
 ORDER BY PUBLISHER, BOOKNAME
 ;
 --책제목이 <야구>로 시작하는 책 조회 
SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '야구%'--><야구>로 시작하는 
 ;
 --책제목에 <단계> 단어가 있는 책 목록 
SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '%단계%'--><단계> 단어가 있으면 
 ;
--(실습) 책제목에 '구'라는 문자가 있는 책 목록(책이름 오름차순 정렬)
SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '%구%' ORDER BY BOOKNAME
 ;
--책 제목중 2,3 번째 글자가 <구의>인 책목록 
SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '_구의%'--> _위치에 반드시 한개의 문자가 있어야함 
 ;
 SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '__의%'--> _가 두개니까 두개의 문자가 있어야함
;
----------------------------------    
--(실습) 책제목에 '구' 문자가 2번째에 있는 책 조회 
SELECT * FROM BOOK 
 WHERE BOOKNAME LIKE '_구%'
 ;
--(실습) 책제목에 '를' 문자가 3번째에 있는 책 조회 
SELECT * FROM BOOK
 WHERE BOOKNAME LIKE '__를%'
 ;
 ----------------------------------
 --LIKE사용시 동작결과 확인 
 CREATE TABLE TEST_LIKE (
    ID NUMBER(2) PRIMARY KEY,
    NAME VARCHAR2(30)
);
INSERT INTO TEST_LIKE VALUES (1,'홍길동');
INSERT INTO TEST_LIKE VALUES (2,'홍길동2');
INSERT INTO TEST_LIKE VALUES (3,'홍길동구');
INSERT INTO TEST_LIKE VALUES (4,'홍길동대문');
INSERT INTO TEST_LIKE VALUES (5,'홍길동2다');
INSERT INTO TEST_LIKE VALUES (6,'김홍길동');
INSERT INTO TEST_LIKE VALUES (7,'김홍길동만');
INSERT INTO TEST_LIKE VALUES (8,'김만홍길동');
INSERT INTO TEST_LIKE VALUES (9,'김만홍길동이다');
INSERT INTO TEST_LIKE VALUES (10,'김만홍길이다');

SELECT * FROM TEST_LIKE;
SELECT * FROM TEST_LIKE WHERE NAME = '홍길동';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '홍길동';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '홍길동%';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '홍길동2%';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '%홍길동';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '%홍길동%';
SELECT * FROM TEST_LIKE WHERE NAME LIKE '_홍길동_'; --반드시 5글자 
SELECT * FROM TEST_LIKE WHERE NAME LIKE '_홍길동_%'; --최소 5글자 이상 
SELECT * FROM TEST_LIKE WHERE NAME LIKE '_홍길동%'; --최소 4글자 이상 
SELECT * FROM TEST_LIKE WHERE NAME LIKE '__홍길동%'; --최소 5글자 이상 

    
    
    
    
    
    