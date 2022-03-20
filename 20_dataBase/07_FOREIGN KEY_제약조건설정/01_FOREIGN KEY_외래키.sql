/******************************************
�������� (Constraint) 
- �ùٸ� �����͸� ������ ���ֱ� ���� ���(�߸��� �����ʹ� ����� ����-�����߻�)
- �������� ��Ȯ���� �ϰ����� �����ϱ� ���� �� Į���� �����ϴ� ��Ģ
- ��ųʸ��� �����
- ���̺� ������ ���Ἲ ���������� �����Ͽ� ���α׷��� ������ �ܼ�ȭ
- �����ͺ��̽� ������ ���� ���Ἲ ���������� �����Ǿ� ������ ���� �߻� ���ɼ��� �ٿ���
- �Ͻ������� Ȱ��ȭ(ENABLE) �Ǵ� ��Ȱ��ȭ(DISABLE) �� �� �ִ�.

<�������� 5����>
- NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY

1. NOT NULL : Null�� �����Ҽ� ����
2. UNIQUE : �ߺ��Ǵ� �� ���� �ȵ�
    (�ߺ��Ǵ� �� ����� �ϹǷ�, �������μ����� ���� �����͸� ã�ƾ� �Ѵ�. �����ɸ� - �ذ� : �ε���)
3. CHECK : �ش� Į���� ���� ������ ������ ���� ������ ���� ����
4. PRIMARY KEY(�⺻Ű) : ���� �� (NOT NULL + UNIQUE)
5. FOREIGN KEY(�ܷ�Ű-����) : �ش� Į�� ���� �����Ǵ� ���̺��� Į�� �� �� �ϳ��� ��ġ�ϰų� Null�� ����
    - �ڽ� ���̺� : �ٸ� ���̺��� ���� �����ϴ� ���̺�
    - �ܷ�Ű(foreign key): �θ����̺��� ���� �����ϴ� �ڽ����̺��� Į��
    - �θ� ���̺� : �ٸ� ���̺� ���� �����Ǵ� ���̺�
    - ����Ű(reference : �ڽ� ���̺��� �����ϴ� �θ� ���̺��� Į��
************************************************/
/*************************************
01.���̺� ������ �������� ���� 
    �÷��� ���� �ϸ鼭 �÷��������� �������� ���� 
    -�ܷ�Ű(foreign key) �������� ���輳�� 
    -���� : �÷��� reperences ������̺� (����÷�)
**************************************/
select * from dept;
-- �÷��������� ��������(�ܷ�Ű) ���� : �÷��� �ٸ��� ���� ���� 
create table emp01(
    empno number primary key,
    ename varchar2(30) not null,
    job varchar2(10),
    deptno varchar2(10) references dept(id) --�ܷ�Ű ����(�÷�����)
);
insert into emp01(empno, ename, job, deptno)
 values(1111,'ȫ�浿','����1','10');
select * from emp01;
commit;
--ORA-02291: integrity constraint (MADANG.SYS_C007032) violated - parent key not found
insert into emp01(empno, ename, job, deptno)-- parent key not found
 values(2222,'ȫ�浿2','����2','40'); -- dept���̺� ���� ������ '40'

--==============================================
-- ���̺������� �������� ���� 
create table emp02(
    empno number,
    ename varchar2(30) not null,
    job varchar2(10),
    deptno varchar2(10),
    
    primary key(empno),--�⺻Ű( primary key) ����
    foreign key(deptno) references dept(id) -- �ܷ�Ű(foreingn)����
);
insert into emp02(empno, ename, job, deptno)
 values(1111,'ȫ�浿','����1','10');
select * from emp01;
commit;
--ORA-02291: integrity constraint (MADANG.SYS_C007032) violated - parent key not found
insert into emp01(empno, ename, job, deptno)-- parent key not found
 values(2222,'ȫ�浿2','����2','40'); -- dept���̺� ���� ������ '40'

