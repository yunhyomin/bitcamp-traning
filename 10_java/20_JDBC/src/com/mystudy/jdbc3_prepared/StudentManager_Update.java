package com.mystudy.jdbc3_prepared;

import java.sql.*;

public class StudentManager_Update {

	public static void main(String[] args) {
		// JDBC이용한 DB연동 프로그래밍 작성 절차
		// 0.JDBC 라이브러리 개발환경 설정 (빌드경로에 등록)
		// 1.JDBC 드라이버 로딩
		// 2.DB연결 - Connection 객체 생성 <- DriverManager
		// 3.Statement 문 실행 (SQL문 실행)
		//		
		// 4.SQL실행 결과에 대한 처리
		// -SELECT : 조회(검색) 데이터 결과 값에 대한 처리
		// -INSERT,UPDATE,DELETE : int값(건수) 처리
		// 5.클로징 처리에 의한 자원반납
		// -----------------------------------------------------------
		// update => id 2021004 name:을지문덕 kor:98 eng:89 math:93 수정
		// sql문 :
		// update student set name = '을지문덕',kor=98,eng=89,math=93
		// where id = '2021004';

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			// JDBC드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");

			// DB연결
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe"
												, "MYSTUDY", "mystudypw");
			StringBuffer sbSql = new StringBuffer();
			sbSql.append("UPDATE STUDENT");
			sbSql.append(" SET NAME = ?,kor= ?,eng= ?,math= ?");
			sbSql.append("WHERE ID = ?");
			// PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sbSql.toString());
			String id = "2021004";
			String name = "을지문덕";
			int kor = 98;
			int eng = 89;
			int math = 93;

			pstmt.setString(1, name);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, math);
			pstmt.setString(5, id);

			// PreparedStatement sql문 실행
			int result = pstmt.executeUpdate();
			System.out.println(">>처리건수:" + result);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}try {
				if (conn != null)conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
		}
		}

	}

}
