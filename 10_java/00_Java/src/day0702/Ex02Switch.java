package day0702;
//시용자로부터 월을 입력받으려면 
//해당 월의 마지막 날짜를 알려주는 프로그램
import java.util.Scanner;
public class Ex02Switch {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("월을 입력하세요");
        System.out.print(">");
        int month = scanner.nextInt();
        
        switch(month) {
        case 2:
            System.out.println("28일까지입니다.");
            break;
        case 4:
        case 6:
        case 9:
        case 11:
            System.out.println("30일까지입니다.");
            break;
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            System.out.println("31일까지입니다.");
            break;
        }//break를 의도적으로 삭제하여 코드를 간략하게 만든다
        scanner.close();
    }
}
