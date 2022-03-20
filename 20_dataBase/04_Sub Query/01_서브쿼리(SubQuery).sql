--�������� (�μ����� , sub query)
--sql(select, insert, update, delete)���� �ִ� ������ 
-----------------------------------------------------
--�������� ������ ������ �˻� 
select custid from customer where name = '������'; --custid :1
select *from orders where custid = 1;

--�������� ��� 
select * from orders
 where custid = (select custid from customer where name = '������')--�ϳ��̻��̸� in �Ǵ� not in���� ��� 
 ;

--join������ ó�� 
 select *
  from orders o
    inner join customer c on o.custid = c.custid
 where c.name = '������'
 ;
 -----------------------------------------------------
 --where ������ �������� ���� ��ȸ����� 2�� �̻��� ��� in��� 
 --������, �迬�� ���Գ��� (��������)
 select * from orders
 where custid  in (select custid from customer where name in ('������', '�迬��'))--�ϳ��̻��̸� in �Ǵ� not in���� ��� 
 ;
 --------------------------------
 --å �� ������ ���� ��� ������ �̸��� ���Ͻÿ� 
 select max(price) from book; --������å�� ���� 
 select * from book where price = 35000;
 select * from book where price = (select max(price) from book );
 
 --------------------------------
 --���������� from ���� ����ϴ� ��� 
select * 
 from book b,
    (select max(price) max_price from book) m
where b.price = m.max_price
;
select *
 from book b
    inner join (select max(price) max_price from book) m
    on b.price = m.max_price
;
--(�ǽ�)���ǵ� å�� ��ձݾ� �̻��� �������(from�� �������� ��� )
select * 
 from book b
    inner join (select floor(avg(price)) avg_price from book) a
    on b.price >= a.avg_price
 ;
--(�ǽ�) ������, �迬�� ���Գ��� (�������� - from��)
select * 
 from orders o 
    inner join (select * from customer where name in('������','�迬��')) c
    on o.custid = c.custid
;
--�������� ���� ���ϱ� 
select *
 from orders o
    inner join customer c on o.custid = c.custid
where name in( '�迬��','������')
;

----------------------
--select ���� �������� ��� �� 
select o.orderid, o.custid, o.bookid,
    (select name from customer where custid = o.custid) custname,
    (select bookname from book where bookid = o.bookid) bookname,
    o.saleprice, o.orderdate
 from orders o
;
-- customer�� book, orders�� �ִ� �÷��� ��ȸ 
------------------------
--�������� ���� ��������
--�������� ������ å ��� (å����)
select *
 from book
    where bookid in(select bookid from orders where custid in
                   (select custid from customer where name = '������'))
;

-------------------------
--(�ǽ�) ��������, ���ι� �Ѵ� �Ẹ�� ����Ŭ ���� ���ι��� �Ẹ�� 
--1.�� ���̶� ������ ������ �ִ� ���
--join 
select * 
 from customer c inner join orders o on c.custid = o.custid ;

select * 
 from customer c, orders o where c.custid = o.custid;
 
--sub query
select * 
 from customer c inner join (select custid from orders) o on c.custid = o.custid ;

-----(�Ǵ� �� ���� �������� ���� ���)
--outer join 
select * 
  from customer c left join orders o on c.custid = o.custid
where o.custid is null;
--sub query 
select * 
 from customer 
where custid not in(select c.custid from orders o , customer c where c.custid = o.custid);

--2. 20000�� �̻�Ǵ� å�� ������ �� ��� ��ȸ
--sub query
select*
 from customer c inner join(select * from orders where saleprice >= 20000) o
   on c.custid = o.custid 
;
--join 
select * 
 from customer c 
 inner join orders o on c.custid = o.custid
where o.saleprice >= 20000
;

--3. '���ѹ̵��' ���ǻ��� å�� ������ ���̸� ��ȸ 
--subquery
select * 
 from customer c
  inner join (select custid from orders where bookid 
                in (select bookid from book where publisher = '���ѹ̵��')) b
    on c.custid = b.custid
;
--join
select c.name, b.bookname, o.saleprice 
 from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and b.publisher = '���ѹ̵��'
;
--4. ��ü å���� ��պ��� ��� å�� ��� ��ȸ 
--sub query ,join
select *
from book b inner join (select round(avg(price)) avg_price from book ) avg
 on b.price > avg.avg_price
;
--����������� 
select bookname, price, publisher,(select round(avg(price)) avg_price from book) avg
 from book b
where b.price > (select round(avg(price)) avg_price from book)
;






 
 
 
 
 
 
 
 
 
 
 
 
 