/******************************* 
����Ŭ�� �����Լ� - ���ڿ�, ����, ��¥ ���� �Լ�
<���ڿ� ���� �����Լ�>
UPPER : �빮�ڷ� ����
LOWER : �ҹ��ڷ� ����
INITCAP : ù ���ڸ� �빮�ڷ� �������� �ҹ���
LENGTH : ���ڿ��� ����(���ڴ���)
LENGTHB : ���ڿ��� ����(BYTE ����)
SUBSTR(���, ������ġ, ����) : ���ڿ��� �Ϻ� ����
   (������ġ�� 1���� ����, �����ʿ��� �����ϴ� ��� ���̳ʽ�(-)�� ���)
INSTR(���, ã�¹���) : ����ڿ��� ã�¹��� ��ġ�� ����
INSTR(���, ã�¹���, ������ġ)
INSTR(���, ã�¹���, ������ġ, nth) : nth ã������ ������(3 : 3��° ã�� ��)
TRIM('���ڿ�') : ���� ���� ����
LTRIM('���ڿ�') : ���ʿ� �ִ� ���� ����
RTRIM('���ڿ�') : �����ʿ� �ִ� ���� ����
CONCAT(���ڿ�1, ���ڿ�2) : ���ڿ� ���� - ���ڿ�1 || ���ڿ�2
LPAD(����ڿ�, ��ü���ڼ�, ���Եɹ���) : ���ʿ� ����
----���� �� ���� ä��� pad : ������, �� �� ä��°�, �������ִ� 
RPAD(����ڿ�, ��ü���ڼ�, ���Եɹ���) : �����ʿ� ����
----���� �� ���� ä��� 
REPLACE(����ڿ�, ã������, ���湮��) : ���ڿ����� ã�����ڸ� ����
********************************/

--UPPER : �빮�ڷ� ����
--LOWER : �ҹ��ڷ� ����
--INITCAP : ù ���ڸ� �빮�ڷ� �������� �ҹ���
 SELECT BOOKNAME, UPPER(BOOKNAME) FROM BOOK ORDER BY BOOKNAME;--BOOKNAME�� ��� �빮�ڷ� 
 SELECT BOOKNAME, LOWER(BOOKNAME) FROM BOOK ORDER BY BOOKNAME;--BOKKNAME�� ��� �ҹ��ڷ� 
 SELECT INITCAP ('olympic champions') FROM DUAL;--Olympic Champions
 SELECT INITCAP ('OLYMPIC CHAMPIONS') FROM DUAL;--Olympic Champions
------------
SELECT * FROM BOOK WHERE BOOKNAME = 'Olympic Champions';
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'OLYMPIC%';--��ȸ�ȵ�
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'olympic%';--��ȸ�ȵ�   
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'Olympic%';--��ȸ����  

--����, �ο�, �̴ϼ�ĸ���� ���̸� ����. �����ڴ� ��� ��ҳ�Ÿǥ�⹮��ȭ
-- ���� ������ ��ȸ�� ��ҹ��ڰ� �����ϴ�. �װ� ó���� �� �ֵ��� ���ִ� ������ �Ʒ��� ����.
SELECT BOOKID, BOOKNAME, UPPER(BOOKNAME) FROM BOOK 
WHERE UPPER(BOOKNAME) LIKE 'OLYMPIC%'
ORDER BY BOOKNAME;
-------------------------------------  
--LENGTH : ���ڿ��� ����(���ڴ���)
--LENGTHB : ���ڿ��� ����(BYTE ����)
SELECT LENGTH ('ABCDE123#$') FROM DUAL; --���ڴ���  :10 
SELECT LENGTHB('ABCDE123#$') FROM DUAL; --BYTE���� :10

SELECT LENGTH('ȫ�浿123') FROM DUAL; --���ڴ��� :6
SELECT LENGTHB('ȫ�浿123') FROM DUAL; --BYTE���� :12(9+3)

