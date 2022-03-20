package day0701;
//사용자로부터 점수를 입력받아서 

//90~:A 80~:B 70~:C 60~:D 그외:F가 출력되는 프로그램 작성

//단 사용자가 잘못된 점수를 입력하면 올바른 점수를 입력할 때 까지
//다시 입력이 되도록 코드를 작성하시오

//예시)
//사용자의 점수:[##]점
//최종성적: [B]
//
import java.util.Scanner;

public class GradePrinter {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        //점수입력받음
        System.out.println("0~100사이의 점수를 입력해주세요");
        System.out.print(">");
        int score = scanner.nextInt();

//      while(!(score>=0 && score>=100)){]
//====>가로안의 조건이 true일때 !으로 인해 false로 변경된다.
//가로안의 조건이 false일때 !으로 인해 true로 변경된다.
//while조건문은 가로안이 true일때 실행 되므로 잘못입력한경우(FALSE)를 true로 바꿔주기 위해 !를 사용한다.
//    
          
        while (!(0 <= score && score <= 100)) {
            System.out.println("점수를 잘못입력하셨습니다");
            System.out.println("점수를 입력해주세요");
            System.out.print(">");
            score = scanner.nextInt();
        }
        String result;
        if (score <= 90) {
            result = "A";
        } else if (score <= 80) {
            result = "B";
        } else if (score <= 70) {
            result = "C";
        } else if(score<=60) {
            result = "D";
        }else {
            result = "F";
        }
        System.out.printf("사용자의 점수: [%2d]점\n 최종성적: [%s]\n",score,result);
        scanner.close();

    }

}
