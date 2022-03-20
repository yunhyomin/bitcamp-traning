/********** Ʈ����(TRIGGER) ******************
Ʈ����(TRIGGER) : Ư�� �̺�Ʈ�� DDL, DML ������ ����Ǿ��� ��,
   �ڵ������� � �Ϸ��� ����(Operation)�̳� ó���� �����ϵ��� �ϴ�
   ����Ÿ���̽� ��ü�� �ϳ�
  -�Ϲ������� ������ ���̺� ����Ÿ�� �߰�(NSERT), ����(DELETE), ����(UPDATE) �� ��,
    �ٸ� ���� ���迡 �ִ� ���̺��� ����Ÿ�� �ڵ������� ������ ��쿡 ���

CREATE [OR REPLACE] TRIGGER Ʈ���Ÿ�
  BEFORE [OR AFTER]
  UPDATE [OR DELETE OR INSERT] ON ���̺��
  [FOR EACH ROW] -- ��by������ Ʈ���� ���� 
DECLARE
  ���������;
BEGIN
  ���α׷� ���� ������;
END;  
-------------------------------
<Ʈ���� ����ñ� ����>
BEFORE : ������ ó���� ����Ǳ� �� ����(INSERT, UPDATE, DELETE �� ������)
AFTER : ������ ó���� ����� �� ����(INSERT, UPDATE, DELETE �� ������)

�̺�Ʈ ���� ���� : INSERT, UPDATE, DELETE
�̺�Ʈ �߻� ���̺� ���� : ON ���̺��

<ó������ ����>
FOR EACH ROW : ����Ÿ ó���� �ǰ��� Ʈ���� ����. �� �ɼ��� ������ 
  �⺻���� ���� ���� Ʈ���ŷ� ����Ǹ� ������, �Ŀ� �ѹ����� Ʈ���� ����

DECLARE : ���� ���� �� ��� Ű����
--------------------
<�÷��� ���>
:OLD.�÷��� : SQL �ݿ� ���� �÷� ����Ÿ�� �ǹ�
:NEW.�÷��� : SQL �ݿ� ���� �÷� ����Ÿ�� �ǹ�
:old        :new
 x  insert   o
 o  update   o
 o  delete   x
---------------------
<Ʈ���� ����, Ȱ��, ��Ȱ��>
- ���� : DROP TRIGGER Ʈ���Ÿ�;
- Ȱ�� : ALTER TRIGGER Ʈ���Ÿ� enable;
- ��Ȱ�� : ALTER TRIGGER Ʈ���Ÿ� disable;
*****************************************/
--book ���̺� ���� �α�(log �̷�)�� ���� ���̺� �ۼ� 
create table book_log (
    bookid number(5),
    bookname varchar2(200),--���� �� �� �α׸� ����Ŵ� 
    publisher varchar2(200),--���� �� �� �α׸� ����Ŵ� 
    price varchar2(50),
    logdate date default sysdate,
    job_gubun varchar2(10)
);

----------
--Ʈ���� �ۼ�
--book���̺� ������ �Է�(insert)�Ǹ� book_log���̺� �̷� ����� 
--Ʈ���Ÿ� : after_insert_book
create or replace trigger after_insert_book
    after insert on book
    for each row -- insert�ɶ����� (��by��)
declare
begin
    -- �Է¿� ���� �̷³����
    insert into book_log
            (bookid, bookname, publisher, price, logdate, job_gubun)
        values(:new.bookid, :new.bookname, :new.publisher, 
                :new.price, sysdate, 'insert');
end;
---------------------
--insert Ʈ���� ���ۿ��� Ȯ�� BOOK
select * from book order by bookid desc;
select * from book_log;

insert into book values (30,'�����ͺ��̽��� ����','itbook',25000);

rollback;-- �Է��۾���� 
commit; -- �Է��۾�Ȯ��

insert into book values (31,'�����ͺ��̽��� ����2','itbook',30000);

--=============================================================
--update Ʈ���� �ۼ� : after_update_book
CREATE OR REPLACE TRIGGER AFTER_UPDATE_BOOK 
    AFTER UPDATE /*OF �÷� : �÷����� �˰������ */ ON BOOK 
    for each row
    
BEGIN
    -- �α� ����� 
    insert into book_log
                (bookid, bookname, publisher, price, job_gubun)
            values (:old.bookid,
                    :old.bookname||'->'||:new.bookname,
                    :old.publisher||'->'||:new.publisher,
                    :old.price||'->'||:new.price,
                    'update');
END;
---------------------
--update Ʈ���� ���� �׽�Ʈ 
select * from book order by bookid desc;
select * from book_log;

update book 
   set bookname = '����Ŭ �����ͺ��̽��� ����2',
        price = 32000
 where bookid = 31;
-----------------------
--========================================================
--delete Ʈ���� �ۼ��ϰ� �����׽�Ʈ ���� 
--Ʈ���� �� : after_delete_book 
--������ book ���̺� ������ �����Ǹ� book_log���̺� �̷� ����� 
------------------------------------
create or replace trigger after_delete_book
    after delete on book
    for each row
begin
    -- ���� �α� ����� 
    insert into book_log 
                (bookid, bookname, publisher, price, logdate, job_gubun)
        values (:old.bookid,
                :old.bookname,
                :old.publisher,
                :old.price,
                sysdate, 'delete');
end;
--------------------------
--delete Ʈ���� ���� �׽�Ʈ 
select * from book order by bookid desc;
select * from book_log;

delete from book where bookid = 31;
delete from book where bookid > 10;
rollback;
commit;

--=========================================================
--INSERT, UPDATE, DELETE �� �Ǵ� Ʈ���� 
create or replace trigger trigger_book_iud
        after insert or update or delete on book 
        for each row
begin
      -- insert �̺�Ʈ �߻� �� �α� �����
      if inserting then 
      insert into book_log(bookid,bookname,publisher,price,logdate,job_gubun)
            values (:new.bookid,:new.bookname,:new.publisher,:new.price, sysdate, 'insert');
      end if;     
      -- update �̺�Ʈ �߻� �� �α� �����
      if updating then
      insert into book_log
                (bookid, bookname, publisher, price, job_gubun)
            values (:old.bookid,
                    :old.bookname||'->'||:new.bookname,
                    :old.publisher||'->'||:new.publisher,
                    :old.price||'->'||:new.price,
                    'update');
      end if;      
      -- delete �̺�Ʈ �߻� �� �α� �����
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
--������ Ʈ���� ��Ȱ��ȭ 
alter trigger "MADANG"."AFTER_INSERT_BOOK" disable;
alter trigger "MADANG"."AFTER_UPDATE_BOOK" disable;
alter trigger "MADANG"."AFTER_DELETE_BOOK" disable;
ALTER TRIGGER AFTER_INSERT_BOOK DISABLE;
ALTER TRIGGER AFTER_UPDATE_BOOK DISABLE;
ALTER TRIGGER AFTER_DELETE_BOOK DISABLE;

select * from book order by bookid desc;
select * from book_log; --�α����̺� ��� ������� 

insert into book values (30,'�����ͺ��̽��� ����','itbook',25000);
insert into book values (31,'�����ͺ��̽��� ����2','itbook',30000);

update book 
   set bookname = '����Ŭ �����ͺ��̽��� ����2',
        price = 32000
 where bookid = 31;

delete from book where bookid = 31;
delete from book where bookid > 10;

COMMIT;

