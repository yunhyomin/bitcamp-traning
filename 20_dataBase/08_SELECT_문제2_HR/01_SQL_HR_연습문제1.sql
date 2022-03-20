/* ***** HR DB ������ ��ȸ �ǽ� *****************
��1 HR �μ����� ���� �� ������ �޿� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
  �������(Employees) ���̺��� �޿��� $7,000~$10,000 ���� �̿��� ����� 
  �̸��� ��(Name���� ��Ī) �� �޿��� �޿��� ���� ������ ����Ͻÿ�
*/
select first_name||' '||last_name Name, salary
 from employees 
where salary not between 7000 and 10000
order by salary
;
select first_name||' '||last_name Name, salary
 from employees 
where not (salary between 7000 and 10000)
order by salary
;
select first_name||' '||last_name Name, salary
 from employees
where salary <7000 or salary>10000
order by salary
;
/*
��2 HR �μ������� �޿�(salary)�� ������(commission_pct)�� ���� ���� ������ �ۼ��Ϸ��� �Ѵ�. 
  ������ �޴� ��� ����� �̸��� ��(Name���� ��Ī), �޿�, ����, �������� ����Ͻÿ�. 
  �̶� �޿��� ū ������� �����ϵ�, �޿��� ������ �������� ū ������� �����Ͻÿ�
*/
select * from employees; 
select employee_id, first_name||' '||last_name name, salary, job_id, commission_pct
  from employees 
 where commission_pct is not null
 order by salary desc , commission_pct desc
;
/*  
��3 �̹� �б⿡ 60�� IT �μ������� �ű� ���α׷��� �����ϰ� �����Ͽ� ȸ�翡 �����Ͽ���. 
  �̿� �ش� �μ��� ��� �޿��� 12.3% �λ��ϱ�� �Ͽ���. 
  60�� IT �μ� ����� �޿��� 12.3% �λ��Ͽ� ������(�ݿø�) ǥ���ϴ� ������ �ۼ��Ͻÿ�. 
  ������ �����ȣ, ���� �̸�(Name���� ��Ī), �޿�, �λ�� �޿�(Increase Salary�� ��Ī)������ ����Ͻÿ�
*/  
select employee_id, first_name||' '||last_name name, salary,
        round(salary * 1.123) "Increase Salary",
        round(salary + (salary * 0.123)) " �̷��Ե� ���� ",
        round(salary * 0.123) "�λ�� �޿�"
  from employees
 where department_id = 60
;
/*
��4 �� ����� ��(last_name)�� 's'�� ������ ����� �̸��� ������ �Ʒ��� ���� ���� ����ϰ��� �Ѵ�. 
  ��� �� �̸�(first_name)�� ��(last_name)�� ù ���ڰ� �빮��, ������ ��� �빮�ڷ� ����ϰ� 
  �Ӹ���(��ȸ�÷���)�� Employee JOBs.�� ǥ���Ͻÿ�
  ��) FIRST_NAME  LAST_NAME  Employee JOBs.
      Shelley     Higgins    AC_MGR
*/
select initcap(first_name) first_name, 
       initcap(last_name) last_name, 
       upper(job_id) "Employee JOBs."
  from employees
 where  lower(last_name) like '%s'
;
/*
��5 ��� ����� ������ ǥ���ϴ� ������ �ۼ��Ϸ��� �Ѵ�. 
  ������ ����� �̸��� ��(Name���� ��Ī), �޿�, ���翩�ο� ���� ������ �����Ͽ� ����Ͻÿ�. 
  ���翩�δ� ������ ������ "Salary + Commission", ������ ������ "Salary only"��� ǥ���ϰ�, 
  ��Ī�� ������ ���̽ÿ�. ���� ��� �� ������ ���� ������ �����Ͻÿ�
*/
select employee_id,
       first_name||' '||last_name name, 
       salary, commission_pct,
       decode ( commission_pct , null, 'salary only','Salary+Commission')
       as commission_yn,
       salary*( 1 + nvl(commission_pct,0))*12 as salary12
  from employees 
 order by 6 desc
;
select commission_pct, nvl(commision_pct,0) from employees;

/*
��6 �� ����� �Ҽӵ� �μ����� �޿� �հ�, �޿� ���, �޿� �ִ�, �޿� �ּڰ��� �����ϰ��� �Ѵ�. 
  ���� ��°��� ���� �ڸ��� �� �ڸ� ���б�ȣ, $ǥ�ÿ� �Բ� ���($123,456) 
  ��, �μ��� �Ҽӵ��� ���� ����� ���� ������ �����ϰ�, ��� �� �Ӹ����� ��Ī(alias) ó���Ͻÿ�
*/    
select department_id,
        to_char(sum(salary),'$999,999')sum_salary, 
        to_char(avg(salary),'$999,999')avg_salary,
        to_char(max(salary),'$999,999')max_salary,
        to_char(min(salary),'$999,999')min_salary
  from employees
 where department_id is not null
 group by department_id
