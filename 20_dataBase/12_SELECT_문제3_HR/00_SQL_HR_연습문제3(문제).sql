/****** HR ����Ÿ ��ȸ ����2 ****************
/*1�� HR �μ��� � ����� �޿������� ��ȸ�ϴ� ������ �ð� �ִ�. 
  Tucker ��� ���� �޿��� ���� �ް� �ִ� ����� 
  �̸��� ��(Name���� ��Ī), ����, �޿��� ����Ͻÿ�
*****************************************************/
SELECT* FROM EMPLOYEES where LAST_NAME = 'Tucker';
SELECT* FROM EMPLOYEES where FIRST_NAME||' '||LAST_NAME LIKE '%Tucker%';

SELECT FIRST_NAME||' '||LAST_NAME NAME, JOB_ID, SALARY 
  FROM EMPLOYEES 
 WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Tucker')
;

/*2�� ����� �޿� ���� �� ������ �ּ� �޿��� �ް� �ִ� ����� 
  �̸��� ��(Name���κ�Ī), ����, �޿�, �Ի����� ����Ͻÿ�
********************************************************/ 
--������ �ּұ޿� 
SELECT JOB_ID, MIN(SALARY) MIN_SALARY 
  FROM EMPLOYEES 
 GROUP BY JOB_ID 
 ORDER BY MIN_SALARY
;
--EMPLOYEES �� ���������� �����Ѵ� ->ȿ�����鿡�� ���� !!
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME,E.JOB_ID, E.SALARY, E.HIRE_DATE 
      --,M.JOB_ID AS M_JOB_ID, M.MIN_SALARY
  FROM EMPLOYEES E INNER JOIN (SELECT JOB_ID, MIN(SALARY) MIN_SALARY FROM EMPLOYEES GROUP BY JOB_ID) M
    ON E.JOB_ID = M.JOB_ID -- �������� 
 WHERE E.SALARY = M.MIN_SALARY --�˻�����
 ORDER BY JOB_ID
;
-------------------
--�����������
--���������� WHERE ���� ��� 
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME,E.JOB_ID, E.SALARY, E.HIRE_DATE
  FROM EMPLOYEES E
 WHERE SALARY IN (SELECT MIN(SALARY) MIN_SALARY FROM EMPLOYEES GROUP BY JOB_ID/*WHERE JOB_ID=E.JOB_ID*/)
 ORDER BY SALARY
;

/*3�� �Ҽ� �μ��� ��� �޿����� ���� �޿��� �޴� ����� 
  �̸��� ��(Name���� ��Ī), �޿�, �μ���ȣ, ������ ����Ͻÿ�
***********************************************************/
SELECT * FROM DEPARTMENTS ORDER BY DEPARTMENT_ID; 

-- �μ��� ��ձݾ� 
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AVG_SALARY
  FROM EMPLOYEES  
 GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID
;
--���������� FROM���� ���(����)
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME, JOB_ID, E.DEPARTMENT_ID, E.SALARY
      -- ,D.DEPARTMENT_ID
         ,D.AVG_SALARY
  FROM EMPLOYEES E,
        (SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AVG_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID) D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID --��������(�����μ�)
   AND E.SALARY > D.AVG_SALARY
 ORDER BY E.DEPARTMENT_ID
;
--�� ���� : DEPARTMENT_ID(�μ���ȣ)�� 30�� ��� ��ȸ 
SELECT  E.FIRST_NAME||' '||E.LAST_NAME NAME, JOB_ID, E.DEPARTMENT_ID, E.SALARY 
  FROM EMPLOYEES E
 WHERE DEPARTMENT_ID = 30
 ORDER BY SALARY
;
--------------
--����������� : where���� �������� ��� 
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME, E.JOB_ID, E.DEPARTMENT_ID, E.SALARY
  FROM EMPLOYEES E
 WHERE SALARY > (SELECT ROUND(AVG(SALARY)) AVG_SALARY
                     FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) 
 ORDER BY DEPARTMENT_ID, SALARY
;
/*4�� ��� ����� �ҼӺμ� ��տ����� ����Ͽ� ������� �̸��� ��(Name���� ��Ī),
  ����, �޿�, �μ���ȣ, �μ���տ���(Department Avg Salary�� ��Ī)�� ����Ͻÿ�
***************************************************************/
--�μ��� ��տ��� 
select department_id, round(avg(salary*(1+nvl(commission_pct,0))))
       , round(avg(salary*(1+nvl(commission_pct,0)))*12)
  from employees
 group by department_id
 order by 1
;
--���� ������� ��ȸ 

