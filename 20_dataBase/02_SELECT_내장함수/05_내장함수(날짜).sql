/* ��¥���� �����Լ� 
��¥�� ���갡�� 
DATEŸ�� + ����(����) : ���ڸ�ŭ ���� ���� 
DATEŸ�� - ����(����) : ���ڸ�ŭ ���� ���� 

ADD_MONTHS(��¥, ������) : ���� �� ��ŭ ���� ���� �Ǵ� ���� 
LAST_DAY(��¥) : ��¥�� ���� ���� ������ ��¥ ���ϱ� 
NEXT_DAY(��¥, ����) : ���� ��¥ ���ϱ� , ��¥ ������ ���� ù��° ���� ���ϱ� 
MONTHS_BETWEEN(��¥, ��¥2) : �Ⱓ���ϱ�(����), ������ (��¥1-��¥2)
********************************/

--��¥�� ���갡�� 
--DATEŸ�� + ����(����) : ���ڸ�ŭ ���� ���� 
--DATEŸ�� - ����(����) : ���ڸ�ŭ ���� ���� 
SELECT SYSDATE, SYSDATE-1, SYSDATE+1 FROM DUAL;

--ADD_MONTHS(��¥, ������) : ���� �� ��ŭ ���� ���� �Ǵ� ���� 
SELECT SYSDATE, NEXT_DAY(SYSDATE,'��')FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE,'������')FROM DUAL;

--LAST_DAY(��¥) : ��¥�� ���� ���� ������ ��¥ ���ϱ� 
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

SELECT SYSDATE, ADD_MONTHS(SYSDATE, -1),
       LAST_DAY(ADD_MONTHS(SYSDATE, -1)),
       LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1-- ���� 1�� ���ϱ� 
FROM DUAL;       
--NEXT_DAY(��¥, ����) : ���� ��¥ ���ϱ� , ��¥ ������ ���� ù��° ���� ���ϱ� 
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'ȭ') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '�����') FROM DUAL;

--MONTHS_BETWEEN(��¥, ��¥2) : �Ⱓ���ϱ�(����), ������ (��¥1-��¥2)
SELECT SYSDATE, ADD_MONTHS(SYSDATE,2) FROM DUAL;
SELECT MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE,2)) FROM DUAL; -- -2
SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE,2),SYSDATE) FROM DUAL; -- 2
SELECT MONTHS_BETWEEN(ADD_MONTHS(SYSDATE-10,2),SYSDATE) FROM DUAL; --�Ǽ��� �����͸� ���� �� ���� 

--=================================================
-- 1 : 1�� ->24�ð�, 1�ð� : 1�ð�/24�ð� -->1�ð�
-- 1�ð� : 60�� -->1�ð�/60�� --->1�� ::: 1/24/60 -->1��
-- 1�� : 60�� --->1��/60�� --->1�� ::: 1/24/60/60 -->1��
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE+1, 'YYYY-MM-DD HH24:MI:SS'), -- +1�� 
    TO_CHAR(SYSDATE+(1/24), 'YYYY-MM-DD HH24:MI:SS'),-- +1�ð�  
    TO_CHAR(SYSDATE+(1/24)*5,'YYYY-MM-DD HH24:MI:SS') -- +5�ð�
FROM DUAL;

--1�� : 86400��, 1440��
SELECT 1*60 "1��(��)", 60*60 "1�ð�(��)", 24*60*60 "1��(��)", 24*60 "1��(��)" --��,�� �������� ������  
FROM DUAL;

--1��, 1�ð�, 1��, 1�� 
SELECT 1, 1/24, 1/24/60, 1/24/60/60 FROM DUAL;
SELECT 1, 1/24, 1/(24*60), 1/(24*60*60) FROM DUAL;




