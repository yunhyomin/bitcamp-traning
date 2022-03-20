/* ************************
��(VIEW) : �ϳ� �Ǵ� �� �̻��� ���̺�� ����
   �������� �κ������� ���̺��� ��ó�� ����ϴ� ��ü(�������̺�)
--��(VIEW) ������
CREATE [OR REPLACE] VIEW ���̸� [(�÷���Ī1, �÷���Ī2, ..., �÷���Īn)]
AS
SELECT ����
[�ɼ�];

--�б����� �ɼ� : WITH READ ONLY

--��(VIEW) ����
DROP VIEW ���̸�;
***************************/
--�÷���Ī�� ���� ������ �״�� �Űܰ��� 
select * from book where bookname like '%�౸%';
-------  ��(view) ����� --------
create view vw_book
as
select * from book where bookname like '%�౸%'
with read only;--�б����� 

--�� ����ؼ� ������ �˻� 
select * from (select * from book where bookname like '%�౸%');
select * from vw_book;
select * from vw_book where publisher = '�½�����';

-----------------------
--��(view)���� - �÷���Ī(alias)��� 
create view vw_book2 
    (bid, bname, pub, price)
as
select * from book where bookname like '%�౸%'
with read only
;
select * from vw_book2;
select * from vw_book2 where pub = '�½�����';
drop view vw_book3;
------------------------
--id���� �丸��� 
create view vw_book3
    (bname, pub, price)
as
select bookname, publisher, price from book where bookname like '%�౸%'
with read only
;
select * from vw_book3;
------------------------
--�ٸ����̺� �ִ� �����͸� ������ �Ź� ����(join)������ ������ ���̺���� ��� ������ ���̺�� ���� ���� ���ϰ� ����� �� �ִ�.
-- or replace�� �並 ���� 
create or replace view vw_orders 
as
select o.orderid, o.custid, o.bookid
     , b.bookname, b.publisher, b.price
     ,c.name, c.phone, c.address
     ,o.saleprice, o.orderdate
 from orders o, book b, customer c
where o.bookid = b.bookid and o.custid = c.custid
order by o.orderid
with read only
;
select * from vw_orders;

--(����) ������, �迬�ư� ������ å���� , ���Աݾ�, ���� ��¥ 
select bookname, price, orderdate
 from vw_orders
 where name in ('������', '�迬��')
 ;
-- �� ���� 
drop view vw_orders;

--============================
--(�ǽ�) �並 ����, ��ȸ, ����
--1. ����� - ���Ī : VW_ORD_ALL
---- �ֹ�(�Ǹ�)����, å����, ������ ��� ��ȸ�� �� �ִ� ���� �� 
--2. �̻�̵��� ������ å�� �Ǹŵ� å����, �Ǹűݾ�, �Ǹ��� ��ȸ
--3. �̻�̵��� ������ å �߿��� �߽ż�, ��̶��� ������ å ���� ��ȸ
---- ����׸� : ������ ����̸�, å����, ���ǻ�, ����(����), �ǸŰ�, �Ǹ�����
---- ���� : ������ ����̸�, �������� �ֱټ�
--4. �Ǹŵ� å�� ���Ͽ� �����ں� �Ǽ�, �հ�ݾ�, ��ձݾ�, �ְ�, ������ ��ȸ
--(����) ����� : VW_ORD_ALL ���� ó��
--================================
--1. ����� - ���Ī : VW_ORD_ALL
---- �ֹ�(�Ǹ�)����, å����, ������ ��� ��ȸ�� �� �ִ� ���� �� 
create view vw_ord_all
       /* (oderid, bookid, custid, bookname, pub, price, saleprice, name, phone, address, orderdate)*/
as
select o.orderid, o.bookid, o.custid, b.bookname, b.publisher,b.price,o.saleprice,
       c.name, c.phone, c.address, o.orderdate
 from orders o inner join book b on o.bookid = b.bookid
                inner join customer c on o.custid = c.custid
order by orderid
with read only
;

--2. �̻�̵��� ������ å�� �Ǹŵ� å����, �Ǹűݾ�, �Ǹ��� ��ȸ
select bookname, price, orderdate
 from vw_ord_all
where publisher = '�̻�̵��'
;
--3. �̻�̵��� ������ å �߿��� �߽ż�, ��̶��� ������ å ���� ��ȸ
---- ����׸� : ������ ����̸�, å����, ���ǻ�, ����(����), �ǸŰ�, �Ǹ�����
---- ���� : ������ ����̸�, �������� �ֱټ�
select name, bookname,publisher,price,saleprice,orderdate
 from vw_ord_all
where publisher = '�̻�̵��'
  and name in ('�߽ż�', '��̶�')
order by name, orderdate desc
;

--4. �Ǹŵ� å�� ���Ͽ� �����ں� �Ǽ�, �հ�ݾ�, ��ձݾ�, �ְ�, ������ ��ȸ
select name,count(*),sum(saleprice),floor(avg(saleprice)),max(saleprice),min(saleprice)
 from vw_ord_all
group by name
;

--(����) ����� : VW_ORD_ALL ���� ó��
drop view vw_ord_all;

--========================================================================
--force : select ���� ���̺��� ��� ��(view)�� ������ ���� 
create or replace force view vw_aaa
as
select id, name, phone from aaa; --- aaa���̺��� ������ :���: ������ ������ �Բ� �䰡 �����Ǿ����ϴ�.






















