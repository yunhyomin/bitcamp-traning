package com.mystudy.set2_hashset_vo;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class StudentSetManager {
	public static void main(String[] args) {
		// 1. 3명의 학생데이터(성명,국어,영어,수학)를
		// StudentVO 클래스를 이용해서 만들고(저장하고)
		// "홍길동", 100, 90, 81
		// "이순신", 95, 88, 92
		// "김유신", 90, 87, 77
		// ---------------------
		// 2. HashSet<StudentVO> 타입의 변수(set)에 저장하고
		// 3. set에 있는 데이터를 사용해서 화면출력
		// 성명 국어 영어 수학 총점 평균
		// --------------------------
		// 홍길동 100 90 81 270 90.33
		// ...
		// -----------------------------
		// 4. 저장된 set에 있는 김유신 학생의 국어 점수를 95점으로 수정
		// 5. "김유신" 학생의 성적만 화면 출력
		// -----------------------------------------------

		StudentVO vo = new StudentVO("홍길동", 100, 90, 81);
		StudentVO vo2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO vo3 = new StudentVO("김유신", 90, 87, 77);
		
		Set<StudentVO> set = new HashSet<>();//Set는 HashSet의 인터페이스므로 둘다 가능 
		set.add(vo);
		set.add(vo2);
		set.add(vo3);
		
		System.out.println("성명\t국어점수\t영어점수\t수학점수\t총점\t평균");
	//3.
		//방법1 메소드생성
		System.out.println("---------------");

		printData(set);
		
		//방법2 iterator()
		System.out.println("----------------");
		Iterator<StudentVO> ite =  set.iterator();
		while(ite.hasNext()) {
			StudentVO svo = ite.next();
			svo.printData();
		}
		//방법3 개선된 for문 
		System.out.println("-----------------");
		for(StudentVO svo : set) {
			svo.printData();
			}
		
	//4.
		//방법1 set 이용
		System.out.println("----김유신 국어점수 95로 변경----");

		for(StudentVO svo : set) {
			System.out.println("처리중인 학생이름 : "+ svo.getName());

			if("김유신".equals(svo.getName())) {//이왕이면 명백한 문자열이 앞에 오는것이 좋다
				svo.setKor(95);
				break;
			}
		}
		//방법2 ArrayList사용
		ArrayList<StudentVO> list = new ArrayList<>();
		list.add(vo);
		list.add(vo2);
		list.add(vo3);

		for (int i = 0; i < list.size(); i++) {
			String name = list.get(i).getName();
			if (name.equals("김유신")) {
				list.get(i).setKor(95);
				System.out.println(list.get(i));

			}
		}
	//5."김유신" 학생만 출력
		for(StudentVO svo : set) {
			if("김유신".equals(svo.getName())) {
				svo.printData();
			}
		}
	}

	public static void printData(Set<StudentVO> set) {
		for (StudentVO vo : set) {
			vo.printData();

		}
	}

}
















