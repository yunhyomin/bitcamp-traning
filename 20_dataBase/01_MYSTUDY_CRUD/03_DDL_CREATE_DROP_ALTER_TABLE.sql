/*(�ǽ�) ���̺�(TABLE) ����� (���̺�� : TEST2)
    NO : ����Ÿ�� 5�ڸ�, PRIMARY KEY���� 
    ID : ����Ÿ�� 10�ڸ�(���� 10�ڸ�), ���� �ݵ�� ����(NULL������)
    NAME : �ѱ� 10�ڸ� ���� �����ϵ��� ����, ���� �ݵ�� ���� 
    EMAIL : ����, ����, Ư������ ���� 30�ڸ� 
    ADDRESS : �ѱ� 100�� 
    INNUM : ����Ÿ�� ������ 7�ڸ�, �Ҽ��� 3�ڸ�(1234567.123)
    REGDATE : ��¥ Ÿ�� 
*/
CREATE TABLE TEST2(
    NO NUMBER(5) PRIMARY KEY,--�Ҽ����� ���ٸ� ���� FRIMARY KEY: NOT NULL+UNIQUE
    ID VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(30),
    ADDRESS VARCHAR2(300),--�ѱ� 100���� 
    INNUM NUMBER(10,3),
    REGDATE DATE
    );
SELECT*FROM TEST2;
INSERT INTO TEST2 VALUES(345,'YUN','HYOMIN','GYALS737@NAVER.COM','��õ������ ����Ȧ��',
                            33349.342, SYSDATE);
INSERT INTO TEST2(NO,ID,NAME,EMAIL)
     VALUES(3495,'HONG','�浿','HONGGILDONG@GMAIL.COM');
INSERT INTO TEST2(ID,NO,ADDRESS,NAME,REGDATE)--���⼭ ���������ָ� ������ �ٲ� �������
    VALUES('GJDKS',13333,'����� ������ ���̿�','��Ʈķ��',SYSDATE);
    
UPDATE TEST2 SET INNUM = 3495960.334 WHERE ID = '345';

DELETE FROM TEST2 WHERE ID = 'YUN';

UPDATE TEST2 SET ADDRESS = '��󳲵� �λ�� �ؿ�뱸' WHERE ID = 'HONG';

INSERT INTO TEST2 VALUES(3523,'�屺','��������','','','',SYSDATE); --���ڵ� ''�� �Է°���(NULL)

SELECT ID FROM TEST2;
SELECT*FROM TEST2 WHERE ID = '�屺';
SELECT*FROM TEST2 WHERE EMAIL IS NULL;
SELECT*FROM TEST2 WHERE INNUM IS NOT NULL;

SELECT ID +'100' FROM TEST2;--���� 
SELECT ID ||'100'FROM TEST2;
SELECT NO+100 FROM TEST2;
SELECT ADDRESS ||'��Ÿ�' FROM TEST2;

SELECT*FROM TEST2;
COMMIT;
--====================================================================
--Ư�� ���̺��� �����Ϳ� �Բ� ���̺� ������ �Բ� ���� 
CREATE TABLE TEST3
AS 
SELECT*FROM TEST2;

SELECT*FROM TEST2;
SELECT*FROM TEST3;--FRIMARY KEY �� NOT NULLȿ���� ��������
--------------------------------------
--Ư�� ���̺��� Ư���÷��� Ư�� �����͸� �����ؼ� ���̺� ���� 
CREATE TABLE TEST4
AS
SELECT NO, ID, NAME, EMAIL FROM TEST2 WHERE NO = 3495;
SELECT*FROM TEST4;
--------------------------------------
--Ư�� ���̺� ������ ���� (�����ʹ� �������� ����)
CREATE TABLE TEST5
AS
SELECT*FROM TEST2 WHERE 1 = 2; --WHERE ������ FALSE�� ������ ������ ������ ���Ѵ�

--=========================================
 SELECT*FROM TEST2;
 --�� ���� �����͸� ���� 
 DELETE FROM TEST2 WHERE ID = 'HONG';
 
 --���̺� �����͸� ��ü ���� 
 DELETE FROM TEST2; -- ��� ������ ���� 
 ROLLBACK; --DELETE ���� ROLLBACK ��ɹ����� ������ ���� ����
 -------------------------
 --TRUNCATE ��ɹ� : ���̺� ������ ��ü ���� ó��(ROLLBACK �Ұ���)
 TRUNCATE TABLE TEST2;
 SELECT*FROM TEST2;
 ROLLBACK;
--==========================================
/*  ���̺��� ���� : DROP TABLE - �����Ϳ� �Բ� ���̺� ���� ��� ���� ó�� 
     DROP TABLE ������.���̺�� ; 
     DROP TABLE ������.���̺�� CASCADE CONSTRAINTS PURGE;
     CASCADE CONSTRAINTS : ���������Ͱ� �־ ����ó�� 
     PURGE : ���� �� �����뿡 �����ʰ� ������ ����      
*/
DROP TABLE TEST2;

--==========================================
/* ���̺� ���� : Į�� �߰�, ����, ���� 
  DDL : ALTER TABLE 
 -ADD : �߰� 
 -MODIFY : ���� -������ ���¿� ���� ���� ���� ���� ����(������, �������� ��)
        --�÷������� ���� -> ū : ������ ����
        --�÷������� ū -> ���� : ����� �����Ϳ� ���� �ٸ�
 -DROP COLUMN : ���� 
*/
SELECT*FROM TEST3;
--�÷��߰� TEST3 ���̺� ADDCOL �÷� �߰� 
ALTER TABLE TEST3 ADD ADDCOL VARCHAR2(10);

--�÷����� TEST3 ���̺� ADDCOL ũ�� -> VARCHAR2(20)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(20);
UPDATE TEST3 SET ADDCOL = '123456789012345';

--�÷����� TABLE3 ���̺��� ADDCOL ũ�� - VARCHAR2(15), VARCHAR(10)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(15) NOT NULL; --����ū ������15 : ����OK
--�����߻� ORA-01441: cannot decrease column length because some value is too big
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(10); --����ū ������15

--�÷����� : DROP COLUMN
ALTER TABLE TEST3 DROP COLUMN ADDCOL;
-------------------------
ALTER TABLE TEST3 RENAME COLUMN INNUM TO TESTNUM ; 
SELECT*FROM TEST3;
ALTER TABLE TEST3 MODIFY TESTNUM UNIQUE; --NULL������ ������ ���� �ȵ� 

ALTER TABLE "MYSTUDY"."TEST3" RENAME TO TEST333; --���̺�� ����
--====================================================