select e.first_name||' '||e.last_name name, e.job_id, e.salary, e.department_id 
        ,a.avg_salary, a.avg_salary12 "Department Avg Salary"
  from employees e,
        (select department_id, round(avg(salary*(1+nvl(commission_pct,0)))) as avg_salary
                ,round(avg(salary*(1+nvl(commission_pct,0)))*12) as avg_salary12
           from employees 
          group by department_id
          ) a
 where e.department_id = a.department_id
order by e.department_id, e.salary
;
-----------
-- ����������� : select ���� �������� ���( ���񱳰� �ʿ���⶧���� )
select e.first_name||' '||e.last_name name, e.job_id, e.salary, e.department_id
       , (select round(avg(salary))*12 from employees 
           where department_id = e.department_id) as "Department Avg Salary"
  from employees e 
 order by department_id, salary
;
  
/*5�� HR ��Ű���� �ִ� Job_history ���̺��� ������� ���� ���� �̷��� ��Ÿ���� ���̺��̴�. 
  �� ������ �̿��Ͽ� ��� ����� ���� �� ������ ���� �̷� ������ ����ϰ��� �Ѵ�. 
  �ߺ��� ��������� ������ �� ���� ǥ���Ͽ� ����Ͻÿ�
  (�����ȣ, ����)
*********************************************************************/
--union ���: �÷���, Ÿ��, ����, ������ ��ġ , order by ���� �� �������� �ۼ� 
select employee_id, job_id from employees
union
select employee_id, job_id from job_history
order by employee_id, job_id
;
--union all ���: �÷���, Ÿ��, ����, ������ ��ġ , order by ���� �� �������� �ۼ� 
select employee_id, job_id from employees
union all
select employee_id, job_id from job_history
order by employee_id, job_id
;

/*6�� �� �������� �� ����� ���� �̷� ������ Ȯ���Ͽ���. ������ '��� �����
  ���� �̷� ��ü'�� ������ ���ߴ�. ���⿡���� ��� ����� 
  ���� �̷� ���� ����(JOB_HISTORY) �� �������濡 ���� �μ������� 
  �����ȣ�� ���� ������� ����Ͻÿ�(���տ����� UNION)
  (�����ȣ, �μ�����, ����)
**********************************************************************/
  select employee_id, department_id, job_id from employees
  union all
  select employee_id, department_id, job_id from job_history
  order by employee_id, job_id;

/*7�� HR �μ������� �ű� ������Ʈ�� �������� �̲� �ش� �����ڵ��� 
  �޿��� �λ� �ϱ�� �����Ͽ���. 
  ����� ���� 107���̸� 19���� ������ �ҼӵǾ� �ٹ� ���̴�. 
  �޿� �λ� ����ڴ� ȸ���� ����(Distinct job_id) �� ���� 5�� �������� 
  ���ϴ� ����� �ش�ȴ�. ������ ������ ���ؼ��� �޿��� ����ȴ�. 
  5�� ������ �޿� �λ���� ������ ����.
  HR_REP(10%), MK_REP(12%), PR_REP(15%), SA_REP(18%), IT_PROG(20%)
**********************************************************************/
--CASE WHEN ����� 
select first_name||' '||last_name name,job_id, salary,
       case job_id 
            when 'HR_REP' then salary*1.1
            when 'MK_REP' then salary*1.12
            when 'PR_REP' then salary*1.15
            when 'SA_REP' then salary*1.18
            when 'IT_PROG' then salary*1.2
            else salary       
       end "new salary"
  from employees
 order by job_id
;
--�����λ�ݾ� Ȯ��
select first_name||' '||last_name name,job_id, salary,
       case job_id 
            when 'HR_REP' then salary*0.1
            when 'MK_REP' then salary*0.12
            when 'PR_REP' then salary*0.15
            when 'SA_REP' then salary*0.18
            when 'IT_PROG' then salary*0.2
            else 0       
       end "�����λ�ݾ�"
  from employees
 order by job_id
;
------------
--DECODE ����񱳻��
select first_name||' '||last_name name,job_id, salary,
       DECODE( job_id 
            ,'HR_REP' ,salary*1.1
            ,'MK_REP' , salary*1.12
            ,'PR_REP' , salary*1.15
            ,'SA_REP' , salary*1.18
            ,'IT_PROG' , salary*1.2
            , salary       
       ) "new salary"
  from employees
 order by job_id
