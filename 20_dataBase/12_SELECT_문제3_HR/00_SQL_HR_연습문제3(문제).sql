/****** HR 데이타 조회 문제2 ****************
/*1■ HR 부서의 어떤 사원은 급여정보를 조회하는 업무를 맡고 있다. 
  Tucker 사원 보다 급여를 많이 받고 있는 사원의 
  이름과 성(Name으로 별칭), 업무, 급여를 출력하시오
*****************************************************/
SELECT* FROM EMPLOYEES where LAST_NAME = 'Tucker';
SELECT* FROM EMPLOYEES where FIRST_NAME||' '||LAST_NAME LIKE '%Tucker%';

SELECT FIRST_NAME||' '||LAST_NAME NAME, JOB_ID, SALARY 
  FROM EMPLOYEES 
 WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME = 'Tucker')
;

/*2■ 사원의 급여 정보 중 업무별 최소 급여를 받고 있는 사원의 
  이름과 성(Name으로별칭), 업무, 급여, 입사일을 출력하시오
********************************************************/ 
--업무별 최소급여 
SELECT JOB_ID, MIN(SALARY) MIN_SALARY 
  FROM EMPLOYEES 
 GROUP BY JOB_ID 
 ORDER BY MIN_SALARY
;
--EMPLOYEES 와 서브쿼리를 조인한다 ->효율성면에서 좋다 !!
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME,E.JOB_ID, E.SALARY, E.HIRE_DATE 
      --,M.JOB_ID AS M_JOB_ID, M.MIN_SALARY
  FROM EMPLOYEES E INNER JOIN (SELECT JOB_ID, MIN(SALARY) MIN_SALARY FROM EMPLOYEES GROUP BY JOB_ID) M
    ON E.JOB_ID = M.JOB_ID -- 조인조건 
 WHERE E.SALARY = M.MIN_SALARY --검색조건
 ORDER BY JOB_ID
;
-------------------
--상관서브쿼리
--서브쿼리를 WHERE 절에 사용 
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME,E.JOB_ID, E.SALARY, E.HIRE_DATE
  FROM EMPLOYEES E
 WHERE SALARY IN (SELECT MIN(SALARY) MIN_SALARY FROM EMPLOYEES GROUP BY JOB_ID/*WHERE JOB_ID=E.JOB_ID*/)
 ORDER BY SALARY
;

/*3■ 소속 부서의 평균 급여보다 많은 급여를 받는 사원의 
  이름과 성(Name으로 별칭), 급여, 부서번호, 업무를 출력하시오
***********************************************************/
SELECT * FROM DEPARTMENTS ORDER BY DEPARTMENT_ID; 

-- 부서별 평균금액 
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) AVG_SALARY
  FROM EMPLOYEES  
 GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID
;
--서브쿼리를 FROM절에 사용(조인)
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME, JOB_ID, E.DEPARTMENT_ID, E.SALARY
      -- ,D.DEPARTMENT_ID
         ,D.AVG_SALARY
  FROM EMPLOYEES E,
        (SELECT DEPARTMENT_ID,ROUND(AVG(SALARY)) AVG_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID) D
 WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID --조인조건(같은부서)
   AND E.SALARY > D.AVG_SALARY
 ORDER BY E.DEPARTMENT_ID
;
--값 검증 : DEPARTMENT_ID(부서번호)가 30인 사원 조회 
SELECT  E.FIRST_NAME||' '||E.LAST_NAME NAME, JOB_ID, E.DEPARTMENT_ID, E.SALARY 
  FROM EMPLOYEES E
 WHERE DEPARTMENT_ID = 30
 ORDER BY SALARY
;
--------------
--상관서브쿼리 : where절에 서브쿼리 사용 
SELECT E.FIRST_NAME||' '||E.LAST_NAME NAME, E.JOB_ID, E.DEPARTMENT_ID, E.SALARY
  FROM EMPLOYEES E
 WHERE SALARY > (SELECT ROUND(AVG(SALARY)) AVG_SALARY
                     FROM EMPLOYEES WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) 
 ORDER BY DEPARTMENT_ID, SALARY
;
/*4■ 모든 사원의 소속부서 평균연봉을 계산하여 사원별로 이름과 성(Name으로 별칭),
  업무, 급여, 부서번호, 부서평균연봉(Department Avg Salary로 별칭)을 출력하시오
***************************************************************/
--부서별 평균연봉 
select department_id, round(avg(salary*(1+nvl(commission_pct,0))))
       , round(avg(salary*(1+nvl(commission_pct,0)))*12)
  from employees
 group by department_id
 order by 1
;
--조인 방식으로 조회 

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
-- 상관서브쿼리 : select 절에 서브쿼리 사용( 값비교가 필요없기때문에 )
select e.first_name||' '||e.last_name name, e.job_id, e.salary, e.department_id
       , (select round(avg(salary))*12 from employees 
           where department_id = e.department_id) as "Department Avg Salary"
  from employees e 
 order by department_id, salary
;
  
