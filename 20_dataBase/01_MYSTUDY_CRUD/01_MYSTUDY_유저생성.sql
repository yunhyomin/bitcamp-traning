--����Ŭ ��ġ �� SYSTEM ���� �н����� : manager
--SYSTEM ������ ���� �� ��Ʈ��Ʈ ���� 

--http��Ʈ 8090���� ����
 exec dbms_xdb.setHttpPort(8090);
 
 
 --USER SQL
 CREATE USER "MYSTUDY" IDENTIFIED BY "mystudypw"
 DEFAULT TABLESPACE "USERS"
 TEMPORARY TABLESPACE "TEMP";
 --ROLES
 GRANT "CONNECT" TO "MYSTUDY";
 GRANT "RESOURCE" TO "MYSTUDY";
 
 