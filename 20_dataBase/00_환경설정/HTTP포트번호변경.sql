--HTTP ��Ʈ ���� : 8080 -> 8090 
--DB ��ġ �� HTTP ��Ʈ��ȣ Ȯ�� : 8080
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;

--HTTP ��Ʈ 8090 ���� ���� 
EXEC DBMS_XDB.setHttpPort(8090);

--DB ��ġ �� HTTP ��Ʈ��ȣ Ȯ�� : 8090
SELECT DBMS_XDB.GETHTTPPORT() FROM DUAL;


