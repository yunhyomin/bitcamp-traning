package com.mystudy.list4_vo;

import java.util.ArrayList;
import java.util.List;
 
public class StudentManager {
	public static void main(String[] args) {
		/*List를 사용한 성적처리
		 1.3명의 학생데이터(성명,국어,영어,수학)를 StudentVo클래스를 이용해서 만들고(저장하고)
		 	"홍길동",100,90,81
		 	"이순신",95,88,92
		 	"김유신",90,87,77
		 2.ArrayList타임의 변수(list)에 저장하고 
		 3.list에 있는 데이터를 사용해서 화면 출력
		 	성명		국어		영어		수학		총점		평균
		 	----------------------------
		 	홍길동	100		90		81		...
		 */
		
		StudentVo vo = new StudentVo("홍길동",100,90,81);
		StudentVo vo2 = new StudentVo("이순신",95,88,92);
		StudentVo vo3 = new StudentVo("김유신",90,87,77);
		
		List<StudentVo> list = new ArrayList<>();

		list.add(vo);
		list.add(vo2);
		list.add(vo3);
		
		System.out.println("성명\t국어\t영어\t수학\t총점\t평균");
		System.out.println("--------------------------------------------");

		for(int i=0; i<list.size(); i++) {
			StudentVo vo4 = list.get(i);
			vo4.printData();

		}
		System.out.println("====리스트의 데이터값 변경====");
		System.out.println("---데이터 변경 전---");
		vo.printData();
		list.get(0).printData();
		
		list.get(0).setKor(95);


		System.out.println("---데이터 변경 후---");
		vo.printData();
		list.get(0).printData();

	
	}
	static void printData(List<StudentVo> list) {
		for(StudentVo vo : list) {
			vo.printData();
		}
	}

}
