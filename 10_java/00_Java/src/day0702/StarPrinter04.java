package day0702;
//별찍기 4번

import java.util.Scanner;
public class StarPrinter04 {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("별찍기 4번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();
        
        int iStart = 1;
        int iEnd = userNumber;
        
        for(int i=iStart; i<=iEnd; i++) {
            //i줄안의 내용 변수 선언
            String stars= "";
            //공백을 담당하는 j for 문
            int jStart =1;
            int jEnd =i-1;
            for(int j=jStart; j<=jEnd; j++) {
                stars += " ";
            }
            //별을 담당하는 j for문
            jStart =i;
            jEnd = userNumber;        
            for(int j= jStart; j<=jEnd; j++) {
                stars += "*";
            }
        System.out.println(stars);
        }
        scanner.close();
    
    }
}
