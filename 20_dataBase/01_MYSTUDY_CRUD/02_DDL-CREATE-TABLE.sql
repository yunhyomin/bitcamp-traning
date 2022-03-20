/* *************************
����Ÿ ���Ǿ�
- DDL(Data Definition Language) : ����Ÿ�� �����ϴ� ���
- CREATE(����), DROP(����), ALTER(����)
- {}�ݺ�����, []��������, | �Ǵ�(����)
CREATE TABLE ���̺�� (
    {�÷��� ����ŸŸ��
        [NOT NULL | UNIQUE | DEFAULT �⺻�� | CHECK üũ����]
    }
    [PRIMARY KEY �÷���]
    {[FOREIGN KEY �÷��� REFERENCES ���̺��(�÷���)]
    [ON DELETE [CASCADE | SET NULL]
    }
);
-----------------------------------------------
<�������� 5����>
- NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY
-----------------------------------------------
�÷��� �⺻ ����Ÿ Ÿ��(���ڿ�, ����, ��¥)
- VARCHAR2(n) : ���ڿ� ��������
- CHAR(n) : ���ڿ� ��������
- NUMBER(p, s) : ����Ÿ�� p:��ü����, s:�Ҽ������� �ڸ���
    ��) (5,2) : ������ 3�ڸ�, �Ҽ��� 2�ڸ� - ��ü 5�ڸ�
- DATE : ��¥�� ��,��,�� �ð� �� ����

���ڿ� ó�� : UTF-8 ���·� ����
- ����, ���ĺ� ����, Ư������ : 1 byte ó��(Ű���� ���� ���ڵ�)
- �ѱ� : 3 byte ó��
***************************/
/******************************************
�������� (Constraint) 
- �ùٸ� �����͸� ������ ���ֱ� ���� ���(�߸��� �����ʹ� �������� ����-�����߻�)
- �������� ��Ȯ���� �ϰ����� �����ϱ� ���� �� Į���� �����ϴ� ��Ģ
- ��ųʸ��� �����
- ���̺� ������ ���Ἲ ���������� �����Ͽ� ���α׷��� ������ �ܼ�ȭ
- �����ͺ��̽� ������ ���� ���Ἲ ���������� �����Ǿ� ������ ���� �߻� ���ɼ��� �ٿ���
- �Ͻ������� Ȱ��ȭ(ENABLE) �Ǵ� ��Ȱ��ȭ(DISABLE) �� �� �ִ�.

<�������� 5����>
- NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY
1. NOT NULL : Null�� �����Ҽ� ����
2. UNIQUE : �ߺ��Ǵ� �� ���� �ȵ�
    (�ߺ��Ǵ� �� ����� �ϹǷ�, �������μ����� ���� �����͸� ã�ƾ� �Ѵ�. �����ɸ� - �ذ� : �ε���)
3. CHECK : �ش� Į���� ���� ������ ������ ���� ������ ���� ����
4. PRIMARY KEY(�⺻Ű) : ���� �� (NOT NULL + ����ũ)
5. FOREIGN KEY(�ܷ�Ű-����) : �ش� Į�� ���� �����Ǵ� ���̺��� Į�� �� �� �ϳ��� ��ġ�ϰų� Null�� ����
    - �ڽ� ���̺� : �ٸ� ���̺��� ���� �����ϴ� ���̺�
    - �ܷ�Ű(foreign key): �θ����̺��� ���� �����ϴ� �ڽ����̺��� Į��
    - �θ� ���̺� : �ٸ� ���̺� ���� �����Ǵ� ���̺�
    - ����Ű(reference : �ڽ� ���̺��� �����ϴ� �θ� ���̺��� Į��
************************************************/
--���� �ּ� ��ȣ
/* 
������ �ּ� ��ȣ
*/
--������ ������� ���̺� ����
--DDL
CREATE TABLE MEMBER (
    ID VARCHAR2(20) PRIMARY KEY, --NOT NULL + UNIQUE
    NAME VARCHAR2(30) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(20),
    ADDRESS VARCHAR2(300)
);
----
--DML
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG', 'ȫ�浿', '1234');

