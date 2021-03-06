package day0630;
//사용자로부터 성별,나이,신체등급으로 입력을 받아서 

//현역,공익,면제를 출력해주는 프로그램
//조건1.단 사용자가 성별을 입력할 때 여성으로 입력하는 경우, 추가적인 입력없이 
//"여성에게는 국방의 의무가 부여되지 않습니다"만 출력되게 하십시오
//조건2. 다 ㄴ사용자가 남성이지만 미성년자일 경우, 추가적인 입력없이 
//"미성년자는 아직 신테등급이 부여되지 않습니다."만 출력되게 하시오
//현역:1~3
//공익:4급
//면제:그외

//성별을 입력받을 때는 1이면 남자 2이면 여자
import java.util.Scanner;

public class ArmyPrinter {
	static Scanner scanner = new Scanner(System.in);

	public static void main(String[] args) {

		while (true) {
			message("성별을 입력해주세요 1.남성 2.여성");
			int gender = scanner(scanner, 1, 2);
			if (gender == 2) {
				message("여성에게는 국방의 의무가 부여되지 않습니다.");
			} else if (gender == 1) {
				message("나이를 입력해주세요");
				int age = scanner(scanner, 1, 100);
				if (age > 0 && age < 19) {
					message("미성년자는 아직 신체등급이 부여되지 않습니다.");
				} else {
					message("신체등급을 입력해주세요");
					int rank = scanner.nextInt();
					if (rank < 0 && rank < 4) {
						message("현역입니다.");
					} else if (rank == 4) {
						message("공익입니다.");
					} else {
						message("면제입니다.");
						break;
					}

				}

			}

		}
		scanner.close();
	}

	// String변수를 넣으면 출력되는 메소드
	static void message(String message) {
		System.out.println(message);
		System.out.println(">");
	}

	// 사용자가 입력한 숫자를 변수에 저장하는 메소드
	static int scanner(Scanner scanner, int min, int max) {
		int temp = scanner.nextInt();
		if (!(temp >= min && temp <= max)) {
			message("잘못입력하셨습니다.");
		}
		return temp;
	}

}