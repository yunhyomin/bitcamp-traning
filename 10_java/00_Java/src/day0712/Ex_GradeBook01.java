package day0712;
//Student 데이터타입을 사용한 
//학생성적관리 프로그램
import type.Student;
import util.ScannerUtil;
import util.ArrayUtil;
import java.util.Scanner;
public class Ex_GradeBook01 {
	static final int SUBJECT_SIZE = 3;
	static final int SCORE_MIN = 0;
	static final int SCORE_MAX = 100;
	
	static Scanner scanner = new Scanner(System.in);
	static Student[] arr = new Student[0];
	static int id = 1;
	
	public static void main(String[] args) {
		//메뉴 메소드 호출
		showMenu();
	}
	
	public static void showMenu() {
		while(true) {
			String message = "1.입력 2.출력 3.종료";
			  int userChoice = ScannerUtil.nextInt(scanner, message,1,3);
			  if(userChoice ==1) {
				  //입력 메소드 호출
				  insert();
			  }else if(userChoice == 2) {
				  //출력메소드 호출
				  printAll();
			  }else if(userChoice == 3) {
				  System.out.println("사용해주셔서 감사합니다.");
				  break;
			  }
		}
		scanner.close();
	}
	/////////////////////////////////////////////메소드구간/////////////////////////////////////
	public static void insert() {
		//Student 변수를 하나 만든다
		Student s = new Student();
		//위의 Student 변수 s값을 넣는다.
		
		//입력시에 출력할 메세지를 저장할 변수
		String message;
		//s에 번호를 넣고 id를 1증가시킨다.
		s.setId(id++);
		//s이름을 넣는다.
		message="이름을 넣어주세요";
		s.setName(ScannerUtil.nextLine(scanner, message));
		//s에 국어점수를 넣는다 
		message="국어점수를 넣어주세요";
		s.setKorean( 
				ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		//s에 영어점수를 넣는다 
		message="영어점수를 넣어주세요";
		s.setEnglish(
				ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		//s에 수학점수를 넣는다.
		message="수학점수를 넣어주세요";
		s.setMath(ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		//변수 s 를 배열에 추가해준다.
		arr = ArrayUtil.add(arr, s);
		}
	
	public static void printAll() {
		if(ArrayUtil.isEmpty(arr)) {
			System.out.println("아직 입력된 정보가 없습니다.");
		}else {
			for(int i = 0; i<ArrayUtil.size(arr);i++) {
				System.out.printf("%d. %s\n", i+1,ArrayUtil.get(arr, i).getName());
			}
			String message="상세보기 할 학생의 번호를 입력해주세요(0은 뒤로가기)";
			int userChoice = 
					ScannerUtil.nextInt(scanner,message,
							0,ArrayUtil.size(arr))-1;
			if(userChoice != -1) {
				printOne(userChoice);
			}
		}
	}
	
	public static void printOne(int index) {
		Student s= ArrayUtil.get(arr, index);
		System.out.printf("번호: %03d번 이름: %s\n", s.getId(), s.getName());
		System.out.printf("국어: %03d점 영어: %03d점 수학:%03d점\n",
				s.getKorean(),s.getEnglish(),s.getMath());
		int sum = s.getKorean()+s.getEnglish()+s.getMath();
		double average = (double) sum/SUBJECT_SIZE;
		System.out.printf("총점:%03d 점 평균:%06.2f 점",sum,average);
		
		String message = "1.수정 2.삭제 3.뒤로가기";
		int userChoice = ScannerUtil.nextInt(scanner, message,1,3);
		if(userChoice ==1) {
			upDate(index);
		}else if(userChoice == 2) {
			delete(index);
		}else if(userChoice == 3) {
			printAll();
		}
				
	}
	
	public static void upDate(int index) {
		String message;
		message = "새로운 국어점수를 입력해주세요";
		ArrayUtil.get(arr, index).setKorean(
				ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		message = "새로운 영어점수를 입력해주세요";
		ArrayUtil.get(arr, index).setEnglish(
				ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		message = "새로운 수학점수를 입력해주세요";
		ArrayUtil.get(arr, index).setMath(
				ScannerUtil.nextInt(scanner, message,SCORE_MIN,SCORE_MAX));
		//수정후 개별 보기화면으로 돌아간다.
		printOne(index);
	}
	
	public static void delete(int index) {
		String message = "정말로 삭제하시겠습니까? 1.예 2.아니오";
		int userChoice = ScannerUtil.nextInt(scanner, message,1,2);
		if(userChoice ==1) {
			arr = ArrayUtil.remove(arr, index);
			printAll();
			}else {
				//개별보기화면으로 돌아간다.
				printOne(index);
		}
	}
}
























