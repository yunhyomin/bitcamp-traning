package day0702;
//별찍기 9번

import java.util.Scanner;
public class StarPrinter09 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("별찍기 9번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();

        // i for문은 총 몇줄이 출력될지를 결정한다.
        // 그렇다면 i의 최소값은? 1
        // 그렇다면 i의 최대값은? userNumber


        for (int i = 1; i <= userNumber * 2 - 1; i++) {
            // i번째 줄에 어떤내용이 출력될지를
            // 담을 String 변수 stars
            String stars = "";
            // i가 userNumber보다 작을때의 if문(윗부분)
            if (i <= userNumber) {
               int spaceWidth;
               int starWidth;
               // 공백의 갯수의 최대값를 저장할 변수 int 선언
                 spaceWidth = userNumber - i; 
                // 왼쪽공백의 j for문   
               for (int j = 1; j <= spaceWidth; j++) {
                   stars += " ";
                }
                // 별의 갯수의 최대값을 저장할 변수    
                 starWidth = i * 2 - 1;
                // 중간의 별을 담당하는 j for문     
               for (int j = 1; j <= starWidth; j++) {
                    stars += "*";
                }
            }
            // i가 userNumber보다 클때(아랫부분)
            else {
                // 공백을 담당하는 j for문
                // 공백의 갯수의 최대값을 저장할 변수
                int spaceWidth = i;
                for (int j = userNumber; j < spaceWidth; j++) {
                    stars += " ";
                }
                // 별을 담당하는 j for문
                // 별의 갯수의 최대값을 저장할 변수
                int starsWidth = userNumber * 2 - 2;
                for (int j = i * 2 - userNumber * 2; j <=starsWidth; j++) {
                    stars += "*";
                }
                
            }
            System.out.println(stars);
            
        }
        scanner.close();
    }
}
