package com.mystudy.string;

import java.util.Arrays;

public class Ex02_String_method {
	public static void main(String[]args) {
		//String 클래스의 메소드들
		//.charAt(int index) 파라미터로 들어온 인덱스번에 들어있는 문자를 리턴
		System.out.println("------charAt()--------");
		String str ="Java World";
		System.out.println("str : "+ str); //Java World
		char ch = str.charAt(0);
		System.out.println("str.charAt(0) : "+ ch); //J가 출력
		
//		char[] ch2 = {str.charAt(0), str.charAt(1),str.charAt(2),str.charAt(3)};
		char[] ch2 = new char[4];
		for(int i = 0; i< ch2.length; i++) {
			ch2[i] = str.charAt(i);
		}
		System.out.println("ch2 : "+ Arrays.toString(ch2));//[j,a,v,a]
		
		//.compareTo() 
		//앞에꺼와 뒤에꺼를 비교 
		//앞에거가 더 크면 +,뒤에거가 더크면 - ,같으면 0
		System.out.println("-------compareTo()---------");
		System.out.println("java vs java : " + "java".compareTo("java"));//0
		System.out.println("aaa vs bbb : " + "aaa".compareTo("bbb"));//-1
		System.out.println("bbb vs aaa : " + "bbb".compareTo("aaa"));// 1
		System.out.println("ccc vs aaa : " + "ccc".compareTo("aaa"));// 2
		
		System.out.println("abc vs aaa : " + "abc".compareTo("aaa"));// 1
		
		//.copyValueOf(char[] e, 시작index, 시작index부터 카피할 갯수)
		//문자배열을 카피해서 String으로 형변환
		System.out.println("--------copyValueOf()---------");
		char[] ch3 = {'a','b','c','d'};
		System.out.println("ch3 : "+Arrays.toString(ch3));// [a,b,c,d]
		
		String str3 = String.copyValueOf(ch3);
		System.out.println("String.copyValueOf(ch3) : "+str3);//abcd
		System.out.println("String.copyValueOf(ch3, 0,2) : "
					+ String.copyValueOf(ch3,0,2)); // ab
		
		//.startsWith()
		//시작문자열 여부 확인
		System.out.println("--------startsWith()----------");
		String str4 = "Java World";
		System.out.println("str4 : "+str4);
		System.out.println("str4.startsWith(\"Java\") :" + str4.startsWith("Java"));//true
	    
		//.indexOf() 
		//해당하는 파라미터가 존재하는 인덱스를 리턴
		System.out.println("--------indexOf()-----------");
		System.out.println("str4.indexOf('a') : " + str4.indexOf('a')); //1
		System.out.println("str4.indexOf(\"a\") : " + str4.indexOf("a"));//1
		System.out.println("str4.indexOf(\"World\") : " + str4.indexOf("World"));//5
		
		//.lastIndexOf()
		//해당하는 파라미터가 존재하는 마지막 인덱스를 리턴
		System.out.println("--------lastIndexOf()----------");
		System.out.println("str4.lastIndexOf('a') : " + str4.lastIndexOf('a')); //3
		System.out.println("str4.lastIndexOf(\"a\") : " + str4.lastIndexOf("a"));//3
		
		//.isEmpty()
		//해당하는 변수가 비어있으면 true, 무언가 저장되어있으면 false
		System.out.println("--------isEmpty()------------");
		System.out.println("str4.isEmpty() : " + str4.isEmpty());//false
		
		//.replace(원래있던 값,새로운 값)
		//원래있던 값을 새로운 값으로 바꿔서 리턴해주는 메소드
		System.out.println("---------replace()------------");
		System.out.println("str4 : "+ str4);
		System.out.println("str4.replace('a','b') : " +str4.replace('a', 'b'));//Jbvb World
		System.out.println("str4 : "+ str4); //Java World 원래값은 변하지 않는다.
		
		//..replaceAll()
		//
		System.out.println("----------replaceAll----------------");
		str4 = "java java";
		System.out.println("str4 : "+ str4);
		System.out.println("ja -> JA :"+ str4.replace("ja", "JA"));
		System.out.println(str4.replaceAll("[ja]", "JA"));
		System.out.println(str4.replaceAll("[^ja]", "JA"));
		//replaceFirst()
		//replaceFirst는 처음것만 바꿔준다.
		System.out.println("ja -> JA :"+ str4.replaceFirst("ja", "JA"));
		
		//.substring(beginIndex, endIndex)
		//beginIndex부터 endIndex이전 까지 리턴하는 메소드
	    System.out.println("--------subString()-----------");
	    	 //0123456789 : 크기 10
	
	    System.out.println("str4 : "+str4);
	    System.out.println("str4.substring(5) : " + str4.substring(5));
	        str= "Java World";
	    	//.beginIndex : 시작위치값 부터 (포함)
	    	//.endIndex : end이전까지 (불포함)
		System.out.println("str.substring(2,4) : "+str.substring(2,4));
		System.out.println(str.substring(0,str.length()));//전체값
		
		//뒤에서 2개문자 제외하고 
		System.out.println(str.substring(0,str.length()-2));
		
		//.toCharArray()
		//문자열을 배열로 바꾼다.
		System.out.println("----------toCharArray()-----------");
		char[] ch4 = str.toCharArray();
		System.out.println("ch4 : "+ ch4);//이렇게 출력하면 우리가 알아볼수 없게 출력된다.ch4 : [C@5577140b
		System.out.println( Arrays.toString(ch4));//toString을 써서 배열전체를 출력
		System.out.println(ch4[0]);
		System.out.println(ch4[1]);
		
		
		//.toUpperCase() 대문자로 바꾸기
		//.toLowerCase() 소문자로 바꾸기
		//.trim() 무의미한 스페이스값들 삭제처리
		System.out.println("--------------------------------");
		str = "		Java World		";
		System.out.println("str : "+ str);
		System.out.println(str.toUpperCase());//     JAVA WORLD
		System.out.println(str.toLowerCase());//     java world
		System.out.println(str.trim());//Java World
		
		
		//.String.valueOf()
		//파라미터 변수를 String변수로 바꾸기
		System.out.println("----------String.valueOf()----------------");
		int num = 100;
		System.out.println(num+1); //덧셈연산 101
		System.out.println("" + num + 1); // 문자열 붙이기 ""+num->"num" ,"num"+1->"num1"==>"1001"
		System.out.println(String.valueOf(num)+1); //"1001"
		String snum = String.valueOf(100);// "100"문자열 리턴
		

	}
	
	

}






























