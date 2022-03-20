/* ** �ǽ����� : HR����(DB)���� �䱸���� �ذ� **********
-- ���(employee_id)�� 100�� ���� ���� ��ü ����
-- ����(salary)�� 15000 �̻��� ������ ��� ���� ����
-- ������ 15000 �̻��� ����� ���, �̸�(LAST_NAME), �Ի���(hire_date), ���޿� ���� ����
-- ������ 10000 ������ ����� ���, �̸�(LAST_NAME), �Ի���, ���޿� ���� ����
---- (�޿��� ���� �������)
-- �̸�(first_name)�� john�� ����� ��� ���� ��ȸ
-- �̸�(first_name)�� john�� ����� �� ���ΰ�?
-- 2008�⿡ �Ի��� ����� ���, ����('first_name last_name'), ���޿� ���� ��ȸ
---- ���� ��¿�) 'Steven King'
-- ���޿��� 20000~30000 ������ ���� ���, ����(last_name first_name), ���޿� ���� ��ȸ
-- ������ID(MANAGER_ID)�� ���� ��� ���� ��ȸ
-- ����(job_id)�ڵ� 'IT_PROG'���� ���� ���� ���޿��� ��
-- ������ �ִ� ���޿� �˻�
-- ������ �ִ� ���޿� �˻��ϰ�, �ִ� ���޿��� 10000�̻��� ���� ��ȸ
-- ������ ��ձ޿� �̻��� ���� ��ȸ
**********************************************************/
-- ���(employee_id)�� 100�� ���� ���� ��ü ����
select *
 from employees
where employee_id =100
 ;
-- ����(salary)�� 15000 �̻��� ������ ��� ���� ����
select *
 from employees
where salary >=15000
;
-- ������ 15000 �̻��� ����� ���, �̸�(LAST_NAME), �Ի���(hire_date), ���޿� ���� ����
select employee_id, last_name, hire_date,salary
 from employees
where salary >=15000
;
-- ������ 10000 ������ ����� ���, �̸�(LAST_NAME), �Ի���, ���޿� ���� ����
---- (�޿��� ���� �������)
select employee_id, last_name, hire_date,salary
 from employees
where salary <=10000
order by salary desc
;
-- �̸�(first_name)�� john�� ����� ��� ���� ��ȸ
---- JOHN, John, john, jOHn...
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'John';
SELECT * FROM EMPLOYEES 
WHERE FIRST_NAME = INITCAP('john'); --ǥ��ȭ�� �Ǿ� �ִ� ���

SELECT * FROM EMPLOYEES 
WHERE UPPER(FIRST_NAME) = 'JOHN'; --�����Ͱ� ǥ��ȭ ���� ���� ���
SELECT * FROM EMPLOYEES 
WHERE LOWER(FIRST_NAME) = 'john';
SELECT * FROM EMPLOYEES 
WHERE INITCAP(FIRST_NAME) = 'John';
--�����͸� �Է¹޾� �˻��ϴ°�� ��� �Է����� �� �� ���⶧���� �Է¹��� ������ uppper, lower, initcap�� ����Ѵ� 
-- �̸�(first_name)�� john�� ����� �� ���ΰ�?
select count(*)
 from employees
where first_name = initcap('john')
;
-- 2008�⿡ �Ի��� ����� ���, ����('first_name last_name'), ���޿� ���� ��ȸ
---- ���� ��¿�) 'Steven King'
select employee_id, first_name||' '||last_name name, salary
 from employees
where hire_date between to_date('08-01-01','yy-mm-dd') and to_date('09-01-01','yy-mm-dd')
;
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME AS NAME, SALARY,
       HIRE_DATE
  FROM EMPLOYEES
 WHERE TO_CHAR(HIRE_DATE, 'YYYY') = '2008'
 ORDER BY HIRE_DATE                    
;
-- ���޿��� 20000~30000 ������ ���� ���, ����(last_name first_name), ���޿� ���� ��ȸ
select employee_id,  first_name||' '||last_name name, salary
 from employees
where salary between 20000 and 30000
;
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME AS NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 20000 AND SALARY <= 30000
;
-- ������ID(MANAGER_ID)�� ���� ��� ���� ��ȸ
select *
 from employees
where manager_id is null
;
-- ����(job_id)�ڵ� 'IT_PROG'���� ���� ���� ���޿��� ��
select max(salary) max_salary
 from employees
where job_id = 'IT_PROG'
;
-- ������ �ִ� ���޿� �˻�
select job_id from employees; --�����˻� 
select job_id , max(salary) Max_salary
 from employees 
group by job_id
;
SELECT JOB_ID, COUNT(*), SUM(SALARY), AVG(SALARY), MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID
;
-- ������ �ִ� ���޿� �˻��ϰ�, �ִ� ���޿��� 10000�̻��� ���� ��ȸ
select job_id , max(salary) max_salary
 from employees 
group by job_id
having max(salary) >= 10000
;
SELECT JOB_ID, MAX(SALARY)
--SELECT EMPLOYEE_ID, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 10000 --10000 �̻� �޴� ����鸸 �������
 GROUP BY JOB_ID
;
-- ������ ��ձ޿� �̻��� ���� ��ȸ
--������ ��� �޿� 
select job_id, avg(salary)
 from employees
group by job_id
;
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY
FROM EMPLOYEES E
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES
                 WHERE JOB_ID = E.JOB_ID)
;
--����������� 
select E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY,
       J.JOB_ID J_JOB_ID, J.AVG_SALARY
 from employees e
    inner join (select job_id ,avg(salary) avg_salary from employees group by job_id) j
   on e.job_id = j.job_id
 where e.salary >= j.avg_salary
 order by e.job_id,salary
;



