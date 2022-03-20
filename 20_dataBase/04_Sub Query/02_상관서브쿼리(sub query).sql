/*��ȣ���� ��������( �����������)
-���������� ���� ���������� ����ϰ�, ���������� ������� ���������� ��� 
-���������� ���������� ���� ���ε� ���·� ���� 
********************************/
--select ���� ���� �������� 
select o.orderid, o.custid, o.bookid,
    (select name from customer where custid = o.custid) custname,
    (select bookname from book where bookid = o.bookid) bookname,
    o.saleprice, o.orderdate
 from orders o
;

select * from book 
order by publisher, price;
--�½����� ���ǻ� å �߿��� �½����� ���ǻ��� ��ձݾ׺��� ���å 
select * from book where publisher = '�½�����';
select avg(price) from book where publisher = '�½�����';--7000

select * 
 from book 
where publisher = '�½�����' 
  and price >= (select avg(price) from book where publisher = '�½�����')
 ;
-----
--���������� ���� ���������� ����ϰ�, ���������� ������� ���������� ��� 
--���������� ���������� ���� ���ε� ���·� ���� 

------���ǻ� �� ��� �������ݺ��� ��� å ����� ���Ͻÿ� 
select bookid, bookname, publisher, price,
        (select avg(price) avg_price from book where publisher =b.publisher) avg --���ǻ纰 ��հ� 
    from book b
 where price > (select avg(price) from book where publisher =b.publisher)
;
--���ι�( join�� )
--���ǻ� �� ��� ���� ���� 
select publisher , avg(price)
    from book 
group by publisher
;
------
--ansi
select *
 from book b
  inner join (select publisher, avg(price) avg_price from book group by publisher)avg
  on b.publisher = avg.publisher
where b.price > avg.avg_price
order by b.publisher, b.price
  ;
--
select *
 from book b,
 (select publisher, avg(price) avg_price from book group by publisher)avg
 where b.publisher = avg.publisher
 and b.price > avg.avg_price
order by b.publisher, b.price
;

--------------------------------------------------
-- exists :���翩�� Ȯ�ν� ���( ������ true)
-- not exists :�������� ������ true
-------in ���� ȿ�����̴�!
-- å�̸��� �౸�� ���� å�� ��ȸ�Ͻÿ�
select *
 from book
where bookname like '%�౸%'
;

select *
 from book
 where bookname in (select bookname from book where bookname like '%�౸%')
 ;
                   
select *
 from book b
 where exists (select bookname from book where b.bookname like '%�౸%')
 ;
                                       
 select *
 from book b
 where not exists (select bookname from book where b.bookname like '%�౸%')
 ;           
--------------
--�ֹ������� �ִ� ���� �̸��� ��ȭ��ȣ�� ã���ÿ� 
select * 
 from customer
 where custid in(select custid from orders)
 ;
--===>exists����
select *
 from customer c 
 where exists (select* from orders where custid = c.custid) 
 ;
select *
 from customer c 
 where exists (select  c.name from customer where c.name = '�迬��')
 ;










