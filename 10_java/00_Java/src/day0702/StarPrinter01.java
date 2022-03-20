package day0702;
//별찍기 1번

import java.util.Scanner;
public class StarPrinter01 {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("별찍기 1번");
        System.out.println("출력할 줄 수를 입력해주세요");
        System.out.print(">");
        int userNumber = scanner.nextInt();
        
        //i for문은 총 몇줄이 출력될지를 결정한다.
        //그렇다면 i의 최소값은? 1
        //그렇다면 i의 최대값은? userNumber
        
        int iStart  =1;
        int iEnd = userNumber;
        
        for(int i = iStart; i<=iEnd; i++) {
            //i번째 줄에 어떤내용이 출력될지를 
            //담을 String 변수 stars
            String stars = "*";
            
            //j for문은 i번째 줄에 
            //몇개의 별이 들어갈지 결정한다
            
            int jStart = 1;
            int jEnd = i;
            
            for(int j = jStart; j<=jEnd; j++) {
                //j for문이 한번 반복될때마나 
                //stars 의 현재내용에 *을 붙여서 
                //다시 stars에 저장한다.
                stars += "*";
            }
            System.out.println(stars);
        }
        
        
        
        
        scanner.close();
    }
}
