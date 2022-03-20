package com.mystudy.jdbc2_statement;

import java.sql.*;

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
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;
				
				//1.JDBC 드라이버 로딩 
				try {
					Class.forName("oracle.jdbc.OracleDriver");
					
					//2.DB연결 - Connection 객체 생성 <- DriverManager
					conn = DriverManager.getConnection(
							"jdbc:oracle:thin:@localhost:1521:xe", 
							"mystudy", "mystudypw");
					
					//3.Statement 문 실행 (SQL문 실행)
					stmt = conn.createStatement();
					String id = "20211001";
					String sql = ""
							+"SELECT ID,NAME,KOR,ENG,MATH,TOT,AVG"
							+"  FROM STUDENT"
							+" WHERE ID = '"+id+"'";
		
				    rs = stmt.executeQuery(sql);
				    //4.SQL실행 결과에 대한 처리 
					//	-SELECT : 조회(검색) 데이터 결과 값에 대한 처리 
				    System.out.println(">> SELECT 결과 처리 ----------------");
					while(rs.next()) { //결과값이 있다면 true, 없으면 false
							String str = "";
								str += rs.getString("ID")+"\t"; // 1컬럼명칭 대신에 위치값으로 써줄 수 있다!!!
								str += rs.getString("NAME")+"\t";//2
								str += rs.getInt("KOR")+"\t";//3
								str += rs.getInt("ENG")+"\t";//4
								str += rs.getInt("MATH")+"\t";//5
								str += rs.getInt("TOT")+"\t";//6
								str += rs.getInt("AVG"); //7
								//이렇게 문자열을 여러개 쓰는건 비효율적임 ->	StringBuilder를 사용하는것이 좋다 !!
								System.out.println(str);
					}
				    System.out.println(">> SELECT 작업 정상 처리 완료 ");

				} catch (ClassNotFoundException | SQLException e) {
					System.out.println("[예외발생] 드라이버가 없거나 db작업 실패!!");
					e.printStackTrace();
				}finally {
					//5.클로징 처리에 의한 자원반납 (생성순서와 역순으로)
					try {
						if(rs != null) rs.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					try {
						if(stmt != null) stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					try {
						if(conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				
				
	}

}
