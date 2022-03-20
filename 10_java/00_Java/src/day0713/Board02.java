package day0713;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

import util.ScannerUtil;
import type.Board;
import type.User;
// 게시판에 회원 기능까지 추가한 버젼
public class Board02 {

    private static ArrayList<Board> boardList = new ArrayList<>();
    private static ArrayList<User> userList = new ArrayList<>();
    private static User logIn = null;
    private static Scanner scanner = new Scanner(System.in);
    private static int nextBoardId = 1001;
    private static int nextUserId = 1;

    public static void main(String[] args) {

        index();

    }

    private static void index() {

        String message = new String("1.로그인 2.회원가입 3.종료");
        while (true) {
            int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);
            if (userChoice == 1) {
                // 로그인 메소드 호출
                // 해당 메소드는 User객체 login에 로그인 성공시에 값을 저장한다.
                // 만약 저장된 값이 null이면 아무것도 하지 않지만
                // 그 외의 경우에는 showMenu메소드를 실행시킨다.
                logIn();

                if (logIn != null) {
                    showMenu();
                }
            } else if (userChoice == 2) {
                // 회원가입 메소드 호출
                resister();
            } else if (userChoice == 3) {
                System.out.println("사용해주셔서 감사합니다.");
                break;
            }
        }
    }

    private static void logIn() {
        String message = new String("ID:");
        String username = ScannerUtil.nextLine(scanner, message);

        message = new String("PW:");
        String password = ScannerUtil.nextLine(scanner, message);

        while (validate(username, password) == null) {
            System.out.println("일치하는 회원이 없습니다.");

            String yesNo = ScannerUtil.nextLine(scanner, "다시 시도하시겠습니까?y/n");

            if (yesNo.equalsIgnoreCase("n")) {
                break;
            }
            username = ScannerUtil.nextLine(scanner, "ID: ");
            password = ScannerUtil.nextLine(scanner, "PW: ");
        }

        logIn = validate(username, password);

    }

    private static User validate(String username, String password) {
        for (int i = 0; i < userList.size(); i++) {
            if (userList.get(i).auth(username, password)) {
                return userList.get(i);
            }

        }
        return null;
    }

    private static void resister() {
        User u = new User();
        String message;
        u.setId(nextUserId++);

        // id입력
        message = new String("ID를 입력해주세요");
        String username = ScannerUtil.nextLine(scanner, message);

        // 해당 아이디가 중복인지 체크
        while (validateUsername(username)) {
            System.out.println("중복된 ID는 사용할 수 없습니다.");
            System.out.println("만약 가입을 원하시지 않으면 -1을 입력해주세요");
            username = ScannerUtil.nextLine(scanner, message);

            if (username.equals("-1")) {
                break;
            }
        }

        if (!username.equals("-1")) {

            // pw입력
            message = new String("PW를 입력해주세요");
            String password = ScannerUtil.nextLine(scanner, message);
            // 닉네임 입력
            message = new String("사용하고자 하는 닉네임을 입력해주세요.");
            String nickname = ScannerUtil.nextLine(scanner, message);

            u.setUsername(username);
            u.setPassword(password);
            u.setNickname(nickname);

            // userList추가
            userList.add(u);
        }
    }

    private static boolean validateUsername(String username) {
        for (int i = 0; i < userList.size(); i++) {
            User u = userList.get(i);
        }
        // 위의 for문을 짧게 줄여서 쓰는 방법이 있는데
        // forEach문이라고 부른다
        // 단, 실제 리스트의 크기가 변경되거나 하면 에러가 발생하무로
        // 단순 값 비교나 출력에 사용하면 편하다.

        // forEach문은 다음과 같은 구조를 가진다.
        // for(클래스 객체이름: 리스트와 같이 모여있는 객체){
        //
        // }
        for (User u : userList) {
            if (u.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }

    // 메뉴창 출력을 담당하는 showMenu()
    public static void showMenu() {
        String message = new String("1. 새 글 등록 2. 글 목록보기 3. 로그아웃");
        while (true) {
            int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);
            // 사용자의 입력에 따라 각각의 메소드를 호출한다.
            if (userChoice == 1) {
                // 새 글 등록을 담당하는 write() 호출
                write();
            } else if (userChoice == 2) {
                // 목록 보기를 담당하는 printAll() 호출
                printAll();
            } else if (userChoice == 3) {
                // 사용자에게 메시지 출력 후 종료
                System.out.println("로그아웃 되셨습니다.");
                logIn = null;
                break;
            }
        }

    }

// 새 글 쓰기를 담당하는 write()
    public static void write() {
        Board b = new Board();
        // 입력 시 출력할 메시지를 저장할 변수
        String message;

        // 번호 등록
        b.setId(nextBoardId++);
        // 제목 등록
        message = new String("새 글의 제목을 입력해주세요.");
        b.setTitle(ScannerUtil.nextLine(scanner, message));
        // 작성자 등록
        b.setWriterId(logIn.getId());
        // 내용 등록
        message = new String("글의 내용을 입력해주세요.");
        b.setContent(ScannerUtil.nextLine(scanner, message));

        // 글 작성시간 등록
        b.setWrittenDate(Calendar.getInstance());
        // 글 수정시간 등록
        b.setUpdateDate(Calendar.getInstance());
        
        logIn.setNickname(logIn.getNickname()+ nextBoardId);

        boardList.add(b);

    }

    private static Board selectById(int id) {
        Board b = new Board();
        b.setId(id);
        if (boardList.contains(b)) {
            return boardList.get(boardList.indexOf(b));
        }
        return null;
    }

//글 목록 출력을 담당하는 printAll()
    public static void printAll() {

        if (boardList.isEmpty()) {

            System.out.println("아직 등록된 글이 존재하지 않습니다.");
        } else {
            // 입력된 글이 존재하므로 목록 출력
            for (int i = 0; i < boardList.size(); i++) {
                Board b = boardList.get(i);
                System.out.printf("%d번 글. %s\n", b.getId(), b.getTitle());
            }
            // 사용자로부터 상세보기할 글의 인덱스 혹은
            // 0을 입력받아서 상세보기로 이동하거나
            // 뒤로 간다.
            // 단, 뒤로 가기의 경우, 우리가 아무런 코드 처리를 해주지 않으면
            // 코드 실행 순서에 따라 자동으로 showMenu()의 while(true)로
            // 돌아가게 된다.

            // 입력시에 사용할 메시지를 저장할 변수
            String message = new String("상세보기할 글의 번호나 뒤로 가실려면 0을 입력해주세요.");
            int userChoice = ScannerUtil.nextInt(scanner, message);

            while (selectById(userChoice) == null && userChoice != 0) {
                // 개별 글 보기를 담당하는 printOne(index) 실행
                System.out.println("잘못입력하셨습니다.");

                userChoice = ScannerUtil.nextInt(scanner, message);

            }
            if (userChoice != 0) {
                printOne(userChoice);
            }
        }
    }

//개별 글 보기를 담당할 printOne(index)
    public static void printOne(int id) {
        Board b = selectById(id);
        printInfo(b);

        // 개별 글 출력이 끝나면
        // 사용자에게
        // 수정, 삭제, 목록으로 가기
        // 중 하나를 입력하도록 안내한다.

        // 출력시 사용할 메시지를 저장할 변수
        String message = new String("1. 수정 2. 삭제 3. 뒤로가기");

        int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);

        // userChoice 값에 따라 각각의 메소드를 실행시켜준다.
        if (userChoice == 1) {
            // 수정을 담당하는 update(index) 실행
            update(id);
        } else if (userChoice == 2) {
            // 삭제를 담당하는 delete(index) 실행
            delete(id);
        } else if (userChoice == 3) {
            // 목록 출력을 담당하는 printAll() 실행
            printAll();
        }
    }

