package com.project.bank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.project.bank.util.CommonUtil;
import com.project.bank.vo.FnnUserBankNumberVO;
import com.project.bank.vo.ProductsVO;
import com.project.bank.vo.UsersVO;


public class BankDAO {
	
	static Connection con = null;
	static PreparedStatement pstmt=null;
	static ResultSet rs=null;
	static StringBuilder sql = null;
	static UsersVO user = null;
	static ProductsVO product = null;
	static FnnUserBankNumberVO Fnn = null;
	
	//insert(회원가입 정보넣기[모두])
	public static int insert(UsersVO users) {
		int result =0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("INSERT INTO USERS");
		sql.append("  VALUES(USERS_SEQ.NEXTVAL,?,?,?,?,?,?,?)");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1,users.getUserId());
			pstmt.setString(6,users.getUserPw());
			pstmt.setString(2,users.getUserName());
			pstmt.setInt(3,users.getPhone());
			pstmt.setString(4,users.getEmail());
			pstmt.setString(5,users.getAddress());
			pstmt.setDate(7,CommonUtil.transformDate(users.getBirth()));

			result = pstmt.executeUpdate();
			System.out.println(">>입력건수 :"+result);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return result;
	}
	
	//아이디 select 
	public static List<String> existId() {
		List<String> usersId = null;
		con = CommonUtil.getConnection();
		
		String sql = "SELECT USERID FROM USERS";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				usersId = new ArrayList<>();
				String id= rs.getString("USERID");
				usersId.add(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return usersId;
	}
    
    //아이디와 패스워드 -정보가일치하면 true
	public static boolean selectIdPw(String id,String pw) {
		boolean pass = false;
		
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("SELECT USERID,USERPW");
		sql.append("  FROM USERS WHERE USERID=? and USERPW=?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return pass;
    
    }
	//id찾기 
	public static String findId(String name, int phone) {
		String id = null;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("SELECT USERID FROM USERS");
		sql.append(" WHERE USERNAME = ? AND PHONE = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setInt(2, phone);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("USERID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return id;
	}
	//비밀번호 찾기 
	public static String findPw(String id, String name) {
		String pw = null;
		
		con = CommonUtil.getConnection();
		sql = new StringBuilder();
		sql.append("SELECT USERPW FROM USERS");
		sql.append("WHERE USERID = ? AND USERNAME = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString("USERPW");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return pw;
	}
	//로그인 회원 정보 조회 
	public static UsersVO selectOne(String id,String pw) {
	    user = null; 		
	    con = CommonUtil.getConnection();
	    
	    sql = new StringBuilder();
	    sql.append("SELECT USERID,USERPW,USERNAME"
	    		 + ",NVL(PHONE,0),NVL(EMAIL,'X'),NVL(ADDRESS,'X'),NVL(TO_CHAR(BIRTH),'X')");
	    sql.append("  FROM USERS WHERE USERID = ? AND USERPW = ?");
	    try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				user = new UsersVO();
				user.setUserId(rs.getString("USERID"));
				user.setUserPw(rs.getString("USERPW"));
				user.setUserName(rs.getString("USERNAME"));
				user.setPhone(rs.getInt("NVL(PHONE,0)"));
				user.setEmail(rs.getString("NVL(EMAIL,'X')"));
				user.setAddress(rs.getString("NVL(ADDRESS,'X')"));
				user.setBirth(rs.getString("NVL(TO_CHAR(BIRTH),'X')"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return user;
	}
	//로그인 회원 정보수정
	//비밀번호수정
	public static int updatePw(String ID,String PW,String pw)
	{
		int rs = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("UPDATE USERS");
		sql.append(" SET USERPW = ?");
		sql.append("WHERE USERID = ? AND USERPW = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,pw);
			pstmt.setString(2,ID);
			pstmt.setString(3,PW);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return rs;
	}
	//이름수정
	public static int updateName(String ID,String PW,String Name)
	{
		int rs = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("UPDATE USERS");
		sql.append(" SET USERNAME = ?");
		sql.append("WHERE USERID = ? AND USERPW = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,Name);
			pstmt.setString(2,ID);
			pstmt.setString(3,PW);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return rs;
	}
	//전화번호수정
	public static int updatePhone(String ID,String PW,int Phone)
	{
		int rs = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("UPDATE USERS");
		sql.append(" SET PHONE = ?");
		sql.append("WHERE USERID = ? AND USERPW = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,Phone);
			pstmt.setString(2,ID);
			pstmt.setString(3,PW);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return rs;
	}
	//이메일수정
	public static int updateEmail(String ID,String PW,String Email)
	{
		int rs = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("UPDATE USERS");
		sql.append(" SET EMAIL = ?");
		sql.append("WHERE USERID = ? AND USERPW = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,Email);
			pstmt.setString(2,ID);
			pstmt.setString(3,PW);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return rs;
	}
	//주소수정
	public static int updateAddress(String ID,String PW,String Address)
	{
		int rs = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("UPDATE USERS");
		sql.append(" SET ADDRESS= ?");
		sql.append("WHERE USERID = ? AND USERPW = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,Address);
			pstmt.setString(2,ID);
			pstmt.setString(3,PW);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return rs;
	}
	//생년월일수정
	public static int updateBirth(String ID,String PW,String Birth)
	{
		int rs = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("UPDATE USERS");
		sql.append(" SET BIRTH = ?");
		sql.append("WHERE USERID = ? AND USERPW = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setDate(1,CommonUtil.transformDate(Birth));
			pstmt.setString(2,ID);
			pstmt.setString(3,PW);
			
			rs = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return rs;
	}
	//회원탈퇴로 인한 users테이블에서 user삭제 
	public static int deleteUser(String id, String pw)
	{
		int result = 0;
		con = CommonUtil.getConnection();
		sql = new StringBuilder();
		sql.append("DELETE FROM USERS");
		sql.append(" WHERE ID = ? AND FW = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return result;
	}
	//--------------------------------------------------------
	//직원
	//고객정보열람 
	public static List<UsersVO> printAll()
	{
		List<UsersVO> users = new ArrayList<>();
		
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("SELECT USERNO,USERID,USERPW,USERNAME,PHONE,EMAIL,ADDRESS,TO_CHAR(BIRTH)");
		sql.append(" FROM USERS");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user = new UsersVO();
				user.setUserNo(rs.getInt("USERNO"));
				user.setUserId(rs.getString("USERID"));
				user.setUserPw(rs.getString("USERPW"));
				user.setUserName(rs.getString("USERNAME"));
				user.setPhone(rs.getInt("PHONE"));
				user.setEmail(rs.getString("EMAIL"));
				user.setAddress(rs.getString("ADDRESS"));
				user.setBirth(rs.getString("TO_CHAR(BIRTH)"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return users;
	}
	//상품목록 조회 (직원이 보는 상품목록)
	public static List<ProductsVO> printFnn()
	{
		List<ProductsVO> products = new ArrayList<>();
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("SELECT FNNNO,FNNTYPE,FNNNAME,RATE,NVL(USERNO,0),KEEP");
		sql.append("  FROM PRODUCTS");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
			product = new ProductsVO(rs.getString("FNNNO"),
									rs.getString("FNNTYPE"),
									rs.getString("FNNNAME"),
									rs.getDouble("RATE"),
									rs.getInt("NVL(USERNO,0)"),
									rs.getString("KEEP"));
			products.add(product);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return products;
	}
	//새상품목록조회(고객이 볼 수 있는 상품들)--목록들만 
	public static List<FnnUserBankNumberVO> newFnn()
	{
		List<FnnUserBankNumberVO> products = new ArrayList<>();
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("SELECT FNNNO,FNNTYPE,FNNNAME");
		sql.append(" FROM PRODUCTS WHERE KEEP = '진행'");
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(true) {
				Fnn = new FnnUserBankNumberVO();
				Fnn.setFnnNo(rs.getString("FNNNO"));
				Fnn.setFnnName(rs.getString("FNNNAME"));
				Fnn.setFnnType(rs.getString("FNNTYPE"));
				products.add(Fnn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return products;
	}
	

}
