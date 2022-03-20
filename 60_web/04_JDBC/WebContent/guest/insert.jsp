<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
    <%--전달받은 데이터를 이용해서 DB에 입력처리
    	정상입력 : list.jsp 페이지로 이동 
    	예외발생 : 현재페이지 오류메세지 보여주기 
    	 --%>
<%		
	//1. 파라미터 값 추출 (sabun, name, pay)
	//int sabun = Integer.parseInt(request.getParameter("sabun")); //이때 형변환해도되고 
	String sabun = request.getParameter("sabun");
    String name = request.getParameter("name");
	int pay = Integer.parseInt(request.getParameter("pay"));
 	
	//2. DB입력작업 
	//JDBC 프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int result = 0;
	
	try{
 	 		//1. 드라이버 로딩
 			Class.forName(DRIVER);
 			//2. DB연결
 			conn = DriverManager.getConnection(URL, USER, PASSWORD);
 			//3. Statement 객체 생성(Connection 객체로 부터)
 			
 			String sql = "";
			sql += "insert into guest (SABUN,NAME,REGDATE,PAY)";
			sql += "	values(?,?,SYSDATE,?)";	
 			
			//3-1.Connection객체로부터  Statement객체 생성 
			pstmt = conn.prepareStatement(sql);
			
			//3-2. 바인드 변수에 값 설정 
 			pstmt.setInt(1,Integer.parseInt(sabun)); //여기에서 형변환 해줘도 된다 
 			pstmt.setString(2,name);
 			pstmt.setInt(3,pay);
 			
 			//4. 쿼리실행
 			result = pstmt.executeUpdate();
 			
 	 	 }catch(Exception e){
 	 		 result = -1;
 	 		System.out.println(">>>catch절 실행~~~result값 : "+result);
 	 		 e.printStackTrace();
 	 	 }finally{
 	 		 System.out.println(">>>finally구문 실행~~~");
 	 		try {
 				if (pstmt != null) pstmt.close();
 				if (conn != null) conn.close();
 			} catch (Exception e) {
 				e.printStackTrace();
 			}
 	 	 }
    //3. 페이지 이동처리 
    if(result >0){
    	response.sendRedirect("list.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원등록 실패</h1>
	<p>입력처리를 하지 못했습니다<br>
	담당자(8282)에게 연락하세요 </p>
	<a href="addForm.jsp">입력페이지로 이동</a>
	<a href="list.jsp">전체목록보기</a>
</body>
</html>