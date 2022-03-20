/***************************
     UNION, UNION ALL : 합집합 처리 
--UNION : 중복데이터를 제외하고 합해줌 (중복데이터는 1개만 표시)
--UNION ALL : 중복데이터를 포함해서 합해줌(중복데이터 모두 사용)
단, 조회하는 컬럼의 이름, 순서, 숫자, 타입이 일치되도록 작성
****************************/
--UNION 사용 
select custid, name from customer where custid in(1,2,3);
select custid, name from customer where custid in(3,4,5);

--UNION으로 합하기 : 중복데이터는 하나만 
select custid, name from customer where custid in(1,2,3)
union
select custid, name from customer where custid in(3,4,5)
;

--UNION ALL로 합하기 : 중복데이터도 모두 사용 
select custid, name from customer where custid in(1,2,3)
union all
select custid, name from customer where custid in(3,4,5)
order by name --order by 절은 마지막에 작성(1번만)
;
------------------------------
--MINUS : 차집합 처리(빼기 연산)
select custid, name from customer where custid in(1,2,3)
minus
select custid, name from customer where custid in(3,4,5)
;
-------------------------------
--INTERSECT : 교집합(중복데이터 조회) - 조인문의 동등비교 경과와 동일 
select custid, name from customer where custid in(1,2,3)
intersect
select custid, name from customer where custid in(3,4,5)
;
----조인문(join문)
select *
 from (select custid, name from customer where custid in(1,2,3)) a
      inner join (select custid, name from customer where custid in(3,4,5)) b
   on a.custid = b.custid
;
select *
 from (select custid, name from customer where custid in(1,2,3)) a,
      (select custid, name from customer where custid in(3,4,5)) b
   where a.custid = b.custid
;      











