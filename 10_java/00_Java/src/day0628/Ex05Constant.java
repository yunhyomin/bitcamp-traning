package day0628;
// 상수(Constant)

// 상수란, 한번 값이 할당되면 더이상 변경이 불가능한 공간을 우리가 상수라고 한다.
// 변수와 마찬가지로 무조건 한번은 초기화가 되어야 하지만, 
// 한번 초기화가 되면 더이상 새로운 값으로 초기화 할수 없다라는 의미가 된다.

// 상수의 선언방법
// final 데이터타입 상수이름;

// 상수의 초기화 방법
// 상수이름 = 값;
public class Ex05Constant {
    public static void main(String[] args) {
        // 1. 상수 NUMBER를 선언해보자
        final int NUMBER;
        // 2. NUMBER에 5라는 값을 할당해보자
        NUMBER = 5;
        // 3. NUMBER를 화면에 출력해보자
        System.out.println(NUMBER);
        // 4. NUMBER에 10이라는 값을 할당해보자
        // NUMBER = 10; -> 이미 상수 NUMBER에 5라는 값이 초기화되어있기 때문에
        // 새로운 값을 넣어줄 수 없다.
        // 5. NUMBER를 화면에 출력해보자
    }
}
