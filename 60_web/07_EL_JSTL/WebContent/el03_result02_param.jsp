<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param</title>
</head>
<body>
	<h2>EL사용해서 form데이터 표시 (param, paramValues)</h2>
	<p>아이디: (\${param.id }) : ${param.id }</p>
	<p>암호: ${param.pwd }</p>
	<p>이름: ${param.name }</p>
	<p>성별: ${param.gender } </p>
	
	<p>취미: (\${param.hobby }) : ${param.hobby }</p>
	<p>취미: (\${paramValues.hobby }) : ${paramValus.hobby }</p>
	
	<p>취미(배열데이터): 
		${paramValues.hobby[0] } 
		${paramValues.hobby[1] } 
		${paramValues.hobby[2] } 
		${paramValues.hobby[3] } 
		
	</p>




</body>
</html>