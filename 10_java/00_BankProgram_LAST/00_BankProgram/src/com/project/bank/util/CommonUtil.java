package com.project.bank.util;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CommonUtil {
		
		private static final String DRIVER = "oracle.jdbc.OracleDriver";
		private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		private static final String USER = "BANK";
		private static final String PASSWORD = "bankpw";
		
		static {
			//1. JDBC 드라이버 로딩
			try {
				Class.forName(DRIVER);
//				System.out.println(">> JDBC 드라이버 로딩 성공");
			} catch (ClassNotFoundException e) {
				System.out.println("[예외발생] 드라이버 로딩 실패!!!");
			}
		}
		
		public static Connection getConnection() {
			try {
				return DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	
		public static void close(Connection conn, PreparedStatement pstmt) {
			//5. 사용객체 close
			try {
				if (pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public static void close(Connection conn, PreparedStatement pstmt, 
				ResultSet rs) {
			try {
				if (rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			close(conn, pstmt);
		}
	
		// 날짜 ? 
		public static Date transformDate(String date) 
		{
			SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");

			// Date로 변경하기 위해서는 날짜 형식을 yy-mm-dd로 변경해야 한다.
			SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");

			java.util.Date tempDate = null;

			try {
				// 현재 yymmdd로된 날짜 형식으로 java.util.Date객체를 만든다.
				tempDate = beforeFormat.parse(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}

			// java.util.Date를 yy-mm-dd 형식으로 변경하여 String로 반환한다.
			String transDate = afterFormat.format(tempDate);

			// 반환된 String 값을 Date로 변경한다.
			Date d = Date.valueOf(transDate);

			return d;
		}
		
	
}
	
