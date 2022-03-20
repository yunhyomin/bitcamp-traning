package day0701;
//무한루프를 사용한 예제
//사용자에게 메뉴를 보여주는 프로그램

import java.util.Scanner;

public class Ex04Menu {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        
        while(true) {
            System.out.println("1.입력 2.출력 3.종료");
            int userChoice = scanner.nextInt();
            if(userChoice == 1) {
                //사용자로부터 입력을 받는 코드를 구현한다.
                System.out.println("입력시작");
            }else if(userChoice == 2 ) {
                //입력된 데이터를 출력하는 코드를 구현한다.
                System.out.println("출력시작");
            }else if(userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.");
                break;
                //break란, 반복문 혹은 switch조건문에서 사용되며 break를 만나는 순간  
                //break가 속한 반복문 혹은 switch조건문은 종료된다.
            }
            
            
        }
        
        scanner.close();
    }
   
}
