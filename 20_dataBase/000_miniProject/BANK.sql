select fnnno,fnntype,fnnname
 from products  
 where keep = '진행'
;
select FNNNO,FNNTYPE,FNNNAME,RATE,(SELECT COUNT(*)FROM BANKNUMBER GROUP BY FNNNO) USERCOUNT
from products P
WHERE KEEP = '진행'
;
SELECT* FROM BANKNUMBER;
INSERT INTO BANKNUMBER 
VALUES((SELECT PHONE FROM USERS WHERE USERID='아이디'),SYSDATE,'아이디'
        ,(SELECT EMPNO FROM PRODUCTS WHERE FNNNO = '242235JD'),'242235JD');
SELECT * FROM USERS;
alter table users drop constraint unique_phone;
alter table banknumber modify bankno varchar2(20);
alter table users add constraint unique_phone unique(phone);
alter table history add constraint fk_bankno foreign key(bankno) references banknumber(bankno);
insert into users
values(userS_seq.nextval,'효민','비번','이름',34234,'이메일','주소','930401');

ALTER TABLE PRODUCTS RENAME COLUMN USERID TO EMPNO;
ALTER TABLE PRODUCTS DROP CONSTRAINT FK_PRODUCTS_USERID_USERS_USERI;

SELECT * FROM PRODUCTS;
INSERT INTO PRODUCTS 
VALUES('242235JD','자유적금','언제어느때나',2.7,'E34532243','중단');

SELECT*FROM EMPLOYEES;
INSERT INTO EMPLOYEES (EMPNO,EMPPW,EMPNAME,DEPARTMENT,RANK,HIREDATE)
VALUES('E3','33','직원3','재무팀','부장',SYSDATE);

insert into banknumber
values ((select userNO||PHONE from users where userid = '효민'),
        sysdate,'아이디',(select empno from products where fnnno = '242235JJ'),'242235JJ');
COMMIT;
insert into employees(empno,emppw,empname,department,rank,hiredate)
values('E345353','비번','직원1','영업부','대리',sysdate)
;