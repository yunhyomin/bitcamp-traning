package com.helloworld.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.helloworld.mybatis.DBService;
import com.helloworld.vo.TodayVO;

public class TodayDAO {
	

	public static int chIp(Map<String, String> map) {
		SqlSession session = DBService.getFactory().openSession();
		int result = session.selectOne("hw.chIp",map);
		System.out.println("result:"+result);
		
		return result;
	}
	
	
}
