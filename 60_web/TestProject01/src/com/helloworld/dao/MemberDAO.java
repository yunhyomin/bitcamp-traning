package com.helloworld.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.helloworld.mybatis.DBService;
import com.helloworld.vo.MemberVO;


public class MemberDAO {
	public static int getIdPw(String id,String pw){
		Map<String,String> map = new HashMap<>();
		
		map.put("id", id);
		map.put("pw", pw);
		
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("hw.idPw",map);
		ss.close();
		return result;
	}
	
	public static List<MemberVO> getAll(){
		SqlSession ss = DBService.getFactory().openSession();
		List<MemberVO> list = ss.selectList("hw.all");
		ss.close();
		return list;
	}
	
	public static MemberVO selectOne(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		MemberVO vo = ss.selectOne("hw.one", id);
		return vo;
	}
}
