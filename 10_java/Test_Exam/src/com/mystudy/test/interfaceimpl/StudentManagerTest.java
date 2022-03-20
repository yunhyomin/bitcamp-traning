package com.mystudy.test.interfaceimpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StudentManagerTest {
		static List<StudentVO>list = new ArrayList<>();
		static StudentManagerImpl students = new StudentManagerImpl();
		
	public static void main(String[] args) {
		StudentVO stu1 = new StudentVO("342","홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("sdf","이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("3255","이순신", 90, 87, 77);
		StudentVO stu4 = new StudentVO("5558","윤효민", 100, 97, 93);
		StudentVO stu5 = new StudentVO("231","김구", 99, 99, 99);

		System.out.println("[현재 Students에 아무것도 insert()하지 않았을때 selectAll()]:"+ students.selectAll());
		//insert
		System.out.println("===============insert()===============");
		students.insert(stu1);
		
		students.insert(stu2);
			
		students.insert(stu3);
		
		students.insert(stu4);
		
		students.insert(stu5);
		
		//중복된 id insert
		students.insert(stu3);
		
		System.out.println("[현재 Students에 존재하는 데이터 ]:");
		students.selectAll();
		
		System.out.println("===============selectOne()===============");
		System.out.println("[현재 Students에서 id가 \"2\"인 학생을 찾아서 데이터출력]");
		students.selectOne("2");
		
		System.out.println("[현재 Students에서 id가 \"5558\"인 학생을 찾아서 데이터출력]");
		students.selectOne("5558");

		System.out.println("===============selectList()===============");
		System.out.println("[이름이 \"이순신\"인 학생을 찾아서 데이터출력]");
		students.selectList("이순신");
		
		System.out.println("===============update()===============");
		stu5 = new StudentVO("231","정약용", 90, 78, 84);
		students.update(stu5);
		
		//존재하는 id가 아닌 데이터 수정 
		stu5 = new StudentVO("5","정약용", 86, 99, 33);
		students.update(stu5);
		
		System.out.println("==============delete()===============");
		System.out.println("[id가 \"3255\"인 학생을 삭제한다]");
		students.delete("3255");

	}
	

}
