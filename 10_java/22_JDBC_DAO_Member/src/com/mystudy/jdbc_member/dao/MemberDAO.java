package com.mystudy.jdbc_member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mystudy.jdbc_member.common.CommonUtil;
import com.mystudy.jdbc_member.vo.MemberVO;
import java.sql.*;

public class MemberDAO {
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
		public Map<Integer,MemberVO> selectAll(){
			Map<Integer,MemberVO> map = null;
			conn = CommonUtil.getConnection();
			
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT ID,NAME,PASSWORD,PHONE,ADDRESS");
			sql.append("	FROM MEMBER");
			sql.append("ORDER BY ID");
			
			try {
				pstmt = conn.prepareStatement(sql.toString());
			
				rs = pstmt.executeQuery();
				map = new HashMap<>();
				int num = 1;
				while(rs.next()) {
					MemberVO vo = new MemberVO(	rs.getString("ID"),
												rs.getString("NAME"),
												rs.getString("PASSWORD"),
												rs.getString("PHONE"),
												rs.getString("ADDRESS"));
					map.put(num,vo);	
					num++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{CommonUtil.close(conn,pstmt,rs);}
			return map;
		}
		//SELECT : 하나의 데이터 조회(ID) -selectOne : StudentVO
		
			//SELECT : 하나의 데이터 조회(VO) -selectOne : StudentVO
			//SELECT : 로그인(ID,PASSWORD) = login : boolean
			//전체인원수 확인 getCountAll() :int
			
			//INSERT : VO객체를 받아서 입력 -insert : return은 int
			//UPDATE : VO객체를 받아서 수정 -update : return int
			//UPDATE : 패스워드수정,이름수정,폰수정등등 해보기 :boolean
			//DELETE : VO객체를 받아서 삭제 -delete : return int
			//DELETE : 키 값(ID)받아서 삭제 -delete : return int
			
	}		
			


