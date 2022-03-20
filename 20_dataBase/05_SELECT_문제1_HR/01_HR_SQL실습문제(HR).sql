/* ** 실습문제 : HR유저(DB)에서 요구사항 해결 **********
-- 사번(employee_id)이 100인 직원 정보 전체 보기
-- 월급(salary)이 15000 이상인 직원의 모든 정보 보기
-- 월급이 15000 이상인 사원의 사번, 이름(LAST_NAME), 입사일(hire_date), 월급여 정보 보기
-- 월급이 10000 이하인 사원의 사번, 이름(LAST_NAME), 입사일, 월급여 정보 보기
---- (급여가 많은 사람부터)
-- 이름(first_name)이 john인 사원의 모든 정보 조회
-- 이름(first_name)이 john인 사원은 몇 명인가?
-- 2008년에 입사한 사원의 사번, 성명('first_name last_name'), 월급여 정보 조회
---- 성명 출력예) 'Steven King'
-- 월급여가 20000~30000 구간인 직원 사번, 성명(last_name first_name), 월급여 정보 조회
-- 관리자ID(MANAGER_ID)가 없는 사람 정보 조회
-- 직종(job_id)코드 'IT_PROG'에서 가장 많은 월급여는 얼마
-- 직종별 최대 월급여 검색
-- 직종별 최대 월급여 검색하고, 최대 월급여가 10000이상인 직종 조회
-- 직종별 평균급여 이상인 직원 조회
**********************************************************/
-- 사번(employee_id)이 100인 직원 정보 전체 보기
select *
 from employees
where employee_id =100
 ;
-- 월급(salary)이 15000 이상인 직원의 모든 정보 보기
select *
 from employees
where salary >=15000
;
-- 월급이 15000 이상인 사원의 사번, 이름(LAST_NAME), 입사일(hire_date), 월급여 정보 보기
select employee_id, last_name, hire_date,salary
 from employees
where salary >=15000
;
-- 월급이 10000 이하인 사원의 사번, 이름(LAST_NAME), 입사일, 월급여 정보 보기
---- (급여가 많은 사람부터)
select employee_id, last_name, hire_date,salary
 from employees
where salary <=10000
order by salary desc
;
-- 이름(first_name)이 john인 사원의 모든 정보 조회
---- JOHN, John, john, jOHn...
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'John';
SELECT * FROM EMPLOYEES 
WHERE FIRST_NAME = INITCAP('john'); --표준화가 되어 있는 경우

SELECT * FROM EMPLOYEES 
WHERE UPPER(FIRST_NAME) = 'JOHN'; --데이터가 표준화 되지 않은 경우
SELECT * FROM EMPLOYEES 
WHERE LOWER(FIRST_NAME) = 'john';
SELECT * FROM EMPLOYEES 
WHERE INITCAP(FIRST_NAME) = 'John';
--데이터를 입력받아 검색하는경우 어떻게 입력할지 알 수 없기때문에 입력받은 값에도 uppper, lower, initcap을 사용한다 
-- 이름(first_name)이 john인 사원은 몇 명인가?
select count(*)
 from employees
where first_name = initcap('john')
;
-- 2008년에 입사한 사원의 사번, 성명('first_name last_name'), 월급여 정보 조회
---- 성명 출력예) 'Steven King'
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
-- 월급여가 20000~30000 구간인 직원 사번, 성명(last_name first_name), 월급여 정보 조회
select employee_id,  first_name||' '||last_name name, salary
 from employees
where salary between 20000 and 30000
;
SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME AS NAME, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 20000 AND SALARY <= 30000
;
-- 관리자ID(MANAGER_ID)가 없는 사람 정보 조회
select *
 from employees
where manager_id is null
;
-- 직종(job_id)코드 'IT_PROG'에서 가장 많은 월급여는 얼마
select max(salary) max_salary
 from employees
where job_id = 'IT_PROG'
;
-- 직종별 최대 월급여 검색
select job_id from employees; --직종검색 
select job_id , max(salary) Max_salary
 from employees 
group by job_id
;
SELECT JOB_ID, COUNT(*), SUM(SALARY), AVG(SALARY), MAX(SALARY), MIN(SALARY)
  FROM EMPLOYEES
 GROUP BY JOB_ID
;
-- 직종별 최대 월급여 검색하고, 최대 월급여가 10000이상인 직종 조회
select job_id , max(salary) max_salary
 from employees 
group by job_id
having max(salary) >= 10000
;
SELECT JOB_ID, MAX(SALARY)
--SELECT EMPLOYEE_ID, JOB_ID, SALARY
  FROM EMPLOYEES
 WHERE SALARY >= 10000 --10000 이상 받는 사람들만 대상으로
 GROUP BY JOB_ID
;
-- 직종별 평균급여 이상인 직원 조회
--직종별 평균 급여 
select job_id, avg(salary)
 from employees
group by job_id
;
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY
FROM EMPLOYEES E
WHERE SALARY >= (SELECT AVG(SALARY) FROM EMPLOYEES
                 WHERE JOB_ID = E.JOB_ID)
;
--상관서브쿼리 
select E.EMPLOYEE_ID, E.FIRST_NAME, E.JOB_ID, E.SALARY,
       J.JOB_ID J_JOB_ID, J.AVG_SALARY
 from employees e
    inner join (select job_id ,avg(salary) avg_salary from employees group by job_id) j
   on e.job_id = j.job_id
 where e.salary >= j.avg_salary
 order by e.job_id,salary
;



