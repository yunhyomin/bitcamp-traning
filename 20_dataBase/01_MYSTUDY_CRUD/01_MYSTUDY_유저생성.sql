--오라클 설치 시 SYSTEM 유저 패스워드 : manager
--SYSTEM 유저로 접속 후 스트립트 실행 

--http포트 8090으로 변경
 exec dbms_xdb.setHttpPort(8090);
 
 
 --USER SQL
 CREATE USER "MYSTUDY" IDENTIFIED BY "mystudypw"
 DEFAULT TABLESPACE "USERS"
 TEMPORARY TABLESPACE "TEMP";
 --ROLES
 GRANT "CONNECT" TO "MYSTUDY";
 GRANT "RESOURCE" TO "MYSTUDY";
 
 