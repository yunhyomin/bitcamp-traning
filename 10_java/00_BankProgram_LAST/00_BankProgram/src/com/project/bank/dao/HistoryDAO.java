package com.project.bank.dao;

import java.sql.*;
import java.util.ArrayList;

import com.project.bank.util.CommonUtil;
import com.project.bank.vo.HistoryVO;
public class HistoryDAO {
	static Connection conn;
	static PreparedStatement pstmt ;
	static ResultSet rs ;
	static StringBuilder sql;
	
	//입금합계 
	public static int cashIn(String bankNo) 
	{
		int cashIn = 0;
		conn = CommonUtil.getConnection();
		
		String sql = "SELECT SUM(MONEY) FROM HISTORY WHERE BANKNO=? AND TYPE=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bankNo);
			pstmt.setString(2,"입금");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cashIn = rs.getInt("SUM(MONEY)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(conn,pstmt,rs);
		}
		return cashIn;
	}
	//출금합계
	public static int cashOut(String bankNo) 
	{
		int cashOut = 0;
		conn = CommonUtil.getConnection();
		
		String sql = "SELECT SUM(MONEY) FROM HISTORY WHERE BANKNO=? AND TYPE=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bankNo);
			pstmt.setString(2,"출금");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cashOut = rs.getInt("SUM(MONEY)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(conn,pstmt,rs);
		}
		return cashOut;
		
	}
	//계좌에 입금 
	public static int deposit(int money,String bankNo)
	{
		int rs = 0;
		conn = CommonUtil.getConnection();
		 sql = new StringBuilder();
		 sql.append("INSERT INTO HISTORY(NO,DATETIME,TYPE,MONEY,BANKNO)");
		 sql.append(" VALUES (HISTORY_SEQ.NEXTVAL,SYSDATE,?,?,?)");
		 
		 try {
			pstmt = conn.prepareStatement(sql.toString());
			String d = "입금";
			pstmt.setString(1,d);
			pstmt.setInt(2,money);
			pstmt.setString(3,bankNo);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(conn,pstmt);
		}
		 return rs;
	}
	//계좌에서 출금
	public static int withdraw(int money,String bankNo)
	{
		int rs = 0;
		conn = CommonUtil.getConnection();
		sql = new StringBuilder();
		sql.append("INSERT INTO HISTORY(NO, DATETIME, TYPE, MONEY, BANKNO)");
		sql.append("	VALUES(HISTORY_SEQ.NEXTVAL,SYSDATE,?,?,?)");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,"출금");
			pstmt.setInt(2,money);
			pstmt.setString(3,bankNo);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(conn, pstmt);
		}
		return rs;
	}
	//거래내역 조회 
	public static ArrayList<HistoryVO> showHistory(String bankNo) {
		ArrayList<HistoryVO> list = null;
		try {
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			
			sql.append("SELECT NO, DATETIME, TYPE, MONEY");
			sql.append("  FROM HISTORY");
			sql.append(" WHERE BANKNO = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
		
			pstmt.setString(1, bankNo);
			rs = pstmt.executeQuery();
			list = new ArrayList<HistoryVO>();
			while (rs.next()) {
				HistoryVO hvo = new HistoryVO(
								rs.getInt("NO"),
								rs.getDate("DATETIME"),
								rs.getString("TYPE"),
								rs.getInt("MONEY"));
				list.add(hvo);		
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		} 
		return list;
	}
}













