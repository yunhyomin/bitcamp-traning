package com.mystudy.set1_hashset;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;

public class TreeSetLotte {

	public static void main(String[] args) {
		// Set 을 이용한 로또만들기 : 1~45 랜덤숫자 6개를 Set 에 저장
		// 로또 번호 6개 추첨. 작은 숫자부터 순서대로 화면 출력
		// Math.random() : 0.0~0.9999999....실수형 데이터 중 랜덤 값 리턴(double) (0이상~1미만)
		// Math.random() : Math.random() * 45 1~44.99999까지의 숫자가 나온다.
		// ------정렬도 한번 진행
		// 출력은 작은 숫자부터 큰 숫자 형태로
		// 예) 금주의 로또번호 : 5,8,10,25,33,41
		// --------------------------------------------------------------
		
		//TreeSet : 데이터를 정렬해서 저장
		
		System.out.println((int)Math.random()*45);//0*45->0
		System.out.println((int)(Math.random()*45));//0~44
		System.out.println((int)(Math.random()*45)+1);//1~45
		System.out.println(Math.random());//0~0.99999....
		
		Set<Integer> set = new TreeSet<>();

		//번호 뽑기
		while(set.size()<6) {
			int lottoNo = (int)(Math.random()*45+1);
			System.out.print(lottoNo+ ",");
			set.add(lottoNo);
		}
		
		System.out.println();
		
		//TreeSet : 저장되는 데이터가 정렬이 되어서 저장되므로 정렬 붙필요 
		//정렬작업
//		System.out.println("------정렬 작업 진행------");
//		ArrayList<Integer> list = new ArrayList(set);
//		System.out.println(list);
//
//		Collections.sort(list);
//		System.out.println("정렬된 로또번호(list) : "+ list);

	}
	
	}

















