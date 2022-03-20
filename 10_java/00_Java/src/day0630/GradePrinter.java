package day0630;
//사용자로부터 점수를 입력받아서 
//90~:A 80~:B 70~:C 60~:D 그외:F가 출력되는 프로그램 작성

//예시)
//사용자의 점수:[##]점
//최종성적: [B]
//
import java.util.Scanner;
public class GradePrinter {
    public static void main(String[]args) {
        Scanner scanner = new Scanner(System.in);
        //그냥 연습삼아 상수선언해봄.
final int A = 90;
final int B = 80;              
final int C = 70;
final int D = 60;
        System.out.println("점수를 입력해주세요");//점수를 입력받는다
        System.out.print(">");
        
        int j = scanner.nextInt();//입력받은 정수를 변수에 저장
        
        String result; //점수에 따라 result에 결과를 저장
        
        if(j>=A) {
            result = ("A");
        }else if(j>=B) {
            result = ("B");
        }else if(j>=C) {
            result = ("C");
        }else if(j>=D) {
            result = ("D");
        }else {
            result = ("F");

        }
        //점수와 결과를 출력
        System.out.printf("사용자의 점수:[%2d]점\n",j);
        System.out.printf("최종성적:[%s]\n",result);
        scanner.close();
        
    }
    
    
    
}
