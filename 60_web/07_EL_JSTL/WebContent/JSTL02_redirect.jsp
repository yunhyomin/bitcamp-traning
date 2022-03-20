<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL redirect</title>
</head>
<body>
	<h1>[JSTL02_redirect.jsp]</h1>
	<p>페이지 전환 : redirect - 파라미터값 전달 </p>
	
	<%-- 이 요청이 없다면 위에까지 출력된다 --%>
	<c:redirect url = "JSTL02_resp.jsp">
		<c:param name="name" value="hong"/>
		<c:param name="age">27</c:param>
		<c:param name="address">서울시 마포</c:param>
	</c:redirect>
	
	<%--액션태그의 forward 와 같은 기능이다
		forward : 클라이언트:a요청 -> 서버: a->b b로 응답 -> 클라이언트:b url응답받음
		redirect : 요청이 2번!! 클라이언트:a요청->서버:b로 재요청해라 -> 클라이언트:b요청 -> 서버:b응답 -> 클라이언트:b url응답받음
	--%>
	
	
</body>
</html>