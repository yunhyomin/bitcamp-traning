/************************************************
형변환 내장함수
TO_CHAR : 문자타입으로 전환(날짜 -> 문자, 숫자 -> 문자)
TO_NUMBER : 숫자타입으로 전환(문자 -> 숫자)
TO_DATE : 날짜타입으로 전환(문자 -> 날짜)

      <- TO_NUMBER(문자)  -> TO_DATE(문자)
숫자형   ----    문자형   ----     날짜형
      -> TO_CHAR(숫자)   <- TO_CHAR(날짜)
************************************************
--날짜 -> 문자
TO_CHAR(날짜데이터, '출력형식')
<출력형식>
년도(YYYY, YY), 월(MM), 일(DD)
시간 : HH, HH12(12 시간제), HH24(24 시간제)
분(MI), 초(SS)
오전, 오후: AM, PM
년월일시분초 작성예) YYYY-MM-DD HH24:MI:SS
************************************************/
--TO_CHAR : 문자타입으로 전환(날짜 -> 문자, 숫자 -> 문자)
--TO_NUMBER : 숫자타입으로 전환(문자 -> 숫자)
--TO_DATE : 날짜타입으로 전환(문자 -> 날짜)
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD DAY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD DY') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD(DY)') FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD HH12:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD AM HH12:MI:SS') FROM DUAL;
SELECT SYSDATE, TO_CHAR(SYSDATE,'YYYY-MM-DD PM HH12:MI:SS') FROM DUAL;

SELECT 123000, TO_CHAR(123000) FROM DUAL; --CHAR타입은 왼쪽정렬 NUMBER는 오른쪽 정렬
SELECT '123000', TO_NUMBER('123000') FROM DUAL;

--묵시적 형변환 처리 : 문자타입이 숫자연산에 참여할 때 숫자타입으로 형변환 처리된다.
SELECT 123000 + 10, TO_CHAR(123000)+10,--가능 : 오라클만의 특성(숫자로 형변환이 가능하다면 수에는 유하다)
    '123000'+10, TO_NUMBER('123000')+10
FROM DUAL;

--==============================
/* TO_CHAR(숫자, '출력형식') : 숫자 -> 문자타입
<형식지정>
0(영) : 자리수를 나타내며, 자리수가 맞지 않는 경우 0을 표시
9(구) : 자리수를 나타내며, 자리수가 맞지 않는 경우 표시하지 않음
L : 지역 통화 문자 표시
.(점) : 소수점
,(콤마) : 1000단위 구분 표시 문자
**************************************/
--------------------
-- L=0과 9로만 상용가능 . 다른수들은 에러 
--0은 전부 표시 숫자가 없다면 문자0으로 출력 
--9는 있는 숫자만 문자로 출력 
SELECT TO_CHAR(123456, 'L999,999,999'), TO_CHAR(123456, 'L000,000,000')
FROM DUAL;
SELECT TO_CHAR(0, 'L999,999,999'), TO_CHAR(0, 'L000,000,000')
FROM DUAL;
SELECT TO_CHAR(1230.5, 'L999,999,999'), TO_CHAR(1230.5, 'L000,000,000')--반올림 자동 
FROM DUAL;
SELECT TO_CHAR(1230.5555, 'L999,999.999'), TO_CHAR(1230.5555, 'L000,000.000')
FROM DUAL;
SELECT TO_CHAR(1230, 'L999,999.99'), TO_CHAR(1230, 'L000,000.00')
FROM DUAL;

--------------------
SELECT '현재날짜시간', SYSDATE FROM DUAL;

--TO_DATE : 날짜타입으로 전환(문자 -> 날짜)
SELECT '2021-08-10', SYSDATE FROM DUAL;
SELECT  SYSDATE+1 FROM DUAL;
SELECT '2021-08-10'+1 FROM DUAL;--에러 : ORA-01722: invalid number
SELECT TO_DATE('2021-08-10', 'YYYY-MM-DD') +1 FROM DUAL;--가능
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE + (1/24)*3, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE + 1/1440, 'YYYY-MM-DD HH24:MI:SS') FROM DUAL; -- 1 mi

SELECT TRUNC(SYSDATE), TO_CHAR(TRUNC(SYSDATE), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
-- 시분초는 제거됨 트렁크 처리 하면.
SELECT TO_CHAR(ROUND(SYSDATE), 'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
-- 오후 지나면 날 반올림 됨. 하루 지나감.










