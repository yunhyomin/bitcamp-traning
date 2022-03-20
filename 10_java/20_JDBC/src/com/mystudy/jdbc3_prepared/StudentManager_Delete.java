package com.mystudy.jdbc3_prepared;

import java.sql.*;
public class StudentManager_Delete {

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
				
		//id : 2021008 삭제처리 JDBC연동 프로그램 작성 
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			//JDBC 드라이버 로딩 
			Class.forName("oracle.jdbc.OracleDriver");
			//Connection 객체 생성 (DriverManager)
			conn = DriverManager.getConnection(
								"jdbc:oracle:thin:@localhost:1521:xe"
								,"MYSTUDY","mystudypw");
			
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM STUDENT WHERE ID = ? ");
			//Connection 객체로부터 preparedStatement 객체 생성 
			pstmt = conn.prepareStatement(sql.toString());
			
			//?위치에 변수값 대입 
			String id = "2021008";
			pstmt.setString(1,id);
			
			//preparedStatement 문 실행 
			int result = pstmt.executeUpdate();
			System.out.println(">>처리 건수:"+result);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			// 클로징 처리 하고 자원 받납 
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
