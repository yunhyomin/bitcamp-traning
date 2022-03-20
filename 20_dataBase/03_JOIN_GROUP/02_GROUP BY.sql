/*****************************
select [* | distinct] {컬럼명, 컬럼명,...}
 from 테이블명 
 [where 조건절]
 [group by {컬럼명, ...}
    [having 조건] ] --group by 절에 대한 조선 
 [order by {컬럼명 [ascii | desc],...}] --ascii : 오름차순 (기본/ 생략가능)
                                       --desc :  내림차순 
------------------------------------------------
 group by  : 데이터를 그룹핑해서 처리할 경우 사용 
 group by 문을 사용할 때 select 항목에 사용할 수 있는것은 
    group by절에 사용된 컬럼 또는 그룹함수 (count,sum,avg,max,min)만 사용할 수 있다 
******************************/

--구매 고객별로 구매금액의 합계를 구하시오 
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
--누가 많이 샀는지 알고싶다 
select c.name ,sum(o.saleprice)
 from customer c
    inner join orders o
    on c.custid = o.custid
group by c.name
--order by sum(o.saleprice)
order by 2 desc--select 절의 2번째 항목으로 내림차순 정렬
; 

--------------------------------
--주문(판매) 테이블의 고객별 데이터 조회(건수, 합계금액, 평균, 최소, 최대 )
select c.name, count(*), sum(o.saleprice), trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
    where c.name in('박지성','추신수')
 group by c.name
 order by c.name
;
-----------------------
--(실습) 고객명 기준으로 고객별 데이터 조회 (건수, 합계금액, 평균, 최소, 최대 )
---추신수, 장미란 고객2명만 조회 
select c.name, count(*), sum(o.saleprice), floor(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
    where c.name in('추신수','장미란')
group by c.name
order by c.name
;

------------------------------------------------------------------------
--HAVING절 : GROUP BY 절에 의해서 만들어진 데이터에서 검색조건 부여 
--HAVING절은 단독으로 사용될 수 없고, 반드시 GROUP BY절과 함께 사용 
-------------------------------------------------------------------------
--3건이상 구매한 고객 조회 (고객명, 건수)
select c.name, count(*) as cnt
 from customer c
    inner join orders o on c.custid = o.custid
 group by c.name
having count(*) >= 3 --그룹핑된 데이터에서 원하는 데이터 검색 
;
------------------
--구매한 책중에서 20000원 이상인 책을 구입한 사람의 통계데이터 (건수, 합계금액, 평균, 최소, 최대)
 select c.name, count(*), sum(o.saleprice), floor(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from customer c
    inner join orders o on c.custid = o.custid
 group by c.name
 having max(o.saleprice) >= 20000 --그룹핑 결과를 구하고 2만원 이상 구입한 사람 찾기 
 ;
--------------
--where절에 사용되는 찾을 조건(테이블 데이터 기준)
-----having절에서 사용되는 조건은 그룹핑 된 데이터 기준으로 검색한다 
----(결과값이 다르게 처리되므로 찾을 데이터가 무엇인지 명확히 판단하고 사용할 것)
select c.name, count(*), sum(o.saleprice), floor(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from customer c
    inner join orders o 
    on c.custid = o.custid
 where o.saleprice >= 20000 --2만원이상인 책 구입내역을 대상으로 
 group by c.name
 ;
--(실습)
--=========================================
--필요시 group by ~ having 구문을 사용해서 처리 
--1.고객이 주문한 도서의 총 판매건수, 판매액, 평균값, 최저가, 최고가 구하기 
--2.고객별로 주문한 도서의 총 수량 , 총판매액 구하기 
--3.고객의 이름과 고객이 주문한 도서의 판매가격을 검색 (책제목도 확인하고 싶다 하면 그룹핑)
--4.고객별로 주문한 모든 도서의 총판매액을 구하고 , 고객명으로 정렬 
--5.고객별로 주문한 건수, 합계금액 , 평균금액을 구하고 (3권보다 적게 구입한 사람 검색)
--(번외) 고객중 한권도 구입 안한 사람은 누구?
--=========================================

--1.고객이 주문한 도서의 총 판매건수, 판매액, 평균값, 최저가, 최고가 구하기 
select count(*) as total_count
    , sum(o.saleprice)as "판매액 합계" --한글 사용할 수 있지만 사용하지말자!
    , trunc(avg(o.saleprice)) as 평균값_avg
    , min(o.saleprice) as 최저가_min
    , max(o.saleprice) as "최고가(max)"--스페이스와 특수문자를 쓰려면 ""을 쓰면된다
 from orders o
    inner join customer c on o.custid = c.custid
;
--오라클
select count(*), sum(o.saleprice), trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
  from orders o, customer c
where o.custid = c.custid
;

--2.고객별로 주문한 도서의 총 수량 , 총판매액 구하기 
select c.name, count(*), sum(o.saleprice), trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
 group by c.name
 ;
--오라클
select c.name, count(*), sum(o.saleprice)as sum_price, trunc(avg(o.saleprice)), min(o.saleprice), max(o.saleprice)
 from orders o, customer c
    where o.custid = c.custid
group by c.name
--order by sum(o.saleprice)--적용된 그룹함수로 정렬
--order by 3--컬럼 위치값으로 정렬
order by sum_price--별칭(alias)으로 정렬
;

--3.고객의 이름과 고객이 주문한 도서의 판매가격을 검색 (책제목도)
select c.name, b.bookname, o.saleprice
  from orders o
    inner join customer c on c.custid = o.custid
    inner join book b on o.bookid = b.bookid
 ;   
--오라클방식 
select c.name, b.bookname, o.saleprice
 from book b, orders o, customer c
    where b.bookid = o.bookid and o.custid = c.custid
;

--4.고객별로 주문한 모든 도서의 총판매액을 구하고 , 고객명으로 정렬 
select c.name, sum(o.saleprice)
 from orders o
    inner join customer c on o.custid = c.custid
 group by c.name
 order by c.name
;    
--오라클 
select c.name, sum(o.saleprice)
 from orders o, customer c
    where o.custid = c.custid
group by c.name
order by c.name
;

--5.고객별로 주문한 건수, 합계금액 , 평균금액을 구하고 (3권보다 적게 구입한 사람 검색)
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
--(번외) 고객중 한권도 구입 안한 사람은 누구?
select*from orders,customer;
select *
 from customer c 
    inner join orders o on c.custid = o.custid(+)
  WHERE O.CUSTID IS NULL
;
    





















 
 
 
 
 
 
 
 