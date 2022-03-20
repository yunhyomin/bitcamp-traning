package day0701;

///사용자로부터 키와 몸무게를 입력 받아서
//BMI를 계산하여
//비만도를 출력하는 프로그램
//단,  기네스북에 따르면 셰게에서 가장 키가 컸던 사람의 키는 
//2.72m였습니다.
//또한 가장 몸무게가 무거웠던 사람의 몸무게는 635kg이었습니다.
//만약 사용자가 잘못된 값을 입력할 경우, 
//올바른 값을 입력할 때 까지 다시 입력 받으시오
import java.util.Scanner;

public class WhileBMIChecker {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

      
        System.out.println("키를 m단위로 입력하세요");
        System.out.print(">");
        double input = scanner.nextDouble();
       
        while (!(0<=input && input<=2.72)) {
            System.out.println("잘못입력하셨습니다");
            System.out.println("키를 m단위로 입력하세요");
            System.out.print(">");
            input = scanner.nextDouble();
        }
        double h = input;//위에서의 input(키)이 h에 할당. 
        
        System.out.println("몸무게를 kg단위로 입력하세요");
        System.out.print(">");
        input = scanner.nextDouble();
        
        while (!(0<=input && input<=635)) {
            System.out.println("잘못입력하셨습니다");
            System.out.println("몸무게를 kg단위로 입력하세요");
            System.out.print(">");
            input = scanner.nextDouble();
        }
        double w = input;//위에서의 input(몸무게)이 w에 할당.
        
        double BMI = w/h/h;
        
        String result;
        if(BMI <18.5) {
            result = "저체중";
            }else if(BMI<23) {
                result = "정상체중";
                }else if(BMI<25) {
                    result = "과체중";
                     }else {
                         result = "비만";
                     }
        System.out.printf("사용자의 키: %.2f m\n 사용자의 몸무게: %.2f kg\n",h,w);        
        System.out.printf("BMI: %.3f\n 사용자의 비만도: %s\n",BMI,result);
        scanner.close();
    }
}
