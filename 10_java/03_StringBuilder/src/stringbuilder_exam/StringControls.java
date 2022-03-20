package stringbuilder_exam;

import java.util.Arrays;
import java.util.StringTokenizer;

public class StringControls {
	public static void main(String[] args) {
		String str1 = "홍길동 이순신  이순신 Tom 홍길동";
		String str2 = "  TOM   을지문덕 김유신 연개소문";
		String str = str1.concat(str2);// concat()은 String의 기본메소드
		System.out.println(str);

		System.out.println("======1================");
//		1 위의 문자열을 STringBuilder변수 sb를 이용해서 하나의 문자열로 만든다
		StringBuilder sb = new StringBuilder();
		sb.append(str1).append(str2);
		System.out.println(sb.toString());// .toString은 문자열을 리턴하므로 문자열로 만들어준다.

		System.out.println("======2-1================");
		// 2-1 sb의 문자열을 빈칸(" ")을 구분자로 잘라서 (이름만추출) 화면출력(데이터확인)
		// String.split()
		String[] strArr = sb.toString().split(" ");
		System.out.println("strArr의 크기 : " + strArr.length);//13
		System.out.println("strArr의 데이터 : " + Arrays.toString(strArr));
		int index = 0;
		for (String name : strArr) {
			System.out.print(index++ + name);
		}
		System.out.println();
		// StringTokenizer
		StringTokenizer stk = new StringTokenizer(sb.toString(), " ");
		System.out.println("stk의 문자갯수 : " + stk.countTokens());

		while (stk.hasMoreTokens()) {
			String name = stk.nextToken();
			System.out.print(name);
		}
		System.out.println();
		System.out.println("======2-2================");
		// 2-2문자열을 저장할수있는 배열변수(names)에 저장

		// StringTokenizer
		System.out.println("stk의 문자갯수 : " + stk.countTokens());//0
		stk = new StringTokenizer(sb.toString(), " ");

		String[] names = new String[stk.countTokens()];

//		배열변수 names에 문자열 저장 
		index = 0;
		while (stk.hasMoreTokens()) {
			names[index++] = stk.nextToken();
		}

		System.out.println("======3================");
		// 3.배열에 있는 값을 구분자 콤마(,)로 구분하여 한라인에 출력(StringBuilder사용)
		System.out.println("names 배열의 데이터 : " + Arrays.toString(names));
		System.out.println("sb의 데이터값:" + sb.toString());

		sb.delete(0, sb.length());// sb의 데이터 값들 모두 삭제
		
		System.out.println("sb의 데이터값:" + sb.toString());

		for (int i = 0; i < names.length; i++) {
			sb.append(names[i]).append(",");
		}
		System.out.println("names의 데이터 : " + sb.toString());
		// -----------------------뒤에붙는 컴마 처리하기
		System.out.println("----뒤에붙는 컴마를 없앤후-----");
		sb.setLength(0);// sb의 데이터값을 모두 삭제

		if (names.length > 0) {
			sb.append(names[0]);
		}
		for (int i = 1; i < names.length; i++) {
			sb.append(",").append(names[i]);
		}
		System.out.println("sb의 데이터 값 :" + sb.toString());
		// ------------------------------------------------
		sb.setLength(0);
		for (int i = 0; i < names.length; i++) {
			if (i == 0) {
				sb.append(names[0]);
			} else {
				sb.append(",").append(names[i]);
			}
		}
		System.out.println("sb의 데이터 값 : " + sb.toString());
		// ----------------------------------------------------
		sb.delete(0, sb.length());
		for(int i=0; i<names.length; i++) {
			sb.append(names[i]).append(",");
		}
		sb.delete(sb.length()-1,sb.length());//맨뒷자리의 ","를 삭제한다.
		
		System.out.println("sb의 데이터 값 : " + sb.toString());

		System.out.println("----------------------");

		System.out.println("======4================");
		// 4.데이터의 첫글자만 추출해서 콤마로 구분하여 한라인에 출력
		sb.delete(0, sb.length());
		for(int i=0; i<names.length; i++) {
			sb.append(names[i].charAt(0)).append(",");
		}
		//sb.setLength(sb.length()-1);//sb의 데이터값의 크기를 sb.length()-1로 줄였기 때문에 맨뒤의 컴마(,)가 지워진다.
		sb.delete(sb.length()-1, sb.length());// 위와 똑같은 코드이다.
		
		System.out.print("sb의 데이터 값 : "+ sb.toString());
		System.out.println();
		System.out.println("======5================");
		// 5.배열의 문자열 중 이름의 글자수가 4이상인 값을 "인덱스번호 : 이름"으로 출력

		StringBuilder sb1 = new StringBuilder();
		for (int i = 0; i < names.length; i++) {
			if (names[i].length() >= 4) {
				sb1.append(i+":"+names[i]+"\n");
			
			}

		}System.out.println(sb1.length());
		
		System.out.println(sb1.toString());

	}

}
