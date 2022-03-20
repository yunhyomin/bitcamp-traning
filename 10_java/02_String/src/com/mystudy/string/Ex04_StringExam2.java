package com.mystudy.string;

import java.util.Arrays;

public class Ex04_StringExam2 {

	public static void main(String[] args) {
		
		// 1.문자열 값을 저장할 수 있는 문자열 배열(names)변수를 선언하고 입력
		// String[] names = new String[8]; 이렇게도 선언가능.
		String[] names = { "홍길동", "이순신", "이순신", "을지문덕", "김유신", "연개소문", "Tom", "TOM" }; 
		
		// 2.배열에 있는 값을 구분자 콤마(,)로 구분하여 한 라인에 출력
		for (int i = 0; i < names.length; i++) {//배열이름.length 는 배열의 크기(데이터갯수)를 말한다.
			String name = names[i];
		}
		System.out.println(Arrays.toString(names));
		//방법1)','를 뒤에 붙이지 않기위해 나눠서 코드를 짠다.
		//if(i==0){
//			System.out.ptint(name)
		//}else {
//			System.out.print(","+name);
//	}
		
		// 3.배열에 있는 데이터의 첫글자만 출력
		for (int i = 0; i < names.length; i++) {
			String name = names[i];
			String first = name.substring(0, 1);
			if(i == 0) {
				System.out.print(first);
			}else {
			System.out.print( ","+first );
		}
		}
		System.out.println();
		System.out.println("------------4----------------");
		// 4.이름의 글자수가 4글자 이상인 이름을 검색해서 인덱스번호:이름 의 형태로 출력
		for (int i = 0; i < names.length; i++) {
			String name = names[i];
			if (name.length() >= 4) {
				System.out.println("["+i + " : " + name+"]");
			}
		}
		//5. 이름이 같은 데이터를 인덱스번호: 이름 = 인덱스번호: 이름 으로 출력
		for (int i = 0; i < names.length-1; i++) {//마지막과 마지막은 비교하지 않아도 되기때문에 -1
			for (int j = i + 1; j < names.length; j++) {//첫번째와 첫번째는 비교하지 않아도 되기때문에 +1
				String name = names[i];
				String name2 = names[j];

				if (name.equalsIgnoreCase(name2)) {
					int indexI = i;
					int indexJ = j;
					
					//for(int i =0; i<names.length; i++){
					//	if(names[0].equalsIgnoreCase(names[i]){
					//		System.out.println(0+ ":"+ names[0] +"="+ i+":"+names[i]);
					//}
					//}
					//....................... 계속 반복한다 

					System.out.println(indexI + ":" + name + "=" + indexJ + ":" + name2);
				}
			}
		}

	}
	
}