;
--�޿��λ�� 
select distinct job_id, decode(job_id,'HR_REP','10%'
                                     ,'MK_REP','12%'
                                     ,'PR_REP','15%'
                                     ,'SA_REP','18%'
                                     ,'IT_PROG','20%') "increace pct"
  from employees
 where job_id in('HR_REP','MK_REP','PR_REP','SA_REP','IT_PROG')
 order by 2
;
/*8�� HR �μ������� �ֻ��� �Ի��Ͽ� �ش��ϴ� 2001����� 2003����� �Ի��ڵ��� �޿��� 
  ���� 5%, 3%, 1% �λ��Ͽ� ���п� ���� �������� �����ϰ��� �Ѵ�. 
  ��ü ����� �� �ش� �⵵�� �ش��ϴ� ������� �޿��� �˻��Ͽ� �����ϰ�, 
  �Ի����ڿ� ���� �������� ������ �����Ͻÿ�
**********************************************************************/
select min(hire_date) from employees;-- 01/01/13
--2001������ �Ի��ڰ� ���ٴ� �����Ͽ� 
--CASE WHEN �ε�񱳷� ��ȸ
select employee_id,first_name||' '||last_name name, hire_date, salary
       ,case when hire_date < to_date('2002-01-01','yyyy-mm-dd')
             then round(salary*1.05)
             when hire_date < to_date('2003-01-01','yyyy-mm-dd')
             then round(salary*1.03)
             when hire_date < to_date('2004-01-01','yyyy-mm-dd')
             then round(salary*1.01)
             else 0
        end "����"
  from employees
 where hire_date between to_date('010101','yy-mm-dd') and to_date('031231','yy-mm-dd')
 order by hire_date
;
--�Ի����� �⵵ (yyyy)�������� 
select employee_id,first_name||' '||last_name name, hire_date, salary
       ,case to_char(hire_date,'yyyy') 
            when '2001' then round(salary*1.05)
            when '2002' then round(salary*1.03)
            when '2003' then round(salary*1.01)
            else 0
        end as "����"                               
  from employees
 where to_char(hire_date,'yyyy') in ('2001','2002','2003')
 order by hire_date
;
-------
--decode ��
select employee_id,first_name||' '||last_name name, hire_date, salary
       , decode( to_char(hire_date,'yyyy') 
           , '2001' , round(salary*1.05)
           , '2002' , round(salary*1.03)
           , '2003' , round(salary*1.01)
           , 0
        ) as "����"                               
  from employees
 where to_char(hire_date,'yyyy') in ('2001','2002','2003')
 order by hire_date
;
--2001 ~ 2003 ������� �Ի��� 
select employee_id, salary,first_name||' '||last_name name, hire_date, 
        case when hire_date between to_date('010101','yy-mm-dd')and to_date('011231','yy-mm-dd')
             then round(salary*1.05)
                  when hire_date between to_date('020101','yy-mm-dd')and to_date('021231','yy-mm-dd')
                     then round(salary*1.03) 
                        when hire_date between to_date('030101','yy-mm-dd')and to_date('031231','yy-mm-dd')
                            then round(salary*1.01) 
        end as increase_salary
  from employees
 where hire_date between to_date('010101','yy-mm-dd') and to_date('031231','yy-mm-dd')
order by hire_date
;
 
/*9�� �μ��� �޿� �հ踦 ���ϰ�, �� ����� ������ ���� ǥ���Ͻÿ�.
  Sum Salary > 100000 �̸�, "Excellent"
  Sum Salary > 50000 �̸�, "Good"
  Sum Salary > 10000 �̸�, "Medium"
  Sum Salary <= 10000 �̸�, "Well"
**********************************************************************/
-- �μ��� �޿� �հ� 
select department_id, sum(salary) sum_salary
 from employees
 group by department_id
 order by 1
;
-----------
--from���� �������� ����ؼ� ���� 
select department_id, e.sum_salary
        ,case when e.sum_salary > 100000 then 'Excellent'
              when e.sum_salary > 50000 then 'Good'
              when e.sum_salary > 10000 then 'Medium'
               when e.sum_salary <= 10000 then 'well'
         end as "�޿� ��"
  from (select department_id, sum(salary) sum_salary
            from employees
            group by department_id) e
 where department_id is not null
 order by 1
;
-----------------
--
select department_id, sum(salary) sum_salary,
        case when  sum(salary) > 100000 then 'Excellent'
              when sum(salary) > 50000 then 'Good'
              when sum(salary) > 10000 then 'Medium'
              when sum(salary) <= 10000 then 'well'
         end as "�޿� ��"
  from employees 
  where department_id is not null
  group by department_id
  order by sum_salary
;

