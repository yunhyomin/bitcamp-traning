package day0707;

//숙제 1.
//BmiChecker를 메소드화 시키시오
import java.util.Scanner;
import util.ScannerUtil;

public class Hw01 {
    // 상수
    static final double WEIGHT_MAX = 635;
    static final double HEIGHT_MAX = 2.72;
    static final double BMI_STANDARD_I = 18.5;
    static final double BMI_STANDARD_II = 23;
    static final double BMI_STANDARD_III = 25;

    public static void main(String[] args) {
        // 변수
        Scanner scanner = new Scanner(System.in);
        double height = 0;
        double weight = 0;
        boolean inputSwitch = false;
        while (true) {
            int userChoice = ScannerUtil.nextInt(scanner, "1. 입력 2. 출력 3. 종료", 1, 3);
            if (userChoice == 1) {
                // 입력 코드 구현

                // 입력 시 출력할 메시지를 저장할 String 변수
                String message = "";

                // 키 입력을 담당하는 메소드 호출
                message = "키를 m 단위로 입력해주세요.";
                height = ScannerUtil.nextDouble(scanner, message, 0.01, HEIGHT_MAX);

                // 몸무게 입력을 담당하는 메소드 호출
                message = "몸무게를 kg 단위로 입력해주세요.";
                weight = ScannerUtil.nextDouble(scanner, message, 0.01, WEIGHT_MAX);

                // inputSwitch를 true로 변경
                inputSwitch = true;

            } else if (userChoice == 2) {
                if (inputSwitch) {
                    // 출력 메소드 호출
                    printInfo(height, weight);

                } else {
                    System.out.println("아직 입력된 정보가 없습니다.");
                }
            } else if (userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.");
                break;
            }
        }

        scanner.close();
    }

    public static void printInfo(double height, double weight) {
        // bmi 계산
        double bmi = weight / height / height;

        // 비만도 결정
        String result;
        if (bmi < BMI_STANDARD_I) {
            result = "저체중";
        } else if (bmi < BMI_STANDARD_II) {
            result = "정상 체중";
        } else if (bmi < BMI_STANDARD_III) {
            result = "과체중";
        } else {
            result = "비만";
        }

        // 결과 출력
        System.out.printf("키: [%.2f]m 몸무게: [%.2f]kg\n", height, weight);
        System.out.printf("BMI: [%.3f] 비만도: [%s]\n", bmi, result);
    }
}