COMMIT;
ROLLBACK; --�ӽ� ó���� �۾� ���

INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', 'ȫ�浿2', '1234');
COMMIT;

--Ű�ߺ��Է¿��� : ORA-00001: unique constraint (MYSTUDY.SYS_C006999) violated
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', 'ȫ�浿2', '1234');

--NOT NULL ������ ���Է� ���� : ORA-01400: cannot insert NULL into ("MYSTUDY"."MEMBER"."PASSWORD")
INSERT INTO MEMBER (ID, NAME)
VALUES ('HONG3', 'ȫ�浿3');
----------------------------------------
SELECT * FROM MEMBER;--TABLE MEMBER�� ��ü������ ��ȸ
SELECT ID, PASSWORD, NAME, PHONE FROM MEMBER;
--MEMBER�� COLUMN�� ID,PASSWORD,NAME,PHONE ������ ��ȸ 
---
--�Է� : �÷����� ��������� ���� �ʰ� INSERT�� �ۼ�
--���̺� �ִ� ��� �÷���� + �÷�������� ������ �Է�
INSERT INTO MEMBER 
VALUES ('HONG3', 'ȫ�浿3', '1234', '010-1111-1111', '�����');
COMMIT;

INSERT INTO MEMBER 
VALUES ('HONG4', 'ȫ�浿4', '1234', '�����', '010-2222-2222');
-----------------------
-- �÷��� ��������� �ۼ��� �ش� �÷��� 1 �� 1 ��Ī�Ǿ� ������ �Է�
INSERT INTO MEMBER (ID, NAME, PASSWORD, ADDRESS, PHONE)
VALUES ('HONG5', 'ȫ�浿5', '1234', '�����', '010-2222-2222');
COMMIT;
SELECT * FROM MEMBER;
--------------------------------------
-- ���� : HONG4 ��ȭ��ȣ '010-2222-2222'�� ����
-- ���� : HONG4 �ּ� '�����'�� ����
SELECT * FROM MEMBER WHERE ID = 'HONG4'; --MEMBER���� ID�� HONG4�� ������ ��ȸ
UPDATE MEMBER SET PHONE = '010-2222-2222' WHERE ID = 'HONG4';
UPDATE MEMBER SET ADDRESS = '�����' WHERE ID = 'HONG4';
UPDATE MEMBER
   SET PHONE = '010-2222-2222', ADDRESS = '�����'
 WHERE ID = 'HONG4';
COMMIT;
---------------------------------
--���� : HONG5 ������ ����
SELECT * FROM MEMBER WHERE ID = 'HONG5';
DELETE FROM MEMBER WHERE ID = 'HONG5';
COMMIT;
--���� : �̸��� ȫ�浿�� ��� ����
SELECT * FROM MEMBER WHERE NAME = 'ȫ�浿';
DELETE FROM MEMBER WHERE NAME = 'ȫ�浿';
COMMIT;
--=====================================
/* (�ǽ�) �Է�, ����, ����, ��ȸ(�˻�)
�Է� : ���̵�-HONG8, �̸�:ȫ�浿8, ��ȣ-1111, �ּ�-����� ������
��ȸ(�˻�) : �̸��� 'ȫ�浿8'�� ����� ���̵�, �̸�, �ּ�, ��ȭ��ȣ ��ȸ
���� : ���̵� HONG8 �����
    ��ȭ��ȣ : 010-8888-8888
    ��ȣ : 8888
    �ּ� : ����� ������
���� : ���̵� HONG2 �� ���    
********************************/
--�Է�
SELECT * FROM MEMBER WHERE ID = 'HONG8';
INSERT INTO MEMBER (ID, NAME, PASSWORD, ADDRESS)
VALUES ('HONG8', 'ȫ�浿8', '1111', '����� ������');
COMMIT;
--��ȸ(�˻�)
SELECT ID, NAME, ADDRESS, PHONE FROM MEMBER WHERE NAME = 'ȫ�浿8';
--����
SELECT * FROM MEMBER WHERE ID = 'HONG8';
UPDATE MEMBER
   SET PHONE = '010-8888-8888', 
       PASSWORD = '8888', 
       ADDRESS = '����� ������'
 WHERE ID = 'HONG8'