/*5■ HR 스키마에 있는 Job_history 테이블은 사원들의 업무 변경 이력을 나타내는 테이블이다. 
  이 정보를 이용하여 모든 사원의 현재 및 이전의 업무 이력 정보를 출력하고자 한다. 
  중복된 사원정보가 있으면 한 번만 표시하여 출력하시오
  (사원번호, 업무)
*********************************************************************/
--union 사용: 컬럼명, 타입, 갯수, 순서가 일치 , order by 절은 맨 마지막에 작성 
select employee_id, job_id from employees
union
select employee_id, job_id from job_history
order by employee_id, job_id
;
--union all 사용: 컬럼명, 타입, 갯수, 순서가 일치 , order by 절은 맨 마지막에 작성 
select employee_id, job_id from employees
union all
select employee_id, job_id from job_history
order by employee_id, job_id
;

/*6■ 위 문제에서 각 사원의 업무 이력 정보를 확인하였다. 하지만 '모든 사원의
  업무 이력 전체'를 보지는 못했다. 여기에서는 모든 사원의 
  업무 이력 변경 정보(JOB_HISTORY) 및 업무변경에 따른 부서정보를 
  사원번호가 빠른 순서대로 출력하시오(집합연산자 UNION)
  (사원번호, 부서정보, 업무)
**********************************************************************/
  select employee_id, department_id, job_id from employees
  union all
  select employee_id, department_id, job_id from job_history
  order by employee_id, job_id;

/*7■ HR 부서에서는 신규 프로젝트를 성공으로 이끈 해당 업무자들의 
  급여를 인상 하기로 결정하였다. 
  사원은 현재 107명이며 19개의 업무에 소속되어 근무 중이다. 
  급여 인상 대상자는 회사의 업무(Distinct job_id) 중 다음 5개 업무에서 
  일하는 사원에 해당된다. 나머지 업무에 대해서는 급여가 동결된다. 
  5개 업무의 급여 인상안은 다음과 같다.
  HR_REP(10%), MK_REP(12%), PR_REP(15%), SA_REP(18%), IT_PROG(20%)
**********************************************************************/
--CASE WHEN 동등비교 
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
--순수인상금액 확인
select first_name||' '||last_name name,job_id, salary,
       case job_id 
            when 'HR_REP' then salary*0.1
            when 'MK_REP' then salary*0.12
            when 'PR_REP' then salary*0.15
            when 'SA_REP' then salary*0.18
            when 'IT_PROG' then salary*0.2
            else 0       
       end "순수인상금액"
  from employees
 order by job_id
;
------------
--DECODE 동등비교사용
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
--급여인상률 
select distinct job_id, decode(job_id,'HR_REP','10%'
                                     ,'MK_REP','12%'
                                     ,'PR_REP','15%'
                                     ,'SA_REP','18%'
                                     ,'IT_PROG','20%') "increace pct"
  from employees
 where job_id in('HR_REP','MK_REP','PR_REP','SA_REP','IT_PROG')
 order by 2
;
/*8■ HR 부서에서는 최상위 입사일에 해당하는 2001년부터 2003년까지 입사자들의 급여를 
  각각 5%, 3%, 1% 인상하여 지분에 따른 배당금으로 지급하고자 한다. 
  전체 사원들 중 해당 년도에 해당하는 사원들의 급여를 검색하여 적용하고, 
  입사일자에 따른 오름차순 정렬을 수행하시오
**********************************************************************/
select min(hire_date) from employees;-- 01/01/13
--2001년이전 입사자가 없다는 전제하에 
--CASE WHEN 부등비교로 조회
select employee_id,first_name||' '||last_name name, hire_date, salary
       ,case when hire_date < to_date('2002-01-01','yyyy-mm-dd')
             then round(salary*1.05)
             when hire_date < to_date('2003-01-01','yyyy-mm-dd')
             then round(salary*1.03)
             when hire_date < to_date('2004-01-01','yyyy-mm-dd')
             then round(salary*1.01)
             else 0
        end "배당금"
  from employees
 where hire_date between to_date('010101','yy-mm-dd') and to_date('031231','yy-mm-dd')
 order by hire_date
;
--입사일의 년도 (yyyy)기준으로 
select employee_id,first_name||' '||last_name name, hire_date, salary
       ,case to_char(hire_date,'yyyy') 
            when '2001' then round(salary*1.05)
            when '2002' then round(salary*1.03)
            when '2003' then round(salary*1.01)
            else 0
        end as "배당금"                               
  from employees
 where to_char(hire_date,'yyyy') in ('2001','2002','2003')
 order by hire_date
;
-------
--decode 문
select employee_id,first_name||' '||last_name name, hire_date, salary
       , decode( to_char(hire_date,'yyyy') 
           , '2001' , round(salary*1.05)
           , '2002' , round(salary*1.03)
           , '2003' , round(salary*1.01)
           , 0
        ) as "배당금"                               
  from employees
 where to_char(hire_date,'yyyy') in ('2001','2002','2003')
 order by hire_date
;
--2001 ~ 2003 년까지의 입사자 
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
 
