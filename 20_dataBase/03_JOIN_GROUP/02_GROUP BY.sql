/*****************************
select [* | distinct] {�÷���, �÷���,...}
 from ���̺�� 
 [where ������]
 [group by {�÷���, ...}
    [having ����] ] --group by ���� ���� ���� 
 [order by {�÷��� [ascii | desc],...}] --ascii : �������� (�⺻/ ��������)
                                       --desc :  �������� 
------------------------------------------------
 group by  : �����͸� �׷����ؼ� ó���� ��� ��� 
 group by ���� ����� �� select �׸� ����� �� �ִ°��� 
    group by���� ���� �÷� �Ǵ� �׷��Լ� (count,sum,avg,max,min)�� ����� �� �ִ� 
******************************/

--���� ������ ���űݾ��� �հ踦 ���Ͻÿ� 
select * from orders;
select custid, sum(saleprice)
 from orders
 group by custid
 ;
 ------------------------
 select c.name
 from customer c
    inner join orders o
    on c.custid = o.custid
group by c.name
order by c.name
;
--���� ���� ����� �˰�ʹ� 
select c.name ,sum(o.saleprice)
 from customer c
    inner join orders o
    on c.custid = o.custid
group by c.name
--order by sum(o.saleprice)
order by 2 desc--select ���� 2��° �׸����� �������� ����
; 

--------------------------------
--�ֹ�(�Ǹ�) ���̺��� ���� ������ ��ȸ(�Ǽ�, �հ�ݾ�, ���, �ּ�, �ִ� )
select c.name, count(*), sum(o.saleprice), trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
    where c.name in('������','�߽ż�')
 group by c.name
 order by c.name
;
-----------------------
--(�ǽ�) ���� �������� ���� ������ ��ȸ (�Ǽ�, �հ�ݾ�, ���, �ּ�, �ִ� )
---�߽ż�, ��̶� ��2�� ��ȸ 
select c.name, count(*), sum(o.saleprice), floor(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
    where c.name in('�߽ż�','��̶�')
group by c.name
order by c.name
;

------------------------------------------------------------------------
--HAVING�� : GROUP BY ���� ���ؼ� ������� �����Ϳ��� �˻����� �ο� 
--HAVING���� �ܵ����� ���� �� ����, �ݵ�� GROUP BY���� �Բ� ��� 
-------------------------------------------------------------------------
--3���̻� ������ �� ��ȸ (����, �Ǽ�)
select c.name, count(*) as cnt
 from customer c
    inner join orders o on c.custid = o.custid
 group by c.name
having count(*) >= 3 --�׷��ε� �����Ϳ��� ���ϴ� ������ �˻� 
;
------------------
--������ å�߿��� 20000�� �̻��� å�� ������ ����� ��赥���� (�Ǽ�, �հ�ݾ�, ���, �ּ�, �ִ�)
 select c.name, count(*), sum(o.saleprice), floor(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from customer c
    inner join orders o on c.custid = o.custid
 group by c.name
 having max(o.saleprice) >= 20000 --�׷��� ����� ���ϰ� 2���� �̻� ������ ��� ã�� 
 ;
--------------
--where���� ���Ǵ� ã�� ����(���̺� ������ ����)
-----having������ ���Ǵ� ������ �׷��� �� ������ �������� �˻��Ѵ� 
----(������� �ٸ��� ó���ǹǷ� ã�� �����Ͱ� �������� ��Ȯ�� �Ǵ��ϰ� ����� ��)
select c.name, count(*), sum(o.saleprice), floor(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from customer c
    inner join orders o 
    on c.custid = o.custid
 where o.saleprice >= 20000 --2�����̻��� å ���Գ����� ������� 
 group by c.name
 ;
--(�ǽ�)
--=========================================
--�ʿ�� group by ~ having ������ ����ؼ� ó�� 
--1.���� �ֹ��� ������ �� �ǸŰǼ�, �Ǹž�, ��հ�, ������, �ְ� ���ϱ� 
--2.������ �ֹ��� ������ �� ���� , ���Ǹž� ���ϱ� 
--3.���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻� (å���� Ȯ���ϰ� �ʹ� �ϸ� �׷���)
--4.������ �ֹ��� ��� ������ ���Ǹž��� ���ϰ� , �������� ���� 
--5.������ �ֹ��� �Ǽ�, �հ�ݾ� , ��ձݾ��� ���ϰ� (3�Ǻ��� ���� ������ ��� �˻�)
--(����) ���� �ѱǵ� ���� ���� ����� ����?
--=========================================

--1.���� �ֹ��� ������ �� �ǸŰǼ�, �Ǹž�, ��հ�, ������, �ְ� ���ϱ� 
select count(*) as total_count
    , sum(o.saleprice)as "�Ǹž� �հ�" --�ѱ� ����� �� ������ �����������!
    , trunc(avg(o.saleprice)) as ��հ�_avg
    , min(o.saleprice) as ������_min
    , max(o.saleprice) as "�ְ�(max)"--�����̽��� Ư�����ڸ� ������ ""�� ����ȴ�
 from orders o
    inner join customer c on o.custid = c.custid
;
--����Ŭ
select count(*), sum(o.saleprice), trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
  from orders o, customer c
where o.custid = c.custid
;

--2.������ �ֹ��� ������ �� ���� , ���Ǹž� ���ϱ� 
select c.name, count(*), sum(o.saleprice), trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
 group by c.name
 ;
--����Ŭ
select c.name, count(*), sum(o.saleprice)as sum_price, trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o, customer c
    where o.custid = c.custid
group by c.name
--order by sum(o.saleprice)--����� �׷��Լ��� ����
--order by 3--�÷� ��ġ������ ����
order by sum_price--��Ī(alias)���� ����
;

--3.���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻� (å����)
select c.name, b.bookname, o.saleprice
  from orders o
    inner join customer c on c.custid = o.custid
    inner join book b on o.bookid = b.bookid
 ;   
--����Ŭ��� 
select c.name, b.bookname, o.saleprice
 from book b, orders o, customer c
    where b.bookid = o.bookid and o.custid = c.custid
;

--4.������ �ֹ��� ��� ������ ���Ǹž��� ���ϰ� , �������� ���� 
select c.name, sum(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
 group by c.name
 order by c.name
;    
--����Ŭ 
select c.name, sum(o.saleprice)
 from orders o, customer c
    where o.custid = c.custid
group by c.name
order by c.name
;

--5.������ �ֹ��� �Ǽ�, �հ�ݾ� , ��ձݾ��� ���ϰ� (3�Ǻ��� ���� ������ ��� �˻�)
select c.name, count(*), sum(o.saleprice), floor(avg(o.saleprice))
 from orders o
    inner join customer c on o.custid = c.custid
 group by c.name
 having count(*) < 3
;
--
select c.name, count(*), sum(o.saleprice), trunc(avg(o.saleprice))
 from orders o, customer c
    where o.custid = c.custid
group by c.name
having count(*) <3
;
--(����) ���� �ѱǵ� ���� ���� ����� ����?
select*from orders,customer;
select *
 from customer c 
    inner join orders o on c.custid = o.custid(+)
  WHERE O.CUSTID IS NULL
;
    





















 
 
 
 
 
 
 
 