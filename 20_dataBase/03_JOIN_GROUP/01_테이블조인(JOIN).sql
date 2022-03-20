--������ ��ID
SELECT CUSTID FROM CUSTOMER WHERE NAME ='������'; --CUSTID : 1
--�������� ������ å�� �հ�ݾ� 
SELECT * FROM ORDERS WHERE CUSTID ='1';
SELECT SUM(SALEPRICE)
 FROM ORDERS 
WHERE CUSTID = '1'
 ;
--��������(SUB QUERY) ��� 
SELECT SUM(SALEPRICE) FROM ORDERS
 WHERE CUSTID = (SELECT CUSTID FROM  CUSTOMER WHERE NAME ='������')
 ;
 --==========================================
 --���̺� ����(JOIN)��� 
SELECT * FROM CUSTOMER WHERE CUSTID =1;
SELECT * FROM ORDERS WHERE CUSTID =1;

--CUSTOMER, ORDERS ���̺� ������ ���� ��ȸ 
SELECT *
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
AND NAME = '������'
;
---------------------------------------
--���̺� ���� ��Ī ������� �����ϰ� ǥ���ϰ� ��� 
SELECT *
 FROM CUSTOMER C, ORDERS O  --���̺� ���� ��Ī ���
    WHERE C.CUSTID = O.CUSTID  --�������� : ���ĺ��ʹ� ��Ī�� ����ؾ��Ѵ�!
AND C.NAME = '������' --�˻����� : NAME�� ����ũ �ϱ⶧���� ��Ī�� �Ƚᵵ ������ ���ִ°��� ����!!!!
;
---------ANSI ǥ�� ���� ���� 
SELECT * 
 FROM CUSTOMER C 
    INNER JOIN ORDERS O
    ON C.CUSTID = O.CUSTID --�������� 
WHERE C.NAME = '������' --�˻�����
;
----------------
--�������� ������ �հ�ݾ� 
SELECT SUM(O.SAILPRICE)
--SELECT *
 FROM CUSTOMER C, ORDERS O --������ ���̺� 
    WHERE C.CUSTID = O.CUSTID --�������� 
AND C.NAME = '������' --�˻����� 
;

-----------------
SELECT * FROM BOOK;
SELECT * FROM ORDERS;
--������ å�� �Ǹŵ� å ��� (�̵��� ������ ���ǻ縸)
SELECT *
FROM BOOK B, ORDERS O
    WHERE B.BOOKID = O.BOOKID --���ǹ��� �����͸� ����� �������� 
AND B.PUBLISHER LIKE '%�̵��' --�˻����� 
ORDER BY B.PUBLISHER,B.BOOKNAME
;

------------------
--ǥ������ ������ �ۼ� �غ���!!
Select * 
 From Book B
    Inner Join Orders O
    On B.Bookid = O.Bookid
Where B.Publisher Like '%�̵��'
Order By B.Publisher, B.Bookname
;
------------------

--==========================
--(�ǽ�) ���̺��� �����ؼ� ��û������ ã�� 
--1.'�߱��� ��Ź��' ��� å�� �ȸ����� Ȯ�� (å����, �Ǹűݾ�, �Ǹ�����)
SELECT * FROM BOOK, ORDERS;
SELECT B.BOOKNAME, o.salePRICE, O.ORDERDATE
    FROM BOOK B 
    INNER JOIN ORDERS O
    ON B.BOOKID = O.BOOKID
WHERE B.BOOKNAME = '�߱��� ��Ź��'
;
--2.'�߱��� ��Ź��' ��� å�� ����� �ȷȴ��� Ȯ��
SELECT * FROM BOOK, ORDERS;
SELECT  '�߱��� ��Ź�� �ǸŰǼ� ',COUNT(*)
    FROM BOOK B
    INNER JOIN ORDERS O
    ON B.BOOKID = O.BOOKID
