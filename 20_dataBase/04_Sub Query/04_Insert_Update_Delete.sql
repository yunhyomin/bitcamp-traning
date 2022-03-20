--insert, update, delete
/************************
   <insert ��>
insert into ���̺�� 
        (�÷���1, �÷���2, ....,�÷���n)
values (��1, ��2, ....,��n)
;

   <update ��>
update ���̺�� 
    set �÷���1 = ��1, 
        �÷���2 =��2, 
        ...,
        �÷���n = ��n
where �������
;
    <delete ��> 
delete from ���̺�� 
where ������ǹ� 
;
**************************/
select *from book;
insert into book 
        (bookid, bookname, publisher, price)
values( 30, '�ڹٶ� �����ΰ�', 'itbook', 30000);
commit;
insert into book 
        (bookid, publisher,bookname,  price)
values( 31, 'itbook','�ڹٶ� �����ΰ�2',  35000);
rollback;-- Ŀ���Ŀ� �� ó������ �ǵ����� 
commit;
/* insert : �÷����� �������� �ʰ� �Է� 
-----���̺� �ۼ��� �÷��� ���� ��� �ۼ�(������ ����)
-----���̺� �ۼ��� �÷��� ������ ���� ������ �Է����� �ʴ°�� 
        (�Է¼���) ���� ���� : �߸��� ��ġ�� ������ �Էµ� 
        (�Է½���) ������Ÿ�� ����ġ, ������ ũ�� ����ġ �� 
*******************************/
insert into book 
values( 32, '�ڹٶ� �����ΰ�3', 'itbook', 37000);
commit;
insert into book 
values( 33, '�ڹٶ� �����ΰ�4', '', 38000); 
insert into book 
values( 34, 'itbook', '�ڹٶ� �����ΰ�5',38000);
----------
insert into book 
        (bookid, publisher, bookname, price)
values( 35, 'itbook','�ڹٶ� �����ΰ�6',  38000);

insert into book 
        (bookid, publisher, bookname)
values( 36, 'itbook','�ڹٶ� �����ΰ�7' );

commit;
select * from book order by bookid desc;
----------------------------------------
--�ϰ��Է� : ���̺����͸� �̿��ؼ� ���� �����͸� �ѹ��� �Է�ó�� 
---- imported_book ---->book : �ϰ��Է�
insert into book
select bookid, bookname, publisher, price 
 from imported_book
;
--==========================================
/********************
 <update ��>
update ���̺�� 
    set �÷���1 = ��1, 
        �÷���2 =��2, 
        ...,
        �÷���n = ��n
where �������
;
*********************/
select * from customer;
--�ڼ��� �ּ� ���� : ���ѹα� ����-> ���ѹα� �λ� 
update customer
    set address = '���ѹα� �λ�'
where name = '�ڼ���'
;
commit;
--�ڼ��� �ּ�, ��ȭ��ȣ ����  : '���ѹα� ����','010-1111-1111'
update customer
    set address = '���ѹα� ����',
        phone = '010-1111-1111'
where name ='�ڼ���'
;
select *from customer where name = '�ڼ���';
commit;
----------------------------------
-- �ڼ��� �ּ� ���� : �迬���� �ּҿ� �����ϰ� ���� 
----update���� �������� �������� ���� ������ ������ ã�� ���� 
----�������� ������� 1�����Ͽ��� ��(2���̻��� ��� �����߻�)
update customer
 set address = (select address from customer where name ='�迬��')
 where name = '�ڼ���'
;
--���������� �����Ͱ� ������ null�� �����ȴ� 
update customer c
 set address = (select address from customer where custid =(select custid from customer where c.name ='�迬��'))
 where name = '�ڼ���'
;
commit;
----------------------------------
--�ڼ����� �ּ�, ��ȭ��ȣ ���� : �߽ż��� �����ϰ� 
update customer 
    set address = (select address from customer where name = '�߽ż�'),
        phone = (select phone from customer where name = '�߽ż�')
    where name ='�ڼ���'
;
commit;
--================================
/***********************
 <delete ��> 
delete from ���̺�� 
where ������ǹ� 
;
************************/
select * from test_like;
--delete from test_like where name = 'ȫ�浿'; �����ϰ� ���� �ּ�ó���ϴ� ���� ���� 
--delete from test_like where name like ȫ�浿;

--delete from test_like where name like 'ȫ�浿%';
select * from test_like;
commit;

---------------------
select * from book;
--å������ �ڹٷ� �����ϰ� ���ǻ簡 itbook�� ������ ���� 
--select *from 
delete 
 from book
where bookname like '�ڹ�%' and publisher = 'itbook';
--�߸������ߴ��ϸ� 
--rollback;
--�°� ��ó���ߴ��ϸ� 
--commit;
--------------------
select * 
--delete
 from book
where bookid >= 30
 ;








