package viewer;
//사용자 기능을 MVC패턴으로 구현하시오
//사용자는 사용자 번호, 사용자 username, 사용자 비밀번호, 사용자 닉네임까지 
//4가지 정보를 가지고 있습니다
//사용자는 회원가입, 로그인,로그아웃,회원정보수정,회원탈퇴의 기능을 실행할 수 있습니다.

import java.util.Scanner;
import controller.UserController;
import model.UserDTO;
import util.ScannerUtil;

public class UserViewer {
        private UserController userController;
        private Scanner scanner;
        private UserDTO logIn;
        private BoardViewer boardViewer;
        
        public void setBoardViewer(BoardViewer boardViewer) {
            this.boardViewer = boardViewer;
        }
        
        
        public UserViewer() {
            userController = new UserController();
            scanner = new Scanner(System.in);
            
        }
        
        public void showIndex() {
            String message = new String("1.로그인 2. 회원가입 3.종료");
            while(true) {
                int userChoice = ScannerUtil.nextInt(scanner, message,1,3);
                if(userChoice ==1) {
                    logIn();
                }else if(userChoice ==2) {
                    resister();
                }else if(userChoice == 3) {
                    System.out.println("사용해주셔서 감사합니다.");
                    scanner.close();
                    break;
                }
            }
        }
        
        public void resister() {
            String message;
            UserDTO u = new UserDTO();
            
            //사용할 username입력
            message = new String("사용하실 아이디를 입력해주세요");
            String username = ScannerUtil.nextLine(scanner, message);
            
            //username검증
            while(userController.validateUsername(username)) {
                System.out.println("해당아이디는 가입하실수 없습니다.");
                System.out.println("만약 회원가입을 원치 않으시면 X를 입력해주세요");
                username = ScannerUtil.nextLine(scanner, message);
                if(username.equalsIgnoreCase("X")){
                    break;
                }
           }//현재 username이 X가 아니고 존재하지도 않을 경우
            //username의 현재값이 대소문자 구분없이 X가 아닐경우
            if(!username.equalsIgnoreCase("X")) {
                
            //사용할 비밀번호 입력
            message = new String("사용하실 비밀번호를 입력해주세요");
            String password = ScannerUtil.nextLine(scanner, message);
            
            //사용할 닉네임 입력
            message = new String("사용하실 닉네임을 입력해주세요");
            String nickname = ScannerUtil.nextLine(scanner, message);
            //입력받은 값들을 u에 저장
            u.setUsername(username);
            u.setPassword(password);
            u.setNickname(nickname);
            
            //컨트롤러에 u추가
            userController.insert(u);
            }  
        }
        
        public UserDTO logIn() {
            String message;
            //username입력받는다 
            message = new String("ID: ");
            String username  = ScannerUtil.nextLine(scanner, message);
            
            //password입력받는다.
            message = new String("PW: ");
            String password = ScannerUtil.nextLine(scanner, message);
            
            //일치하는 회원이 나올때까지 
            //다시 username과 password를 입력받거나 
            //아니면 사용자가 더이상 로그인을 원하지 않는지 입력받는다.
            while(userController.logIn(username, password)==null) {
                System.out.println("잘못입력하셨습니다.");
                System.out.println("아이디와 비밀번호를 다시 확인해주세요");
                
                message = new String("아이디를 입력하시거나 뒤로 가시려면 X를 눌러주세요");
                username = ScannerUtil.nextLine(scanner, message);
                
                if(username.equalsIgnoreCase("X")) {
                    break;
                }
                message = new String("비밀번호를 입력해 주세요");
                password = ScannerUtil.nextLine(scanner, message);
            }
            if(!username.equalsIgnoreCase("X")){
                //사용자가 로그인을 원하고 일치하는 회원이 나왔을경우
            //해당 회원으로 userDTO logIn 객체를 초기화한다.
                return  userController.logIn(username, password);
           
            }
            
            return null;
        }
        
        //user와 board를 합치면 쓸모가 없어짐.
//        private void showMenu() {
//            String message = new String("1.정보보기 2.정보수정 3.회원탈퇴 4.로그아웃");
//            while(true) {
//                int userChoice = ScannerUtil.nextInt(scanner, message,1,4);
//                if(userChoice == 1) {
//                    //정보보기 메소드 호출
//                    printOne();
//                }else if(userChoice ==2) {
//                    //정보수정메소드 호출
//                    update();
//                }else if(userChoice ==3) {
//                    delete();
//                }else if(userChoice == 4) {
//                    logOut();
//                    
//                }
//                if(logIn == null) {
//                    //사용자가 회원탈퇴를 했거나 로그아웃을 한 상태이므로 
//                    //무한루프를 종료시킨다.
//                    break;
//                }
//            }
//        }
        public UserDTO printOne(int id) {
            UserDTO u = userController.selectOne(id);
            
            System.out.println("================================");
            System.out.println("회원 번호: "+ u.getId());
            System.out.println("회원 아이디: "+ u.getUsername());
            System.out.println("회원 닉네임: "+ u.getNickname());
            System.out.println("=================================");
            
            String message = new String("1.작성한 글 목록보기 2.회원정보수정 3.회원탈퇴 4.뒤로가기 ");
            int userChoice = ScannerUtil.nextInt(scanner, message,1,4);
            
            if(userChoice == 1) {
                //작성한 글 목록 
                boardViewer.printUserBoard(id);
                
            }else if(userChoice == 2) {
                //회원정보수정
                update(id);
            }else if(userChoice == 3) {
                u= delete(id);
            }
            return u;
        } 
        
        
        private void update(int id) {
            String message = new String("비밀번호를 수정 하시겠습니까? y/n");
            String yesNo = ScannerUtil.nextLine(scanner, message);
            String password = new String();
            
            if(yesNo.equalsIgnoreCase("y")) {
                message = new String("새로운 비밀번호를 입력해주세요");
                password = ScannerUtil.nextLine(scanner, message);
            }
            message = new String("닉네임을 수정하시겠습니까? y/n");
            yesNo = ScannerUtil.nextLine(scanner, message);
            String nickname = new String();//스트링은 생성했지만 안의 값은 아무것도 없는상태
            if(yesNo.equalsIgnoreCase("y")) {
                message = new String("새로운 닉네임을 입력해주세요");
                        nickname = ScannerUtil.nextLine(scanner, message);
            }
            message = new String("입력하신 정보로 수정 하시겠습니까? y/n");
            yesNo = ScannerUtil.nextLine(scanner, message);
            if(yesNo.equalsIgnoreCase("y")) {
                UserDTO u = userController.selectOne(id);
                if(!password.isEmpty()) {
                    logIn.setPassword(password);
                    
                }
                if(!nickname.isEmpty()) {
                    logIn.setNickname(nickname);
                }
                userController.update(u);
            }
        }
        
        private UserDTO delete(int id) {
            String message = new String("정말로 탈퇴하시겠습니까? y/n");
            String yesNo = ScannerUtil.nextLine(scanner, message);
            if(yesNo.equalsIgnoreCase("y")) {
                //해당 회원번호를 작성자 회원번호로 가진 
                //게시글 삭제를 할 메소드를 여기서 실행시킨다.
                boardViewer.deleteByWriterId(id);
                userController.delete(id);
              return null;
            }
            return userController.selectOne(id);
        }
        
        private void logOut() {
            System.out.println("정상적으로 로그아웃되셨습니다.");
            logIn = null;
        }
        
        public UserDTO selectById(int id) {
            return userController.selectOne(id);
        }
}

