;
/*
��7 ������� ������ ��ü �޿� ����� $10,000���� ū ��츦 ��ȸ�Ͽ� 
    ������ �޿� ����� ����Ͻÿ�. 
  �� ������ CLERK�� ���Ե� ���� �����ϰ� ��ü �޿� ����� ���� ������� ����Ͻÿ�
*/
--���� (JOB_ID)�� CLERK�� ���Ե� ����Ȯ�� 
select distinct job_id --distinct : �ߺ��� �����ϰ� �ϳ��� ǥ��
  from employees
 where upper(job_id) like upper('%clerk%')
;
select job_id
  from employees
 where upper(job_id) like upper('%clerk%')
 group by job_id
;
---------
select job_id,round(avg(salary)) avg_salary
 from employees 
where upper(job_id) not  like upper('%clerk%')
group by job_id
having round(avg(salary)) >  10000 -- alias����
order by avg_salary desc -- alias����
;
/*
��8 HR ��Ű���� �����ϴ� Employees, Departments, Locations ���̺��� ������ �ľ��� �� 
  Oxford�� �ٹ��ϴ� ����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �����̸��� ����Ͻÿ�. 
  �̶� ù ��° ���� ȸ���̸��� 'HR-Company'�̶�� ������� ��µǵ��� �Ͻÿ�
*/
select 'HR-Company' as company_name,
       e.employee_id, e.first_name||' '||e.last_name name, 
       e.job_id, 
       d.department_name,
       l.city 
  from employees e
      inner join departments d on e.department_id = d.department_id
      inner join locations l on d.location_id = l.location_id
 where l.city = 'Oxford'--�ظ��ϸ� 
 order by e.employee_id
;
select  'HR-Company' as company_name,
       e.employee_id, e.first_name||' '||e.last_name name, 
       e.job_id, 
       d.department_name,
       l.city 
  from employees e, departments d, locations l
 where e.department_id = d.department_id and d.location_id = l.location_id
   and l.city = 'Oxford'
 order by e.employee_id
;
--�䰡 �̹� ������� �ִ� 
--HR : emp_details_view ��(view)��� 
select  'HR-Company' as company_name,
       employee_id, first_name||' '||last_name name,
       job_id, 
       department_name,
       city 
  from emp_details_view 
 where city = 'Oxford'
 order by employee_id
;

/*
��9 HR ��Ű���� �ִ� Employees, Departments ���̺��� ������ �ľ��� �� 
  ������� �ټ� �� �̻��� �μ��� �μ��̸��� ��� ���� ����Ͻÿ�. 
  �̶� ��� ���� ���� ������ �����Ͻÿ�
*/
--ansi
select e.department_id, d.department_name, count(*) emp_cnt
  from employees e inner join departments d on e.department_id = d.department_id
 group by e.department_id, d.department_name
having count(*) >= 5
order by 3 desc
;
--oracle
select d.department_name, count(*)
 from employees e , departments d
where e.department_id = d.department_id
group by d.department_name
having count(*) >= 5
order by count(*) desc
;
------�μ��� �ο��� ���ѵ�, �μ����̺� �����ؼ� �μ��� Ȯ�� 
select department_id, count(*) emp_cnt
  from employees
 group by department_id
;
select d.department_name, e.emp_cnt
  from (select department_id, count(*) emp_cnt
          from employees
         group by department_id) e,
         departments d
 where e.department_id = d.department_id
   and emp_cnt >= 5
 order by 2 desc
;
/*
��10 �� ����� �޿��� ���� �޿� ����� �����Ϸ��� �Ѵ�. 
  �޿� ����� Job_Grades ���̺� ǥ�õȴ�. �ش� ���̺��� ������ ���캻 �� 
  ����� �̸��� ��(Name���� ��Ī), ����, �μ��̸�, �Ի���, �޿�, �޿������ ����Ͻÿ�.
  
CREATE TABLE JOB_GRADES (
    GRADE_LEVEL VARCHAR2(3),
    LOWEST_SAL NUMBER,
    HIGHEST_SAL NUMBER
);
INSERT INTO JOB_GRADES VALUES ('A', 1000, 2999);
INSERT INTO JOB_GRADES VALUES ('B', 3000, 5999);
INSERT INTO JOB_GRADES VALUES ('C', 6000, 9999);
INSERT INTO JOB_GRADES VALUES ('D', 10000, 14999);
INSERT INTO JOB_GRADES VALUES ('E', 15000, 24999);
INSERT INTO JOB_GRADES VALUES ('F', 25000, 40000);
COMMIT;
********************************/
select * from job_grades
 where 6500 between lowest_sal and highest_sal;

--JOB_GRADE�� ���ǵ��� ���� ���̺��̹Ƿ� ���������� ���� 
select e.employee_id, e.first_name||' '||e.last_name name,
       e.job_id, d.department_name, e.hire_date, e.salary,
       J.grade_level
  from employees e, job_grades j,departments d 
 where e.department_id = d.department_id
   and e.salary between j.lowest_sal and j.highest_sal
 order by 1
;
--ansi
select e.employee_id, e.first_name||' '||e.last_name name,
       e.job_id, d.department_name, e.hire_date, e.salary,
       J.grade_level
  from employees e inner join departments d on e.department_id = d.department_id, 
       job_grades j
 where e.salary between j.lowest_sal and j.highest_sal
 order by 1
;


            
              

