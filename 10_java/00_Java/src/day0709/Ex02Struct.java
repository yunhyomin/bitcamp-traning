package day0709;
// 구조체(Struct)
// 구조체란 여러가지의 데이터타입을 묶어서
// 새로운 데이터타입을 만드는 또다른 자료형이다.
// 예를 들어서
// 게시글의 경우
// 게시글 번호, 게시글 제목, 게시글 작성자, 게시글 내용을
// 하나로 묶어서 새로운 
// 게시글이라는 데이터타입을 만드는 것이다.

// 하지만 자바는 구조체가 따로 존재하지 않기 때문에
// 우리가 클래스를 구조체처럼 다루면 된다.

// 자바로 구조체 만드는 방법:
// 새로운 클래스를 만들어서 그 안에 
// 필요한 데이터타입을 변수 선언하듯이 만들면 된다.
// 이렇게 구조체 안에 우리가 실제로 데이터를 넣을 공간을 만드는 것인데
// 이러한 공간을 우리는 필드 라고 부른다.

// 구조체 변수 만드는 방법
// 클래스이름 변수이름 = new 클래스이름();

// 구조체 변수 안에 값을 넣는 방법
// 변수이름.공간이름 = 값;

public class Ex02Struct {
    public static void main(String[] args) {
        // 우리가 만든 Student.java를 사용하여
        // 변수를 만들어보자
        Student s = new Student();
        
        // Student 클래스 변수 s에 값을 입력해보자
        s.id = 1;
        s.name = "조재영";
        s.korean = 80;
        s.english = 79;
        s.math = 80;
        
        // Student 클래스 변수 s를 printf로 출력해보자
        System.out.printf("번호: %03d번 이름: %s\n", s.id, s.name);
        System.out.printf("국어: %03d점 영어: %03d점 수학: %03d점\n", 
                s.korean, s.english, s.math);
        
        // Student 클래스 변수를 하나 더 만들어보자
        Student s2 = new Student();
        s2.id = 2;
        s2.name = "김철수";
        s2.korean = 70;
        s2.english = 80;
        s2.math = 81;
        
        // Student 클래스 변수 s2를 printf로 출력해보자
        System.out.printf("번호: %03d번 이름: %s\n", s2.id, s2.name);
        System.out.printf("국어: %03d점 영어: %03d점 수학: %03d점\n", 
                s2.korean, s2.english, s2.math);
        
        // Student 클래스의 배열을 만들어보자
        Student[] arr = new Student[3];
        // arr에 0번에 id, name 등 정보를 넣어보자
        // 단, 이때에는 각 인덱스번 칸에 new Student(); 로 초기화를 하지 않으면
        // NullPointerException 이라는 에러가 발생하게 된다.
        // Null이란?
        // 스택 영역에 해당 참조형 변수 안에 힙 영역의 주소값이
        // 저장이 되었지만
        // 실제 값을 가지고 있어야할 힙 영역에 해당 공간이
        // 아직 아무런 준비가 되지 않은 상태를 널(Null)이라고 한다.
        // 널인 상태의 참조형 변수 안에 필드 혹은 메소드를 접근 할려고 하면
        // 아직 준비가 안된 상태이기 때문에 NullPointerException이라는
        // 에러가 발생하게 되는 것이다.
        arr[0] = new Student();
        arr[0].id = 30;
        arr[0].name = "30번 학생";
        arr[0].korean = 30;
        arr[0].english = 31;
        arr[0].math = 32;
        
        // arr[0].name을 출력해보자
        System.out.println("arr[0].name: " + arr[0].name);
        
        // Student 변수끼리의 실제 값 비교를 해보자
        
        s.id = 1;
        s.name ="a";
        s.korean = 10;
        s.english = 10;
        s.math = 10;
        
        s2.id = 1;
        s2.name ="a";
        s2.korean = 10;
        s2.english = 10;
        s2.math = 10;
        
        System.out.println("s == s2: " + (s == s2));
        System.out.println("s.equals(s2): " + (s.equals(s2)));
        // equals() 메소드를 사용하여 클래스형 변수의 값을 비교하는게 맞지만
        // 비교하기 위해서는 우리가 몇가지 셋팅을 미리 해두어야 한다.
        // 단 해당 셋팅은 우리가 클래스를 배우면서 진행할 것이다.
        
    }
}




















