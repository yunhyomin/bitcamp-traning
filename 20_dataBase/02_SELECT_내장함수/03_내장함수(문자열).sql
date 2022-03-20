/******************************* 
오라클의 내장함수 - 문자열, 숫자, 날짜 관련 함수
<문자열 관련 내장함수>
UPPER : 대문자로 변경
LOWER : 소문자로 변경
INITCAP : 첫 글자만 대문자로 나머지는 소문자
LENGTH : 문자열의 길이(문자단위)
LENGTHB : 문자열의 길이(BYTE 단위)
SUBSTR(대상, 시작위치, 길이) : 문자열의 일부 추출
   (시작위치는 1부터 시작, 오른쪽에서 시작하는 경우 마이너스(-)값 사용)
INSTR(대상, 찾는문자) : 대상문자열에 찾는문자 위치값 리턴
INSTR(대상, 찾는문자, 시작위치)
INSTR(대상, 찾는문자, 시작위치, nth) : nth 찾은값의 순서값(3 : 3번째 찾은 값)
TRIM('문자열') : 양쪽 공백 제거
LTRIM('문자열') : 왼쪽에 있는 공백 제거
RTRIM('문자열') : 오른쪽에 있는 공백 제거
CONCAT(문자열1, 문자열2) : 문자열 연결 - 문자열1 || 문자열2
LPAD(대상문자열, 전체글자수, 삽입될문자) : 왼쪽에 삽입
----제한 수 가득 채우기 pad : 완충제, 빈 곳 채우는것, 완충해주다 
RPAD(대상문자열, 전체글자수, 삽입될문자) : 오른쪽에 삽입
----제한 수 가득 채우기 
REPLACE(대상문자열, 찾을문자, 변경문자) : 문자열에서 찾은문자를 변경
********************************/

--UPPER : 대문자로 변경
--LOWER : 소문자로 변경
--INITCAP : 첫 글자만 대문자로 나머지는 소문자
 SELECT BOOKNAME, UPPER(BOOKNAME) FROM BOOK ORDER BY BOOKNAME;--BOOKNAME을 모두 대문자로 
 SELECT BOOKNAME, LOWER(BOOKNAME) FROM BOOK ORDER BY BOOKNAME;--BOKKNAME을 모두 소문자로 
 SELECT INITCAP ('olympic champions') FROM DUAL;--Olympic Champions
 SELECT INITCAP ('OLYMPIC CHAMPIONS') FROM DUAL;--Olympic Champions
------------
SELECT * FROM BOOK WHERE BOOKNAME = 'Olympic Champions';
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'OLYMPIC%';--조회안됨
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'olympic%';--조회안됨   
SELECT * FROM BOOK WHERE BOOKNAME LIKE 'Olympic%';--조회가능  

--어퍼, 로워, 이니셜캡과의 차이를 보자. 영문자는 모두 대소낙타표기문자화
-- 영문 데이터 조회는 대소문자가 엄격하다. 그걸 처리할 수 있도록 해주는 문법은 아래와 같다.
SELECT BOOKID, BOOKNAME, UPPER(BOOKNAME) FROM BOOK 
WHERE UPPER(BOOKNAME) LIKE 'OLYMPIC%'
ORDER BY BOOKNAME;
-------------------------------------  
--LENGTH : 문자열의 길이(문자단위)
--LENGTHB : 문자열의 길이(BYTE 단위)
SELECT LENGTH ('ABCDE123#$') FROM DUAL; --문자단위  :10 
SELECT LENGTHB('ABCDE123#$') FROM DUAL; --BYTE단위 :10

SELECT LENGTH('홍길동123') FROM DUAL; --문자단위 :6
SELECT LENGTHB('홍길동123') FROM DUAL; --BYTE단위 :12(9+3)

