--(번외) 고객중 한권도 구입안한 사람은 누구?
-------custimer테이블에는 있고, orders테이블에는 없는 사람 
----------------
--(방법1) 서브쿼리 (sub query)
select name
  from customer
 where custid not in(select distinct custid from orders) --1,2,3,4
;
--(방법2) minus : 차집합 처리 
select custid from customer --1,2,3,4,5
minus
select custid from orders; --1,1,2,3,4,1,....
-----------------------------
--(방법3) 외부조인 (outer join)S
--내부조인(inner join) - 동등조인(동일하게 있는)
select distinct c.custid, c.name
 from customer c, orders o
  where c.custid = o.custid --조인조건(동등조인)
;

--외부조인(좌측기준)  (+)_를 사용하면 적는 순서 상관없이 내가 +를 적으면 된다 !!!
select c.* 
 from customer c
    inner join orders o on c.custid = o.custid(+) --조인조건(좌측기준)
 where o.orderid is null
 ;
 --가입만 해놓고 구매안한 유저들에게 쓸수있겠다 !!
------------------------------
-- 외부조인(좌측기준 : left outer join / 우측기준 : rigth outer join /full outer join)
------좌측기준--!!!!조인할때의 순서기준!!!!
select *
 from customer c 
    left outer join orders o on c.custid = o.custid
 where o.orderid is null
 ;
------우측기준
select *
 from orders o
    right outer join customer c on  c.custid = o.custid
 where o.orderid is NULL
 ;
------------------------------
--
--오라클버전
--------------외부조인(+)
----우측기준
select *
 from customer c, orders o
    where c.custid = o.custid(+)
    and orderid is null --orderid가 null인 (한번도 책을 사지 않은)사람거만 보여줘
; 
----좌측기준
select *
 from orders o,customer c
    where o.custid(+) = c.custid
 and o.orderid is null
 ;
 
------------------------------    
--조인 (join , inner join) : 조인테이블 모두에 존재하는 데이터 검색 
--외부조인 : 어느한쪽 테이블에 데이터가 존재하지 않는 데이터 검색 
-----------모든데이터 표시하고, 일치하지 않는 데이터 찾을때 사용 
------------------------------

create table dept(
    id varchar2(10) primary key,
    name varchar2(30)
);
insert into dept values('10','총무부');
insert into dept values('20','급여부');
insert into dept values('30','it부 ');
------------
create table dept_1(
    id varchar2(10) primary key,
    name varchar2(30)
);
insert into dept_1 values('10','총무부');
insert into dept_1 values('20','급여부');

commit;
------------
create table dept_2(
    id varchar2(10) primary key,
    name varchar2(30)
);
insert into dept_2 values('10','총무부');
insert into dept_2 values('30','it부 ');
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
--dept에는 있고 , dept_1에는 없는 데이터(부서)조회 
--===================================================
--left outer join : 좌측테이블 기준 
------전체데이터 표시하고 우측에 없으면 null표시 
select *
 from dept d
    inner join dept_1 d1 on d.id = d1.id(+) --조인조건(좌측테이블 기준)
;
select *
 from dept d
  left outer join dept_1 d1 on d.id = d1.id
where d1.id is null
;
--오라클
select *
 from dept d , dept_1 d1
    where d.id = d1.id(+) --조인방식(좌측기준 외부조인)
 and d1.id is null
;
---------------
--right outer join : 우측 테이블 기준
select *
 from dept_1 d1
    inner join dept d on d1.id(+) = d.id
 where d1.id is null
;
--오라클 
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

--(실습)
--1.dept_1에는 있고 , dept_2에는 없는 데이터 찾기 (left)
--2.dept_2에는 있고 , dept_1에는 없는 데이터 찾기 (right)
----------------------------------------------------
--1.dept_1에는 있고 , dept_2에는 없는 데이터 찾기 (left)
---------(+)사용 
select *
 from dept_1 d1
    inner join dept_2 d2 on d1.id = d2.id(+)
 where d2.id is null
;
---오라클
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
--2.dept_2에는 있고 , dept_1에는 없는 데이터 찾기 (right)
---------(+)사용 
select *
 from dept_1 d1
    inner join dept_2 d2 on d1.id(+) = d2.id
 where d1.id is null
;
--오라클
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
--full outer join : (+)사용방식 안된다 full (outer) join 사용
select *
 from dept_1 d1 
    full outer join dept_2 d2 on d1.id = d2.id
 where d1.id is null --우측기준 데이터 
 --where d2.id is null   --좌측기준 데이터 
;



















