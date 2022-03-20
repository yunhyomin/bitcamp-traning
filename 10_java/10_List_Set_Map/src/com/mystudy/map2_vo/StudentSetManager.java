package com.mystudy.map2_vo;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class StudentSetManager {
	public static void main(String[] args) {
		// 1. 3명의 학생데이터(성명,국어,영어,수학)를
		// StudentVO 클래스를 이용해서 만들고(저장하고)
		// "홍길동", 100, 90, 81
		// "이순신", 95, 88, 92
		// "김유신", 90, 87, 77
		// ---------------------
		// 2. Map<String,StudentVO> 타입의 변수(map)에 저장하고
		// 3. set에 있는 데이터를 사용해서 화면출력
		// 성명 국어 영어 수학 총점 평균
		// --------------------------
		// 홍길동 100 90 81 270 90.33
		// ...
		// -----------------------------
		// 4. 저장된 map에 있는 김유신 학생의 국어 점수를 95점으로 수정
		// 5. "김유신" 학생의 성적만 화면 출력
		// 5-2. "김유신"학생의 성명, 총점, 평균화면 출력
		// -----------------------------------------------

		StudentVO vo1 = new StudentVO("홍길동", 100, 90, 81);
		StudentVO vo2 = new StudentVO("이순신", 95, 88, 92);
		StudentVO vo3 = new StudentVO("김유신", 90, 87, 77);

		//위의 세명의 데이터를 list에 입력하고 Map 타입으로 변환하기 (개인적으로)*******************************************************
		
		Map<String, StudentVO> map = new HashMap<>();

		map.put(vo1.getName(), vo1);
		map.put(vo2.getName(), vo2);
		map.put(vo3.getName(), vo3);
		System.out.println(map);//toString을 오버라이드해줬기 때문에 값들이 출력
		
		//values를 사용해서 조회가능
//		Collection<StudentVO> values = map.values();
//		for(StudentVO vo: values) {
//			vo.printData();
//		}
		Set<String> keySet = map.keySet();//map의 key를 keySet에 저장
		// 개선된 for문 이용해서 조회
		System.out.println("-----for문을 사용해서 조회-----");

		for (String key : keySet) {
			StudentVO value = map.get(key);

			printData(value);
		}
		// Iterator이용해서 조회
		System.out.println("-----Iterator를 사용해서 조회-----");

		Iterator<String> ite = keySet.iterator();
		while (ite.hasNext()) {
			String key = ite.next();
			StudentVO value = map.get(key);
			printData(value);
		}
		System.out.println("========출력=========");
		// 4+5.
		System.out.println("-------김유신 국어점수 95로 수정-------");
		//방법1 -----키를 알때 
		System.out.println(map.containsKey("김유신"));
		StudentVO vo = map.get("김유신");//김유신의 값을 vo에 넣어준다 
		
		System.out.println("변경전 : "+ vo.getName()+ "-국어점수 :"+ vo.getKor()+"점");
		vo.setKor(95);
		System.out.println("변경후 : "+ vo.getName()+ "-국어점수 :"+ vo.getKor()+"점");
		
		vo.printData();
		
		//방법2 -----키를 모를때 
		Collection<StudentVO> values = map.values();//map의 값을 values에 저장 

		Iterator<StudentVO> ite2 = values.iterator();//values의 값을 하나씩 조회하기 위해  iterator사용
		while (ite2.hasNext()) {
			StudentVO value = ite2.next();

			if ("김유신".equals(value.getName())) {
				value.setKor(95);
				value.printData();
			}
		}

	}

	// 메소드
	static void printData(StudentVO value) {
		Set<StudentVO> valueSet = new HashSet<>();// value의 값을 넣을 Set valueSet생성
		valueSet.add(value);// value의 값을 valueSet에 넣어준다.
		for (StudentVO vo : valueSet) {
			System.out.println(vo.getName() + "\t" + vo.getKor() + "\t" + vo.getEng() + "\t" + vo.getMath() + "\t"
					+ vo.getTot() + "\t" + vo.getAvg());

		}
	}
}
