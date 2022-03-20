package com.mystudy.jdbc_dao;

import java.util.List;

public class StudentDAO_Test {

	public static void main(String[] args) {
		StudentDAO dao = new StudentDAO();
		List<StudentVO> list = dao.selectAll();
		printAll(list);
		
		System.out.println("--------1개의 데이터조회_(id)-----------");
		StudentVO vo =dao.selectOne("2021003");
		System.out.println(vo);
		System.out.println(vo.getId());
		System.out.println(vo.getName());
		StudentVO vo2 = dao.selectOne("23242");
		System.out.println(vo2);

		
		System.out.println("--------1개의 데이터조회_(StudentVO)-----");
		vo = dao.selectOne(dao.selectOne("2021003"));
		System.out.println(vo);
		System.out.println("--------name으로 데이터 조회--------------");
		List<StudentVO> list1 = dao.selectList("홍길동");
	    printAll(list1);

		
		System.out.println("-------INSERT---------");
		//StudentVO 받아서 int 리턴 
		//StudentVO insertVo = new StudentVO("2021009","강감찬",39,46,100);
		//dao.insert(insertVo);
		System.out.println("-------update---------");
		//StudetnVO 받아서 int 리턴 
		StudentVO vo1 = new StudentVO("20211002","윤효민",100,97,86);
		dao.update(vo1);
		//name수정 
		dao.updateName("2021006","안중근");
		
		System.out.println("-------delete----------");
		//StudentVO받아서 삭제
		dao.delete(dao.selectOne("20211001"));
		dao.delete("20211111");
		dao.delete("2021009");
		
	}
	private static void printAll(List<StudentVO> list) {
		for(StudentVO vo : list) {
			System.out.println(vo);

		}
	}


}