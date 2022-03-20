--서브쿼리 (부속질의 , sub query)
--sql(select, insert, update, delete)내에 있는 쿼리문 
-----------------------------------------------------
--박지성이 구입한 내역을 검색 
select custid from customer where name = '박지성'; --custid :1
select *from orders where custid = 1;

--서브쿼리 사용 
select * from orders
 where custid = (select custid from customer where name = '박지성')--하나이상이면 in 또는 not in으로 사용 
 ;

--join문으로 처리 
 select *
  from orders o
    inner join customer c on o.custid = c.custid
 where c.name = '박지성'
 ;
 -----------------------------------------------------
 --where 절에서 서브쿼리 사용시 조회결과가 2건 이상인 경우 in사용 
 --박지선, 김연아 구입내역 (서브쿼리)
 select * from orders
 where custid  in (select custid from customer where name in ('박지성', '김연아'))--하나이상이면 in 또는 not in으로 사용 
 ;
 --------------------------------
 --책 중 정가가 가장 비싼 도서의 이름을 구하시오 
 select max(price) from book; --가장비싼책의 가격 
 select * from book where price = 35000;
 select * from book where price = (select max(price) from book );
 
 --------------------------------
 --서브쿼리를 from 절에 사용하는 경우 
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
--(실습)출판된 책의 평균금액 이상인 도서목록(from절 서브쿼리 사용 )
select * 
 from book b
    inner join (select floor(avg(price)) avg_price from book) a
    on b.price >= a.avg_price
 ;
--(실습) 박지성, 김연아 구입내역 (서브쿼리 - from절)
select * 
 from orders o 
    inner join (select * from customer where name in('박지성','김연아')) c
    on o.custid = c.custid
;
--서브쿼리 없이 구하기 
select *
 from orders o
    inner join customer c on o.custid = c.custid
where name in( '김연아','박지성')
;

----------------------
--select 절에 서브쿼리 사용 예 
select o.orderid, o.custid, o.bookid,
    (select name from customer where custid = o.custid) custname,
    (select bookname from book where bookid = o.bookid) bookname,
    o.saleprice, o.orderdate
 from orders o
;
-- customer와 book, orders에 있는 컬럼들 조회 
------------------------
--서브쿼리 속의 서브쿼리
--박지성이 구매한 책 목록 (책제목)
select *
 from book
    where bookid in(select bookid from orders where custid in
                   (select custid from customer where name = '박지성'))
;

-------------------------
--(실습) 서브쿼리, 조인문 둘다 써보기 오라클 버전 조인문도 써보자 
--1.한 번이라도 구매한 내역이 있는 사람
--join 
select * 
 from customer c inner join orders o on c.custid = o.custid ;

select * 
 from customer c, orders o where c.custid = o.custid;
 
--sub query
select * 
 from customer c inner join (select custid from orders) o on c.custid = o.custid ;

-----(또는 한 번도 구매하지 않은 사람)
--outer join 
select * 
  from customer c left join orders o on c.custid = o.custid
where o.custid is null;
--sub query 
select * 
 from customer 
where custid not in(select c.custid from orders o , customer c where c.custid = o.custid);

--2. 20000원 이상되는 책을 구입한 고객 명단 조회
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

--3. '대한미디어' 출판사의 책을 구매한 고객이름 조회 
--subquery
select * 
 from customer c
  inner join (select custid from orders where bookid 
                in (select bookid from book where publisher = '대한미디어')) b
    on c.custid = b.custid
;
--join
select c.name, b.bookname, o.saleprice 
 from customer c, orders o, book b
where c.custid = o.custid and o.bookid = b.bookid
and b.publisher = '대한미디어'
;
--4. 전체 책가격 평균보다 비싼 책의 목록 조회 
--sub query ,join
select *
from book b inner join (select round(avg(price)) avg_price from book ) avg
 on b.price > avg.avg_price
;
--상관서브쿼리 
select bookname, price, publisher,(select round(avg(price)) avg_price from book) avg
 from book b
where b.price > (select round(avg(price)) avg_price from book)
;






 
 
 
 
 
 
 
 
 
 
 
 
 