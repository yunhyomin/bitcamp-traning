/* ********* ����(�� ROLE) ***********
����(��, ROLE) : DB ��ü �� �ý��ۿ� ���� ������ ��Ƶ� ������ �ǹ�
���� ���� : CREATE ROLE �����̸�
���� ���� : DROP ROLE �����̸�
���ҿ� ���� �ο� : GRANT ���� [ON ��ü] TO �����̸�
������ ���� ȸ�� : REVOKE ���� [ON ��ü] FROM �����̸�
����ڿ��� ���� �ο� : GRANT �����̸� TO �����

<���� �������� ����� �߰������� �ܰ�>
CREATE ROLE - ���һ���
GRANT - ������� ���ҿ� ���� �ο�
GRANT - ����ڿ��� ���� �ο�
-->>���� ������ ��� �ݴ�� ����
DROP ROLE - ���� ����(����ڿ��� �ο��� ���ҿ� ���� ���� ���� ���ŵ�)
***************************************/

-- (SYSTEM) ����� �������� �˻� ����(��) ��ȸ 
SELECT * FROM MADANG.BOOK;

-- (DBA ����- SYSTEM) CONNECT,RESOURCE �ѿ� ���� ���� Ȯ�� 
SELECT * FROM DBA_SYS_BRIVS
WHERE GRANTEE IN('CONNECT','RESOURCE')
;
-------------------

--(SYSTEM) ��(ROLE) ���� : PROGRAMMER(������) ��� ����(��,ROLE) ����
CREATE ROLE PROGRAMMER;
--(SYSTEM) PROGRAMMER ��(����)�� ���̺�, ��(VIEW) ���� ���Ѵ�� 
GRANT CREATE ANY TABLE, CREATE ANY VIEW TO PROGRAMMER;
--============================================================

CREATE USER MDGUEST IDENTIFIED BY mdguest
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
--(SYSTEM) MDGUEST�������� ���Ѻο� 
GRANT CONNECT,RESOURCE TO MDGUEST;
----------------
--(SYSTEM) MDGUEST���� PROGRAMMER �� �ο� 
GRANT PROGRAMMER TO MDGUEST;
--(MDGUEST) MDGUEST���� ���̺� ���� ���� ��� 
CREATE TABLE MADANG.AAA(
    TEST VARCHAR2(30)
);
CREATE TABLE MADANG.BBB( BBB NUMBER);
SELECT * FROM MADANG.AAA; --SELECT������ ���� (����)

--(SYSTEM) ��(����) ȸ��(���)
REVOKE PROGRAMMER FROM MDGUEST;

--(SYSTEM) ��(����) ���� 
DROP ROLE PROGRAMMER;


