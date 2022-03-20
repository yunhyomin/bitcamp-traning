/*(실습) 테이블(TABLE) 만들기 (테이블명 : TEST2)
    NO : 숫자타입 5자리, PRIMARY KEY선언 
    ID : 문자타입 10자리(영문 10자리), 값이 반드시 존재(NULL허용안함)
    NAME : 한글 10자리 저장 가능하도록 설정, 값이 반드시 존재 
    EMAIL : 영문, 숫자, 특수문자 포함 30자리 
    ADDRESS : 한글 100자 
    INNUM : 숫자타입 정수부 7자리, 소수부 3자리(1234567.123)
    REGDATE : 날짜 타입 
*/
CREATE TABLE TEST2(
    NO NUMBER(5) PRIMARY KEY,--소숫점이 없다면 생략 FRIMARY KEY: NOT NULL+UNIQUE
    ID VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(30),
    ADDRESS VARCHAR2(300),--한글 100글자 
    INNUM NUMBER(10,3),
    REGDATE DATE
    );
SELECT*FROM TEST2;
INSERT INTO TEST2 VALUES(345,'YUN','HYOMIN','GYALS737@NAVER.COM','인천광역시 미추홀구',
                            33349.342, SYSDATE);
INSERT INTO TEST2(NO,ID,NAME,EMAIL)
     VALUES(3495,'HONG','길동','HONGGILDONG@GMAIL.COM');
INSERT INTO TEST2(ID,NO,ADDRESS,NAME,REGDATE)--여기서 지정만해주면 순서가 바뀌어도 상관없다
    VALUES('GJDKS',13333,'서울시 마포구 신촌역','비트캠프',SYSDATE);
    
UPDATE TEST2 SET INNUM = 3495960.334 WHERE ID = '345';

DELETE FROM TEST2 WHERE ID = 'YUN';

UPDATE TEST2 SET ADDRESS = '경상남도 부산시 해운대구' WHERE ID = 'HONG';

INSERT INTO TEST2 VALUES(3523,'장군','을지문덕','','','',SYSDATE); --숫자도 ''로 입력가능(NULL)

SELECT ID FROM TEST2;
SELECT*FROM TEST2 WHERE ID = '장군';
SELECT*FROM TEST2 WHERE EMAIL IS NULL;
SELECT*FROM TEST2 WHERE INNUM IS NOT NULL;

SELECT ID +'100' FROM TEST2;--오류 
SELECT ID ||'100'FROM TEST2;
SELECT NO+100 FROM TEST2;
SELECT ADDRESS ||'길거리' FROM TEST2;

SELECT*FROM TEST2;
COMMIT;
--====================================================================
--특정 테이블의 데이터와 함께 테이블 구조를 함께 복사 
CREATE TABLE TEST3
AS 
SELECT*FROM TEST2;

SELECT*FROM TEST2;
SELECT*FROM TEST3;--FRIMARY KEY 의 NOT NULL효과는 없어진다
--------------------------------------
--특정 테이블의 특정컬럼과 특정 데이터만 복사해서 테이블 생성 
CREATE TABLE TEST4
AS
SELECT NO, ID, NAME, EMAIL FROM TEST2 WHERE NO = 3495;
SELECT*FROM TEST4;
--------------------------------------
--특정 테이블 구조만 복사 (데이터는 복사하지 않음)
CREATE TABLE TEST5
AS
SELECT*FROM TEST2 WHERE 1 = 2; --WHERE 조건이 FALSE기 때문에 데이터 선택은 안한다

--=========================================
 SELECT*FROM TEST2;
 --한 행의 데이터만 삭제 
 DELETE FROM TEST2 WHERE ID = 'HONG';
 
 --테이블 데이터를 전체 삭제 
 DELETE FROM TEST2; -- 모든 데이터 삭제 
 ROLLBACK; --DELETE 문은 ROLLBACK 명령문으로 데이터 복구 가능
 -------------------------
 --TRUNCATE 명령문 : 테이블 데이터 전체 삭제 처리(ROLLBACK 불가능)
 TRUNCATE TABLE TEST2;
 SELECT*FROM TEST2;
 ROLLBACK;
--==========================================
/*  테이블을 삭제 : DROP TABLE - 데이터와 함께 테이블 구조 모두 삭제 처리 
     DROP TABLE 유저명.테이블명 ; 
     DROP TABLE 유저명.테이블명 CASCADE CONSTRAINTS PURGE;
     CASCADE CONSTRAINTS : 참조데이터가 있어도 삭제처리 
     PURGE : 삭제 시 휴지통에 넣지않고 완전히 삭제      
*/
DROP TABLE TEST2;

--==========================================
/* 테이블 수정 : 칼럼 추가, 수정, 삭제 
  DDL : ALTER TABLE 
 -ADD : 추가 
 -MODIFY : 수정 -데이터 상태에 따라 적용 가능 여부 결정(사이즈, 제약조건 등)
        --컬럼사이즈 작은 -> 큰 : 언제나 가능
        --컬럼사이즈 큰 -> 작은 : 저장된 데이터에 따라 다름
 -DROP COLUMN : 삭제 
*/
SELECT*FROM TEST3;
--컬럼추가 TEST3 테이블에 ADDCOL 컬럼 추가 
ALTER TABLE TEST3 ADD ADDCOL VARCHAR2(10);

--컬럼수정 TEST3 테이블에 ADDCOL 크기 -> VARCHAR2(20)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(20);
UPDATE TEST3 SET ADDCOL = '123456789012345';

--컬럼수정 TABLE3 테이블의 ADDCOL 크기 - VARCHAR2(15), VARCHAR(10)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(15) NOT NULL; --가장큰 데이터15 : 변경OK
--오류발생 ORA-01441: cannot decrease column length because some value is too big
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(10); --가장큰 데이터15

--컬럼삭제 : DROP COLUMN
ALTER TABLE TEST3 DROP COLUMN ADDCOL;
-------------------------
ALTER TABLE TEST3 RENAME COLUMN INNUM TO TESTNUM ; 
SELECT*FROM TEST3;
ALTER TABLE TEST3 MODIFY TESTNUM UNIQUE; --NULL데이터 있으면 적용 안됨 

ALTER TABLE "MYSTUDY"."TEST3" RENAME TO TEST333; --테이블명 변경
--====================================================