/*10�� 2005�� ������ �Ի��� ��� �� ������ "MGR"�� ���Ե� ����� 15%, 
  "MAN"�� ���Ե� ����� 20% �޿��� �λ��Ѵ�. 
  ���� 2005����� �ٹ��� ������ ��� �� "MGR"�� ���Ե� ����� 25% �޿��� �λ��Ѵ�. 
  �̸� �����ϴ� ������ �ۼ��Ͻÿ�
**********************************************************************/
--case when �̿��ؼ� ��ȸ 
select distinct job_id from employees 
 where job_id like '%MGR%' or job_id like '%MAN%'
;
select employee_id, first_name||' '||last_name name,
       job_id, hire_date, salary,
       --2005�� �����Ի��̰�, MGR :  15%�λ� or MAN :  20%�λ�
       case when to_char(hire_date, 'yyyy') < '2005'
            then case when job_id like '%MGR%' then round(salary*1.15)
                      when job_id like '%MAN%' then round(salary*1.2)
                      else salary
                 end
            --2005����� �ٹ� �ϰ�, MGR : 25%�λ�
            else case when job_id like '%MGR%' then round(salary*1.25)
                      else salary
                 end
       end as "����� �޿�"
  from employees
;
---------------------
select job_id, substr(job_id, -3) from employees
where substr(job_id,-3) in ('MGR','MAN');
-----------
select employee_id, first_name||' '||last_name name,
       job_id, hire_date, salary,
       --2005�� �����Ի��̰�, MGR :  15%�λ� or MAN :  20%�λ�
       case when to_char(hire_date, 'YYYY') < '2005'
            then decode (substr(job_id,-3)
                        ,'MGR',round(salary*1.15)
                        ,'MAN',round(salary*1.20)
                        ,salary)
            --2005����� �ٹ��ϰ� ������ MGR������ 25%�λ� 
            else decode(substr(job_id,-3)
                            ,'MGR',round(salary*1.25)
                            ,salary)
       end "����� �޿�"
from employees
order by hire_date
;
--2005�� ���� �Ի��� ��� ��ȸ 
select e.*, case when job_id like '%MGR%' then round(salary*1.15)
                          when job_id like '%MAN%'then round(salary*1.2)
                          else salary
                    end as "increase_salary"                    
  from employees e
 where hire_date < to_date('20050101','yyyy-mm-dd')
 order by hire_date
;
/*11�� ������ �Ի��� ��� �� ���
  (���1) ������ �Ի��� ��� ���� �Ʒ��� ���� �� �ະ�� ��µǵ��� �Ͻÿ�(12��).
  1�� xx
  2�� xx
  3�� xx
  ..
  12�� xx
  �հ� XXX
**********************************************************************/  
select hire_date, to_char(hire_date, 'mm') from employees;
select to_char(hire_date,'mm') as "��"
        ,count(*) as "�ο���"
  from employees
 group by to_char(hire_date,'mm')
union
select '�հ�' as "��"
        ,count(*) as "�ο���"
  from employees
;
---------
select to_number(to_char(hire_date,'mm')) as "��"
        ,count(*) as "�ο���"
  from employees
 group by to_char(hire_date,'mm')
 order by 1
union
--�ο����� ���� ���ϱ����� unionó�� 
select 99 as "��"
        ,count(*) as "�ο���"
  from employees
order by 1
;
-----
select decode(mm,99,'�հ�',mm||'��') "�Ի��",
        cnt "�ο���"
  from (select to_number(to_char(hire_date,'mm')) as mm
                ,count(*) as cnt
          from employees
         group by to_char(hire_date,'mm')
        union
        select 99 as mm
                ,count(*) as cnt
          from employees
         order by 1)
;
---------------------------------------------------------
/* (���2) ù �࿡ ��� ���� �Ի� ��� ���� ��µǵ��� �Ͻÿ�
  1�� 2�� 3�� 4�� .... 11�� 12��
  xx  xx  xx xx  .... xx   xx
**********************************************************************/
select employee_id, hire_date, to_char(hire_date,'mm')
        ,decode (to_char(hire_date,'mm'),'01',1,0) "1��",
  from employees
 order by to_char(hire_date,'mm')
;
--------
select   sum(decode (to_char(hire_date,'mm'),'01',1,0)) "1��"
        ,sum(decode (to_char(hire_date,'mm'),'01',2,0)) "2��"
        ,sum(decode (to_char(hire_date,'mm'),'01',3,0)) "3��"
        ,'...'
        ,sum(decode (to_char(hire_date,'mm'),'12',3,0)) "12��"
        ,count(*) "�հ�"
  from employees
;






