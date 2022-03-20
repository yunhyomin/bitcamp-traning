<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- (실습) 전달받은 데이터(파라미터값) 사용해서 DB데이터 삭제 처리 
	정상처리후 : list.jsp이동 
	예외발생시 : 현재페이지에 오류메시지 보여주기
 --%>    
    
<%
//1. 전달받은 파라미터 값 확인(추출)
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int rs = 0;
	
	//사용할 SQL 쿼리 작성
	String sql = "delete from guest where sabun=?";	
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		//pstmt.setInt(1,sabun);
		
		//4. 쿼리실행
		rs = pstmt.executeUpdate();
		//5. 쿼리 실행 결과에 대한 처리
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	if(rs>0){
		response.sendRedirect("list.jsp");
	}else if(rs==0){//sql문장은 정상실행 되었으나 데이터 없어서 삭제 못함 
%>
	<script>
	  alert("[삭제실패] 데이터가 없어서 삭제하지 못했습니다/n"+ "목록페이지로 이동합니다");
	  location.href= "list.jsp";
    </script>		
<% 
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원정보삭제 실패</h1>
	<p>삭제처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	<a href="detail.jsp?saban=<%=sabun %>">상세페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>