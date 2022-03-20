<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩신청</title>
</head>
<body>
<c:if test="${ sessionScope.loginUsers == null}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
<c:if test="${ sessionScope.loginUsers.user_no != ''}">
	<c:if test="${sessionScope.loginUsers.user_type == '회원'}">
		<c:redirect url="projectManager_signup.jsp"></c:redirect>
	</c:if>
	<c:if test="${sessionScope.loginUsers.user_type == '판매자'}">
		<c:redirect url="funding_submit.jsp"></c:redirect>
	</c:if>
</c:if>
</body>
</html>