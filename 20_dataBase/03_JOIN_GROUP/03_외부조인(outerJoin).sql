--(����) ���� �ѱǵ� ���Ծ��� ����� ����?
-------custimer���̺��� �ְ�, orders���̺��� ���� ��� 
----------------
--(���1) �������� (sub query)
select name
  from customer
 where custid not in(select distinct custid from orders) --1,2,3,4
;
--(���2) minus : ������ ó�� 
select custid from customer --1,2,3,4,5
minus
select custid from orders; --1,1,2,3,4,1,....
-----------------------------
--(���3) �ܺ����� (outer join)S
--��������(inner join) - ��������(�����ϰ� �ִ�)
select distinct c.custid, c.name
 from customer c, orders o
  where c.custid = o.custid --��������(��������)
;

--�ܺ�����(��������)  (+)_�� ����ϸ� ���� ���� ������� ���� +�� ������ �ȴ� !!!
select c.* 
 from customer c
    inner join orders o on c.custid = o.custid(+) --��������(��������)
 where o.orderid is null
 ;
 --���Ը� �س��� ���ž��� �����鿡�� �����ְڴ� !!
------------------------------
-- �ܺ�����(�������� : left outer join / �������� : rigth outer join /full outer join)
------��������--!!!!�����Ҷ��� ��������!!!!
select *
 from customer c 
    left outer join orders o on c.custid = o.custid
 where o.orderid is null
 ;
------��������
select *
 from orders o
    right outer join customer c on  c.custid = o.custid
 where o.orderid is NULL
 ;
------------------------------
--
--����Ŭ����
--------------�ܺ�����(+)
----��������
select *
 from customer c, orders o
    where c.custid = o.custid(+)
    and orderid is null --orderid�� null�� (�ѹ��� å�� ���� ����)����Ÿ� ������
; 
----��������
select *
 from orders o,customer c
    where o.custid(+) = c.custid
 and o.orderid is null
 ;
 
------------------------------    
--���� (join , inner join) : �������̺� ��ο� �����ϴ� ������ �˻� 
--�ܺ����� : ������� ���̺� �����Ͱ� �������� �ʴ� ������ �˻� 
-----------��絥���� ǥ���ϰ�, ��ġ���� �ʴ� ������ ã���� ��� 
------------------------------

create table dept(
    id varchar2(10) primary key,
    name varchar2(30)
);
insert into dept values('10','�ѹ���');
insert into dept values('20','�޿���');
insert into dept values('30','it�� ');
------------
create table dept_1(
    id varchar2(10) primary key,
    name varchar2(30)
);
insert into dept_1 values('10','�ѹ���');
insert into dept_1 values('20','�޿���');

commit;
------------
create table dept_2(
    id varchar2(10) primary key,
    name varchar2(30)
);
insert into dept_2 values('10','�ѹ���');
insert into dept_2 values('30','it�� ');
commit;
---------------------------
select * from dept;
select * from dept_1;
select * from dept_2;

-------
---dept = dept_1
select *
from dept d, dept_1 d1
 where d.id = d1.id
 ;

----dopt = dept_2
select * 
 from dept d, dept_2 d2
  where d.id = d2.id
;

-----------------------------------------------------
--dept���� �ְ� , dept_1���� ���� ������(�μ�)��ȸ 
--===================================================
--left outer join : �������̺� ���� 
------��ü������ ǥ���ϰ� ������ ������ nullǥ�� 
select *
 from dept d
    inner join dept_1 d1 on d.id = d1.id(+) --��������(�������̺� ����)
;
select *
 from dept d
  left outer join dept_1 d1 on d.id = d1.id
where d1.id is null
;
--����Ŭ
select *
 from dept d , dept_1 d1
    where d.id = d1.id(+) --���ι��(�������� �ܺ�����)
 and d1.id is null
;
---------------
--right outer join : ���� ���̺� ����
select *
 from dept_1 d1
    inner join dept d on d1.id(+) = d.id
 where d1.id is null
;
--����Ŭ 
select *
 from dept_1 d1 , dept d
  where d1.id(+) = d.id
and d1.id is null
;

select * 
 from dept_1 d1
  right join dept d on d.id = d1.id
where d1.id is null
;
  
--==========================================================

--(�ǽ�)
--1.dept_1���� �ְ� , dept_2���� ���� ������ ã�� (left)
--2.dept_2���� �ְ� , dept_1���� ���� ������ ã�� (right)
----------------------------------------------------
--1.dept_1���� �ְ� , dept_2���� ���� ������ ã�� (left)
---------(+)��� 
select *
 from dept_1 d1
    inner join dept_2 d2 on d1.id = d2.id(+)
 where d2.id is null
;
---����Ŭ
select *
 from dept_1 d1, dept_2 d2 where d1.id = d2.id(+)
 and d2.id is null
 ;
---------left outer join
select * 
 from dept_1 d1
    left outer join dept_2 d2 on d1.id = d2.id
 where d2.id is null
;
--2.dept_2���� �ְ� , dept_1���� ���� ������ ã�� (right)
---------(+)��� 
select *
 from dept_1 d1
    inner join dept_2 d2 on d1.id(+) = d2.id
 where d1.id is null
;
--����Ŭ
select *
 from dept_1 d1, dept_2 d2 where d1.id(+) = d2.id
 and d1.id is null
;
-----------------------
select * 
 from dept_1 d1
    right outer join dept_2 d2 on d1.id = d2.id
 where d1.id is null
;

--=======================================
--full outer join : (+)����� �ȵȴ� full (outer) join ���
select *
 from dept_1 d1 
    full outer join dept_2 d2 on d1.id = d2.id
 where d1.id is null --�������� ������ 
 --where d2.id is null   --�������� ������ 
;



















