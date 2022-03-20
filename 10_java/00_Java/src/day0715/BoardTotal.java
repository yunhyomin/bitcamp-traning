package day0715;

import viewer.TotalViewer;

public class BoardTotal {
    public static void main(String[] args) {
        //1. index()
        //2. BoardViewer.showMenu() + UserViewer.showIndex()
        //3. 글쓰기의 경우, 더이상 작성자 이름을 직접 적는것이 아니라 로그인한 회원의 회원번호가 들어가게 만들어준다.
        //4. 글 수정이나 삭제의 경우 로그인한 회원이 작성자일 경우에만 가능하게 만들어준다.
            //작성자가 아닐 경우, 글을 보고나서 뒤로가기만 가능하게 만들어준다.
        //5. 회원 정보보기에서는 자기가 작성한 글목록보기, 회원정보수정, 회원탈퇴기능이 있다.
        //5-A . 자기가 작성한 글 목록보기
//                1. 지금 현재 시작되는 곳은 userViewer가 될 것이다.
//                   따라서 우리는 제일 먼저 userViewer와 boardViewer를 연결시켜주어야한다.
//                2. 연결시켜주기위해서, UserViewer클래스에 BoardViewer객체의 private필드를 만들어준다.
//                3. setter를 사용하여, TotalViewer에서 만든 setBoardViewer()로 넘겨서 2개를 링크시켜준다
//                4. 지금 로그인한 사람이 무슨 글을 썼는지 알기 위해서는 
//                   그사람의 회원 번호와 작성자회원번호가 일치되는 글들의 목록을 뽑아야한다
//                   하지만, 우리가 가지고 있는 메소드들 중에서 회원번호를 토대로 해서 목옥을 뽑아주는 메소드가 없으니 
//                   해당 메소드를 컨트롤러부터 만들어준다
//                5. 컨트롤러에서 어레이리스트를 리턴해주면, 
        //           그 리스트를 받아서 화면에 출력해주는 메소드를 boardViewer에 만들어준다
//                6. 그렇게 만든 메소드를 유저뷰어에서 실행시켜준다.
        //6. 회원 탈퇴 시 , 작성된 글들도 모두 삭제된다.
        //  1.회원탈퇴를 정말 할 것인지 물어본다.
        //  2.만약 사용자가 탈퇴를 정말 동의하면 먼저 게시글 리스트에서 
        //      작성자 회원번호가 해당회원의 회원번호와 일치되는 BoardDTO()객체들을 
        //      모두삭제한다.
        //  3. 해당회원을 회원리스트에서 삭제한다.
        //  4.로그아웃시키고 인덱스화면으로 돌아간다.
        TotalViewer totalViewer = new TotalViewer();
        totalViewer.showIndex();
    }
}
