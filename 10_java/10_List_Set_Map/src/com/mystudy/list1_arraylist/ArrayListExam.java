package com.mystudy.list1_arraylist;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ArrayListExam {

	public static void main(String[] args) {
		//ArrayList : Array(배열)의 속성을 가진 List(목록)
		 ArrayList list1 = new ArrayList();//<>를 쓰지 않으면 모든타입을 저장할 수 있다.
		 System.out.println("list1.size() : "+ list1.size());
		 
		 //입력 : 맨뒤에 추가 
		 list1.add(new Integer(5));
		 list1.add(1);//int -> Integer 자동형변환 되어 입력처리됨 
		 list1.add(5);
		 list1.add(6);
		 list1.add(7);
		 System.out.println(list1.toString());

		 //입력 : 지정된 특정위치에 데이터 추가 
		 list1.add(0,100);//인덱스 위치에 데이터 추가(삽입)
		 System.out.println("0번 인덱스에 100add :\n"+list1);

		 //수정 : 저장된 위치의 데이터 수정(변경)
		 list1.set(0,99);//인덱스 위치의 데이터 변경(수정)
		 System.out.println("0번 인덱스에 999set :\n"+list1);
		 
		 //set은 존재하지 않는 인덱스 접근 시 IndexOutOfBoundsException 예외 발생
		 //list1.set(100,999);
		 //System.out.println("100번 인덱스에 999set :\n"+list1);
		 //Index 100 out of bounds for length 6
		 
		 //삭제 : 특정위치의 데이터 삭제
		 list1.remove(0);//인덱스 위치 데이터 삭제 
		 System.out.println("0번 인덱스를 remove :\n"+list1);
		 
		 //검색,조회(R) : 특정위치의 데이터 읽기(조회, 검색, 확인)
		 Object obj = list1.get(0);
		 System.out.println("list1.get(0) :\n"+ obj);
		 
		 System.out.println("------------------------------");
		 
		 Collections.reverse(list1);
		 System.out.println("reverse 후 :\n"+list1);
		 
		 System.out.println("list1.subList(1,4) :"+list1.subList(1, 4));

		 ArrayList list2 = new ArrayList(list1.subList(1, 4));
		 System.out.println("list2 :"+ list2);

		 System.out.println("----Collections.sort()----");
		 System.out.println("list1 :"+list1);
		 Collections.sort(list1);//오름차순으로 정렬
		 System.out.println("sort()후 list1 :"+list1);
		 
		 System.out.println("----Collections.reverse()----");
		 Collections.reverse(list1);//오름차순으로 정렬한것을 reverse하면 내림차순이 된다.
		 System.out.println("reverse() 후 list :"+list1);
		 
		 System.out.println("================================");
		 System.out.println("list1: "+list1);
		 System.out.println("list2: "+list2);
		 
		 list2.add("BB");
		 list2.add("TEST");
		 System.out.println("list2: "+list2);
		 
		 System.out.println("첫 데이터 : "+ list2.get(0));
		 System.out.println("list2.size() :"+list2.size());
		 System.out.println("마지막 데이터 : "+ list2.get(list2.size()-1));
		 System.out.println("list2: "+list2);
		 
		 int list2Cnt = list2.size();
		 for(int i=0; i<list2Cnt; i++) {
			 System.out.println(i + "-"+ list2.get(i));

		 }
		 printData(list2);
		 printData("list2",list2);
		 printData("list3",new ArrayList());
		 ArrayList list4 = null;
		 printData("list4",list4);
		 
		 //데이터가 있는지 여부 확인
		 System.out.println("list2.contains(5) :"+list2.contains(5));
		 
		 System.out.println("----list2의 데이터를 전체 삭제----");
		 printData("list2 삭제 전 ",list2);
		 //방법1 리스트의 사이즈를 변하지 않는 값으로 설정하여 맨앞에있는 값을 반복해서 삭제한다.
//		 int size = list2.size();
//		 for(int i =0; i<size; i++) {
//			 list2.remove(0);
//		 }
		 
		 //방법2 맨뒤쪽에 있는 데이터를 반복적으로 삭제 
//		 list2.remove(list2.size()-1);//size : 5
//		 list2.remove(list2.size()-1);//size : 4
//		 list2.remove(list2.size()-1);//size : 3
//		 list2.remove(list2.size()-1);//size : 2
//		 list2.remove(list2.size()-1);//size : 1
//		 list2.remove(list2.size()-1);//size : 0
		 
//		 int size = list2.size();
//		 for(int i=size-1; i>=0; i--) {
//			 list2.remove(i);
//		 }
		 
		 //방법3 
//		 for(int i= 0; i<list2.size(); i++) {
//			 list2.remove(i);
//			 i=-1;
//		 }
		 list2.clear();//리스트에 있는 데이터들을 모두 삭제하는 메소드 clear()
		 
		 printData("list2 삭제 후 ",list2);
		 

	}
	//메소드 구간
	static void printData(List list) {
		if(list == null || list.size()<1) return;
		System.out.print(list.get(0));

		for(int i=0; i<list.size(); i++) {
			System.out.print(","+ list.get(i));

		}
		System.out.println();

	}
	static void printData(String title,List list) {
		//if(list == null || list.size()<1) return;
		if(list == null) {//아예 객체도 생성안되있을때
			System.out.println(title +"-null");
			return;
		}if(list.size()<1) {//객체는 있지만 데이터가 없는 경우
			System.out.println(title +"-데이터건수 0");
			return;
		}
		System.out.print(title + list.get(0));

		for(int i=0; i<list.size(); i++) {
			System.out.print(","+ list.get(i));

		}
		System.out.println();

}

}





