--=================================================
-- ���̺������� �������� �����Ҷ�, �������Ǹ��� ��������� �����ؼ� ��� 
-- ���� : constraint �������Ǹ� ������ �������� (���������� ����Ǵ� Į����)
create table emp03(
    empno number,
    ename varchar2(30) constraint emp03_ename_nn not null,
    job varchar2(10),
    deptno varchar2(10),
    
    constraint emp03_empno_pk primary key(empno),--�⺻Ű( primary key) ����
    constraint emp03_deptno_fk foreign key(deptno) references dept(id) -- �ܷ�Ű(foreingn)����
);
insert into emp03(empno, ename, job, deptno)
 values(1111,'ȫ�浿','����1','10');
select * from emp03;
commit;
insert into emp03(empno, ename, job, deptno)-- parent key not found
 values(2222,'ȫ�浿2','����2','40'); -- dept���̺� ���� ������ '40'

--=================================================
/******************************************
02. alter �� ���̺� �������� �߰�, ���� 
----�������� �߰� 
alter table ���̺�� add constraint �������Ǹ� ������ ��������(���������� ����Ǵ� Į����);

----�������� ���� 
alter table ���̺�� drop constraint �������Ǹ�;
*******************************************/
-- emp01 ���̺��� primary key ���� 
alter table emp01 drop constraint SYS_C007028;

--emp01 ���̺��� primary key �߰� 
--ALERT TABLE ���̺�� ADD CONSTRAINT �������Ǹ� ��������������(����);
alter table emp01 add constraint emp01_empno_pk primary key(empno);
-----------------
--pk�������� - ���ϵ����� �Է� 
select * from emp01;
--ORA-00001: unique constraint (MADANG.EMP01_EMPNO_PK) violated
insert into emp01 values (1111,'ȫ�浿2','����1','10');
alter table emp01 drop constraint emp01_empno_pk; --pk���� 

-- pk ������ 
insert into emp01 values (1111,'ȫ�浿2','����1','10');
commit;

----------------------------------------------------------
--�������� ������ ������ ���¿� ���� ���뿩�� ���� 
----�ߺ������� �ִ� ��� primary key, unique ���� �ȵ�
----not null�����Ϸ��� �÷��� null�����Ͱ� �ϳ��� ������ �ȵ� 
----(�ذ���) �ߺ������� ���� �Ǵ� ���� (unique�ϰ� )
-----   null������ ã�Ƽ� ����ó�� (null�ƴ� ������)
alter table emp01 add constriant emp01_empno_pk primary key (empno); --pk�߰�

--(�ǽ�) emp02 �ܷ�Ű(foreign key) �̸� ���� ó�� 
alter table emp02 drop constraint SYS_C007032;
alter table emp02 add constraint emp02_empno_fk foreign key(deptno) references dept(id);

--======================================
/* �������� Ȱ��ȭ / ��Ȱ��ȭ
-- �������� �����Ǿ� �ִ� ���� ���� �Ǵ� ��������
-- ALTER TABLE ���̺�� DISABLE CONSTRAINT �����̸�;
-- ALTER TABLE ���̺�� ENABLE CONSTRAINT �����̸�;
****************************/
alter table "MADANG"."EMP02" disable constraint "EMP02_DEPTNO_FK"; 
alter table emp02 disable constraint emp02_deptno_fk;
insert into emp02 values (3333,'ȫ�浿3','����3','40');
 commit;
 select * from emp02;
 -- �������� Ȱ��ȭ(�������)
alter table EMP02 ENABLE constraint EMP02_DEPTNO_FK;

--������ ���� ���̺� :  USER_CONS_COLUMNS, USER_CONSTRAINTS
select * from user_cons_columns;
select * from user_constraints;

select a.owner, a.table_name, a.column_name, a.constraint_name
      , b.CONSTRAINT_TYPE
      , decode(b.constraint_type,
                'P', 'primary key',
                'U', 'unique',
                'C', 'check or not null',
                'R', 'foreign key') constraint_type_desc
 from user_cons_columns a, user_constraints b
 where a.table_name = b.table_name
  and a.constraint_name = b.constraint_name
  and a.table_name like 'emp%'
;
 
 
















