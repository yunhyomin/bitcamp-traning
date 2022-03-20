package com.mystudy.jdbc2_statement;

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
		Statement stmt = null;
		//1.JDBC 드라이버 로딩 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			//2.DB연결 - Connection 객체 생성 <- DriverManager
			
				conn = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:xe", 
						"mystudy", "mystudypw");
			
			System.out.println(">>DB연결 성공");
			//3.Statement 문 실행 (SQL문 실행)
			//3-1.Connetion객체로 부터 Statement객체 생성 
			stmt = conn.createStatement();
			String id = "2021007";
			String name = "홍경래2";
			int kor = 100;
			int eng = 95;
			int math = 88;
			
			
			String sql = "";
			sql += "INSERT INTO STUDENT";
			sql += "	(ID,NAME,KOR,ENG,MATH)";
			sql += "VALUES('"+id+"','"+name+"',"
							+kor+","+eng+","+math+")";
			System.out.println(sql);

			
			//3-2.Statement객테를 이용해서 SQL문 실행 
			int result = stmt.executeUpdate(sql);
			
			//4.SQL실행 결과에 대한 처리 
			System.out.println(">>처리건수:"+ result);

			//	-SELECT : 조회(검색) 데이터 결과 값에 대한 처리 
			//	-INSERT,UPDATE,DELETE : int값(건수) 처리 
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(">>DB연결 실패!!");
			e.printStackTrace();
			
		}finally {
			//5.클로징 처리에 의한 자원반납 
		}if(stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
				
				
	}

}
	
	
	
	
	
	
	
	
	
	
	