;
COMMIT;
-- ����
SELECT * FROM MEMBER WHERE ID = 'HONG2';
DELETE FROM MEMBER WHERE ID = 'HONG2';
COMMIT;
--02========================================================
--�÷� Ư���� Ȯ���ϱ� ���� ���̺� 
CREATE TABLE TEST(
    NUM NUMBER(5,2), --��ü�ڸ��� 5, ������ 3, �Ҽ��� ���� �ڸ��� 2(��ü�ڸ����� ����)
    STR1 CHAR(10), --�������� ���ڿ� 
    STR2 VARCHAR(10), --�������� ���ڿ� 
    DATE1 DATE --��¥������ : ����Ͻú���
 );
INSERT INTO TEST VALUES (100.454, 'ABC', 'ABC', SYSDATE);--SYSDATE�� ���� INSERT�ϴ� �ð�
INSERT INTO TEST VALUES (100.455, 'ABC', 'ABC',SYSDATE);
INSERT INTO TEST VALUES (100.456, 'ABC', 'ABC', SYSDATE);
--INSERT INTO TEST VALUES (1234.454, 'ABC', 'ABC', SYSDATE);
--�����߻� : ������ 3�ڸ� ���尡���ѵ�, 4�ڸ��� ������ 
COMMIT;
SELECT*FROM TEST;
INSERT INTO TEST VALUES (100.454, 'ABCDE', 'ABCDE', SYSDATE);
SELECT '-'|| STR1 || '-' ||  STR2 || '-' FROM TEST;
-- ���ڿ� ���϶� ||�� ����Ѵ�(JAVA ������ + ���)
SELECT  STR1, LENGTHB(STR1), LENGTHB(STR2) FROM TEST;
--LENGTHB : BYTE ���� ũ��  LENGTH :  ���ڴ��� ũ��
------------------------------------------------
SELECT*FROM TEST WHERE STR1 = STR2; --��ȸ�� ������ ���� (�÷� �� �÷�)
SELECT*FROM TEST WHERE STR1 = 'ABC'; --����Ŭ������ ��ȸ�� (�������̰� �޶�)
SELECT*FROM TEST WHERE STR1 = 'ABC       '; --��� DB���� 
SELECT*FROM TEST WHERE STR1 = 'ABC   '; --�̰͵� ����Ŭ���� ��ȸ���� 
------------------------------------------------
--����Ÿ�� 
SELECT*FROM TEST WHERE NUM = 100.45; --NUMBER VS NUMBER
SELECT*FROM TEST WHERE NUM = '100.45'; --����Ŭ��ȸ�� NUMBER VS CHAR(����)
--SELECT*FROM TEST WHERE NUM = '100.45 A'; --ORA-01722 : invalid number �̰� �ȵ� 
-------------------------------------------------
 INSERT INTO TEST ( STR1, STR2) VALUES('1234567890', '1234567890');
 SELECT*FROM TEST WHERE STR1 = STR2;
 SELECT '-' || STR1 || '-' ||  STR2 || '-' FROM TEST;
