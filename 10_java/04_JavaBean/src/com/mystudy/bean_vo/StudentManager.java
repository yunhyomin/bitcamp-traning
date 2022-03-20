package com.mystudy.bean_vo;

import java.util.Arrays;

public class StudentManager {

		/*3명의 성적처리
		 홍길동, 100,90,81
		 이순신, 95,88,92
		 김유신, 90,87,77
		 ==================
		 */
	public static void main(String[] args) {
		//입력
		StudentVo stu = new StudentVo("홍길동",100,90,81);
		StudentVo stu1 = new StudentVo("이순신",188,88,92);
		StudentVo stu2 = new StudentVo("김유신",90,87,77);
		System.out.println(stu);
		System.out.println(stu1);
		System.out.println(stu2);
		
		System.out.println("------");
	
//		System.out.println(stu.getName()+"의 성적\n"+"국어점수"+stu.getKor()+"영어점수"+stu.getEng()
//							+"수학점수"+stu.getMath()+"총점"+stu.getTotal()+"평균"+stu.getAver());
		
		//출력
		stu.printData();
		stu1.printData();
		stu2.printData();
		//=================================================
		System.out.println("==============배열에 저장해서 사용==========");
		
		StudentVo[] students = new StudentVo[3];//StudentVo클래스 타입의 배열을 생성.크기는 3이다.
		students[0] = stu;
		students[1] = stu1;
		students[2] = stu2;
		System.out.println(Arrays.toString(students));
		
		System.out.println("===============배열데이터 화면 출력==========");
		
		students[0].printData();
		students[1].printData();
		students[2].printData();
		
		System.out.println("------------");
		printData(students);


	}
	//출력메소드
	static void printData(StudentVo[] students) {
		// 전달받은 배열 데이터를 화면에 출력
		for(StudentVo vo: students) {
			vo.printData();
		}
	}
}





















