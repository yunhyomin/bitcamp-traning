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
	static Connection con = null;
	static PreparedStatement pstmt = null;
	static ResultSet rs = null;
	static StringBuilder sql = null;
	static List<ProductsVO> products =null;
	
	//상품등록
	public static int insertProducts(ProductsVO pvo,String empNo) {
		int result = 0;
		
		con = CommonUtil.getConnection();
		try {
			sql = new StringBuilder();
			sql.append("INSERT INTO PRODUCTS (FNNNO, FNNTYPE, FNNNAME,RATE,EMPNO,KEEP)");
			sql.append("  VALUES(?,?,?,?,?,'진행')");
			
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, pvo.getFnnNo());
			pstmt.setString(2, pvo.getFnnType());
			pstmt.setString(3, pvo.getFnnName());
			pstmt.setDouble(4, pvo.getRate());
			pstmt.setString(5,empNo);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("오류발생");
			e.printStackTrace();
		} finally {
			CommonUtil.close(con, pstmt);
		}
		return result;
	}
	//직원이 상품목록을 조회할때
	public static List<ProductsVO> selectAll() 
	{
		products = new ArrayList<>();
		
			con = CommonUtil.getConnection();
			
			sql = new StringBuilder();
			sql.append("SELECT FNNNO,FNNTYPE,FNNNAME,RATE,EMPNO,KEEP");
			sql.append("  FROM PRODUCTS");
			try {
				pstmt = con.prepareStatement(sql.toString());
				rs = pstmt.executeQuery();
				ProductsVO product = null;
				while (rs.next()) {
				product = new ProductsVO();
				product.setFnnNo(rs.getString("FNNNO"));						
				product.setFnnType(rs.getString("FNNTYPE"));						
				product.setFnnName(rs.getString("FNNNAME"));						
				product.setRate(rs.getDouble("RATE"));						
				product.setEmpNo(rs.getString("EMPNO"));						
				product.setKeep(rs.getString("KEEP"));					
				products.add(product);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(con, pstmt, rs);
		}
		return products;
	}
	//상품삭제 
	public static int deleteProducts(String deleteNo) {
		int result = 0;
		
			con = CommonUtil.getConnection();
			String sql = "DELETE FROM PRODUCTS WHERE FNNNO = ? ";
			
		try {	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, deleteNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(con, pstmt);
		}
		return result;
	}
	
	public List<ProductsVO> selectOne() {
		products = new ArrayList<ProductsVO>();
		try {
			con = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT FNNNO");
			sql.append("  FROM PRODUCTS");
			
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ProductsVO pvo = new ProductsVO(
					rs.getString("FNNNO"));
			
				products.add(pvo);			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(con, pstmt, rs);
		} 
		return products;
	}
	//상품수정
	public static int updateProducts(ProductsVO pvo,String empNo) {
		int result = 0;
		
		try {
			con = CommonUtil.getConnection();
			sql = new StringBuilder();
			sql.append("UPDATE PRODUCTS ");
			sql.append("   SET FNNNAME = ?,RATE = ?,EMPNO = ? ");
			sql.append(" WHERE FNNNO = ?");
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1,pvo.getFnnName());
			pstmt.setDouble(2,pvo.getRate());
			pstmt.setString(3,empNo);
			pstmt.setString(4,pvo.getFnnNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(con, pstmt);
		}
		return result;
	}
	//상품번호 있는지 확인 
	public static boolean check(String fnnNo) {
		boolean pass = false;
		try {
			con = CommonUtil.getConnection();
			String sql = "SELECT FNNNO FROM PRODUCTS WHERE FNNNO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,fnnNo);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pass = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CommonUtil.close(con, pstmt, rs);
		}
		return pass;
	}
}
