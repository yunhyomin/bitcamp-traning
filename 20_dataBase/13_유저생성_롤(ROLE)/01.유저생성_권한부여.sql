/* ********* ����� ����, ���� *********
-- ����� ���� : CREATE USER
CREATE USER ����ڸ�(������) --"MDGUEST" 
IDENTIFIED BY ��й�ȣ --"mdguest"  
DEFAULT TABLESPACE ���̺����̽� --"USERS"
TEMPORARY TABLESPACE �ӽ��۾����̺����̽� --"TEMP";

-- ����� �뷮 ����(����)
ALTER USER "MDGUEST" QUOTA UNLIMITED ON "USERS";

-- ����� ���� : ALTER USER 
ALTER USER ����ڸ�(������) IDENTIFIED BY ��й�ȣ;

-- ���Ѻο�(�� ��� ���� �ο�, �� �ο�)
GRANT "CONNECT" TO "MDGUEST" ;
GRANT "RESOURCE" TO "MDGUEST" ;

-- ���Ѻο� - �� �������� 
GRANT CREATE VIEW TO "MDGUEST";

-- ����� ���� : DROP USER
DROP USER ������ [CASCADE];
--CASCADE : ���������� �����(����)�� ������ ��� ����Ÿ ����
*************************************/
--(������ ���� - SYSTEM) �������� : MDGUEST , ��ȣ : mdguest
-- �������� + ���̺����̽� ���� 
CREATE USER "MDGUEST" IDENTIFIED BY "mdguest"
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- �������� �뷮���� (QUOTAS)
ALTER USER "MDGUEST" QUOTA UNLIMITED ON "USERS";

-- ��(����)�ο� (ROLES)
GRANT "CONNECT" TO MDGUEST;
GRANT "RESOURCE" TO MDGUEST;

-- ���Ѻο� - �� ��������
GRANT CREATE VIEW TO "MDGUEST";
-------------------------------------------
--(SYSTEM) CONNECT, RESOURCE ��(ROLE)�� �ִ� ���� Ȯ��
SELECT *
  FROM DBA_SYS_PRIVS
 WHERE GRANTEE IN ('CONNECT', 'RESOURCE')
 ORDER BY GRANTEE, PRIVILEGE
;

--=============================
/****** ���� �ο�(GRANT), ���� ���(REVOKE) **********************
GRANT ���� [ON ��ü] TO {�����|ROLE|PUBLIC,.., n} [WITH GRANT OPTION]
--PUBLIC�� ��� ����ڿ��� ������ �ǹ�

GRANT ���� TO �����; --������ ����ڿ��� �ο�
GRANT ���� ON ��ü TO �����; -��ü�� ���� ������ ����ڿ��� �ο�
-->> WITH GRANT OPTION :��ü�� ���� ������ ����ڿ��� �ο� 
-- ������ ���� ����ڰ� �ٸ� ����ڿ��� ���Ѻο��� �Ǹ� ����
GRANT ���� ON ��ü TO ����� WITH GRANT OPTION;
--------------------
-->>>���� ���(REVOKE)
REVOKE ���� [ON ��ü] FROM {�����|ROLE|PUBLIC,.., n} CASCADE
--CASCADE�� ����ڰ� �ٸ� ����ڿ��� �ο��� ���ѱ��� ��ҽ�Ŵ
  (Ȯ�� �� ���� �� �۾�)

REVOKE ���� FROM �����; --������ ����ڿ��� �ο�
REVOKE ���� ON ��ü FROM �����; -��ü�� ���� ������ ����ڿ��� �ο�
*************************************************/
--���Ѻο� : MADANG ������ BOOK���̺� ���� SELECET������ MDGUEST���� �ο� 

-----(SYSTEM) ���Ѻο� - MADANG.BOOK �� SELECT �� �� �ִ� ������ MDGUEST���� �ο� 
SELECT * FROM MADANG.BOOK; --SYSTEM���������� ��ȸ ���� 
-- (MDGUEST)���ѹޱ� �� : MDGUEST���������� ��ȸ �Ұ��� 
SELECT * FROM MADANG.BOOK; -- ��ȸ X
-- (SYSTEM)���Ѻο� 
GRANT SELECT ON MADANG.BOOK TO MDGUEST;
-- (MDGUEST)���� ���� �� : ������ ��ȸ ���� 
SELECT * FROM MADANG.BOOK;
-- (SYSTEM)��ȯ ȸ�� (���)
--REVOKE SELECT FROM MDGUEST;-- SELECT ���� ��ü�� ��� ���ִ°� 
REVOKE SELECT ON MADANG.BOOK FROM MDGUEST; -- MADANG.BOOK���̺��� SELECT������ ȸ�� 
-- (MDGUEST) ���� ��� �� : ������ ��ȸ ���� 
SELECT * FROM MADANG.BOOK; --��ȸ X

---------------------------------------------------
--======= MADANG�������� ������ �ο�, ȸ�� =========
--(MADANG) CUSTOMER���̺� ���Ͽ� MDGUEST�������� 
----------- SELECT,UPDATE������ �ο� 
--GRANT SELECT, UPDATE TO MDGUEST; -- MDGUEST���� MADANG�� ������̺� SELECT, UPDATE ������ ��� �ο� 
GRANT SELECT, UPDATE ON CUSTOMER TO MDGUEST; -- ���Ѻο� 

-- (MDGUEST) SELECT, UPDATE �۾����� 
SELECT * FROM MADANG.CUSTOMER;
UPDATE MADANG.CUSTOMER 
  SET PHONE = '010-1111-2222'
 WHERE CUSTID = 5;
DELETE FROM CUSTOMER WHERE CUSTID = 5; 

-- (MADANG) SELECT, UPDATE ���� ��� 
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST; -- ����ȸ�� 
-- (MDGUEST)SELECT ,UPDATE ���� ��� �� ���̺� ������ �� ���� 
----ORA-00942: table or view does not exist

----------------------------------
CREATE USER "MDGUEST2" IDENTIFIED BY "mdguest2"
default TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
--���������뷮���� (QUOTAS)
ALTER USER "MDGUEST2" QUOTA UNLIMITED ON "USERS";
-- �� (����)�ο� (ROLES)
GRANT "CONNECT","RESOURCE" TO "MDGUEST2";

--WITH GRANT OPTION : �ٸ��������� ������ �ο��� �� �ֵ��� ��� 
--(MADANG) MADANG ������ MDGUEST���� ���Ѻο� 
GRANT SELECT, UPDATE ON CUSTOMER TO DMGUEST WITH GRANT OPTION; -- ���Ѻο� 
--(MDGUEST) MDGUEST ������ MDGUEST2���� ���Ѻο� ���� 
GRANT SELECT, UPDATE ON MADANG.CUSTOMER TO MDGUEST2;
--(MDGUEST2) MDGUEST2 ������ CUSTOMER���̺� SELECT, UPDATE ���� 

-----------------
--(MADANG) MDGUEST���� �ο��� ������ ȸ�� 
REVOKE SELECT, UPDATE ON CUSTOMER FROM MDGUEST; -- ����ȸ�� 
--MDGUEST���� �ο��� CUSTOMER���̺� SELECT,UPDATE������ ��ҵ�.
--MDGUEST�� MDGUEST2���� �ο��� CUSTOMER ���̺� SELECT, UPDATE���ѵ� ���� ��ҵ�.
--========================================

--(SYSTEM) MDGUEST �������� 
DROP USER MDGUEST CASCADE;-- ������ ���� ��� �ڿ��� ��� ����ó�� 
DROP USER MDGUEST2 CASCADE;