//수정을 담당하는 update(index)
    public static void update(int id) {
        Board b = selectById(id);
        // 글을 수정할 때에는
        // 번호와 작성자는 수정되선 안되므로
        // 제목과 내용만 새로 입력을 받아서 저장한다.

        // 입력시 출력할 메시지를 저장할 변수
        String message;

        // 제목 수정
        message = new String("새로운 제목을 입력해주세요.");
        b.setTitle(ScannerUtil.nextLine(scanner, message));

        // 내용 수정
        message = new String("새로운 내용을 입력해주세요.");
        b.setContent(ScannerUtil.nextLine(scanner, message));

        // 수정시간 수정
        b.setUpdateDate(Calendar.getInstance());

        // 수정 후 해당 인덱스의 개별 글 보기를 실행해서
        // 수정 결과를 볼 수 있게 메소드를 호출한다.
        printOne(id);
    }

    public static void delete(int id) {
        Board b = selectById(id);
        // 사용자로부터 정말로 삭제할지를 입력받아서
        // 삭제를 원하면 각 배열에서 해당 인덱스를 삭제하고
        // 목록 보기로 이동
        // 그 외에는 다시 개별 글 보기로 이동

        // 삭제 동의 여부를 입력받는다.
        String message = new String("정말로 삭제하시겠습니까? y/n");
        String yesNo = ScannerUtil.nextLine(scanner, message);

        if(yesNo.equalsIgnoreCase("y")) {
            boardList.remove(b);
            // 글 목록보기로 이동한다.
            printAll();
        } else {
            // 해당 글 개별보기로 이동한다.
            printOne(id);
        }
    }
    public static User selectUserById(int id) {
        User u = new User();
        u.setId(id);
        for (User origin : userList) {
            if (u.equals(origin)) {
                return origin;
            }
        }
        return null;
    }

    public static void printInfo(Board b) {
        SimpleDateFormat sdf = new SimpleDateFormat("y-M-d H:m:s");
        System.out.println("====================================");
        System.out.println("제목:" + b.getTitle());
        System.out.println("------------------------------------");
        User u = selectUserById(b.getWriterId());
        System.out.printf("번호:%03d 번 작성자: %s\n ", b.getId(), u.getNickname());
        System.out.println("작성일: " + sdf.format(b.getWrittenDate().getTime()));
        System.out.println("수정일: " + sdf.format(b.getUpdateDate().getTime()));
        System.out.println("------------------------------------");
        System.out.println(b.getContent());
        System.out.println("====================================");
    }
}
