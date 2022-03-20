/********** 트리거(TRIGGER) ******************
트리거(TRIGGER) : 특정 이벤트나 DDL, DML 문장이 실행되었을 때,
   자동적으로 어떤 일련의 동작(Operation)이나 처리를 수행하도록 하는
   데이타베이스 객체의 하나
  -일반적으로 임의의 테이블에 데이타를 추가(NSERT), 삭제(DELETE), 수정(UPDATE) 할 때,
    다른 연관 관계에 있는 테이블의 데이타를 자동적으로 조작할 경우에 사용

CREATE [OR REPLACE] TRIGGER 트리거명
  BEFORE [OR AFTER]
  UPDATE [OR DELETE OR INSERT] ON 테이블명
  [FOR EACH ROW] -- 건by건으로 트리거 실행 
DECLARE
  변수선언부;
BEGIN
  프로그램 로직 구현부;
END;  
-------------------------------
<트리거 적용시기 지정>
BEFORE : 데이터 처리가 수행되기 전 수행(INSERT, UPDATE, DELETE 문 실행전)
AFTER : 데이터 처리가 수행된 후 수행(INSERT, UPDATE, DELETE 문 실행후)

이벤트 형태 지정 : INSERT, UPDATE, DELETE
이벤트 발생 테이블 지정 : ON 테이블명

<처리형태 지정>
FOR EACH ROW : 데이타 처리시 건건이 트리거 실행. 이 옵션이 없으면 
  기본값인 문장 레벨 트리거로 실행되며 수행전, 후에 한번씩만 트리거 실행

DECLARE : 변수 선언 시 사용 키워드
--------------------
<컬럼값 사용>
:OLD.컬럼명 : SQL 반영 전의 컬럼 데이타를 의미
:NEW.컬럼명 : SQL 반영 후의 컬럼 데이타를 의미
:old        :new
 x  insert   o
 o  update   o
 o  delete   x
---------------------
<트리거 삭제, 활성, 비활성>
- 삭제 : DROP TRIGGER 트리거명;
- 활성 : ALTER TRIGGER 트리거명 enable;
- 비활성 : ALTER TRIGGER 트리거명 disable;
*****************************************/
--book 테이블에 대한 로그(log 이력)을 남길 테이블 작성 
create table book_log (
    bookid number(5),
    bookname varchar2(200),--전과 후 의 로그를 남길거다 
    publisher varchar2(200),--전과 후 의 로그를 남길거다 
    price varchar2(50),
    logdate date default sysdate,
    job_gubun varchar2(10)
);

----------
--트리거 작성
--book테이블에 데이터 입력(insert)되면 book_log테이블에 이력 남기기 
--트리거명 : after_insert_book
create or replace trigger after_insert_book
    after insert on book
    for each row -- insert될때마다 (건by건)
declare
begin
    -- 입력에 대한 이력남기기
    insert into book_log
            (bookid, bookname, publisher, price, logdate, job_gubun)
        values(:new.bookid, :new.bookname, :new.publisher, 
                :new.price, sysdate, 'insert');
end;
---------------------
--insert 트리거 동작여부 확인 BOOK
select * from book order by bookid desc;
select * from book_log;

insert into book values (30,'데이터베이스의 이해','itbook',25000);

rollback;-- 입력작업취소 
commit; -- 입력작업확정

insert into book values (31,'데이터베이스의 이해2','itbook',30000);

--=============================================================
--update 트리거 작성 : after_update_book
CREATE OR REPLACE TRIGGER AFTER_UPDATE_BOOK 
    AFTER UPDATE /*OF 컬럼 : 컬럼별로 알고싶을때 */ ON BOOK 
    for each row
    
BEGIN
    -- 로그 남기기 
    insert into book_log
                (bookid, bookname, publisher, price, job_gubun)
            values (:old.bookid,
                    :old.bookname||'->'||:new.bookname,
                    :old.publisher||'->'||:new.publisher,
                    :old.price||'->'||:new.price,
                    'update');
END;
---------------------
--update 트리거 동작 테스트 
select * from book order by bookid desc;
select * from book_log;

update book 
   set bookname = '오라클 데이터베이스의 이해2',
        price = 32000
 where bookid = 31;
-----------------------
--========================================================
--delete 트리거 작성하고 동작테스트 진행 
--트리거 명 : after_delete_book 
--동작은 book 테이블 데이터 삭제되면 book_log테이블에 이력 남기기 
------------------------------------
create or replace trigger after_delete_book
    after delete on book
    for each row
begin
    -- 삭제 로그 남기기 
    insert into book_log 
                (bookid, bookname, publisher, price, logdate, job_gubun)
        values (:old.bookid,
                :old.bookname,
                :old.publisher,
                :old.price,
                sysdate, 'delete');
end;
--------------------------
--delete 트리거 동작 테스트 
select * from book order by bookid desc;
select * from book_log;

delete from book where bookid = 31;
delete from book where bookid > 10;
rollback;
commit;

--=========================================================
--INSERT, UPDATE, DELETE 다 되는 트리거 
create or replace trigger trigger_book_iud
        after insert or update or delete on book 
        for each row
begin
      -- insert 이벤트 발생 시 로그 남기기
      if inserting then 
      insert into book_log(bookid,bookname,publisher,price,logdate,job_gubun)
            values (:new.bookid,:new.bookname,:new.publisher,:new.price, sysdate, 'insert');
      end if;     
      -- update 이벤트 발생 시 로그 남기기
      if updating then
      insert into book_log
                (bookid, bookname, publisher, price, job_gubun)
            values (:old.bookid,
                    :old.bookname||'->'||:new.bookname,
                    :old.publisher||'->'||:new.publisher,
                    :old.price||'->'||:new.price,
                    'update');
      end if;      
      -- delete 이벤트 발생 시 로그 남기기
      if deleting then
      insert into book_log 
                (bookid, bookname, publisher, price, logdate, job_gubun)
        values (:old.bookid,
                :old.bookname,
                :old.publisher,
                :old.price,
                sysdate, 'delete');
      end if;
end;
------------------------
--만들어둔 트리거 비활성화 
alter trigger "MADANG"."AFTER_INSERT_BOOK" disable;
alter trigger "MADANG"."AFTER_UPDATE_BOOK" disable;
alter trigger "MADANG"."AFTER_DELETE_BOOK" disable;
ALTER TRIGGER AFTER_INSERT_BOOK DISABLE;
ALTER TRIGGER AFTER_UPDATE_BOOK DISABLE;
ALTER TRIGGER AFTER_DELETE_BOOK DISABLE;

select * from book order by bookid desc;
select * from book_log; --로그테이블 모두 지워줬다 

insert into book values (30,'데이터베이스의 이해','itbook',25000);
insert into book values (31,'데이터베이스의 이해2','itbook',30000);

update book 
   set bookname = '오라클 데이터베이스의 이해2',
        price = 32000
 where bookid = 31;

delete from book where bookid = 31;
delete from book where bookid > 10;

COMMIT;

