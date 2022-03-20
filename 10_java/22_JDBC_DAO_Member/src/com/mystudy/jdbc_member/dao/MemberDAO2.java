package com.mystudy.jdbc_member.dao;

import java.util.ArrayList;
import java.util.List;

import com.mystudy.jdbc_member.common.CommonUtil;
import com.mystudy.jdbc_member.vo.MemberVO;
import java.sql.*;

public class MemberDAO2 {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//SELECT : 테이블 전체 데이터 조회 -selectAll : List<StudentVO>
		//SELECT : 하나의 데이터 조회(ID) -selectOne : StudentVO
		//SELECT : 하나의 데이터 조회(VO) -selectOne : StudentVO
		//INSERT : VO객체를 받아서 입력 -insert : return은 int
		//UPDATE : VO객체를 받아서 수정 -update : return int
		//DELETE : VO객체를 받아서 삭제 -delete : return int
		//DELETE : 키 값(ID)받아서 삭제 -delete : return int
		
		//SELECT : 로그인(ID,PASSWORD) = login : boolean
//==================================================================
	//메소드구간
	
		//SELECT : 테이블 전체 데이터 조회 -selectAll : List<MemberVO>
		public List<MemberVO> selectAll(){
			List<MemberVO> list = null;
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,PASSWORD,PHONE,ADDRESS");
			sql.append("  FROM MEMBER");
			sql.append(" ORDER BY ID");
			
			try {
				pstmt = conn.prepareStatement(sql.toString());
			
				rs = pstmt.executeQuery();
				list = new ArrayList<>();
				while(rs.next()) {
					MemberVO vo = new MemberVO(	rs.getString("ID"),
												rs.getString("NAME"),
												rs.getString("PASSWORD"),
												rs.getString("PHONE"),
												rs.getString("ADDRESS"));
					list.add(vo);	
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{CommonUtil.close(conn,pstmt,rs);}
			return list;
		}
		//SELECT : 하나의 데이터 조회(ID) -selectOne : StudentVO
		public MemberVO selectOne(String id) {
			MemberVO vo = null;
			
			conn = CommonUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,PASSWORD,PHONE,ADDRESS");
			sql.append("  FROM MEMBER WHERE ID = ?");
			
			try {
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1,id);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					vo = new MemberVO(rs.getString("ID")
									  ,rs.getString("NAME")
									  ,rs.getString("PASSWORD")
									  ,rs.getString("PHONE")
									  ,rs.getString("ADDRESS")
									  );
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				CommonUtil.close(conn,pstmt,rs);
			}
			return vo;
		}
		//SELECT : 하나의 데이터 조회(VO) -selectOne : StudentVO
		public MemberVO selectOne(MemberVO vo) {
			return selectOne(vo.getId());
		}
		
		//SELECT : 로그인(ID,PASSWORD) = login : boolean
		public boolean logIn(String id, String password) {
			boolean login = false;
			
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,PASSWORD,PHONE,ADDRESS FROM MEMBER");
			sql.append(" WHERE ID = ? AND PASSWORD = ?");
			
			try {
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1,id);
				pstmt.setString(2,password);
				
				rs = pstmt.executeQuery();
				login = true;
				
				MemberVO vo = null;
				while(rs.next()) {
					vo = new MemberVO(rs.getString("ID")
							  		,rs.getString("NAME")
							  		,rs.getString("PASSWORD")
							  		,rs.getString("PHONE")
							  		,rs.getString("ADDRESS")
							  		);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				CommonUtil.close(conn,pstmt,rs);
			}
			return login;
		}
		//전체인원수 확인 getCountAll() :int
		public int getCountAll() {
			int cn =0;
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,PASSWORD,PHONE,ADDRESS");
			sql.append(" FROM MEMBER");
			
			try {
				pstmt = conn.prepareStatement(sql.toString());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MemberVO vo = new MemberVO(rs.getString("ID")
					  							,rs.getString("NAME")
					  							,rs.getString("PASSWORD")
					  							,rs.getString("PHONE")
					  							,rs.getString("ADDRESS"));
					cn++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				CommonUtil.close(conn,pstmt,rs);
			}
			return cn;
		}
			
		//INSERT : VO객체를 받아서 입력 -insert : return은 int
		public int insert(MemberVO vo) {
			int result = 0;
			
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO MEMBER");
			sql.append(" VALUES(?,?,?,?,?)");
			
			try {
				pstmt = conn.prepareStatement(sql.toString());
				
				pstmt.setString(1,vo.getId());
				pstmt.setString(2,vo.getName());
				pstmt.setString(3,vo.getPassWord());
				pstmt.setString(4,vo.getPhone());
				pstmt.setString(5,vo.getAdress());
				
				result = pstmt.executeUpdate();
				System.out.println(">>수정처리건수:"+result);

			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				CommonUtil.close(conn,pstmt);
			}
			return result;
		}
		//UPDATE : VO객체를 받아서 수정 -update : return int
		public int update(MemberVO vo) {
			int result = 0;
			return result;
		}
		//UPDATE : 패스워드수정,이름수정(vo or id,name),폰수정,주소수정 등등 해보기 :boolean
		
			//DELETE : VO객체를 받아서 삭제 -delete : return int
			//DELETE : 키 값(ID)받아서 삭제 -delete : return int
			
	}		
			


