package day0702;
//별찍기 5번

import java.util.Scanner;


public class StarPrinter05 {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("별찍기 5번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();
        
        
        for(int i=1; i<=userNumber; i++) {
            //i줄안의 내용 변수 선언
            String stars= "";
            //공백의 갯수를 저장할 int변수
             int spaceWidth = userNumber-i;
             
            //별의 갯수를 저장할 int 변수
             int starWidth = 2*i-1;
             
            //공백의 갯수를 저장할 j for문
             for(int j =1; j<=spaceWidth; j++) {
                stars += " ";
             }
            //별의 갯수를 저장할 j for문
             for(int j = 1; j<=starWidth; j++) {
                 stars += "*";
             
             }System.out.println(stars);
       
    }
         scanner.close();
}
}
