<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(Expression Language)</title>
</head>
<body>
<%--EL(Expression Language) : 표현언어
	1. 표현식을 대신해서 사용 : ${}
		<%=데이터 %> :::: ${데이터 } : 데이터 - 상수, 계산식, ... 
	2. 사용할 데이터가 반드시 scope상에 존재해야한다
		scope 객체 : pageContext, request, session, application
		해당 scope 상에 setAttribute 설정된 변수(속성) 값만 사용가능
		(주의 : 로컬변수에 있는 데이터 사용못한다)
	3. 같은 이름이 다른 scope상에 존재하는 경우 접근 우선순위가 적용
		pageContext ->request ->session ->application
		(단, scope지정 없으면 page ---> application 순으로 찾는다 
		명시적으로 scope지정하면 해당 scope에서만 찾는다 
--%>
	<h2>표현식(Expression) 산술연산결과</h2>
	<ul>
		<li>15+ 7 = <%=15+7 %></li>
		<li>15- 7 = <%=15-7 %></li>
		<li>15* 7 = <%=15*7 %></li>
		<li>15/ 7 = <%=15/7 %></li>
		<li>15% 7 = <%=15%7 %></li>
	</ul>
	<hr>
	
	<h2>EL(Expression Language) 산술연산 결과</h2>
	<ul>
		<li>15+7= ${15+7 }</li>
		<li>15-7= ${15-7 }</li>
		<li>15*7= ${15*7 }</li>
		<li>15/7= ${15/7 } : double형식처리</li>
		<li>15%7= ${15%7 }</li>
	</ul>
	<hr><hr>
	
	<h2>선언부, 스크립트릿 변수 사용시</h2>
	<p>표현식은 가능하지만, EL에서는 사용못함</p>
	<%! int globalNum = 10; %>
	<% int localNum = 20; %>
	<ul>
		<li>globalNum : <%=globalNum %></li>
		<li>localNum : <%=localNum %></li>
	</ul>
	<ol>
		<li>globalNum : ${globalNum }</li>	
		<li>localNum : ${localNum }</li>	
	</ol>
	<hr><hr>
	
	<h2>EL에서 사용하려면 스코프(scope)에 속성 정의 후 사용</h2>
	<% pageContext.setAttribute("p_globalNum",globalNum); %>
	<% pageContext.setAttribute("p_localNum",localNum); %>
	<ol>
		<li>globalNum : ${p_globalNum }</li>	
		<li>localNum : ${p_localNum }</li>	
	</ol>
	<hr><hr>
	
	<%--========================================= --%>
	<h2>동일한 이름의 속성명이 여러scope에 존재할때</h2>
<%
	//pageContext.setAttribute("pc","펜티엄 - pageScope");
	//request.setAttribute("pc","i3- requestScope");
	//session.setAttribute("pc","i5- sessionScope");
	application.setAttribute("pc","i7- applicationScope");
	
%>	
	<h3>scope지정없이 데이터 사용</h3>
	<ul>
		<li>scope 지정없이  pc: ${pc }</li>
	</ul>
	<hr>
	
	<h3>scope명시적 지정사용</h3>
	<ul>
		<li>pageScope 지정: ${pageScope.pc }</li>
		<li>requestScope 지정: ${requestScope.pc }</li>
		<li>sessionScope 지정: ${sessionScope.pc }</li>
		<li>applicationScope 지정: ${applicationScope.pc }</li>
	</ul>



</body>
</html>