--------------------------------------
--SUBSTR(���, ������ġ, ����) : ���ڿ��� �Ϻ� ����
-------   (������ġ�� 1���� ����, ������(��)���� �����ϴ� ��� ���̳ʽ�(-)�� ���)
SELECT SUBSTR('ȫ�浿123', 1) FROM DUAL; --ȫ�浿123 : ������ ������ �Ǿ����� ������ ������
SELECT SUBSTR('ȫ�浿123456', 4) FROM DUAL; --123456
SELECT SUBSTR('ȫ�浿123', 1,3) FROM DUAL; -- ȫ�浿 
SELECT SUBSTR('ȫ�浿123', -3) FROM DUAL; --123 : �ڿ��� 3�� 
SELECT SUBSTR('ȫ�浿123', -3,3) FROM DUAL; --123
SELECT SUBSTR('ȫ�浿123', -3,2) FROM DUAL; --12
SELECT SUBSTR('ȫ�浿123456', -3,3) FROM DUAL; --456

--------------------------------------------
--INSTR(���, ã�¹���) : ����ڿ��� ã�¹��� ��ġ�� ����
--INSTR(���, ã�¹���, ������ġ)
--INSTR(���, ã�¹���, ������ġ, nth) : nth ã������ ������(3 : 3��° ã�� ��)
SELECT INSTR ('900101-1234567', '-') FROM DUAL; --7��° ��ġ �� ���� 
SELECT INSTR ('900101-1234567', '*') FROM DUAL; --������ :0 ���� 
SELECT INSTR ('900101-1234567', '34') FROM DUAL; --10
SELECT INSTR ('900101-1234567', '1') FROM DUAL; --4 : ������ġ���� ���ָ� �� ù��° ���� 
SELECT INSTR ('900101-1234567', '1',7) FROM DUAL; --8 : 7��° ��ġ���� ã�� 
SELECT INSTR ('900101-1234567', '1',1,2) FROM DUAL; --6 : 1��°���� ã�� ã������ 2��°�� ��ġ 

---------------------------------------------
--TRIM('���ڿ�') : ���� ���� ����
--LTRIM('���ڿ�') : ���ʿ� �ִ� ���� ����
--RTRIM('���ڿ�') : �����ʿ� �ִ� ���� ����
SELECT '    TEST    ' , '-'|| TRIM('    TEST    ')||'-' FROM DUAL; 
SELECT '    TEST    ' , '-'|| LTRIM('    TEST    ')||'-' FROM DUAL; 
SELECT '   TEST    ' , '-'|| RTRIM('    TEST    ')||'-' FROM DUAL; 

---------------------------------------------
--CONCAT(���ڿ�1, ���ڿ�2) : ���ڿ� ���� - ���ڿ�1 || ���ڿ�2
SELECT CONCAT('HELLO ', 'WORLD') FROM DUAL;
SELECT 'HELLO '||'WORLD' FROM DUAL;

------------------------
--LPAD(����ڿ�, ��ü���ڼ�, ���Եɹ���) : ���ʿ� ����
--RPAD(����ڿ�, ��ü���ڼ�, ���Եɹ���) : �����ʿ� ����
SELECT '-'||LPAD('HELLO', 10)||'-' FROM DUAL; --���Ե� ���ڸ� ����������,������ �������� ä��� 
SELECT LPAD('HELLO',10,'*') FROM DUAL; --*****HELLO

SELECT '-'||RPAD('HELLO', 10)||'-' FROM DUAL; --���Ե� ���ڸ� ����������,�������� �������� ä��� 
SELECT RPAD('HELLO',10,'*') FROM DUAL;--HELLO*****
SELECT LPAD('HELLO',10,'*~') FROM DUAL;--*~*~*HELLO

--------------------------
--REPLACE(����ڿ�, ã������, ���湮��) : ���ڿ����� ã�����ڸ� ���� 
SELECT 'HELLO JAVA', REPLACE('HELLO JAVA', 'A','O') FROM DUAL;  --HELLO JOVO
SELECT 'HELLO JAVA JAVA', REPLACE('HELLO JAVA JAVA', 'JA','JO') FROM DUAL;--HELLO JOVA JOVA
SELECT 'HELLO JAVA', REPLACE('HELLO JAVA', 'JAVA','WORLD') FROM DUAL;--HELLO WORLD
  
  
  
  