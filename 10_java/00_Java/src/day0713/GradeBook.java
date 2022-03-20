package day0713;
//우리가 MVC패턴으로 구현한 
//학생관리 프로그램의 시작점 
//단, 이 클래스에는 메인 메소드만 있고 
//그리고 메인 메소드는 스튜던트 뷰어 객체 생성후 showMenu()만 호출한다.

import viewer.StudentViewer;

public class GradeBook {
    public static void main(String[] agrs) {
        StudentViewer viewer = new StudentViewer();
        viewer.showMenu();
    }
}
