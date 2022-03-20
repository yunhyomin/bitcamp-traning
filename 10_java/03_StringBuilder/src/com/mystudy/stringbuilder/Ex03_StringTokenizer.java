package com.mystudy.stringbuilder;

import java.util.StringTokenizer;

public class Ex03_StringTokenizer {
	public static void main(String[] args) {
		//String split() vs StringTokenizer
		System.out.println("-----String split()-----");
		String str = "사과,배,복숭아,,포도";
		System.out.println("str : " +str);
		
		String[] strSplit = str.split(",");//배열생성(,로 나눈것들을 배열로 생성한다.)
		System.out.println("strSplit.length : " + strSplit.length);
		
		System.out.println("---str.split(\",\")결과 ---");//빈공간도 데이터로 인식한다.
		for(int i = 0; i<strSplit.length; i++) {
//			System.out.println(strSplit[i]);
			System.out.println(i + ":-"+strSplit[i]+"-");
		}
		System.out.println("-------개선된 for문 형태로 --------");
		//(index값 필요없이)데이터만 사용하면 된다 할때!!
		for(String str2 : strSplit) {
			//for문을 압축해서 적용한것 strSplit의 크기만큼 str2에 strsplit의 값을 순서대로 저장한다.
			System.out.println("-"+str2+"-");
			
		}
		System.out.println("--------------------------");
		//이걸 쓰기보다는 그냥 for문을 쓰는게 낫다.
		int index = 0;
		for(String str2 : strSplit) {
			System.out.println(index++ + ":-"+str2+"-");
//			index++;
		}
		System.out.println("=====================================");
		
		System.out.println("--------StringTokenizer 사용---------");
		//무의미한 데이터를 데이터로 생각하지 않는다.
		StringTokenizer strToken = new StringTokenizer(str, ",");//객체생성(Tokenizing)
		System.out.println("strToken.countToken :"+ strToken.countTokens());
		//StringTokenizer는 데이터의 크기를 출력할때 countToken()을 쓴다.
		
		while(strToken.hasMoreTokens()) {
			String token = strToken.nextToken();
			System.out.println("-"+token+"-");
		}
		System.out.println("저장된 데이터크기 :"+ strToken.countTokens());//0 
		
		//==============================================================다시 또 토크나이징해야한다.
		System.out.println("----for문 사용 토큰값 조회----");
		strToken = new StringTokenizer(str,",");
		System.out.println("저장된 토큰갯수 :"+ strToken.countTokens());
		
		int tokenCnt = strToken.countTokens();//token에서 하나씩 꺼내서 출력할때마다 데이터갯수가 줄어들기 때문에 
		for(int i = 0; i<tokenCnt; i++) {     //원래의토큰갯수를 저장해 놓아야 제대로된 데이터가 출력된다.
			String token = strToken.nextToken();
			System.out.println("-"+token+"-");
		}

}




	}

























