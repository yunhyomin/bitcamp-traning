<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--전달받은 파라미터 값을 자바빈(Bean) VO에 저장하고 사용 --%>

<%
	//한글처리 
	request.setCharacterEncoding("UTF-8");
%>    

	<jsp:useBean id="vo" class="com.mystudy.MemberVO"/>
	<jsp:setProperty property="*" name="vo"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean 사용</title>
</head>
<body>
	<h2>결과보기(Bean사용)</h2>
	<ul>
		<li>아이디: <%=vo.getId() %></li>
		<li>암호 : <%=vo.getPwd() %></li>
		<li>이름 : <%=vo.getName() %></li>
		<li>성별 : <%=vo.getGender() %></li>
		<li>취미(배열값 처리) :
<%
		for (String hobby : vo.getHobby()) {
			out.print(hobby + " ");
		}
%>		
		</li>
	</ul>
	<hr>
	
	<h2>Bean데이터 EL사용</h2>
	<p>EL은  null데이터 출력안함</p>
	<ol>
		<li>아이디: ${vo.getId() }</li>
		<li>암호: ${vo.pwd() }</li>
		<li>이름: ${vo.name() }</li>
		<li>성별: ${vo.gender() }</li>
		<li>취미(배열값 처리):
<% 			for (String hobby : vo.getHobby()) {
			out.print(hobby + " ");
		}
%>
		</li>
		
	</ol>


</body>
</html>