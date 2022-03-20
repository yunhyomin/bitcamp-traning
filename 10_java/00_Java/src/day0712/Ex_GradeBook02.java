package day0712;
//Student클래스 객체를 사용한 
//학생관리 프로그램
import java.util.Scanner;
import util.ScannerUtil;
import util.ArrayUtil;
import type.Student;
public class Ex_GradeBook02 {
	static final int SUJECT_SIZE = 3;
	static final int SCORE_MIN = 0;
	static final int SCORE_MAX = 100;
	
	static Student[] arr = new Student[0];
	
	
	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		//입력시 출력할 메세지 
		String message;
		
		//사용자가 입력한 값을 저장할 Student객체
		 Student s= new Student();
		 //setter로 입력하기
		message = new String(" 학생의 이름을 입력해주세요");
		s.setName(ScannerUtil.nextLine(scanner,message));
		
		message = new String("학생의 번호를 입력해주세요");
		s.setId(ScannerUtil.nextInt(scanner, message));
		
		message = new String("학생의 국어점수를 입력해주세요.");
		s.setKorean(ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		
		message = new String("학생의 영어점수를 입력해주세요");
		s.setEnglish(ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		
		message = new String("학생의 수학점수를 입력해주세요.");
		s.setMath(ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		
		s.printInfo();
				
	}
}
