package day0709;
// 학생의 정보를 구조체로 만들기 위한 클래스
// 해당 클래스 안에는 메소드가 존재하지 않는다.
// 따라서 우리가 이 클래스에서 만들 것은
// 오로지 필드만 만들게 된다.

// 필드 만드는 방법:
// (public) 데이터타입 필드이름
// 단, public은 생략 가능하거나 다른 단어가 올 수 있다.
public class Student {
    // 학생의 번호
    public int id;
    
    // 학생의 이름
    public String name;
    
    // 학생의 국어 점수
    public int korean;
    
    // 학생의 영어 점수
    public int english;
    
    // 학생의 수학 점수
    public int math;
}
