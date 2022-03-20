package day0713;

import java.util.ArrayList;
// 게시판 프로그램에 입력날짜와 수정날짜를 추가하여 Board.java를 개조하여 
//사용자가 글을 입력하면 자동으로 입력날짜  입력시간으로 입력이 되고 
//사용자가 해당 글을 수정하면 자동으로 수정날짜 수정시간으로 바뀌게 프로그램을 만드시오
//단, 주요기능들 중 글 개별보기나 수정삭제는 인덱스가 아닌 글 번호로 접근하고 
//그 외 기능들은 기존 프로그램에서 복사 붙여넣기 하셔도 됩니다.
import java.util.Scanner;
import util.ScannerUtil;
import type.Board;
import java.util.Calendar;

public class Board01 {
    // 전역 변수
    private static ArrayList<Board> list = new ArrayList<>();
    private static Scanner scanner = new Scanner(System.in);
    private static int nextId = 1001;

    public static void main(String[] args) {
        // 메뉴창 출력을 담당하는 showMenu() 호출
        showMenu();
    }

    // 메뉴창 출력을 담당하는 showMenu()
    public static void showMenu() {
        String message = "1. 새 글 등록 2. 글 목록보기 3. 종료";
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
                System.out.println("사용해주셔서 감사합니다.");
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
        b.setId(nextId++);
        // 제목 등록
        message = "새 글의 제목을 입력해주세요.";
        b.setTitle(ScannerUtil.nextLine(scanner, message));
        // 작성자 등록
        message = "글의 작성자를 입력해주세요.";
        b.setWriter(ScannerUtil.nextLine(scanner, message));
        // 내용 등록
        message = "글의 내용을 입력해주세요.";
        b.setContent(ScannerUtil.nextLine(scanner, message));
        // 글 작성시간 등록
        b.setWrittenDate(Calendar.getInstance());
        // 글 수정시간 등록
        b.setUpdateDate(Calendar.getInstance());

        list.add(b);

    }

    private static Board selectById(int id) {
        Board b = new Board();
        b.setId(id);
        if (list.contains(b)) {
            return list.get(list.indexOf(b));
        }
        return null;
    }

//글 목록 출력을 담당하는 printAll()
    public static void printAll() {

        if (list.isEmpty()) {

            System.out.println("아직 등록된 글이 존재하지 않습니다.");
        } else {
            // 입력된 글이 존재하므로 목록 출력
            for (int i = 0; i < list.size(); i++) {
                Board b = list.get(i);
                System.out.printf("%d번 글. %s\n", b.getId(), b.getTitle());
            }

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
        b.printInfo();

        // 개별 글 출력이 끝나면
        // 사용자에게
        // 수정, 삭제, 목록으로 가기
        // 중 하나를 입력하도록 안내한다.

        String message = new String("1. 수정 2. 삭제 3. 뒤로가기");

        int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);

        // userChoice 값에 따라 각각의 메소드를 실행시켜준다.
        if (userChoice == 1) {
            // 수정을 담당하는 update(id) 실행
            update(id);
        } else if (userChoice == 2) {
            // 삭제를 담당하는 delete(id) 실행
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

        // 입력시 출력할 메시지를 저장할 변수
        String message;

        // 삭제 동의 여부를 입력받는다.
        message = new String("정말로 삭제하시겠습니까? y/n");
        String yesNo = ScannerUtil.nextLine(scanner, message);

        if (yesNo.equalsIgnoreCase("y")) {
            list.remove(b);
            printAll();
        }else {
            printOne(id);
        }
    }
}
