<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<h1>메인페이지(main)</h1>
	<a href="sub.jsp">서브페이지로 이동</a>
	<h2>메인페이지 내용</h2>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>
	<p>.............</p>

	<hr><hr>
	<%-- 디렉티브(지시어, directive) include: 복사&붙여넣기형태로 적용 --%>
	<%@ include file="01_declaration.jsp" %>
	<%@ include file="02_scriptlet.jspf" %>
	
	<%@ include file="footer.jsp"%>
	
	<br>
	<footer>
	 서울특별시 강남구 테헤란로 124 4층 (역삼동, 삼원타워)사업자등록번호 : 220-86-20171통신판매업신고번호 : 강남 제-3339호
설립자 : (주)유니윌기관명 : 아이티윌(직업능력개발훈련시설)대표자 : 조인형TEL : 02-6255-8080FAX : 02-569-8069
개인정보책임자 : 허진혁이메일 : webmaster@knitwill.or.kr
	</footer>



</body>
</html>