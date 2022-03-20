/*비교구문 (분기처리) IF문 
IF (조건식) THEN ~ END IF;
IF (조건식) THEN ~ ELSE ~ END IF;
IF (조건식) THEN ~ ELSIF ...ELSIF...ELSE ~ END IF;
***********************/
--홀수, 짝수 판별 
CREATE OR REPLACE PROCEDURE PRC_IF (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  DBMS_OUTPUT.PUT_LINE('>>입력값 : '||IN_NUM);
  
  --홀,짝 판별 
  IF(MOD(IN_NUM,2)=0) THEN 
     DBMS_OUTPUT.PUT_LINE('IN_NUM :'||'짝수');   
  ELSE
     DBMS_OUTPUT.PUT_LINE('IN_NUM :'||'홀수');
  END IF;
END PRC_IF;

--------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_IF2 (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  DBMS_OUTPUR.PUT_LINE('>>입력값 :'||IN_NUM);
  
  --4로 나눈 나머지 값 확인 
  IF ( MOD(IN_NUM,4)=0) THEN
    DBMS_OUTPUT.PUT_LINE('>>4로 나눈나머지 0');
  ELSIF ( MOD(IN_NUM,4)=1) THEN 
    DBMS_OUTPUT.PUT_LINE('>>4로 나눈나머지 1');
  ELSIF ( MOD(IN_NUM,4)=2) THEN 
    DBMS_OUTPUT.PUT_LINE('>>4로 나눈나머지 2');
  ELSE
    DBMS_OUTPUT.PUT_LINE('>>4로 나눈나머지 3');
  END IF;
  
END PRC_IF2;

--===========================================
--반복문 : for, while
--for문 
------for 변수 in 초기값 ....최종값 loop ~ end loop;
------------------
--숫자(n)를 하나 입력받아서 합계를 출력 (1~n 까지의 합)

CREATE OR REPLACE PROCEDURE PRC_FOR_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0; -- 합계 저장변수(초기값 0)
BEGIN
    --입력받은 값 출력 
    DBMS_OUTPUT.PUT_LINE('입력값:'||IN_NUM);
    
    --입력받은 숫자까지의 합계구하기
    -----FOR문으로 반복처리 
    FOR I IN 1 .. IN_NUM LOOP
        V_SUM := V_SUM+I;
        DBMS_OUTPUT.PUT_LINE('>>I :'||I||' 합:'||V_SUM);
    END LOOP;
    DBMS_OUTPUT.PUT('1부터'||IN_NUM||'까지의 합계:');--자바의 print(줄바꿈처리 없음)
    DBMS_OUTPUT.PUT_LINE(V_SUM);--자바의 println(줄바꿈처리)

END PRC_FOR_SUM;

-----------------------------------
--FOR 문 REVERSE 옵션 (역순)
--입력된 값부터 ~ 1까지 
CREATE OR REPLACE PROCEDURE PRC_FOR_REVERSE (
  IN_NUM IN NUMBER 
) AS 
BEGIN
  FOR I IN REVERSE 1..IN_NUM LOOP
    DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;
END PRC_FOR_REVERSE;
--=======================================================
-- WHILE 문
-- WHILE (조건식) LOOP ~ END LOOP;
-----------------
-- 숫자(N)를 하나 입력 받아서 합계 출력(1~N 까지의 합)

CREATE OR REPLACE PROCEDURE PRC_WHILE_SUM (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    I NUMBER := 1;
BEGIN
    --입력값 확인 출력 
    DBMS_OUTPUT.PUT_LINE('입력값 :'||IN_NUM);
    
    WHILE (I <= IN_NUM) LOOP
        V_SUM := V_SUM + I;
        I := I+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1~'||IN_NUM||'까지의 합계:'||V_SUM);
END PRC_WHILE_SUM;
------------------------------------

/* LOOP ~ END LOOP; (자바의 WHILE(TRUE)형태와 유사)
LOOP
    EXIT WHEN (종결조건식);
END LOOP;
***************************************************/
CREATE OR REPLACE PROCEDURE LOOP1 
AS 
    I NUMBER :=1;
BEGIN
  LOOP 
    DBMS_OUTPUT.PUT_LINE('I:'|| I);
    EXIT WHEN (I>=10);
    I:= I+1;
  END LOOP;
END LOOP1;
--===========================================
/* (실습) 숫자를 하나 입력받아서 1~숫자까지의 합계 구하기 
프로시저 명 : PRC_SUM_EVENODD
-- 입력값이 홀수면 홀수값만 더하고 
-- 입력값이 짝수면 짝수값만 더해서 
최종합계값을 화면 출력 
<출력형태>
-- 입력숫자 : 입력값, 홀수/짝수, 합계 : 합계값 
   출력예) 입력숫자 : 4, 짝수, 합계 : 6
*****************************************/
CREATE OR REPLACE PROCEDURE PRC_SUM_EVENODD(
    IN_NUM IN NUMBER 
)
AS
    V_SUM NUMBER := 0;
    I NUMBER := 0;
    V_EVEN_ODD VARCHAR2(6);
BEGIN
   
    WHILE(I <= IN_NUM) LOOP
     IF(MOD(IN_NUM,2)=0) AND (MOD(I,2)=0) THEN -- 짝수일때  
         V_SUM := V_SUM + I;
         I := I + 2;
         V_EVEN_ODD := '짝수';
     ELSIF (MOD(IN_NUM,2)=1) AND (MOD(I,2)=1) THEN  -- 홀수일때 
         V_SUM := V_SUM + I;
         I := I + 2;
         V_EVEN_ODD := '홀수';
     END IF;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('입력숫자:'||IN_NUM||','||V_EVEN_ODD||', '||V_SUM);
END;
------------------------ 
CREATE OR REPLACE PROCEDURE PRC_SUM_EVENODD2 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10);--홀수, 짝수 
    V_MODE NUMBER(1);
BEGIN
    --입력값 홀/짝 판별후 홀수인 경우 홀수합, 짝수인 경우 짝수합 구하기 
    V_MODE := MOD(IN_NUM,2);
    IF (V_MODE = 0) THEN
        V_EVEN_ODD := '짝수';
    ELSE
        V_EVEN_ODD := '홀수';
    END IF;
    
    --홀수합 또는 짝수합 구하기 
    FOR I IN 1.. IN_NUM LOOP
        IF(MOD(I,2)= V_MODE) THEN 
            V_SUM := V_SUM+I;
        
        END IF;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('입력숫자:'||IN_NUM||','||V_EVEN_ODD||', '||V_SUM);
END PRC_SUM_EVENODD2;

-----------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUM_EVENODD3 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10);--홀수, 짝수 
    I NUMBER := 0;
BEGIN
    --입력값 홀/짝 판별후 홀수인 경우 홀수합, 짝수인 경우 짝수합 구하기 
   
    IF (MOD(IN_NUM,2) =0) THEN --짝수
        I := 2; V_EVEN_ODD := '짝수';
    ELSE
        I := 1; V_EVEN_ODD := '홀수';
    END IF;
    --홀수합 또는 짝수합 구하기 
    WHILE (I <= IN_NUM) LOOP
        V_SUM := V_SUM +I;
        I := I+2;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('입력숫자:'||IN_NUM||', '||V_EVEN_ODD||', '||V_SUM);
END PRC_SUM_EVENODD3;
--------------------------------------
create or replace PROCEDURE PRC_SUM_EVENODD4 (
  IN_NUM IN NUMBER 
) AS 
    V_SUM NUMBER := 0;
    V_EVEN_ODD VARCHAR2(10);--홀수, 짝수 
BEGIN
    --입력값 홀/짝 판별후 홀수인 경우 홀수합, 짝수인 경우 짝수합 구하기 
    IF (MOD(IN_NUM,2)=0) THEN
        V_EVEN_ODD := '짝수';
    ELSE
        V_EVEN_ODD := '홀수';
    END IF;
    --홀수합 또는 짝수합 구하기 
    FOR I IN 1.. IN_NUM LOOP
        IF(MOD(I,2)=0 AND V_EVEN_ODD = '짝수') THEN 
            V_SUM := V_SUM+I;
        ELSIF (MOD(I,2)=1 AND V_EVEN_ODD = '홀수')THEN
            V_SUM := V_SUM+I;
        END IF;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('입력숫자:'||IN_NUM||', '||V_EVEN_ODD||', '||V_SUM);
END /*PRC_SUM_EVENODD4*/;





