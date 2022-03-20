/*상호연관 서브쿼리( 상관서브쿼리)
-메인쿼리의 값을 서브쿼리가 사용하고, 서브쿼리의 결과값을 메인쿼리가 사용 
-메인쿼리와 서브쿼리가 서로 조인된 형태로 동작 
********************************/
--select 절에 사용된 서브쿼리 
select o.orderid, o.custid, o.bookid,
    (select name from customer where custid = o.custid) custname,
    (select bookname from book where bookid = o.bookid) bookname,
    o.saleprice, o.orderdate
 from orders o
;

select * from book 
order by publisher, price;
--굿스포츠 출판사 책 중에서 굿스포츠 출판사의 평균금액보다 비싼책 
select * from book where publisher = '굿스포츠';
select avg(price) from book where publisher = '굿스포츠';--7000

select * 
 from book 
where publisher = '굿스포츠' 
  and price >= (select avg(price) from book where publisher = '굿스포츠')
 ;
-----
--메인쿼리의 값을 서브쿼리가 사용하고, 서브쿼리의 결과값을 메인쿼리가 사용 
--메인쿼리와 서브쿼리가 서로 조인된 형태로 동작 

------출판사 별 평균 도서가격보다 비싼 책 목록을 구하시오 
select bookid, bookname, publisher, price,
        (select avg(price) avg_price from book where publisher =b.publisher) avg --출판사별 평균가 
    from book b
 where price > (select avg(price) from book where publisher =b.publisher)
;
--조인문( join문 )
--출판사 별 평균 도서 가격 
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
-- exists :존재여부 확인시 사용( 있으면 true)
-- not exists :존재하지 않으면 true
-------in 보다 효율적이다!
-- 책이름에 축구가 들어가는 책을 조회하시오
select *
 from book
where bookname like '%축구%'
;

select *
 from book
 where bookname in (select bookname from book where bookname like '%축구%')
 ;
                   
select *
 from book b
 where exists (select bookname from book where b.bookname like '%축구%')
 ;
                                       
 select *
 from book b
 where not exists (select bookname from book where b.bookname like '%축구%')
 ;           
--------------
--주문내역이 있는 고객의 이름과 전화번호를 찾으시오 
select * 
 from customer
 where custid in(select custid from orders)
 ;
--===>exists적용
select *
 from customer c 
 where exists (select* from orders where custid = c.custid) 
 ;
select *
 from customer c 
 where exists (select  c.name from customer where c.name = '김연아')
 ;










