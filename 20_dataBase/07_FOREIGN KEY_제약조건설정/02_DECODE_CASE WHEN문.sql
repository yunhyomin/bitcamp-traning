/* DECODE, CASE WHEN : SQL문 내에서 IF문 구현(CASE : 표준SQL)
DECODE : 동등비교만 가능(동일 데이터 확인) : 자바의 if-else 구문과 같다 
DECODE(대상, 비교값, 같을때 처리문, 다를때 처리문);
DECODE(대상, 비교값, DECODE(), DECODE());
DECODE(대상, 비교값1, 처리문1
          , 비교값2, 처리문2
          , ...
          , 비교값n, 처리문n
          , 처리문n+1)
**************************************/
select * from customer order by name;
--if문장만있는 케이스 else부분이 입력되지 않았으므로 null처리 
select name, decode(name, '김연아','야~김연아다!!!')
 from customer order by name;
--if-else문장 
select name, decode(name, '김연아','야~김연아다!!!','그냥사람')
 from customer order by name;

--이름이 박지성이면 '축구선수' 아니면 '운동선수'
select name, decode(name, '박지성','축구선수','운동선수')
 from customer order by name;
--이름이 김연아면 '피겨스테이팅', 박세리면 '골츠', 박지성이면 '축구'
---나머지 '운동선수'
select name, 
        decode(name, '김연아','피겨스테이팅',
                     '박세리','골프',
                     '박지성','축구',
                     '운동선수') name_decode
from customer 
order by name;
-------------------------
--decode 문장 안에 decode문 사용 
--DECODE(대상, 비교값, DECODE(), DECODE());
select name,
        decode(name, '김연아','피겨스케이팅',
            decode(name, '박세리','골프',
                 decode(name, '박지성','축구선수',
                   '운동선수')
            )
        )as "운동"
 from customer
order by name;
    
--===============================================
/***** CASE WHEN 문 ************
형태1 : SWITCH CASE처럼(DECODE문 처럼)
CASE 컬럼(기준값)
     WHEN 비교값1 THEN 일치하면 처리할 구문
     WHEN 비교값2 THEN 일치하면 처리할 구문
     ...
     WHEN 비교값n THEN 일치하면 처리할 구문
     ELSE 위에 일치하는 경우가 없으면 실행할 구문
END
--------
형태2 : IF THEN ELSE 처럼 사용(부등비교 처리 가능)**********decode와 차이점***********
--CASE문 내의 처리문장에는 CASE중복 사용 가능
--비교구문 : =, <>, !=, >, <, >=, <=, AND, OR, NOT 사용가능
CASE WHEN 비교구문
     THEN 비교구문 결과 TRUE인 경우 처리구문
     ELSE 비교구문 결과 FALSE인 경우 처리구문
END   
------
CASE WHEN 비교구문(예: KOR > 90)
     THEN (CASE WHEN THEN (CASE WHEN THEN ELSE END) 
                     ELSE (CASE WHEN THEN ELSE END)
           END)
     ELSE (CASE WHEN THEN (CASE WHEN THEN ELSE END) 
                     ELSE (CASE WHEN THEN ELSE END)
           END)
END   
-----
CASE WHEN 비교구문 THEN 처리구문
     WHEN 비교구문 THEN 처리구문
     ....
     ELSE 위의 비교구문에 해당되지 않는 경우 처리구문
END 
***************************/
select * from customer order by name;
--이름이 박지성이면 '축구선수' 아니면 '운동선수'
select name, 
        case name when '박지성' 
            then '축구선수' 
            else'운동선수' 
        end
 from customer 
order by name;
--------------------
--이름 김연아:피겨스케이팅, 박세리:골프, 박지성:축구선수, 나머지:운동선수
select name,
        case name 
            when '김연아' then '피겨스케이팅' 
            when '박세리' then '골프'
            when '박지성' then '축구선수'
            else '운동선수'
        end  name_case
 from customer 
order by name;
---------------------
--가격(price)이 10000 미만이면 '싸다', 10000-20000 : 적당하다
--20000보다 크면 '비싸다', 30000보다 크면 '너무비싸다'
select * from book;
select b.*,
        case when price< 10000 then '싸다' else
             case when price <= 20000 then '적당하다' else
                case when price <=30000 then '비싸다' 
                        else '너무비싸다'   
                end
             end
        end as "가격평가"
 from book b
order by price;
-------------------------
--좀 더 심플하게 
select b.*,
    case when price < 10000 then '싸다'
        when price <= 20000 then '적당하다'
        when price <= 30000 then '비싸다'
        else '너무비싸다'
    end as"평가"
 from book b
order by price;







