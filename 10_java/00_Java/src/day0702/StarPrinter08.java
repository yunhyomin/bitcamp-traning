package day0702;
//별찍기 8번

import java.util.Scanner;

public class StarPrinter08 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("별찍기 8번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();

        // i for문은 총 몇줄이 출력될지를 결정한다.
        // 그렇다면 i의 최소값은? 1
        // 그렇다면 i의 최대값은? userNumber
//        
        for (int i = 1; i <=userNumber * 2 - 1 ; i++) {
            String stars = "";
            //윗부불
            if (i <= userNumber) {
                // 윗줄의 공백의 j for문
               int spaceWidth = userNumber-i;
                for (int j = 1; j <= spaceWidth; j++) {
                    stars += " ";
                }
                // 윗줄의 별의 j for문
                int starWidth = i;
                for (int j = 1; j <= starWidth; j++) {
                    stars += "*";
                }
            //아랫부분
            } else  {
                //아랫부분의 j for문의 기준이 될 
                //int변수
//                int lowerI = i - userNumber + 1;//이걸로 활용해서 j for문을 만들수도있다 spaceWidth = lowerI-1;
                // 아랫줄의 공백의 j for문
                int spaceWidth =  i - userNumber;
                for (int j = 1; j <= spaceWidth; j++) {
                    stars += " ";
                }
                // 아랫줄의 별의 j for문//starWidth =lowerI-1; for(j = userNumber-1; j>=lowerI-1; j--)
                int starWidth = userNumber*2-1;
                for (int j = i; j <=starWidth; j++) {
                    stars += "*";
                }
            }
            System.out.println(stars);
        }
        scanner.close();
    }
}
