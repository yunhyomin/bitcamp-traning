package com.mystudy.jdbc1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

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

		//0.JDBC 라이브러리 개발환경 설정 (빌드경로에 등록)
		//1.JDBC 드라이버 로딩 
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println(">>드라이버 로딩 성공");

		} catch (ClassNotFoundException e) {
			System.out.println("[예외발생] 드라이버 로딩 실패!!");
			e.printStackTrace();
		}
		
		//2.DB연결 - Connection 객체 생성 <- DriverManager
		Connection conn = null;
		try {
				conn = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521:xe", 
							"mystudy", "mystudypw");
				System.out.println(">>DB연결 성공");
		} catch (SQLException e) {
			System.out.println("[예외발생] DB연결 실패!!");
			e.printStackTrace();
		}
		//3.Statement 문 실행 (SQL문 실행)
		Statement stmt = null;
		
		try {
			stmt = conn.createStatement();
			String sql = "";
			sql +="INSERT INTO STUDENT";
			sql +="		(ID,NAME,KOR,ENG,MATH,TOT,AVG)";
			sql +="VALUES ('2021004','김유신2',100,90,80,0,0)";
			
			//SELECT : excuteQuery(sql)
			//INSERT,UPDAT,DELETE executeUpdate(sql)
			int result = stmt.executeUpdate(sql);
		
		//4.SQL실행 결과에 대한 처리 
		//	-SELECT : 조회(검색) 데이터 결과 값에 대한 처리 
		//	-INSERT,UPDATE,DELETE : int값(건수) 처리 
		System.out.println("처리건수 :"+ result);
		} catch (SQLException e) {
			e.printStackTrace();
			
		
		//5.클로징 처리에 의한 자원반납 
		}try {
			stmt.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println(">>connectoin객체 close");
			e.printStackTrace();
		}
		

		
	}

}























