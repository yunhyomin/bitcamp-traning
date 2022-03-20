package day0630;
//검증(Validation)

//어떠한 값이 올바른 값인지를 검사하는 것을 검증이라고 한다.

//자바에서는 처리해야할 데이터가 올바른 값인지를 검증하는 방법이 다양하지만 우리는 여기서 
//조건식을 빡빡하게 잡아서 검증하기
//올바른 범위에 속하는지 먼저 검증하고 처리하는 방식 
//이 2가지 방법의 검증방법을 알아볼 것이다.
import java.util.Scanner;

public class Ex07Varidation {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        final int A = 90;
        final int B = 80;
        final int C = 70;
        final int D = 60;
        System.out.println("점수를 입력해주세요");// 점수를 입력받는다
        System.out.print(">");

        int j = scanner.nextInt();// 입력받은 정수를 변수에 저장

        String result; // 점수에 따라 result에 결과를 저장

        if (j >= A) {
            result = ("A");
        } else if (j >= B) {
            result = ("B");
        } else if (j >= C) {
            result = ("C");
        } else if (j >= D) {
            result = ("D");
        } else {
            result = ("F");
        }
        System.out.println("1.검증이 안된 결과");
        System.out.printf("사용자의 점수: [%2d]점\n", j);
        System.out.printf("최종성적: [%s]\n", result);
        System.out.println("\n==========================\n");
        
        // 검증1. 빡빡한 조건식을 사용하여 해당결과가 나오는 구간을 정확하게 잡아주는 방법
        // 이 검증 방법은 올바른 값의 범위가 연속적이지 않고
        // 분리가 되어있고 범위의 종류가 많지 않을때 사용하면 편하다.

        if (j >= 90 && j <= 100) {
            result = "A";
        } else if (j >= 80 && j <= 89) {
            result = "B";
        } else if (j >= 70 && j <= 79) {
            result = "C";
        } else if (j >= 60 && j <= 69) {
            result = "D";
        } else if (j >= 0 && j <= 59) {
            result = "F";
        } else {
            result = "잘못 입력하셨습니다.";
        }
        System.out.println("1.빡빡한 조건식");
        System.out.printf("사용자의 점수: [%2d]점\n", j);
        System.out.printf("최종성적: [%s]\n", result);
        System.out.println("\n==========================\n");

        //검증2. 중첩if문을 사용하는경우 먼저 사용자가 입력한 값이 
        //올바른 값의 전체 범위에 속하는지 체크하여 만약 올바른 값이면 
        //그 안에서 if-else if의 구조를 사용하여 처리를 해주고 
        //올바르지 않다면 경고 메세지 등의 처리를 해주면 된다.
        
        //else를 아예 뒤로뺀다.
        if(j>=0 && j<=100) {
            //점수가 올바른 범위이므로 if-else if로 결과를 구한다.
            if (j >= A) {
                result = ("A");
            } else if (j >= B) {
                result = ("B");
            } else if (j >= C) {
                result = ("C");
            } else if (j >= D) {
                result = ("D");
            } else {
                result = ("F");
            }
            System.out.println("2.올바른 범위 선검사");
            System.out.printf("사용자의 점수: [%2d]점\n", j);
            System.out.printf("최종성적: [%s]\n", result);
        }else {
            //점수가 올바른 범위에 속하지 않으므로 경고메시지만 출력
            System.out.println("잘못된 점수입니다.");
            
        }
        System.out.println("\n==========================\n");
        
        
        scanner.close();

    }

}
