package com.mystudy.list5_sort_vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class StudentSortTest {

	public static void main(String[] args) {

		StudentVo vo1 = new StudentVo("홍길동",100,90,81);
		StudentVo vo2 = new StudentVo("이순신",95,88,92);
		StudentVo vo3 = new StudentVo("김유신",90,87,77);
		
		ArrayList<StudentVo> list = new ArrayList<>();
		list.add(vo1);
		list.add(vo2);
		list.add(vo3);
		printData(list);
		
		System.out.println("-----sort 진행 전 -----");
		printData(list);
		
		Collections.sort(list);
		
		System.out.println("-----sort 진행 후 -----");
		printData(list);

		
		


	}
	static void printData(List<StudentVo> list) {
		for(StudentVo vo : list) {
			System.out.println(vo);

		}
	}

}
