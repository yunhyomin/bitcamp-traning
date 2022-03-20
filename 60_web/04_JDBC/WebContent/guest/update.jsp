<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <%-- (실습) 전달받은 데이터(파라미터값) 사용해서 DB데이터 수정처리
    	수정할 데이터 : 성명, 금액, 날짜(SYSDATE)
    	정상처리후 : list.jsp 이동 또는  detail.jsp페이지 이동처리         
    	예외발생시 : 현재페이지에 오류메세지 보여주기 
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
	         
	//DB수정작
	//사용할 SQL 쿼리 작성
	String sql = "update guest set name=? ,pay=?, regdate=sysdate where sabun=?";	
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
	
	
	try {
		//1. 드라이버 로딩
		Class.forName(DRIVER);
		//2. DB연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		//3. Statement 객체 생성(Connection 객체로 부터)
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(3,sabun);
		pstmt.setString(1,name);
		pstmt.setInt(2,pay);
		
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
	//페이지 이동처리
	if(rs>0){
		response.sendRedirect("detail.jsp?sabun="+sabun);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원정보 수정실패</h1>
	<p>수정처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요</p>
	<a href="detail.jsp?suban=<%=sabun %>"></a>
	<a href="list.jsp">전체목록보기</a>
</body>
</html>