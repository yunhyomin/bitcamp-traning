/******************************************
제약조건 (Constraint) 
- 올바른 데이터만 들어오게 해주기 위해 사용(잘못된 데이터는 못들어 차단-에러발생)
- 데이터의 정확성과 일관성을 보장하기 위해 각 칼럼에 정의하는 규칙
- 딕셔너리에 저장됨
- 테이블 생성시 무결성 제약조건을 정의하여 프로그래밍 과정을 단순화
- 데이터베이스 서버에 의해 무결성 제약조건이 관리되어 데이터 오류 발생 가능성을 줄여줌
- 일시적으로 활성화(ENABLE) 또는 비활성화(DISABLE) 할 수 있다.

<제약조건 5종류>
- NOT NULL, UNIQUE, CHECK, PRIMARY KEY, FOREIGN KEY

1. NOT NULL : Null값 포함할수 없음
2. UNIQUE : 중복되는 값 오면 안됨
    (중복되는 것 없어야 하므로, 서버프로세스가 기존 데이터를 찾아야 한다. 오래걸림 - 해결 : 인덱스)
3. CHECK : 해당 칼럼에 저장 가능한 데이터 값의 범위나 조건 지정
4. PRIMARY KEY(기본키) : 고유 값 (NOT NULL + UNIQUE)
5. FOREIGN KEY(외래키-참조) : 해당 칼럼 값은 참조되는 테이블의 칼럼 값 중 하나와 일치하거나 Null을 가짐
    - 자식 테이블 : 다른 테이블의 값을 참조하는 테이블
    - 외래키(foreign key): 부모테이블의 값을 참조하는 자식테이블의 칼럼
    - 부모 테이블 : 다른 테이블에 의해 참조되는 테이블
    - 참조키(reference : 자식 테이블에서 참조하는 부모 테이블의 칼럼
************************************************/
/*************************************
01.테이블 생성시 제약조건 설정 
    컬럼을 정의 하면서 컬럼레벨에서 제약조건 지정 
    -외래키(foreign key) 지정으로 관계설정 
    -형태 : 컬럼명 reperences 대상테이블 (대상컬럼)
**************************************/
select * from dept;
-- 컬럼레벨에서 제약조건(외래키) 설정 : 컬럼명 다르게 설정 가능 
create table emp01(
    empno number primary key,
    ename varchar2(30) not null,
    job varchar2(10),
    deptno varchar2(10) references dept(id) --외래키 설정(컬럼레벨)
);
insert into emp01(empno, ename, job, deptno)
 values(1111,'홍길동','직무1','10');
select * from emp01;
commit;
--ORA-02291: integrity constraint (MADANG.SYS_C007032) violated - parent key not found
insert into emp01(empno, ename, job, deptno)-- parent key not found
 values(2222,'홍길동2','직무2','40'); -- dept테이블에 없는 데이터 '40'

--==============================================
-- 테이블레벨에서 제약조건 지정 
create table emp02(
    empno number,
    ename varchar2(30) not null,
    job varchar2(10),
    deptno varchar2(10),
    
    primary key(empno),--기본키( primary key) 설정
    foreign key(deptno) references dept(id) -- 외래키(foreingn)설정
);
insert into emp02(empno, ename, job, deptno)
 values(1111,'홍길동','직무1','10');
select * from emp01;
commit;
--ORA-02291: integrity constraint (MADANG.SYS_C007032) violated - parent key not found
insert into emp01(empno, ename, job, deptno)-- parent key not found
 values(2222,'홍길동2','직무2','40'); -- dept테이블에 없는 데이터 '40'

--=================================================
-- 테이블레벨에서 제약조건 지정할때, 제약조건명을 명시적으로 선언해서 사용 
-- 형태 : constraint 제약조건명 적용할 제약조건 (제약조건이 적용되는 칼럼명)
create table emp03(
    empno number,
    ename varchar2(30) constraint emp03_ename_nn not null,
    job varchar2(10),
    deptno varchar2(10),
    
    constraint emp03_empno_pk primary key(empno),--기본키( primary key) 설정
    constraint emp03_deptno_fk foreign key(deptno) references dept(id) -- 외래키(foreingn)설정
);
insert into emp03(empno, ename, job, deptno)
 values(1111,'홍길동','직무1','10');
select * from emp03;
commit;
insert into emp03(empno, ename, job, deptno)-- parent key not found
 values(2222,'홍길동2','직무2','40'); -- dept테이블에 없는 데이터 '40'

--=================================================
/******************************************
02. alter 로 테이블에 제약조건 추가, 삭제 
----제약조건 추가 
alter table 테이블명 add constraint 제약조건명 적용할 제약조건(제약조건이 적용되는 칼럼명);

----제약조건 삭제 
alter table 테이블명 drop constraint 제약조건명;
*******************************************/
-- emp01 테이블의 primary key 삭제 
alter table emp01 drop constraint SYS_C007028;

--emp01 테이블의 primary key 추가 
--ALERT TABLE 테이블명 ADD CONSTRAINT 제약조건명 적용할제약조건(형태);
alter table emp01 add constraint emp01_empno_pk primary key(empno);
-----------------
--pk설정상태 - 동일데이터 입력 
select * from emp01;
--ORA-00001: unique constraint (MADANG.EMP01_EMPNO_PK) violated
insert into emp01 values (1111,'홍길동2','직무1','10');
alter table emp01 drop constraint emp01_empno_pk; --pk삭제 

-- pk 삭제후 
insert into emp01 values (1111,'홍길동2','직무1','10');
commit;

----------------------------------------------------------
--제약조건 설정시 데이터 상태에 따라 적용여부 결정 
----중복데이터 있는 경우 primary key, unique 설정 안됨
----not null설정하려는 컬럼에 null데이터가 하나라도 있으면 안됨 
----(해결방법) 중복데이터 삭제 또는 수정 (unique하게 )
-----   null데이터 찾아서 수정처리 (null아닌 값으로)
alter table emp01 add constriant emp01_empno_pk primary key (empno); --pk추가

--(실습) emp02 외래키(foreign key) 이름 변경 처리 
alter table emp02 drop constraint SYS_C007032;
alter table emp02 add constraint emp02_empno_fk foreign key(deptno) references dept(id);

--======================================
/* 제약조건 활성화 / 비활성화
-- 제약조건 설정되어 있는 것을 적용 또는 적용해제
-- ALTER TABLE 테이블명 DISABLE CONSTRAINT 제약이름;
-- ALTER TABLE 테이블명 ENABLE CONSTRAINT 제약이름;
****************************/
alter table "MADANG"."EMP02" disable constraint "EMP02_DEPTNO_FK"; 
alter table emp02 disable constraint emp02_deptno_fk;
insert into emp02 values (3333,'홍길동3','직무3','40');
 commit;
 select * from emp02;
 -- 제약조건 활성화(적용상태)
alter table EMP02 ENABLE constraint EMP02_DEPTNO_FK;

--데이터 사전 테이블 :  USER_CONS_COLUMNS, USER_CONSTRAINTS
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
 
 
















