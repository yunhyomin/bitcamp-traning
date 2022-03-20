package com.mystudy.stringbuilder;

public class Ex01_StringBuffer {
	public static void main(String[]srgs) {
		//StringBuffer클래스
		int num = 100;
		String str1 = "Hello"; //사용가능 근데 거의 사용하지 않음.
		String str = new String("Hello Java!!!");
		System.out.println(str);
		
		StringBuffer sb = new StringBuffer(str);//객체생성
		System.out.println(sb);
		System.out.println(sb.toString());//둘다 같은 의미/ 
//		String sbValue = sb; 에러
		String sbValue = sb.toString();
		System.out.println("sb.toString() : "+ sbValue);
		
		System.out.println("sb.capacity() : " + sb.capacity());//저장공간 출력
		
		System.out.println("---------StringBuffer------------");
		sb.append("반갑습니다.").append("@@@@");//맨뒤쪽에 추가
		System.out.println(sb);
		
		 sb.reverse();//문자열 뒤집기
		 System.out.println(sb);
		 System.out.println(sb.reverse());
		 System.out.println(sb);
		 								
		 System.out.println("----------delete(), insert(), replace()-----------");
		 //0123456789012 34 567 8901
		 //Hello Java!!!반갑습니다@@@@
		 System.out.println(sb.delete(0,6));//0번인덱스에서 6번인덱스전까지 삭제한다.
		 System.out.println(sb);
		 
		 sb.insert(0,"Hello ");//삽입(추가, 입력)
		 System.out.println(sb);
		 
		 //replace(int start, int end, String str)
		 sb.replace(0,  5,  "Hi,");//start부터 end전까지를 수정한다.
		 System.out.println(sb);
		 
		 System.out.println("sb.length() : "+ sb.length());
		 System.out.println("sb.capacity() : "+ sb.capacity());
		 //===============================================================================================
		 
		 
		 System.out.println("=======================================");
		 StringBuffer sb2 = new StringBuffer(100);//저장공간 100개확보
		 System.out.println("sb2.length() :"+ sb2.length());//저장데이터 크기 
		 System.out.println("sb2.capacity() : " + sb2.capacity());//저장공간의 크기 
		 
		 sb2.append("안녕하세요").append("반갑습니다!!!");
		 System.out.println("sb2.length() :"+ sb2.length());
		 System.out.println("sb2.capacity() : " + sb2.capacity());
		 
		 System.out.println("-------trimToSize()실행 후----------");
		 sb2.trimToSize();
		 System.out.println("sb2.length() :"+ sb2.length());
		 System.out.println("sb2.capacity() : " + sb2.capacity());
		 
		 System.out.println(">>> append() 실행 후 ---");
		 sb2.append("자바 공부중~");
		 System.out.println("sb2.length() :"+sb2.length());
		 System.out.println("sb2.capacity() : " + sb2.capacity());//데이터의 크기가 늘어남에 따라 저장공간의 크기도 늘어나는데 
		 														//이때 저장공간의 크기가 데이터의 크기보다 좀 더 커지게 설정된다.
		 System.out.println(">>setLength() 실행 후 ---");
		 sb2.setLength(5);//데이터의 크기 설정(작게하면 delete효과)
		 System.out.println("sb2.toString() : "+ sb2.toString());
		 System.out.println("sb2.length() :"+sb2.length());
		 System.out.println("sb2.capacity() : " + sb2.capacity());
		 
		 
		 
	}

}






























