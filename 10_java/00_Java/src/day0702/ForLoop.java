package day0702;

//1. 1부터 6끼지 출력하시오
//2. 17부터 12까지 출력하시오
//3. 71부터 83가지의 모든 짝수를 출력하시오
//4.사용자로부터 숫자를 하나 입력받아서 1부터 그 수까지 출력
//5.사용자로부터 숫자를 두개 입력받아서 더 큰수부터 저 작은수까지 출력
//6. 사용자로부터 숫자를 하나 입력받아서 1부터 그 수가지의 합을 출력
//7. 사용자로부터 숫자를 하나 입력받아서 1부터 그 수까지의 곱을 출력하시오
import java.util.Scanner;

public class ForLoop {
    public static void main(String[] args) {

        final String Line = "\n========================\n";
        Scanner scanner = new Scanner(System.in);

        int i;
        System.out.println("1번");
        for (i = 1; i <= 6; i++) {
            System.out.println(i);
            System.out.println(Line);
        }
        System.out.println("2번");
        // 변수선언
        int start = 17;
        int end = 12;
        for (i = start; i >= end; i--) {
            System.out.println(i);
            System.out.println(Line);
        }
        System.out.println("3번");
        start = 71;
        end = 83;
        for (i = start; i <= end; i++) {
            if (i % 2 == 0) {
                System.out.println(i);
            }
        }
        System.out.println(Line);

        System.out.println("4번");
        System.out.println("숫자를 입력하세요");
        int userNumber_I = scanner.nextInt();

        start = 1;
        end = userNumber_I;
        for (i = start; i < end; i++) {
            System.out.println(i);
        }
        System.out.println(Line);

        System.out.println("5번");
        for (i = 1; i < userNumber_I; i++) {
            System.out.println(i);
            System.out.println("1번숫자를 입력하세요");
            userNumber_I = scanner.nextInt();
            System.out.println("2번숫자를 입력하세요");
            int userNumber_II = scanner.nextInt();

            if (userNumber_I < userNumber_II) {
                start = userNumber_II;
                end = userNumber_I;
                for (i = start; i >= end; i--) {
                    System.out.println(i);
                }
            } else if (userNumber_I > userNumber_II) {
                for (i = end; i > start; i--) {
                    System.out.println(i);
                }
            }

            System.out.println(Line);

            System.out.println("6번");
            System.out.println("숫자를 입력하세요");
            userNumber_I = scanner.nextInt();
            // 1부터의 합을 저장할 int변수
            int sum = 0;
            start = 1;
            end = userNumber_I;
            for (i = start; i <= end; i++) {
                sum += i;
                System.out.printf("1부터 %d까지의 합: %d\n", userNumber_I, sum);
            }
            System.out.println(Line);
        }
        System.out.println("7번");
        userNumber_I = scanner.nextInt();
        // 1부터 userNnumber_I까지의 곱을 저장할 변수
        int sigma = 1;

        start = 1;
        end = userNumber_I;

        for (i = start; i <= end; i++) {
            sigma *= 1;
        }
        System.out.printf("1부터 %d까지의 곱: %d\n", i);
        scanner.close();
    }
}
