/* ********* 사용자 생성, 삭제 *********
-- 사용자 생성 : CREATE USER
CREATE USER 사용자명(유저명) --"MDGUEST" 
IDENTIFIED BY 비밀번호 --"mdguest"  
DEFAULT TABLESPACE 테이블스페이스 --"USERS"
TEMPORARY TABLESPACE 임시작업테이블스페이스 --"TEMP";

-- 사용할 용량 지정(수정)
ALTER USER "MDGUEST" QUOTA UNLIMITED ON "USERS";

-- 사용자 수정 : ALTER USER 
ALTER USER 사용자명(유저명) IDENTIFIED BY 비밀번호;

-- 권한부여(롤 사용 권한 부여, 롤 부여)
GRANT "CONNECT" TO "MDGUEST" ;
GRANT "RESOURCE" TO "MDGUEST" ;

-- 권한부여 - 뷰 생성권한 
GRANT CREATE VIEW TO "MDGUEST";

-- 사용자 삭제 : DROP USER
DROP USER 유저명 [CASCADE];
--CASCADE : 삭제시점에 사용자(유저)가 보유한 모든 데이타 삭제
*************************************/
--(관리자 계정 - SYSTEM) 유저생성 : MDGUEST , 암호 : mdguest
-- 유저생성 + 테이블스페이스 지정 
CREATE USER "MDGUEST" IDENTIFIED BY "mdguest"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- 유저수정 용량설정 (QUOTAS)
ALTER USER "MDGUEST" QUOTA UNLIMITED ON "USERS";

-- 롤(역할)부여 (ROLES)
GRANT "CONNECT" TO MDGUEST;
GRANT "RESOURCE" TO MDGUEST;

-- 권한부여 - 뷰 생성권한
GRANT CREATE VIEW TO "MDGUEST";
-------------------------------------------
--(SYSTEM) CONNECT, RESOURCE 롤(ROLE)에 있는 권한 확인
SELECT *
  FROM DBA_SYS_PRIVS
 WHERE GRANTEE IN ('CONNECT', 'RESOURCE')
 ORDER BY GRANTEE, PRIVILEGE
;

--=============================
/****** 권한 부여(GRANT), 권한 취소(REVOKE) **********************
GRANT 권한 [ON 객체] TO {사용자|ROLE|PUBLIC,.., n} [WITH GRANT OPTION]
--PUBLIC은 모든 사용자에게 적용을 의미

GRANT 권한 TO 사용자; --권한을 사용자에게 부여
GRANT 권한 ON 객체 TO 사용자; -객체에 대한 권한을 사용자에게 부여
-->> WITH GRANT OPTION :객체에 대한 권한을 사용자에게 부여 
-- 권한을 받은 사용자가 다른 사용자에게 권한부여할 권리 포함
GRANT 권한 ON 객체 TO 사용자 WITH GRANT OPTION;
--------------------
-->>>권한 취소(REVOKE)
REVOKE 권한 [ON 객체] FROM {사용자|ROLE|PUBLIC,.., n} CASCADE
--CASCADE는 사용자가 다른 사용자에게 부여한 권한까지 취소시킴
  (확인 및 검증 후 작업)

REVOKE 권한 FROM 사용자; --권한을 사용자에게 부여
REVOKE 권한 ON 객체 FROM 사용자; -객체에 대한 권한을 사용자에게 부여
*************************************************/
--권한부여 : MADANG 유저의 BOOK테이블에 대한 SELECET권한을 MDGUEST에게 부여 

-----(SYSTEM) 권한부여 - MADANG.BOOK 을 SELECT 할 수 있는 권한을 MDGUEST에게 부여 
SELECT * FROM MADANG.BOOK; --SYSTEM유저에서는 조회 가능 
-- (MDGUEST)권한받기 전 : MDGUEST유저에서는 조회 불가능 
SELECT * FROM MADANG.BOOK; -- 조회 X
-- (SYSTEM)권한부여 
GRANT SELECT ON MADANG.BOOK TO MDGUEST;
-- (MDGUEST)권한 받은 후 : 데이터 조회 가능 
SELECT * FROM MADANG.BOOK;
-- (SYSTEM)권환 회수 (취소)
--REVOKE SELECT FROM MDGUEST;-- SELECT 권한 자체를 모두 없애는것 
REVOKE SELECT ON MADANG.BOOK FROM MDGUEST; -- MADANG.BOOK테이블의 SELECT권한을 회수 
-- (MDGUEST) 권한 취소 후 : 데이터 조회 못함 
SELECT * FROM MADANG.BOOK; --조회 X

---------------------------------------------------
--======= MADANG유저에서 권한을 부여, 회수 =========
--(MADANG) CUSTOMER테이블에 대하여 MDGUEST유저에게 
----------- SELECT,UPDATE권한을 부여 
--GRANT SELECT, UPDATE TO MDGUEST; -- MDGUEST에게 MADANG의 모든테이블 SELECT, UPDATE 권한을 모두 부여 
GRANT SELECT, UPDATE ON CUSTOMER TO MDGUEST; -- 권한부여 

-- (MDGUEST) SELECT, UPDATE 작업가능 
SELECT * FROM MADANG.CUSTOMER;
UPDATE MADANG.CUSTOMER 
  SET PHONE = '010-1111-2222'
 WHERE CUSTID = 5;
DELETE FROM CUSTOMER WHERE CUSTID = 5; 

-- (MADANG) SELECT, UPDATE 권한 취소 
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST; -- 권한회수 
-- (MDGUEST)SELECT ,UPDATE 권한 취소 후 테이블에 접근할 수 없다 
----ORA-00942: table or view does not exist

----------------------------------
CREATE USER "MDGUEST2" IDENTIFIED BY "mdguest2"
default TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
--유저생성용량설정 (QUOTAS)
ALTER USER "MDGUEST2" QUOTA UNLIMITED ON "USERS";
-- 롤 (역할)부여 (ROLES)
GRANT "CONNECT","RESOURCE" TO "MDGUEST2";

--WITH GRANT OPTION : 다른유저에게 권한을 부여할 수 있도록 허용 
--(MADANG) MADANG 유저가 MDGUEST에게 권한부여 
GRANT SELECT, UPDATE ON CUSTOMER TO DMGUEST WITH GRANT OPTION; -- 권한부여 
--(MDGUEST) MDGUEST 유저가 MDGUEST2에게 권한부여 가능 
GRANT SELECT, UPDATE ON MADANG.CUSTOMER TO MDGUEST2;
--(MDGUEST2) MDGUEST2 유저가 CUSTOMER테이블 SELECT, UPDATE 가능 

-----------------
--(MADANG) MDGUEST에게 부여한 권한을 회수 
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST; -- 권한회수 
--MDGUEST에게 부여된 CUSTOMER테이블 SELECT,UPDATE권한이 취소됨.
--MDGUEST가 MDGUEST2에게 부여한 CUSTOMER 테이블 SELECT, UPDATE권한도 같이 취소됨.
--========================================

--(SYSTEM) MDGUEST 유저삭제 
DROP USER MDGUEST CASCADE;-- 유저가 만들어서 썼던 자원들 모두 삭제처리 
DROP USER MDGUEST2 CASCADE;


