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
	static FnnUserBankNumberVO fub = null;
	
	//insert(회원가입 정보넣기[모두])
	public static int insert(UsersVO user) {
		int result =0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("INSERT INTO USERS");
		sql.append("  VALUES(USERS_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1,user.getUserId());
			pstmt.setString(2,user.getUserPw());
			pstmt.setString(3,user.getUserName());
			pstmt.setInt(4,user.getPhone());
			pstmt.setString(5,user.getEmail());
			pstmt.setString(6,user.getAddress());
			pstmt.setDate(7,CommonUtil.transformDate(user.getBirth()));
			pstmt.setString(8,"use");
			result = pstmt.executeUpdate();
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
			usersId = new ArrayList<>();
			while(rs.next()) {
				usersId.add(rs.getString("USERID"));
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
		sql.append("  FROM USERS WHERE USERID=? and USERPW=? and exist = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			pstmt.setString(3,"use");
			
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
		sql.append(" WHERE USERNAME = ? AND PHONE = ? and exist = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setInt(2, phone);
			pstmt.setString(3,"use");
			
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
		sql.append("WHERE USERID = ? AND USERNAME = ? and exist =?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,name);
			pstmt.setString(3,"use");
			
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
	    		 + ",PHONE,NVL(EMAIL,'X'),NVL(ADDRESS,'X'),NVL(TO_CHAR(BIRTH),'X')");
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
				user.setPhone(rs.getInt("PHONE"));
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
	//회원탈퇴하면 users테이블에서 삭제하지 말고 exist컬럼만 notUser로 바꾼다(수정)
	public static int deleteUser(String id, String pw)
	{
		int result = 0;
		con = CommonUtil.getConnection();
		sql = new StringBuilder();
		sql.append("UPDATE USERS");
		sql.append(" SET EXIST = ? WHERE USERID = ? AND USERPW = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,"NOTUSER");
			pstmt.setString(2,id);
			pstmt.setString(3,pw);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return result;
	}
	//새상품목록조회(고객이 볼 수 있는 상품들)
	public static List<ProductsVO> newFnn()
	{
		List<ProductsVO>products = new ArrayList<>();
		con = CommonUtil.getConnection();
			
		sql = new StringBuilder();
		sql.append("SELECT FNNNO,FNNTYPE,FNNNAME,RATE,EMPNO");
		sql.append(" FROM PRODUCTS WHERE KEEP = '진행'");
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				product = new ProductsVO();
				product.setFnnNo(rs.getString("FNNNO"));
				product.setFnnName(rs.getString("FNNNAME"));
				product.setFnnType(rs.getString("FNNTYPE"));
				product.setRate(rs.getDouble("RATE"));
				product.setEmpNo(rs.getString("EMPNO"));
				products.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return products;
	}
	//로그인한 고객이 가입한 상품목록 
	 public static List<FnnUserBankNumberVO> joinFnn(String id)
	 {
		 List<FnnUserBankNumberVO> fubs = new ArrayList<>();
		 con = CommonUtil.getConnection();
		 sql = new StringBuilder();
		 sql.append("SELECT U.USERID,B.BANKNO,P.FNNNO,P.FNNTYPE,P.FNNNAME,P.RATE"
		 				+ "	,P.EMPNO,TO_CHAR(B.STARTDATE)");
		 sql.append(" FROM USERS U INNER JOIN BANKNUMBER B ON U.USERID = B.USERID");
		 sql.append("				INNER JOIN PRODUCTS P ON B.FNNNO = P.FNNNO");
		 sql.append(" WHERE U.USERID = ? and b.exist = ?");
		 
		 try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setString(2,"use");
			
			rs = pstmt.executeQuery();
			while(rs.next()) 
			{
				fub = new FnnUserBankNumberVO();
				fub.setUserId(rs.getString("USERID"));
				fub.setFnnNo(rs.getString("FNNNO"));
				fub.setFnnType(rs.getString("FNNTYPE"));
				fub.setFnnName(rs.getString("FNNNAME"));
				fub.setBankNo(rs.getString("BANKNO"));
				fub.setRate(rs.getDouble("RATE"));
				fub.setEmpNo(rs.getString("EMPNO"));
				fub.setStartDate(rs.getString("TO_CHAR(B.STARTDATE)"));
				
				fubs.add(fub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		 return fubs;
	 }
		
//======================================================================================
	//직원
	public static boolean empLogIn(String empNo,String empPw)
	{
		boolean pass = false;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("SELECT EMPNO,EMPPW FROM EMPLOYEES WHERE EMPNO =? AND EMPPW = ?");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,empNo);
			pstmt.setString(2,empPw);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				pass = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return pass;
	}
	//고객정보열람 
	public static List<UsersVO> printAll()
	{
		List<UsersVO> users = new ArrayList<>();
		
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("SELECT USERNO,USERID,USERPW,USERNAME,PHONE,EMAIL,ADDRESS,TO_CHAR(BIRTH),exist");
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
				user.setExist(rs.getString("EXIST"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt,rs);
		}
		return users;
	}
	
	//-------------------------------------------------------------
	//상품가입으로 인한 계좌테이블에 데이터추가 
	//계좌번호,생성일,고객아이디,직원번호,상품번호
	public static int insertBN(String fnnNo,String ID)
	{
		int result = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("INSERT INTO BANKNUMBER");
		sql.append(" VALUES (BANKNUMBER_SEQ.NEXTVAL,SYSDATE,?"
				+ "			,(SELECT EMPNO FROM PRODUCTS WHERE FNNNO = ?),?,?)");
						
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,ID);
			pstmt.setString(2,fnnNo);
			pstmt.setString(3,fnnNo);
			pstmt.setString(4,"use");
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return result;
	}
	//상품해지로 인한 계좌테이블의 exist컬럼 unuse로 바꿈
	public static int deleteBN(String bankNo,String id)
	{
		int result = 0;
		con = CommonUtil.getConnection();
		
		sql = new StringBuilder();
		sql.append("UPDATE BANKNUMBER");
		sql.append(" SET EXIST = ? WHERE USERID = ? AND BANKNO = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,"unuse");
			pstmt.setString(2,id);
			pstmt.setString(3,bankNo);
		
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			CommonUtil.close(con,pstmt);
		}
		return result;
	}
}











