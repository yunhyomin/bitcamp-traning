package class1.basic;

	/*package선언문: 선택항목이지만 기본적으로 사용 
	 * 패키지 구문: java 파일의 맨 첫줄에 위치하며 한번만 작성
	 * 자바(class) 파일의 위치를 나타냄.
	 * 일반적으로 회사의 도메인 명을 반대로 작성해서 사용 
	 * 예) naver.com --> com.naver + 서비스명(시스템명)
	 *    bitcamp.co.kr --> kr.co.bitcamp + 서비스명(시스템명)
	 */
	
	//import 선언문 : 선택항목이지만 일반적으로 사용
	//(java.lang 패키지 이외의 패키지에 있는 타입 사용시 일반적으로 사용)
	import java.util.Scanner;
	
	//class선언문 : 필수항목
	public class Ex01_packege_import_class {
		
		public static void main(String[] args) {
			Scanner scan = new Scanner(System.in);
		}

}
