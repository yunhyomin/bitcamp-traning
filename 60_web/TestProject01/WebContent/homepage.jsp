<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.InetAddress" %>
<%
	System.out.println(request.getAttribute("host"));	
	//session.setAttribute("host", );
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
			InetAddress local = InetAddress.getLocalHost();
			String ip = local.getHostAddress();
			System.out.println("homepage.jsp ip :"+ip);
%>
<script>
	
		location.href="chIp?ip=<%=ip%>";

</script>
<body>
<h1>홈페이지</h1>
	${host}

</body>
</html>