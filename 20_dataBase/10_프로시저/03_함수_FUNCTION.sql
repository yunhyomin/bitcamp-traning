/***** �Լ� (FUNCTION)*******
CREATE OR REPLACE FUNCTION FUNCTION1 (
  PARAM1 IN VARCHAR2  -- �Ķ���� �ۼ� ����
) 
RETURN VARCHAR2 -- (�ʼ�)���� ������ Ÿ�� ����
AS 
BEGIN
  RETURN NULL; -- (RETURN �����ʼ�)���� �� 
END;
------------
(���ν������� ����)
-������ �����Ϳ� ���� ���� �ʿ�
RETURN ������ ����(Ÿ��)

-���α׷� �������� �� �����ϴ� ���� �ʿ� 
RETURN ���ϰ�;
********************************/

-- BOOKID�� å���� Ȯ���ϴ� �Լ� (�Ķ���Ͱ� : BOOKID, RETURN�� : BOOKNAME)
CREATE OR REPLACE FUNCTION GET_BOOKNAME (
  IN_ID IN NUMBER 
) RETURN VARCHAR2 --������ ������ Ÿ�� ����
AS 
    V_BOOKNAME BOOK.BOOKNAME%TYPE;
BEGIN
    SELECT BOOKNAME INTO V_BOOKNAME 
      FROM BOOK
     WHERE BOOKID = IN_ID;
     
  RETURN V_BOOKNAME; -- ���� �� 
END /*GET_BOOKNAME*/;
----------------------------------
--�Լ� ( FUNCTION )�� ���
--SELECT ���� ��� 
SELECT BOOKID, BOOKNAME, GET_BOOKNAME(BOOKID)
  FROM BOOK
;
---------
--WHERE������ �Լ� ��� (�׷��Լ��� WHERE������ �� �� ���� )
-- * �� ���� ��ȸ�Ϸ��� ALIAS�� �̿��Ͽ� ���־�߸� �Ѵ�!!
SELECT O.*,GET_BOOKNAME(BOOKID) 
  FROM ORDERS O
WHERE GET_BOOKNAME(BOOKID) = '�౸�� ����'
;
SELECT O.*,GET_BOOKNAME(BOOKID) 
  FROM ORDERS O
WHERE BOOKID=3
;
--------------------------------------
--(�ǽ�)
-- �� ID���� �޾Ƽ� ������ �����ִ� �Լ� �ۼ�(CUSTOMER���̺� ���)
-- �Լ��� : GET_CUSTNAME
-- �Լ��� �̿��ؼ� ORDERS���̺� ������ ��ȸ 
-- GET_BOOKNAE, GET_CUSTNAME �Լ���� �ֹ�(�Ǹ�) ������ å����, ���� ��ȸ
-----------------------------------------

-- �� ID���� �޾Ƽ� ������ �����ִ� �Լ� �ۼ�(CUSTOMER���̺� ���)
-- �Լ��� : GET_CUSTNAME
CREATE OR REPLACE FUNCTION GET_CUSTNAME (
  IN_CUSTID IN NUMBER 
) RETURN VARCHAR2 
AS 
    V_CUSTNAME CUSTOMER.NAME%TYPE; --������ �� ������Ÿ�Լ���
BEGIN
    SELECT NAME INTO V_CUSTNAME
      FROM CUSTOMER
     WHERE CUSTID = IN_CUSTID;
  RETURN V_CUSTNAME;
END GET_CUSTNAME;

-- �Լ��� �̿��ؼ� ORDERS���̺� ������ ��ȸ 
SELECT O.*,GET_CUSTNAME(CUSTID)
  FROM ORDERS O
;
-- GET_BOOKNAE, GET_CUSTNAME �Լ���� �ֹ�(�Ǹ�) ������ å����, ���� ��ȸ
SELECT O.*, GET_BOOKNAME(BOOKID), GET_CUSTNAME(CUSTID)
  FROM ORDERS O
;










