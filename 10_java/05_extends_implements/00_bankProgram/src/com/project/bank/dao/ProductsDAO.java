package com.project.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.bank.util.CommonUtil;
import com.project.bank.vo.ProductsVO;

public class ProductsDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql;
	
	public int insertProducts(ProductsVO pvo) {
		
		int result = 0;
		
		conn = CommonUtil.getConnection();
		
		try {
			
			sql = "INSERT INTO PRODUCTS (FNNNO, FNNTYPE, RATE, FNNNAME)";
			sql += "VALUES(?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pvo.getFnnNo());
			pstmt.setString(2, pvo.getFnnType());
			pstmt.setDouble(3, pvo.getRate());
			pstmt.setString(4, pvo.getFnnName());

			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("오류발생");
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public ArrayList<ProductsVO> selectAll() {
		ArrayList<ProductsVO> list = null;
		
		try {
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT FNNNO, FNNTYPE, RATE, FNNNAME");
			sql.append("  FROM PRODUCTS");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
			
			
			list = new ArrayList<ProductsVO>();
			while (rs.next()) {
				ProductsVO pvo = new ProductsVO(
					rs.getString("FNNNO"),
					rs.getString("FNNTYPE"),
					rs.getDouble("RATE"),
					rs.getString("FNNNAME"));
			
				list.add(pvo);			
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}
	
		return list;
	}
	
	public int deleteProucts(int deleteNo) {
		
		int result = 0;
		try {
			
			conn = CommonUtil.getConnection();
			String sql = "DELETE FROM PRODUCTS WHERE FNNNO = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deleteNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public ArrayList<ProductsVO> selectOne() {
		ArrayList<ProductsVO> list = null;
		
		try {
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT FNNNO");
			sql.append("  FROM PRODUCTS");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ProductsVO>();
			while (rs.next()) {
				ProductsVO pvo = new ProductsVO(
					rs.getString("FNNNO"));
			
				list.add(pvo);			
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		} 
		return list;
	}
	
	public int updateProducts(ProductsVO pvo) {
		int result = 0;
		
		try {
			conn = CommonUtil.getConnection();
			String sql = "";
			sql += "UPDATE PROUDCTS ";
			sql += "   SET FNNNAME = ? ";
			sql += "     , RATE = ? ";
			sql += " WHERE FNNNO = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pvo.getFnnName());
			pstmt.setDouble(2, pvo.getRate());
			pstmt.setString(3, pvo.getFnnNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public List<String> check() {
		List<String> fnnNo = null;
		try {
			conn = CommonUtil.getConnection();
			
			String sql = "SELECT FNNNO FROM PRODUCTS";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				fnnNo = new ArrayList<>();
				String no = rs.getString("FNNNO");
				fnnNo.add(no);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			CommonUtil.close(conn, pstmt, rs);
		}
		return fnnNo;
	}
}
