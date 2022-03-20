/*****  ������ ( SEQUENCE )*****
SEQUENCE : DB���� �����ϴ� �ڵ�ä�� ��ü 
���� : CREATE SEQUENCE �������� ; 
���� : DROP SEQUENCE �������� ;

��������.NEXTVAL : ������ ��ȣ(��) ����
��������.CURRVAL : ���� ������ �� 
******************************/
CREATE SEQUENCE "MADANG"."SEQUENCE1"
MINVALUE 1 MAXVALUE 999999999999999999999999999999999
INCREMENT BY 1
START WITH 1 CACHE 20 NOORDER NOCYCLE;
------------------
SELECT * FROM BOOK;
SELECT MAX(BOOKID), MAX(BOOKID) +1 FROM BOOK;

--�����Ͱ� ������(NULL�϶� --> NVL���ֱ�)
SELECT * FROM BBB;
SELECT NVL(MAX(BBB),0),NVL(MAX(BBB),0) +1 FROM BBB;

------
SELECT SEQUENCE1.NEXTVAL FROM DUAL;
SELECT SEQUENCE1.CURRVAL FROM DUAL;
----------------------------
--BOOK ���̺� INSERT�۾�, BOOKID�ִ밪 +1
INSERT INTO BOOK 
        (BOOKID,BOOKNAME,PUBLISHER,PRICE)
VALUES ((SELECT NVL(MAX(BOOKID),0) +1 FROM BOOK),
        'MAX + 1����', 'ITBOOK', 2000);
SELECT * FROM BOOK ORDER BY BOOKID DESC;
-------------------------------------------------     

-----------------------------------
-- ������ ����(���۹�ȣ 50, NOCACHE)
CREATE SEQUENCE SEQ_BOOK
START WITH 50
INCREMENT BY 1 -- ������ �����ϰ� ���� DEFAULT 1
NOCACHE;
------
--BOOK ���̺� ������ ����ؼ� ������ �Է� ó�� 
INSERT INTO BOOK 
        (BOOKID,BOOKNAME,PUBLISHER,PRICE)
VALUES (SEQ_BOOK.NEXTVAL,'������ ���', 'IT_BOOK',25000);
SELECT * FROM BOOK ORDER BY BOOKID DESC;


SELECT SEQ_BOOK.NEXTVAL FROM DUAL;
----------------------------------------








