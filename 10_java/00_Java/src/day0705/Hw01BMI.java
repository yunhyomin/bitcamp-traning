package day0705;

//숙제 1. 5명의 키와 몸무게를 토대로 해서 
//       bmi 결과를 입력한 사람까지만 출력하는 프로그램
import java.util.Scanner;

public class Hw01BMI {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        // 상수
        // 키 최대값
        final double HEIGHT_MAX = 2.72;
        // 몸무게 최대값
        final double WEIGHT_MAX = 635;
        // 저체중 <-> 정상체중 BMI 값
        final double BMI_STANDARD_I = 18.5;
        // 정상체중 <-> 과체중 BMI 값
        final double BMI_STANDARD_II = 23;
        // 과체중 <-> 비만 BMI 값
        final double BMI_STANDARD_III = 25;
        // 총 입력 가능한 인원수
        final int SIZE = 5;

        // 변수
        // 키를 저장할 배열
        double[] heightArray = new double[SIZE];
        // 몸무게를 저장할 배열
        double[] weightArray = new double[SIZE];
        // 다음 입력할 인덱스를 저장할 int 변수
        int index = 0;

        while (true) {
            System.out.println("1. 입력 2. 출력 3. 종료");
            System.out.print("> ");
            int userChoice = scanner.nextInt();
            if (userChoice == 1) {
                // 입력 코드 구현

                if (index < SIZE) {
                    // 배열에 여유 공간 있어서 입력 가능

                    // 사용자가 입력한 실수 값을 임시 보관할 double 변수
                    double temp;

                    // 키를 입력 받아서 키 배열의 index번 칸에 저장
                    System.out.println("키를 입력해주세요.");
                    System.out.print("> ");
                    temp = scanner.nextDouble();

                    while (!(temp > 0 && temp <= HEIGHT_MAX)) {
                        System.out.println("잘못된 키 입니다.");
                        System.out.println("키를 입력해주세요.");
                        System.out.print("> ");
                        temp = scanner.nextDouble();
                    }

                    heightArray[index] = temp;

                    // 몸무게를 입력 받아서 몸무게 배열의 index번 칸에 저장
                    System.out.println("몸무게를 입력해주세요.");
                    System.out.print("> ");
                    temp = scanner.nextDouble();

                    while (!(temp > 0 && temp <= WEIGHT_MAX)) {
                        System.out.println("잘못 입력하셨습니다.");
                        System.out.println("몸무게를 입력해주세요.");
                        System.out.print("> ");
                        temp = scanner.nextDouble();
                    }

                    weightArray[index] = temp;

                    // index의 값을 1 증가
                    index++;

                } else {
                    // 이미 5명을 다 입력해서 더이상 입력 불가
                    System.out.println("더이상 입력하실 수 없습니다.");
                }

            } else if (userChoice == 2) {
                // 출력 코드 구현
                if (index > 0) {
                    // 1명 이상이 입력 되었으므로
                    // 배열 전체를 출력한다.
                    for (int i = 0; i < index; i++) {
                        System.out.println("-----------------------");
                        System.out.printf("\t%d번째 정보\n", i + 1);
                        System.out.println("-----------------------");
                        System.out.printf("키: [%.2f]m 몸무게: [%.2f]kg\n", heightArray[i], weightArray[i]);
                        double bmi = weightArray[i] / heightArray[i] / heightArray[i];
                        String result;
                        if (bmi < BMI_STANDARD_I) {
                            result = "저체중";
                        } else if (bmi < BMI_STANDARD_II) {
                            result = "정상체중";
                        } else if (bmi < BMI_STANDARD_III) {
                            result = "과체중";
                        } else {
                            result = "비만";
                        }
                        System.out.printf("BMI: [%.3f] 비만도: [%s]\n", bmi, result);

                        System.out.println("-----------------------");
                    }

                } else {
                    // 아직 1명도 입력이 안되었으므로
                    // 경고 메시지만 출력

                    System.out.println("-----------------------");
                    System.out.println("아직 입력된 정보가 없습니다.");
                    System.out.println("-----------------------");

                }

            } else if (userChoice == 3) {
                // 종료 코드 구현
                System.out.println("사용해주셔서 감사합니다.");
                break;
            }
        }

        scanner.close();
    }
}
