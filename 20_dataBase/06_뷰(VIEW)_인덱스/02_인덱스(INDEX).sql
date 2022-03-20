/* *********************************
<�ε��� - INDEX>
���̺� �ִ� ������(�ο�, ���ڵ�)�� ������ ã�� ���� ������� ������ ����
- �ڵ��ε��� : PRIMARY KEY ����� �Ǵ� UNIQUE �������� ������ �����Ǵ� �ε���
- �����ε��� : CREATE INDEX ��ɹ��� ����ؼ� ����� �ε���

<�ε��� ������ �������>
-�ε����� WHERE���� ���� ���Ǵ� �÷��� ����
-�������ǿ� ���� ���Ǵ� �÷��� ����
-�÷��� ������ �������� ���� �� ȿ�� ����(10~15%)
-���� ���̺� �ε����� �ʹ� ���Ƶ� �ӵ� ���� ���� �߻�(���̺�� 4~5����)
-�÷��� �����Ͱ� ����(�Է�,����,����)�Ǵ� ��찡 ������ �ε��� ��뷮 ����
--(������ �Է�, ����, ������ �ε����� ���� �Է�, ����, ���� �۾� �߻�)

<�ε��� ���� ����>
CREATE INDEX �ε����� ON ���̺�� (�÷���1[, �÷���2, ..., �÷���n]);
CREATE [UNIQUE] INDEX ON ���̺�� (�÷���1 [ASC|DESC], �÷���2, .., �÷���n);

<�ε��� ���� ����>
ALTER [UNIQUE] INDEX �ε����� ON ���̺�� (�÷���1[, �÷���2, ..., �÷���n]);

<�ε��� ���� ����>
DROP INDEX �ε�����;

<�ε��� �籸�� ����>
ALTER INDEX �ε����� REBUILD;
ALTER [UNIQUE] INDEX �ε����� [ON ���̺�� (�÷���, ...)] REBUILD;
************************************/
--�ε��� ���� : book���̺��� ���ǻ�(publisher)�÷��� ix_book �ε��� ����� 
CREATE INDEX IX_BOOK ON BOOK(PUBLISHER);
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����'; --f10
--publisher �������� ���ĵǾ��ֱ⶧���� ȿ�����̴� 
SELECT PUBLISHER, BOOKID FROM BOOK ORDER BY PUBLISHER; --ix_book�ε����� ���Ǹ� �̷� �����̴� 

SELECT *FROM BOOK WHERE BOOKNAME = '�౸�� ����';--�ε��� ���� x

--�ε��� ���� : 2�� �÷� ��� 
--book ���̺��� pulbisher, price �÷��� ������� ix_book2 �ε��� ���� 
CREATE INDEX IX_BOOK2 ON BOOK (PUBLISHER, PRICE);
SELECT * FROM BOOK WHERE PUBLISHER = '���ѹ̵��'; -- ix_book��� -->alter index "MADANG"."IX_BOOK" unusable ����
SELECT * FROM BOOK WHERE PUBLISHER = '���ѹ̵��'; -- ix_book2��� 
SELECT PUBLISHER, PRICE FROM BOOK ORDER BY PUBLISHER, PRICE;--ix_boo2 �� ����Ǹ� �̷����� 
SELECT * FROM BOOK WHERE PRICE > 10000; --�ε��� ������� 

--where ���� publisher, price �÷� ���� ���� ix_book2 �ε��� ��� ���� ���� 
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����' AND PRICE = '7000'; -- ����
SELECT * FROM BOOK WHERE   PRICE = '7000' AND PUBLISHER = '�½�����'; -- ����x
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����' AND PRICE >= '7000'; -- ����

--�ε����� �ִµ� ����� �ȵǴ� ��� 
SELECT * FROM BOOK WHERE PUBLISHER LIKE '����%'; --�ε��� ����
SELECT * FROM BOOK WHERE PUBLISHER LIKE '%����%'; --�ε��� ���� ����
SELECT * FROM BOOK WHERE PUBLISHER LIKE '%����'; --�ε��� ���� ����

--���������͸� �����ϴ� ��� (�ε��� ���� �ȵ�) : substr, upper, lower, ���
SELECT * FROM BOOK WHERE SUBSTR(PUBLISHER, 1,2) = '����'; --�ε��� ���� �ȵ� 
SELECT * FROM BOOK WHERE UPPER(PUBLISHER) = UPPER('pearson'); --�ε��� ���� �ȵ� 

DROP INDEX IX_BOOK2;
DROP INDEX IX_BOOK;

--======================================
/* *** �ε��� �ǽ� ****************************
���缭�� �����ͺ��̽����� ���� SQL ���� �����ϰ� 
�����ͺ��̽��� �ε����� ����ϴ� ������ Ȯ���Ͻÿ�.
(1) ���� SQL ���� �����غ���.
	SELECT name FROM Customer WHERE name LIKE '�ڼ���';
(2) ���� ��ȹ�� ���캻��. ���� ��ȹ�� [F10]Ű�� ���� �� 
    [��ȹ ����]���� �����ϸ� ǥ�õȴ�.
(3) Customer ���̺� name���� �ε���(ix_customber_name)�� �����Ͻÿ�. 
    ���� �� (1)���� ���Ǹ� �ٽ� �����ϰ� ���� ��ȹ�� ���캸�ÿ�.
(4) ���� ���ǿ� ���� �� ���� ���� ��ȹ�� ���غ��ÿ�.
(5) (3)������ ������ �ε����� �����Ͻÿ�.
******************************************/
SELECT NAME FROM CUSTOMER WHERE NAME LIKE '�ڼ���'; --full option
CREATE INDEX IX_CUSTOMER_NAME ON CUSTOMER(NAME);
SELECT NAME FROM CUSTOMER WHERE NAME LIKE '�ڼ���'; --
DROP INDEX IX_CUSTOMER_NAME;






