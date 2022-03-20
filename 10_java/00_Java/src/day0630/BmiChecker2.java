package day0630;
//숙제2

//사용자로부터 키와 몸무게를 입력 받아서 BMI를 계산하여 비만도를 출력하는 프로그램
//단, 기네스북에 따르면 세계에서 가장 키가 컸던 사람의 키는 2.72m였습니다
//또한 가장 몸무게가 무거웠던 사람의 몸무게는 635kg였습니다.
//만약 사용자가 잘못된 값을 입력할 경우, 더이상 추가적인 입력없이
//경고 메시지 출력 후 프로그램이 종료되도록 코드를 작성하시오.

import java.util.Scanner;

import javax.naming.ldap.PagedResultsResponseControl;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.IconifyAction;

public class BmiChecker2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        final double STANDARD_I = 18.5;// 소프트코딩을 하기위해 상수를 선언
        final double STANDARD_II = 23;
        final double STANDARD_III = 25;
        // 선검증으로
        //키를 입력받는다 
        System.out.println("키를 m단위로 입력해주세요");
        System.out.print(">");
        double h = scanner.nextDouble();

        if (0 <= h && h <= 2.72) {
            //몸무게를 입력받는다
            System.out.println("몸무게를 kg단위로 입력해주세요");
            double w = scanner.nextDouble();
            if (0 <= w && w <= 635) {
                //BMI값을 변수에 입력
                double BMI = w / h / h;
                
                String result;
                if (BMI <= STANDARD_I) {
                    result = ("저체중");
                } else if (BMI <= STANDARD_II) {
                    result = ("정상체중");
                } else if (BMI <= STANDARD_III) {
                    result = ("과체중");
                } else {
                    result = ("비만");
                }
                    System.out.printf("키: %fm 몸무게: %.2fkg\n", h, w);
                    System.out.printf("BMI: %.2f 비만도: %s\n", BMI, result);

                
            } else {
                System.out.println("잘못된 정보를 입력하셨습니다");
                System.out.println("프로그램종료");
            }
        } else {
            System.out.println("잘못된 정보를 입력하셨습니다");
            System.out.println("프로그램종료");
        }
    }
}