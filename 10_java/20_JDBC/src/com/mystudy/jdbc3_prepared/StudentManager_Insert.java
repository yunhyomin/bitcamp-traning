package com.mystudy.jdbc3_prepared;

import java.sql.*;
public class StudentManager_Insert {

	public static void main(String[] args) {
				//JDBC이용한 DB연동 프로그래밍 작성 절차 
				//0.JDBC 라이브러리 개발환경 설정 (빌드경로에 등록)
				//1.JDBC 드라이버 로딩 
				//2.DB연결 - Connection 객체 생성 <- DriverManager
				//3.Statement 문 실행 (SQL문 실행)
				//4.SQL실행 결과에 대한 처리 
				//	-SELECT : 조회(검색) 데이터 결과 값에 대한 처리 
				//	-INSERT,UPDATE,DELETE : int값(건수) 처리 
				//5.클로징 처리에 의한 자원반납 
				//-----------------------------------------------------------
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//1.JDBC 드라이버 로딩 
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2.DB연결 - Connection 객체 생성 <- DriverManager
			conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:xe", 
						"mystudy", "mystudypw");
			
			//3.Statement 문 실행 (SQL문 실행)
			//3-1.SQL문 실행을 위한 준비 (PreparedStatement 객체생성)
			String sql = "";
			sql += "INSERT INTO STUDENT";
			sql += "		(ID,NAME,KOR,ENG,MATH)";
			sql += "VALUES(?,?,?,?,?)";
			//PreparedStatement객체생성 
			pstmt = conn.prepareStatement(sql);
			
			//3-2. SQL문장의 ? 위치에 값 설정 (매칭, 대입)
			String id = "2021008";
			String name = "테스트";
			int kor = 100;
			int eng = 95;
			int math = 88;
			
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			pstmt.setInt(5,math);
			pstmt.setInt(3,kor);
			pstmt.setInt(4,eng);
			
			//3-3.SQL문 실행 
			int result = pstmt.executeUpdate();
			
			//4.SQL실행 결과에 대한 처리 
			//	-SELECT : 조회(검색) 데이터 결과 값에 대한 처리 
			//	-INSERT,UPDATE,DELETE : int값(건수) 처리 
			System.out.println(">>처리건수:"+result);

		} catch (ClassNotFoundException |SQLException e) {
			e.printStackTrace();
		

		}finally{
			//5.클로징 처리에 의한 자원반납 
			try {
				if(pstmt != null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

}
}
