package com.mystudy.jdbc_member.common;

import java.sql.*;

public class CommonUtil {
	
	//상수화된 변수 
		public static String DRIVER = "oracle.jdbc.OracleDriver";
		public static String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		public static String USER = "MYSTUDY";
		public static String PASSWORD = "mystudypw";
		
	//static 초기화 구문 
	static {
			//1.JDBC드라이버 로딩
		try {
			Class.forName(DRIVER);
			System.out.println(">>JDBC 드라이버 로딩 성공");

		} catch (ClassNotFoundException e) {
			System.out.println("[예외발생] 드라이버 로딩 실패!!");

			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			System.out.println("DB연결성공");

		} catch (SQLException e) {
			System.out.println(">>[예외발생] DB연결 실패!!");
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn,Statement stmt,ResultSet rs){
		try {
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(conn,stmt);
	}
	
	public static void close(Connection conn,Statement stmt){
		
		try {
			if(stmt!=null)stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
