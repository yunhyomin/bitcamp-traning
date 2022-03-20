--insert, update, delete
/************************
   <insert 문>
insert into 테이블명 
        (컬럼명1, 컬럼명2, ....,컬럼명n)
values (값1, 값2, ....,값n)
;

   <update 문>
update 테이블명 
    set 컬럼명1 = 값1, 
        컬럼명2 =값2, 
        ...,
        컬럼명n = 값n
where 대상조건
;
    <delete 문> 
delete from 테이블명 
where 대상조건문 
;
**************************/
select *from book;
insert into book 
        (bookid, bookname, publisher, price)
values( 30, '자바란 무엇인가', 'itbook', 30000);
commit;
insert into book 
        (bookid, publisher,bookname,  price)
values( 31, 'itbook','자바란 무엇인가2',  35000);
rollback;-- 커밋후에 한 처리들을 되돌린다 
commit;
/* insert : 컬럼명을 나열하지 않고 입력 
-----테이블에 작성된 컬럼의 값을 모두 작성(누락시 오류)
-----테이블에 작성된 컬럼의 순서에 따라 데이터 입력하지 않는경우 
        (입력성공) 논리적 오류 : 잘못된 위치에 데이터 입력됨 
        (입력실패) 데이터타입 불일치, 데이터 크기 불일치 등 
*******************************/
insert into book 
values( 32, '자바란 무엇인가3', 'itbook', 37000);
commit;
insert into book 
values( 33, '자바란 무엇인가4', '', 38000); 
insert into book 
values( 34, 'itbook', '자바란 무엇인가5',38000);
----------
insert into book 
        (bookid, publisher, bookname, price)
values( 35, 'itbook','자바란 무엇인가6',  38000);

insert into book 
        (bookid, publisher, bookname)
values( 36, 'itbook','자바란 무엇인가7' );

commit;
select * from book order by bookid desc;
----------------------------------------
--일괄입력 : 테이블데이터를 이용해서 여러 데이터를 한번에 입력처리 
---- imported_book ---->book : 일괄입력
insert into book
select bookid, bookname, publisher, price 
 from imported_book
;
--==========================================
/********************
 <update 문>
update 테이블명 
    set 컬럼명1 = 값1, 
        컬럼명2 =값2, 
        ...,
        컬럼명n = 값n
where 대상조건
;
*********************/
select * from customer;
--박세리 주소 수정 : 대한민국 대전-> 대한민국 부산 
update customer
    set address = '대한민국 부산'
where name = '박세리'
;
commit;
--박세리 주소, 전화번호 수정  : '대한민국 대전','010-1111-1111'
update customer
    set address = '대한민국 대전',
        phone = '010-1111-1111'
where name ='박세리'
;
select *from customer where name = '박세리';
commit;
----------------------------------
-- 박세리 주소 수정 : 김연아의 주소와 동일하게 변경 
----update문에 서브쿼리 형식으로 사용시 수정할 데이터 찾아 적용 
----서브쿼리 결과값이 1개이하여야 함(2개이상인 경우 오류발생)
update customer
 set address = (select address from customer where name ='김연아')
 where name = '박세리'
;
--서브쿼리의 데이터가 없으면 null로 수정된다 
update customer c
 set address = (select address from customer where custid =(select custid from customer where c.name ='김연아'))
 where name = '박세리'
;
commit;
----------------------------------
--박세리의 주소, 전화번호 수정 : 추신수와 동일하게 
update customer 
    set address = (select address from customer where name = '추신수'),
        phone = (select phone from customer where name = '추신수')
    where name ='박세리'
;
commit;
--================================
/***********************
 <delete 문> 
delete from 테이블명 
where 대상조건문 
;
************************/
select * from test_like;
--delete from test_like where name = '홍길동'; 실행하고 나면 주석처리하는 것이 좋다 
--delete from test_like where name like 홍길동;

--delete from test_like where name like '홍길동%';
select * from test_like;
commit;

---------------------
select * from book;
--책제목이 자바로 시작하고 출판사가 itbook인 데이터 삭제 
--select *from 
delete 
 from book
where bookname like '자바%' and publisher = 'itbook';
--잘못삭제했다하면 
--rollback;
--맞게 잘처리했다하면 
--commit;
--------------------
select * 
--delete
 from book
where bookid >= 30
 ;








