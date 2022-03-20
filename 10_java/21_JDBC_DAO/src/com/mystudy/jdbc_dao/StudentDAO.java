package com.mystudy.jdbc_dao;

import java.util.ArrayList;
import java.util.List;

import java.sql.*;
//DAO,Dao : Data Access Object / Database Access Object
//데이터베이스(DB)와 연동해서 CRUD를 구현하는 클래스 
public class StudentDAO {
	//상수화된 변수 
	private static String DRIVER = "oracle.jdbc.OracleDriver";
	private String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private String USER = "MYSTUDY";
	private String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//static은 non static을 쓸 수 없다 
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
	//SELECT : 테이블 전체 데이터 조회 -selectAll : List<StudentVO>
	//SELECT : 하나의 데이터 조회(ID) -selectOne : StudentVO
	//SELECT : 하나의 데이터 조회(VO) -selectOne : StudentVO
	//INSERT : VO객체를 받아서 입력 -insert : return은 int
	//UPDATE : VO객체를 받아서 수정 -update : return int
	//DELETE : VO객체를 받아서 삭제 -delete : return int
	//DELETE : 키 값(ID)받아서 삭제 -delete : return int
	
	//SELECT : 테이블 전체 데이터 조회 -selectAll : List<StudentVO>
	public List<StudentVO> selectAll(){
		List<StudentVO> list = null;
		try {
			//2.DB연결 - Connection 객체 생성  <-DriverManager
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			
			//3.SQL문 실행 
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,KOR,ENG,MATH,TOT,AVG");
			sql.append("    FROM STUDENT");
			sql.append(" ORDER BY ID");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			rs = pstmt.executeQuery();
		
			//4.SQL문 실행결과에 대한 처리 
			list = new ArrayList<>();
			while(rs.next()) {
				//DB데이터 하나를 StudentVO에 저장 +리스트 추가 
				StudentVO vo= new StudentVO(rs.getString("ID")
										  , rs.getString("NAME")
										  , rs.getInt("KOR")
										  , rs.getInt("ENG")
										  , rs.getInt("MATH")
										  , rs.getInt("TOT")
										  , rs.getDouble("AVG"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(conn,pstmt,rs);
		}
		return list;
	}
	//SELECT : 하나의 데이터 조회(ID) -selectOne : StudentVO
	public StudentVO selectOne(String id) {
		StudentVO vo = null;
		//(할일)DB연결하고 sql문 실행해서 결과값을 vo변수에 저장하고 리턴 
		try {
			//2.DB연결 - Connection 객체 생성  <-DriverManager
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			//3.SQL문 실행 
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,KOR,ENG,MATH,TOT,AVG");
			sql.append("    FROM STUDENT");
			sql.append(" WHERE ID = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			//4.SQL문 실행결과에 대한 처리 
			while(rs.next()) {
				//DB데이터 하나를 StudentVO에 저장 +리스트 추가 
				vo = new StudentVO(rs.getString("ID")
										  , rs.getString("NAME")
										  , rs.getInt("KOR")
										  , rs.getInt("ENG")
										  , rs.getInt("MATH")
										  , rs.getInt("TOT")
										  , rs.getDouble("AVG"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}
		return vo;
	}
	
	private void close(Connection conn,PreparedStatement pstmt,ResultSet rs){
		try {
			if(rs!=null)rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(pstmt!=null)pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	private void close(Connection conn,PreparedStatement pstmt){
		
		try {
			if(pstmt!=null)pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//SELECT : 하나의 데이터 조회(VO) -selectOne : StudentVO
	public StudentVO selectOne(StudentVO vo) {
		return selectOne(vo.getId());
	}
	
	//(개인실습)SELECT : 이름으로 데이터 조회(NAME)-selectList : List<StudentVO>
	public List<StudentVO> selectList(String name){
		List<StudentVO> list = null;
		try {
			//DB연결 
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			
			//sql문 작성 
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,KOR,ENG,MATH,TOT,AVG");
			sql.append("	FROM STUDENT");
			sql.append(" WHERE NAME = ?");
			
			//Statement객체생성 
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			
			//SQL문 실행
			rs = pstmt.executeQuery();
			
			//SQL문 실행 결과에 대한 처리 
			list = new ArrayList<>();
			if(rs.next()) {
				StudentVO vo  = new StudentVO(rs.getString("ID"),
											  rs.getString("NAME"),
											  rs.getInt("KOR"),
											  rs.getInt("ENG"),
											  rs.getInt("MATH"),
											  rs.getInt("TOT"),
											  rs.getDouble("AVG"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}
		return list;
	}
	
	//INSERT : VO객체를 받아서 입력 -insert : return은 int
	public int insert(StudentVO vo) {
		int result = 0;
		try {
			//DB연결
			conn = DriverManager.getConnection(URL,USER, PASSWORD);
			
			//SQL문 실행
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO STUDENT");
			sql.append("	(ID,NAME,KOR,ENG,MATH,TOT,AVG)");
			sql.append(" VALUES(?,?,?,?,?,?,?)");
			
			pstmt = conn.prepareStatement(sql.toString());
			//?값 설정
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3,vo.getKor());
		    pstmt.setInt(4,vo.getEng());
		    pstmt.setInt(5,vo.getMath());
		    pstmt.setInt(6,vo.getTot());
		    pstmt.setDouble(7,vo.getAvg());
		    
		    //SQL 실행
			result = pstmt.executeUpdate();
		    System.out.println(">>삽입처리건수:"+result);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}
		return result;
	}
	//UPDATE : VO객체를 받아서 수정 -update : return int
	public int update(StudentVO vo) {
		int result = 0;
		//DB연결 
		try {
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			
			//SQL문 작성 
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE STUDENT");
			sql.append("	SET NAME=?,KOR=?,ENG=?,MATH=?");
			sql.append(" WHERE ID = ?"); 
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(5,vo.getId());
			pstmt.setString(1,vo.getName());
			pstmt.setInt(2,vo.getKor());
			pstmt.setInt(3,vo.getEng());
			pstmt.setInt(4,vo.getMath());
			
			//SQL 실행 
			result = pstmt.executeUpdate();
			//실행 후 처리 
			System.out.println(">>수정처리건수:"+result);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//클로징
			close(conn,pstmt);
		}
		return result;
	}
	//(개인실습) UPDATE : 이름수정(id,name) - update : int
	public int updateName(String id, String name) {
		int result=0;
		try {
			conn= DriverManager.getConnection(URL,USER,PASSWORD);
			
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE STUDENT");
			sql.append("	SET NAME = ? ");
			sql.append(" WHERE ID =? ");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,name);
			pstmt.setString(2,id);
			
			result = pstmt.executeUpdate();
			System.out.println(">>수정처리건수:"+result);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}
		return result;
	}
	//DELETE : VO객체를 받아서 삭제 -delete : return int
	public int delete(StudentVO vo) {
		int result = 0;
		
		try {
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			
			String sql = "DELETE FROM STUDENT WHERE ID = ?";
			
			try{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,vo.getId());
				result = pstmt.executeUpdate();
				System.out.println(">>삭제처리건수:"+result);
			}catch(NullPointerException e) {
				System.out.println("삭제하고자하는 데이터가 없습니다");
			}
		} catch (SQLException  e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}
		return result;
	}
	//DELETE : 키 값(ID)받아서 삭제 -delete : return int
	public int delete(String id) {
		return delete(selectOne(id));
	}

}













