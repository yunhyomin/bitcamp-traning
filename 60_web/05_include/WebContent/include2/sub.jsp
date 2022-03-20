<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브페이지(sub)</title>
</head>
<body>
	<h1>서브페이지(sub)</h1>
	<a href="main.jsp">메인페이지로 이동</a>
	<h2>서브페이지 내용</h2>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>

	<hr><hr>
	<%@ include file="01_declaration.jsp" %>
	<%@ include file="02_scriptlet.jspf" %>
		
	<%@ include file="footer.jsp"%>
	<br>
	<footer>
	 서울특별시 강남구 테헤란로 124 4층 (역삼동, 삼원타워)사업자등록번호 : 220-86-20171통신판매업신고번호 : 강남 제-3339호
설립자 : (주)유니윌기관명 : 아이티윌(직업능력개발훈련시설)대표자 : 조인형TEL : 02-6255-8888FAX : 02-569-8069
개인정보책임자 : 허진혁이메일 : webmaster@knitwill.or.kr
	</footer>
	

</body>
</html>