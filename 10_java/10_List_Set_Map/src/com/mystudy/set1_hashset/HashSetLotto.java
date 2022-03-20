package com.mystudy.set1_hashset;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Objects;

class Numbers {
	int num;

	public Numbers(int num) {
		super();
		this.num = num;
	}

	@Override
	public String toString() {
		return "" + num + "";
	}

	@Override
	public int hashCode() {
		System.out.println(">>hashCode실행");
		return Objects.hash(num);
	}

	@Override
	public boolean equals(Object obj) {
		System.out.println(">>equals실행");
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Numbers other = (Numbers) obj;
		return num == other.num;
	}

}
//클래스를 만들지않고 풀기 
//class Lotto{
//	HashSet<Integer> set = new HashSet<>();
//	int lottoNo;
//		for(int i=0; i<6; i++) {
//			lottoNo = (int)(Math.random()*45+1);
//			System.out.print(lottoNo+ ",");
//			set.add(lottoNo);
//		}
//		//이 경우에는 중복된 숫자가 뽑히면 그 숫자는 추가가 되지않아서 6개가 안될 수가 있다.
//		System.out.println();
//		System.out.println("로또번호: "+ set);
//		
//		System.out.println("---------------------");
//		set.clear();//set을 전체삭제
//		while(set.size()<6) {
//			lottoNo = (int)(Math.random()*45+1);
//			System.out.print(lottoNo+ ",");
//			set.add(lottoNo);
//		}
//		System.out.println();
//		System.out.println("로또번호 :"+ set);
//		
//		System.out.println("========================");
//		set.clear();
//		while(set.size<6) {
//			set.add((int)(Math.random()*45)+1);
//		}
//		System.out.println("로또번호 : "+ set);
//
//		//정렬
//		System.out.println("---정렬작업진행---");
//		ArrayList<Integer> list = new ArrayList<>(set);
//		System.out.println("list : "+list);
//		
//		Collection.sort(list);
//		System.out.println("정렬된 로또번호 : "+list);
//
//}
public class HashSetLotto {

	public static void main(String[] args) {
		// Set 을 이용한 로또만들기 : 1~45 랜덤숫자 6개를 Set 에 저장
		// 로또 번호 6개 추첨. 작은 숫자부터 순서대로 화면 출력
		// Math.random() : 0.0~0.9999999....실수형 데이터 중 랜덤 값 리턴(double) (0이상~1미만)
		// Math.random() : Math.random() * 45 1~44.99999까지의 숫자가 나온다.
		// ------정렬도 한번 진행
		// 출력은 작은 숫자부터 큰 숫자 형태로
		// 예) 금주의 로또번호 : 5,8,10,25,33,41
		// --------------------------------------------------------------
		System.out.println((int)Math.random()*45);//0*45->0
		System.out.println((int)(Math.random()*45));//0~44
		System.out.println((int)(Math.random()*45)+1);//1~45
		System.out.println(Math.random());//0~0.99999....
		
		HashSet<Numbers> set = new HashSet<>();

//		Numbers num1 = new Numbers((int)(Math.random()*45)+1);
//		set.add(num1);
//		System.out.println("set : " + set);
//		Numbers num2 = new Numbers((int)(Math.random()*45)+1);
//		set.add(num2);
//		System.out.println("set : " + set);
//		Numbers num3 = new Numbers((int)(Math.random()*45)+1);
//		set.add(num3);
//		System.out.println("set : " + set);
//		Numbers num4 = new Numbers((int)(Math.random()*45)+1);
//		set.add(num4);
//		System.out.println("set : " + set);
//		Numbers num5 = new Numbers((int)(Math.random()*45)+1);
//		set.add(num5);
//		System.out.println("set : " + set);
//		Numbers num6 = new Numbers((int)(Math.random()*45)+1);
//		set.add(num6);
//		System.out.println("set : " + set);
		
		//번호 뽑기
		while (set.size() < 6) {
			putNumber(set);
		}
		//정렬작업
		System.out.println("------정렬 작업 진행------");
		ArrayList<Numbers> list = new ArrayList<>(set);  
		System.out.println(list);

		//Collections.sort(list);
		Collections.sort(list, new Comparator<Numbers>() {
			@Override
			public int compare(Numbers o1, Numbers o2) {
				Integer num1 = o1.num;
				Integer num2 = o2.num;
				//return num1.compareTo(num2);//오름차순
				return num2.compareTo(num1);//내림차순
			}
		});
		System.out.println(list);
		//System.out.println("정렬된 로또번호(list) : "+ list);

	}
	// 메소드
	static void putNumber(HashSet<Numbers> set) {
		Numbers number = new Numbers((int) (Math.random()*45) + 1);
		set.add(number);
		System.out.println("set :" + set);

	}




}
















