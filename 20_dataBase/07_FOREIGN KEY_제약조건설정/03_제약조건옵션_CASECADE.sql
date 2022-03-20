/*�������� �ɼ� 
CASCADE : �θ����̺�(PARENT)�� ���������� ��Ȱ��ȭ(OR ����) ��Ű�鼭 
          �����ϰ� �ִ� �ڳ�(CHILD)���̺��� �������Ǳ��� ��Ȱ��ȭ(OR ����)

*******************************/
SELECT * FROM DEPT;
SELECT * FROM EMP01;

--�θ����̺� ������ ���� - �ٸ����̺��� �����ϰ� ������ ���� �Ұ� 

--���1 : �ڳ����̺� �ִ� �������踦 DISABLEó�� �Ѵ� (�ڳ����̺��� ������ ����ã�Ƽ� ó��)
DELETE FROM DEPT WHERE ID = 10;
ALTER TABLE EMP01 DISABLE CONSTRAINT SYS_C007068;
ALTER TABLE EMP02 DISABLE CONSTRAINT EMP02_DEPTNO_FK;
ALTER TABLE EMP02 DISABLE CONSTRAINT EMP03_DEPTNO_FK;

ALTER TABLE EMP01 ENABLE CONSTRAINT SYS_C007068;
ALTER TABLE EMP02 ENABLE CONSTRAINT EMP02_DEPTNO_FK;
ALTER TABLE EMP02 ENABLE CONSTRAINT EMP03_DEPTNO_FK;

--���2 : DEPT���̺��� PK��Ȱ��ȭ ��Ű�鼭 
---------�����ϰ� �ִ� ���̺� EMP01, EMP02, EMP03�Բ� ��Ȱ��ȭ ó�� 
----------CASCADE �ɼ� ���  : �θ����̺� PK + �ڳ����̺� PK ���ÿ� ��Ȱ��ȭ ó�� 
ALTER TABLE DEPT DISABLE PRIMARY KEY CASCADE;
--DELETE FROM DEPT WHERE ID = 10; 

--=====================================================
/* �������� �ɼ� : ON DELETE CASCADE
���̺��� ���迡�� �θ����̺� ������ ������ 
�ڳ����̺� �����͵� �Բ� ����ó�� 
**********************************/
CREATE TABLE C_TEST_MAIN (
    MAIN_PK NUMBER PRIMARY KEY,
    NAIN_DATA VARCHAR2(30)
);
CREATE TABLE C_TEST_SUB (
    SUB_PK NUMBER PRIMARY KEY,
    SUB_DATA VARCHAR2(30),
    SUB_FK NUMBER,
    CONSTRAINT C_TEST_SUB_FK FOREIGN KEY (SUB_FK)
    REFERENCES C_TEST_MAIN (MAIN_PK) ON DELETE CASCADE
);
-------
INSERT INTO C_TEST_MAIN VALUES (1111,'1�� ���ε�����');
INSERT INTO C_TEST_MAIN VALUES (2222,'2�� ���ε�����');
INSERT INTO C_TEST_MAIN VALUES (3333,'3�� ���ε�����');
COMMIT;
--
INSERT INTO C_TEST_SUB VALUES (1,'1�� SUB ������','1111');
INSERT INTO C_TEST_SUB VALUES (2,'2�� SUB ������','2222');
INSERT INTO C_TEST_SUB VALUES (3,'3�� SUB ������','3333');
INSERT INTO C_TEST_SUB VALUES (4,'4�� SUB ������','3333');
COMMIT;
SELECT * FROM C_TEST_MAIN;
SELECT * FROM C_TEST_SUB;

--�������̺� ���� 
DELETE FROM C_TEST_MAIN WHERE MAIN_PK = 1111;
SELECT * FROM C_TEST_MAIN;
SELECT * FROM C_TEST_SUB;
DELETE FROM C_TEST_MAIN WHERE MAIN_PK = 3333;
ROLLBACK;

--===========================================================
-- ���̺� ����  : �θ�-�ڳ� ���� ������ �θ����̺� ���� 
DROP TABLE C_TEST_MAIN; --�������谡 �ֱ⿡ ���� �Ұ� 
--ORA-02449: unique/primary keys in table referenced by foreign keys

-- ���1 : �������̺� ��� �����ϰ� �θ����̺� ���� 
DROP TABLE C_TEST_SUB;
DROP TABLE C_TEST_MAIN;

-- ���2 : �������̺� �ִ� FK������ ��� ���� �Ŀ� �θ����̺� ���� 
--------- FK ��Ȱ��ȭ(DISABLE)�������δ� �ȵ�. FK�����ؾ��Ѵ� !!
ALTER TABLE C_TEST_SUB DROP CONSTRAINT C_TEST_SUB_FK;
DROP TABLE C_TEST_MAIN;

-- ���3 : �θ����̺� ���� �� CASCADE CONSTRAINTS �ɼ� ��� 
--------- �������̺��� ��������(FK) ���� �� �θ����̺�(MAIN) ���� ó�� 
DROP TABLE C_TEST_MAIN CASCADE CONSTRAINTS;
--=======================================================




