--------------------------------------
--SUBSTR(대상, 시작위치, 길이) : 문자열의 일부 추출
-------   (시작위치는 1부터 시작, 오른쪽(뒤)에서 시작하는 경우 마이너스(-)값 사용)
SELECT SUBSTR('홍길동123', 1) FROM DUAL; --홍길동123 : 갯수가 지정이 되어있지 않으면 끝까지
SELECT SUBSTR('홍길동123456', 4) FROM DUAL; --123456
SELECT SUBSTR('홍길동123', 1,3) FROM DUAL; -- 홍길동 
SELECT SUBSTR('홍길동123', -3) FROM DUAL; --123 : 뒤에서 3개 
SELECT SUBSTR('홍길동123', -3,3) FROM DUAL; --123
SELECT SUBSTR('홍길동123', -3,2) FROM DUAL; --12
SELECT SUBSTR('홍길동123456', -3,3) FROM DUAL; --456

--------------------------------------------
--INSTR(대상, 찾는문자) : 대상문자열에 찾는문자 위치값 리턴
--INSTR(대상, 찾는문자, 시작위치)
--INSTR(대상, 찾는문자, 시작위치, nth) : nth 찾은값의 순서값(3 : 3번째 찾은 값)
SELECT INSTR ('900101-1234567', '-') FROM DUAL; --7번째 위치 값 리턴 
SELECT INSTR ('900101-1234567', '*') FROM DUAL; --없을때 :0 리턴 
SELECT INSTR ('900101-1234567', '34') FROM DUAL; --10
SELECT INSTR ('900101-1234567', '1') FROM DUAL; --4 : 시작위치값을 안주면 맨 첫번째 리턴 
SELECT INSTR ('900101-1234567', '1',7) FROM DUAL; --8 : 7번째 위치부터 찾기 
SELECT INSTR ('900101-1234567', '1',1,2) FROM DUAL; --6 : 1번째부터 찾고 찾은것중 2번째의 위치 

---------------------------------------------
--TRIM('문자열') : 양쪽 공백 제거
--LTRIM('문자열') : 왼쪽에 있는 공백 제거
--RTRIM('문자열') : 오른쪽에 있는 공백 제거
SELECT '    TEST    ' , '-'|| TRIM('    TEST    ')||'-' FROM DUAL; 
SELECT '    TEST    ' , '-'|| LTRIM('    TEST    ')||'-' FROM DUAL; 
SELECT '   TEST    ' , '-'|| RTRIM('    TEST    ')||'-' FROM DUAL; 

---------------------------------------------
--CONCAT(문자열1, 문자열2) : 문자열 연결 - 문자열1 || 문자열2
SELECT CONCAT('HELLO ', 'WORLD') FROM DUAL;
SELECT 'HELLO '||'WORLD' FROM DUAL;

------------------------
--LPAD(대상문자열, 전체글자수, 삽입될문자) : 왼쪽에 삽입
--RPAD(대상문자열, 전체글자수, 삽입될문자) : 오른쪽에 삽입
SELECT '-'||LPAD('HELLO', 10)||'-' FROM DUAL; --삽입될 문자를 쓰지않으면,왼쪽을 공백으로 채운다 
SELECT LPAD('HELLO',10,'*') FROM DUAL; --*****HELLO

SELECT '-'||RPAD('HELLO', 10)||'-' FROM DUAL; --삽입될 문자를 쓰지않으면,오른쪽을 공백으로 채운다 
SELECT RPAD('HELLO',10,'*') FROM DUAL;--HELLO*****
SELECT LPAD('HELLO',10,'*~') FROM DUAL;--*~*~*HELLO

--------------------------
--REPLACE(대상문자열, 찾을문자, 변경문자) : 문자열에서 찾은문자를 변경 
SELECT 'HELLO JAVA', REPLACE('HELLO JAVA', 'A','O') FROM DUAL;  --HELLO JOVO
SELECT 'HELLO JAVA JAVA', REPLACE('HELLO JAVA JAVA', 'JA','JO') FROM DUAL;--HELLO JOVA JOVA
SELECT 'HELLO JAVA', REPLACE('HELLO JAVA', 'JAVA','WORLD') FROM DUAL;--HELLO WORLD
  
  
  
  