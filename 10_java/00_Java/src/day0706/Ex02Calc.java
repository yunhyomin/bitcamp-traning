package day0706;

//사용자로부터 두가지 숫자를 입력 받아서 
//더하기, 빼기, 곱하기, 나누기, 나머지를 리턴해주는 메소드를 만들어주는데
//사용자가 넘겨주는 숫자는 int이다.
//또한, 각각의 메소드는 사용자로부터 입력받은 숫자가 각각 얼마인지를
//출력해주고
//나누기 메소드의 경우, 기존의 int / int 와 다르게
//그 결과값을 double의 형태로 리턴해주는 메소드들을 만드시오
//3시까지
import java.util.Scanner;

public class Ex02Calc {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("첫번째 숫자를 입력해주세요.");
        System.out.print("> ");
        int a = scanner.nextInt();

        System.out.println("두번째 숫자를 입력해주세요.");
        System.out.print("> ");
        int b = scanner.nextInt();

        scanner.close();
    }

    // 두 int를 출력해주는 메소드
    public static void print(int number1, int number2) {
        System.out.println("사용자로부터 받은 숫자 1: " + number1);
        System.out.println("사용자로부터 받은 숫자 2: " + number2);
    }

    // 두 double을 출력해주는 메소드
    public static void print(double d1, double d2) {
        System.out.printf("사용자로부터 받은 숫자 1: %.2f\n", d1);
        System.out.printf("사용자로부터 받은 숫자 2: %.2f\n", d2);
    }

    // 두 int를 더해주는 메소드
    public static int add(int number1, int number2) {
        print(number1, number2);

        return number1 + number2;

    }

    // 두 double을 더해주는 메소드
    public static double add(double number1, double number2) {

        return number1 + number2;
    }

    // 두 int를 빼주는 메소드
    public static int minus(int number1, int number2) {
        print(number1, number2);

        return number1 - number2;
    }

    // 두 double을 빼주는 메소드
    public static double minus(double d1, double d2) {
        print(d1, d2);

        return d1 - d2;
    }

    // 두 int를 곱해주는 메소드
    public static int multiply(int number1, int number2) {
        print(number1, number2);

        return number1 * number2;
    }

    // 두 double을 곱해주는 메소드
    public static double multiply(double d1, double d2) {
        print(d1, d2);

        return d1 * d2;
    }

    // 두 int를 나눠주는 메소드
    public static double divide(int number1, int number2) {
        print(number1, number2);

        return (double) number1 / number2;
    }

    // 두 double을 나눠주는 메소드
    public static double divide(double d1, double d2) {
        print(d1, d2);

        return d1 / d2;
    }

    // 두 int를 나눈 나머지를 구하는 메소드
    public static double remainder(int number1, int number2) {
        print(number1, number2);

        return number1 % number2;
    }

    // 두 double을 나눈 나머지를 구하는 메소드
    public static double remainder(double d1, double d2) {
        print(d1, d2);

        return d1 % d2;
    }

    // 메소드 오버로딩(overloading)
    // 메소드 오버로딩이란, 이름은 똑같지만
    // 파라미터를 다르게 설정해서
    // 똑같은 목표를 가진 메소드들을 똑같은 이름으로 묶어주는 방법이다.
    // 단, 오버로딩을 할 때 주의해야할 점은
    // 파라미터가 달라야 한다는 것이다.

    // 그렇다면 파라미터가 다른지 알고 싶으면
    // 우리가 어떻게 알 수 있을까?
    // 파라미터가 다른지 알고 싶다면
    // 해당 메소드의 파라미터들의 데이터타입만 떼어서 보면 된다!

}
