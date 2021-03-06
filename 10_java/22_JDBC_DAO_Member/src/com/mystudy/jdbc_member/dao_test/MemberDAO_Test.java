package com.mystudy.jdbc_member.dao_test;

import java.util.ArrayList;
import java.util.List;
import com.mystudy.jdbc_member.dao.MemberDAO2;
import com.mystudy.jdbc_member.vo.MemberVO;

public class MemberDAO_Test {

	public static void main(String[] args) {
			MemberDAO2 dao = new MemberDAO2();
			System.out.println("------전체 데이터 조회 ------");
			List<MemberVO> list = new ArrayList<>();
			list = dao.selectAll();
			for( MemberVO vo : list) {
				System.out.println(vo);
			}
			System.out.println("------하나의 데이터 조회------");
			MemberVO vo1 = dao.selectOne("sdfsdf");
			System.out.println(vo1);

			System.out.println("------logIn()------");
			boolean login = dao.logIn("HONG4","1234");
			System.out.println("로그인 여부:"+login);

			System.out.println("-----getCountAll()-----");
			int cn = dao.getCountAll();
			System.out.println("전체인원수:"+cn);
			
			System.out.println("-----insert()------");
			MemberVO vo2 = new MemberVO("3333","테스트","테스트pw","테스트폰","테스트주소");
			dao.insert(vo2);




	}

}
