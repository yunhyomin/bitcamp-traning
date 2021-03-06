/***** 함수 (FUNCTION)*******
CREATE OR REPLACE FUNCTION FUNCTION1 (
  PARAM1 IN VARCHAR2  -- 파라미터 작성 영역
) 
RETURN VARCHAR2 -- (필수)리턴 데이터 타입 선언
AS 
BEGIN
  RETURN NULL; -- (RETURN 문장필수)리턴 값 
END;
------------
(프로시저와의 차이)
-리턴할 데이터에 대한 선언 필요
RETURN 데이터 유형(타입)

-프로그램 마지막에 값 리턴하는 문장 필요 
RETURN 리턴값;
********************************/

-- BOOKID로 책제목 확인하는 함수 (파라미터값 : BOOKID, RETURN값 : BOOKNAME)
CREATE OR REPLACE FUNCTION GET_BOOKNAME (
  IN_ID IN NUMBER 
) RETURN VARCHAR2 --리턴할 데이터 타입 지정
AS 
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME 
      FROM BOOK
     WHERE BOOKID = IN_ID;
     
  RETURN V_BOOKNAME; -- 리턴 값 
END /*GET_BOOKNAME*/;
----------------------------------
--함수 ( FUNCTION )의 사용
--SELECT 절에 사용 
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(BOOKID)
  FROM BOOK
;
---------
--WHERE절에서 함수 사용 (그룹함수는 WHERE절에서 쓸 수 없다 )
-- * 와 같이 조회하려면 ALIAS를 이용하여 써주어야만 한다!!
SELECT O.*,GET_BOOKNAME(BOOKID) 
  FROM ORDERS O
WHERE GET_BOOKNAME(BOOKID) = '축구의 이해'
;
SELECT O.*,GET_BOOKNAME(BOOKID) 
  FROM ORDERS O
WHERE BOOKID=3
;
--------------------------------------
--(실습)
-- 고객 ID값을 받아서 고객명을 돌려주는 함수 작성(CUSTOMER테이블 사용)
-- 함수명 : GET_CUSTNAME
-- 함수를 이용해서 ORDERS테이블 데이터 조회 
-- GET_BOOKNAE, GET_CUSTNAME 함수사용 주문(판매) 정보와 책제목, 고객명 조회
-----------------------------------------

-- 고객 ID값을 받아서 고객명을 돌려주는 함수 작성(CUSTOMER테이블 사용)
-- 함수명 : GET_CUSTNAME
CREATE OR REPLACE FUNCTION GET_CUSTNAME (
  IN_CUSTID IN NUMBER 
) RETURN VARCHAR2 
AS 
    V_CUSTNAME CUSTOMER.NAME%TYPE; --리턴할 값 데이터타입선언
BEGIN
    SELECT NAME INTO V_CUSTNAME
      FROM CUSTOMER
     WHERE CUSTID = IN_CUSTID;
  RETURN V_CUSTNAME;
END GET_CUSTNAME;

-- 함수를 이용해서 ORDERS테이블 데이터 조회 
SELECT O.*,GET_CUSTNAME(CUSTID)
  FROM ORDERS O
;
-- GET_BOOKNAE, GET_CUSTNAME 함수사용 주문(판매) 정보와 책제목, 고객명 조회
SELECT O.*, GET_BOOKNAME(BOOKID), GET_CUSTNAME(CUSTID)
  FROM ORDERS O
;










