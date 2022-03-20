package day0714;

import viewer.UserViewer;

//사용자 기능을 MVC패턴으로 구현하시오
//사용자는 사용자 번호, 사용자 username, 사용자 비밀번호, 사용자 닉네임까지 
//4가지 정보를 가지고 있습니다
//사용자는 회원가입, 로그인,로그아웃,회원정보수정,회원탈퇴의 기능을 실행할 수 있습니다.

public class UserMain {
     public static void main(String[] args) {
         UserViewer userViewer = new UserViewer();
         userViewer.showIndex();
     }
}
