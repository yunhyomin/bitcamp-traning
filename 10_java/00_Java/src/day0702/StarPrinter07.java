package day0702;
//별찍기 7번

import java.util.Scanner;

import javax.swing.text.StyledEditorKit.ForegroundAction;

public class StarPrinter07 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("별찍기 7번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();

        // i for문은 총 몇줄이 출력될지를 결정한다.
        // 그렇다면 i의 최소값은? 1
        // 그렇다면 i의 최대값은? userNumber

//윗부분을 위한  i for문 
        for (int i = 1; i <= userNumber; i++) {
            // i번째 줄에 어떤내용이 출력될지를
            // 담을 String 변수 stars
            String stars = "";
       
            for (int j = 1; j <= i; j++) {
                stars += "*";
            }
            System.out.println(stars);
            
        }
//애랏부분을 위한 i for문        
           
            for(int i=userNumber; i>=1; i--) {
                String stars = "";
                   
               for(int j=1; j<=i; j++) {
                   stars +="*";
               }
                   System.out.println(stars);
            }
        scanner.close();
    }
}
