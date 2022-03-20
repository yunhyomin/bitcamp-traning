<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
	<script>
		alert("회원가입에 성공하였습니다.")
		<%-- <%response.sendRedirect("mainMenu.jsp"); %> --%>
	 	location.href="home.jsp"; // 로그인 성공 시 메인페이지로 이동 
	 </script>
</body>
</html>