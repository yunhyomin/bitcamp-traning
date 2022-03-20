package com.project.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.project.bank.util.CommonUtil;
import com.project.bank.vo.UsersVO;

public class UserDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
	public int insertUser(UsersVO uvo) {
		
		int result = 0;
		
		conn = CommonUtil.getConnection();
		
		try {

			sql = "INSERT INTO USERS (USERNO, USERID, USERNAME, PHONE, EMAIL, ADDRESS, USERPW)";
			sql += "VALUES(?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, uvo.getUserNo());
			pstmt.setString(2, uvo.getUserId());
			pstmt.setString(3, uvo.getUserName());
			pstmt.setInt(4, uvo.getPhone());
			pstmt.setString(5, uvo.getEmail());
			pstmt.setString(6, uvo.getAddress());
			pstmt.setString(7, uvo.getUserPw());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("오류발생");
			e.printStackTrace();
		}
		
		return result;
	}
}