WHERE BOOKNAME = '�߱��� ��Ź��'
;
--3. '�߽ż�'�� ������ å���� �������� (å��, ��������, å����  )
select * from book, customer, orders;
select '�߽ż��� ������ ����' , b.bookname, o.saleprice, o.orderdate
 from book b ,customer c, orders o
  where c.custid = o.custid and o.bookid = b.bookid
 and c.name = '�߽ż�'
 ;
--4. '�߽ż�'�� ������ �հ�ݾ� 
select '�߽ż��� ������ �ݾ�',sum(o.saleprice)
 from book b, customer c ,orders o
    where b.bookid = o.bookid 
and c.name = '�߽ż�'
    ;
--5. ������ , �߽ż��� ������ ������ Ȯ�� (�̸�, �Ǹűݾ�, �Ǹ�����)
select c.name, o.saleprice, o.orderdate
 from customer c
    inner join orders o
    on c.custid = o.custid
 where c.name in('������','�߽ż�') --in�� or�� �ܼ�ȭ 
 ;
 -----����Ŭ �������� join
 select c.name, o.saleprice, o.orderdate
  from customer c, orders o
    where c.custid = o.custid
and (c.name ='�߽ż�' or c.name = '������') --or���� and�� �켱�����̱⶧���� ()�� ������� 
;

--==========================
--3�� ���̺� ����(����)�ؼ� ������ ��ȸ(�˻�, ����)
--����, å����, ���ǻ�, �ǸŰ���, �Ǹ����� 
select  c.name, b.bookname, b.publisher, o.saleprice, o.orderdate 
  from orders o, book b, customer c
    where b.bookid = o.bookid --��������
    and o.custid = c.custid    --�������� 
;
--ansiǥ��
select *
  from book b 
    inner join orders o  
        on b.bookid = o.bookid
    inner join customer c
        on o.custid = c.custid
;

--===================================
--(�ǽ�) book,customer, orders���̺� �����͸� ��ȸ 
--1. ��̶��� ������ å����, ���԰���, ��������, ���ǻ� 
select c.name, o.saleprice, o.orderdate, b.publisher
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
where c.name = '��̶�'
;
--2. ��̶��� ������ å �߿� 2014-01-01 ~ 2014-07-08���� ������ ���� 
select orderdate, to_char(orderdate, 'yyyy-mm-dd hh:mi:ss') from orders; --�ú��ʱ��� Ȯ���غ��� 
select * 
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
where c.name = '��̶�'
 and o.orderdate between to_date('2014-01-01','yy-mm-dd') 
                     and to_date('2014-07-08','yy-mm-dd') --2014-07-08 00:00:00���� 
;
select * 
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
where c.name = '��̶�'
  and o.orderdate >= to_date('2014-01-01','yy-mm-dd')
  and o.orderdate <= to_date('2014-07-09','yy-mm-dd') --2014-07-09 00:00:00���� 
;

--3.'�߱��� ��Ź��'��� å�� ������ ����� �������ڸ� Ȯ��
select b.bookname, c.name, o.orderdate
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
 where b.bookname = '�߱��� ��Ź��'
;
--4.�߽ż�, ��̶��� ������ å����, ���Աݾ� , �������� Ȯ�� 
--------(���� : ����, �������� ������ )
select c.name, b.bookname, o.saleprice, o.orderdate
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
 where c.name in('��̶�','�߽ż�')
--order by c.name, o.orderdate
 order by 1,4 --�̷��� �� ���ִ� (select���� ��ġ ��)
;
--5.�߽ż��� ������ å ����, �հ�ݾ�, ��հ�, ���� ���å �ݾ�, ���� ��å �ݾ�
select '�߽ż�',count(*), sum(o.saleprice), avg(o.saleprice),max(o.saleprice), min(o.saleprice)
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
 where c.name = '�߽ż�' --������� ��ȸ�Ϸ��� �߽ż��� ���� �ȴ� 
;
---------���� ������ ������� ��ȸ �ϰ������ 
select c.name,count(*), sum(o.saleprice), round(avg(o.saleprice)),max(o.saleprice), min(o.saleprice)
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
group by c.name --�����͸� �׷캰�� ��ȸ group by
;








