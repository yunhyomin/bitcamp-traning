package day0701;
//사용자가 숫자를 입력할떄 1을 입력하지 않으면 "1을 입력하셔야 돼요!"하고 알려주고 
//1을 입력하면 "1을 입력했어요"라고 출력되는 프로그램 
//단, 사용자가 1을 입력하기 전까지 프로그램이 종료되지 ㅇ않는다

import java.util.Scanner;
public class Ex02WhileEx {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("1을 입력하세요");
        System.out.print(">");
        int number = scanner.nextInt();
        
        while(number!=1) {
            //사용자가 1을 입력하지 않았으므로 1을 입력하라고 시킨다.
            System.out.println("1을 입력하셔야돼요!");
            System.out.println("1을 입력하세요");
            System.out.print(">");
            number = scanner.nextInt();
        }
        System.out.println("1을 입력했어요!");
        scanner.close();
    }
}
