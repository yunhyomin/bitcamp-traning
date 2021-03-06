SELECT ABS(-15) FROM DUAL;
SELECT CEIL(15.7) FROM DUAL;
SELECT COS(3.14159) FROM DUAL;
SELECT FLOOR(15.7) FROM DUAL;
SELECT LOG(10,100) FROM DUAL;
SELECT MOD(11,4) FROM DUAL;
SELECT POWER(3,2) FROM DUAL;
SELECT ROUND(15.7), SIGN(-15), TRUNC(15.7) FROM DUAL;
SELECT CHR(67), CONCAT('HAPPY ', 'Birthday'), LOWER('BIRTHDAY'), UPPER('Birthday') FROM DUAL;
SELECT REPLACE('JACK', 'J','BL')FROM DUAL;
SELECT RPAD('Page 1',15,'*.') , LPAD('PAGE 1', 15, '*.')FROM DUAL;
SELECT TRIM(LEADING 0 FROM '00AA00'), RTRIM('Page 1','ae'), LTRIM('Page 1','ae') FROM DUAL;
SELECT SUBSTR('ABCDEFG',3,4) FROM DUAL;
SELECT ASCII('A') FROM DUAL;
SELECT INSTR('CORPORATE FLOOR','OR',3,2) FROM DUAL;
SELECT LENGTH('BIRTHDAY') FROM DUAL;
SELECT ADD_MONTHS('14/05/21',1) FROM DUAL;
SELECT LAST_DAY(SYSDATE) FROM DUAL;
SELECT NEXT_DAY(SYSDATE,'ȭ') FROM DUAL;

SELECT SYSDATE FROM DUAL;
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(123) FROM DUAL;
SELECT TO_DATE('12 05 2014', 'DD MM YYYY') FROM DUAL;
SELECT TO_NUMBER('12.3') FROM DUAL;
SELECT DECODE(1,1,'aa','bb') FROM DUAL;
SELECT NULLIF(123,345) FROM DUAL;
SELECT NVL(NULL,123) FROM DUAL;


