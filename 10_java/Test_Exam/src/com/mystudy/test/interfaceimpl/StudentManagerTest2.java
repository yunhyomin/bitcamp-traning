package com.mystudy.test.interfaceimpl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StudentManagerTest2 {
		static List<StudentVO>list = new ArrayList<>();
		static StudentManagerImpl2 students = new StudentManagerImpl2();
		//메소드
		static void insertResult(int e) {
			if(e == 1) {
				System.out.println(">>>>>>[insert!]");
			}else {
				System.out.println(">>>>>>[fail] 동일한 Id가 존재합니다");
			}
		}
		static void updateResult(int e) {
			if(e == 1) {
				System.out.println(">>>>>>[update!]");
				printList(students.selectAll());
			}else {
				System.out.println(">>>>>>[fail] 수정할 id가 존재하지 않습니다");
			}
		}
		static void deleteResult(int e) {
			if(e == 1) {
				System.out.println(">>>>>>[delete!]");
				printList(students.selectAll());
			}else {
				System.out.println(">>>>>>[fail] 삭제할 id가 존재하지 않습니다");
			}
		}
		
	public static void main(String[] args) {
		StudentVO stu1 = new StudentVO("342","홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("sdf","이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("3255","이순신", 90, 87, 77);
		StudentVO stu4 = new StudentVO("5558","윤효민", 100, 97, 93);
		StudentVO stu5 = new StudentVO("231","김구", 99, 99, 99);

		System.out.println("[현재 Students에 아무것도 insert()하지 않았을때 selectAll()]:"+ students.selectAll());
		//insert
		System.out.println("===============insert()===============");
		int result = students.insert(stu1);
		insertResult(result);
		result = students.insert(stu2);
		insertResult(result);		
		result = students.insert(stu3);
		insertResult(result);
		result = students.insert(stu4);
		insertResult(result);
		result = students.insert(stu5);
		insertResult(result);
		//중복된 id insert
		insertResult(students.insert(stu3));
		
		System.out.println("[현재 Students에 존재하는 데이터 ]:");
		printList(students.selectAll());
		
		System.out.println("===============selectOne()===============");
		System.out.println("[현재 Students에서 id가 \"2\"인 학생을 찾아서 데이터출력]");
		seletOneResult(students.selectOne("2"));
		
		System.out.println("[현재 Students에서 id가 \"5558\"인 학생을 찾아서 데이터출력]");
		seletOneResult(students.selectOne("5558"));

		System.out.println("===============selectList()===============");
		System.out.println("[이름이 \"이순신\"인 학생을 찾아서 데이터출력]");
		printList(students.selectList("이순신"));
		
		System.out.println("===============update()===============");
		stu5 = new StudentVO("231","정약용", 90, 78, 84);
		updateResult(students.update(stu5));
		
		//동일한 id가 아닌 데이터 수정 
		stu5 = new StudentVO("5","정약용", 86, 99, 33);
		updateResult(students.update(stu5));
		
		System.out.println("==============delete()===============");
		System.out.println("-----id가 \"3255\"인 학생을 삭제한다-----");
		deleteResult(students.delete("3255"));

	}
	//데이터 출력 메소드 
	static void printList(List<StudentVO> list) {
		System.out.println("------------------------------------------------------------");
		for (StudentVO stu : list) {
			System.out.printf("id:%4s name:%4s 국어점수:%3d 영어점수:%3d 수학점수:%3d 총점:%3d 평균:%.2f\n"
							,stu.getId(),stu.getName(),stu.getKor(),stu.getEng(),stu.getMath(),stu.getTot(),stu.getAvg());
		}
		System.out.println("------------------------------------------------------------");
	}
	
	static void seletOneResult(StudentVO vo) {
		if(vo != null) {
			System.out.println("------------------------------------------------------------");
			System.out.printf("id:%4s name:%4s 국어점수:%3d 영어점수:%3d 수학점수:%3d 총점:%3d 평균:%.2f\n"
							,vo.getId(),vo.getName(),vo.getKor(),vo.getEng(),vo.getMath(),vo.getTot(),vo.getAvg());
			System.out.println("------------------------------------------------------------");
		}else {
			System.out.println(">>>>>[Result]찾으시는 데이터가 존재하지않습니다");
		}
	}
		
	

	

}
