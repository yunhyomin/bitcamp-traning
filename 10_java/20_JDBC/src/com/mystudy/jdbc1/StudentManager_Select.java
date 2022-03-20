package com.mystudy.jdbc1;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.DriverManager;

public class StudentManager_Select {

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
		
		//JDBC이용한 DB연동 프로그래밍 작성 절차 
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
		ResultSet rs = null;
		try {
				//Connection 객체로부터 Statement객체 생성 
				stmt = conn.createStatement();
				String sql = ""
							+"SELECT ID,NAME,KOR,ENG,MATH,TOT,AVG"
							+"  FROM STUDENT"
							+" ORDER BY NAME";
		
				rs = stmt.executeQuery(sql);
		
		//4.SQL실행 결과에 대한 처리 
		//	-SELECT : 조회(검색) 데이터 결과 값에 대한 처리 
				System.out.println(">> SELECT 결과 처리 ----------------");
				while(rs.next()) { //결과값이 있다면 true, 없으면 false
						String str = "";
							str += rs.getString("ID")+"\t";
							str += rs.getString("NAME")+"\t";
							str += rs.getInt("KOR")+"\t";
							str += rs.getInt("ENG")+"\t";
							str += rs.getInt("MATH")+"\t";
							str += rs.getInt("TOT")+"\t";
							str += rs.getInt("AVG"); //이렇게 문자열을 여러개 쓰는건 비효율적임 ->	StringBuilder를 사용하는것이 좋다 !!
			
							System.out.println(str);
			

				}

		} catch (SQLException e1) {
			e1.printStackTrace();
		}finally {
			//5.클로징 처리에 의한 자원반납 
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt != null) {
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

}















