package day0712;
//Arraylist를 사용하여 

//학생관리 프로그램을 작성하시오

import java.util.ArrayList;
import java.util.Scanner;
import util.ScannerUtil;
import type.Student;

public class Ex_GradeBook03 {
	// 상수
	private static final int SCORE_MIN = 0;
	private static final int SCORE_MAX = 100;

	// 변수
	private static Scanner scanner = new Scanner(System.in);
	// list객체의 선언과 초기화
	private static ArrayList<Student> list = new ArrayList<>();
	private static int nextId = 1;

	// 객체에 값을 넣어서 List에 추가하는
	// insert()
	private static void insert() {
		// 정보를 담을 Student 객체
		Student s = new Student();

		// 입력시 출력 메시지를 담을 String 객체
		String message;

		// 번호입력
		s.setId(nextId++);
		// 이름입력
		message = new String("학생의 이름을 입력해주세요");
		s.setName(ScannerUtil.nextLine(scanner, message));

		// 국어점수입력
		message = new String("학생의 국어점수를 입력해주세요");
		s.setKorean(ScannerUtil.nextInt(scanner, message, SCORE_MIN, SCORE_MAX));

		// 영어덤수입력
		message = new String("학생의 영어점수를 입력해주세요");
		s.setEnglish(ScannerUtil.nextInt(scanner, message, SCORE_MIN, SCORE_MAX));

		// 수학점수입력
		message = new String("학생의 수학점수를 입력해주세요");
		s.setMath(ScannerUtil.nextInt(scanner, message, SCORE_MIN, SCORE_MAX));

		// 정보가 담긴 Student객체를 list에 추가
		list.add(s);
	}

	// 학생의 목록을 출력하는
	// printAll()
	private static void printAll() {
		if (list.isEmpty()) {
			System.out.println("아직 입력된 정보가 존재하지 않습니다.");

		} else {
			for (int i = 0; i < list.size(); i++) {
				System.out.printf("%d. %s\n", i + 1, list.get(i).getName());
			}
			String message = new String("상세보기 할 학생의 번호나 뒤로 가시려면 0을 입력해주세요.");
			int userChoice = ScannerUtil.nextInt(scanner, message, 0, list.size()) - 1;
			if (userChoice != -1) {
				printOne(userChoice);
			}
		}

	}

	// 개별학생의 정보를 출력하는
	// printOne()
	private static void printOne(int index) {
		list.get(index).printInfo();
		String message = new String("1.수정 2. 삭제 3. 뒤로가기");
		int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);
		if (userChoice == 1) {
			upDate(index);
		} else if (userChoice == 2) {
			delete(index);
		} else if (userChoice == 3) {
			printAll();
		}
	}

	// 학생의 정보를 수정하는
	// upDate()
	private static void upDate(int index) {
		// 입력시 출력할 메시지를 저장할 String 객체
		String message;
		// 새로운 국어점수입력
		message = new String("새로운 국어점수를 입력하세요");
		list.get(index).setKorean(ScannerUtil.nextInt(scanner, message, SCORE_MIN, SCORE_MAX));
		// 새로운 영어점수입력
		message = new String("새로운 영어점수를 입력하세요");
		list.get(index).setEnglish(ScannerUtil.nextInt(scanner, message, SCORE_MIN, SCORE_MAX));
		// 새로운 수학점수입력
		message = new String("새로운 수학점수를 입력하세요");
		list.get(index).setMath(ScannerUtil.nextInt(scanner, message, SCORE_MIN, SCORE_MAX));

		printOne(index);
	}

	// 학생의 정보응 삭제하는
	// delete()
	private static void delete(int index) {
		String message = new String("해당 학생을 정말로 삭제하시겠습니까? y/n");
		String yesNo = ScannerUtil.nextLine(scanner, message);
		// String 값이 대소문자 상관없이 특정 String 값과 일치하는지 확인할 때에는
		// equalssIgnoreCase라는 메소드를 사용한다.

		if (yesNo.equalsIgnoreCase("y")) {
			list.remove(index);
			printAll();

		} else {
			printOne(index);
		}
	}

	// 메뉴를 담당하는
	// showMenu()
	private static void showMenu() {
		String message = new String("1.입력 2. 출력 3. 종료");
		while (true) {
			int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);
			if (userChoice == 1) {
				insert();
			} else if (userChoice == 2) {
				printAll();
			} else if (userChoice == 3) {
				System.out.println("사용해주셔서 감사합니다.");
				scanner.close();
				break;
			}
		}
	}

	public static void main(String[] args) {
		showMenu();
	}

}
