package day0709;

// 게시판 프로그램을 작성하시오.
// 게시글에는
// 글 번호, 제목, 작성자, 내용이 들어가며
// 글 번호는 자동으로 부여됩니다.
// 또한 목록보기 기능이 있으며
// 목록보기 기능을 실행시에는
// 인덱스. 제목이 출력되며
// 개별 글 보기 기능이 있어야 합니다.
// 또한 개별 글 수정/삭제 기능이 있어야 합니다.
// 4시 20분까지
import java.util.Scanner;
import util.ArrayUtil;
import util.ScannerUtil;

public class Board {
    // 전역 변수
    // 입력을 담당할 Scanner 클래스 변수
    static Scanner scanner = new Scanner(System.in);
    // 번호를 저장할 int 배열
    static int[] idArray = new int[0];
    // 제목을 저장할 String 배열
    static String[] titleArray = new String[0];
    // 작성자를 저장할 String 배열
    static String[] writerArray = new String[0];
    // 내용을 저장할 String 배열
    static String[] contentArray = new String[0];
    // 다음 입력될 글의 번호를 저장할 int 변수
    static int currentId = 1;

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

        scanner.close();
    }

    // 새 글 쓰기를 담당하는 write()
    public static void write() {
        // 입력 시 출력할 메시지를 저장할 변수
        String message;

        // 번호 등록
        idArray = ArrayUtil.add(idArray, currentId++);

        // 제목 등록
        message = "새 글의 제목을 입력해주세요.";
        titleArray = ArrayUtil.add(titleArray, ScannerUtil.nextLine(scanner, message));

        // 작성자 등록
        message = "글의 작성자를 입력해주세요.";
        writerArray = ArrayUtil.add(writerArray, ScannerUtil.nextLine(scanner, message));

        // 내용 등록
        message = "글의 내용을 입력해주세요.";
        contentArray = ArrayUtil.add(contentArray, ScannerUtil.nextLine(scanner, message));

    }

    // 글 목록 출력을 담당하는 printAll()
    public static void printAll() {
        if (!ArrayUtil.isEmpty(idArray)) {
            // 입력된 글이 존재하므로 목록 출력
            for (int i = 0; i < ArrayUtil.size(idArray); i++) {
                System.out.printf("%d번 글. %s\n", i + 1, ArrayUtil.get(titleArray, i));
            }
            // 사용자로부터 상세보기할 글의 인덱스 혹은
            // 0을 입력받아서 상세보기로 이동하거나
            // 뒤로 간다.
            // 단, 뒤로 가기의 경우, 우리가 아무런 코드 처리를 해주지 않으면
            // 코드 실행 순서에 따라 자동으로 showMenu()의 while(true)로
            // 돌아가게 된다.

            // 입력시에 사용할 메시지를 저장할 변수
            String message = "상세보기할 글의 번호나 뒤로 가실려면 0을 입력해주세요.";
            int userChoice = ScannerUtil.nextInt(scanner, message, 0, ArrayUtil.size(idArray)) - 1;

            if (userChoice != -1) {
                // 개별 글 보기를 담당하는 printOne(index) 실행
                printOne(userChoice);
            }

        } else {
            // 입력된 글이 존재하지 않으므로
            // 경고 메시지만 출력
            System.out.println("아직 등록된 글이 존재하지 않습니다.");
        }
    }

    // 개별 글 보기를 담당할 printOne(index)
    public static void printOne(int index) {
        System.out.println("제목: " + ArrayUtil.get(titleArray, index));
        System.out.printf("글 번호: %d \t 작성자: %s\n", ArrayUtil.get(idArray, index), ArrayUtil.get(writerArray, index));
        System.out.println(ArrayUtil.get(contentArray, index));
        // 개별 글 출력이 끝나면
        // 사용자에게
        // 수정, 삭제, 목록으로 가기
        // 중 하나를 입력하도록 안내한다.

        // 출력시 사용할 메시지를 저장할 변수
        String message = "1. 수정 2. 삭제 3. 목록으로";

        int userChoice = ScannerUtil.nextInt(scanner, message, 1, 3);

        // userChoice 값에 따라 각각의 메소드를 실행시켜준다.
        if (userChoice == 1) {
            // 수정을 담당하는 update(index) 실행
            update(index);
        } else if (userChoice == 2) {
            // 삭제를 담당하는 delete(index) 실행
            delete(index);
        } else if (userChoice == 3) {
            // 목록 출력을 담당하는 printAll() 실행
            printAll();
        }
    }

    // 수정을 담당하는 update(index)
    public static void update(int index) {
        // 글을 수정할 때에는
        // 번호와 작성자는 수정되선 안되므로
        // 제목과 내용만 새로 입력을 받아서 저장한다.

        // 입력시 출력할 메시지를 저장할 변수
        String message;

        // 제목을 입력 받는다.
        message = "새로운 제목을 입력해주세요.";
        titleArray[index] = ScannerUtil.nextLine(scanner, message);

        // 내용을 입력 받는다.
        message = "새로운 내용을 입력해주세요.";
        contentArray[index] = ScannerUtil.nextLine(scanner, message);

        // 수정 후 해당 인덱스의 개별 글 보기를 실행해서
        // 수정 결과를 볼 수 있게 메소드를 호출한다.
        printOne(index);
    }

    public static void delete(int index) {
        // 사용자로부터 정말로 삭제할지를 입력받아서
        // 삭제를 원하면 각 배열에서 해당 인덱스를 삭제하고
        // 목록 보기로 이동
        // 그 외에는 다시 개별 글 보기로 이동

        // 입력시 출력할 메시지를 저장할 변수
        String message;

        // 삭제 동의 여부를 입력받는다.
        message = "정말로 삭제하시겠습니까? 1: 예 2: 아니오";
        int userChoice = ScannerUtil.nextInt(scanner, message, 1, 2);

        if (userChoice == 1) {
            // 사용자가 정말로 삭제를 원하므로
            // 각 배열에서 해당 인덱스 삭제
            idArray = ArrayUtil.remove(idArray, index);
            titleArray = ArrayUtil.remove(titleArray, index);
            writerArray = ArrayUtil.remove(writerArray, index);
            contentArray = ArrayUtil.remove(contentArray, index);

            // 글 목록보기로 이동한다.
            printAll();
        } else {
            // 해당 글 개별보기로 이동한다.
            printOne(index);
        }
    }
}
