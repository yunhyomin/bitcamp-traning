package day0709;
// 전역변수(Global variable)
// 전역 변수란 유효범위가
// 해당 프로그램 전체인 변수를 전역 변수라고 한다.
// 어디 메소드 안에 우리가 변수를 선언해주는 것이 아니라
// 클래스 아래에 곧장 선언하면 해당 변수를
// 그 클래스의 모든 메소드들이 사용가능하다.

// 전역변수의 장점: 모든 클래스가 사용가능하다.
// 전역변수의 단점: 모든 클래스가 사용가능하다.
// 모든 클래스가 전역 변수에 접근 가능하기 때문에
// 전역 변수의 값을 우리가 정확하게 추적하기 어렵다.
// 그렇기 때문에 전역 변수는 우리가 사용을 최소한으로 해야한다.
// 정말정말 모든 메소드들이 공통적으로 접근해야하는 경우가 아니라면
// 전역 변수를 써선 안된다.

public class Ex01GlobalVar {
    static final int SIZE = 6;
    static int num = 10;
    
    public static void main(String[] args) {
        showSIZE();
    }
    
    public static void showSIZE() {
        System.out.println("SIZE: " + SIZE);
        System.out.println("num: " + num);
        addSIZE();
    }
    
    public static void addSIZE() {
        int a = SIZE + 4;
        num += a;
        System.out.println("a: " + a);
        System.out.println("num: " + num);
    }
}
