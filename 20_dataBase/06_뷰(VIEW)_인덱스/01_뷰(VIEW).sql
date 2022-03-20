/* ************************
뷰(VIEW) : 하나 또는 둘 이상의 테이블로 부터
   데이터의 부분집합을 테이블인 것처럼 사용하는 객체(가상테이블)
--뷰(VIEW) 생성문
CREATE [OR REPLACE] VIEW 뷰이름 [(컬럼별칭1, 컬럼별칭2, ..., 컬럼별칭n)]
AS
SELECT 문장
[옵션];

--읽기전용 옵션 : WITH READ ONLY

--뷰(VIEW) 삭제
DROP VIEW 뷰이름;
***************************/
--컬럼별칭을 쓰지 않으면 그대로 옮겨간다 
select * from book where bookname like '%축구%';
-------  뷰(view) 만들기 --------
create view vw_book
as
select * from book where bookname like '%축구%'
with read only;--읽기전용 

--뷰 사용해서 데이터 검색 
select * from (select * from book where bookname like '%축구%');
select * from vw_book;
select * from vw_book where publisher = '굿스포츠';

-----------------------
--뷰(view)생성 - 컬럼별칭(alias)사용 
create view vw_book2 
    (bid, bname, pub, price)
as
select * from book where bookname like '%축구%'
with read only
;
select * from vw_book2;
select * from vw_book2 where pub = '굿스포츠';
drop view vw_book3;
------------------------
--id빼고 뷰만들기 
create view vw_book3
    (bname, pub, price)
as
select bookname, publisher, price from book where bookname like '%축구%'
with read only
;
select * from vw_book3;
------------------------
--다른테이블에 있는 데이터를 쓰려고 매번 조인(join)했지만 조인한 테이블들을 뷰로 가상의 테이블로 만들어서 쓰면 편리하게 사용할 수 있다.
-- or replace는 뷰를 수정 
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

--(뷰사용) 박지성, 김연아가 구입한 책제목 , 구입금액, 구입 날짜 
select bookname, price, orderdate
 from vw_orders
 where name in ('박지성', '김연아')
 ;
-- 뷰 삭제 
drop view vw_orders;

--============================
--(실습) 뷰를 생성, 조회, 삭제
--1. 뷰생성 - 뷰명칭 : VW_ORD_ALL
---- 주문(판매)정보, 책정보, 고객정보 모두 조회할 수 있는 형태 뷰 
--2. 이상미디어에서 출판한 책중 판매된 책제목, 판매금액, 판매일 조회
--3. 이상미디어에서 출판한 책 중에서 추신수, 장미란이 구매한 책 정보 조회
---- 출력항목 : 구입한 사람이름, 책제목, 출판사, 원가(정가), 판매가, 판매일자
---- 정렬 : 구입한 사람이름, 구입일자 최근순
--4. 판매된 책에 대하여 구매자별 건수, 합계금액, 평균금액, 최고가, 최저가 조회
--(최종) 뷰삭제 : VW_ORD_ALL 삭제 처리
--================================
--1. 뷰생성 - 뷰명칭 : VW_ORD_ALL
---- 주문(판매)정보, 책정보, 고객정보 모두 조회할 수 있는 형태 뷰 
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

--2. 이상미디어에서 출판한 책중 판매된 책제목, 판매금액, 판매일 조회
select bookname, price, orderdate
 from vw_ord_all
where publisher = '이상미디어'
;
--3. 이상미디어에서 출판한 책 중에서 추신수, 장미란이 구매한 책 정보 조회
---- 출력항목 : 구입한 사람이름, 책제목, 출판사, 원가(정가), 판매가, 판매일자
---- 정렬 : 구입한 사람이름, 구입일자 최근순
select name, bookname,publisher,price,saleprice,orderdate
 from vw_ord_all
where publisher = '이상미디어'
  and name in ('추신수', '장미란')
order by name, orderdate desc
;

--4. 판매된 책에 대하여 구매자별 건수, 합계금액, 평균금액, 최고가, 최저가 조회
select name,count(*),sum(saleprice),floor(avg(saleprice)),max(saleprice),min(saleprice)
 from vw_ord_all
group by name
;

--(최종) 뷰삭제 : VW_ORD_ALL 삭제 처리
drop view vw_ord_all;

--========================================================================
--force : select 문의 테이블이 없어도 뷰(view)를 강제로 생성 
create or replace force view vw_aaa
as
select id, name, phone from aaa; --- aaa테이블이 없을때 :경고: 컴파일 오류와 함께 뷰가 생성되었습니다.






