/*9■ 부서별 급여 합계를 구하고, 그 결과를 다음과 같이 표현하시오.
  Sum Salary > 100000 이면, "Excellent"
  Sum Salary > 50000 이면, "Good"
  Sum Salary > 10000 이면, "Medium"
  Sum Salary <= 10000 이면, "Well"
**********************************************************************/
-- 부서별 급여 합계 
select department_id, sum(salary) sum_salary
 from employees
 group by department_id
 order by 1
;
-----------
--from절에 서브쿼리 사용해서 비교평가 
select department_id, e.sum_salary
        ,case when e.sum_salary > 100000 then 'Excellent'
              when e.sum_salary > 50000 then 'Good'
              when e.sum_salary > 10000 then 'Medium'
               when e.sum_salary <= 10000 then 'well'
         end as "급여 평가"
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
         end as "급여 평가"
  from employees 
  where department_id is not null
  group by department_id
  order by sum_salary
;

/*10■ 2005년 이전에 입사한 사원 중 업무에 "MGR"이 포함된 사원은 15%, 
  "MAN"이 포함된 사원은 20% 급여를 인상한다. 
  또한 2005년부터 근무를 시작한 사원 중 "MGR"이 포함된 사원은 25% 급여를 인상한다. 
  이를 수행하는 쿼리를 작성하시오
**********************************************************************/
--case when 이용해서 조회 
select distinct job_id from employees 
 where job_id like '%MGR%' or job_id like '%MAN%'
;
select employee_id, first_name||' '||last_name name,
       job_id, hire_date, salary,
       --2005년 이전입사이고, MGR :  15%인상 or MAN :  20%인상
       case when to_char(hire_date, 'yyyy') < '2005'
            then case when job_id like '%MGR%' then round(salary*1.15)
                      when job_id like '%MAN%' then round(salary*1.2)
                      else salary
                 end
            --2005년부터 근무 하고, MGR : 25%인상
            else case when job_id like '%MGR%' then round(salary*1.25)
                      else salary
                 end
       end as "변경된 급여"
  from employees
;
---------------------
select job_id, substr(job_id, -3) from employees
where substr(job_id,-3) in ('MGR','MAN');
-----------
select employee_id, first_name||' '||last_name name,
       job_id, hire_date, salary,
       --2005년 이전입사이고, MGR :  15%인상 or MAN :  20%인상
       case when to_char(hire_date, 'YYYY') < '2005'
            then decode (substr(job_id,-3)
                        ,'MGR',round(salary*1.15)
                        ,'MAN',round(salary*1.20)
                        ,salary)
            --2005년부터 근무하고 직무에 MGR잇으면 25%인상 
            else decode(substr(job_id,-3)
                            ,'MGR',round(salary*1.25)
                            ,salary)
       end "변경된 급여"
from employees
order by hire_date
;
--2005년 전에 입사한 사원 조회 
select e.*, case when job_id like '%MGR%' then round(salary*1.15)
                          when job_id like '%MAN%'then round(salary*1.2)
                          else salary
                    end as "increase_salary"                    
  from employees e
 where hire_date < to_date('20050101','yyyy-mm-dd')
 order by hire_date
;
/*11■ 월별로 입사한 사원 수 출력
  (방식1) 월별로 입사한 사원 수가 아래와 같이 각 행별로 출력되도록 하시오(12행).
  1월 xx
  2월 xx
  3월 xx
  ..
  12월 xx
  합계 XXX
**********************************************************************/  
select hire_date, to_char(hire_date, 'mm') from employees;
select to_char(hire_date,'mm') as "월"
        ,count(*) as "인원수"
  from employees
 group by to_char(hire_date,'mm')
union
select '합계' as "월"
        ,count(*) as "인원수"
  from employees
;
---------
select to_number(to_char(hire_date,'mm')) as "월"
        ,count(*) as "인원수"
  from employees
 group by to_char(hire_date,'mm')
 order by 1
union
--인원수의 합을 구하기위해 union처리 
select 99 as "월"
        ,count(*) as "인원수"
  from employees
order by 1
;
-----
select decode(mm,99,'합계',mm||'월') "입사월",
        cnt "인원수"
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
/* (방식2) 첫 행에 모든 월별 입사 사원 수가 출력되도록 하시오
  1월 2월 3월 4월 .... 11월 12월
  xx  xx  xx xx  .... xx   xx
**********************************************************************/
select employee_id, hire_date, to_char(hire_date,'mm')
        ,decode (to_char(hire_date,'mm'),'01',1,0) "1월",
  from employees
 order by to_char(hire_date,'mm')
;
--------
select   sum(decode (to_char(hire_date,'mm'),'01',1,0)) "1월"
        ,sum(decode (to_char(hire_date,'mm'),'01',2,0)) "2월"
        ,sum(decode (to_char(hire_date,'mm'),'01',3,0)) "3월"
        ,'...'
        ,sum(decode (to_char(hire_date,'mm'),'12',3,0)) "12월"
        ,count(*) "합계"
  from employees
;






