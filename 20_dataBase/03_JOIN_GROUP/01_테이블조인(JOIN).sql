--박지성 고객ID
SELECT CUSTID FROM CUSTOMER WHERE NAME ='박지성'; --CUSTID : 1
--박지성이 구매한 책의 합계금액 
SELECT * FROM ORDERS WHERE CUSTID ='1';
SELECT SUM(SALEPRICE)
 FROM ORDERS 
WHERE CUSTID = '1'
 ;
--서브쿼리(SUB QUERY) 방식 
SELECT SUM(SALEPRICE) FROM ORDERS
 WHERE CUSTID = (SELECT CUSTID FROM  CUSTOMER WHERE NAME ='박지성')
 ;
 --==========================================
 --테이블 조인(JOIN)방식 
SELECT * FROM CUSTOMER WHERE CUSTID =1;
SELECT * FROM ORDERS WHERE CUSTID =1;

--CUSTOMER, ORDERS 테이블 데이터 동시 조회 
SELECT *
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID
AND NAME = '박지성'
;
---------------------------------------
--테이블에 대한 별칭 사용으로 간단하게 표시하고 사용 
SELECT *
 FROM CUSTOMER C, ORDERS O  --테이블에 대한 별칭 사용
    WHERE C.CUSTID = O.CUSTID  --조인조건 : 이후부터는 별칭을 사용해야한다!
AND C.NAME = '박지성' --검색조건 : NAME은 유니크 하기때문에 별칭을 안써도 되지만 써주는것이 좋다!!!!
;
---------ANSI 표준 조인 쿼리 
SELECT * 
 FROM CUSTOMER C 
    INNER JOIN ORDERS O
    ON C.CUSTID = O.CUSTID --조인조건 
WHERE C.NAME = '박지성' --검색조건
;
----------------
--박지성이 구입한 합계금액 
SELECT SUM(O.SAILPRICE)
--SELECT *
 FROM CUSTOMER C, ORDERS O --조인할 테이블 
    WHERE C.CUSTID = O.CUSTID --조인조건 
AND C.NAME = '박지성' --검색조건 
;

-----------------
SELECT * FROM BOOK;
SELECT * FROM ORDERS;
--출판한 책중 판매된 책 목록 (미디어로 끝나는 출판사만)
SELECT *
FROM BOOK B, ORDERS O
    WHERE B.BOOKID = O.BOOKID --유의미한 데이터를 만드는 조인조건 
AND B.PUBLISHER LIKE '%미디어' --검색조건 
ORDER BY B.PUBLISHER,B.BOOKNAME
;

------------------
--표준조인 쿼리로 작성 해보자!!
Select * 
 From Book B
    Inner Join Orders O
    On B.Bookid = O.Bookid
Where B.Publisher Like '%미디어'
Order By B.Publisher, B.Bookname
;
------------------

--==========================
--(실습) 테이블을 조인해서 요청데이터 찾기 
--1.'야구를 부탁해' 라는 책이 팔린내역 확인 (책제목, 판매금액, 판매일자)
SELECT * FROM BOOK, ORDERS;
SELECT B.BOOKNAME, o.salePRICE, O.ORDERDATE
    FROM BOOK B 
    INNER JOIN ORDERS O
    ON B.BOOKID = O.BOOKID
WHERE B.BOOKNAME = '야구를 부탁해'
;
--2.'야구를 부탁해' 라는 책이 몇권이 팔렸는지 확인
SELECT * FROM BOOK, ORDERS;
SELECT  '야구를 부탁해 판매건수 ',COUNT(*)
    FROM BOOK B
    INNER JOIN ORDERS O
    ON B.BOOKID = O.BOOKID
WHERE BOOKNAME = '야구를 부탁해'
;
--3. '추신수'가 구입한 책값과 구입일자 (책값, 구입일자, 책제목도  )
select * from book, customer, orders;
select '추신수가 구입한 내역' , b.bookname, o.saleprice, o.orderdate
 from book b ,customer c, orders o
  where c.custid = o.custid and o.bookid = b.bookid
 and c.name = '추신수'
 ;
--4. '추신수'가 구입한 합계금액 
select '추신수가 구입한 금액',sum(o.saleprice)
 from book b, customer c ,orders o
    where b.bookid = o.bookid 
and c.name = '추신수'
    ;
--5. 박지성 , 추신수가 구입한 내역을 확인 (이름, 판매금액, 판매일자)
select c.name, o.saleprice, o.orderdate
 from customer c
    inner join orders o
    on c.custid = o.custid
 where c.name in('박지성','추신수') --in은 or문 단순화 
 ;
 -----오라클 버전으로 join
 select c.name, o.saleprice, o.orderdate
  from customer c, orders o
    where c.custid = o.custid
and (c.name ='추신수' or c.name = '박지성') --or보다 and가 우선순위이기때문에 ()를 해줘야함 
;

--==========================
--3개 테이블 조인(결합)해서 데이터 조회(검색, 선택)
--고객명, 책제목, 출판사, 판매가격, 판매일자 
select  c.name, b.bookname, b.publisher, o.saleprice, o.orderdate 
  from orders o, book b, customer c
    where b.bookid = o.bookid --조인조건
    and o.custid = c.custid    --조인조건 
;
--ansi표준
select *
  from book b 
    inner join orders o  
        on b.bookid = o.bookid
    inner join customer c
        on o.custid = c.custid
;

--===================================
--(실습) book,customer, orders테이블 데이터를 조회 
--1. 장미란이 구입한 책제목, 구입가격, 구입일자, 출판사 
select c.name, o.saleprice, o.orderdate, b.publisher
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
where c.name = '장미란'
;
--2. 장미란이 구입한 책 중에 2014-01-01 ~ 2014-07-08까지 구입한 내역 
select orderdate, to_char(orderdate, 'yyyy-mm-dd hh:mi:ss') from orders; --시분초까지 확인해본다 
select * 
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
where c.name = '장미란'
 and o.orderdate between to_date('2014-01-01','yy-mm-dd') 
                     and to_date('2014-07-08','yy-mm-dd') --2014-07-08 00:00:00까지 
;
select * 
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
where c.name = '장미란'
  and o.orderdate >= to_date('2014-01-01','yy-mm-dd')
  and o.orderdate <= to_date('2014-07-09','yy-mm-dd') --2014-07-09 00:00:00까지 
;

--3.'야구를 부탁해'라는 책을 구입한 사람과 구입일자를 확인
select b.bookname, c.name, o.orderdate
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
 where b.bookname = '야구를 부탁해'
;
--4.추신수, 장미란이 구입한 책제목, 구입금액 , 구입일자 확인 
--------(정렬 : 고객명, 구입일자 순으로 )
select c.name, b.bookname, o.saleprice, o.orderdate
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
 where c.name in('장미란','추신수')
--order by c.name, o.orderdate
 order by 1,4 --이렇게 쓸 수있다 (select절의 위치 값)
;
--5.추신수가 구입한 책 갯수, 합계금액, 평균값, 가장 비싼책 금액, 가장 싼책 금액
select '추신수',count(*), sum(o.saleprice), avg(o.saleprice),max(o.saleprice), min(o.saleprice)
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
 where c.name = '추신수' --모든사람을 조회하려면 추신수를 빼면 된다 
;
---------각자 구입한 사람별로 조회 하고싶을때 
select c.name,count(*), sum(o.saleprice), round(avg(o.saleprice)),max(o.saleprice), min(o.saleprice)
 from book b
    inner join orders o on b.bookid = o.bookid
    inner join customer c on o.custid = c.custid
group by c.name --데이터를 그룹별로 조회 group by
;