-------------------------------------------------
--��¥Ÿ�� DATE�� ���ο� �����Ͻú��� ������ ���� 
SELECT DATE1, TO_CHAR(DATE1,'YYYY-MM-DD HH24:MI:SS')FROM TEST;
--TO_CHAR ���ڿ��� ����ȯ(TO_����Ÿ��) HH :12�ð� ,HH24 :24�ð� 
SELECT DATE1, TO_CHAR(DATE1,'YYYY-MM-DD HH24:MI:SS')FROM TEST;
SELECT DATE1, TO_CHAR(DATE1,'YYYY-MM-DD HH24:MI:SS')FROM TEST;
--------------------------------------------------
--�ѱ۵����� ó��(UTF-8) :  ASKII�ڵ� 1byte �ѱ� 1���� 3byte ��� 
SELECT*FROM TEST;
INSERT INTO TEST(STR1,STR2) VALUES('ABCDEFGHIJ','ABCDEFGHIJ');
INSERT INTO TEST(STR1,STR2) VALUES('ABCDEFGHIJ','ȫ�浿'); -- �ѱ� 3���� *3 =9
INSERT INTO TEST(STR1,STR2) VALUES('ABCDEFGHIJ','���ѹα�'); --�ѱ� 4����*3 =12 // ����
---------------------------------------------------
/**********NULL(��) �� Ư��************
--NULL(��) :  �����Ͱ� ���� ����
--NULL�� ��ó���� �ȵ� : =, <>(�����ʴ�), !=, <, >, <=, >= ��ó�� �ǹ̾���(FALSE) 
--NULL���� �������� �׻� NULL(���� �ǹ� ����)
--NULL���� ���� ��ȸ�� IS NULL, IN NOT NULL Ű����� ó�� 
**************************************/
SELECT*FROM TEST WHERE NUM = NULL; --��ȸ�ȵ�(NULL�񱳿��� �ǹ̾���, ��������)
SELECT*FROM TEST WHERE NUM IS NULL; --�񱳿��� �������� IS NULL�� �˻� 
SELECT*FROM TEST WHERE NUM <> NULL; --<>�� != �� ������ 
SELECT*FROM TEST WHERE NUM IS NOT NULL; --IS NOT NULL �˻� 
---------------------------------------------------
--NULL ���� ������ -> NULL���� �������� �׻� NULL
SELECT*FROM TEST;
SELECT*FROM DUAL; --DUAL ���̺�(DUMMY���̺� : ����Ŭ���� ����)
SELECT 100 + 200, 111 + 222 FROM DUAL; --������ �ϳ��� �˻��ϰ� ������
SELECT 100 + NULL, 200-NULL, 100*NULL, 23/NULL FROM DUAL; --��� NULL
SELECT*FROM TEST;
SELECT NUM, NUM + 100 FROM TEST;
---------------------------------------------------
--���Ľ� NULL
SELECT*FROM TEST ORDER BY STR2; --�⺻ �������� ����, ASC Ű���� 
SELECT*FROM TEST ORDER BY STR2 DESC; --DESC : �������� ����

--���Ľ� ����Ŭ������ NULL���� ���� ū ������ ó��(�������� �� �� ������ ���)
--NULL�� ��ȸ ���� ���� : NULLS FIRST, NULLS LAST
SELECT*FROM TEST ORDER BY NUM;
SELECT*FROM TEST ORDER BY NUM DESC;
SELECT*FROM TEST ORDER BY NUM NULLS FIRST; --NULL���� ��ó������ 
SELECT*FROM TEST ORDER BY NUM NULLS LAST; --NULL���� �Ǹ���������
-----------------------------
--NULL�� ó�� 
SELECT NUM, NUM +100 FROM TEST;
--NULLó�� �����Լ� NVL(�÷�, ������) : �÷����� NULL�̸� ���������� ��ȯ(��ü��)
SELECT NUM, NUM+100, NVL(NUM, 0), NVL(NUM,0)+100 FROM TEST;
------------------------------
INSERT INTO TEST(NUM, STR1, STR2) VALUES(200, '', NULL);
SELECT*FROM TEST WHERE STR1 = ''; --������ ��ȸ �ȵ� ��? ''->NULLó����(����Ŭ������)
SELECT STR1, STR1 || '- �׽�Ʈ', NVL(STR1,'�������') || '-�׽�Ʈ' FROM TEST;
-- ������ ���̱�(||) �Ҷ��� ''�� ���ڿ� ó���Ǿ� �Էµȴ� 














