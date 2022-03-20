package com.mystudy.test.serverprogram;

import java.util.ArrayList;
import java.util.List;

public class StudentManager {

	public static void main(String[] args) {
		StudentVO stu1 = new StudentVO("홍길동", 100, 90, 81);
		StudentVO stu2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO stu3 = new StudentVO("김유신", 90, 87, 77);
		StudentVO stu4 = new StudentVO("윤효민", 100, 97, 93);
		StudentVO stu5 = new StudentVO("김구", 99, 99, 99);

		List<StudentVO> list = new ArrayList<>();

		list.add(stu1);
		list.add(stu2);
		list.add(stu3);
		list.add(stu4);
		list.add(stu5);
		
		printData(list);
		System.out.println("=========홍길동 학생의 영어와 수학점수 수정=============");

		for (int i=0; i<list.size(); i++) {
			if ("홍길동".equals(list.get(i).getName())) {
				list.get(i).setEng(95);
				list.get(i).setMath(85);
				list.get(i).printData();
			}
		}
		System.out.println("====================================================");

		printData(list);
		System.out.println("====================================================");

		System.out.println("성명\t총점\t평균");

		for (StudentVO vo : list) {
			System.out.println(vo.getName()+"\t"+vo.getTot()+"\t"+vo.getAvg());
		}
	}
	static void printData(List<StudentVO> list) {
		System.out.println("성명\t국어점수\t영어점수\t수학점수\t총점\t평균");
		for (StudentVO vo : list) {
			vo.printData();
		}
	}
}
