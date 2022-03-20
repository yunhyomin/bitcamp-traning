package day0707;

//숙제 2.
//GradeBook 을 여러 학생을 관리할 수 있는 버젼으로 만들되
//메소드화 시키시오.

import java.util.Scanner;
import util.ScannerUtil;

public class Hw02 {
    // 상수
    static final int SUBJECT_SIZE = 3;
    static final int STUDENT_SIZE = 5;
    static final int SCORE_MIN = 0;
    static final int SCORE_MAX = 100;

    public static void main(String[] args) {
        // 변수
        Scanner scanner = new Scanner(System.in);
        int[] idArray = new int[STUDENT_SIZE];
        String[] nameArray = new String[STUDENT_SIZE];
        int[] koreanArray = new int[STUDENT_SIZE];
        int[] englishArray = new int[STUDENT_SIZE];
        int[] mathArray = new int[STUDENT_SIZE];
        int index = 0;

        while (true) {
            // 각종 입력 시 출력 메시지를 저장할 String 변수
            String message;

            message = "1. 입력 2. 출력 3. 종료";
            int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);
            if (userChoice == 1) {
                // 입력 코드 구현
                if(index < STUDENT_SIZE) {
                    // 번호
                    message = "번호를 입력해주세요.";
                    idArray[index] = ScannerUtil.nextInt(scanner, message);
                    
                    // 이름
                    message = "이름을 입력해주세요.";
                    nameArray[index] = ScannerUtil.nextLine(scanner, message);
                    
                    // 국어
                    message = "국어 점수를 입력해주세요.";
                    koreanArray[index] = ScannerUtil.nextInt(scanner, message, 
                            SCORE_MIN, SCORE_MAX);
                    
                    // 영어
                    message = "영어 점수를 입력해주세요.";
                    englishArray[index] = ScannerUtil.nextInt(scanner, message, 
                            SCORE_MIN, SCORE_MAX);
                    
                    // 수학
                    message = "수학 점수를 입력해주세요.";
                    mathArray[index] = ScannerUtil.nextInt(scanner, message, 
                            SCORE_MIN, SCORE_MAX);
                    
                    // index 1 증가
                    index++;
                }else {
                    System.out.println("더이상 입력하실 수 없습니다.");
                }

            } else if (userChoice == 2) {
                // 출력 코드 구현
                printAll(index, idArray, nameArray, 
                        koreanArray, englishArray, mathArray);

            } else if (userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.");
                break;
            }
        }

        scanner.close();
    }

    public static void printAll(int index, int[] idArray, String[] nameArray, int[] koreanArray, int[] englishArray,
            int[] mathArray) {
        if (index > 0) {
            // 개별 출력 메소드 구현
            for (int i = 0; i < index; i++) {
                System.out.println("---------------------");
                System.out.printf("%d번 학생 정보\n", i + 1);
                System.out.println("---------------------");
                int id = idArray[i];
                String name = nameArray[i];
                int korean = koreanArray[i];
                int english = englishArray[i];
                int math = mathArray[i];
                printOne(id, name, korean, english, math);
                System.out.println("---------------------");
            }

        } else {
            System.out.println("아직 입력된 학생이 존재하지 않습니다.");
        }
    }

    public static void printOne(int id, String name, int korean, int english, int math) {
        int sum = korean + english + math;
        double average = (double) sum / SUBJECT_SIZE;

        System.out.printf("번호: %03d번 이름: %s\n", id, name);
        System.out.printf("국어: %03d점 영어: %03d점 수학: %03d점\n", korean, english, math);
        System.out.printf("총점: %03d점 평균: %06.2f점\n", sum, average);
    }
}
