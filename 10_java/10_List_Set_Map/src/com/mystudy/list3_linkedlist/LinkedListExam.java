package com.mystudy.list3_linkedlist;

import java.util.LinkedList;
import java.util.Arrays;

public class LinkedListExam {

	public static void main(String[] args) {
		// LinkedList : List속성
		LinkedList<String> list = new LinkedList<>();
		list.add("홍길동");
//		list.add("홍길동");
//		list.add("김유신");
		System.out.println("list :" + list);
		System.out.println("list. get(0) :" + list.get(0));

		String str = "홍길동,김유신,강감찬,을지문덕,홍경래";
		String[] names = str.split(",");
		System.out.println("names : " + Arrays.toString(names));

		// 배열에 있는 데이터를 리스트에 추가
		for (int i = 0; i < names.length; i++) {
			list.add(names[i]);
		}
		System.out.println("list :" + list);
//		--------------------------------------------
		// (실습)

		System.out.println("---연습---");

		System.out.println("변경 전  :" + list);
		// 김유신 삭제
		while (true) {
			if (list.contains("김유신")) {// 김유신이 있으면
				list.remove("김유신");// 맨 앞쪽 데이터 하나 삭제
			} else {// 없으면
				break;
			}
		}
		// list.remove(list.indexOf("김유신"));

		// 홍길동 ->홍길동2로 바꾸기
		while (true) {
			int index = list.indexOf("홍길동");//indexOf() : 데이터값이 똑같은게 없을때 -1을 리턴한다.
			if (index == -1) break;
				list.set(index, "홍길동2");
			} 
		
		System.out.println("변경 후 :" + list);

	}

}


















