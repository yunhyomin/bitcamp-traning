select fnnno,fnntype,fnnname
 from products  
 where keep = '����'
;
select FNNNO,FNNTYPE,FNNNAME,RATE,(SELECT COUNT(*)FROM BANKNUMBER GROUP BY FNNNO) USERCOUNT
from products P
WHERE KEEP = '����'
;
SELECT* FROM BANKNUMBER;
INSERT INTO BANKNUMBER 
VALUES((SELECT PHONE FROM USERS WHERE USERID='���̵�'),SYSDATE,'���̵�'
        ,(SELECT EMPNO FROM PRODUCTS WHERE FNNNO = '242235JD'),'242235JD');
SELECT * FROM USERS;
alter table users drop constraint unique_phone;
alter table banknumber modify bankno varchar2(20);
alter table users add constraint unique_phone unique(phone);
alter table history add constraint fk_bankno foreign key(bankno) references banknumber(bankno);
insert into users
values(userS_seq.nextval,'ȿ��','���','�̸�',34234,'�̸���','�ּ�','930401');

ALTER TABLE PRODUCTS RENAME COLUMN USERID TO EMPNO;
ALTER TABLE PRODUCTS DROP CONSTRAINT FK_PRODUCTS_USERID_USERS_USERI;

SELECT * FROM PRODUCTS;
INSERT INTO PRODUCTS 
VALUES('242235JD','��������','�����������',2.7,'E34532243','�ߴ�');

SELECT*FROM EMPLOYEES;
INSERT INTO EMPLOYEES (EMPNO,EMPPW,EMPNAME,DEPARTMENT,RANK,HIREDATE)
VALUES('E3','33','����3','�繫��','����',SYSDATE);

insert into banknumber
values ((select userNO||PHONE from users where userid = 'ȿ��'),
        sysdate,'���̵�',(select empno from products where fnnno = '242235JJ'),'242235JJ');
COMMIT;
insert into employees(empno,emppw,empname,department,rank,hiredate)
values('E345353','���','����1','������','�븮',sysdate)
;